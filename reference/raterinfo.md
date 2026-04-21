# Extract rater info from a UD model in a tidy format.

Extract rater info from a UD model in a tidy format.

## Usage

``` r
raterinfo(model)
```

## Arguments

- model:

  A
  [mirt::SingleGroupClass](https://philchalmers.github.io/mirt/reference/SingleGroupClass-class.html)
  model of the democracy scores.

## Value

A data frame with rater information for each democracy index over the
range of the latent variable `theta`.

## Examples

``` r
# \donttest{
# Replicate the official UDS scores (2011 release)
library(dplyr)
library(mirt)
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

raterinfo(replication_2011_model)
#> # A tibble: 732 × 3
#>    rater    theta       info
#>    <chr>    <dbl>      <dbl>
#>  1 pmm_arat  -6   0.00000122
#>  2 pmm_arat  -5.8 0.00000247
#>  3 pmm_arat  -5.6 0.00000502
#>  4 pmm_arat  -5.4 0.0000102 
#>  5 pmm_arat  -5.2 0.0000206 
#>  6 pmm_arat  -5   0.0000418 
#>  7 pmm_arat  -4.8 0.0000849 
#>  8 pmm_arat  -4.6 0.000172  
#>  9 pmm_arat  -4.4 0.000349  
#> 10 pmm_arat  -4.2 0.000708  
#> # ℹ 722 more rows
# }
```
