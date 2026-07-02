#' Create a panel of countries belonging in the state system.
#'
#' @param system The state system to target. The possibilities are "cow"
#'   (<https://correlatesofwar.org/data-sets/state-system-membership/>, the
#'   default), "GW" (Gleditsch and Ward, from Gleditsch, Kristian S. & Michael
#'   D. Ward. 1999. "Interstate System Membership: A Revised List of the
#'   Independent States since 1816." International Interactions 25: 393-413,
#'   available via the Wayback Machine at
#'   <https://web.archive.org/web/20130627160240/http://privatewww.essex.ac.uk/~ksg/statelist.html>),
#'   or "polity" (for the <https://www.systemicpeace.org/polityproject.html>
#'   system of states).
#' @param max_year The maximum year in the panel. If NULL, uses the current year.
#'
#' @return A [tibble::tibble()] with the country code in the relevant system of states,
#'   the official country name and years when the country belongs to the system,
#'   and the relevant start and end dates for entry and exit into the system.
#'
#' @importFrom rlang UQ
#' @import dplyr
#' @export
#'
#' @examples
#' create_panel("cow") # The correlates of War system is the default
#' create_panel("GW") # Use this for the Gleditsch and Ward system
#' create_panel("polity", max_year = 1997) # You can specify a maximum year
create_panel <- function(system = c("cow", "GW", "polity"), max_year = NULL) {
  system <- match.arg(system)

  if (is.null(max_year)) {
    max_year <- lubridate::year(Sys.Date())
  }

  code <- parse_expr(ifelse(
    system != "polity",
    paste0(system, "n"),
    "polity_ccode"
  ))

  membership <- parse_expr(paste(system, "membership", sep = "_"))

  startdate <- parse_expr(paste(system, "startdate", sep = "_"))

  enddate <- parse_expr(paste(system, "enddate", sep = "_"))

  country_name <- parse_expr(paste(system, "country_name", sep = "_"))

  panel <- data |>
    filter(!is.na(UQ(code)), UQ(membership)) |>
    select(!!code, !!country_name, !!startdate, !!enddate) |>
    distinct() |>
    group_by(!!code, !!country_name, !!startdate, !!enddate) |>
    mutate(
      year = list(
        lubridate::year(UQ(startdate)):ifelse(
          is.na(lubridate::year(UQ(enddate))),
          max_year,
          lubridate::year(UQ(enddate))
        )
      )
    ) |>
    tidyr::unnest(cols = c(year)) |>
    ungroup() |>
    mutate(year = as.numeric(year))

  panel |>
    filter(year <= max_year)
}

download_and_read_xls <- function(url, fileext, verbose = verbose, ...) {
  tmpfile <- tempfile(fileext = fileext)
  utils::download.file(url, tmpfile, mode = "wb", quiet = !verbose)

  if ("na" %in% names(rlang::dots_list(...))) {
    data <- readxl::read_excel(
      tmpfile,
      .name_repair = "unique_quiet",
      progress = verbose,
      ...
    ) |>
      distinct()
  } else {
    data <- readxl::read_excel(
      tmpfile,
      na = c("-", ""),
      .name_repair = "unique_quiet",
      progress = verbose,
      ...
    ) |>
      distinct()
  }

  unlink(tmpfile)

  data
}

#' Count sequence breaks
#'
#' This is a utility function that is useful when plotting countries that have
#' interrupted periods.
#'
#' @param seq A numeric sequence
#' @param seq_step The expected difference between steps in sequence
#'
#' @return A numeric vector with the sequence groups
#' @export
#'
#' @examples
#' library(dplyr)
#' count_sequence_breaks(c(1900:1910, 1920:1930))
#'
#' # This is how I typically use it
#'
#' polityIV |>
#' group_by(polityIV_country, polityIV_ccode) |>
#' mutate(groups = count_sequence_breaks(year)) |>
#' filter(any(groups > 1))
#'
count_sequence_breaks <- function(seq, seq_step = 1) {
  first_diff <- c(seq_step, diff(seq)) - seq_step
  periods <- as.numeric(as.factor(cumsum(abs(first_diff))))
  periods
}

