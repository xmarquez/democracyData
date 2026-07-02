library(dplyr)

testthat::skip_if_not(
  identical(
    tolower(Sys.getenv("RUN_REDOWNLOAD_TESTS", unset = "false")),
    "true"
  ),
  "Set RUN_REDOWNLOAD_TESTS=true to run live redownload integration tests."
)

skip_redownload_checks <- function() {
  skip_on_cran()
  skip_on_ci()
  skip_if_offline()
}

test_that("Anckar redownloads correctly", {
  skip_redownload_checks()
  expect_redownloads_cleanly(anckar, redownload_anckar)
})

test_that("BLM redownloads correctly", {
  skip_redownload_checks()
  expect_redownloads_cleanly(blm, redownload_blm)
})

test_that("BMR redownloads correctly", {
  skip_redownload_checks()
  expect_redownloads_cleanly(bmr, redownload_bmr)
})

test_that("BTI redownloads correctly", {
  skip_redownload_checks()
  bti_redownloaded <- expect_redownloads_cleanly(bti, redownload_bti)
  expect_equal(max(bti_redownloaded$year), 2024)
  expect_equal(max(bti_redownloaded$report_year), 2026)
})

test_that("GWF-autocratic redownloads correctly", {
  skip_redownload_checks()
  expect_redownloads_cleanly(
    gwf_autocratic,
    redownload_gwf,
    dataset = "autocratic"
  )
})

test_that("GWF-all redownloads correctly", {
  skip_redownload_checks()
  expect_redownloads_cleanly(gwf_all, redownload_gwf, dataset = "all")
})

test_that("LIED redownloads correctly", {
  skip_redownload_checks()
  LIED_redownloaded <- expect_redownloads_cleanly(
    LIED,
    redownload_lied,
    match_message = paste0(
      "The following country and/or code-years were not matched:",
      "|Note: the number of rows in the processed LIED data is different"
    )
  )
  expect_equal(max(LIED_redownloaded$year), 2025)
})

test_that("VaPoReg redownloads correctly", {
  skip_redownload_checks()
  expect_silent(vaporeg_redownloaded <- redownload_vaporeg(verbose = FALSE))
  expect_message(
    vaporeg_redownloaded <- redownload_vaporeg(verbose = TRUE),
    "Processing the VaPoReg data - adding state system info"
  )
  expect_equal(ncol(vaporeg_redownloaded), 46)
  expect_equal(max(vaporeg_redownloaded$year), 2025)
  expect_true(
    all(
      c(
        "vaporeg_country",
        "vaporeg_cowcode",
        "extended_country_name",
        "GWn",
        "cown",
        "in_GW_system",
        "vaporeg_binary_strict",
        "vaporeg_binary_non_strict",
        "vaporeg_trichotomous"
      ) %in%
        names(vaporeg_redownloaded)
    )
  )
  expect_false(any(
    c("country_name", "cowcode") %in% names(vaporeg_redownloaded)
  ))
  expect_identical(vaporeg, vaporeg_redownloaded)
})

test_that("VaPoReg legacy snapshot remains available", {
  expect_equal(max(vaporeg_2024$year), 2024)
  expect_true(
    all(
      c(
        "extended_country_name",
        "GWn",
        "cown",
        "vaporeg_binary_strict",
        "vaporeg_binary_non_strict",
        "vaporeg_trichotomous"
      ) %in%
        names(vaporeg_2024)
    )
  )
})

test_that("magaloni redownloads correctly", {
  skip_redownload_checks()
  expect_redownloads_cleanly(magaloni, redownload_magaloni)
})

test_that("PACL redownloads correctly", {
  skip_redownload_checks()
  expect_redownloads_cleanly(pacl, redownload_pacl)
})

test_that("PACL update redownloads correctly", {
  skip_redownload_checks()
  expect_redownloads_cleanly(pacl_update, redownload_pacl_update)
})

test_that("peps redownloads correctly", {
  skip_redownload_checks()
  expect_redownloads_cleanly(peps, redownload_peps)
})

test_that("polityIV redownloads correctly", {
  skip_redownload_checks()
  expect_redownloads_cleanly(polityIV, redownload_polityIV)
})

test_that("polyarchy redownloads correctly", {
  skip_redownload_checks()
  expect_redownloads_cleanly(
    polyarchy,
    redownload_polyarchy_original,
    skip_message = "Polyarchy source unavailable:"
  )
})

test_that("polyarchy dimensions redownloads correctly", {
  skip_redownload_checks()
  expect_redownloads_cleanly(
    polyarchy_dimensions,
    redownload_polyarchy_dimensions,
    skip_message = "Polyarchy dimensions source unavailable:"
  )
})

test_that("PIPE redownloads correctly", {
  skip_redownload_checks()
  expect_redownloads_cleanly(PIPE, redownload_pipe)
})

test_that("REIGN redownloads correctly", {
  skip_redownload_checks()
  expect_redownloads_cleanly(
    REIGN,
    redownload_reign,
    match_message = "The following country and/or code-years were not matched:"
  )
})

test_that("svmdi redownloads correctly", {
  skip_redownload_checks()
  expect_redownloads_cleanly(svmdi, redownload_svmdi)
  expect_redownloads_cleanly(svmdi_2016, redownload_svmdi, release_year = 2016)
})

test_that("Ulfelder redownloads correctly", {
  skip_redownload_checks()
  expect_redownloads_cleanly(ulfelder, redownload_ulfelder)
  expect_redownloads_cleanly(
    ulfelder_extended,
    redownload_ulfelder,
    extend = TRUE
  )
})

test_that("UTIP redownloads correctly", {
  skip_redownload_checks()
  expect_redownloads_cleanly(utip, redownload_utip)
})

test_that("Wahman-Teorell-Hadenius redownloads correctly", {
  skip("File not available")
  skip_redownload_checks()
  expect_redownloads_cleanly(
    wahman_teorell_hadenius,
    redownload_wahman_teorell_hadenius
  )
})

test_that("UDS redownloads correctly", {
  skip_redownload_checks()
  expect_redownloads_cleanly(
    uds_2014,
    redownload_uds,
    match_message = paste0(
      "The following country and/or code-years were not matched:",
      "|matched more than once:"
    ),
    comparison = "equal"
  )
  expect_redownloads_cleanly(
    uds_2011,
    redownload_uds,
    release_year = 2011,
    comparison = "equal",
    check_verbose = FALSE
  )
  expect_redownloads_cleanly(
    uds_2010,
    redownload_uds,
    release_year = 2010,
    comparison = "equal",
    check_verbose = FALSE
  )
})
