# Create a panel of countries belonging in the state system.

Create a panel of countries belonging in the state system.

## Usage

``` r
create_panel(system = c("cow", "GW", "polity"), max_year = NULL)
```

## Arguments

- system:

  The state system to target. The possibilities are "cow"
  (<https://correlatesofwar.org/data-sets/state-system-membership/>, the
  default), "GW" (Gleditsch and Ward, from Gleditsch, Kristian S. &
  Michael D. Ward. 1999. "Interstate System Membership: A Revised List
  of the Independent States since 1816." International Interactions 25:
  393-413, available via the Wayback Machine at
  <https://web.archive.org/web/20130627160240/http://privatewww.essex.ac.uk/~ksg/statelist.html>),
  or "polity" (for the
  <https://www.systemicpeace.org/polityproject.html> system of states).

- max_year:

  The maximum year in the panel. If NULL, uses the current year.

## Value

A
[`tibble::tibble()`](https://tibble.tidyverse.org/reference/tibble.html)
with the country code in the relevant system of states, the official
country name and years when the country belongs to the system, and the
relevant start and end dates for entry and exit into the system.

## Examples

``` r
create_panel("cow") # The correlates of War system is the default
#> # A tibble: 17,816 × 5
#>     cown cow_country_name cow_startdate cow_enddate  year
#>    <dbl> <chr>            <date>        <date>      <dbl>
#>  1   700 Afghanistan      1919-08-08    NA           1919
#>  2   700 Afghanistan      1919-08-08    NA           1920
#>  3   700 Afghanistan      1919-08-08    NA           1921
#>  4   700 Afghanistan      1919-08-08    NA           1922
#>  5   700 Afghanistan      1919-08-08    NA           1923
#>  6   700 Afghanistan      1919-08-08    NA           1924
#>  7   700 Afghanistan      1919-08-08    NA           1925
#>  8   700 Afghanistan      1919-08-08    NA           1926
#>  9   700 Afghanistan      1919-08-08    NA           1927
#> 10   700 Afghanistan      1919-08-08    NA           1928
#> # ℹ 17,806 more rows
create_panel("GW") # Use this for the Gleditsch and Ward system
#> # A tibble: 20,726 × 5
#>      GWn GW_country_name GW_startdate GW_enddate  year
#>    <dbl> <chr>           <date>       <date>     <dbl>
#>  1   700 Afghanistan     1919-05-01   NA          1919
#>  2   700 Afghanistan     1919-05-01   NA          1920
#>  3   700 Afghanistan     1919-05-01   NA          1921
#>  4   700 Afghanistan     1919-05-01   NA          1922
#>  5   700 Afghanistan     1919-05-01   NA          1923
#>  6   700 Afghanistan     1919-05-01   NA          1924
#>  7   700 Afghanistan     1919-05-01   NA          1925
#>  8   700 Afghanistan     1919-05-01   NA          1926
#>  9   700 Afghanistan     1919-05-01   NA          1927
#> 10   700 Afghanistan     1919-05-01   NA          1928
#> # ℹ 20,716 more rows
create_panel("polity", max_year = 1997) # You can specify a maximum year
#> # A tibble: 13,964 × 5
#>    polity_ccode polity_country_name polity_startdate polity_enddate  year
#>           <dbl> <chr>               <date>           <date>         <dbl>
#>  1          700 Afghanistan         1800-01-01       NA              1800
#>  2          700 Afghanistan         1800-01-01       NA              1801
#>  3          700 Afghanistan         1800-01-01       NA              1802
#>  4          700 Afghanistan         1800-01-01       NA              1803
#>  5          700 Afghanistan         1800-01-01       NA              1804
#>  6          700 Afghanistan         1800-01-01       NA              1805
#>  7          700 Afghanistan         1800-01-01       NA              1806
#>  8          700 Afghanistan         1800-01-01       NA              1807
#>  9          700 Afghanistan         1800-01-01       NA              1808
#> 10          700 Afghanistan         1800-01-01       NA              1809
#> # ℹ 13,954 more rows
```
