library(dplyr)

test_that("Extended versions of Magaloni only extend up to 1949, except for Pakistan", {
  expect_equal(anti_join(magaloni_extended, magaloni) |>
                 pull(year) |>
                 max(), 1971)
  expect_equal(anti_join(magaloni_extended, magaloni) |>
                 filter(magaloni_country == "Pakistan") |>
                 nrow(), 6)
  expect_equal(anti_join(magaloni_extended, magaloni) |>
                 filter(magaloni_country != "Pakistan") |>
                 pull(year) |>
                 max(), 1949)
})
