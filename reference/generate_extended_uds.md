# Generates the extended UDS scores from the latest democracy data in this package

Generates the extended UDS scores from the latest democracy data in this
package

## Usage

``` r
generate_extended_uds(verbose = FALSE)
```

## Arguments

- verbose:

  Whether to print diagnostic information about what the function is
  doing, including information from
  [mirt::mirt](https://philchalmers.github.io/mirt/reference/mirt.html)
  about the model being fit. Default is `FALSE`.

## Value

A
[`tibble::tibble()`](https://tibble.tidyverse.org/reference/tibble.html)
described in
[extended_uds](https://xmarquez.github.io/democracyData/reference/extended_uds.md).
Right now there's no flexibility at all to choose the variables to
generate this data, though this might change in the future. See
`vignette("Replicating_and_extending_the_UD_scores")` for more info on
how to generate these scores for arbitrary measures.

## Examples

``` r
if (FALSE) { # \dontrun{
extended_uds <- generate_extended_uds()
} # }
```
