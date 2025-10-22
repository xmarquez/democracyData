library(dplyr)

test_that("Anckar redownloads correctly", {
  skip_on_cran()
  skip_on_travis()
  skip_if_offline()
  expect_silent(anckar_redownloaded <- redownload_anckar(verbose = FALSE))
  expect_no_message(anckar_redownloaded <- redownload_anckar(verbose = TRUE),
                    message = "The following country and/or code-years were not matched:|The following country and/or code-years were matched more than once:")
  expect_identical(anckar, anckar_redownloaded)
})

test_that("BLM redownloads correctly", {
  skip_on_cran()
  skip_on_travis()
  skip_if_offline()
  expect_silent(blm_redownloaded <- redownload_blm(verbose = FALSE))
  expect_no_message(blm_redownloaded <- redownload_blm(verbose = TRUE),
                    message = "The following country and/or code-years were not matched:|The following country and/or code-years were matched more than once:")
  expect_equal(sum(is.na(blm_redownloaded$extended_country_name)), 0)
  expect_identical(blm, blm_redownloaded)
})

test_that("BMR redownloads correctly", {
  skip_on_cran()
  skip_on_travis()
  skip_if_offline()
  expect_silent(bmr_redownloaded <- redownload_bmr(verbose = FALSE))
  expect_no_message(bmr_redownloaded <- redownload_bmr(verbose = TRUE),
                    message = "The following country and/or code-years were not matched:|The following country and/or code-years were matched more than once:")
  expect_equal(sum(is.na(bmr_redownloaded$extended_country_name)), 0)
  expect_identical(bmr, bmr_redownloaded)
})

test_that("BTI redownloads correctly", {
  skip_on_cran()
  skip_on_travis()
  skip_if_offline()
  expect_silent(bti_redownloaded <- redownload_bti(verbose = FALSE))
  expect_no_message(bti_redownloaded <- redownload_bti(verbose = TRUE),
                    message = "The following country and/or code-years were not matched:|The following country and/or code-years were matched more than once:")
  expect_equal(sum(is.na(bti_redownloaded$extended_country_name)), 0)
  expect_equal(max(bti_redownloaded$year), 2022)
  expect_equal(max(bti_redownloaded$report_year), 2024)
  expect_identical(bti, bti_redownloaded)
})

test_that("GWF-autocratic redownloads correctly", {
  skip_on_cran()
  skip_on_travis()
  skip_if_offline()
  expect_silent(gwf_autocratic_redownloaded <- redownload_gwf(verbose = FALSE, dataset = "autocratic"))
  expect_no_message(gwf_autocratic_redownloaded <- redownload_gwf(verbose = TRUE,
                                                                  dataset = "autocratic"),
                    message = "The following country and/or code-years were not matched:|The following country and/or code-years were matched more than once:")
  expect_equal(sum(is.na(gwf_autocratic_redownloaded$extended_country_name)), 0)
  expect_identical(gwf_autocratic, gwf_autocratic_redownloaded)
})

test_that("GWF-all redownloads correctly", {
  skip_on_cran()
  skip_on_travis()
  skip_if_offline()
  expect_silent(gwf_all_redownloaded <- redownload_gwf(verbose = FALSE, dataset = "all"))
  expect_no_message(gwf_all_redownloaded <- redownload_gwf(verbose = TRUE,
                                                           dataset = "all"),
                    message = "The following country and/or code-years were not matched:|The following country and/or code-years were matched more than once:")
  expect_equal(sum(is.na(gwf_all_redownloaded$extended_country_name)), 0)
  expect_identical(gwf_all, gwf_all_redownloaded)
})

test_that("LIED redownloads correctly", {
  skip_on_cran()
  skip_on_travis()
  skip_if_offline()
  expect_silent(LIED_redownloaded <- redownload_lied(verbose = FALSE))
  expect_no_message(LIED_redownloaded <- redownload_lied(verbose = TRUE),
                    message = "The following country and/or code-years were not matched:|Note: the number of rows in the processed LIED data is different")
  expect_equal(sum(is.na(LIED_redownloaded$extended_country_name)), 0)
  expect_equal(max(LIED_redownloaded$year), 2024)
  expect_identical(LIED, LIED_redownloaded)
})

test_that("VaPoReg redownloads correctly", {
  skip_on_cran()
  skip_on_travis()
  skip_if_offline()
  expect_silent(vaporeg_redownloaded <- redownload_vaporeg(verbose = FALSE))
  expect_no_message(vaporeg_redownloaded <- redownload_vaporeg(verbose = TRUE),
                    message = "The following country and/or code-years were not matched:")
  expect_equal(sum(is.na(vaporeg_redownloaded$extended_country_name)), 0)
  expect_identical(vaporeg, vaporeg_redownloaded)
})

