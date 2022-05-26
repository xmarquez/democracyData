prepare_pmm_replication_data <- function(
  path = "../../Pemstein Meserve and Melton Code/uds/data/democracy1946.2008.rda",
  verbose = TRUE,
  ...) {

  democracy <- country <- year <- cowcode <- NULL

  if(verbose) {
    message("Preparing PMM replication data...")
    message(sprintf("Trying %s ...", path))
  }

  load(path)

  if(verbose) {
    message(sprintf("Original dataset has %d rows.",
                    nrow(democracy)))
    message("Processing the PMM replication data - adding state system info...")
  }

  pmm <- democracy %>%
    as_tibble() %>%
    country_year_coder(country_col = country,
                       date_col = year,
                       # code_col = cowcode,
                       # code_type = "cown",
                       match_type = "country",
                       verbose = verbose,
                       ...)

  pmm$src <- "Original Pemstein, Meserve, and Melton replication data to 2008"

  vars <- names(pmm)[ which(names(pmm) == "arat"):which(names(pmm) == "vanhanen") ]
  vars <- paste("pmm", vars, sep = "_")

  names(pmm)[ which(names(pmm) == "arat"):which(names(pmm) == "vanhanen") ] <- vars

  if(verbose) {
    message(sprintf("Resulting dataset after processing has %d rows.",
                    nrow(pmm)))
    if(nrow(pmm) != nrow(democracy)) {
      message("Note: the number of rows in the processed PMM data is different from the number of rows in the original data.")
    }
  }

  standardize_columns(pmm, country, cowcode, verbose = verbose)


}

extract_pmm_var <- function(pmm_replication_data, pmm_var,
                            verbose = FALSE,
                            include_in_output) {

  pmm_var <- enquo(pmm_var)

  var_name <- quo_name(pmm_var)

  pmm_country  <- variable <- value <- year <- NULL

  pmm_var_extracted <- pmm_replication_data %>%
    filter(!is.na(!!pmm_var)) %>%
    tidyr::gather(variable, value, !!pmm_var) %>%
    mutate(!!var_name := value) %>%
    select(pmm_country, year, !!var_name, include_in_output)

  pmm_var_extracted

}

prepare_mainwaring <- function(path = "../../Data/Mainwaring Linan.txt",
                               verbose = TRUE,
                               ...) {

  if(verbose) {
    message("Preparing Mainwaring data...")
    message(sprintf("Trying %s ...", path))
  }

  year <- From <- To <- Country <- NULL

  mainwaring_country <- Regime <- Civilian.Power <- NULL

  data <- readr::read_tsv(path)

  if(verbose) {
    message(sprintf("Original dataset has %d rows",
                    nrow(data)))
    message("Processing the Mainwaring data - adding state system info...")
  }


  mainwaring <- data %>%
    group_by(Country, From, To) %>%
    mutate(year = list(From:To)) %>%
    unnest() %>%
    ungroup() %>%
    country_year_coder(Country,
                       year,
                       match_type = "country",
                       verbose = verbose,
                       ...)

  if(verbose) {
    message(sprintf("Resulting dataset after processing has %d rows.",
                    nrow(mainwaring)))
    if(nrow(mainwaring) != nrow(data)) {
      message("Note: the number of rows in the processed data is different from the number of rows in the original data.")
    }
  }

  mainwaring <- mainwaring %>%
    mutate(mainwaring = plyr::mapvalues(Regime,
                                        from = c("A", "SD", "D"),
                                        to = c(0, 0.5, 1)),
           mainwaring = as.numeric(mainwaring))  %>%
    select(Country, year, mainwaring, Regime:Civilian.Power, everything())

  standardize_columns(mainwaring,
                      Country,
                      verbose = verbose)


}

