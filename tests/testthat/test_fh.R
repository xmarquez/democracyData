library(dplyr)

context("fh")

test_that("Freedom House data downloads correctly", {
  skip_on_cran()
  skip_on_travis()
  fh <- download_fh(verbose = FALSE)
  expect_equal(nrow(fh), 8655)
  expect_equal(max(fh$year), 2020)
  expect_false(any(is.na(fh$GWn)))
})

test_that("Freedom House data with territories downloads correctly", {
  skip_on_cran()
  skip_on_travis()
  fh <- download_fh(verbose = FALSE, include_territories = TRUE)
  expect_equal(nrow(fh), 9127)
  expect_equal(max(fh$year), 2020)
  expect_equal(sum(is.na(fh$GWn)), 388)
})


test_that("Freedom House electoral democracies data downloads correctly", {
  skip_on_cran()
  skip_on_travis()
  fh <- download_fh_electoral(verbose = FALSE)
  expect_equal(nrow(fh), 5906)
  expect_equal(max(fh$year), 2019)
  expect_false(any(is.na(fh$GWn)))
})

test_that("Freedom House full data downloads correctly", {
  skip_on_cran()
  skip_on_travis()
  fh <- download_fh_full(verbose = FALSE)
  expect_equal(nrow(fh), 1885)
  expect_equal(max(fh$year), 2020)
  expect_equal(sum(is.na(fh$GWn)), 103)
})
