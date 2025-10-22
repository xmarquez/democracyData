library(dplyr)

test_data <- tibble(country = c("Germany", "Germany", "Germany", "Germany", "Germany",
                                    "Federal Republic of Germany",
                                    "Somaliland", "Somalia",
                                    "Palestine", "Russia",
                                    "Russia", "USSR",
                                    "Republic of Vietnam",
                                    "Yugoslavia", 'Yugoslavia',
                                    "Vietnam, South"),
                        code = c(255, 260, 255, 255, 260,
                                 260, NA, 520, NA,
                                 365, 365, 365,
                                 817, 345, 345, 817),
                        year = c( 2017, 1930, 1970, 1945, 1949,
                                 1992, 1990,
                                 1990, 1940,
                                 1917, 1912,
                                 1922, 1975,
                                 1990, 1991, 1954))

include_in_output <- c("extended_country_name",
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
                       "polity_enddate")

result_GW_country <-  country_year_coder(test_data,
                                         country,
                                         year,
                                         match_type = "country",
                                         to_system = "GW",
                                         verbose = FALSE,
                                         include_in_output = include_in_output,
                                         match_final_year = FALSE)

result_GW_code <-  country_year_coder(test_data,
                                      country,
                                      year,
                                      code,
                                      code_type = "cown",
                                      match_type = "code",
                                      to_system = "GW",
                                      verbose = FALSE,
                                      include_in_output = include_in_output,
                                      match_final_year = FALSE)

result_GW_country_code <-  country_year_coder(test_data,
                                      country,
                                      year,
                                      code,
                                      code_type = "cown",
                                      match_type = "country",
                                      to_system = "GW",
                                      verbose = FALSE,
                                      include_in_output = include_in_output,
                                      match_final_year = FALSE)

result_cow_country <-  country_year_coder(test_data,
                                          country,
                                          year,
                                          match_type = "country",
                                          to_system = "cow",
                                          verbose = FALSE,
                                          include_in_output = include_in_output,
                                          match_final_year = FALSE)

result_polity_country <-  country_year_coder(test_data,
                                             country,
                                             year,
                                             match_type = "country",
                                             to_system = "polity",
                                             verbose = FALSE,
                                             include_in_output = include_in_output,
                                             match_final_year = FALSE)


test_that("country_year_coder codes problem countries correctly", {
  expect_equal(result_GW_country, result_cow_country)
  # expect_equal(result_GW_country, result_GW_country_code)
  expect_equal(result_GW_country, result_polity_country)
  expect_equal(result_cow_country, result_polity_country)
  expect_equal(result_GW_country$GWn, c(260, 255, 260, 260, 260, 260, NA, 520, NA, 365, 365, 365, 817, 345, 345, 817))
  expect_equal(result_GW_country$GWn, result_GW_country_code$GWn)
  expect_equal(result_GW_country$polity_ccode, c(255, 255, 260, 260, 260, 255, NA, 520, NA, 365, 365, 364, 817, 345, 347, 817))
  expect_equal(nrow(result_GW_country), nrow(test_data))
  expect_equal(nrow(result_cow_country), nrow(test_data))
  expect_equal(nrow(result_polity_country), nrow(test_data))
  expect_equal(nrow(result_GW_code), nrow(test_data))

})


test_that("Palestine matches historical entities across periods", {
  palestine_test <- tibble(country = rep('Palestine', 2),
                                year = c(1918, 1955))
  res <- country_year_coder(palestine_test,
                           country,
                           year,
                           match_type = "country",
                           to_system = "GW",
                           include_in_output = c("extended_country_name"),
                           verbose = FALSE,
                           match_final_year = FALSE)
  res <- arrange(res, year)
  expect_equal(nrow(res), nrow(palestine_test))
  expect_equal(sum(res$year == 1918), 1)
  expect_equal(sum(res$year == 1955), 1)
  expect_equal(res$year, palestine_test$year)
  expect_identical(res$extended_country_name, c("British Mandate of Palestine",
                                                 "Palestine, State of"))
})

