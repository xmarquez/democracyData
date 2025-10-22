library(dplyr)

test_that("The LIED index is correctly constructed", {
  expect_false(LIED |>
                 mutate(L0 = (legselec == 0 & exselec == 0)*1,
                        L1 = (legselec | exselec)*2,
                        L2 = (legselec & opposition)*3,
                        L3 = (legselec & exselec & opposition)*4,
                        L4 = (legselec & exselec & opposition & competition)*5,
                        L5 = (legselec & exselec & opposition & competition & (male_suffrage | female_suffrage))*6,
                        L6 = (legselec & exselec & opposition & competition & male_suffrage & female_suffrage)*7) |>
                 rowwise() |>
                 mutate(lexical_index_fixed = max(L0,L1,L2,L3,L4,L5,L6) - 1) |>
                 ungroup() |>
                 count(equality = lexical_index != lexical_index_fixed) |>
                 pull(equality))
})

test_that("The LIED dataset has a column called lied_country", {
  expect_true("lied_country"  %in% names(LIED))
})
