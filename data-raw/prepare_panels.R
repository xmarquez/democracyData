library(tidyverse)
library(countrycode)
library(vdemdata)
library(testthat)

find_sequence_breaks <- function(x, step = 1) {
  # Calculate the differences between consecutive elements
  diffs <- diff(x)
  # Determine where the breaks are (where the difference is greater than the step)
  breaks <- diffs > step
  # Use cumsum to accumulate the breaks, adding 1 to each subsequent break
  result <- c(1, cumsum(breaks) + 1)

  return(result)
}

# vdem_panel --------------------------------

vdem_panel <- vdemdata::vdem |>
  as_tibble() |>
  select(country_name:COWcode) |>
  distinct(country_name, country_text_id, country_id, year, historical_date, histname, COWcode) |>
  group_by(across(-all_of(c("year", "historical_date", "histname")))) |>
  mutate(vdem_group = find_sequence_breaks(year)) |>
  group_by(across(-all_of(c("year", "historical_date", "histname")))) |>
  summarise(vdem_startdate = ymd(paste(min(year), "01-01", sep = "-")),
            vdem_enddate = max(historical_date),
            vdem_historical_names = list(unique(histname))) |>
  ungroup() |>
  rename(vdem_country_name = country_name,
         vdem_cown = COWcode,
         vdem = country_id,
         vdem_text_id = country_text_id) |>
  mutate(vdem_enddate = case_when(
    vdem_enddate == max(.data$vdem_enddate, na.rm = TRUE) ~ NA,
    TRUE ~ vdem_enddate))

# countrycode_codelist and code types ----------------------------

countrycode_codelist <- countrycode::codelist |>
  janitor::clean_names() |>
  select(-starts_with("cldr")) |>
  pivot_longer(where(is.numeric), names_to = "code_type")  |>
  relocate(country_name_en, code_type, value) |>
  filter(!is.na(value), !str_detect(code_type, "region"))

code_types <- countrycode_codelist$code_type |>
  unique()

# countrycode_panel --------------------------------

countrycode_panel <- countrycode::codelist_panel |>
  janitor::clean_names() |>
  pivot_longer(all_of(code_types[code_types != "vdem"]), names_to = "code_type")  |>
  relocate(country_name_en, code_type, value) |>
  filter(!str_detect(code_type, "region")) |>
  group_by(country_name_en, code_type, value) |>
  mutate(group = find_sequence_breaks(year)) |>
  group_by(country_name_en, code_type, value, group, vdem) |>
  summarise(countrycode_startdate = ymd(paste(min(year), "01-01", sep = "-")),
            countrycode_enddate = ymd(paste(max(year), "12-31", sep = "-"))) |>
  group_by(code_type) |>
  mutate(countrycode_enddate = case_when(countrycode_enddate == max(countrycode_enddate) ~ NA,
                             TRUE ~ countrycode_enddate),
         code_type = case_when(code_type == "gwn" ~ "GWn",
                               TRUE ~ code_type)) |>
  ungroup() |>
  mutate(countrycode_enddate = case_when(code_type == "p5n" &
                                           countrycode_enddate == "2018-12-31" ~ NA,
                                         code_type == "cown" &
                                           countrycode_enddate == "2020-12-31" ~ NA,
                                         code_type == "GWn" &
                                           countrycode_enddate == "2020-12-31" ~ NA,
                                         TRUE ~ countrycode_enddate)) |>
  group_by(country_name_en, code_type, value, group) |>
  fill(vdem) |>
  arrange(code_type, value, group, countrycode_startdate, countrycode_enddate) |>
  group_by(country_name_en, code_type, value, vdem, group) |>
  summarise(countrycode_startdate = min(countrycode_startdate),
            countrycode_enddate = case_when(any(is.na(countrycode_enddate)) ~ NA,
                                            TRUE ~ max(countrycode_enddate)))

countrycode_panel <- countrycode_panel |>
  left_join(vdem_panel |>
              select(vdem, vdem_group, vdem_country_name, matches("date")))

vdem_remaining <- vdem_panel |>
  filter(!vdem %in% countrycode_panel$vdem) |>
  select(-vdem_historical_names, -vdem_text_id) |>
  rename(cown = "vdem_cown") |>
  pivot_longer(cown, names_to = "code_type") |>
  mutate(country_name_en = "Palestinian Territories",
         group = vdem_group,
         countrycode_startdate = vdem_startdate,
         countrycode_enddate = vdem_enddate)

countrycode_panel <- countrycode_panel |>
  bind_rows(vdem_remaining)

