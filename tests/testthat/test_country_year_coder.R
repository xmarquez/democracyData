library(dplyr)

test_data <- tibble(
  country = c(
    "Germany",
    "Germany",
    "Germany",
    "Germany",
    "Germany",
    "Federal Republic of Germany",
    "Somaliland",
    "Somalia",
    "Palestine",
    "Russia",
    "Russia",
    "USSR",
    "Republic of Vietnam",
    "Yugoslavia",
    'Yugoslavia',
    "Vietnam, South"
  ),
  code = c(
    255,
    260,
    255,
    255,
    260,
    260,
    NA,
    520,
    NA,
    365,
    365,
    365,
    817,
    345,
    345,
    817
  ),
  year = c(
    2017,
    1930,
    1970,
    1945,
    1949,
    1992,
    1990,
    1990,
    1940,
    1917,
    1912,
    1922,
    1975,
    1990,
    1991,
    1954
  )
)

include_in_output <- c(
  "extended_country_name",
  "GWn",
  "cown",
  "polity_ccode",
  "in_GW_system",
  "in_cow_system",
  "in_polity_system",
  "cow_startdate",
  "cow_enddate",
  "GW_startdate",
  "GW_enddate",
  "polity_startdate",
  "polity_enddate"
)

result_GW_country <- country_year_coder(
  test_data,
  country,
  year,
  match_type = "country",
  to_system = "GW",
  verbose = FALSE,
  include_in_output = include_in_output,
  match_final_year = FALSE
)

result_GW_code <- country_year_coder(
  test_data,
  country,
  year,
  code,
  code_type = "cown",
  match_type = "code",
  to_system = "GW",
  verbose = FALSE,
  include_in_output = include_in_output,
  match_final_year = FALSE
)

result_GW_country_code <- country_year_coder(
  test_data,
  country,
  year,
  code,
  code_type = "cown",
  match_type = "country",
  to_system = "GW",
  verbose = FALSE,
  include_in_output = include_in_output,
  match_final_year = FALSE
)

result_cow_country <- country_year_coder(
  test_data,
  country,
  year,
  match_type = "country",
  to_system = "cow",
  verbose = FALSE,
  include_in_output = include_in_output,
  match_final_year = FALSE
)

result_polity_country <- country_year_coder(
  test_data,
  country,
  year,
  match_type = "country",
  to_system = "polity",
  verbose = FALSE,
  include_in_output = include_in_output,
  match_final_year = FALSE
)


test_that("country_year_coder codes problem countries correctly", {
  expect_equal(result_GW_country, result_cow_country)
  # expect_equal(result_GW_country, result_GW_country_code)
  expect_equal(result_GW_country, result_polity_country)
  expect_equal(result_cow_country, result_polity_country)
  expect_equal(
    result_GW_country$GWn,
    c(
      260,
      255,
      260,
      260,
      260,
      260,
      NA,
      520,
      NA,
      365,
      365,
      365,
      817,
      345,
      345,
      817
    )
  )
  expect_equal(result_GW_country$GWn, result_GW_country_code$GWn)
  expect_equal(
    result_GW_country$polity_ccode,
    c(
      255,
      255,
      260,
      260,
      260,
      255,
      NA,
      520,
      NA,
      365,
      365,
      364,
      817,
      345,
      347,
      817
    )
  )
  expect_equal(nrow(result_GW_country), nrow(test_data))
  expect_equal(nrow(result_cow_country), nrow(test_data))
  expect_equal(nrow(result_polity_country), nrow(test_data))
  expect_equal(nrow(result_GW_code), nrow(test_data))
})

test_that("normalize_country strips diacritics, punctuation, and case", {
  expect_equal(
    normalize_country(c("T\u00fcrkiye", "Turkiye", "TURKEY")),
    c("turkiye", "turkiye", "turkey")
  )
  expect_equal(
    normalize_country(c("C\u00f4te d'Ivoire", "Cote d'Ivoire", "Ivory Coast")),
    c("cote d ivoire", "cote d ivoire", "ivory coast")
  )
  expect_equal(
    normalize_country(c("U.S.A.", "U. S. A.", "USA")),
    c("u s a", "u s a", "usa")
  )
  expect_equal(
    normalize_country(c("Congo, Dem. Rep.", "  Congo,   Dem.  Rep.  ")),
    c("congo dem rep", "congo dem rep")
  )
  expect_equal(normalize_country(NA_character_), NA_character_)
})

