library(dplyr)

context("GWF")

test_that("Extended versions of GWF only extend up to 1945", {
  expect_equal(suppressWarnings(anti_join(gwf_all_extended, gwf_all) %>%
                 pull(year) %>%
                 max()), 1945)
})