# cow_panel --------------------------------

cow_panel <- read_csv("https://correlatesofwar.org/wp-content/uploads/states2016.csv") |>
  rename(cow_country_name = statenme,
         cown = ccode,
         cowc = stateabb,
         cow_version = version) |>
  mutate(cow_startdate = ymd(paste(styear, stmonth, stday, sep = "-")),
         cow_enddate = ymd(paste(endyear, endmonth, endday, sep = "-"))) |>
  select(-starts_with("st"),-starts_with("end")) |>
  mutate(cow_enddate = case_when(cow_enddate == "2016-12-31" ~ NA,
                                 TRUE ~ cow_enddate))

# polity5_panel  --------------------------------

polity5_panel <- haven::read_sav("http://www.systemicpeace.org/inscr/p5v2018d.sav") |>
  select(ccode, scode, country, bmonth, bday, byear, emonth, eday, eyear) |>
  rename(polity5_country = country,
         polity_ccode = ccode,
         polity_scode = scode) |>
  mutate(polity_startdate = ymd(paste(byear, bmonth, bday, sep = "-")),
         polity_enddate = ymd(paste(eyear, emonth, eday, sep = "-")),
         next_startdate = lead(polity_startdate),
         days_between = (next_startdate - polity_enddate) |>
           as.numeric(units = "days"),
         days_between = ifelse(is.na(days_between), 1, days_between)) |>
  group_by(polity_ccode) |>
  mutate(group = find_sequence_breaks(days_between, step = 0)) |>
  group_by(polity5_country, polity_ccode, polity_scode, group) |>
  summarise(polity_startdate = min(polity_startdate),
            polity_enddate = max(polity_enddate))

# existing_panel --------------------------------------------------------

existing_panel <- read_csv(here::here("data-raw/internal_country_year_coder_data.csv")) |>
  pivot_longer(any_of(c("GWn", "extended_GWn",
                        "cown", "polity_ccode",
                        code_types)), names_to = c("code_type")) |>
  relocate(extended_country_name, code_type, value) |>
  select(extended_country_name, code_type, value, matches("date"), regex, GW_membership:lon,
         extended_region, extended_continent, microstate) |>
  mutate(matching_date = case_when(str_detect(code_type, "GWn") ~ "GW_",
                                   str_detect(code_type, "cown") ~ "cow_",
                                   str_detect(code_type, "polity") ~ "polity",
                                   TRUE ~ "unofficial")) |>
  pivot_longer(matches("startdate"), names_to = "startdate_type", values_to = "startdate") |>
  filter(str_detect(startdate_type, matching_date))|>
  pivot_longer(matches("enddate"), names_to = "enddate_type", values_to = "enddate") |>
  filter(str_detect(enddate_type, matching_date)) |>
  select(-matching_date)

existing_panel_no_na <- existing_panel |>
  filter(!is.na(value))

not_added <- existing_panel |>
  filter(!extended_country_name %in% existing_panel_no_na$extended_country_name) |>
  mutate(vdem_country_name = case_when(extended_country_name == "British Mandate of Palestine" ~ "Palestine/British Mandate",
                                       TRUE ~ "Somaliland")) |>
  select(-code_type, -value) |>
  distinct() |>
  left_join(countrycode_panel) |>
  distinct()


# data ---------------------------------------------------
countrycode_panel <- countrycode_panel |>
  group_by(country_name_en) |>
  mutate(all_codes_NA = all(is.na(value))) |>
  filter(all_codes_NA | !is.na(value)) |>
  filter(code_type %in% c(unique(existing_panel_no_na$code_type), "vdem"))

