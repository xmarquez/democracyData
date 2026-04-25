# Freedom House Electoral Democracies List

Downloads the archived 2025 update of the Freedom House Electoral
Democracies list and processes it using
[country_year_coder](https://xmarquez.github.io/democracyData/reference/country_year_coder.md).
The original data is available at
<https://freedomhouse.org/report/freedom-world>, spread over a number of
different urls. This function uses the full data (see
[download_fh_full](https://xmarquez.github.io/democracyData/reference/download_fh_full.md))
to recalculate the list.

## Usage

``` r
download_fh_electoral(verbose = TRUE, return_raw = FALSE, ...)
```

## Source

Freedom House. *Freedom in the World 2025: The Uphill Battle to
Safeguard Rights*. Tech. rep. Freedom House, Feb. 2025. Original data
and methodology is available at
<https://freedomhouse.org/report/freedom-world>

## Arguments

- verbose:

  Whether to print a running commentary of what the function is doing
  while processing the data.

- return_raw:

  Whether to return the raw data, with minimal processing. Default is
  `FALSE`.

- ...:

  Other parameters passed to
  [country_year_coder](https://xmarquez.github.io/democracyData/reference/country_year_coder.md).

## Value

A time-series tidy version of the FH electoral democracies dataset, with
the following variables:

- country: The original country name.

- year: The calendar year. This is approximate. The surveys cover
  specific periods in the original data that do not always overlap with
  a single year. In particular, the year 1981 is "skipped" – a single
  survey covers Jan. 1981 - Aug. 1982 and its value is assigned to 1982
  here. Freedom House did not appear to issue a list of electoral
  democracies in its 2021 Freedom in the World report, so the year 2020
  is not available; but there is a list of electoral democracies for the
  2022 report, so the year 2021 is available. 2020 is thus "skipped".
  (It is in principle possible to reconstruct the list of electoral
  democracies using the full FH data, but the methodology is a little
  opaque).

- electoral: Electoral democracy indicator. `TRUE` = yes, `FALSE` = no.

- electoral_calc: Electoral democracy indicator, calculated from the
  full scores (see
  [download_fh_full](https://xmarquez.github.io/democracyData/reference/download_fh_full.md))
  using the definition of electoral democracy that Freedom House uses
  from 2017 onwards. `TRUE` = yes, `FALSE` = no. Because Freedom House
  changed the criteria for designating an electoral democracy in the
  2018 edition of their *Freedom in the World* report, this variable is
  included to allow users to understand which countries would not have
  been considered electoral democracies after 2017 that would have been
  considered electoral democracies before 2017. As the [Freedom House
  methodology page
  notes](https://freedomhouse.org/reports/freedom-world/freedom-world-research-methodology),
  "beginning with the 2018 edition, countries require an overall Civil
  Liberties score of 30 or better—in addition to a score of 7 or better
  in subcategory A (Electoral Process), and an overall Political Rights
  score of 20 or better—to qualify as an electoral democracy." This
  change resulted in 32 country-years that would have been classified as
  electoral democracies before 2017 not being considered electoral
  democracies using the post-2017 criteria:

    fh_electoral <- download_fh_electoral(verbose = FALSE)
    fh_electoral |>
      dplyr::filter(electoral != electoral_calc) |>
      dplyr::select(extended_country_name, year, electoral, electoral_calc) |>
      print(n = 32)
    #> # A tibble: 32 x 4
    #>    extended_country_name    year electoral electoral_calc
    #>    <chr>                   <dbl> <lgl>     <lgl>
    #>  1 Bangladesh               2013 TRUE      FALSE
    #>  2 Bangladesh               2014 TRUE      FALSE
    #>  3 Bangladesh               2015 TRUE      FALSE
    #>  4 Bangladesh               2016 TRUE      FALSE
    #>  5 Bhutan                   2012 TRUE      FALSE
    #>  6 Bhutan                   2013 TRUE      FALSE
    #>  7 Bhutan                   2014 TRUE      FALSE
    #>  8 Bhutan                   2015 TRUE      FALSE
    #>  9 Bhutan                   2016 TRUE      FALSE
    #> 10 Honduras                 2014 TRUE      FALSE
    #> 11 Kenya                    2014 TRUE      FALSE
    #> 12 Kenya                    2015 TRUE      FALSE
    #> 13 Kenya                    2016 TRUE      FALSE
    #> 14 Kosovo                   2014 TRUE      FALSE
    #> 15 Kosovo                   2015 TRUE      FALSE
    #> 16 Kosovo                   2016 TRUE      FALSE
    #> 17 Libya                    2012 TRUE      FALSE
    #> 18 Libya                    2013 TRUE      FALSE
    #> 19 Maldives                 2014 TRUE      FALSE
    #> 20 Nepal                    2013 TRUE      FALSE
    #> 21 Nepal                    2014 TRUE      FALSE
    #> 22 Nepal                    2015 TRUE      FALSE
    #> 23 Nepal                    2016 TRUE      FALSE
    #> 24 Niger                    2015 TRUE      FALSE
    #> 25 Nigeria                  2015 TRUE      FALSE
    #> 26 Nigeria                  2016 TRUE      FALSE
    #> 27 Pakistan                 2013 TRUE      FALSE
    #> 28 Pakistan                 2014 TRUE      FALSE
    #> 29 Pakistan                 2015 TRUE      FALSE
    #> 30 Pakistan                 2016 TRUE      FALSE
    #> 31 Turkey (Ottoman Empire)  2014 TRUE      FALSE
    #> 32 Turkey (Ottoman Empire)  2015 TRUE      FALSE

Note that `electoral_calc` is not available for years before 2012,
because Freedom House does not make available full scores for years
before 2012, despite the fact that the list of electoral democracies
goes back to 1989.

## Standard descriptive variables (generated by this package)

- extended_country_name:

  The name of the country in the Gleditsch-Ward system of states, or the
  official name of the entity (for non-sovereign entities and states not
  in the Gleditsch and Ward system of states) or else a common name for
  disputed cases that do not have an official name (e.g., Western
  Sahara, Hyderabad). The Gleditsch and Ward scheme sometimes indicates
  the common name of the country and (in parentheses) the name of an
  earlier incarnation of the state: thus, they have Germany (Prussia),
  Russia (Soviet Union), Madagascar (Malagasy), etc. For details, see
  Gleditsch, Kristian S. & Michael D. Ward. 1999. "Interstate System
  Membership: A Revised List of the Independent States since 1816."
  International Interactions 25: 393-413. The list can be found via the
  Wayback Machine at
  <https://web.archive.org/web/20130627160240/http://privatewww.essex.ac.uk/~ksg/statelist.html>.

- GWn:

  Gleditsch and Ward's numeric country code, from the Gleditsch and Ward
  list of independent states.

- cown:

  The Correlates of War numeric country code, 2016 version. This differs
  from Gleditsch and Ward's numeric country code in a few cases. See
  <https://correlatesofwar.org/data-sets/state-system-membership/> for
  the full list.

- in_GW_system:

  Whether the state is "in system" (that is, is independent and
  sovereign), according to Gleditsch and Ward, for this particular date.
  Matches at the end of the year; so, for example South Vietnam 1975 is
  `FALSE` because, according to Gleditsch and Ward, the country ended on
  April 1975 (being absorbed by North Vietnam). It is also `TRUE` for
  dates beyond 2012 for countries that did not end by then, depsite the
  fact that the Gleditsch and Ward list has not been updated since.

## Lifecycle

This function is softly deprecated. It is retained to reconstruct the
last public Freedom House electoral-democracy release (the 2025 update,
covering 2024), but it no longer retrieves a current release.

## Note

The datasets downloaded by the `download_*` family of functions are not
directly available in this package. You will always need to directly
download them in order to use them.

## See also

Other democracy:
[`LIED`](https://xmarquez.github.io/democracyData/reference/LIED.md),
[`PIPE`](https://xmarquez.github.io/democracyData/reference/PIPE.md),
[`REIGN`](https://xmarquez.github.io/democracyData/reference/REIGN.md),
[`anckar`](https://xmarquez.github.io/democracyData/reference/anckar.md),
[`anrr`](https://xmarquez.github.io/democracyData/reference/anrr.md),
[`arat_pmm`](https://xmarquez.github.io/democracyData/reference/arat_pmm.md),
[`blm`](https://xmarquez.github.io/democracyData/reference/blm.md),
[`bmr`](https://xmarquez.github.io/democracyData/reference/bmr.md),
[`bnr`](https://xmarquez.github.io/democracyData/reference/bnr.md),
[`bollen_pmm`](https://xmarquez.github.io/democracyData/reference/bollen_pmm.md),
[`bti`](https://xmarquez.github.io/democracyData/reference/bti.md),
[`doorenspleet`](https://xmarquez.github.io/democracyData/reference/doorenspleet.md),
[`download_fh()`](https://xmarquez.github.io/democracyData/reference/download_fh.md),
[`download_fh_full()`](https://xmarquez.github.io/democracyData/reference/download_fh_full.md),
[`download_wgi_voice_and_accountability()`](https://xmarquez.github.io/democracyData/reference/download_wgi_voice_and_accountability.md),
[`eiu`](https://xmarquez.github.io/democracyData/reference/eiu.md),
[`extended_uds`](https://xmarquez.github.io/democracyData/reference/extended_uds.md),
[`fh_pmm`](https://xmarquez.github.io/democracyData/reference/fh_pmm.md),
[`gwf_all`](https://xmarquez.github.io/democracyData/reference/gwf_all.md),
[`hadenius_pmm`](https://xmarquez.github.io/democracyData/reference/hadenius_pmm.md),
[`kailitz`](https://xmarquez.github.io/democracyData/reference/kailitz.md),
[`magaloni`](https://xmarquez.github.io/democracyData/reference/magaloni.md),
[`mainwaring`](https://xmarquez.github.io/democracyData/reference/mainwaring.md),
[`munck_pmm`](https://xmarquez.github.io/democracyData/reference/munck_pmm.md),
[`pacl`](https://xmarquez.github.io/democracyData/reference/pacl.md),
[`pacl_update`](https://xmarquez.github.io/democracyData/reference/pacl_update.md),
[`peps`](https://xmarquez.github.io/democracyData/reference/peps.md),
[`pitf`](https://xmarquez.github.io/democracyData/reference/pitf.md),
[`polityIV`](https://xmarquez.github.io/democracyData/reference/polityIV.md),
[`polity_pmm`](https://xmarquez.github.io/democracyData/reference/polity_pmm.md),
[`polyarchy`](https://xmarquez.github.io/democracyData/reference/polyarchy.md),
[`polyarchy_dimensions`](https://xmarquez.github.io/democracyData/reference/polyarchy_dimensions.md),
[`prc_gasiorowski`](https://xmarquez.github.io/democracyData/reference/prc_gasiorowski.md),
[`svmdi`](https://xmarquez.github.io/democracyData/reference/svmdi.md),
[`svolik_regime`](https://xmarquez.github.io/democracyData/reference/svolik_regime.md),
[`uds_2014`](https://xmarquez.github.io/democracyData/reference/uds_2014.md),
[`ulfelder`](https://xmarquez.github.io/democracyData/reference/ulfelder.md),
[`utip`](https://xmarquez.github.io/democracyData/reference/utip.md),
[`vanhanen`](https://xmarquez.github.io/democracyData/reference/vanhanen.md),
[`vaporeg`](https://xmarquez.github.io/democracyData/reference/vaporeg.md),
[`vaporeg_2024`](https://xmarquez.github.io/democracyData/reference/vaporeg_2024.md),
[`vdem_simple`](https://xmarquez.github.io/democracyData/reference/vdem_simple.md),
[`wahman_teorell_hadenius`](https://xmarquez.github.io/democracyData/reference/wahman_teorell_hadenius.md),
[`wgi_legacy`](https://xmarquez.github.io/democracyData/reference/wgi_legacy.md)

Other Freedom House:
[`download_fh()`](https://xmarquez.github.io/democracyData/reference/download_fh.md),
[`download_fh_full()`](https://xmarquez.github.io/democracyData/reference/download_fh_full.md),
[`fh_pmm`](https://xmarquez.github.io/democracyData/reference/fh_pmm.md)

Other ordinal democracy indexes:
[`download_fh()`](https://xmarquez.github.io/democracyData/reference/download_fh.md),
[`download_fh_full()`](https://xmarquez.github.io/democracyData/reference/download_fh_full.md),
[`fh_pmm`](https://xmarquez.github.io/democracyData/reference/fh_pmm.md),
[`polityIV`](https://xmarquez.github.io/democracyData/reference/polityIV.md),
[`polity_pmm`](https://xmarquez.github.io/democracyData/reference/polity_pmm.md)

## Examples

``` r
if (FALSE) { # \dontrun{
fh <- download_fh_electoral()
fh
} # }
```
