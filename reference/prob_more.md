# Probability that a country-year is more democratic than another

Probability that a country-year is more democratic than another

## Usage

``` r
prob_more(
  data,
  country1,
  country2,
  years,
  mean_col = "z1",
  sd_col = "se_z1",
  country_col = "extended_country_name",
  year_col = "year"
)
```

## Arguments

- data:

  A UD dataset with a country_name, year, latent variable mean and
  latent variable standard deviation columns at least. Little sanity
  checking is performed - careful!

- country1:

  The first country to compare.

- country2:

  The second country to compare. Can be the same as `country1`

- years:

  Either a single year, or a length 2 vector of years.

- mean_col:

  The name of the column that contains the mean of the latent variable
  (defaults to `z1`)

- sd_col:

  The name of the column that contains the standard error of the latent
  variable (defaults to `se_z1`)

- country_col:

  The name of the column that contains the country name (defaults to
  `extended_country_name`)

- year_col:

  The name of the column that contains the years (defaults to `year`)

## Value

The probability that the first country-year in the comparison is more
democratic than the second.

## Examples

``` r
# Probability that the USA in 2000 was more democratic than Brazil in 2000,
# according to 2010 release of UDS
prob_more(uds_2010, "United States of America","Brazil",
          2000, mean_col="mean", sd_col="sd")
#> [1] 0.9468881
# Probability that Brazil in 1980 was more democratic than the USA in 1980,
# according to 2010 release of UDS
prob_more(uds_2010, "Brazil","United States of America",
          1980, mean_col="mean", sd_col="sd")
#> [1] 2.325305e-06
# Probability that the USA in 2000 was more democratic than the USA in 1950,
# according to 2010 release of UDS
prob_more(uds_2010, "United States of America","United States of America",
           years = c(2000,1950), mean_col="mean", sd_col="sd")
#> [1] 0.7605136
```
