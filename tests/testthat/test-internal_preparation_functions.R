library(dplyr)

test_that("vdem_simple contains all countries and is the right version", {
  expect_true(rlang::is_installed("vdemdata", version = "15.0"))
  vdem_simple_prepared <- prepare_vdem_simple(version = "15.0")
  expect_equal(nrow(vdem_simple_prepared), nrow(vdemdata::vdem))
  expect_equal(sum(is.na(vdem_simple_prepared$extended_country_name)), 0)
  expect_equal(vdem_simple_prepared |>
                 filter(duplicated(paste(vdem_simple_prepared$vdem_country_name, vdem_simple_prepared$year))) |> nrow(), 0)
  expect_identical(vdem_simple_prepared, vdem_simple)
})
