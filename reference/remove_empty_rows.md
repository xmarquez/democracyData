# Removes empty rows (rows with all NAs) from a data frame

Removes empty rows (rows with all NAs) from a data frame

## Usage

``` r
remove_empty_rows(df, vars)
```

## Arguments

- df:

  A data frame

- vars:

  The variables to select

## Value

The original data frame, with the empty rows for the variables selected
removed

## Examples

``` r
df <- data.frame(a = c(1,2,3,NA, 5), b = c(NA,1,2,NA, 3), c = 1:5)
remove_empty_rows(df, a:b)
#>   a  b c
#> 1 1 NA 1
#> 2 2  1 2
#> 3 3  2 3
#> 4 5  3 5

# Different from
na.omit(df)
#>   a b c
#> 2 2 1 2
#> 3 3 2 3
#> 5 5 3 5
```