test_that("magaloni redownloads correctly", {
  skip_on_cran()
  skip_on_travis()
  skip_if_offline()
  expect_silent(magaloni_redownloaded <- redownload_magaloni(verbose = FALSE))
  expect_no_message(magaloni_redownloaded <- redownload_magaloni(verbose = TRUE),
                    message = "The following country and/or code-years were not matched:|The following country and/or code-years were matched more than once:")
  expect_equal(sum(is.na(magaloni_redownloaded$extended_country_name)), 0)
  expect_identical(magaloni, magaloni_redownloaded)
})

test_that("PACL redownloads correctly", {
  skip_on_cran()
  skip_on_travis()
  skip_if_offline()
  expect_silent(pacl_redownloaded <- redownload_pacl(verbose = FALSE))
  expect_no_message(pacl_redownloaded <- redownload_pacl(verbose = TRUE),
                    message = "The following country and/or code-years were not matched:|The following country and/or code-years were matched more than once:")
  expect_equal(sum(is.na(pacl_redownloaded$extended_country_name)), 0)
  expect_identical(pacl, pacl_redownloaded)
})

test_that("PACL update redownloads correctly", {
  skip_on_cran()
  skip_on_travis()
  skip_if_offline()
  expect_silent(pacl_update_redownloaded <- redownload_pacl_update(verbose = FALSE))
  expect_no_message(pacl_update_redownloaded <- redownload_pacl_update(verbose = TRUE),
                    message = "The following country and/or code-years were not matched:|The following country and/or code-years were matched more than once:")
  expect_equal(sum(is.na(pacl_update_redownloaded$extended_country_name)), 0)
  expect_identical(pacl_update, pacl_update_redownloaded)
})

test_that("peps redownloads correctly", {
  skip_on_cran()
  skip_on_travis()
  skip_if_offline()
  expect_silent(peps_redownloaded <- redownload_peps(verbose = FALSE))
  expect_no_message(peps_redownloaded <- redownload_peps(verbose = TRUE),
                    message = "The following country and/or code-years were not matched:|The following country and/or code-years were matched more than once:")
  expect_equal(sum(is.na(peps_redownloaded$extended_country_name)), 0)
  expect_identical(peps, peps_redownloaded)
})

test_that("polityIV redownloads correctly", {
  skip_on_cran()
  skip_on_travis()
  skip_if_offline()
  expect_silent(polityIV_redownloaded <- redownload_polityIV(verbose = FALSE))
  expect_no_message(polityIV_redownloaded <- redownload_polityIV(verbose = TRUE),
                    message = "The following country and/or code-years were not matched:|The following country and/or code-years were matched more than once:")
  expect_equal(sum(is.na(polityIV_redownloaded$extended_country_name)), 0)
  expect_identical(polityIV, polityIV_redownloaded)
})

test_that("polyarchy redownloads correctly", {
  skip_on_cran()
  skip_on_travis()
  skip_if_offline()
  expect_silent(polyarchy_redownloaded <- redownload_polyarchy_original(verbose = FALSE))
  expect_no_message(polyarchy_redownloaded <- redownload_polyarchy_original(verbose = TRUE),
                    message = "The following country and/or code-years were not matched:|The following country and/or code-years were matched more than once:")
  expect_equal(sum(is.na(polyarchy_redownloaded$extended_country_name)), 0)
  expect_identical(polyarchy, polyarchy_redownloaded)
})

test_that("polyarchy dimensions redownloads correctly", {
  skip_on_cran()
  skip_on_travis()
  skip_if_offline()
  expect_silent(polyarchy_dimensions_redownloaded <- redownload_polyarchy_dimensions(verbose = FALSE))
  expect_no_message(polyarchy_dimensions_redownloaded <- redownload_polyarchy_dimensions(verbose = TRUE),
                    message = "The following country and/or code-years were not matched:|The following country and/or code-years were matched more than once:")
  expect_equal(sum(is.na(polyarchy_dimensions_redownloaded$extended_country_name)), 0)
  expect_identical(polyarchy_dimensions, polyarchy_dimensions_redownloaded)
})

test_that("PIPE redownloads correctly", {
  skip_on_cran()
  skip_on_travis()
  skip_if_offline()
  expect_silent(PIPE_redownloaded <- redownload_pipe(verbose = FALSE))
  expect_no_message(PIPE_redownloaded <- redownload_pipe(verbose = TRUE),
                    message = "The following country and/or code-years were not matched:|The following country and/or code-years were matched more than once:")
  expect_equal(sum(is.na(PIPE_redownloaded$extended_country_name)), 0)
  expect_identical(PIPE, PIPE_redownloaded)
})

test_that("REIGN redownloads correctly", {
  skip_on_cran()
  skip_on_travis()
  skip_if_offline()
  expect_silent(REIGN_redownloaded <- redownload_reign(verbose = FALSE))
  expect_no_message(REIGN_redownloaded <- redownload_reign(verbose = TRUE),
                    message = "The following country and/or code-years were not matched:")
  expect_equal(sum(is.na(REIGN_redownloaded$extended_country_name)), 0)
  expect_identical(REIGN, REIGN_redownloaded)
})

