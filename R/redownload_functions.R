#'Download and process various democracy datasets.
#'
#'Download and process various democracy datasets. Note that the datasets
#'returned by the \code{redownload_*} family of functions (\link{blm},
#'\link{bmr}, \link{bti}, \link{gwf_autocratic}, \link{gwf_autocratic_extended},
#'\link{gwf_all}, \link{gwf_all_extended}, \link{LIED}, \link{magaloni},
#'\link{pacl}, \link{pacl_update}, \link{PIPE}, \link{peps}, [polityIV],
#'\link{polyarchy}, \link{polyarchy_dimensions}, \link{REIGN}, \link{uds_2014},
#'\link{uds_2010}, \link{uds_2011}, \link{ulfelder}, \link{utip},
#'\link{wahman_teorell_hadenius}, \link{anckar}, \link{svmdi}) are all available
#'directly from this package and are unlikely to have changed since the package
#'was installed. Access the respective dataset by typing its name, and refer to
#'their documentation for details. You will not normally need to redownload
#'them, unless you want to process the raw data yourself (set \code{return_raw =
#'TRUE}) or suspect they have changed since the package was installed.
#'
#'@param url The URL of the dataset. This defaults to:
#'
#'  \itemize{
#'
#'  \item For \link{anckar}: <`r find_url("anckar")`>.
#'
#'  \item For \link{blm}: <`r find_url("blm")`>.
#'
#'  \item For \link{bmr}: <`r find_url("bmr")`>.
#'
#'  \item For \link{bti}: <`r find_url("bti")`>.
#'
#'  \item For \link{gwf_all} and \link{gwf_autocratic}: <`r find_url("gwf")`>.
#'
#'  \item For \link{LIED}: <`r find_url("LIED")`>.
#'
#'  \item For \link{pacl}: <`r find_url("pacl")`>.
#'
#'  \item For \link{pacl_update}: <`r find_url("pacl_update")`>.
#'
#'  \item For \link{peps}: <`r find_url("peps")`>.
#'
#'  \item For \link{polityIV}: <`r find_url("polityIV")`>.
#'
#'  \item For \link{svmdi}: <`r find_url("svmdi2020")`> or <`r find_url("svmdi2016")`>,
#'  depending on `release_year` (2020 or 2016).
#'
#'  \item For \link{REIGN}: <`r find_url("REIGN")`>.
#'
#'  \item For \link{utip}: <`r find_url("utip")`>.
#'
#'  \item For \link{uds}: <`r find_url("uds2014")`>, <`r find_url("uds2011")`> or
#'  <`r find_url("uds2010")`>, depending on `release_year` (2014, 2011, or 2010).
#'
#'  \item For \link{vaporeg}: <`r find_url("vaporeg")`>.
#'
#'  \item For \link{wahman_teorell_hadenius}: <`r find_url("wahman_teorell_hadenius")`>.
#'
#'  \item For \link{polyarchy}: <`r find_url("polyarchy")`>.
#'
#'  \item For \link{polyarchy_dimensions}: <`r find_url("polyarchy_dimensions")`>.
#'
#'  \item For \link{magaloni}: <`r find_url("magaloni")`>.
#'
#'  \item For \link{ulfelder}: <`r find_url("ulfelder")`>.
#'
#'  \item For \link{PIPE}: <`r find_url("PIPE")`>.
#'
#'  }
#'
#'@param release_year (Only in \link{redownload_svmdi} and
#'  \link{redownload_uds}). The year of the release to be downloaded. For
#'  [svmdi], it can be 2016 or 2020.
#'
#'@param verbose Whether to print a running commentary of what the function is
#'  doing while processing the data.
#'@param return_raw Whether to return the raw data, with minimal processing.
#'  Default is \code{FALSE}.
#'@param extend (Only for \link{redownload_gwf}, \link{redownload_magaloni}, and
#'  \link{redownload_ulfelder}). Whether to extend the dataset back in time
#'  using the appropriate duration variable (\code{gwf_duration},
#'  \code{duration_nr}, or \code{rgjdura} and \code{rgjdurd}, respectively, for
#'  \link{redownload_gwf}, \link{redownload_magaloni}, and
#'  \link{redownload_ulfelder}). For example, the United States enters the GWF
#'  dataset in 1946, where \code{gwf_duration} is already 75; one can extend the
#'  dataset to indicate that the country was classified as a democracy from
#'  1872. Default is \code{FALSE}.
#'@param ... Other parameters passed to \link{country_year_coder}.
#'
#'@import dplyr
#'
#'@export
#'
#'@return A [tibble::tibble()] with the processed dataset, unless \code{return_raw}
#'  is \code{TRUE}, in which case the function returns the raw data without
#'  processing.
#'
#'@source `r roxygen_cite("blm")`. Data and documentation archived at
#'  <`r find_url("blm", "documentation")`>.
#'
#' @examples
#' \dontrun{
#' blm <- redownload_blm()
#' blm
#' }
redownload_blm <- function(url, verbose = TRUE, return_raw = FALSE, ...) {
  if (missing(url)) {
    url <- find_url("blm")
  }

  data <- read_data(url, verbose = verbose, name = "blm")

  if (return_raw) {
    if (verbose) {
      message("Returning raw data, without processing.")
    }
    return(data)
  }

  if (verbose) {
    message(sprintf(
      "Original dataset has %d rows, but is not in country-year format.",
      nrow(data)
    ))
    message(
      "Processing the BLM data - converting to country-year format and adding state system info..."
    )
  }

  names(data)[1] <- "year"

  blm <- data |>
    tidyr::gather(country, blm, `costa rica`:Nicaragua) |>
    mutate(country = ifelse(country == "costa rica", "Costa Rica", country)) |>
    country_year_coder(
      country,
      year,
      match_type = "country",
      verbose = verbose,
      ...
    )

  if (verbose) {
    message("costa rica changed to Costa Rica in country column...")
    message(sprintf(
      "Resulting dataset after processing has %d rows.",
      nrow(blm)
    ))
    if (nrow(data) != nrow(blm)) {
      message(
        "Note: the number of rows in the processed BLM data is different",
        " from the number of rows in the original data."
      )
      if (5 * nrow(data) != nrow(blm)) {
        warning(sprintf(
          "There should be %d rows in the final processed data. Something went wrong.",
          5 * nrow(data)
        ))
      } else {
        message(sprintf(
          "Nevertheless processing resulted in the correct final number of rows (%d)",
          5 * nrow(data)
        ))
      }
    }
  }

  standardize_columns(blm, country, verbose = verbose)
}