read_data <- function(
  path,
  file_extension = c(
    "guess",
    "zip",
    "dta",
    "xls",
    "xlsx",
    "sav",
    "txt",
    "tsv",
    "csv",
    "delim"
  ),
  verbose = TRUE,
  name = NULL,
  ...
) {
  file_extension <- match.arg(file_extension)

  if (file_extension == "guess") {
    file_extension <- guess_file_extension(path)
  }

  if (verbose & is.null(name)) {
    name <- ""
  }

  is_url <- FALSE

  if (verbose & grepl("^http|ftp", path)) {
    message(sprintf("Downloading %s data...", name))
    message(sprintf("Trying %s ...", path))
    is_url <- TRUE
  } else if (grepl("^http|ftp", path)) {
    is_url <- TRUE
  }

  if (file_extension %in% c("xls", "xlsx") & is_url) {
    data <- download_and_read_xls(
      path,
      paste0(".", file_extension),
      verbose = verbose,
      ...
    )
  } else if (file_extension == "zip" & is_url) {
    tmpfile <- tempfile()
    utils::download.file(path, tmpfile, quiet = !verbose)
    tmpdir <- tempdir()
    files <- unzip(tmpfile, exdir = tmpdir)

    if (verbose) {
      message("The files in the archive are:")
      print(files)
    }

    extracted_filename <- files[grepl(name, files)]

    if (verbose) {
      message(sprintf("Extracting %s", extracted_filename))
    }

    extracted_file_extension <- guess_file_extension(extracted_filename)

    data <- read_by_file_extension(
      extracted_filename,
      extracted_file_extension,
      verbose = verbose,
      ...
    )

    unlink(tmpfile)
    unlink(tmpdir)
  } else {
    data <- read_by_file_extension(path, file_extension, verbose = verbose, ...)
  }

  if (verbose) {
    message(sprintf("The downloaded %s dataset has %d rows", name, nrow(data)))
  }

  data
}

guess_file_extension <- function(filename) {
  file_extension <- stringr::str_extract(
    filename,
    "(\\.[a-z]{3,4})?\\.[a-z]{2,4}$"
  ) |>
    stringr::str_replace_all("^\\.", "")

  if (
    !file_extension %in%
      c("zip", "dta", "xls", "xlsx", "sav", "txt", "tsv", "csv")
  ) {
    stop(
      "Unable to guess file extension type. Aborting. Try specifying an explicit file extension."
    )
  }

  file_extension
}

read_by_file_extension <- function(filename, file_extension, verbose, ...) {
  if (file_extension == "sav") {
    data <- haven::read_sav(filename, .name_repair = "unique_quiet", ...)
  }

  if (file_extension %in% c("xls", "xlsx")) {
    data <- readxl::read_excel(
      filename,
      .name_repair = "unique_quiet",
      progress = verbose,
      ...
    )
  }

  if (file_extension == "dta") {
    data <- haven::read_stata(filename, .name_repair = "unique_quiet", ...)
  }

  if (file_extension == "csv") {
    data <- readr::read_csv(
      filename,
      name_repair = "unique_quiet",
      progress = verbose,
      ...
    )
  }

  if (file_extension %in% c("tsv", "txt")) {
    data <- readr::read_tsv(
      filename,
      .name_repair = "unique_quiet",
      progress = verbose,
      ...
    )
  }

  data
}

standardize_columns <- function(data, country_col, code_col, verbose = TRUE) {
  data_name <- quo_name(enquo(data))
  country_col <- enquo(country_col)

  old_country_col <- quo_name(country_col)
  new_country_col <- paste(data_name, "country", sep = "_")

  if (verbose) {
    message(sprintf(
      "Changing the name of the original country column from %s to %s...",
      old_country_col,
      new_country_col
    ))
    message("Ensuring year column is numeric...")
  }

  data <- data |>
    mutate(year = as.numeric(year)) |>
    rename(!!new_country_col := !!country_col)

  if (!missing(code_col)) {
    code_col <- enquo(code_col)
    old_code_col <- quo_name(code_col)
    new_code_col <- paste(data_name, old_code_col, sep = "_")
    if (verbose) {
      message(sprintf(
        "Changing the name of the original code column from %s to %s...",
        old_code_col,
        new_code_col
      ))
    }
    data <- data |>
      rename(!!new_code_col := !!code_col)
  }

  data
}

citation_key_aliases <- c(
  aclp = "pacl",
  aclp_update = "pacl_update",
  arat_pmm = "arat",
  bollen_pmm = "bollen",
  cgv = "pacl",
  cgv_update = "pacl_update",
  dd = "pacl",
  dd_update = "pacl_update",
  fh_electoral = "fh",
  fh_full = "fh",
  hadenius_pmm = "hadenius",
  munck_pmm = "munck",
  pitf_p4 = "pitf",
  polityIV = "polity",
  polity_annual = "polity",
  svolik_regime = "svolik",
  vaporeg = "vaporeg32",
  wgi_democracy = "wgi",
  wgi_legacy = "wgi"
)

resolve_citation_query <- function(dataset_name) {
  if (dataset_name %in% names(citation_key_aliases)) {
    citation_key_aliases[[dataset_name]]
  } else {
    dataset_name
  }
}

escape_roxygen_square_brackets <- function(citation) {
  stringr::str_replace_all(
    citation,
    regex("\\[([^\\]]+)\\](?!\\()", dotall = TRUE),
    "\\\\\\[\\1\\\\\\]"
  )
}

protect_roxygen_urls <- function(citation) {
  stringr::str_replace_all(
    citation,
    regex("<(https?://[^>]+)>"),
    "`\\1`"
  )
}