data <- existing_panel_no_na |>
  full_join(countrycode_panel) |>
  bind_rows(not_added) |>
  mutate(startdate = case_when(is.na(startdate) ~ countrycode_startdate,
                               TRUE ~ startdate),
         enddate = case_when(is.na(enddate) ~ countrycode_enddate,
                               TRUE ~ enddate)) |>
  select(-countrycode_startdate, -countrycode_enddate, -matches("date_type")) |>
  distinct()  |>
  mutate(extended_country_name = case_when(!is.na(extended_country_name) ~ extended_country_name,
                                           is.na(extended_country_name) & is.na(vdem_country_name) ~ country_name_en,
                                           is.na(extended_country_name) ~ vdem_country_name,
                                           TRUE ~ extended_country_name),
         polity_membership = case_when(is.na(polity_membership) ~ FALSE,
                                       TRUE ~ polity_membership),
         cow_membership = case_when(is.na(cow_membership) ~ FALSE,
                                    TRUE ~ cow_membership),
         GW_membership = case_when(is.na(GW_membership) ~ FALSE,
                                   TRUE ~ GW_membership),
         extended_continent = case_when(country_name_en == "Brunswick" ~ "Europe",
                                        country_name_en == "Hamburg" ~ "Europe",
                                        country_name_en == "Nassau" ~ "Europe",
                                        country_name_en == "Oldenburg" ~ "Europe",
                                        country_name_en == "Piedmont-Sardinia" ~ "Europe",
                                        country_name_en == "Saxe-Weimar-Eisenach" ~ "Europe",
                                        country_name_en == "Würtemberg" ~ "Europe",
                                        country_name_en == "Hesse-Darmstadt" ~ "Europe",
                                        country_name_en == "Hesse-Kassel" ~ "Europe",
                                        TRUE ~ extended_continent),
         extended_region = case_when(country_name_en == "Brunswick" ~ "Western Europe",
                                     country_name_en == "Hamburg" ~ "Western Europe",
                                     country_name_en == "Nassau" ~ "Western Europe",
                                     country_name_en == "Oldenburg" ~ "Western Europe",
                                     country_name_en == "Piedmont-Sardinia" ~ "Southern Europe",
                                     country_name_en == "Saxe-Weimar-Eisenach" ~ "Western Europe",
                                     country_name_en == "Würtemberg" ~ "Western Europe",
                                     country_name_en == "Hesse-Darmstadt" ~ "Western Europe",
                                     country_name_en == "Hesse-Kassel" ~ "Western Europe",
                                     TRUE ~ extended_region),
         lat = case_when(country_name_en == "Brunswick" ~ 52.266667,
                         country_name_en == "Hamburg" ~ 53.55,
                         country_name_en == "Nassau" ~ 50.315833,
                         country_name_en == "Oldenburg" ~ 53.143889,
                         country_name_en == "Piedmont-Sardinia" ~ 45.066667,
                         country_name_en == "Saxe-Weimar-Eisenach" ~ 50.981111,
                         country_name_en == "Würtemberg" ~ 48.7775,
                         country_name_en == "Hesse-Darmstadt" ~ 49.872222,
                         country_name_en == "Hesse-Kassel" ~ 51.3158,
                         TRUE ~lat),
         lon = case_when(country_name_en == "Brunswick" ~ 10.516667,
                         country_name_en == "Hamburg" ~ 10,
                         country_name_en == "Nassau" ~ 7.802222,
                         country_name_en == "Oldenburg" ~ 8.213889,
                         country_name_en == "Piedmont-Sardinia" ~ 7.7,
                         country_name_en == "Saxe-Weimar-Eisenach" ~ 11.329444,
                         country_name_en == "Würtemberg" ~ 9.18,
                         country_name_en == "Hesse-Darmstadt" ~ 8.652778,
                         country_name_en == "Hesse-Kassel" ~ 9.4979,
                         TRUE ~lon))

# Adding territories
extra_fh_territories <- tibble(extended_country_name =
                                 c("Crimea", "Eastern Donbas", "Nagorno-Karabakh", "Transnistria",
                                   "Chechnya", "Kurdistan", "Northern Ireland", "Northern Cyprus",
                                   "Indian Kashmir", "Pakistani Kashmir", "West Papua"),
                               GW_membership = FALSE, cow_membership = FALSE, polity_membership = FALSE,
                               extended_continent = c("Europe", "Europe", "Asia", "Europe",
                                                      "Asia", "Asia", "Europe", "Asia",
                                                      "Asia", "Asia", "Asia"),
                               extended_region = c("Eastern Europe", "Eastern Europe", "Western Asia", "Eastern Europe",
                                                   "Western Asia", "Western Asia", "Northern Europe", "Western Asia",
                                                   "Southern Asia", "Southern Asia", "South-Eastern Asia"),
                               lat = c(45.3, 48.002778, 39.815278,46.840278,
                                       43.4, 35.557222, 54.596389, 35.183333,
                                       34.5, 33.843333, -0.866667),
                               lon = c(34.4, 37.805278, 46.751944,29.643333,
                                       45.716667, 45.435556,-5.93, 33.366667,
                                       76.5, 73.851389, 134.083333),
                               regex = c("crimea|crimean peninsula", "donbas", "nagorno.karabakh", "transnistria",
                                         "chechnya", "kurdistan", "northern ireland", "\\bn.+cyprus",
                                         "^in.*kashmir", "^pak.*kashmir", "\\bw.+papua"),
                               code_type = list(unique(data$code_type)), value = NA) |>
  unnest(code_type)