#' @rdname redownload_blm
#'
#' @source `r roxygen_cite("anckar")` Updated data (V3.0) available at
#'   <`r find_url("anckar", "documentation")`>. Codebook at
#'   <`r find_url("anckar", "codebook")`>.
#'
#'
#' @export
#' @examples
#' \dontrun{
#' redownload_anckar()
#' }
redownload_anckar <- function(url, verbose = TRUE, return_raw = FALSE, ...) {
  if (missing(url)) {
    url <- find_url("anckar")
  }

  data <- read_data(
    url,
    verbose = verbose,
    name = "Anckar and Fredriksson",
    file_extension = "xlsx"
  )

  if (return_raw) {
    if (verbose) {
      message("Returning raw data, without processing.")
    }
    return(data)
  }

  if (verbose) {
    message(
      "Fixing country names, adding state system information and regime category names"
    )
  }

  data <- data |>
    mutate(
      country = country |>
        str_replace_all('\\"', ""),
      abbreviation = abbreviation |>
        str_replace_all('\\"', ""),
      country = case_when(
        country == "EQUATORIA G" ~ "EQUATORIAL GUINEA",
        country == "GUNIEA- BISS" ~ "GUINEA-BISSAU",
        country == "CONGO" & ccode == 490 ~ "DEMOCRATIC REPUBLIC OF CONGO",
        TRUE ~ country
      )
    )

  anckar <- data |>
    country_year_coder(
      country,
      year,
      code_col = ccode,
      code_type = "cown",
      match_type = "country",
      verbose = verbose,
      ...
    )

  anckar <- anckar |>
    mutate(
      democracy = if_else(democracy == 99, NA_real_, democracy),
      regimebroadcat = case_when(
        regimebroadcat == 0 ~ "Parliamentarism",
        regimebroadcat == 1 ~ "Semi-presidentialism",
        regimebroadcat == 2 ~ "Presidentialism",
        regimebroadcat == 3 ~ "Semi-monarchy",
        regimebroadcat == 4 ~ "Party-based rule",
        regimebroadcat == 5 ~ "Personalist rule",
        regimebroadcat == 6 ~ "Military rule",
        regimebroadcat == 7 ~ "Absolute monarchy",
        regimebroadcat == 8 ~ "Oligarchy",
        TRUE ~ NA_character_
      ),
      regimebroadcat = as.factor(regimebroadcat),
      regimenarrowcat = case_when(
        regimenarrowcat == 0 ~ "Parliamentarism",
        regimenarrowcat == 1 ~ "Semi-presidentialism",
        regimenarrowcat == 2 ~ "Presidentialism",
        regimenarrowcat == 3 ~ "Semi-monarchy",
        regimenarrowcat == 4 ~ "Single-party rule",
        regimenarrowcat == 5 ~ "Multi-party authoritarian rule",
        regimenarrowcat == 6 ~ "Personalist rule",
        regimenarrowcat == 7 ~ "Military rule",
        regimenarrowcat == 8 ~ "Absolute monarchy",
        regimenarrowcat == 9 ~ "Monarchic oligarchy",
        regimenarrowcat == 10 ~ "Other oligarchy",
        TRUE ~ NA_character_
      ),
      regimenarrowcat = as.factor(regimenarrowcat),
      monarchy = case_when(monarchy > 7 ~ NA_real_, TRUE ~ monarchy)
    )

  if (verbose) {
    message(sprintf(
      "Resulting dataset after processing has %d rows.",
      nrow(anckar)
    ))
    if (nrow(data) != nrow(anckar)) {
      message(
        "Note: the number of rows in the processed Anckar and Fredriksson ",
        "data is different from the number of rows in the original data."
      )
    }
  }

  standardize_columns(anckar, "country", "ccode", verbose = verbose)
}

#' @rdname redownload_blm
#' @source `r roxygen_cite("bmr")` Available at <`r find_url("bmr", "documentation")`>.
#' @export
#' @examples
#' \dontrun{
#' bmr <- redownload_bmr()
#' bmr
#' }
redownload_bmr <- function(url, verbose = TRUE, return_raw = FALSE, ...) {
  if (missing(url)) {
    url <- find_url("bmr")
  }

  data <- read_data(
    url,
    verbose = verbose,
    name = "BMR",
    file_extension = "dta"
  )

  if (return_raw) {
    if (verbose) {
      message("Returning raw data, without processing.")
    }
    return(data)
  }

  if (verbose) {
    message(sprintf("Original dataset has %d rows.", nrow(data)))
    message(
      "Processing the BMR data - adding state system info, fixing bad ccode..."
    )
  }

  data <- data |>
    mutate(
      ccode = ifelse(ccode == 626, 525, ccode),
      sovereign = ifelse(is.na(democracy), 0, 1),
      abbreviation = ifelse(abbreviation == "NA", NA, abbreviation)
    )

  bmr <- country_year_coder(
    data,
    country,
    year,
    code_col = ccode,
    code_type = "polity_ccode",
    match_type = "country",
    verbose = verbose,
    ...
  )

  if (verbose) {
    message(sprintf(
      "Resulting dataset after processing has %d rows.",
      nrow(bmr)
    ))
    if (nrow(data) != nrow(bmr)) {
      message(
        "Note: the number of rows in the processed BMR data is different from the number of rows in the original data."
      )
      if (nrow(data) != nrow(bmr)) {
        warning(sprintf(
          "There should be %d rows in the final processed data. Something went wrong.",
          nrow(data)
        ))
      }
    }
  }

  bmr <- haven::zap_formats(bmr)
  bmr <- haven::zap_label(bmr)

  attr(bmr, "label") <- NULL

  standardize_columns(bmr, "country", "ccode", verbose = verbose)
}

#' @rdname redownload_blm
#' @param dataset (Only for \link{redownload_gwf}). The dataset to output. Geddes, Wright, and Frantz provide
#'   two country-year files, one with autocratic regimes only ("autocratic only"), and one with both
#'   democratic and non-democratic regimes ("all"). Default is "all".
#'
#' @export
#' @source `r roxygen_cite("gwf")` The full data and codebook can be
#' downloaded here: <`r find_url("gwf", "documentation")`>.
#'
#' @examples
#' \dontrun{
#' gwf <- redownload_gwf()
#' gwf
#' }
redownload_gwf <- function(
  url,
  verbose = TRUE,
  extend = FALSE,
  dataset = c("all", "autocratic only"),
  return_raw = FALSE,
  ...
) {
  dataset <- match.arg(dataset)

  if (missing(url)) {
    url <- find_url("gwf")
  }

  if (dataset == "autocratic only") {
    name <- "GWFtscs.dta"
  } else {
    name <- "GWF_AllPoliticalRegimes.dta"
  }

  data <- read_data(url, verbose = verbose, name = name)

  if (return_raw) {
    if (verbose) {
      message("Returning raw data, without processing.")
    }
    return(data)
  }

  if (verbose) {
    message(sprintf("Original dataset has %d rows", nrow(data)))
    message(
      "Processing the Autocratic Regimes dataset - adding state system info, fixing NA values..."
    )
  }

  if (extend) {
    if (verbose) {
      message("Extending the dataset...")
    }
    gwf_panel <- data |>
      select(
        gwf_casename,
        gwf_country,
        cowcode,
        year,
        gwf_spell,
        gwf_duration
      ) |>
      group_by(gwf_casename) |>
      mutate(
        min_year = ifelse(
          gwf_duration != 1,
          min(year) - min(gwf_duration) + 1,
          min(year)
        ),
        max_year = max(year)
      ) |>
      select(-year, -gwf_duration) |>
      group_by(pick(everything())) |>
      summarise(
        year = list(as.numeric(min(min_year):max(max_year))),
        .groups = "drop"
      ) |>
      tidyr::unnest(cols = c(year)) |>
      distinct() |>
      select(-min_year, -max_year)

    if (dataset != "all") {
      gwf <- gwf_panel |>
        left_join(data) |>
        group_by(gwf_casename, gwf_country, cowcode, gwf_spell) |>
        arrange(gwf_casename, year) |>
        tidyr::fill(gwf_country:gwf_monarch, .direction = "up") |>
        mutate(gwf_duration = as.numeric(seq_along(year))) |>
        ungroup() |>
        arrange(gwf_country, year)
    } else {
      gwf <- gwf_panel |>
        left_join(data) |>
        group_by(gwf_casename, gwf_country, cowcode, gwf_spell) |>
        arrange(gwf_casename, year) |>
        tidyr::fill(gwf_country:gwf_disagree, .direction = "up") |>
        mutate(gwf_duration = as.numeric(seq_along(year))) |>
        ungroup() |>
        arrange(gwf_country, year)
    }
  } else {
    gwf <- data
  }

  gwf <- gwf |>
    country_year_coder(
      gwf_country,
      year,
      # code_col = cowcode,
      # code_type = "cown",
      match_type = "country",
      verbose = verbose,
      ...
    ) |>
    mutate(across(where(is.character), \(x) {
      ifelse(x %in% c("NA", ""), as.character(NA), x)
    }))

  if (verbose) {
    message(sprintf(
      "Resulting dataset after processing has %d rows.",
      nrow(gwf)
    ))
    if (nrow(data) != nrow(gwf)) {
      message(
        "Note: the number of rows in the processed Autocratic Regimes Dataset is different from the number of rows in the original data."
      )
    }
  }

  standardize_columns(gwf, gwf_country, cowcode, verbose = verbose)
}

