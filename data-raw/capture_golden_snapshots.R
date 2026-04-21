library(democracyData)
library(dplyr)
library(readr)
library(tibble)

fixtures_dir <- file.path("tests", "testthat", "fixtures")
dir.create(fixtures_dir, recursive = TRUE, showWarnings = FALSE)

message(
  "[snapshot] generating democracy_scores_golden (default args, verbose = FALSE)..."
)
democracy_scores_golden <- generate_democracy_scores_dataset(verbose = FALSE)
saveRDS(
  democracy_scores_golden,
  file = file.path(fixtures_dir, "democracy_scores_golden.rds"),
  compress = "xz"
)
message(sprintf(
  "[snapshot] saved: %d rows, %d cols",
  nrow(democracy_scores_golden),
  ncol(democracy_scores_golden)
))

message("[fixture] building country_year_golden from current matcher...")
country_year_fixture <- tibble::tribble(
  ~country                               , ~year ,
  "Germany"                              , 2020L ,
  "German Federal Republic"              , 1988L ,
  "East Germany"                         , 1988L ,
  "Germany, West"                        , 1985L ,
  "West Germany"                         , 1990L ,
  "Germany"                              , 1945L ,
  "Germany"                              , 1946L ,
  "Germany"                              , 1989L ,
  "Germany"                              , 1990L ,
  "USSR"                                 , 1990L ,
  "Soviet Union"                         , 1985L ,
  "Russia"                               , 1992L ,
  "Russia"                               , 2020L ,
  "Russia"                               , 1910L ,
  "Yugoslavia"                           , 1985L ,
  "Yugoslavia"                           , 1992L ,
  "Serbia"                               , 2010L ,
  "Serbia and Montenegro"                , 2005L ,
  "Czechoslovakia"                       , 1985L ,
  "Czech Republic"                       , 1995L ,
  "Czechia"                              , 2020L ,
  "Slovakia"                             , 1995L ,
  "Vietnam"                              , 1970L ,
  "North Vietnam"                        , 1970L ,
  "South Vietnam"                        , 1970L ,
  "Vietnam, Democratic Republic of"      , 1980L ,
  "Republic of Vietnam"                  , 1970L ,
  "Yemen"                                , 1988L ,
  "Yemen"                                , 2010L ,
  "North Yemen"                          , 1988L ,
  "South Yemen"                          , 1988L ,
  "Yemen Arab Republic"                  , 1988L ,
  "Turkey"                               , 2020L ,
  "Ottoman Empire"                       , 1900L ,
  "T\u00fcrkiye"                         , 2024L ,
  "Turkiye"                              , 2024L ,
  "C\u00f4te d'Ivoire"                   , 2024L ,
  "Cote d'Ivoire"                        , 2024L ,
  "Ivory Coast"                          , 2024L ,
  "S\u00e3o Tom\u00e9 and Pr\u00edncipe" , 2024L ,
  "Sao Tome and Principe"                , 2024L ,
  "Congo, Dem. Rep."                     , 2024L ,
  "Democratic Republic of the Congo"     , 2024L ,
  "DR Congo"                             , 2024L ,
  "Congo-Brazzaville"                    , 2024L ,
  "Republic of the Congo"                , 2024L ,
  "Korea, Republic of"                   , 2024L ,
  "South Korea"                          , 2024L ,
  "North Korea"                          , 2024L ,
  "Korea, Dem. People's Rep. of"         , 2024L ,
  "Timor-Leste"                          , 2024L ,
  "East Timor"                           , 2024L ,
  "Taiwan"                               , 2015L ,
  "Chinese Taipei"                       , 2015L ,
  "Republic of China"                    , 2015L ,
  "Republic of China"                    , 1940L ,
  "United States"                        , 2020L ,
  "U.S.A."                               , 2020L ,
  "USA"                                  , 2020L ,
  "United States of America"             , 2020L ,
  "United Kingdom"                       , 2020L ,
  "UK"                                   , 2020L ,
  "Great Britain"                        , 2020L ,
  "Palestine"                            , 2020L ,
  "State of Palestine"                   , 2020L ,
  "West Bank and Gaza"                   , 2020L ,
  "Israel"                               , 2020L ,
  "France"                               , 2020L ,
  "Vichy France"                         , 1942L ,
  "France"                               , 1942L ,
  "Kashmir"                              , 2020L ,
  "Indian Kashmir"                       , 2020L ,
  "Pakistani Kashmir"                    , 2020L ,
  "Pakistan"                             , 2020L ,
  "India"                                , 2020L ,
  "Sudan"                                , 2020L ,
  "South Sudan"                          , 2015L ,
  "Sudan, South"                         , 2015L ,
  "Somaliland"                           , 2015L ,
  "Somalia"                              , 2015L ,
  "Northern Cyprus"                      , 2020L ,
  "Cyprus"                               , 2020L ,
  "Nagorno-Karabakh"                     , 2020L
)

golden_match <- country_year_fixture |>
  country_year_coder(
    country,
    year,
    to_system = "GW",
    include_in_output = c(
      "extended_country_name",
      "GWn",
      "cown",
      "polity_ccode",
      "in_GW_system",
      "in_cow_system",
      "in_polity_system"
    ),
    verbose = FALSE
  )

write_csv(golden_match, file.path(fixtures_dir, "country_year_golden.csv"))
message(sprintf(
  "[fixture] saved country_year_golden.csv: %d rows",
  nrow(golden_match)
))