data <- data |>
  bind_rows(extra_fh_territories)

expect_gt(data |>
               filter(country_name_en == "Brunswick") |>
               nrow(), 0)

expect_gt(data |>
               filter(country_name_en == "Hesse-Kassel") |>
               nrow(), 0)

expect_gt(data |>
               filter(extended_country_name == "Crimea") |>
               nrow(), 0)

# Palestine will need fixing
expect_gt(data |>
            filter(str_detect(country_name_en, "Palest")) |>
            nrow(), 0)

expect_gt(data |>
            filter(str_detect(country_name_en, "Hong Ko")) |>
            nrow(), 0)

code_types_in_data <- unique(data$code_type)

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
data <- data |>
  group_by(extended_country_name) |>
  mutate(across(c(regex:all_codes_NA),
                \(x) fill_if_unique(x))) |>
  distinct()

data <- data |>
  select(-any_of(code_types_in_data), -matches("unpd|undp")) |>
  select(where(\(x) !all(is.na(x)))) |>
  distinct() |>
  pivot_wider(id_cols = -any_of(c("code_type", "value", "startdate", "enddate", "startdate_type", "enddate_type")),
              names_from = c(code_type), values_from = c(value, startdate, enddate),
              names_glue = "{code_type}_{.value}",
              values_fn = \(x) ifelse(!all(is.na(x)), na.omit(x), x)) |>
  mutate(across(matches("date"), as_date)) |>
  rename_with(\(x) str_remove(x, "_value")) |>
  left_join(countrycode::codelist |>
              janitor::clean_names() |>
              select(-starts_with("cldr")))

expect_equal(countrycode_panel |>
               filter(!is.na(vdem)) |>
               filter(!vdem %in% vdem_panel$vdem) |>
               nrow(), 0)

expect_equal(data |>
               filter(!is.na(vdem)) |>
               filter(!vdem %in% vdem_panel$vdem) |>
               nrow(), 0)

expect_equal(data |>
               count(extended_country_name) |>
               filter(is.na(extended_country_name)) |>
               nrow(), 0)

expect_equal(data |>
               count(extended_country_name) |>
               anti_join(existing_panel |>
                           count(extended_country_name) |>
                           select(-n)) |>
               nrow(), 21)

data_long <- data |>
  pivot_longer(any_of(c(union(code_types, code_types_in_data), "GWn",
                        "extended_GWn", "polity_ccode")),
               names_to = "code_type",
               values_to = "value") |>
  pivot_longer(matches("startdate"),
               names_to = "startdate_type",
               values_to = "startdate") |>
  pivot_longer(matches("enddate"),
               names_to = "enddate_type",
               values_to = "enddate") |>
  relocate(extended_country_name, code_type, value, regex, matches("date")) |>
  mutate(across(matches("enddate_type"), \(x) str_remove(x, "_enddate$")),
         across(matches("startdate_type"), \(x) str_remove(x, "_startdate$"))) |>
  filter(code_type == startdate_type & code_type == enddate_type) |>
  select(-matches("date_type")) |>
  distinct() |>
  filter(code_type != "unpd") |>
  select(extended_country_name:all_codes_NA) |>
  group_by(extended_country_name) |>
  mutate(all_codes_NA = all(is.na(value))) |>
  filter(all_codes_NA | !is.na(value))

countrycode_panel |>
  filter(!is.na(value),
         code_type %in% unique(data_long$code_type)) |>
  anti_join(data_long)

data_long |>
  filter(!is.na(value),
         code_type %in% unique(countrycode_panel$code_type)) |>
  anti_join(countrycode_panel) |>
  print(n = 30)

data_long |>
  filter(str_detect(extended_country_name, "Haiti"))

polity5_panel |>
  rename(polity_group = group) |>
  pivot_longer(polity_ccode, names_to = "code_type") |>
  anti_join(data_long)

data_long |>
  filter(value == 260)

countrycode_codelist <- countrycode::codelist |>
  janitor::clean_names() |>
  select(-starts_with("cldr")) |>
  pivot_longer(where(is.numeric), names_to = "code_type")  |>
  relocate(country_name_en, code_type, value)

usethis::use_data(data,
                  countrycode_panel,
                  vdem_panel,
                  vdem_panel_simple,
                  cow_panel,
                  polity5_panel,
                  data,
                  internal = TRUE,
                  overwrite = TRUE)































































