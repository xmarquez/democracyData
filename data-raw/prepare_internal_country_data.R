library(tidyverse)
library(countrycode)

existing_panel <- read_csv(here::here("data-raw/internal_country_year_coder_data.csv"))

countrycode_data <- countrycode::codelist_panel |>
  janitor::clean_names()

names_to_include <- setdiff(names(existing_panel), names(countrycode_data))

existing_panel <- existing_panel |>
  select(all_of(names_to_include),
         cown, cowc,
         -starts_with("country_name"),
         -fips105, -icao,
         -starts_with("official_"))

countrycode_data <- countrycode_data |>
  distinct(across(-year))

joined_by_gwn <- existing_panel |>
  filter(!is.na(GWn)) |>
  inner_join(countrycode_data |>
               filter(!is.na(gwn)), by = join_by(extended_GWn == gwn)) |>
  distinct()

joined_by_cown <- existing_panel |>
  filter(!is.na(cown)) |>
  inner_join(countrycode_data |>
               filter(!is.na(cown)), by = join_by(cown, cowc)) |>
  distinct()

joined_by_polity <- existing_panel |>
  filter(!is.na(polity_ccode)) |>
  inner_join(countrycode_data |>
               filter(!is.na(p4n)), by = join_by(polity_ccode == p4n)) |>
  distinct()

joined_by_code <- bind_rows(joined_by_gwn,
                          joined_by_cown,
                          joined_by_polity) |>
  distinct()

not_matched <- setdiff(countrycode_data$country_name_en, joined_by_code$country_name_en)

joined_by_extended_country <- existing_panel |>
  fuzzyjoin::regex_inner_join(countrycode_data |>
                                filter(country_name_en %in% not_matched),
                              by = c(extended_country_name = "country_name_en_regex"),
                              ignore_case = TRUE) |>
  distinct()

joined_by_cow_country <- existing_panel |>
  fuzzyjoin::regex_inner_join(countrycode_data |>
                                filter(country_name_en %in% not_matched),
                              by = c(cow_country_name = "country_name_en_regex"),
                              ignore_case = TRUE) |>
  distinct()

joined_by_polity_country <- existing_panel |>
  fuzzyjoin::regex_inner_join(countrycode_data |>
                                filter(country_name_en %in% not_matched),
                              by = c(polity_country_name = "country_name_en_regex"),
                              ignore_case = TRUE) |>
  distinct()

joined_by_gwn_country <- existing_panel |>
  fuzzyjoin::regex_inner_join(countrycode_data |>
                                filter(country_name_en %in% not_matched),
                              by = c(GW_country_name = "country_name_en_regex"),
                              ignore_case = TRUE) |>
  distinct()

joined_by_country <- bind_rows(joined_by_extended_country,
                               joined_by_cow_country,
                               joined_by_polity_country,
                               joined_by_gwn_country) |>
  distinct()

still_not_matched <- setdiff(countrycode_data$country_name_en,
                             c(joined_by_code$country_name_en, joined_by_country$country_name_en))

remaining_countries <- countrycode::codelist_panel |>
  janitor::clean_names() |>
  filter(country_name_en %in% still_not_matched) |>
  group_by(across(-year)) |>
  summarise(unofficial_startdate = ymd(paste(min(year), "01-01", sep = "-")),
            unofficial_enddate = ymd(paste(max(year), "01-01", sep = "-"))) |>
  ungroup() |>
  mutate(extended_country_name = country_name_en, polity_membership = FALSE,
         cow_membership = FALSE, GW_membership = FALSE,
         extended_continent = "Europe",
         extended_region = case_when(country_name_en == "Brunswick" ~ "Western Europe",
                                     country_name_en == "Hamburg" ~ "Western Europe",
                                     country_name_en == "Nassau" ~ "Western Europe",
                                     country_name_en == "Oldenburg" ~ "Western Europe",
                                     country_name_en == "Piedmont-Sardinia" ~ "Southern Europe",
                                     country_name_en == "Saxe-Weimar-Eisenach" ~ "Western Europe",
                                     country_name_en == "Würtemberg" ~ "Western Europe"),
         lat = case_when(country_name_en == "Brunswick" ~ 52.266667,
                         country_name_en == "Hamburg" ~ 53.55,
                         country_name_en == "Nassau" ~ 50.315833,
                         country_name_en == "Oldenburg" ~ 53.143889,
                         country_name_en == "Piedmont-Sardinia" ~ 45.066667,
                         country_name_en == "Saxe-Weimar-Eisenach" ~ 50.981111,
                         country_name_en == "Würtemberg" ~ 48.7775),
         lon = case_when(country_name_en == "Brunswick" ~ 10.516667,
                         country_name_en == "Hamburg" ~ 10,
                         country_name_en == "Nassau" ~ 7.802222,
                         country_name_en == "Oldenburg" ~ 8.213889,
                         country_name_en == "Piedmont-Sardinia" ~ 7.7,
                         country_name_en == "Saxe-Weimar-Eisenach" ~ 11.329444,
                         country_name_en == "Würtemberg" ~ 9.18))

