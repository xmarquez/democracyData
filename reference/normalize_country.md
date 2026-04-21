# Normalize a country name for matching

Applies the transformations
[`country_year_coder()`](https://xmarquez.github.io/democracyData/reference/country_year_coder.md)
uses on user-supplied country strings before the fuzzy regex join:
transliterate to ASCII (to drop diacritics), lowercase, replace runs of
punctuation with a single space, collapse whitespace, and trim.

## Usage

``` r
normalize_country(x)
```

## Arguments

- x:

  A character vector.

## Value

A normalized character vector, same length as `x`.

## Details

Exported so callers who pre-merge their data against an external lookup
can apply the same normalization to both sides and avoid surprises
stemming from diacritics or punctuation.

## Examples

``` r
democracyData::normalize_country(c("T\u00fcrkiye", "C\u00f4te d'Ivoire", "U.S.A.", "UK"))
#> [1] "turkiye"       "cote d ivoire" "u s a"         "uk"           
```