prepare_eiu <- function(path = "EIU Democracy Index 2020.csv",
                        verbose = TRUE,
                        ...) {

  if(verbose) {
    message("Preparing EIU data...")
    message(sprintf("Trying %s ...", path))
  }

  data <- readr::read_csv(path)

  if(verbose) {
    message(sprintf("Original dataset has %d rows and is in country-year format",
                    nrow(data)))
    message("Processing the EIU data - adding state system info...")
  }

  year <- country <- extended_country_name <- NULL

  eiu <- data %>%
    mutate(country = plyr::mapvalues(country, from = "Saudi", to = "Saudi Arabia")) %>%
    country_year_coder(country_col = country, date_col = year,
                       verbose = verbose,
                       ...) %>%
    mutate(country = plyr::mapvalues(country, from = "Saudi Arabia", to = "Saudi")) %>%
    arrange(extended_country_name, year)

  if(verbose) {
    message(sprintf("Resulting dataset after processing has %d rows.",
                    nrow(eiu)))
    if(nrow(eiu) != nrow(data)) {
      message("Note: the number of rows in the processed data is different from the number of rows in the original data.")
    }
  }

  standardize_columns(eiu, country, verbose = verbose)

}

prepare_doorenspleet <- function(path = "../../Data/Doorenspleet data.csv",
                                 verbose = TRUE,
                                 ...) {

  country <- year <- start_year <- end_year <- regime <- end_year_2 <- NULL


  if(verbose) {
    message("Preparing Doorenspleet data...")
    message(sprintf("Trying %s ...", path))
  }

  data <- readr::read_csv(path)

  if(verbose) {
    message(sprintf("Original dataset has %d rows but is not in country-year format",
                    nrow(data)))
    message("Processing the Doorenspleet data - turning to country-year format, adding state system info...")
  }


  doorenspleet <- data %>%
    mutate(country = plyr::mapvalues(country,
                                     "Republic of Vietnam",
                                     "South Vietnam")) %>%
    group_by(country) %>%
    mutate(end_year_2 = lead(start_year) - 1,
           end_year_2 = ifelse(is.na(end_year), end_year_2,as.numeric(end_year)),
           end_year_2 = ifelse(is.na(end_year_2),1994,end_year_2), end_year = end_year_2) %>%
    select(-end_year_2) %>%
    group_by(country, start_year, end_year, regime) %>%
    mutate(year = list(start_year:end_year)) %>%
    unnest()  %>%
    ungroup() %>%
    country_year_coder(country,
                       year,
                       match_type = "country",
                       verbose = verbose,
                       ...) %>%
    mutate(doorenspleet = plyr::mapvalues(regime, from=c("A","I","D"), to = c(1,NA,2)) %>%
             as.numeric()) %>%
    select(country, year, regime, doorenspleet, everything())

  if(verbose) {
    message(sprintf("Resulting dataset after processing has %d rows.",
                    nrow(doorenspleet)))
    if(nrow(doorenspleet) != nrow(data)) {
      message("Note: the number of rows in the processed data is different from the number of rows in the original data.")
    }
  }

  standardize_columns(doorenspleet, country, verbose = verbose)


}

prepare_prc <- function(path = "../../Data/Gasiorowski.csv", verbose = TRUE, ...) {

  country <- regime <- start <- end <- year <- prc  <- NULL
  gasiorowski <- NULL

  data <- read_data(path,
                    verbose = verbose,
                    name = "Political Regime Change (Gasiorowski)")

  if(verbose) {
    message("Converting to country-year format and adding state system info...")
  }

  prc_gasiorowski <- data %>%
    group_by(country, regime, start, end)%>%
    mutate(year = list(start:end)) %>%
    unnest()  %>%
    ungroup() %>%
    country_year_coder(country,
                       year,
                       match_type = "country",
                       verbose = verbose, ...) %>%
    mutate(prc = plyr::mapvalues(regime,
                                 from = c("A","T","S","D"),
                                 to = 1:4),
           prc = as.numeric(as.character(prc))) %>%
    arrange(country, year, start, end) %>%
    group_by(country, year) %>%
    mutate(prc_at_end_year = last(prc),
           prc_at_beginning_year = first(prc)) %>%
    ungroup() %>%
    select(country, year, regime, starts_with("prc"), everything())

  if(verbose) {
    message(sprintf("Resulting dataset after processing has %d rows.",
                    nrow(prc_gasiorowski)))
    if(nrow(data) != nrow(prc_gasiorowski)) {
      message("Note: the number of rows in the processed Gasiorowski data is different from the number of rows in the original data.")
    }
  }

  standardize_columns(prc_gasiorowski, country, verbose = verbose)

}


