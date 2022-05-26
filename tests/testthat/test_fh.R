library(dplyr)

context("fh")

test_that("Freedom House data downloads correctly", {
  skip_on_cran()
  skip_on_travis()
  fh <- download_fh(verbose = FALSE)
  expect_equal(nrow(fh), 8850)
  expect_equal(max(fh$year), 2021)
  expect_false(any(is.na(fh$GWn)))
})

test_that("Freedom House data with territories downloads correctly", {
  skip_on_cran()
  skip_on_travis()
  fh <- download_fh(verbose = FALSE, include_territories = TRUE)
  expect_equal(nrow(fh), 9337)
  expect_equal(max(fh$year), 2021)
  expect_equal(sum(is.na(fh$GWn)), 400)
})


test_that("Freedom House electoral democracies data downloads correctly", {
  skip_on_cran()
  skip_on_travis()
  fh <- download_fh_electoral(verbose = FALSE)
  expect_equal(nrow(fh), 6101)
  expect_equal(max(fh$year), 2021)
  expect_false(any(is.na(fh$GWn)))
})

test_that("Freedom House full data downloads correctly", {
  skip_on_cran()
  skip_on_travis()
  fh <- download_fh_full(verbose = FALSE)
  expect_equal(nrow(fh), 2095)
  expect_equal(max(fh$year), 2021)
  expect_equal(sum(is.na(fh$GWn)), 115)
})