#' @source `r roxygen_cite("LIED")`. Original data and variable descriptions available at
#' <`r find_url("LIED", "documentation")`>. This is for version 6.9 (2026 update).
#'
#' @rdname redownload_blm
#' @export
#' @examples
#' \dontrun{
#' redownload_lied()
#' }
redownload_lied <- function(url, verbose = TRUE, return_raw = FALSE, ...) {
  if (missing(url)) {
    url <- find_url("LIED")
  }

  data <- read_data(
    url,
    verbose = verbose,
    name = "LIED",
    file_extension = "xlsx"
  ) |>
    suppressWarnings()

  # Fix Chile
  data <- data |>
    mutate(year = ifelse(is.na(year) & countryn == "Chile", 2023, year))

  if (return_raw) {
    if (verbose) {
      message("Returning raw data, without processing.")
    }
    return(data)
  }

  if (verbose) {
    message(
      "Changing column names, adding state system information, reconstructing index"
    )
  }

  data <- data |>
    rename(
      exselec = `executive_elections`,
      legselec = `legislative_elections`,
      opposition = `multi-party_legislative_elections`,
      competition = competitive_elections
    )

  lied <- data |>
    country_year_coder(
      countryn,
      year,
      code_col = cow,
      code_type = "cown",
      match_type = "country and code",
      verbose = verbose,
      ...
    )

  lied <- lied |>
    filter(
      !(countryn == "Palestine/British Mandate" &
        year <= 1919 &
        extended_country_name == "Palestine, State of"),
      !(countryn == "Serbia" &
        year <= 1829 &
        extended_country_name == "Yugoslavia"),
      !(countryn == "Vietnam" &
        year <= 1815 &
        extended_country_name == "Vietnam, Democratic Republic of")
    ) |>
    mutate(
      extended_country_name = case_when(
        extended_country_name == "Vietnam, Democratic Republic of" &
          year < 1945 ~ "Vietnam (Annam/Cochin China/Tonkin)",
        TRUE ~ extended_country_name
      ),
      cown = case_when(cow == 817 & year < 1945 ~ NA_real_, TRUE ~ cown),
      GWn = case_when(cow == 817 & year < 1945 ~ 815, TRUE ~ cown)
    )

  lied <- lied |>
    mutate(
      L0 = (legselec == 0 & exselec == 0) * 1,
      L1 = (legselec | exselec) * 2,
      L2 = (legselec & opposition) * 3,
      L3 = (legselec & exselec & opposition) * 4,
      L4 = (legselec & exselec & opposition & competition) * 5,
      L5 = (legselec &
        exselec &
        opposition &
        competition &
        (male_suffrage | female_suffrage)) *
        6,
      L6 = (legselec &
        exselec &
        opposition &
        competition &
        male_suffrage &
        female_suffrage) *
        7
    ) |>
    rowwise() |>
    mutate(
      lexical_index_original = lexical_index,
      lexical_index = max(L0, L1, L2, L3, L4, L5, L6) - 1
    ) |>
    select(-L0:-L6) |>
    ungroup()

  if (verbose) {
    message("Column `executive elections` has been renamed exselec")
    message("Column `legislative elections` has been renamed legselec")
    message(
      "Column `multi-party_legislative_elections` has been renamed opposition"
    )
    message("Column `competitive_elections` has been renamed competition")
    message(sprintf(
      "Resulting dataset after processing has %d rows.",
      nrow(lied)
    ))
    if (nrow(data) != nrow(lied)) {
      message(
        "Note: the number of rows in the processed LIED data is different from the number of rows in the original data."
      )
    }
  }

  standardize_columns(lied, countryn, cow, verbose = verbose)
}

#' @rdname redownload_blm
#'
#' @source The current dataset and documentation are available at
#'   <`r find_url("vaporeg", "documentation")`>.
#' @return By default, a tibble with the March 2026 VaPoReg country-year schema.
#'   If `return_raw = TRUE`, returns the full nested download object, including
#'   the `data` and `labels` elements from the upstream `.rds` file.
#'
#' @export
#' @examples
#' \dontrun{
#' redownload_vaporeg()
#' }
redownload_vaporeg <- function(url, verbose = TRUE, return_raw = FALSE, ...) {
  if (missing(url)) {
    url <- find_url("vaporeg")
  }

  vaporeg_download <- readr::read_rds(url)

  if (
    is.list(vaporeg_download) &&
      !is.data.frame(vaporeg_download) &&
      "data" %in% names(vaporeg_download)
  ) {
    vaporeg <- vaporeg_download$data
  } else {
    vaporeg <- vaporeg_download
  }

  if (return_raw) {
    if (verbose) {
      message(
        "Returning the full VaPoReg download bundle, including the labels metadata."
      )
    }
    return(vaporeg_download)
  }

  if (!is.data.frame(vaporeg)) {
    stop(
      "Unsupported VaPoReg download format. Expected a data frame or a list with a `data` element.",
      call. = FALSE
    )
  }

  if (verbose) {
    message("Returning VaPoReg data with the March 2026 upstream schema.")
  }

  vaporeg
}

