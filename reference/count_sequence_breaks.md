# Count sequence breaks

This is a utility function that is useful when plotting countries that
have interrupted periods.

## Usage

``` r
count_sequence_breaks(seq, seq_step = 1)
```

## Arguments

- seq:

  A numeric sequence

- seq_step:

  The expected difference between steps in sequence

## Value

A numeric vector with the sequence groups

## Examples

``` r
library(dplyr)
#> 
#> Attaching package: ‘dplyr’
#> The following objects are masked from ‘package:stats’:
#> 
#>     filter, lag
#> The following objects are masked from ‘package:base’:
#> 
#>     intersect, setdiff, setequal, union
count_sequence_breaks(c(1900:1910, 1920:1930))
#>  [1] 1 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2

# This is how I typically use it

polityIV |>
group_by(polityIV_country, polityIV_ccode) |>
mutate(groups = count_sequence_breaks(year)) |>
filter(any(groups > 1))
#> # A tibble: 689 × 41
#> # Groups:   polityIV_country, polityIV_ccode [7]
#>     cyear polityIV_ccode scode polityIV_country  year  flag fragment democ autoc
#>     <dbl>          <dbl> <chr> <chr>            <dbl> <dbl>    <dbl> <dbl> <dbl>
#>  1 2.55e6            255 GMY   Germany           1868     0       NA   -88   -88
#>  2 2.55e6            255 GMY   Germany           1869     0       NA   -88   -88
#>  3 2.55e6            255 GMY   Germany           1870     0       NA   -88   -88
#>  4 2.55e6            255 GMY   Germany           1871     0       NA     0     4
#>  5 2.55e6            255 GMY   Germany           1872     0       NA     0     4
#>  6 2.55e6            255 GMY   Germany           1873     0       NA     0     4
#>  7 2.55e6            255 GMY   Germany           1874     0       NA     0     4
#>  8 2.55e6            255 GMY   Germany           1875     0       NA     0     4
#>  9 2.55e6            255 GMY   Germany           1876     0       NA     0     4
#> 10 2.55e6            255 GMY   Germany           1877     0       NA     0     4
#> # ℹ 679 more rows
#> # ℹ 32 more variables: polity <dbl>, polity2 <dbl>, durable <dbl>, xrreg <dbl>,
#> #   xrcomp <dbl>, xropen <dbl>, xconst <dbl>, parreg <dbl>, parcomp <dbl>,
#> #   exrec <dbl>, exconst <dbl>, polcomp <dbl>, prior <dbl>, emonth <dbl>,
#> #   eday <dbl>, eyear <dbl>, eprec <dbl>, interim <dbl>, bmonth <dbl>,
#> #   bday <dbl>, byear <dbl>, bprec <dbl>, post <dbl>, change <dbl>, d4 <dbl>,
#> #   sf <dbl>, regtrans <dbl>, extended_country_name <chr>, GWn <dbl>, …
```