test_that("svmdi redownloads correctly", {
  skip_on_cran()
  skip_on_travis()
  skip_if_offline()
  expect_silent(svmdi_redownloaded <- redownload_svmdi(verbose = FALSE))
  expect_no_message(svmdi_redownloaded <- redownload_svmdi(verbose = TRUE),
                    message = "The following country and/or code-years were not matched:|The following country and/or code-years were matched more than once:")
  expect_equal(sum(is.na(svmdi_redownloaded$extended_country_name)), 0)
  expect_identical(svmdi, svmdi_redownloaded)
  expect_silent(svmdi_redownloaded_2016 <- redownload_svmdi(release_year = 2016, verbose = FALSE))
  expect_no_message(svmdi_redownloaded_2016 <- redownload_svmdi(release_year = 2016, verbose = TRUE),
                    message = "The following country and/or code-years were not matched:|The following country and/or code-years were matched more than once:")
  expect_equal(sum(is.na(svmdi_redownloaded_2016$extended_country_name)), 0)
  expect_identical(svmdi_2016, svmdi_redownloaded_2016)
})

test_that("Ulfelder redownloads correctly", {
  skip_on_cran()
  skip_on_travis()
  skip_if_offline()
  expect_silent(ulfelder_redownloaded <- redownload_ulfelder(verbose = FALSE))
  expect_no_message(ulfelder_redownloaded <- redownload_ulfelder(verbose = TRUE),
                    message = "The following country and/or code-years were not matched:|The following country and/or code-years were matched more than once:")
  expect_equal(sum(is.na(ulfelder_redownloaded$extended_country_name)), 0)
  expect_identical(ulfelder, ulfelder_redownloaded)
  expect_silent(ulfelder_redownloaded_extended <- redownload_ulfelder(verbose = FALSE, extend = TRUE))
  expect_no_message(ulfelder_redownloaded_extended <- redownload_ulfelder(verbose = TRUE, extend = TRUE),
                    message = "The following country and/or code-years were not matched:|The following country and/or code-years were matched more than once:")
  expect_equal(sum(is.na(ulfelder_redownloaded_extended$extended_country_name)), 0)
  expect_identical(ulfelder_extended, ulfelder_redownloaded_extended)
})

test_that("UTIP redownloads correctly", {
  skip_on_cran()
  skip_on_travis()
  skip_if_offline()
  expect_silent(utip_redownloaded <- redownload_utip(verbose = FALSE))
  expect_no_message(utip_redownloaded <- redownload_utip(verbose = TRUE),
                    message = "The following country and/or code-years were not matched:|The following country and/or code-years were matched more than once:")
  expect_equal(sum(is.na(utip_redownloaded$extended_country_name)), 0)
  expect_identical(utip, utip_redownloaded)
})

test_that("Wahman-Teorell-Hadenius redownloads correctly", {
  skip("File not available")
  skip_on_cran()
  skip_on_travis()
  skip_if_offline()
  expect_silent(wahman_teorell_hadenius_redownloaded <- redownload_wahman_teorell_hadenius(verbose = FALSE))
  expect_no_message(wahman_teorell_hadenius_redownloaded <- redownload_wahman_teorell_hadenius(verbose = TRUE),
                    message = "The following country and/or code-years were not matched:|The following country and/or code-years were matched more than once:")
  expect_equal(sum(is.na(wahman_teorell_hadenius_redownloaded$extended_country_name)), 0)
  expect_identical(wahman_teorell_hadenius, wahman_teorell_hadenius_redownloaded)
})

test_that("UDS redownloads correctly", {
  skip_on_cran()
  skip_on_travis()
  skip_if_offline()
  expect_silent(uds_redownloaded <- redownload_uds(verbose = FALSE))
  expect_no_message(uds_redownloaded <- redownload_uds(verbose = TRUE),
                    message = "The following country and/or code-years were not matched:|matched more than once:")
  expect_equal(sum(is.na(uds_redownloaded$extended_country_name)), 0)
  expect_equal(uds_2014, uds_redownloaded)

  # Optionally test other release_years (2011, 2010):
  expect_silent(uds_redownloaded_2011 <- redownload_uds(release_year = 2011, verbose = FALSE))
  expect_equal(sum(is.na(uds_redownloaded_2011$extended_country_name)), 0)
  expect_equal(uds_2011, uds_redownloaded_2011)
  expect_silent(uds_redownloaded_2010 <- redownload_uds(release_year = 2010, verbose = FALSE))
  expect_equal(sum(is.na(uds_redownloaded_2010$extended_country_name)), 0)
  expect_equal(uds_2010, uds_redownloaded_2010)
})
