# Extract cutpoints from a UD model in a tidy format.

This function takes a model of the democracy scores and extracts the
discrimination parameters, score cutpoints, and standard errors for all
the variables involved, putting these into a tidy data frame.

## Usage

``` r
cutpoints(model, type = "score")
```

## Arguments

- model:

  A
  [mirt::SingleGroupClass](https://philchalmers.github.io/mirt/reference/SingleGroupClass-class.html)
  model of the democracy scores.

- type:

  A string specifying the cutpoint type. Can be (an abbreviation of)
  "score" (for score cutpoints) or "discrimination" (for discrimination
  parameters). Default is "score."

## Value

A
[`tibble::tibble()`](https://tibble.tidyverse.org/reference/tibble.html)
with either score cutpoints for each variable used to construct the
latent scores in terms of the latent variable (the default), or
discrimination parameters for each variable used to construct the index.
For the score cutpoints (`type = 'score'`), the columns `estimate`,
`pct975`, and `pct025` report the IRT parametrization of the model
estimates, a normalized measure in the same scale as the latent
variable.

## Examples

``` r
# \donttest{
# Replicate the official UDS 2011 release and calculate its cutpoints
library(dplyr)
library(mirt)
#> Loading required package: stats4
#> Loading required package: lattice
democracy_data <- generate_democracy_scores_dataset(
  selection = "_pmm", output_format = "wide", exclude_pmm_duplicates = FALSE
  )
#> Adding arat_pmm data
#> Adding blm_pmm data
#> Adding bollen_pmm data
#> Adding fh_pmm data
#> Adding hadenius_pmm data
#> Adding mainwaring_pmm data
#> Adding Munck data
#> Adding pacl_pmm data
#> Adding polity_pmm data
#> Adding polyarchy_pmm data
#> Adding prc_pmm data
#> Adding vanhanen_pmm data

democracy_data <- prepare_democracy_data(democracy_data)

replication_2011_model <- mirt(democracy_data |>
  select(matches("pmm")), model = 1, itemtype = "graded", SE = TRUE, verbose = FALSE)

cutpoints(replication_2011_model)
#> # A tibble: 85 × 6
#>    variable   estimate  pct025   pct975      se num_obs
#>    <chr>         <dbl>   <dbl>    <dbl>   <dbl>   <int>
#>  1 pmm_arat   -1.43    -1.42   -1.44    0.00526    3873
#>  2 pmm_arat   -1.02    -1.02   -1.01    0.00149    3873
#>  3 pmm_arat   -0.427   -0.449  -0.403   0.0123     3873
#>  4 pmm_arat   -0.0428  -0.0801 -0.00145 0.0211     3873
#>  5 pmm_arat    0.420    0.356   0.491   0.0361     3873
#>  6 pmm_arat    1.42     1.28    1.58    0.0797     3873
#>  7 pmm_blm    -0.00455 -0.0459  0.0871  0.0468      275
#>  8 pmm_blm     0.473    0.220   1.03    0.286       275
#>  9 pmm_bollen -1.53    -1.51   -1.55    0.0145      510
#> 10 pmm_bollen -1.08    -1.07   -1.08    0.00244     510
#> # ℹ 75 more rows
# }
```