data <- bind_rows(joined_by_code,
                  joined_by_country,
                  remaining_countries)

data <- data |>
  mutate(cown = case_when(is.na(cown) & !is.na(cown.x) ~ cown.x,
                          is.na(cown) & !is.na(cown.y) ~ cown.y,
                          TRUE ~ cown),
         cowc = case_when(is.na(cowc) & !is.na(cowc.x) ~ cowc.x,
                          is.na(cowc) & !is.na(cowc.y) ~ cowc.y,
                          TRUE ~ cowc)) |>
  select(-cown.y, -cown.x, -cowc.x, -cowc.y) |>
  distinct()

data <- data |>
  mutate(regex = case_when(regex == country_name_en_regex ~ regex,
                           !is.na(regex) ~ paste(regex, country_name_en_regex, sep = "|"),
                           TRUE ~ country_name_en_regex))

last_missing <- existing_panel |>
  filter(extended_country_name %in% setdiff(existing_panel$extended_country_name,
                                            data$extended_country_name))

data <- data |>
  bind_rows(last_missing)

data <- data |>
  group_by(across(matches("country_name|startdate|enddate|regex"))) |>
  reframe(across(everything(), \(x) ifelse(all(is.na(x)), NA, na.omit(x))))

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
                                         "^in.*kashmir", "^pak.*kashmir", "\\bw.+papua"))

# Fixing territories that match to single destination unit, also Vietnam

data <- bind_rows(data,
                  extra_fh_territories)

data |>
  filter(if_any(contains("country"), \(x) str_detect(x, "Colombia"))) |>
  count(extended_country_name, p4n, polity_ccode, cown, GWn)

data <- data |>
  mutate(regex = case_when(extended_country_name == "Vietnam, Democratic Republic of" ~
                             paste(regex, "vietnam, n*", sep = "|"),
                           extended_country_name == "Vietnam, Republic of" ~
                             "^(south.*viet.?nam)|(viet.?nam?.*south)|(viet.?nam?, s\\.)|(viet.?nam?(?!.*socialist).*republic)|^(?!.*democratic).*republic of vie.?tnam",
                           extended_country_name == "Cyprus" ~ "^(?!.*\\bn).*cyprus",
                           extended_country_name == "India" ~ "india(?!.*ocea)(?!.*kashmir)",
                           extended_country_name == "Pakistan" ~ "^(?!.*east).*paki?stan(?!.*kashmir)",
                           extended_country_name == "Papua New Guinea" ~ "^(?!.*\\bwest).*papua|\\bp.*\\bn.*\\bguin.*|^p\\.?n\\.?g\\.?$|new.?guinea|PAPUA N.GUINEA",
                           extended_country_name == "Germany (Prussia)" ~ "^(?!.*east).*germany|^(?!.*\\bfed.*\\brep).*germany|prussia",
                           extended_country_name == "German Federal Republic" ~ "^(?=.*\\bfed.*\\brep).*german|^f\\.?r\\.?g\\.?$|^b\\.?r\\.?d\\.?$|^(?=.*west).*germany|bonn.?republic|^(?!\\beast).*germany(?!.*east)",
                           extended_country_name == "Great Colombia" ~ "great colombia|gran colombia",
                           extended_country_name == "Colombia" ~ "^(?!.*\\bgr).*\\bcolombia",
                           TRUE ~ regex),
         cown = case_when(polity_ccode == 99 ~ NA,
                          TRUE ~ cown))

usethis::use_data(data, overwrite = TRUE, internal = TRUE)
