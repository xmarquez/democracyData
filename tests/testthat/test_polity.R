library(dplyr)

context("polity")

test_that("PolityIV is the same as the redownloaded data, has the correct number of rows", {
  skip_on_cran()
  skip_on_travis()
  polityIV_redownloaded <- redownload_polityIV(verbose = FALSE)
  expect_identical(polityIV_redownloaded, polityIV)
  expect_equal(nrow(polityIV), 17562)
  expect_equal(nrow(polityIV %>% filter(duplicated(cyear))), 0)
  expect_equal(max(polityIV$year), 2018)
  expect_false(any(is.na(polityIV$GWn)))
})

test_that("Polity5 downloads correctly", {
  skip_on_cran()
  skip_on_travis()
  polity5 <- download_polity_annual(verbose = FALSE)
  expect_equal(nrow(polity5), 17574)
  expect_equal(nrow(polity5 %>% filter(duplicated(cyear))), 0)
  expect_equal(max(polity5$year), 2020)
  expect_false(any(is.na(polity5$GWn)))
})