#' @rdname redownload_blm
#'
#' @source `r roxygen_cite("pacl2010")` The full data and codebook can be
#'   downloaded here: <`r find_url("pacl", "documentation")`>.
#'
#' @export
#' @examples
#' \dontrun{
#' redownload_pacl()}
redownload_pacl <- function(url, verbose = TRUE, return_raw = FALSE, ...) {
  if (missing(url)) {
    url <- find_url("pacl")
  }

  data <- read_data(
    url,
    verbose = verbose,
    name = "PACL/ACLP",
    file_extension = "dta"
  )

  if (return_raw) {
    if (verbose) {
      message("Returning raw data, without processing.")
    }
    return(data)
  }

  if (verbose) {
    message(sprintf("Original dataset has %d rows", nrow(data)))
    message("Processing the PACL/ACLP data - adding state system info...")
  }

  pacl <- data |>
    country_year_coder(
      ctryname,
      year,
      code_col = cowcode,
      code_type = "cown",
      match_type = "country",
      verbose = verbose,
      ...
    )

  if (verbose) {
    message(sprintf(
      "Resulting dataset after processing has %d rows.",
      nrow(pacl)
    ))
    if (nrow(data) != nrow(pacl)) {
      message(
        "Note: the number of rows in the processed PACL data is different from the number of rows in the original data."
      )
    }
  }

  standardize_columns(pacl, ctryname, cowcode, verbose = verbose)
}

#' @rdname redownload_blm
#'
#' @source `r roxygen_cite("peps")` The complete dataset is available here: <`r find_url("peps", "documentation")`>.
#'
#' @export
#' @examples
#' \dontrun{
#' redownload_peps()
#' }
redownload_peps <- function(url, verbose = TRUE, return_raw = FALSE, ...) {
  if (missing(url)) {
    url <- find_url("peps")
  }

  data <- read_data(url, verbose = verbose, name = "PEPS")

  if (return_raw) {
    if (verbose) {
      message("Returning raw data, without processing.")
    }
    return(data)
  }

  if (verbose) {
    message(sprintf("Original dataset has %d rows", nrow(data)))
    message(
      "Processing the PEPS data - fixing country names, adding state system info..."
    )
    message(
      "New country column combines country names from Pname, Iname, and FHname to fill in blanks..."
    )
  }

  peps <- data |>
    mutate(
      country = ifelse(Pname == "", Iname, Pname),
      country = ifelse(country == "", FHname, country),
      country = case_when(
        country == "Cameron" ~ "Cameroon",
        country == "N. Korea" ~ "North Korea",
        TRUE ~ country
      )
    ) |>
    filter(Pname != "") |>
    country_year_coder(
      country,
      year,
      code_col = ccode,
      code_type = "polity_ccode",
      match_type = "country",
      verbose = verbose,
      ...
    )

  if (verbose) {
    message(sprintf(
      "Resulting dataset after processing has %d rows.",
      nrow(peps)
    ))
    if (nrow(data) != nrow(peps)) {
      message(
        "Note: the number of rows in the processed PEPS data is different from the number of rows in the original data."
      )
      message(
        "This is due to the exclusion of rows where Pname is blank and no data is available in other columns."
      )
      message("Dropping Pname, Iname, and FHname columns...")
    }
  }

  standardize_columns(peps, country, ccode, verbose = verbose) |>
    select(-Pname, -Iname, -FHname)
}

#' @rdname redownload_blm
#'
#' @source `r roxygen_cite("utip")` Data available for download at <`r find_url("utip", "documentation")`>.
#'
#' @export
#' @examples
#' \dontrun{
#' redownload_utip()
#' }
redownload_utip <- function(url, verbose = TRUE, return_raw = FALSE, ...) {
  if (missing(url)) {
    url <- find_url("utip")
  }

  data <- read_data(url, name = "UTIP", verbose = verbose)

  if (return_raw) {
    if (verbose) {
      message("Returning raw data, without processing.")
    }
    return(data)
  }

  utip <- data |>
    country_year_coder(
      cname,
      year,
      match_type = "country",
      verbose = verbose,
      ...
    ) |>
    filter(!is.na(DI)) |>
    rename(
      other_dictatorship = DI,
      military_dictatorship = MD,
      civil_war = W,
      one_party_democracy = OD,
      communist = C,
      islamic_republic = IR,
      social_democracy = SD,
      european_colony = EC,
      conservative_democracy = CO
    ) |>
    mutate(
      utip_dichotomous = as.numeric(
        one_party_democracy == 1 |
          social_democracy == 1 |
          conservative_democracy == 1
      ),
      utip_dichotomous_strict = as.numeric(
        social_democracy == 1 | conservative_democracy == 1
      ),
      utip_trichotomous = ifelse(
        social_democracy == 1 | conservative_democracy == 1,
        2,
        ifelse(one_party_democracy == 1, 1, 0)
      )
    )

  if (verbose) {
    message("Column DI has been renamed other_dictatorship")
    message("Column MD has been renamed military_dictatorship")
    message("Column W has been renamed civil_war")
    message("Column OD has been renamed one_party_democracy")
    message("Column C has been renamed communist")
    message("Column IR has been renamed islamic_republic")
    message("Column SD has been renamed social_democracy")
    message("Column CO has been renamed conservative_democracy")
    message(
      "Columns utip_dichotomous, utip_dichotomous_strict, and utip_trichotomous have been created"
    )
    message(sprintf(
      "Resulting dataset after processing has %d rows.",
      nrow(utip)
    ))
    if (nrow(data) != nrow(utip)) {
      message(
        "Note: the number of rows in the processed UTIP data is different from the number of rows in the original data."
      )
      message(
        "This is due to the exclusion of rows where DI was na and other columns contain no data."
      )
    }
  }

  standardize_columns(utip, cname, verbose = verbose)
}

#' @rdname redownload_blm
#'
#' @source `r roxygen_cite("wahman_teorell_hadenius2013")` The dataset and codebook can be
#'   downloaded from <`r find_url("wahman_teorell_hadenius", "documentation")`>.
#'
#' @export
#' @examples
#' \dontrun{
#' redownload_wahman_teorell_hadenius()
#' }
redownload_wahman_teorell_hadenius <- function(
  url,
  verbose = TRUE,
  return_raw = FALSE,
  ...
) {
  if (missing(url)) {
    url <- find_url("wahman_teorell_hadenius")
  }

  data <- read_data(
    url,
    name = "Wahman, Teorell, and Hadenius",
    verbose = verbose,
    file_extension = "dta"
  )

  if (return_raw) {
    if (verbose) {
      message("Returning raw data, without processing.")
    }
    return(data)
  }

  wahman_teorell_hadenius <- data |>
    country_year_coder(
      country,
      year,
      # cowcode,
      match_type = "country",
      verbose = verbose,
      ...
    )

  if (verbose) {
    message(sprintf(
      "Resulting dataset after processing has %d rows.",
      nrow(wahman_teorell_hadenius)
    ))
    if (nrow(data) != nrow(wahman_teorell_hadenius)) {
      message(
        "Note: the number of rows in the processed WTH data is different from the number of rows in the original data."
      )
    }
  }

  standardize_columns(
    wahman_teorell_hadenius,
    country,
    cowcode,
    verbose = verbose
  )
}

