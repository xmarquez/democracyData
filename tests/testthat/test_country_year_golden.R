library(dplyr)
library(readr)

fixture_path <- test_path("fixtures", "country_year_golden.csv")

test_that("country_year_golden.csv fixture matches current matcher output", {
  skip_if_not(
    file.exists(fixture_path),
    "country_year_golden.csv fixture not present"
  )

  golden <- read_csv(fixture_path, show_col_types = FALSE, progress = FALSE)

  inputs <- golden |>
    distinct(country, year)

  current <- country_year_coder(
    inputs,
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
  ) |>
    select(
      country,
      year,
      extended_country_name,
      GWn,
      cown,
      polity_ccode,
      in_GW_system,
      in_cow_system,
      in_polity_system
    ) |>
    arrange(country, year, extended_country_name, GWn) |>
    mutate(across(where(is.numeric), as.integer))

  golden_sorted <- golden |>
    arrange(country, year, extended_country_name, GWn) |>
    mutate(across(where(is.numeric), as.integer))

  expect_equal(current, golden_sorted)
})
