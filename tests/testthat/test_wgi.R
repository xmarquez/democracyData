library(dplyr)

test_that("World Governance Indicators data downloads correctly", {
  skip_on_cran()
  skip_on_travis()
  expect_silent(wgi_democracy <- download_wgi_voice_and_accountability(verbose = FALSE))
  expect_equal(nrow(wgi_democracy), 5350)
  expect_equal(max(wgi_democracy$year), 2023)
  expect_equal(sum(is.na(wgi_democracy$GWn)), 475)
  expect_false(any(is.na(wgi_democracy$extended_country_name)))
})