#' @rdname redownload_blm
#'
#' @source `r roxygen_cite("polyarchy1990")` Data available at <`r find_url("polyarchy", "documentation")`>.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' redownload_polyarchy_original()
#' }
redownload_polyarchy_original <- function(
  url,
  verbose = TRUE,
  return_raw = FALSE,
  ...
) {
  if (missing(url)) {
    url <- find_url("polyarchy")
  }

  data <- read_data(
    url,
    name = "Polyarchy original",
    verbose = verbose,
    file_extension = "sav"
  )

  if (return_raw) {
    if (verbose) {
      message("Returning raw data, without processing.")
    }
    return(data)
  }

  if (verbose) {
    message(
      "Putting the dataset in country-year format and adding state system information."
    )
  }

  polyarchy <- data |>
    tidyr::gather(variable, value, suff85:cont2000) |>
    suppressWarnings() |>
    mutate(
      year = stringr::str_extract(variable, "[0-9]+"),
      year = case_when(
        year == "85" ~ 1985,
        year == "00" ~ 2000,
        TRUE ~ as.numeric(year)
      ),
      variable = stringr::str_replace_all(variable, "[0-9]+", ""),
      Country = case_when(
        Country == "DomRep" ~ "Dominican Republic",
        Country == "Korea, N" ~ "North Korea",
        Country == "Korea, S" ~ "South Korea",
        Country == "Yemen, N" ~ "North Yemen",
        Country == "Yemen, S" ~ "South Yemen",
        TRUE ~ Country
      )
    ) |>
    filter(!is.na(value)) |>
    tidyr::spread(variable, value) |>
    country_year_coder(
      Country,
      year,
      match_type = "country",
      verbose = verbose,
      ...
    )

  if (verbose) {
    message(sprintf(
      "Resulting dataset after processing has %d rows.",
      nrow(polyarchy)
    ))
    if (nrow(data) != nrow(polyarchy)) {
      message(
        "Note: the number of rows in the processed Polyarchy data is different from the number of rows in the original data."
      )
      message("This is due to putting the dataset in country-year format.")
    }
  }

  standardize_columns(polyarchy, Country, verbose = verbose) |>
    arrange(code, year)
}

#' @rdname redownload_blm
#'
#' @source `r roxygen_cite("polyarchy_dimensions")` Data available at <`r find_url("polyarchy_dimensions", "documentation")`>.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' redownload_polyarchy_dimensions()
#' }
redownload_polyarchy_dimensions <- function(
  url,
  verbose = TRUE,
  return_raw = FALSE,
  ...
) {
  if (missing(url)) {
    url <- find_url("polyarchy_dimensions")
  }

  data <- read_data(url, name = "Polyarchy dimensions", verbose = verbose)

  if (return_raw) {
    if (verbose) {
      message("Returning raw data, without processing.")
    }
    return(data)
  }

  polyarchy_dimensions <- data |>
    country_year_coder(
      cname,
      year,
      # ccodecow,
      # code_type = "cown",
      verbose = verbose,
      ...
    )

  if (verbose) {
    message(sprintf(
      "Resulting dataset after processing has %d rows.",
      nrow(polyarchy_dimensions)
    ))
    if (nrow(data) != nrow(polyarchy_dimensions)) {
      message(
        "Note: the number of rows in the processed Polyarchy Dimensions Dataset is different from the number of rows in the original data."
      )
    }
  }

  standardize_columns(polyarchy_dimensions, cname, ccodecow, verbose = verbose)
}

#' @rdname redownload_blm
#'
#' @source `r roxygen_cite("magaloni")` Original data and codebook used to be
#'   available at <`r find_url("magaloni", "documentation")`>.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' redownload_magaloni()
#' }
redownload_magaloni <- function(
  url,
  verbose = TRUE,
  extend = FALSE,
  return_raw = FALSE,
  ...
) {
  if (missing(url)) {
    url <- find_url("magaloni")
  }

  data <- read_data(
    url,
    name = "Magaloni, Chu, and Min",
    verbose = verbose,
    na = c("", "NA", ".")
  ) |>
    mutate(across(c(demo_r, duration_r:lindex), as.numeric))

  if (return_raw) {
    if (verbose) {
      message("Returning raw data, without processing.")
    }
    return(data)
  }

  if (extend) {
    if (verbose) {
      message("Extending the dataset using the duration_nr variable")
    }

    magaloni_panel <- data |>
      filter(!is.na(reg_id)) |>
      select(country, year, ccode, demo_nr, regime_nr, duration_nr, reg_id) |>
      group_by(country, ccode, reg_id) |>
      mutate(
        min_year = ifelse(
          min(year) > 1950,
          min(year),
          min(year, min(max(year) - duration_nr + 1))
        ),
        max_year = max(year)
      ) |>
      select(-year, -duration_nr) |>
      group_by(pick(everything())) |>
      summarise(
        year = list(as.numeric(min(min_year):max(max_year))),
        .groups = "drop"
      ) |>
      tidyr::unnest(cols = c(year)) |>
      distinct() |>
      arrange(country, year) |>
      select(-min_year, -max_year)
  } else {
    magaloni_panel <- data
  }

  magaloni <- magaloni_panel |>
    country_year_coder(
      country,
      year,
      # ccode,
      # code_type = "polity_ccode",
      match_type = "country",
      verbose = verbose,
      ...
    )

  if (verbose) {
    message(sprintf(
      "Resulting dataset after processing has %d rows.",
      nrow(magaloni)
    ))
    if (nrow(data) != nrow(magaloni)) {
      message(
        "Note: the number of rows in the processed Magaloni, Min, and Chu Dataset is different from the number of rows in the original data."
      )
    }
  }

  standardize_columns(magaloni, country, ccode, verbose = verbose)
}

#' @rdname redownload_blm
#'
#' @source `r roxygen_cite("svmdi2018")` Original data available at <`r find_url("svmdi2020", "documentation")`>.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' redownload_svmdi(release_year = 2016)
#' redownload_svmdi() # For release year 2020
#'
#' }
redownload_svmdi <- function(
  url,
  release_year = 2020,
  verbose = TRUE,
  return_raw = FALSE,
  ...
) {
  if (!release_year %in% c(2018, 2016)) {
    release_year <- 2020
    if (verbose) {
      message("release_year can only be 2020 or 2016. Defaulting to 2020.")
    }
  }

  if (release_year == 2020 & missing(url)) {
    url <- find_url("svmdi2020")
  } else if (release_year == 2016 & missing(url)) {
    url <- find_url("svmdi2016")
  }

  if (release_year == 2020) {
    data <- read_data(
      url,
      verbose = verbose,
      name = "svmdi",
      file_extension = "xlsx"
    )

    names(data) <- c("id", "country", "iso", "year", "csvmdi", "dsvmdi")
  } else if (release_year == 2016) {
    data <- read_data(
      url,
      verbose = verbose,
      name = "svmdi",
      file_extension = "dta"
    )
  }

  data <- data |>
    mutate(
      country = if_else(
        country == "Congo_Democratic Republic of",
        "Democratic Republic of Congo",
        country
      )
    )

  if (return_raw) {
    if (verbose) {
      message("Returning raw data, without processing.")
    }
    return(data)
  }

  svmdi <- data |>
    country_year_coder(
      country,
      year,
      # cowcode,
      # code_type = "cown",
      match_type = "country",
      verbose = verbose,
      ...
    )

  if (verbose) {
    message(sprintf(
      "Resulting dataset after processing has %d rows.",
      nrow(svmdi)
    ))
    if (nrow(data) != nrow(svmdi)) {
      message(
        "Note: the number of rows in the processed SVMDI Dataset is different from the number of rows in the original data."
      )
    }
  }

  svmdi <- svmdi |>
    select(-starts_with("id"), -starts_with("cid"), -starts_with("instrument"))

  standardize_columns(svmdi, country, iso, verbose = verbose)
}

