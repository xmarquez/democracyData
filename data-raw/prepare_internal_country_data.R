# Targets code for revising the country_year_code internal data structure

# Load the necessary libraries

library(targets)
library(tarchetypes)
library(tidyverse)
library(countrycode)
library(testthat)
library(dplyr)
library(haven)
library(vdemdata)
library(fs)
library(lubridate)
library(janitor)
library(here)

# Set target options
tar_option_set(
  packages = c("tidyverse", "countrycode", "testthat", "dplyr",
               "vdemdata", "haven", "fs", "lubridate", "janitor", "here"),
  imports = c("countrycode")
)


# Helper functions

find_sequence_breaks <- function(x, step = 1) {
  diffs <- diff(x)
  breaks <- diffs > step
  result <- c(1, cumsum(breaks) + 1)
  return(result)
}

fill_if_unique <- function(x) {
  l <- length(x)
  if(n_distinct(x, na.rm = TRUE) == 1) {
    res <- na.omit(x) |>
      unique() |>
      rep(l)
  } else {
    res <- x
  }
  res
}

# List of targets
internal_country_data <- list(
  # 3.1 Gleditsch and Ward Panel
  tar_target(
    gw_files,
    fs::dir_ls(here::here("data-raw/gw-files"), glob = "*.dat"),
    format = "file"
  ),

  tar_target(
    gw_system,
    read_tsv(gw_files[1], col_names = FALSE, col_types = "icccc") |>
      set_names(c("gwn", "gwc", "GW_country_name", "GW_startdate", "GW_enddate")) |>
      mutate(
        across(ends_with("date"), ~ as_date(.x, format = "%d:%m:%Y")),
        across(ends_with("enddate"), ~ if_else(.x == max(.x), NA, .x))
      )
  ),

  tar_target(
    gw_microstates,
    read_tsv(gw_files[2], col_names = FALSE, col_types = "icccc") |>
      set_names(c("gwn", "gwc", "GW_country_name", "GW_startdate", "GW_enddate")) |>
      mutate(
        across(ends_with("date"), ~ as_date(.x, format = "%d:%m:%Y")),
        across(ends_with("enddate"), ~ if_else(.x == max(.x), NA, .x))
      )
  ),

  tar_target(
    gw_panel,
    bind_rows(gw_system, gw_microstates) |>
      group_by(gwn, GW_country_name) |>
      mutate(GW_group = seq_along(gwn)) |>
      ungroup() |>
      mutate(gwn = as.character(gwn)) |>
      pivot_longer(gwn:gwc, names_to = "code") |>
      rename_with(tolower) |>
      filter(!is.na(value)) |>
      mutate(panel = "Gleditsch and Ward") |>
      rename_with(~ str_remove(.x, "gw_"))
  ),

  # 3.2 V-Dem Panel
  tar_target(
    vdem_panel,
    vdemdata::vdem |>
      as_tibble() |>
      select(country_name:COWcode) |>
      distinct(country_name, country_text_id, country_id, year, historical_date, COWcode) |>
      group_by(across(-all_of(c("year", "historical_date")))) |>
      mutate(vdem_group = find_sequence_breaks(year)) |>
      summarise(
        vdem_startdate = ymd(paste(min(year), "01-01", sep = "-")),
        vdem_enddate = max(historical_date)
      ) |>
      ungroup() |>
      rename(
        vdem_country_name = country_name,
        cown = COWcode,
        vdem = country_id,
        vdem_text_id = country_text_id
      ) |>
      mutate(
        vdem_enddate = case_when(
          vdem_enddate == max(vdem_enddate, na.rm = TRUE) ~ NA,
          TRUE ~ vdem_enddate
        ),
        cown = as.character(cown),
        vdem = as.character(vdem)
      ) |>
      pivot_longer(all_of(c("vdem", "vdem_text_id", "cown")), names_to = "code") |>
      filter(!is.na(value)) |>
      rename_with(~ str_remove(.x, "vdem_")) |>
      mutate(panel = "V-Dem 2024")
  ),

  # 3.3 COW Panel
  tar_download(
    cow_panel_csv,
    urls = "https://correlatesofwar.org/wp-content/uploads/states2016.csv",
    paths = "data-raw/cow_panel.csv"),

  tar_target(
    cow_panel,
    read_csv(cow_panel_csv) |>
      rename(
        cow_country_name = statenme,
        cown = ccode,
        cowc = stateabb
      ) |>
      mutate(
        startdate = ymd(paste(styear, stmonth, stday, sep = "-")),
        enddate = ymd(paste(endyear, endmonth, endday, sep = "-"))
      ) |>
      select(-styear, -stmonth, -stday, -endyear, -endmonth, -endday, -version) |>
      mutate(
        enddate = case_when(
          enddate == "2016-12-31" ~ NA,
          TRUE ~ enddate
        )
      ) |>
      group_by(cown) |>
      arrange(startdate) |>
      mutate(group = seq_along(cown)) |>
      ungroup() |>
      mutate(cown = as.character(cown)) |>
      pivot_longer(cown:cowc, names_to = "code") |>
      filter(!is.na(value)) |>
      rename(country_name = cow_country_name) |>
      mutate(panel = "COW 2016")
  ),

  # 3.4 Polity5 Panel
  tar_url(
    polity5_panel_url,
    command = "http://www.systemicpeace.org/inscr/p5v2018d.sav"),

  tar_target(
    polity5_panel,
    haven::read_sav(polity5_panel_url) |>
      select(ccode, scode, country, bmonth, bday, byear, emonth, eday, eyear) |>
      rename(
        polity5_country = country,
        polity_ccode = ccode,
        polity_scode = scode
      ) |>
      mutate(
        polity_startdate = ymd(paste(byear, bmonth, bday, sep = "-")),
        polity_enddate = ymd(paste(eyear, emonth, eday, sep = "-")),
        next_startdate = lead(polity_startdate),
        days_between = as.numeric(next_startdate - polity_enddate, units = "days"),
        days_between = ifelse(is.na(days_between), 1, days_between)
      ) |>
      group_by(polity_ccode) |>
      mutate(group = find_sequence_breaks(days_between, step = 0)) |>
      group_by(polity5_country, polity_ccode, polity_scode, group) |>
      summarise(
        polity_startdate = min(polity_startdate),
        polity_enddate = max(polity_enddate)
      ) |>
      ungroup() |>
      mutate(
        polity_ccode = as.character(polity_ccode)
      ) |>
      pivot_longer(polity_ccode:polity_scode, names_to = "code") |>
      filter(!is.na(value)) |>
      rename(
        startdate = polity_startdate,
        enddate = polity_enddate,
        country_name = polity5_country
      ) |>
      mutate(
        panel = "Polity5 v2018",
        enddate = case_when(
          enddate == max(enddate, na.rm = TRUE) ~ NA,
          TRUE ~ enddate
        )
      )
  ),

  # 3.5 Countrycode Panel
  tar_target(
    countrycode_codelist,
    countrycode::codelist |>
      janitor::clean_names() |>
      select(-starts_with("cldr"))
  ),

  tar_target(
    code_types,
    countrycode_codelist |>
      pivot_longer(where(is.numeric), names_to = "code_type") |>
      relocate(country_name_en, code_type, value) |>
      filter(!is.na(value), !str_detect(code_type, "region")) |>
      pull(code_type) |>
      unique()
  ),

  tar_target(
    countrycode_panel,
    countrycode::codelist_panel |>
      janitor::clean_names() |>
      select(country_name_en, year, cowc:wvs) |>
      mutate(across(where(is.numeric), as.character)) |>
      mutate(year = as.numeric(year)) |>
      pivot_longer(gwn:wvs, names_to = "code") |>
      filter(!is.na(value)) |>
      group_by(country_name_en, code, value) |>
      mutate(group = find_sequence_breaks(year)) |>
      group_by(country_name_en, code, value, group) |>
      summarise(
        countrycode_startdate = min(ymd(paste(year, "01-01", sep = "-"))),
        countrycode_enddate = max(ymd(paste(year, "12-31", sep = "-")))
      ) |>
      ungroup() |>
      mutate(
        countrycode_enddate = case_when(
          countrycode_enddate == max(countrycode_enddate, na.rm = TRUE) ~ NA,
          code == "p5n" & countrycode_enddate == ymd("2018-12-31") ~ NA,
          TRUE ~ countrycode_enddate
        )
      ) |>
      filter(!is.na(value)) |>
      rename(
        country_name = country_name_en,
        startdate = countrycode_startdate,
        enddate = countrycode_enddate
      ) |>
      mutate(
        panel = "countrycode package 2025",
        enddate = ymd(enddate),
        enddate = case_when(
          enddate == ymd("2018-12-31") ~ NA,
          enddate == ymd("2020-12-31") ~ NA,
          TRUE ~ enddate
        )
      )
  ),

  # 3.6 Existing Panel Codes
  tar_file(
    existing_panel_codes_file,
    here::here("data-raw/data.csv")
  ),

  tar_target(
    existing_panel_codes,
    read_csv(existing_panel_codes_file) |>
      distinct(
        extended_country_name, GWn, GWc, cown, cowc,
        polity_ccode, polity_scode,
        extended_GWn
      ) |>
      rename_with(tolower) |>
      mutate(across(everything(), as.character)) |>
      pivot_longer(gwn:polity_scode, names_to = "code") |>
      filter(!is.na(value))
  ),

  # 3.7 Tests for Panel Integrity
  tar_target(
    test_existing_panel_not_in_cow,
    expect_equal(
      existing_panel_codes |>
        filter(str_detect(code, "cow")) |>
        anti_join(cow_panel, by = c("code", "value")) |>
        nrow(),
      0
    )
  ),

  tar_target(
    test_cow_not_in_existing,
    expect_equal(
      cow_panel |>
        anti_join(existing_panel_codes |>
                    filter(str_detect(code, "cow")), by = c("code", "value")) |>
        nrow(),
      0
    )
  ),

  tar_target(
    test_existing_panel_not_in_polity,
    expect_equal(
      existing_panel_codes |>
        filter(str_detect(code, "polity_.code")) |>
        anti_join(polity5_panel, by = c("code", "value")) |>
        nrow(),
      35
    )
  ),

  tar_target(
    test_polity_not_in_existing,
    expect_equal(
      polity5_panel |>
        anti_join(existing_panel_codes |>
                    filter(str_detect(code, "polity_.code")), by = c("code", "value")) |>
        nrow(),
      0
    )
  ),

  tar_target(
    test_existing_panel_not_in_gw,
    expect_equal(
      existing_panel_codes |>
        filter(str_detect(code, "^gw.")) |>
        anti_join(gw_panel, by = c("code", "value")) |>
        nrow(),
      5
    )
  ),

  tar_target(
    test_gw_not_in_existing,
    expect_equal(
      gw_panel |>
        anti_join(existing_panel_codes |>
                    filter(str_detect(code, "^gw.")), by = c("code", "value")) |>
        nrow(),
      0
    )
  ),

  # 3.8 Combine Panels and Harmonize
  tar_target(
    existing_panel_codes_full,
    existing_panel_codes |>
      full_join(bind_rows(cow_panel, gw_panel, polity5_panel, vdem_panel, countrycode_panel)) |>
      group_by(country_name) |>
      mutate(extended_country_name = fill_if_unique(extended_country_name)) |>
      ungroup() |>
      mutate(
        extended_country_name = case_when(
          country_name == "Brunswick" ~ "Brunswick",
          country_name == "Hamburg" ~ "Hamburg",
          country_name == "Piedmont-Sardinia" ~ "Italy/Sardinia",
          country_name == "Saxe-Weimar-Eisenach" ~ "Saxe-Weimar-Eisenach",
          country_name == "Oldenburg" ~ "Oldenburg",
          country_name == "Nassau" ~ "Nassau",
          country_name == "Somaliland" ~ "Somaliland",
          country_name == "Micronesia (Federated States of)" ~ "Federated States of Micronesia",
          country_name == "Palestinian Territories" ~ "Palestine, State of",
          country_name == "Prussia" ~ "Germany (Prussia)",
          country_name == "United Province CA" ~ "United Provinces of Central America",
          country_name == "São Tomé & Príncipe" ~ "Sao Tome and Principe",
          country_name == "St. Vincent & Grenadines" ~ "Saint Vincent and the Grenadines",
          country_name == "St. Kitts & Nevis" ~ "Saint Kitts and Nevis",
          str_detect(country_name, "Hong Kong") ~ "Hong Kong",
          country_name == "South Korea" & is.na(extended_country_name) &
            enddate <= ymd("1905-12-31") ~ "Korea",
          country_name == "South Korea" & is.na(extended_country_name) &
            is.na(enddate) ~ "Korea, Republic of",
          country_name == "South Korea" & is.na(extended_country_name) &
            enddate <= ymd("1910-12-31") ~ "Korea",
          country_name == "Austria" & is.na(extended_country_name) &
            enddate <= ymd("1918-12-31") ~ "Austria-Hungary",
          country_name == "Austria" & is.na(extended_country_name) &
            startdate >= ymd("1919-01-01") ~ "Austria",
          country_name == "Austria" & is.na(extended_country_name) &
            !is.na(enddate) ~ "Austria-Hungary",
          country_name == "Austria" & is.na(extended_country_name) &
            is.na(enddate) ~ "Austria",
          country_name == "Czechia" & is.na(extended_country_name) &
            enddate <= ymd("1992-12-31") ~ "Czechoslovakia",
          country_name == "Czechia" & is.na(extended_country_name) &
            is.na(enddate) ~ "Czech Republic",
          str_detect(country_name, "Palestine") &
            is.na(extended_country_name) ~ country_name,
          country_name == "Germany" & is.na(extended_country_name) &
            enddate <= ymd("1944-12-31") ~ "Germany (Prussia)",
          country_name == "Germany" &
            enddate <= ymd("1933-07-14") ~ "Germany (Prussia)",
          country_name == "Germany" & is.na(extended_country_name) &
            enddate <= ymd("1990-12-31") ~ "German Federal Republic",
          country_name == "Germany" &
            is.na(enddate) ~ "German Federal Republic",
          str_detect(country_name, "Serbia") &
            is.na(extended_country_name) ~ country_name,
          country_name == "Colombia" & is.na(extended_country_name) &
            is.na(enddate) ~ "Colombia",
          country_name == "Colombia" & is.na(extended_country_name) &
            enddate <= ymd("1831-12-31")  ~ "Great Colombia",
          country_name == "Vietnam" & is.na(extended_country_name) &
            startdate >= ymd("1954-01-01") ~ "Vietnam, Democratic Republic of",
          country_name == "Vietnam" & is.na(extended_country_name) &
            !is.na(enddate) ~ "Vietnam (Annam/Cochin China/Tonkin)",
          country_name == "Vietnam" & is.na(extended_country_name) &
            startdate >= ymd("1945-01-01") &
            is.na(enddate) ~ "Vietnam, Democratic Republic of",
          country_name == "Yugoslavia" &
            is.na(extended_country_name) ~ "Yugoslavia",
          TRUE ~ extended_country_name
        )
      ) |>
      mutate(
        extended_country_name = case_when(
          extended_country_name == "Palestine/British Mandate" ~ "British Mandate of Palestine",
          TRUE ~ extended_country_name
        )
      )
  ),

  # 3.9 Additional Targets for Existing Panel Harmonization
  tar_target(
    non_self_governing,
    existing_panel_codes |>
      filter(
        extended_country_name %in% setdiff(existing_panel_codes$extended_country_name,
                                           existing_panel_codes_full$extended_country_name)
      ) |>
      mutate(
        group = 1,
        panel = "FH Non Self Governing"
      )
  ),

  tar_target(
    extra_fh_territories,
    tibble(
      extended_country_name = c(
        "Crimea", "Eastern Donbas", "Nagorno-Karabakh", "Transnistria",
        "Chechnya", "Kurdistan", "Northern Ireland", "Northern Cyprus",
        "Indian Kashmir", "Pakistani Kashmir", "Kashmir",
        "West Papua"
      ),
      GW_membership      = FALSE,
      cow_membership     = FALSE,
      polity_membership  = FALSE,
      extended_continent = c(
        "Europe", "Europe", "Asia", "Europe",
        "Asia", "Asia", "Europe", "Asia",
        "Asia",  "Asia",  "Asia",
        "Asia"
      ),
      extended_region = c(
        "Eastern Europe", "Eastern Europe", "Western Asia", "Eastern Europe",
        "Western Asia", "Western Asia", "Northern Europe", "Western Asia",
        "Southern Asia", "Southern Asia", "Southern Asia",
        "South-Eastern Asia"
      ),
      lat = c(
        45.300000, 48.002778, 39.815278, 46.840278,
        43.400000, 35.557222, 54.596389, 35.183333,
        34.500000, 33.843333, 34.083333,
        -0.866667
      ),
      lon = c(
        34.400000, 37.805278, 46.751944, 29.643333,
        45.716667, 45.435556,  -5.930000, 33.366667,
        76.500000, 73.851389, 74.797222,
        134.083333
      ),
      regex = c(
        "crimea|crimean peninsula",
        "donbas",
        "artsakh|nagorno\\.karabakh|karabakh",
        "transnistria",
        "chechnya",
        "kurdistan",
        "northern ireland",
        "\\bn.+cyprus",
        "^in.*kashmir",
        "^pak.*kashmir",
        "^kashmir$",
        "\\bw.+papua"
      ),
      code  = "gwn",
      value = NA_character_,
      group = 1,
      panel = "FH Non Self Governing"
    )
  ),


  tar_target(
    all_countries,
    existing_panel_codes_full |>
      bind_rows(non_self_governing) |>
      bind_rows(extra_fh_territories) |>
      select(-regex) |>
      mutate(
        country_name = if_else(is.na(country_name), extended_country_name, country_name),
        panel = case_when(
          is.na(panel) & str_detect(code, "extended") ~ "Extended Gleditsch and Ward",
          TRUE ~ panel
        )
      ) |>
      group_by(extended_country_name) |>
      mutate(
        startdate = if_else(is.na(startdate), min(startdate, na.rm = TRUE), startdate),
        enddate = if_else(is.na(enddate), max(enddate, na.rm = FALSE), enddate)
      ) |>
      ungroup() |>
      mutate(
        startdate = if_else(is.infinite(startdate), NA_Date_, startdate),
        panel = case_when(
          is.na(panel) & code == "gwc" ~ "Corrected Gleditsch and Ward?",
          is.na(panel) & code == "polity_ccode" ~ "Polity4 with microstates?",
          TRUE ~ panel
        ),
        panel_abbreviation = case_when(
          str_detect(panel, "COW") ~ "cow",
          str_detect(panel, "Gleditsch") ~ "gw",
          str_detect(panel, "Polity") ~ "polity",
          str_detect(panel, "FH") ~ "fh",
          str_detect(panel, "V-Dem") ~ "vdem",
          str_detect(panel, "countrycode")  ~ "countrycode",
          TRUE ~ NA_character_
        )
      )
  ),

  # 3.10 Tests After Harmonization
  # tar_target(
  #   test_no_na,
  #   expect_equal(
  #     all_countries |>
  #       filter(is.na(value)) |>
  #       nrow(),
  #     11
  #   )
  # ),

  # tar_target(
  #   test_no_countries_with_na,
  #   expect_equal(
  #     all_countries |>
  #       filter(is.na(extended_country_name)) |>
  #       nrow(),
  #     0
  #   )
  # ),

  # tar_target(
  #   test_missing_countries,
  #   expect_equal(
  #     setdiff(all_countries$extended_country_name, existing_panel_codes_full$extended_country_name) |>
  #       length(),
  #     11
  #   )
  # ),

  # tar_target(
  #   test_new_countries,
  #   expect_equal(
  #     setdiff(all_countries$extended_country_name, existing_panel_codes$extended_country_name) |>
  #       length(),
  #     22
  #   )
  # ),

  # 3.11 Missing Data and Regexes
  tar_target(
    missing_data,
    tibble(
      extended_country_name = c(
        "Brunswick", "Hamburg", "Nassau", "Oldenburg",
        "Palestine/Gaza", "Palestine/West Bank", "Saxe-Weimar-Eisenach",
        "Bukhara", "Cape Colony", "Hejaz", "Khiva", "Natal",
        "Newfoundland", "Saint Martin", "Sikkim", "Tanganyika",
        "Leeward Islands Federation", "West Indies Federation", "Kashmir",
        "Russian-occupied territories of Ukraine", "Vichy France"),
      GW_membership = FALSE,
      cow_membership = FALSE,
      polity_membership = FALSE,
      extended_continent = c(
        "Europe", "Europe", "Europe", "Europe",
        "Asia", "Asia", "Europe",
        "Asia", "Africa", "Asia", "Asia", "Africa",
        "Americas", "Americas", "Asia", "Africa",
        "Americas", "Americas", "Asia", "Europe", "Europe"),
      extended_region = c(
        "Western Europe", "Western Europe", "Western Europe", "Western Europe",
        "Western Asia", "Western Asia", "Western Europe",
        "Central Asia", "Southern Africa", "Western Asia", "Central Asia",
        "Southern Africa", "Northern America", "Caribbean", "South Asia", "Eastern Africa",
        "Caribbean", "Caribbean", "South Asia", "Eastern Europe", "Western Europe"
      ),
      lat = c(
        52.2659, 53.5511, 50.0878, 53.1439,
        31.5017, 31.9522, 50.9794,
        39.7670, -33.9249, 21.5000, 41.3880, -29.8587,
        47.5615, 18.0708, 27.3389, -6.1630,
        17.05, 10.65, 34.0837, 47.3333, 46.13
      ),
      lon = c(
        10.5226, 9.9937, 8.2400, 8.2147,
        34.4668, 35.2332, 11.3297,
        64.4220, 18.4241, 39.5000, 60.3590, 31.0218,
        -52.7126, -63.0501, 88.6065, 35.7516,
        -61.80, -61.50, 74.7973, 37.9833, 3.43
      ),
      regex = c(
        "brunswick", "hamburg", "nassau", "oldenburg",
        "gaza", "west.?bank", "saxe.?weimar.?eisenach",
        "bukhara", "cape.?colony", "hejaz", "khiva", "natal",
        "newfoundland", "saint.?martin", "sikkim", "tanganyika",
        "leeward.?island(s)?.?f?", "west.?indies.?f", "^kashmir$",
        "^russian-occupied territories of ukraine$",
        "vichy.*france|france.*vichy")
    )
  ),

  tar_target(
    old_regexes,
    read_csv(existing_panel_codes_file) |>
      distinct(extended_country_name, regex, lat, lon, extended_region, extended_continent) |>
      bind_rows(extra_fh_territories |> distinct(extended_country_name, regex, lat, lon, extended_region, extended_continent),
                missing_data)
  ),

  tar_target(
    test_all_countries_have_regexes,
    expect_equal(
      anti_join(all_countries, old_regexes, by = "extended_country_name") |>
        nrow(),
      0
    )
  ),
  tar_target(
    full_codes,
    all_countries |>
      select(extended_country_name, code, panel_abbreviation) |>
      distinct() |>
      expand(extended_country_name, code, panel_abbreviation)
  ),

  tar_target(
    all_countries_full_data,
    left_join(all_countries, old_regexes |>
                select(extended_country_name, regex)) |>
      distinct() |>
      group_by(extended_country_name) |>
      mutate(
        countrycode_regex = countrycode_codelist$country_name_en_regex[
          match(country_name, countrycode_codelist$country_name_en)
        ],
        countrycode_regex = fill_if_unique(countrycode_regex),
        GW_membership = if_else(any(panel_abbreviation == "gw"), TRUE, FALSE),
        cow_membership = if_else(any(panel_abbreviation == "cow"), TRUE, FALSE),
        polity_membership = if_else(any(panel_abbreviation == "polity"), TRUE, FALSE)
      ) |>
      ungroup() |>
      left_join(full_codes) |>
      group_by(extended_country_name) |>
      mutate(
        group = fill_if_unique(group),
        regex = fill_if_unique(regex),
        lat = fill_if_unique(lat),
        lon = fill_if_unique(lon),
        country_name = fill_if_unique(country_name),
        extended_region = fill_if_unique(extended_region),
        extended_continent = fill_if_unique(extended_continent),
        GW_membership = fill_if_unique(GW_membership),
        cow_membership = fill_if_unique(cow_membership),
        polity_membership = fill_if_unique(polity_membership),
        countrycode_regex = fill_if_unique(countrycode_regex)
      ) |>
      ungroup() |>
      mutate(code = case_when(
        code == "gwn" ~ "GWn",
        code == "gwc" ~ "GWc",
        TRUE ~ code
      ))
  ),

  tar_target(
    data,
    bind_rows(democracyData:::data, missing_data) |>
      distinct() |>
      mutate(regex = case_when(
        str_detect(extended_country_name, "Turkey") ~ "turkey|ottoman|türkiye|turkey|t(ü|u)rkiye|t(.){2}rkiye",
        str_detect(extended_country_name, "Nagorno-Karabakh") ~ "nagorno.karabakh|artsakh",
        str_detect(extended_country_name, "Northern Cyprus") ~ "\\bn.+cyprus|cyprus.+northern",
        str_detect(extended_country_name, "Indian Kashmir") ~ "^in.*kashmir|kashmir.*in",
        str_detect(extended_country_name, "Pakistani Kashmir") ~ "^pak.*kashmir|kashmir.*pak",
        str_detect(extended_country_name, "Pakistan") ~ "^(?!.*east)(?!.*kashmir).*paki?stan(?!.*kashmir)",
        str_detect(extended_country_name, "India") ~ "(?!.*kashmir.*)\\bindia\\b(?!.*ocea)(?!.*kashmir)",
        str_detect(extended_country_name, "Italy") ~ "italy|sardinia|italy|italian.?republic",
        extended_country_name == "France" ~ "^(?!.*vichy)(?!.*\\bdep)(?!.*martinique).*france(?!.*vichy)|french.?republic|\\bgaul",
        extended_country_name == "Vichy France" ~ "vichy.*france|france.*vichy",
        extended_country_name == "British Mandate of Palestine" ~ "mandat.*palestine|british.*palestine|palestine.*british",
        extended_country_name == "Palestine, State of" ~ "^(?!.*british.*)(?!.*gaza.*)(?!.*west bank.*)palestin(?!.*british.*)(?!.*gaza.*)(?!.*west bank.*)|west bank and gaza|gaza and west bank",
        extended_country_name == "Vietnam (Annam/Cochin China/Tonkin)" ~ "^(?!.*republic)^(?!.*dem).*viet.?nam(?!.*democratic republic)|^(?!south)(?!republic).*viet.?nam(?!.*south)|democratic.republic.of.vietnam|socialist.republic.of.viet.?nam|north.viet.?nam|viet.?nam.north",
        extended_country_name == "Vietnam, Democratic Republic of" ~ "^(?!.*republic)(?!.*south).*viet.?nam(?!.*south)(?!.*s$)|^(?=.*socialist)(?!.*south).*viet.?nam(?!.*south)|(?!.*south).*viet.?nam.*(?=.*socialist)|viet.?nam.*(?=.*democr)|(?=.*democr).*viet.?nam|^(?!.*south)(?!.*republic).*viet.?nam|democratic.republic.of.vietnam|socialist.republic.of.viet.?nam|north.viet.?nam|viet.?nam.north|vietnam, n",
        extended_country_name == "Russia (Soviet Union)" ~ "\\brussia(?!.*ukrain)|soviet.?union|u\\.?s\\.?s\\.?r|socialist.?republics",
        extended_country_name == "Ukraine" ~ "^(?!russian-occupied territories of).*ukrain",
        extended_country_name == "Israel" ~ "israel(?!.+occupied)",
        TRUE ~ regex
      )) |>
      filter(extended_country_name != "^kashmir$",
             extended_country_name != "Piedmont-Sardinia") 
  ),

  tar_file(
    url_list_file,
    here::here("data-raw/url-list.csv")
  ),

  tar_target(
    url_list,
    read_csv(url_list_file)
  ),

  # 3.13 Save and Export Data
  tar_target(
    save_data,
    usethis::use_data(data, url_list, overwrite = TRUE, internal = TRUE) |>
      c("R/sysdata.rda"),
    format = "file"
  )
)



