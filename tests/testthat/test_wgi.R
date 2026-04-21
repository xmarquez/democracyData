library(dplyr)

test_that("World Governance Indicators data downloads correctly", {
  skip_on_cran()
  skip_on_ci()
  expect_silent(
    wgi_democracy <- download_wgi_voice_and_accountability(verbose = FALSE)
  )
  expect_equal(nrow(wgi_democracy), 5444)
  expect_equal(max(wgi_democracy$year), 2024)
  # Pinned: WGI 2.0 (2025 methodology) includes ~50 non-state entities (regional
  # aggregates, sub-national territories like Channel Islands, Kosovo, Hong Kong
  # SAR, Palestine etc.) that country_year_coder cannot map to a GW state code;
  # 387 rows is the audited count for the 1996-2024 release.
  expect_equal(sum(is.na(wgi_democracy$GWn)), 387)
  expect_false(any(is.na(wgi_democracy$extended_country_name)))
})

test_that("legacy WGI snapshot preserves the pre-0.7.0 schema", {
  expect_s3_class(wgi_legacy, "data.frame")
  expect_identical(names(wgi_legacy), names(wgi))
  expect_equal(range(wgi_legacy$year), c(1996, 2023))
  expect_lt(max(wgi_legacy$year), max(wgi$year))
})