#' @rdname redownload_blm
#'
#' @source `r roxygen_cite("pmm2010")` Original data and codebook archived at
#'   <`r find_url("uds2014", "documentation")`>.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' redownload_uds()
#' redownload_uds(2011)
#' }
redownload_uds <- function(
  url,
  release_year = 2014,
  verbose = TRUE,
  return_raw = FALSE,
  ...
) {
  if (!release_year %in% c(2014, 2011, 2010)) {
    release_year <- 2014
    message("release_year can only be 2014, 2011, or 2010. Defaulting to 2014.")
  }

  if (missing(url)) {
    url <- ifelse(
      release_year == 2014,
      find_url("uds2014"),
      ifelse(release_year == 2011, find_url("uds2011"), find_url("uds2010"))
    )
  }

  data <- read_data(
    url,
    verbose = verbose,
    name = "UDS",
    file_extension = "csv",
    show_col_types = verbose
  )

  if (return_raw) {
    if (verbose) {
      message("Returning raw data, without processing.")
    }
    return(data)
  }

  uds <- data |>
    country_year_coder(
      country,
      year,
      # cowcode,
      # code_type = "cown",
      match_type = "country",
      verbose = verbose,
      ...
    )

  if (verbose) {
    message(sprintf(
      "Resulting dataset after processing has %d rows.",
      nrow(uds)
    ))
    if (nrow(data) != nrow(uds)) {
      message(
        "Note: the number of rows in the processed UDS Dataset is different from the number of rows in the original data."
      )
    }
  }

  standardize_columns(uds, country, cowcode, verbose = verbose)
}

#' @rdname redownload_blm
#'
#' @source `r roxygen_cite("ulfelder2012")` Original data available at <`r find_url("ulfelder", "documentation")`>.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' redownload_ulfelder()
#' }
redownload_ulfelder <- function(
  url,
  verbose = TRUE,
  return_raw = FALSE,
  extend = FALSE,
  ...
) {
  if (missing(url)) {
    url <- find_url("ulfelder")
  }

  data <- read_data(
    url,
    verbose = verbose,
    file_extension = "csv",
    show_col_types = verbose
  )

  if (return_raw) {
    if (verbose) {
      message("Returning raw data, without processing.")
    }
    return(data)
  }

  data <- data |>
    mutate(
      ulfelder_scode = case_when(
        pitfcode == "GER" ~ "GMY",
        pitfcode == "MNE" ~ "MNT",
        pitfcode == "SRB" ~ "SER",
        pitfcode == "UK" ~ "UKG",
        pitfcode == "USS" ~ "USR",
        TRUE ~ pitfcode
      )
    ) |>
    filter(!is.na(rgjtype))

  if (verbose) {
    message(
      "Column ulfelder_scodes has been created by changing pitfcodes ",
      "GER, MNE, SRB, UK, USS to polity character codes ",
      "GMY, MNT, SER, UKG, USR"
    )
    message("Excluding all rows where rgjtype is NA")
  }

  if (extend) {
    if (verbose) {
      message("Extending the data back in time using the duration variable")
    }

    ulfelder_panel <- data |>
      select(ulfelder_scode, year, rgjtype, rgjdurd, rgjdura) |>
      group_by(ulfelder_scode) |>
      filter(year == min(year), year <= 1956) |>
      mutate(
        duration = ifelse(
          is.na(rgjdurd),
          rgjdura,
          ifelse(is.na(rgjdura), rgjdurd, max(rgjdura, rgjdurd))
        ),
        prev_regime = ifelse(
          is.na(rgjdurd),
          "A",
          ifelse(is.na(rgjdura), "D", ifelse(rgjdura > rgjdurd, "A", "D"))
        ),
        year = list(year:(year - duration + 1))
      ) |>
      unnest(cols = c(year)) |>
      filter(year != max(year)) |>
      arrange(ulfelder_scode, year) |>
      mutate(
        rgjtype = prev_regime,
        rgjdurd = ifelse(rgjtype == "D", seq_along(ulfelder_scode), NA),
        rgjdura = ifelse(rgjtype == "A", seq_along(ulfelder_scode), NA)
      ) |>
      select(-duration, -prev_regime)

    data <- bind_rows(ulfelder_panel, data) |>
      arrange(ulfelder_scode, year) |>
      ungroup()
  }

  ulfelder <- data |>
    country_year_coder(
      date_col = year,
      code_col = ulfelder_scode,
      code_type = "polity_scode",
      match_type = "code",
      verbose = verbose,
      ...
    ) |>
    mutate(year = as.numeric(year))

  if (verbose) {
    message(sprintf(
      "Resulting dataset after processing has %d rows.",
      nrow(ulfelder)
    ))
    if (nrow(data) != nrow(ulfelder)) {
      message(
        "Note: the number of rows in the processed Ulfelder Dataset is different from the number of rows in the original data."
      )
    }
  }

  ulfelder
}

