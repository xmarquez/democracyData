library(dplyr)

polity_problems <- data |>
  filter(cown != polity_ccode | GWn != polity_ccode) |>
  select(ends_with("country_name"), cown, GWn, polity_ccode, ends_with("startdate"), ends_with("enddate"))

polity_problems <- data |>
  filter(polity_country_name %in% polity_problems$polity_country_name |
           extended_country_name %in% polity_problems$extended_country_name) |>
  filter(!is.na(polity_country_name)) |>
  select(starts_with("polity"), starts_with("GW"), starts_with("cow")) |>
  distinct()

GW_problems <- data |>
  filter(cown != GWn)

GW_problems <- data |>
  filter(GW_country_name %in% GW_problems$GW_country_name |
           extended_country_name %in% GW_problems$extended_country_name) |>
  filter(!is.na(GW_country_name)) |>
  select(starts_with("GW"), starts_with("cow")) |>
  distinct()

test_that("pattern selection works", {
  expect_equal(
    generate_democracy_scores_dataset(selection = "pmm", exclude_pmm_duplicates = FALSE) |>
      pull(dataset) |>
      unique() |>
      length(),
    12
  )
  expect_equal(
    generate_democracy_scores_dataset(selection = "pmm", exclude_pmm_duplicates = TRUE) |>
      pull(dataset) |>
      unique() |>
      length(),
    3
  )
  expect_equal(
    generate_democracy_scores_dataset(selection = "uds") |>
      pull(dataset) |>
      unique() |>
      length(),
    3
  )
})

test_that("Release year mechanism works", {
  expect_equal(
    generate_democracy_scores_dataset(selection = "uds", uds_release_year = 2014) |>
      pull(dataset) |>
      unique(),
    "uds_2014"
  )
  expect_equal(
    generate_democracy_scores_dataset(selection = "uds", uds_release_year = c(2014, 2011)) |>
      pull(dataset) |>
      unique(),
    c("uds_2011", "uds_2014")
  )
  expect_error(
    generate_democracy_scores_dataset(selection = "svmdi", svmdi_release_year = c(2022))
  )
  expect_equal(
    generate_democracy_scores_dataset(selection = "svmdi", svmdi_release_year = c(2020)) |>
      pull(dataset) |>
      unique(),
    "svmdi"
  )
  expect_equal(
    generate_democracy_scores_dataset(selection = "svmdi", svmdi_release_year = c(2016)) |>
      pull(dataset) |>
      unique(),
    "svmdi_2016"
  )
})

test_that("All datasets are included", {
  all_datasets <- c("anckar", "anrr", "arat", "arat_pmm", "blm", "blm_pmm", "bmr",
                    "bnr", "bollen_pmm", "bti", "doorenspleet", "eiu", "fh",
                    "fh_electoral", "fh_pmm", "gwf", "hadenius_pmm", "kailitz",
                    "LIED", "magaloni", "mainwaring",
                    "mainwaring_pmm", "munck_pmm", "pacl", "pacl_pmm",
                    "pacl_update", "peps", "PIPE", "pitf", "polity_pmm",
                    "polity5", "polityIV", "polyarchy", "polyarchy_dimensions",
                    "polyarchy_pmm", "prc_gasiorowski", "prc_pmm", "REIGN", "svmdi",
                    "svmdi_2016", "svolik_regime", "uds_2010", "uds_2011", "uds_2014",
                    "ulfelder", "utip", "vanhanen", "vanhanen_pmm", "vaporeg",
                    "vdem", "wahman_teorell_hadenius", "wgi_democracy") |>
    sort()


  expect_equal(
    generate_democracy_scores_dataset(exclude_pmm_duplicates = FALSE) |>
      pull(dataset) |>
      unique() |>
      sort(),
    all_datasets
  )
})


test_that("extension mechanism works", {

  extended <- generate_democracy_scores_dataset(selection = "gwf") |>
    count(measure)

  not_extended <- generate_democracy_scores_dataset(selection = "gwf",
                                                    use_extended = FALSE) |>
    count(measure)

  n <- c(extended$n, not_extended$n)
  expect_equal(
    n,
    c(nrow(gwf_all_extended), 9243, nrow(gwf_all), 7787)
  )

})

test_that("pmm duplicates are excluded", {
  expect_equal(
    generate_democracy_scores_dataset(exclude_pmm_duplicates = TRUE) |>
      filter(str_detect(dataset, "pmm")) |>
      count(dataset) |>
      nrow(),
    3
  )
})

test_that("verbose = FALSE gives no message", {
  expect_silent(
    generate_democracy_scores_dataset(verbose = FALSE)
  )
})

test_that("force_redownload works", {
  skip_on_cran()
  skip_on_ci()
  pacl <- generate_democracy_scores_dataset(selection = "pacl")
  expect_no_message(pacl_redownload <- generate_democracy_scores_dataset(selection = "pacl",
                                                                         force_redownload = TRUE,
                                                                         verbose = FALSE))
 expect_identical(pacl, pacl_redownload)
})