create_pitf_scores <- function(polity_annual, verbose = TRUE,
                               include_in_output = c("extended_country_name", "GWn", "cown", "in_GW_system")) {

  cyear <- year <- exrec <- parcomp <- pitf_binary <- NULL

  if(missing(polity_annual)) {
    polity_annual <- download_polity_annual(verbose = verbose,
                                            include_in_output = include_in_output)
  }

  if(verbose) {
    message("Creating PITF scores -- excluding interruption codes...")
  }

  pitf <- polity_annual %>%
    select(cyear:year, exrec, parcomp, include_in_output) %>%
    filter(exrec >= 0, parcomp >= 0) %>%
    mutate(pitf = ifelse(exrec < 6 & parcomp %in% c(1, 2),"0-Full autocracy",
                         ifelse(exrec < 6 & !(parcomp %in% c(1,2)), "1-Partial autocracy",
                                ifelse(exrec >= 6 & parcomp %in% c(1,2), "1-Partial autocracy",
                                       ifelse(exrec >= 6 & parcomp %in% c(0,4,5) & !(exrec == 8 & parcomp == 5), "3-Partial democracy",
                                              ifelse(exrec >= 6 & parcomp %in% c(3), "2-Partial democracy with factionalism","4-Full democracy"))))),
           pitf_binary = ifelse(exrec > 6 & parcomp %in% c(0,3,4,5),"1-democracy", "0-non-democracy"),
           pitf = as.factor(pitf),
           pitf_binary = as.factor(pitf_binary))

  if(verbose) {
    message(sprintf("Resulting data has %d rows, fewer than Polity dataset, because of exclusion of interruption codes", nrow(pitf)))
  }

  pitf

}

prepare_svolik_regime <- function(
  path = "../../Data/svolik data/regime and no authority spells, country-year, 1946-2008.dta",
  verbose = TRUE,
  ...) {

  cname <- year <- ccode <- regime <- NULL

  regime_numeric <- NULL

  data <- read_data(path,
            verbose = verbose,
            name = 'Svolik regime data')

  svolik_regime <- data %>%
    country_year_coder(cname,
                       year,
                       ccode,
                       code_type = "cown",
                       verbose = verbose,
                       ...) %>%
    mutate(regime_numeric = plyr::mapvalues(regime,
                                            from = c("democracy",
                                                     "dictatorship",
                                                     "independence",
                                                     "no authority"),
                                            to = c(1, 0, NA, NA)),
           regime_numeric = as.numeric(regime_numeric)) %>%
    select(cname, ccode, year, regime, regime_numeric, everything())

  standardize_columns(svolik_regime, cname, ccode, verbose = verbose)


}

prepare_svolik_institutions <- function(
  path = "../../Data/institutions in dictatorships, 1946-2008/institutions in dictatorships, 1946-2008.dta",
  verbose = TRUE,
  ...) {

  cname <- year <- ccode <- NULL

  data <- read_data(path,
                    verbose = verbose,
                    ...)

  svolik_institutions <- data %>%
    mutate(cname = NA_character_) %>%
    country_year_coder(cname,
                       year,
                       ccode,
                       code_type = "cown",
                       verbose = verbose,
                       ...) %>%
    mutate_if(is.character, ~ifelse(. == ".", NA, .))

  standardize_columns(svolik_institutions, cname, ccode, verbose = verbose)

}