get_package_bibliography <- function() {
  package_namespace <- asNamespace("democracyData")

  if (exists("bibliography", envir = package_namespace, inherits = FALSE)) {
    return(get("bibliography", envir = package_namespace, inherits = FALSE))
  }

  bibliography_env <- new.env(parent = emptyenv())
  utils::data(
    "bibliography",
    package = "democracyData",
    envir = bibliography_env
  )

  if (!exists("bibliography", envir = bibliography_env, inherits = FALSE)) {
    stop("Package bibliography data is not available.")
  }

  get("bibliography", envir = bibliography_env, inherits = FALSE)
}

#' Retrieve the citation for a specific dataset included in this package
#'
#' This is a convenient wrapper for \code{print(bibliography)}, searching by
#' \code{key = dataset_name}, with \code{BibOptions(use.regex = TRUE)}. You can
#' also search and manipulate the \code{\link{bibliography}} object directly
#' using the [RefManageR::RefManageR] package functions.
#'
#' @param dataset_name The name of the dataset to cite.
#'
#' @param to_bibtex Whether to provide bibtex/biblatex markup.
#'
#' @return Prints the citation information. Returns the [RefManageR::BibEntry()] object.
#' @export
#'
#' @import RefManageR
#'
#' @examples
#'
#' cite_dataset("gwf")
#'
#' cite_dataset("pmm")
#'
#' cite_dataset("uds") # Same output as the previous one
cite_dataset <- function(dataset_name, to_bibtex = FALSE) {
  RefManageR::BibOptions(use.regex = TRUE)
  citation_query <- resolve_citation_query(dataset_name)
  bibliography_data <- get_package_bibliography()

  if (to_bibtex) {
    RefManageR::toBiblatex(bibliography_data[key = citation_query])
  } else {
    bibliography_data[key = citation_query]
  }
}

roxygen_cite <- function(dataset_name) {
  RefManageR::BibOptions(sorting = "nyt")
  citation <- stringr::str_remove(
    utils::capture.output(print(cite_dataset(dataset_name))),
    "^\\[.+?\\] "
  ) |>
    paste(collapse = " ")
  citation <- wrap_doi_md(citation)
  citation <- escape_roxygen_square_brackets(citation)
  citation
}

wrap_doi_md <- function(citation) {
  citation <- str_replace_all(
    citation,
    regex(
      "DOI: *(10\\.[0-9]{4,9}/[-._;()/:a-zA-Z0-9]+)(?=\\.$)",
      ignore_case = TRUE
    ),
    "DOI: [\\1](https://dx.doi.org/\\1)"
  )
  citation
}

roxygen_print_bibliography <- function(biblio_keys = "*") {
  RefManageR::BibOptions(sorting = "nyt")
  bibliography_data <- get_package_bibliography()
  RefManageR::NoCite(bibliography_data, biblio_keys)
  stringr::str_replace(
    utils::capture.output(RefManageR::PrintBibliography(
      bibliography_data
    )),
    "^\\[.+?\\] ",
    "\n\n"
  ) |>
    paste(collapse = "") |>
    escape_roxygen_square_brackets() |>
    protect_roxygen_urls()
}

find_url <- function(
  dataset,
  type = c("download", "documentation", "codebook")
) {
  dataset <- match.arg(dataset, unique(url_list$dataset_name))
  type <- match.arg(type)

  if (type == "codebook") {
    codebook_urls <- c(
      anckar = "https://dataverse.harvard.edu/api/access/datafile/11496290",
      bti = "https://bti-project.org/fileadmin/api/content/en/downloads/codebooks/BTI2026_Codebook.pdf",
      polityIV = "https://www.systemicpeace.org/inscr/p4manualv2018.pdf",
      polity_annual = "https://www.systemicpeace.org/inscr/p5manualv2018.pdf",
      vaporeg = "https://www.va-poreg.de/download/Kailitz%2C%20Varieties%20of%20Political%20Regimes%2C%20Codebook%203.2.pdf",
      wgi = "https://www.worldbank.org/content/dam/sites/govindicators/doc/va.pdf"
    )

    if (!dataset %in% names(codebook_urls)) {
      stop(
        "No codebook URL recorded for dataset `",
        dataset,
        "`.",
        call. = FALSE
      )
    }

    return(unname(codebook_urls[[dataset]]))
  }

  url_column <- if (type == "download") "download" else "documentation"

  url_list |>
    dplyr::filter(dataset_name == dataset) |>
    dplyr::pull(url_column)
}

knit_print.tbl <- function(x, ...) {
  rlang::check_installed("knitr")
  res <- paste(c("", "", knitr::kable(x)), collapse = "\n")
  knitr::asis_output(res)
}

# External objects imported into package ----------------------------------

`%within%` <- lubridate::`%within%`
