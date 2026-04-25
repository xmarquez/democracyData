normalize_fh_country_name <- function(country) {
  dplyr::case_when(
    country == "Yemen, S." ~ "South Yemen",
    country == "Vietnam, S." ~ "South Vietnam",
    country == "Germany, E." ~ "East Germany",
    TRUE ~ as.character(country)
  )
}

parse_fh_numeric <- function(x) {
  suppressWarnings(readr::parse_number(as.character(x), na = c("", "N/A")))
}

normalize_fh_adda <- function(x) {
  parsed <- parse_fh_numeric(x)

  dplyr::if_else(
    is.na(parsed),
    "N/A",
    as.character(parsed)
  )
}

resolve_fh_source <- function(local_path, remote_url) {
  namespace_path <- tryCatch(
    getNamespaceInfo(asNamespace("democracyData"), "path"),
    error = \(e) ""
  )

  candidates <- c(
    local_path,
    if (nzchar(namespace_path)) file.path(namespace_path, local_path)
  )

  local_match <- candidates[file.exists(candidates)][1]

  if (!is.na(local_match)) {
    local_match
  } else {
    remote_url
  }
}

fh_full_unstandardized_columns <- c(
  "country",
  "region",
  "country_or_territory",
  "edition",
  "year",
  "status",
  "pr",
  "cl",
  "A1",
  "A2",
  "A3",
  "A",
  "B1",
  "B2",
  "B3",
  "B4",
  "B",
  "C1",
  "C2",
  "C3",
  "C",
  "AddQ",
  "AddA",
  "pr_full",
  "D1",
  "D2",
  "D3",
  "D4",
  "D",
  "E1",
  "E2",
  "E3",
  "E",
  "F1",
  "F2",
  "F3",
  "F4",
  "F",
  "G1",
  "G2",
  "G3",
  "G4",
  "G",
  "cl_full",
  "total"
)

read_fh_sheet_with_headers <- function(path, sheet, verbose = TRUE, ...) {
  data <- read_data(
    path,
    verbose = verbose,
    sheet = sheet,
    col_names = FALSE,
    ...
  )

  header <- data |>
    dplyr::slice(1) |>
    unlist(use.names = FALSE) |>
    as.character()

  keep <- !is.na(header) & header != ""

  data <- data |>
    dplyr::slice(-1) |>
    dplyr::select(which(keep))

  names(data) <- make.unique(header[keep])

  data
}

prepare_fh_country_status_long <- function(
  path,
  include_territories = FALSE,
  verbose = TRUE
) {
  data <- read_data(
    path,
    verbose = verbose,
    sheet = 2,
    skip = 3,
    col_names = FALSE
  )

  if (include_territories) {
    territory_data <- read_data(
      path,
      verbose = verbose,
      sheet = 3,
      skip = 3,
      col_names = FALSE
    )

    data <- dplyr::bind_rows(
      data,
      territory_data |>
        dplyr::mutate(dplyr::across(c(2:3), as.character))
    )
  }

  n_years <- (ncol(data) - 1) / 3
  var_years <- expand.grid(
    x = c("pr", "cl", "status"),
    y = c(1972:1980, 1982:(1972 + n_years))
  )

  names(data) <- c("country", paste(var_years$x, var_years$y, sep = "_"))

  data$pr_1972 <- suppressWarnings(as.double(data$pr_1972))
  data$cl_1972 <- suppressWarnings(as.double(data$cl_1972))

  data |>
    tidyr::pivot_longer(
      cols = tidyselect::matches("[12][0-9]{3}"),
      names_to = "indicator",
      values_to = "value",
      values_transform = list(value = as.character)
    ) |>
    tidyr::separate(indicator, into = c("indicator", "year"), sep = "_") |>
    dplyr::filter(!is.na(value)) |>
    dplyr::summarise(
      value = dplyr::first(value),
      .by = c(country, year, indicator)
    ) |>
    tidyr::pivot_wider(names_from = "indicator", values_from = "value") |>
    dplyr::mutate(
      year = as.numeric(year),
      pr = parse_fh_numeric(pr),
      cl = parse_fh_numeric(cl),
      cl = ifelse(country == "South Africa" & year == 1972, 5, cl),
      pr = ifelse(country == "South Africa" & year == 1972, 6, pr),
      status = ifelse(country == "South Africa" & year == 1972, "NF", status),
      status = as.factor(status),
      fh_total = pr + cl,
      fh_total_reversed = 14 - fh_total,
      country = normalize_fh_country_name(country)
    )
}

prepare_fh <- function(
  path,
  include_territories = FALSE,
  verbose = TRUE,
  ...
) {
  data <- prepare_fh_country_status_long(
    path = path,
    include_territories = include_territories,
    verbose = verbose
  )

  fh <- data |>
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
      nrow(fh)
    ))
    if (nrow(data) != nrow(fh)) {
      message(
        "Note: the number of rows in the processed Freedom House data ",
        "is different from the number of rows in the original data."
      )
    }
  }

  standardize_columns(fh, country, verbose = verbose)
}

