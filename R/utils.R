#' Create a panel of countries belonging in the state system.
#'
#' @param system The state system to target. The possibilities are "cow"
#'   ([Correlates of War](http://www.correlatesofwar.org/data-sets/state-system-membership), the
#'   default), "GW" (Gleditsch and Ward, from Gleditsch, Kristian S. & Michael
#'   D. Ward. 1999. "Interstate System Membership: A Revised List of the
#'   Independent States since 1816." International Interactions 25: 393-413,
#'   available at [http://privatewww.essex.ac.uk/~ksg/statelist.html](http://privatewww.essex.ac.uk/~ksg/statelist.html)), or
#'   "polity" (for the [Polity IV](http://www.systemicpeace.org/polityproject.html) system of states).
#' @param max_year The maximum year in the panel. If NULL, uses the current year.
#'
#' @return A [tibble] with the country code in the relevant system of states,
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
create_panel <- function(system = c("cow", "GW", "polity"),
                         max_year = NULL) {

  system <- match.arg(system)

  if(is.null(max_year)) {
    max_year <- lubridate::year(Sys.Date())
  }

  country.name.en <- year <- NULL

  code <- parse_expr(ifelse(system != "polity", paste0(system, "n"), "polity_ccode"))

  membership <- parse_expr(paste(system, "membership", sep = "_"))

  startdate <- parse_expr(paste(system, "startdate", sep = "_"))

  enddate <- parse_expr(paste(system, "enddate", sep = "_"))

  country_name <- parse_expr(paste(system, "country_name", sep = "_"))

  panel <-  data %>%
    filter(!is.na(UQ(code)), UQ(membership)) %>%
    select(!!code, !!country_name,
           !!startdate,
           !!enddate) %>%
    distinct() %>%
    group_by(!!code, !!country_name,
             !!startdate, !!enddate) %>%
    mutate(year = list(lubridate::year(UQ(startdate)):ifelse(is.na(lubridate::year(UQ(enddate))),
                                                             max_year,
                                                             lubridate::year(UQ(enddate))))) %>%
    tidyr::unnest(cols = c(year)) %>%
    ungroup() %>%
    mutate(year = as.numeric(year))

  panel %>%
    filter(year <= max_year)

}