#' @rdname redownload_blm
#'
#' @source `r roxygen_cite("PIPE")` Original data available at <`r find_url("PIPE", "documentation")`>.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' redownload_pipe()
#' }
redownload_pipe <- function(url, verbose = TRUE, return_raw = FALSE, ...) {
  if (missing(url)) {
    url <- find_url("PIPE")
  }

  data <- read_data(
    url,
    file_extension = "dta",
    name = "PIPE",
    verbose = verbose
  )

  if (return_raw) {
    if (verbose) {
      message("Returning raw data, without processing.")
    }
    return(data)
  }

  if (verbose) {
    message(
      "Eliminating blank rows (country identifier is NA), fixing country names, filling in the correct cowcodes, adding state system info..."
    )
  }

  PIPE <- data |>
    filter(!is.na(country)) |> # First we eliminate rows which are all NA
    rename(country_number = country) |>
    group_by(country_number) |>
    mutate(countryn = ifelse(countryn == "", NA, countryn)) |>
    arrange(countryn, desc(year)) |>
    tidyr::fill(countryn) |>
    ungroup() |>
    mutate(countryn = str_to_title(countryn))

  no.cowcodes <- PIPE |>
    group_by(country_number) |>
    filter(all(is.na(cowcodes)))
  with.cowcodes <- PIPE |>
    group_by(country_number) |>
    filter(any(!is.na(cowcodes)))

  with.cowcodes <- with.cowcodes |>
    group_by(country_number) |>
    arrange(desc(cowcodes), desc(year)) |>
    tidyr::fill(cowcodes) |>
    ungroup() |>
    arrange(countryn, desc(year))

  PIPE <- bind_rows(with.cowcodes, no.cowcodes) |>
    arrange(countryn, desc(year))

  if (verbose) {
    message("Changing countryn 'Serbia/Montenegro/Kosovo' to Serbia")
    message("Changing countryn 'Hungary Empire' to Austria-Hungary (Hungary)")
    message("Changing countryn 'Austria Empire' to Austria-Hungary (Austria)")
    message("Changing cowcode 'Hungary Empire' to 300")
    message("Changing cowcode for 'Serbia/Montenegro/Kosovo' to 342")
    message(
      "Fixing country names for Leeward Islands and West Indies Federation"
    )
  }

  PIPE$cowcodes[PIPE$countryn == "Serbia/Montenegro/Kosovo"] <- 342
  PIPE$cowcodes[PIPE$countryn == "Hungary Empire"] <- 300
  PIPE$countryn[PIPE$countryn == "Serbia/Montenegro/Kosovo"] <- "Serbia"
  PIPE$countryn[
    PIPE$countryn == "Hungary Empire"
  ] <- "Austria-Hungary (Hungary)"
  PIPE$countryn[
    PIPE$countryn == "Austria Empire"
  ] <- "Austria-Hungary (Austria)"

  PIPE <- PIPE |>
    filter(
      !(cowcodes %in% 255 & year %in% 1946:1989),
      !(cowcodes %in% 679 & year < 1990)
    )

  PIPE <- PIPE |>
    country_year_coder(
      countryn,
      year,
      code_col = cowcodes,
      code_type = "cown",
      match_type = "country",
      verbose = verbose,
      ...
    ) |>
    mutate(
      countryn = case_when(
        countryn == "West Indies F" ~ "West Indies Federation",
        countryn == "Leeward Island F" ~ "Leeward Islands Federation",
        countryn == "Leeward Islands" ~ "Leeward Islands Federation",
        TRUE ~ countryn
      ),
      extended_country_name = case_when(
        countryn == "Vietnam" &
          year < 1954 ~ "Vietnam (Annam/Cochin China/Tonkin)",
        TRUE ~ extended_country_name
      ),
      GWn = case_when(
        countryn == "Vietnam" &
          year < 1954 ~ 815,
        TRUE ~ GWn
      ),
      cown = case_when(
        countryn == "Vietnam" &
          year < 1954 ~ NA_real_,
        TRUE ~ cown
      )
    )

  if (verbose) {
    message("Adding calculated variables")
    message(
      "(republic, republican_period, cum_salterel, cum_term, democracy,",
      " democracy2, democracy_age, regime, regime_period)..."
    )
  }

  PIPE <- PIPE |>
    group_by(country_number) |>
    arrange(country_number, year) |>
    mutate(
      republic = ifelse(is.na(republic_age), 0, 1),
      republican_period = count_sequence_breaks(republic, seq_step = 0)
    ) |>
    group_by(country_number, republican_period) |>
    mutate(
      cum_salterel = cumsum(as.numeric(dplyr::coalesce(salterel == 1, FALSE))),
      cum_term = cumsum(as.numeric(dplyr::coalesce(term == 1, FALSE))),
      democracy = !is.na(republic_age) & cum_salterel > 0 & cum_term > 0,
      democracy2 = democracy & polstatus > 0
    ) |>
    group_by(country_number) |>
    arrange(country_number, year) |>
    mutate(
      democratic_period = count_sequence_breaks(democracy2, seq_step = 0)
    ) |>
    group_by(country_number, democratic_period) |>
    mutate(
      democracy_age = dplyr::if_else(
        democracy2,
        as.numeric(row_number()),
        NA_real_
      ),
      regime = dplyr::case_when(
        polstatus <= 0 ~ NA_real_,
        is.na(electoral_age) ~ 0,
        opposition == 0 | is.na(republic_age) ~ 1,
        !is.na(democracy_age) ~ 3,
        !is.na(republic_age) ~ 2,
        TRUE ~ NA_real_
      )
    ) |>
    group_by(country_number) |>
    arrange(country_number, year) |>
    mutate(
      regime_period = {
        regime_periods <- rep(NA_real_, dplyr::n())
        observed_regime <- !is.na(regime)
        regime_periods[observed_regime] <- count_sequence_breaks(
          regime[observed_regime],
          seq_step = 0
        )
        regime_periods
      }
    ) |>
    ungroup() |>
    arrange(countryn, year)

  if (verbose) {
    message(sprintf(
      "After processing, the resulting dataset has %d rows",
      nrow(PIPE)
    ))
    message(
      "Due to the exclusion of rows with no data, this number should be lower than the number of rows in the raw dataset."
    )
  }

  standardize_columns(PIPE, countryn, cowcodes, verbose = verbose)
}

#' @details
#' `redownload_polityIV` downloads the 2019 update of the Polity IV dataset (annual time series, to
#' 2018) and processes it using [country_year_coder]. The original data is available at
#' <`r find_url("polityIV", "documentation")`>.
#' Polity is now in version 5, which incorporates substantial changes; this
#' redownloads the archived version of [polityIV] data. Use
#' [download_polity_annual] to download version 5 of Polity.
#'
#' @rdname redownload_blm
#'
#' @source `r roxygen_cite("polity2019")` Data and codebook available at <`r find_url("polityIV", "documentation")`>.
#'
#' @export
#' @import dplyr
#'
#' @seealso [polity_pmm]
#' @seealso [polityIV]
#'
#' @examples
#' \dontrun{
#' polityIV <- redownload_polityIV()
#' polityIV
#' }
redownload_polityIV <- function(url, verbose = TRUE, return_raw = FALSE, ...) {
  if (missing(url)) {
    url <- find_url("polityIV")
  }

  data <- read_data(url, verbose = verbose, name = "polity")

  if (return_raw) {
    if (verbose) {
      message("Returning raw data, without processing.")
    }
    return(data)
  }

  if (verbose) {
    message(sprintf("Original dataset has %d rows.", nrow(data)))
    message("Processing the Polity IV data - adding state system info...")
  }

  polityIV <- country_year_coder(
    data,
    country_col = country,
    date_col = year,
    code_col = ccode,
    code_type = "polity_ccode",
    match_type = "country",
    verbose = verbose,
    ...
  )

  if (verbose) {
    message(sprintf(
      "Resulting dataset after processing has %d rows.",
      nrow(polityIV)
    ))
    if (nrow(data) != nrow(polityIV)) {
      message(
        "Note: the number of rows in the processed Polity IV data is different from the number of rows in the original data."
      )
      if (nrow(data) != nrow(polityIV)) {
        warning(sprintf(
          "There should be %d rows in the final processed data. Something went wrong.",
          nrow(data)
        ))
      }
    }
  }

  standardize_columns(polityIV, country, ccode, verbose = verbose)
}

