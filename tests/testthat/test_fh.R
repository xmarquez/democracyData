library(dplyr)

context("fh")

test_that("Freedom House data downloads correctly", {
  skip_on_cran()
  skip_on_travis()
  expect_no_warning(fh <- download_fh(verbose = FALSE))
  expect_no_message(fh <- download_fh(verbose = FALSE))
  expect_message(fh <- download_fh(), regexp = "Processing the FH 2024 data")
  expect_no_message(fh <- download_fh(), message = "The following country and/or code-years were matched more than once")
  expect_equal(nrow(fh), 9240)
  expect_equal(max(fh$year), 2023)
  expect_false(any(is.na(fh$GWn)))
})

test_that("Freedom House data with territories downloads correctly", {
  skip_on_cran()
  skip_on_travis()
  expect_no_warning(fh <- download_fh(verbose = FALSE, include_territories = TRUE))
  expect_no_message(fh <- download_fh(verbose = FALSE, include_territories = TRUE))
  expect_equal(nrow(fh), 9757)
  expect_equal(max(fh$year), 2023)
  expect_equal(sum(is.na(fh$GWn)), 308)
})


test_that("Freedom House electoral democracies data downloads correctly", {
  skip_on_cran()
  skip_on_travis()
  expect_no_warning(fh <- download_fh_electoral(verbose = FALSE))
  expect_no_message(fh <- download_fh_electoral(verbose = FALSE))
  expect_message(fh <- download_fh_electoral(),
                 regexp = "Processing the FH Electoral Democracies 1989-2024 data")
  expect_equal(nrow(fh), 6491)
  expect_equal(max(fh$year), 2023)
  expect_false(any(is.na(fh$GWn)))
})

test_that("Freedom House full data downloads correctly", {
  skip_on_cran()
  skip_on_travis()
  expect_no_warning(fh <- download_fh_full(verbose = FALSE))
  expect_no_message(fh <- download_fh_full(verbose = FALSE))
  expect_message(fh <- download_fh_full(),
                 regexp = "Processing the FH full 2013-2024 data - ")
  expect_equal(nrow(fh), 2515)
  expect_equal(max(fh$year), 2023)
  expect_equal(sum(is.na(fh$GWn)), 103)
})