download_and_read_xls <- function(url, fileext, ...) {
  tmpfile <- tempfile(fileext = fileext)
  utils::download.file(url, tmpfile, mode = "wb")

  if("na" %in% names(rlang::dots_list(...))) {
    data  <- readxl::read_excel(tmpfile, .name_repair = "unique_quiet", ...) %>%
      distinct()
  } else {
    data  <- readxl::read_excel(tmpfile, na = c("-", ""), .name_repair = "unique_quiet", ...) %>%
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
#' polityIV %>%
#' group_by(polityIV_country, polityIV_ccode) %>%
#' mutate(groups = count_sequence_breaks(year)) %>%
#' filter(any(groups > 1))
#'
count_sequence_breaks <- function(seq, seq_step = 1) {
  first_diff <- c(seq_step, diff(seq)) - seq_step
  periods <- as.numeric(as.factor(cumsum(abs(first_diff))))
  periods
}

read_data <- function(path,
                      file_extension = c("guess", "zip", "dta", "xls", "xlsx", "sav", "txt", "tsv", "csv", "delim"),
                      verbose = TRUE,
                      name = NULL,
                      ...) {


  file_extension <- match.arg(file_extension)

  if(file_extension == "guess") {
    file_extension <- guess_file_extension(path)
  }

  if(verbose & is.null(name)) {
    name <- ""
  }

  is_url <- FALSE

  if(verbose & grepl("^http|ftp", path)) {
    message(sprintf("Downloading %s data...", name))
    message(sprintf("Trying %s ...", path))
    is_url <- TRUE
  } else if(grepl("^http|ftp", path)) {
    is_url <- TRUE
  }

  if(file_extension %in% c("xls", "xlsx") &
     is_url) {
    data <- download_and_read_xls(path, paste0(".", file_extension), ...)
  } else if(file_extension == "zip" & is_url) {
    tmpfile <- tempfile()
    utils::download.file(path, tmpfile, quiet = !verbose)
    tmpdir <- tempdir()
    files <- unzip(tmpfile, exdir = tmpdir)

    if(verbose) {
      message("The files in the archive are:")
      print(files)
    }

    extracted_filename <- files[grepl(name, files)]

    if(verbose) {
      message(sprintf("Extracting %s", extracted_filename))
    }

    extracted_file_extension <- guess_file_extension(extracted_filename)

    data <- read_by_file_extension(extracted_filename, extracted_file_extension, ...)

    unlink(tmpfile)
    unlink(tmpdir)


  } else {
    data <- read_by_file_extension(path, file_extension, ...)
  }

  if(verbose) {
    message(sprintf("The downloaded %s dataset has %d rows",
                    name,
                    nrow(data)))
  }

  data


}

guess_file_extension <- function(filename) {
  file_extension <- stringr::str_extract(filename, "(\\.[a-z]{3,4})?\\.[a-z]{2,4}$") %>%
    stringr::str_replace_all("^\\.", "")

  if(!file_extension %in% c("zip", "dta", "xls",
                            "xlsx", "sav", "txt",
                            "tsv", "csv")) {
    stop("Unable to guess file extension type. Aborting. Try specifying an explicit file extension.")
  }

  file_extension
}

read_by_file_extension <- function(filename, file_extension, ...) {
  if(file_extension == "sav") {
    data <- haven::read_sav(filename, .name_repair = "unique_quiet", ...)
  }

  if(file_extension %in% c("xls", "xlsx")) {
    data <- readxl::read_excel(filename, .name_repair = "unique_quiet", ...)
  }

  if(file_extension == "dta") {
    data <- haven::read_stata(filename, .name_repair = "unique_quiet", ...)
  }

  if(file_extension == "csv") {
    data <- readr::read_csv(filename, name_repair = "unique_quiet", ...)
  }

  if(file_extension %in% c("tsv", "txt")) {
    data <- readr::read_tsv(filename, .name_repair = "unique_quiet", ...)
  }

  data

}

standardize_columns <- function(data,
                                country_col,
                                code_col,
                                verbose = TRUE) {

  year <- NULL

  data_name <- quo_name(enquo(data))
  country_col <- enquo(country_col)

  old_country_col <- quo_name(country_col)
  new_country_col <- paste(data_name, "country", sep ="_")

  if(verbose) {
    message(sprintf("Changing the name of the original country column from %s to %s...",
                    old_country_col, new_country_col))
    message("Ensuring year column is numeric...")
  }

  data <- data %>%
    mutate(year = as.numeric(year)) %>%
    rename(!!new_country_col := !!country_col)

  if(!missing(code_col)) {
    code_col <- enquo(code_col)
    old_code_col <- quo_name(code_col)
    new_code_col <- paste(data_name, old_code_col, sep ="_")
    if(verbose) {
      message(sprintf("Changing the name of the original code column from %s to %s...",
                      old_code_col, new_code_col))
    }
    data <- data %>%
      rename(!!new_code_col := !!code_col)
  }


  data

}

#' Retrieve the citation for a specific dataset included in this package
#'
#' This is a convenient wrapper for \code{print(bibliography)}, searching by \code{key = dataset_name}, with \code{BibOptions(use.regex = TRUE)}. You can also search and
#' manipulate the \code{\link{bibliography}} object directly using the
#' \code{\link{RefManageR}} package functions.
#'
#' @param dataset_name The name of the dataset to cite.
#' @param to_bibtex Whether to provide bibtex/biblatex markup.
#'
#' @return Prints the citation information. Returns the [BibEntry] object.
#' @export
#' @import RefManageR
#'
#' @examples
#' cite_dataset("gwf")
#' cite_dataset("pmm")
#' cite_dataset("uds") # Same output as the previous one
cite_dataset <- function(dataset_name, to_bibtex = FALSE) {
  BibOptions(use.regex = TRUE)

  if(to_bibtex) {
    toBiblatex(democracyData::bibliography[key = dataset_name])
  } else {
    democracyData::bibliography[key = dataset_name]
  }


}


#' @import knitr
knit_print.tbl = function(x, ...) {
  res = paste(c("", "", kable(x)), collapse = "\n")
  asis_output(res)
}

# External objects imported into package ----------------------------------

`%within%` <- lubridate::`%within%`