prepare_fh_full_detailed <- function(path, verbose = TRUE) {
  data <- read_data(
    path,
    verbose = verbose,
    sheet = 2,
    skip = 1,
    col_names = TRUE
  )

  names(data) <- c(
    "country",
    "region",
    "country_or_territory",
    "edition",
    "status",
    "pr",
    "cl",
    "A1",
    "A2",
    "A3",
    "A",
    "B1",
    "B2",
    "B3",
    "B4",
    "B",
    "C1",
    "C2",
    "C3",
    "C",
    "AddQ",
    "AddA",
    "pr_full",
    "D1",
    "D2",
    "D3",
    "D4",
    "D",
    "E1",
    "E2",
    "E3",
    "E",
    "F1",
    "F2",
    "F3",
    "F4",
    "F",
    "G1",
    "G2",
    "G3",
    "G4",
    "G",
    "cl_full",
    "total"
  )

  numeric_columns <- setdiff(
    names(data),
    c(
      "country",
      "region",
      "country_or_territory",
      "status",
      "AddA"
    )
  )

  data |>
    dplyr::mutate(
      dplyr::across(
        dplyr::all_of(numeric_columns),
        parse_fh_numeric
      ),
      AddA = normalize_fh_adda(AddA),
      country = normalize_fh_country_name(country),
      status = as.character(status),
      year = edition - 1
    ) |>
    ensure_fh_full_schema()
}

prepare_fh_full_aggregate_2006_2026 <- function(path, verbose = TRUE) {
  data <- read_fh_sheet_with_headers(
    path = path,
    sheet = "FIW06-26",
    verbose = verbose,
    skip = 0
  )

  data <- data |>
    dplyr::select(1:19)

  names(data) <- c(
    "country",
    "region",
    "country_or_territory",
    "edition",
    "status",
    "pr",
    "cl",
    "A",
    "B",
    "C",
    "AddQ",
    "AddA",
    "pr_full",
    "D",
    "E",
    "F",
    "G",
    "cl_full",
    "total"
  )

  numeric_columns <- setdiff(
    names(data),
    c(
      "country",
      "region",
      "country_or_territory",
      "status",
      "AddA"
    )
  )

  data |>
    dplyr::mutate(
      dplyr::across(
        dplyr::all_of(numeric_columns),
        parse_fh_numeric
      ),
      AddA = normalize_fh_adda(AddA),
      country = normalize_fh_country_name(country),
      status = as.character(status),
      year = edition - 1
    ) |>
    ensure_fh_full_schema()
}

prepare_fh_full_aggregate_2003_2005 <- function(
  path,
  region_lookup,
  verbose = TRUE
) {
  data <- read_fh_sheet_with_headers(
    path = path,
    sheet = "FIW03-05",
    verbose = verbose,
    skip = 0
  )

  names(data) <- c(
    "country",
    "country_or_territory",
    "pr_full_2003",
    "pr_full_2004",
    "pr_full_2005",
    "cl_full_2003",
    "cl_full_2004",
    "cl_full_2005",
    "total_2003",
    "total_2004",
    "total_2005"
  )

  data |>
    tidyr::pivot_longer(
      cols = -c(country, country_or_territory),
      names_to = c(".value", "edition"),
      names_pattern = "(pr_full|cl_full|total)_(\\d{4})"
    ) |>
    dplyr::mutate(
      country = normalize_fh_country_name(country),
      edition = as.numeric(edition),
      year = edition - 1,
      pr_full = parse_fh_numeric(pr_full),
      cl_full = parse_fh_numeric(cl_full),
      total = parse_fh_numeric(total)
    ) |>
    dplyr::left_join(region_lookup, by = "country") |>
    ensure_fh_full_schema()
}

ensure_fh_full_schema <- function(data) {
  missing_columns <- setdiff(fh_full_unstandardized_columns, names(data))

  if (length(missing_columns) > 0) {
    for (column in missing_columns) {
      data[[column]] <- if (identical(column, "AddA")) "N/A" else NA_real_
    }
  }

  data |>
    dplyr::mutate(
      region = as.character(region),
      country_or_territory = as.character(country_or_territory),
      status = as.character(status),
      AddA = dplyr::if_else(is.na(AddA), "N/A", as.character(AddA))
    ) |>
    dplyr::select(dplyr::all_of(fh_full_unstandardized_columns))
}