prepare_vanhanen <- function(
  path,
  verbose = TRUE,
  ...) {

  bv1 <- value <- index <- index_1 <- name <- index_2 <- index_3 <- year <- NULL
  vanhanen_competition <- vanhanen_participation <- vanhanen_democratization <- NULL
  Country <- NULL

  fi_loc <- readr::locale(decimal_mark = ",")

  data <- readr::read_delim(path, delim = ";") %>%
    tidyr::pivot_longer(dplyr::matches("q[0-9]")) %>%
    tidyr::separate(name, into = c("year", "index"), sep = "_") %>%
    dplyr::mutate(value = readr::parse_double(value, locale = fi_loc)) %>%
    dplyr::select(bv1:value) %>%
    dplyr::mutate(index = paste("index", index, sep = "_"),
                  year = stringr::str_remove(year, "q") %>%
                    as.numeric(),
           year = year + 1809) %>%
    tidyr::pivot_wider(id_cols = bv1:year, names_from = index, values_from = value) %>%
    dplyr::rename(vanhanen_competition = index_1,
           vanhanen_participation = index_2,
           vanhanen_democratization = index_3,
           Country = bv1) %>%
    dplyr::filter(!(is.na(vanhanen_competition) &
                      is.na(vanhanen_participation) &
                      is.na(vanhanen_democratization)))

  if(verbose) {
    message(sprintf("Converted to country-year format, the dataset has %d rows", nrow(data)))
  }

  vanhanen <- data %>%
    country_year_coder(Country,
                       year,
                       match_type = "country and code",
                       verbose = verbose,
                       ...)

  standardize_columns(vanhanen, Country, verbose = verbose)

}

prepare_anrr <- function(path = "DDCGdata_final.dta",
                         verbose = TRUE,
                         ...) {

  country_name <- wbcode <- year <- dem <- NULL

  anrr <- haven::read_dta(path)

  anrr <- anrr %>%
    dplyr::select(country_name, wbcode, year, dem) %>%
    dplyr::filter(!is.na(dem)) %>%
    dplyr::mutate(country_name = ifelse(str_detect(country_name, "ncipe"),
                                 "Sao Tome and Principe", country_name)) %>%
    country_year_coder(country_name,
                       year,
                       verbose = verbose,
                       ...)

  standardize_columns(anrr, country_name, wbcode, verbose = verbose)

}

# create_anrr_scores <- function(verbose = TRUE) {
#   anrr_data <- generate_democracy_scores_dataset(datasets = c("pacl", "bmr",
#                                                               "pacl_update",
#                                                               "fh",
#                                                               "polity_annual"),
#                                                  output_format = "wide",
#                                                  verbose = verbose)
#
#   fh <- download_fh(verbose = verbose, include_territories = TRUE)
#
#   anrr_data <- anrr_data %>%
#     left_join(fh %>% select(extended_country_name:in_GW_system, year,
#                             fh_total_reversed, fh_total, status))
#
#   anrr_data <- anrr_data %>%
#     mutate(anrr_dem = case_when(fh_total <= 10 & polity2 > 0 ~ 1,
#                                 fh_total <= 10 & is.na(polity2) & (pacl_update == 1 | bmr_democracy == 1) ~ 1,
#                                 is.na(fh_total) & polity2 > 0 & (pacl_update == 1 | bmr_democracy == 1) ~ 1,
#                                 (is.na(fh_total) & is.na(polity2)) & (pacl_update == 1 | bmr_democracy == 1) ~ 1,
#                                 (is.na(fh_total) & is.na(polity2) & is.na(pacl_update) & is.na(bmr_democracy)) ~ NA_real_,
#                                 TRUE ~ 0))
#
#   anrr_data <- anrr_data %>%
#     filter(year >= 1960) %>%
#     left_join(anrr)
#
# }