#' @rdname redownload_blm
#' @source `r roxygen_cite("bti")` Available at <`r find_url("bti", "documentation")`>.
#'
#' @export
#' @examples
#' \dontrun{
#' bti <- redownload_bti()
#' bti
#' }
redownload_bti <- function(url, verbose = TRUE, return_raw = FALSE, ...) {
  if (missing(url)) {
    url <- find_url("bti")
  }

  tmpfile <- tempfile(fileext = "xlsx")
  utils::download.file(url, tmpfile, mode = "wb", quiet = !verbose)

  bti_data <- tibble()
  year <- seq(from = 2024, to = 2004, by = -2)

  for (i in 1:length(year)) {
    current_sheet <- read_data(
      tmpfile,
      verbose = verbose,
      name = "BTI",
      file_extension = "xlsx",
      sheet = i
    )

    Q17.3 <- which(stringr::str_detect(names(current_sheet), "Q.?17.3"))
    if (length(Q17.3) == 0) {
      stop("No Q17.3 column found in the BTI data. This is unexpected.")
    }

    democracy_autocracy <- which(stringr::str_detect(
      names(current_sheet),
      "Democracy/Autocracy"
    ))
    if (length(democracy_autocracy) == 0) {
      stop(
        "No Democracy/Autocracy column found in the BTI data. This is unexpected."
      )
    }

    cat_dem_stat_num <- which(stringr::str_detect(
      names(current_sheet),
      "SI \\| Democracy Status"
    )) |>
      max()
    cat_dem_stat <- cat_dem_stat_num + 1
    cat_dem_stat_label <- cat_dem_stat_num + 2

    current_sheet <- current_sheet |>
      select(
        c(1:eval(Q17.3)),
        all_of(c(democracy_autocracy, cat_dem_stat, cat_dem_stat_label))
      ) |>
      mutate(year = year[i])

    names(current_sheet)[1:2] <- c("country", "bti_region")
    names(current_sheet)[(Q17.3 + 1):(Q17.3 + 3)] <- c(
      "pol_sys",
      "cat_dem_stat",
      "cat_dem_stat_label"
    )
    names(current_sheet) <- str_replace_all(
      names(current_sheet),
      "[ |]",
      "_"
    ) |>
      str_replace_all("___", "_")
    names(current_sheet) <- str_replace_all(
      names(current_sheet),
      "\\.\\.\\.[0-9]+$",
      ""
    )

    current_sheet <- current_sheet |>
      mutate(pol_sys = ifelse(pol_sys == "Aut.", 0, 1))

    current_sheet <- suppressWarnings(
      current_sheet |>
        mutate(across(
          !any_of(c("country", "bti_region", "cat_dem_stat_label")),
          as.numeric
        ))
    )

    if ("Q16.5_Public_consultation" %in% names(current_sheet)) {
      current_sheet <- current_sheet |>
        rename_with(
          ~ str_replace(
            .,
            "Q16.5_Public_consultation",
            "Q16.4_Public_consultation"
          )
        )
    }

    if ("Q16.6_Reconciliation" %in% names(current_sheet)) {
      current_sheet <- current_sheet |>
        rename_with(
          ~ str_replace(., "Q16.6_Reconciliation", "Q16.5_Reconciliation")
        )
    }

    bti_data <- bind_rows(bti_data, current_sheet)
  }
  unlink(tmpfile)

  bti_data <- bti_data |>
    mutate(report_year = year + 2)

  if (return_raw) {
    if (verbose) {
      message("Returning raw data, without processing.")
    }
    return(bti_data)
  }

  if (verbose) {
    message(sprintf("Original dataset has %d rows.", nrow(bti_data)))
    message("Processing the BTI data - adding state system info, regions...")
  }

  bti_data <- bti_data |>
    relocate(year, .after = country) |>
    mutate(
      bti_region = as.character(bti_region),
      bti_region = case_when(
        bti_region == "1" ~ "East-Central and Southeast Europe",
        bti_region == "2" ~ "Latin America and the Caribbean",
        bti_region == "3" ~ "West and Central Africa",
        bti_region == "4" ~ "Middle East and North Africa",
        bti_region == "5" ~ "Southern and Eastern Africa",
        bti_region == "6" ~ "Post-Soviet Eurasia",
        bti_region == "7" ~ "Asia and Oceania",
        TRUE ~ bti_region
      )
    )

  bti <- country_year_coder(bti_data, country, year, verbose = verbose, ...)

  if (verbose) {
    message(sprintf(
      "Resulting dataset after processing has %d rows.",
      nrow(bti)
    ))
    if (nrow(bti_data) != nrow(bti)) {
      message(
        "Note: the number of rows in the processed BTI data is different from the number of rows in the original data."
      )
      if (nrow(bti_data) != nrow(bti)) {
        warning(sprintf(
          "There should be %d rows in the final processed data. Something went wrong.",
          nrow(bti_data)
        ))
      }
    }
  }

  standardize_columns(bti, "country", verbose = verbose)
}

#' @rdname redownload_blm
#'
#' @source `r roxygen_cite("pacl_update")` Available at <`r find_url("pacl_update", "documentation")`>.
#'
#' @export
#' @examples
#' \dontrun{
#' redownload_pacl_update()
#' }
redownload_pacl_update <- function(
  url,
  verbose = TRUE,
  return_raw = FALSE,
  ...
) {
  if (missing(url)) {
    url <- find_url("pacl_update")
  }

  data <- suppressWarnings(
    read_data(url, verbose = verbose, name = "Regime characteristics")
  )

  if (return_raw) {
    if (verbose) {
      message("Returning raw data, without processing.")
    }
    return(data)
  }

  if (verbose) {
    message(sprintf("Original dataset has %d rows", nrow(data)))
    message(
      "Processing the Bjornskov and Rode PACL update data - adding state system info..."
    )
  }

  pacl_update <- data |>
    country_year_coder(
      country,
      year,
      match_type = "country",
      verbose = verbose,
      ...
    )

  if (verbose) {
    message(sprintf(
      "Resulting dataset after processing has %d rows.",
      nrow(pacl_update)
    ))
    if (nrow(data) != nrow(pacl_update)) {
      message(
        "Note: the number of rows in the processed Bjornskov and Rode PACL update is different from the number of rows in the original data."
      )
    }
  }

  pacl_update <- pacl_update |>
    select(-starts_with("..."))

  names(pacl_update) <- str_remove_all(names(pacl_update), "\\(.+\\)")
  names(pacl_update) <- str_trim(names(pacl_update))
  names(pacl_update) <- str_remove_all(names(pacl_update), "[\\.,]")
  names(pacl_update) <- str_replace_all(names(pacl_update), " ", "_")

  standardize_columns(pacl_update, country, country_isocode, verbose = verbose)
}

#' @rdname redownload_blm
#' @export
#'
#' @source `r roxygen_cite("REIGN")` Data available at <`r find_url("REIGN", "documentation")`>.
#'
#' @examples
#' \dontrun{
#' reign <- redownload_reign()
#' }
redownload_reign <- function(url, verbose = TRUE, return_raw = FALSE, ...) {
  if (missing(url)) {
    url <- find_url("REIGN")
  }

  data <- read_data(
    url,
    verbose = verbose,
    file_extension = "csv",
    show_col_types = verbose
  )

  if (return_raw) {
    if (verbose) {
      message("Returning raw data, without processing.")
    }
    return(data)
  }

  reign <- data |>
    mutate(
      Start = lubridate::mdy(gwf_startdate),
      End = lubridate::mdy(gwf_enddate),
      cow = as.double(cowcode),
      gwf_country = case_when(
        gwf_country == "Cananda" ~ "Canada",
        gwf_country == "UKG" ~ "United Kingdom",
        TRUE ~ gwf_country
      )
    ) |>
    group_by(pick(everything())) |>
    mutate(year = list(lubridate::year(Start):lubridate::year(End))) |>
    tidyr::unnest(cols = c(year)) |>
    ungroup() |>
    # filter(year < lubridate::year(lubridate::now())) |> # If excluding the 2017 countries
    country_year_coder(
      gwf_country,
      year,
      cowcode,
      code_type = "cown",
      match_type = "country",
      verbose = verbose,
      ...
    )

  standardize_columns(reign, gwf_country, cowcode, verbose = verbose)
}
