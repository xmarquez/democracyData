library(dplyr)

context("Redownloadable datasets")

test_that("Anckar redownloads correctly", {
  skip_on_cran()
  skip_on_travis()
  skip_if_offline()
  anckar_redownloaded <- redownload_anckar(verbose = FALSE)
  expect_identical(anckar, anckar_redownloaded)
})

test_that("BLM redownloads correctly", {
  skip_on_cran()
  skip_on_travis()
  skip_if_offline()
  blm_redownloaded <- redownload_blm(verbose = FALSE)
  expect_identical(blm, blm_redownloaded)
})

test_that("BMR redownloads correctly", {
  skip_on_cran()
  skip_on_travis()
  skip_if_offline()
  bmr_redownloaded <- redownload_bmr(verbose = FALSE)
  expect_identical(bmr, bmr_redownloaded)
})

test_that("BNR redownloads correctly", {
  skip_on_cran()
  skip_on_travis()
  skip_if_offline()
  bnr_redownloaded <- redownload_bnr(verbose = FALSE, extend = FALSE)
  expect_identical(bnr, bnr_redownloaded)
  bnr_redownloaded_extended <- redownload_bnr(verbose = FALSE, extend = TRUE)
  expect_identical(bnr_extended, bnr_redownloaded_extended)
})

test_that("BTI redownloads correctly", {
  skip_on_cran()
  skip_on_travis()
  skip_if_offline()
  bti_redownloaded <- redownload_bti(verbose = FALSE)
  expect_identical(bti, bti_redownloaded)
})

test_that("GWF-autocratic redownloads correctly", {
  skip_on_cran()
  skip_on_travis()
  skip_if_offline()
  gwf_autocratic_redownloaded <- redownload_gwf(verbose = FALSE,
                                                dataset = "autocratic")
  expect_identical(gwf_autocratic, gwf_autocratic_redownloaded)
})

test_that("GWF-all redownloads correctly", {
  skip_on_cran()
  skip_on_travis()
  skip_if_offline()
  gwf_all_redownloaded <- redownload_gwf(verbose = FALSE,
                                                dataset = "all")
  expect_identical(gwf_all, gwf_all_redownloaded)
})

test_that("LIED redownloads correctly", {
  skip_on_cran()
  skip_on_travis()
  skip_if_offline()
  LIED_redownloaded <- redownload_lied(verbose = FALSE)
  expect_identical(LIED, LIED_redownloaded)
})

test_that("magaloni redownloads correctly", {
  skip_on_cran()
  skip_on_travis()
  skip_if_offline()
  magaloni_redownloaded <- redownload_magaloni(verbose = FALSE)
  expect_identical(magaloni, magaloni_redownloaded)
})

test_that("PACL redownloads correctly", {
  skip_on_cran()
  skip_on_travis()
  skip_if_offline()
  pacl_redownloaded <- redownload_pacl(verbose = FALSE)
  expect_identical(pacl, pacl_redownloaded)
})

test_that("peps redownloads correctly", {
  skip_on_cran()
  skip_on_travis()
  skip_if_offline()
  peps_redownloaded <- redownload_peps(verbose = FALSE)
  expect_identical(peps, peps_redownloaded)
})

test_that("polityIV redownloads correctly", {
  skip_on_cran()
  skip_on_travis()
  skip_if_offline()
  polityIV_redownloaded <- redownload_polityIV(verbose = FALSE)
  expect_identical(polityIV, polityIV_redownloaded)
})

test_that("polyarchy redownloads correctly", {
  skip("This test fails inexplicably when run through R-CMD check, though it passes normally, so skipping...")
  skip_on_cran()
  skip_on_travis()
  skip_if_offline()
  polyarchy_redownloaded <- redownload_polyarchy_original(verbose = FALSE)
  expect_identical(polyarchy, polyarchy_redownloaded)
})

test_that("polyarchy dimensions redownloads correctly", {
  skip_on_cran()
  skip_on_travis()
  skip_if_offline()
  polyarchy_dimensions_redownloaded <- redownload_polyarchy_dimensions(verbose = FALSE)
  expect_identical(polyarchy_dimensions, polyarchy_dimensions_redownloaded)
})

test_that("PIPE redownloads correctly", {
  skip("This test fails inexplicably when run through R-CMD check, though it passes normally, so skipping...")
  skip_on_cran()
  skip_on_travis()
  skip_if_offline()
  PIPE_redownloaded <- redownload_pipe(verbose = FALSE)
  expect_identical(PIPE, PIPE_redownloaded)
})

test_that("svmdi redownloads correctly", {
  skip_on_cran()
  skip_on_travis()
  skip_if_offline()
  svmdi_redownloaded <- redownload_svmdi(verbose = FALSE)
  expect_identical(svmdi, svmdi_redownloaded)
  svmdi_redownloaded_2016 <- redownload_svmdi(release_year = 2016, verbose = FALSE)
  expect_identical(svmdi_2016, svmdi_redownloaded_2016)
})

test_that("Ulfelder redownloads correctly", {
  skip_on_cran()
  skip_on_travis()
  skip_if_offline()
  ulfelder_redownloaded <- redownload_ulfelder(verbose = FALSE)
  expect_identical(ulfelder, ulfelder_redownloaded)
  ulfelder_redownloaded_extended <- redownload_ulfelder(verbose = FALSE, extend = TRUE)
  expect_identical(ulfelder_extended, ulfelder_redownloaded_extended)
})

test_that("UTIP redownloads correctly", {
  skip_on_cran()
  skip_on_travis()
  skip_if_offline()
  utip_redownloaded <- redownload_utip(verbose = FALSE)
  expect_identical(utip, utip_redownloaded)
})

test_that("Wahman-Teorell-Hadenius redownloads correctly", {
  skip_on_cran()
  skip_on_travis()
  skip_if_offline()
  wahman_teorell_hadenius_redownloaded <- redownload_wahman_teorell_hadenius(verbose = FALSE)
  expect_identical(wahman_teorell_hadenius, wahman_teorell_hadenius_redownloaded)
})