test_that("country_year_coder matches diacritic and punctuation variants", {
  cases <- tibble::tribble(
    ~country                               , ~year , ~expected_gwn ,
    "T\u00fcrkiye"                         , 2024L ,           640 ,
    "Turkiye"                              , 2024L ,           640 ,
    "C\u00f4te d'Ivoire"                   , 2024L ,           437 ,
    "Cote d'Ivoire"                        , 2024L ,           437 ,
    "Ivory Coast"                          , 2024L ,           437 ,
    "S\u00e3o Tom\u00e9 and Pr\u00edncipe" , 2024L ,           403 ,
    "Sao Tome and Principe"                , 2024L ,           403 ,
    "Congo, Dem. Rep."                     , 2024L ,           490 ,
    "Democratic Republic of the Congo"     , 2024L ,           490 ,
    "DR Congo"                             , 2024L ,           490 ,
    "Korea, Republic of"                   , 2024L ,           732 ,
    "South Korea"                          , 2024L ,           732 ,
    "Timor-Leste"                          , 2024L ,           860 ,
    "East Timor"                           , 2024L ,           860
  )
  result <- country_year_coder(
    cases,
    country,
    year,
    to_system = "GW",
    verbose = FALSE,
    include_in_output = c("extended_country_name", "GWn")
  )
  expect_equal(result$GWn, cases$expected_gwn)
})

test_that("country_year_coder handles acronym inputs with and without dots", {
  cases <- tibble::tribble(
    ~country   , ~year , ~expected_gwn ,
    "USA"      , 2024L ,             2 ,
    "U.S.A."   , 2024L ,             2 ,
    "U. S. A." , 2024L ,             2 ,
    "UK"       , 2024L ,           200 ,
    "U.K."     , 2024L ,           200
  )
  result <- country_year_coder(
    cases,
    country,
    year,
    to_system = "GW",
    verbose = FALSE,
    include_in_output = c("extended_country_name", "GWn")
  )
  expect_equal(result$GWn, cases$expected_gwn)
})

test_that("country_year_coder disambiguates successor-state years", {
  cases <- tibble::tribble(
    ~country         , ~year , ~expected_extended           ,
    "East Germany"   , 1988L , "German Democratic Republic" ,
    "West Germany"   , 1988L , "German Federal Republic"    ,
    "Germany"        , 2020L , "German Federal Republic"    ,
    "Czechoslovakia" , 1985L , "Czechoslovakia"             ,
    "Czech Republic" , 1995L , "Czech Republic"             ,
    "Slovakia"       , 1995L , "Slovakia"                   ,
    "Yugoslavia"     , 1985L , "Yugoslavia"                 ,
    "Serbia"         , 2010L , "Serbia"                     ,
    "USSR"           , 1985L , "Russia (Soviet Union)"      ,
    "Russia"         , 2000L , "Russia (Soviet Union)"
  )
  result <- country_year_coder(
    cases,
    country,
    year,
    to_system = "GW",
    verbose = FALSE,
    include_in_output = c("extended_country_name", "GWn")
  )
  expect_equal(result$extended_country_name, cases$expected_extended)
})

test_that("country_year_coder returns NA for unknown and preserves row count", {
  cases <- tibble::tibble(
    country = c("Narnia", NA_character_, "Atlantis"),
    year = c(2024L, 2024L, 2024L)
  )
  expect_no_error(
    result <- country_year_coder(
      cases,
      country,
      year,
      to_system = "GW",
      verbose = FALSE
    )
  )
  expect_equal(nrow(result), nrow(cases))
  expect_true(all(is.na(result$extended_country_name)))
  expect_false(any(result$in_GW_system, na.rm = TRUE))
})
