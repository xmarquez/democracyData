library(dplyr)

test_that("There is always a pmm_country variable in the pmm datasets", {
  expect_true("pmm_country" %in% names(arat_pmm))
  expect_true("pmm_country" %in% names(blm_pmm))
  expect_true("pmm_country" %in% names(bollen_pmm))
  expect_true("pmm_country" %in% names(hadenius_pmm))
  expect_true("pmm_country" %in% names(fh_pmm))
  expect_true("pmm_country" %in% names(mainwaring_pmm))
  expect_true("pmm_country" %in% names(munck_pmm))
  expect_true("pmm_country" %in% names(pacl_pmm))
  expect_true("pmm_country" %in% names(polity_pmm))
})
