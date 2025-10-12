library(dplyr)

test_that("Freedom House data downloads correctly", {
  skip_on_cran()
  skip_on_travis()
  expect_silent(fh_downloaded <- download_fh(verbose = FALSE))
  expect_message(fh_downloaded <- download_fh(), regexp = "Processing the FH 2024 data")
  expect_no_message(fh_downloaded <- download_fh(), message = "The following country and/or code-years were matched more than once")
  expect_equal(nrow(fh_downloaded), 9435)
  expect_equal(max(fh_downloaded$year), 2024)
  expect_false(any(is.na(fh_downloaded$GWn)))
  expect_false(any(is.na(fh_downloaded$extended_country_name)))
})

test_that("Freedom House data with territories downloads correctly", {
  skip_on_cran()
  skip_on_travis()
  expect_silent(fh_downloaded <- download_fh(verbose = FALSE, include_territories = TRUE))
  expect_no_message(fh_downloaded <- download_fh(include_territories = TRUE),
                    message = "The following country and/or code-years were not matched")
  expect_equal(nrow(fh_downloaded), 9966)
  expect_equal(max(fh_downloaded$year), 2024)
  expect_equal(sum(is.na(fh_downloaded$GWn)), 419)
  expect_false(any(is.na(fh_downloaded$extended_country_name)))
  expect_identical(fh_downloaded, fh)
})


test_that("Freedom House electoral democracies data downloads correctly", {
  skip_on_cran()
  skip_on_travis()
  expect_silent(fh_electoral_downloaded <- download_fh_electoral(verbose = FALSE))
  expect_message(fh_electoral_downloaded <- download_fh_electoral(),
                 regexp = "Processing the FH Electoral Democracies 1989-2024 data")
  expect_no_message(fh_electoral_downloaded <- download_fh_electoral(),
                    message = "The following country and/or code-years were not matched")
  expect_equal(nrow(fh_electoral_downloaded), 6997)
  expect_equal(max(fh_electoral_downloaded$year), 2024)
  # expect_false(any(is.na(fh_electoral_downloaded$GWn)))
  expect_false(any(is.na(fh_electoral_downloaded$extended_country_name)))
  urls <- find_url("fh_electoral")
  later_urls <- lapply(urls[-1], \(x) read_data(x, verbose = FALSE, skip = 1)) %>%
    lapply(function(x) rename_with(x, ~"electoral",
                                   starts_with("Electoral Democracy")))
  for(i in 1:length(later_urls)) {
    later_urls[[i]] <- later_urls[[i]] %>%
      mutate(year = 2017+i,
             electoral = ifelse(.data$electoral %in% c("yes", "Yes"), TRUE, FALSE),
             country = case_when(.data$Country == "Yemen, S." ~ "South Yemen",
                                 .data$Country == "Vietnam, S." ~ "South Vietnam",
                                 .data$Country == "Germany, E." ~ "East Germany",
                                 TRUE ~ as.character(.data$Country))) %>%
      select(-"Country")
  }

  from_spreadsheets <- bind_rows(later_urls) |>
    mutate(year = case_when(year < 2021 ~ year - 1,
                            TRUE ~ year)) |>
    country_year_coder(country,
                       year,
                       match_type = c("country"),
                       verbose = FALSE) |>
    rename(electoral_fs = electoral) |>
    select(-country)

  expect_equal(nrow(from_spreadsheets |>
                      left_join(fh_electoral_downloaded) |>
                      filter(electoral_fs != electoral)), 0)
  expect_equal(fh_electoral_downloaded |>
                 filter(electoral != electoral_calc) |>
                 nrow(), 32)

})

test_that("Freedom House full data downloads correctly", {
  skip_on_cran()
  skip_on_travis()
  expect_silent(fh_full_downloaded <- download_fh_full(verbose = FALSE))
  expect_message(fh_full_downloaded <- download_fh_full(),
                 regexp = "Processing the FH full 2013-2024 data - ")
  expect_no_message(fh_full_downloaded <- download_fh_full(),
                    message = "The following country and/or code-years were not matched")
  expect_equal(nrow(fh_full_downloaded), 2724)
  expect_equal(max(fh_full_downloaded$year), 2024)
  expect_equal(sum(is.na(fh_full_downloaded$GWn)), 148)
})
