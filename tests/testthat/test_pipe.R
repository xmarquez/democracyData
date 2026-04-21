library(dplyr)

test_that("PIPE regime variables are undefined before independence", {
  expect_equal(
    PIPE |>
      filter(polstatus <= 0, !is.na(regime)) |>
      nrow(),
    0
  )

  expect_equal(
    PIPE |>
      filter(polstatus <= 0, !is.na(regime_period)) |>
      nrow(),
    0
  )
})

test_that("PIPE cumulative democracy ingredients are monotone within republican periods", {
  expect_true(
    PIPE |>
      group_by(country_number, republican_period) |>
      arrange(year, .by_group = TRUE) |>
      summarise(
        salterel_ok = all(diff(cum_salterel) %in% c(0, 1)),
        term_ok = all(diff(cum_term) %in% c(0, 1)),
        .groups = "drop"
      ) |>
      summarise(ok = all(salterel_ok & term_ok)) |>
      pull(ok)
  )
})

test_that("PIPE democracy is not undone by special SALTEREL or TERM codes", {
  expect_true(
    PIPE |>
      filter(PIPE_country == "Costa Rica", year %in% 1909:1916) |>
      pull(democracy2) |>
      all()
  )

  expect_true(
    PIPE |>
      filter(PIPE_country == "St. Lucia", year %in% 1982:1996) |>
      pull(democracy2) |>
      all()
  )
})
