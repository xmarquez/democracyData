library(dplyr)

context("wgi")

test_that("World Governance Indicators data downloads correctly", {
  skip_on_cran()
  skip_on_travis()
  expect_no_message(wgi_democracy <- download_wgi_voice_and_accountability(verbose = FALSE))
  expect_no_warning(wgi_democracy <- download_wgi_voice_and_accountability(verbose = FALSE))
  expect_equal(nrow(wgi_democracy), 4975)
  expect_equal(max(wgi_democracy$year), 2022)
  expect_equal(sum(is.na(wgi_democracy$GWn)), 308)
})
