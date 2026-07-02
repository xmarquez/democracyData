# Helper for the live redownload integration tests in test_redownloadable.R.

# Diagnostic messages from country_year_coder that indicate a country-year
# matching problem in the freshly downloaded data.
country_coding_messages <- paste0(
  "The following country and/or code-years were not matched:",
  "|The following country and/or code-years were matched more than once:"
)

# Redownload a dataset and check that it processes cleanly and matches the
# packaged copy:
#   1. the quiet run (verbose = FALSE) produces no output;
#   2. the verbose run emits none of the country-coding diagnostics in
#      `match_message`;
#   3. no extended_country_name is missing;
#   4. the result matches `packaged` (identical by default; use
#      comparison = "equal" for datasets stored with attribute differences).
# `skip_message` turns download errors into skips for flaky sources (this also
# disables the silence check, since the source may emit retry noise). Set
# `check_verbose = FALSE` to skip the second, verbose download for secondary
# release snapshots. Returns the redownloaded data invisibly so callers can
# add dataset-specific expectations.
expect_redownloads_cleanly <- function(
  packaged,
  fun,
  ...,
  match_message = country_coding_messages,
  comparison = c("identical", "equal"),
  skip_message = NULL,
  check_verbose = TRUE
) {
  comparison <- match.arg(comparison)

  run <- function(verbose) {
    if (is.null(skip_message)) {
      fun(verbose = verbose, ...)
    } else {
      tryCatch(
        fun(verbose = verbose, ...),
        error = function(e) {
          testthat::skip(paste(skip_message, conditionMessage(e)))
        }
      )
    }
  }

  if (is.null(skip_message)) {
    testthat::expect_silent(redownloaded <- run(verbose = FALSE))
  } else {
    redownloaded <- run(verbose = FALSE)
  }

  if (check_verbose) {
    testthat::expect_no_message(
      redownloaded <- run(verbose = TRUE),
      message = match_message
    )
  }

  testthat::expect_equal(sum(is.na(redownloaded$extended_country_name)), 0)

  if (comparison == "identical") {
    testthat::expect_identical(packaged, redownloaded)
  } else {
    testthat::expect_equal(packaged, redownloaded)
  }

  invisible(redownloaded)
}
