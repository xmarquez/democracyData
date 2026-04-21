# Freedom House "Freedom in the World" data

`fh_pmm` archives the Freedom House data included in D. Pemstein, S. A.
Meserve, and J. Melton. *Replication Data for: Democratic Compromise: A
Latent Variable Analysis of Ten Measures of Regime Type*. 2013. DOI:
10.7910/DVN/WWYOHU. HDL: 1902.1/PMM., while `fh` archives the 2025
edition of the Freedom in the World data (updated to 2024). Freedom
House no longer makes new versions of the data available for free
download; contact <research@freedomhouse.org> for details. Use
[download_fh](https://xmarquez.github.io/democracyData/reference/download_fh.md)
to download the older 2025 dataset directly.

## Usage

``` r
fh_pmm

fh
```

## Format

An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with
6438 rows and 7 columns.

An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with
9965 rows and 11 columns.

## Source

D. Pemstein, S. A. Meserve, and J. Melton. *Replication Data for:
Democratic Compromise: A Latent Variable Analysis of Ten Measures of
Regime Type*. 2013. DOI: 10.7910/DVN/WWYOHU. HDL: 1902.1/PMM.

F. House. *Freedom in the World 2025: The Uphill Battle to Safeguard
Rights*. Report. Freedom House, 2025.
<https://freedomhouse.org/report/freedom-world/2025/uphill-battle-safeguard-rights>.

## Details

The Freedom House dataset released in 2025 is different from the
archived PMM data for 49 country years:

    fh |>
      dplyr::inner_join(fh_pmm) |>
      dplyr::select(extended_country_name, year, fh_total_reversed, pmm_freedomhouse) |>
      dplyr::mutate(fh_total_reversed = (fh_total_reversed/2)+ 1) |>
      dplyr::filter(fh_total_reversed != pmm_freedomhouse) |>
      print(n = 50)
    #> Joining with `by = join_by(year, extended_country_name, GWn, cown,
    #> in_GW_system)`
    #> # A tibble: 49 x 4
    #>    extended_country_name                 year fh_total_reversed pmm_freedomhouse
    #>    <chr>                                <dbl>             <dbl>            <dbl>
    #>  1 Antigua & Barbuda                     1982               6                5.5
    #>  2 Argentina                             1982               2.5              5
    #>  3 Bahamas                               1982               6.5              6
    #>  4 Bangladesh                            1982               3                2.5
    #>  5 Bolivia                               1982               2.5              5.5
    #>  6 Brazil                                1982               4.5              5
    #>  7 Burundi                               1982               1.5              2
    #>  8 Comoros                               1982               3.5              4
    #>  9 Congo                                 1993               5                4
    #> 10 Congo, Democratic Republic of (Zair~  1977               2                1.5
    #> 11 Congo, Democratic Republic of (Zair~  1978               2                1.5
    #> 12 Congo, Democratic Republic of (Zair~  1982               2                1.5
    #> 13 Cote D'Ivoire                         1980               3                2.5
    #> 14 Cote D'Ivoire                         1999               2.5              3
    #> 15 Swaziland                             1978               3                2.5
    #> 16 Grenada                               1982               2.5              2
    #> 17 Guinea-Bissau                         1982               2                1.5
    #> 18 Guyana                                1982               3.5              3
    #> 19 Honduras                              1982               5.5              5
    #> 20 India                                 1976               4                4.5
    #> 21 Kiribati                              1982               6                6.5
    #> 22 Liberia                               1982               2                3
    #> 23 Liberia                               2001               2                2.5
    #> 24 Malta                                 1982               5.5              5
    #> 25 Mauritius                             1982               5.5              6
    #> 26 Mozambique                            1982               1                1.5
    #> 27 Myanmar (Burma)                       1982               1.5              1
    #> 28 Panama                                1982               3                3.5
    #> 29 Peru                                  2000               4.5              5
    #> 30 Philippines                           1982               3.5              3
    #> 31 Poland                                1982               2                2.5
    #> 32 Portugal                              1982               6                6.5
    #> 33 Sao Tome and Principe                 1982               2                1
    #> 34 Saudi Arabia                          1982               2                1.5
    #> 35 Korea, Republic of                    1982               3                2.5
    #> 36 Spain                                 1982               5.5              6.5
    #> 37 Sri Lanka (Ceylon)                    1982               5.5              4.5
    #> 38 Surinam                               1982               2                1.5
    #> 39 Surinam                               1990               3                4.5
    #> 40 Syria                                 1982               2                1.5
    #> 41 Taiwan                                1978               3                3.5
    #> 42 Taiwan                                1980               3                2.5
    #> 43 Taiwan                                1991               5                3
    #> 44 Tajikistan                            1991               3                5
    #> 45 Turkey (Ottoman Empire)               1982               3                3.5
    #> 46 Uganda                                1982               3                3.5
    #> 47 Uruguay                               1982               3                3.5
    #> 48 Vanuatu                               1982               6                5
    #> 49 Zimbabwe (Rhodesia)                   1982               4                3.5

Many, but not all of these cases seem to be concentrated around the
problematic year of 1982.

## Variables

- pmm_country:

  The original country name in the PMM replication data.

- year:

  The calendar year. This is approximate. The surveys cover specific
  periods in the original data that do not always overlap with a single
  year. In particular, the year 1981 is "skipped" – a single survey
  covers Jan.1981 - Aug. 1982 and its value is assigned to 1982 here.

- pmm_freedomhouse :

  A reversed measure of political rights and civil liberties, from 1 to
  7, with higher values being more democratic (the opposite of the
  actual FH data).

- fh_total_reversed :

  A reversed measure of political rights and civil liberties, from 0 to
  12, with higher values being more democratic (the opposite of the
  actual FH data). To convert to the same scale as `pmm_freedomhouse`,
  divide by two and add 1, or average `pr` and `cl` and then reverse.

- pr:

  The political rights scores (from 1 to 7) in the archived Freedom
  House data (`fh`).

- cl:

  The civil rights scores (from 1 to 7) in the archived Freedom House
  data (`fh`).

- status:

  The status of the country in the archived Freedom House data (Free,
  Partly Free, Not Free).

- fh_total:

  The sum of the political rights and civil liberties scores. Ranges
  from 2 to 14.

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

## See also

[download_fh](https://xmarquez.github.io/democracyData/reference/download_fh.md)
and
[download_fh_electoral](https://xmarquez.github.io/democracyData/reference/download_fh_electoral.md)

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
[`download_fh_electoral()`](https://xmarquez.github.io/democracyData/reference/download_fh_electoral.md),
[`download_fh_full()`](https://xmarquez.github.io/democracyData/reference/download_fh_full.md),
[`download_wgi_voice_and_accountability()`](https://xmarquez.github.io/democracyData/reference/download_wgi_voice_and_accountability.md),
[`eiu`](https://xmarquez.github.io/democracyData/reference/eiu.md),
[`extended_uds`](https://xmarquez.github.io/democracyData/reference/extended_uds.md),
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
[`download_fh_electoral()`](https://xmarquez.github.io/democracyData/reference/download_fh_electoral.md),
[`download_fh_full()`](https://xmarquez.github.io/democracyData/reference/download_fh_full.md)

Other PMM replication data:
[`arat_pmm`](https://xmarquez.github.io/democracyData/reference/arat_pmm.md),
[`blm`](https://xmarquez.github.io/democracyData/reference/blm.md),
[`bollen_pmm`](https://xmarquez.github.io/democracyData/reference/bollen_pmm.md),
[`hadenius_pmm`](https://xmarquez.github.io/democracyData/reference/hadenius_pmm.md),
[`mainwaring`](https://xmarquez.github.io/democracyData/reference/mainwaring.md),
[`munck_pmm`](https://xmarquez.github.io/democracyData/reference/munck_pmm.md),
[`pacl`](https://xmarquez.github.io/democracyData/reference/pacl.md),
[`polity_pmm`](https://xmarquez.github.io/democracyData/reference/polity_pmm.md),
[`prc_gasiorowski`](https://xmarquez.github.io/democracyData/reference/prc_gasiorowski.md)

Other ordinal democracy indexes:
[`download_fh()`](https://xmarquez.github.io/democracyData/reference/download_fh.md),
[`download_fh_electoral()`](https://xmarquez.github.io/democracyData/reference/download_fh_electoral.md),
[`download_fh_full()`](https://xmarquez.github.io/democracyData/reference/download_fh_full.md),
[`polityIV`](https://xmarquez.github.io/democracyData/reference/polityIV.md),
[`polity_pmm`](https://xmarquez.github.io/democracyData/reference/polity_pmm.md)
