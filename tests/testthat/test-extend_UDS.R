test_that("remove_empty_rows drops rows that are all NA", {
  df <- tibble::tibble(
    a = c(1, NA, NA),
    b = c(2, NA, 3),
    other = letters[1:3]
  )

  result <- remove_empty_rows(df, a:b)

  expect_equal(nrow(result), 2)
  expect_equal(result$other, c("a", "c"))
})

test_that("prepare_democracy_data applies default transformations", {
  input <- tibble::tibble(
    id = 1:3,
    arat_score = c(55, 101, NA),
    polity_score = c(-11, -5, NA),
    v2x_index = c(0.1, 0.5, NA),
    peps_total = c(4.2, 7.8, NA),
    anckar = c("low", "high", NA)
  )

  result <- prepare_democracy_data(input)

  expect_equal(result$id, 1:2)
  expect_equal(result$arat_score, c(1, 2))
  expect_true(is.na(result$polity_score[1]))
  expect_equal(result$polity_score[2], 1)
  expect_equal(result$v2x_index, c(1, 2))
  expect_equal(result$peps_total, c(1, 2))
  expect_equal(result$anckar, c(2, 1))
})

test_that("prob_more returns probabilities for same year and cross-year comparisons", {
  scores <- tibble::tibble(
    extended_country_name = c("A", "B", "A", "B"),
    year = c(2000, 2000, 2001, 2001),
    z1 = c(0.5, 0.2, 0.1, 0.7),
    se_z1 = c(0.1, 0.2, 0.3, 0.4)
  )

  same_year <- prob_more(scores, "A", "B", 2000)
  expected_same <- stats::pnorm((0.5 - 0.2) / sqrt(0.1^2 + 0.2^2))
  expect_equal(same_year, expected_same)

  cross_year <- prob_more(scores, "A", "B", c(2001, 2000))
  expected_cross <- stats::pnorm((0.1 - 0.2) / sqrt(0.3^2 + 0.2^2))
  expect_equal(cross_year, expected_cross)
})