prepare_fh_full <- function(
  detailed_path,
  aggregate_path,
  status_path,
  verbose = TRUE,
  ...
) {
  detailed_data <- prepare_fh_full_detailed(detailed_path, verbose = verbose)
  aggregate_2006_2026 <- prepare_fh_full_aggregate_2006_2026(
    aggregate_path,
    verbose = verbose
  )

  region_lookup <- dplyr::bind_rows(
    detailed_data |>
      dplyr::select(country, region),
    aggregate_2006_2026 |>
      dplyr::select(country, region)
  ) |>
    dplyr::filter(!is.na(region), region != "") |>
    dplyr::distinct() |>
    dplyr::group_by(country) |>
    dplyr::summarise(region = dplyr::first(region), .groups = "drop")

  aggregate_2003_2005 <- prepare_fh_full_aggregate_2003_2005(
    aggregate_path,
    region_lookup = region_lookup,
    verbose = verbose
  )

  status_lookup <- prepare_fh_country_status_long(
    status_path,
    include_territories = TRUE,
    verbose = FALSE
  ) |>
    dplyr::select(country, year, status, pr, cl) |>
    dplyr::distinct()

  data <- dplyr::bind_rows(
    aggregate_2003_2005,
    aggregate_2006_2026 |>
      dplyr::filter(year <= 2011),
    detailed_data
  ) |>
    dplyr::left_join(
      status_lookup,
      by = dplyr::join_by(country, year),
      suffix = c("", "_status")
    ) |>
    dplyr::mutate(
      status = dplyr::coalesce(status, status_status),
      pr = dplyr::coalesce(pr, pr_status),
      cl = dplyr::coalesce(cl, cl_status),
      status = as.factor(status)
    ) |>
    dplyr::select(-tidyselect::ends_with("_status")) |>
    dplyr::distinct()

  fh_full <- data |>
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
      nrow(fh_full)
    ))
    if (nrow(data) != nrow(fh_full)) {
      message(
        "Note: the number of rows in the processed Freedom House data ",
        "is different from the number of rows in the original data."
      )
    }
  }

  fh_full <- fh_full |>
    dplyr::relocate(year, .after = edition)

  standardize_columns(fh_full, country, verbose = verbose)
}

extract_fh_edition <- function(x) {
  x <- paste(x, collapse = " ")

  edition <- stringr::str_extract(
    x,
    "FIW\\s*_?\\s*([0-9]{2,4})"
  ) |>
    stringr::str_extract("[0-9]{2,4}")

  if (is.na(edition)) {
    return(NA_real_)
  }

  if (nchar(edition) == 2) {
    edition <- paste0("20", edition)
  }

  as.numeric(edition)
}

prepare_fh_electoral_official_current <- function(url, verbose = TRUE) {
  data <- read_data(url, verbose = verbose, skip = 1)

  electoral_column <- names(data)[
    stringr::str_detect(names(data), "Electoral Democracy")
  ][1]

  edition <- extract_fh_edition(c(url, electoral_column))

  data |>
    dplyr::transmute(
      country = normalize_fh_country_name(.data[[names(data)[1]]]),
      year = edition - 1,
      electoral = .data[[electoral_column]] %in% c("yes", "Yes")
    )
}

prepare_fh_electoral <- function(
  current_path,
  full_data,
  verbose = TRUE,
  ...
) {
  historical_url <- find_url("fh_electoral")[1]
  later_urls <- find_url("fh_electoral")[-1]

  historical_data <- read_data(
    historical_url,
    verbose = verbose,
    name = "/FH_Electoral_Democracies_1988-2016.xls",
    sheet = 1,
    skip = 3,
    col_names = FALSE,
    na = c("", "-")
  )

  names(historical_data) <- c(
    "country",
    paste("electoral", 1989:2016, sep = "_")
  )

  historical_data <- historical_data |>
    tidyr::pivot_longer(
      names_to = "indicator",
      values_to = "value",
      tidyselect::matches("electoral_[0-9]{4}")
    ) |>
    tidyr::separate(indicator, into = c("measure", "year"), sep = "_") |>
    dplyr::filter(!is.na(value)) |>
    tidyr::pivot_wider(names_from = "measure", values_from = "value") |>
    dplyr::mutate(
      year = as.numeric(year),
      electoral = electoral %in% c("Yes", "yes"),
      country = normalize_fh_country_name(country)
    )

  official_current <- lapply(
    c(later_urls, current_path),
    prepare_fh_electoral_official_current,
    verbose = verbose
  ) |>
    dplyr::bind_rows()

  official_data <- dplyr::bind_rows(historical_data, official_current)

  official_coded <- official_data |>
    country_year_coder(
      country,
      year,
      match_type = "country",
      verbose = verbose,
      ...
    )

  calc_data <- full_data |>
    dplyr::transmute(
      country_calc = fh_full_country,
      year,
      extended_country_name,
      GWn,
      cown,
      in_GW_system,
      electoral_calc = dplyr::case_when(
        !is.na(A) & !is.na(pr_full) & !is.na(cl_full) ~
          A >= 7 & pr_full >= 20 & cl_full >= 30,
        TRUE ~ as.logical(NA)
      )
    )

  fh_electoral <- dplyr::full_join(
    official_coded,
    calc_data,
    by = dplyr::join_by(year, extended_country_name, GWn, cown, in_GW_system)
  ) |>
    dplyr::mutate(country = dplyr::coalesce(country, country_calc)) |>
    dplyr::select(
      country,
      year,
      electoral,
      extended_country_name,
      GWn,
      cown,
      in_GW_system,
      electoral_calc
    ) |>
    dplyr::distinct()

  if (verbose) {
    message(sprintf(
      "Resulting dataset after processing has %d rows.",
      nrow(fh_electoral)
    ))
  }

  standardize_columns(fh_electoral, country, verbose = verbose)
}
