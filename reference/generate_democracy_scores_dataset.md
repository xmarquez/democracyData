# Generate a data frame containing all the democracy measures accessible from this package

This function automates the process of joining together all the archived
and downloadable datasets in this package, producing a comprehensive
data frame with every democracy measure. It automatically converts each
democracy measure to a numeric value, ensures that larger values are
associated with more democracy, and that all country-years are
appropriately matched.

## Usage

``` r
generate_democracy_scores_dataset(
  datasets,
  selection,
  output_format = "long",
  use_extended = TRUE,
  verbose = TRUE,
  force_redownload = FALSE,
  scale_scores = FALSE,
  keep_only_last_in_year = TRUE,
  uds_release_year = c(2014, 2011, 2010),
  svmdi_release_year = c(2020, 2016),
  wgi_version = c("current", "legacy"),
  vaporeg_version = c("current", "legacy"),
  pitf_version = c("current", "legacy", "polity5", "polity4"),
  exclude_pmm_duplicates = TRUE,
  prefer_successor = TRUE,
  fix_PIPE = TRUE,
  enforce_GW_enddates = FALSE
)
```

## Arguments

- datasets:

  Character vector indicating which datasets to use in producing the
  combined data frame. Can be any or all of (an unambiguous abbreviation
  of)
  "[anckar](https://xmarquez.github.io/democracyData/reference/anckar.md)",
  "[anrr](https://xmarquez.github.io/democracyData/reference/anrr.md)",
  "[LIED](https://xmarquez.github.io/democracyData/reference/LIED.md)",
  "[PIPE](https://xmarquez.github.io/democracyData/reference/PIPE.md)",
  "[arat](https://xmarquez.github.io/democracyData/reference/arat_pmm.md)",
  "[arat_pmm](https://xmarquez.github.io/democracyData/reference/arat_pmm.md)",
  "[blm](https://xmarquez.github.io/democracyData/reference/blm.md)",
  "[blm_pmm](https://xmarquez.github.io/democracyData/reference/blm.md)",
  "[bmr](https://xmarquez.github.io/democracyData/reference/bmr.md)",
  "[bnr](https://xmarquez.github.io/democracyData/reference/bnr.md)",
  "[bnr_extended](https://xmarquez.github.io/democracyData/reference/bnr.md)",
  "[bti](https://xmarquez.github.io/democracyData/reference/bti.md)",
  "[bollen_pmm](https://xmarquez.github.io/democracyData/reference/bollen_pmm.md)",
  "[doorenspleet](https://xmarquez.github.io/democracyData/reference/doorenspleet.md)",
  "[eiu](https://xmarquez.github.io/democracyData/reference/eiu.md)",
  "[fh_pmm](https://xmarquez.github.io/democracyData/reference/fh_pmm.md)",
  "[gwf_all](https://xmarquez.github.io/democracyData/reference/gwf_all.md)",
  "[gwf_all_extended](https://xmarquez.github.io/democracyData/reference/gwf_all.md)",
  "[hadenius_pmm](https://xmarquez.github.io/democracyData/reference/hadenius_pmm.md)",
  "[kailitz](https://xmarquez.github.io/democracyData/reference/kailitz.md)",
  "[magaloni](https://xmarquez.github.io/democracyData/reference/magaloni.md)",
  "[magaloni_extended](https://xmarquez.github.io/democracyData/reference/magaloni.md)",
  "[mainwaring](https://xmarquez.github.io/democracyData/reference/mainwaring.md)",
  "[mainwaring_pmm](https://xmarquez.github.io/democracyData/reference/mainwaring.md)",
  "[munck_pmm](https://xmarquez.github.io/democracyData/reference/munck_pmm.md)",
  "[pacl](https://xmarquez.github.io/democracyData/reference/pacl.md)",
  "[pacl_pmm](https://xmarquez.github.io/democracyData/reference/pacl.md)",
  "[pacl_update](https://xmarquez.github.io/democracyData/reference/pacl_update.md)",
  "[peps](https://xmarquez.github.io/democracyData/reference/peps.md)",
  "[pitf](https://xmarquez.github.io/democracyData/reference/pitf.md)",
  "[polity_pmm](https://xmarquez.github.io/democracyData/reference/polity_pmm.md)",
  "[polyarchy](https://xmarquez.github.io/democracyData/reference/polyarchy.md)",
  "[polyarchy_dimensions](https://xmarquez.github.io/democracyData/reference/polyarchy_dimensions.md)",
  "[polyarchy_pmm](https://xmarquez.github.io/democracyData/reference/polyarchy.md)",
  "[prc_gasiorowski](https://xmarquez.github.io/democracyData/reference/prc_gasiorowski.md)",
  "[prc_pmm](https://xmarquez.github.io/democracyData/reference/prc_gasiorowski.md)",
  "[svmdi](https://xmarquez.github.io/democracyData/reference/svmdi.md)",
  "[svolik_regime](https://xmarquez.github.io/democracyData/reference/svolik_regime.md)",
  "[uds](https://xmarquez.github.io/democracyData/reference/uds_2014.md)",
  "[ulfelder](https://xmarquez.github.io/democracyData/reference/ulfelder.md)",
  "[ulfelder_extended](https://xmarquez.github.io/democracyData/reference/ulfelder.md)",
  "[utip](https://xmarquez.github.io/democracyData/reference/utip.md)",
  "[vanhanen](https://xmarquez.github.io/democracyData/reference/vanhanen.md)",
  "[vaporeg](https://xmarquez.github.io/democracyData/reference/vaporeg.md)",
  "[vdem](https://xmarquez.github.io/democracyData/reference/vdem_simple.md)",
  "[wahman_teorell_hadenius](https://xmarquez.github.io/democracyData/reference/wahman_teorell_hadenius.md)",
  "[reign](https://xmarquez.github.io/democracyData/reference/REIGN.md)"
  or
  "[REIGN](https://xmarquez.github.io/democracyData/reference/REIGN.md)",
  "[polityIV](https://xmarquez.github.io/democracyData/reference/polityIV.md)",
  "[polity5](https://xmarquez.github.io/democracyData/reference/download_polity_annual.md)",
  "[fh](https://xmarquez.github.io/democracyData/reference/fh_pmm.md)",
  "[fh_electoral](https://xmarquez.github.io/democracyData/reference/download_fh_electoral.md)",
  "[wgi](https://xmarquez.github.io/democracyData/reference/download_wgi_voice_and_accountability.md)".
  It can also be empty; the default is all of them.

- selection:

  A regular expression for selecting among the datasets. Optional.

- output_format:

  Character. Whether to output a "wide" (each measure of democracy in a
  separate column) or a "long" (a column with measure names, a column
  with values) version of the data frame. Default is "long".

- use_extended:

  Whether to use "extended" (that is, including values before 1945 for
  some regimes) versions of some datasets
  ([gwf](https://xmarquez.github.io/democracyData/reference/gwf_all.md),
  [ulfelder](https://xmarquez.github.io/democracyData/reference/ulfelder.md),
  [bnr](https://xmarquez.github.io/democracyData/reference/bnr.md), and
  [magaloni](https://xmarquez.github.io/democracyData/reference/magaloni.md)).
  Default is `TRUE`.

- verbose:

  Provides a running commentary on what the function is doing. Default
  is `TRUE`.

- force_redownload:

  Whether to re-download all datasets that can be re-downloaded,
  including those archived with this package. Used only for debugging;
  default is `FALSE`.

- scale_scores:

  Whether to scale each measure (subtracting their mean and dividing by
  their standard deviation). Default is `FALSE`.

- keep_only_last_in_year:

  Whether to keep only the last regime measurement in a given
  country-year. Some datasets (e.g.,
  [prc](https://xmarquez.github.io/democracyData/reference/prc_gasiorowski.md),
  [reign](https://xmarquez.github.io/democracyData/reference/REIGN.md))
  contain more than one regime measurement per country-year in some
  cases (if the regime changed multiple times during the year); setting
  this to `TRUE` discards all except the regime measurement as of 31
  December of the year, the standard practice in most datasets. Default
  is `TRUE`. This setting is only of interest if you set
  `output_format = "long"`, since it is ignored when
  `output_format = "wide"`, which automatically discards all regime
  measurements except the last in the year.

- uds_release_year:

  Which release of the original
  [uds](https://xmarquez.github.io/democracyData/reference/uds_2014.md)
  dataset to include. Defaults to the latest, 2014. Can be 2014, 2011,
  or 2010, or all of them.

- svmdi_release_year:

  Which release of the
  [svmdi](https://xmarquez.github.io/democracyData/reference/svmdi.md)
  dataset to include. Defaults to the latest, 2020. Can be 2020 or 2016,
  or both of them.

- wgi_version:

  Which WGI series to include. `"current"` uses the revised
  [wgi](https://xmarquez.github.io/democracyData/reference/download_wgi_voice_and_accountability.md)
  series; `"legacy"` uses the archived
  [wgi_legacy](https://xmarquez.github.io/democracyData/reference/wgi_legacy.md)
  series. Default is `"current"`.

- vaporeg_version:

  Which VaPoReg schema to include. `"current"` uses the current
  [vaporeg](https://xmarquez.github.io/democracyData/reference/vaporeg.md)
  object; `"legacy"` uses the archived
  [vaporeg_2024](https://xmarquez.github.io/democracyData/reference/vaporeg_2024.md)
  object. Default is `"current"`.

- pitf_version:

  Which PITF variant to include. `"current"` and `"polity5"` use
  [pitf](https://xmarquez.github.io/democracyData/reference/pitf.md);
  `"legacy"` and `"polity4"` use
  [pitf_p4](https://xmarquez.github.io/democracyData/reference/pitf.md).
  Default is `"current"`.

- exclude_pmm_duplicates:

  Whether to exclude versions of some measures found in Pemstein,
  Meserve, and Melton's replication dataset for their 2010 piece
  introducing the Unified Democracy Scores (Pemstein, Meserve, and
  Melton 2010, 2013). See
  [blm_pmm](https://xmarquez.github.io/democracyData/reference/blm.md),
  [prc_pmm](https://xmarquez.github.io/democracyData/reference/prc_gasiorowski.md),
  [fh_pmm](https://xmarquez.github.io/democracyData/reference/fh_pmm.md),
  [pacl_pmm](https://xmarquez.github.io/democracyData/reference/pacl.md),
  [vanhanen_pmm](https://xmarquez.github.io/democracyData/reference/vanhanen.md),
  and
  [polity_pmm](https://xmarquez.github.io/democracyData/reference/polity_pmm.md)
  for details. This is included mostly to extend or replicate the
  [uds](https://xmarquez.github.io/democracyData/reference/uds_2014.md)
  scores. Default is `TRUE`; set to `FALSE` to keep these.

- prefer_successor:

  In some cases (e.g., Italy 1861) some datasets contain two
  measurements in the same year: one for the precursor state
  (Piedmont-Sardinia, which is Italy/Sardinia in
  `extended_country_name`) and one for the successor state (unified
  Italy). The problem affects the following entities in different
  datasets: Ethiopia (Eritrea split in 1993); Germany (reunification in
  1993); Italy (unification in 1861, previously Piedmont-Sardinia);
  Pakistan (Bangladesh split in 1971); the Soviet Union (creation in
  1922; dissolution in 1991); Sudan (South Sudan split in 2011); Vietnam
  (1945-1953 period and reunification in 1976); Yemen (unification in
  1990); Yugoslavia (1991 breakup). Setting `prefer_successor` to `TRUE`
  ensures the successor state is the only measurement included, where
  the successor state is preferentially the state in the Gleditsch-Ward
  system. Setting it to `FALSE` ensures both measurements are included,
  which results in two measurements for the same country-year (where
  country means the country in `extended_country_name`).

- fix_PIPE:

  The [PIPE](https://xmarquez.github.io/democracyData/reference/PIPE.md)
  dataset uses a particularly tangled state system, measuring some
  countries when they should not exist, or splitting some countries into
  historical and modern states but measuring both during the historical
  period:

  |                                 |                             |          |          |
  |---------------------------------|-----------------------------|----------|----------|
  | extended_country_name           | PIPE_country                | min_year | max_year |
  | Austria                         | Austria                     | 1918     | 1918     |
  | Austria                         | Austria-Hungary (Austria)   | 1918     | 1918     |
  | Austria-Hungary                 | Austria-Hungary (Austria)   | 1848     | 1917     |
  | Austria-Hungary                 | Austria-Hungary (Hungary)   | 1848     | 1917     |
  | Czechoslovakia                  | Czech Republic              | 1990     | 1992     |
  | Czechoslovakia                  | Czechoslovakia              | 1990     | 1992     |
  | German Federal Republic         | Germany                     | 1990     | 1990     |
  | German Federal Republic         | Germanywest                 | 1990     | 1990     |
  | Korea                           | North Korea                 | 1820     | 1870     |
  | Korea                           | South Korea                 | 1820     | 1870     |
  | Pakistan                        | Pakistan                    | 1950     | 1970     |
  | Pakistan                        | Pakistanincludingbangladesh | 1950     | 1970     |
  | Turkey (Ottoman Empire)         | Ottoman Empire              | 1820     | 1913     |
  | Turkey (Ottoman Empire)         | Turkey                      | 1820     | 1913     |
  | Vietnam, Democratic Republic of | Vietnam                     | 1954     | 1975     |
  | Vietnam, Democratic Republic of | Vietnam, North              | 1954     | 1975     |
  | Yemen (Arab Republic of Yemen)  | Yemen                       | 1990     | 1990     |
  | Yemen (Arab Republic of Yemen)  | Yemennorth                  | 1990     | 1990     |
  | Yugoslavia                      | Serbia                      | 1990     | 1990     |
  | Yugoslavia                      | Serbia And Montenegro       | 1991     | 1991     |
  | Yugoslavia                      | Yugoslavia                  | 1990     | 1991     |

  Some of these are fixed by setting `prefer_successor` to `TRUE` (the
  default) but others do not make much sense. `fix_PIPE = TRUE` (the
  default) deletes Austria-Hungary entirely (as there is no principled
  choice about which half to retain); removes the Czech Republic from
  the period 1990-1992; removes North and South Korea from the 19th
  century; assumes Pakistan from 1950-1970 must include Bangladesh, and
  Turkey from 1820-1913 refers to the Ottoman Empire; removes unified
  Vietnam from the period 1954-1975, Serbia from 1990, and Serbia and
  Montenegro from 1990 to 1991 (leaving only Yugoslavia from 1990 to
  1991).

- enforce_GW_enddates:

  This enforces the Gleditsch-Ward enddates of historical states, so
  they are not measured after their dissolution. This only affects a
  limited number of entities: Tibet (ends in 1950), Czechoslovakia (ends
  in 1992), Gran Colombia (ends in 1831; Polity measures it until 1832),
  the Vatican (identified with the Papal States, ends in 1870) and
  Zanzibar (ends in 1964). The default is `FALSE`.

## Value

A
[`tibble::tibble()`](https://tibble.tidyverse.org/reference/tibble.html)
with the selected democracy measures and state system information, in
two versions: "long" and "wide". These contain the following variables:

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

## Long version

In the "long" version of the dataset (`output_format = "long"`), the
output data frame also contains the following variables:

- year:

  The calendar year. Most measures of democracy reflect the country's
  situation as of 31 December of the year. If
  `keep_only_last_in_year = FALSE` (and `output_format = "long"`), a
  single country year may nevertheless contain more than one measurement
  for some measures (e.g.,
  [prc](https://xmarquez.github.io/democracyData/reference/prc_gasiorowski.md)).

- measure:

  The name of the measure. (e.g., "blm", "fh_total_reversed").

- value:

  The numerical value of the measure, in the original scale (if
  `scale_scores = FALSE`) or as a z-score (if `scale_scores = TRUE`).

- index_type:

  The index type (dichotomous, trichotomous, ordinal/graded,
  continuous).

- dataset:

  The name of the dataset.

## Wide version

In the "wide" version of the dataset (`output_format = "wide"`), the
output data frame can also contain any of the following variables (in
the scales described below, unless `scale_scores = TRUE`, in which case
the measures are converted to z-scores):

- year:

  The calendar year. In the "wide" version, all measures of democracy
  reflect the country's situation as of 31 December of the year as much
  as possible.

- anckar_democracy:

  The
  [anckar](https://xmarquez.github.io/democracyData/reference/anckar.md)
  measure of democracy, as a numeric value. Up to 2010 this should be
  identical to `bmr_democracy_omitteddata`. 0 = non-democracy, 1 =
  democracy.

- arat:

  The original
  [arat](https://xmarquez.github.io/democracyData/reference/arat_pmm.md)
  measure of democracy, converted to numeric form. Ranges from 29 (least
  democratic) to 109 (most democratic). See
  [arat](https://xmarquez.github.io/democracyData/reference/arat_pmm.md)
  for details.

- anrr_democracy:

  The [anrr](https://xmarquez.github.io/democracyData/reference/anrr.md)
  measure of democracy, as a numeric value. 0 = non-democracy, 1 =
  democracy.

- blm:

  The [blm](https://xmarquez.github.io/democracyData/reference/blm.md)
  measure of democracy, as a numeric value. Can be 0 (authoritarian),
  0.5 (hybrid), or 1 (democracy).

- bmr_democracy:

  The [bmr](https://xmarquez.github.io/democracyData/reference/bmr.md)
  measure of democracy, as a numeric value. Can be 0 (non-democracy) or
  1 (democracy).

- bmr_democracy_omitteddata:

  According to the
  [bmr](https://xmarquez.github.io/democracyData/reference/bmr.md)
  codebook, "this is the same measure as bmr, except it records an NA
  for countries occupied during an international war (e.g., the
  Netherlands 1940-44) or experiencing state collapse during a civil war
  (e.g., Lebanon 1976-89). The democracy variable instead fills in these
  years as continuations of the same regime type." There are some -1
  values that I've converted to `NA` (the measure is supposed to be
  between 0 and 1).

- bmr_democracy_femalesuffrage:

  According to the
  [bmr](https://xmarquez.github.io/democracyData/reference/bmr.md)
  codebook, this is the same measure as `bmr`, except that it also
  requires that at least half of adult women have the right to vote. 30
  countries change values.

- bnr:

  The [bnr](https://xmarquez.github.io/democracyData/reference/bnr.md)
  event measure of democracy, reversed, so that 0 indicates
  non-democracy and 1 indicates democracy. Since the `event` variable of
  the [bnr](https://xmarquez.github.io/democracyData/reference/bnr.md)
  dataset only codes terminations of democracy (ignoring years when the
  country is non-democratic), this variable is mostly equal to 1.

- bnr_extended:

  The
  [bnr_extended](https://xmarquez.github.io/democracyData/reference/bnr.md)
  variable, with 0 indicating non-democracy and 1 indicating democracy.
  See the documentation for
  [bnr_extended](https://xmarquez.github.io/democracyData/reference/bnr.md)
  for details of how this variable extends
  [bnr](https://xmarquez.github.io/democracyData/reference/bnr.md),
  filling in years of non-democracy back to 1913.

- bti:

  The [bti](https://xmarquez.github.io/democracyData/reference/bti.md) -
  Bertelsmann Transformation Democracy Status index. Ranges from 1 to
  10.

- doorenspleet:

  The
  [doorenspleet](https://xmarquez.github.io/democracyData/reference/doorenspleet.md)
  measure of democracy, with 1 indicating non-democracy and 2 indicating
  democracy.

- eiu:

  The [eiu](https://xmarquez.github.io/democracyData/reference/eiu.md)
  measure of democracy, ranging from 0 (least democratic) to 10 (most
  democratic). The report says that the index "is based on five
  categories: electoral process and pluralism; civil liberties; the
  functioning of government; political participation; and political
  culture" which form "one interrelated whole"

- fh_electoral:

  The direct
  [fh_electoral](https://xmarquez.github.io/democracyData/reference/download_fh_electoral.md)
  Freedom House measure of electoral democracy, with 0 indicating a lack
  of electoral democracy and 1 indicating electoral democracy status.

- fh_total_reversed:

  The [Freedom
  House](https://xmarquez.github.io/democracyData/reference/fh) combined
  measure of political and civil rights, reversed, so that 0 is least
  free and 12 is most free.

- gwf_democracy:

  A measure of democracy from
  [gwf_all](https://xmarquez.github.io/democracyData/reference/gwf_all.md),
  obtained by coding all democracies as 1 and all non-democracies,
  including all non-democratic nonautocracies, as 0.

- gwf_democracy_extended:

  A measure of democracy from
  [gwf_all_extended](https://xmarquez.github.io/democracyData/reference/gwf_all.md),
  obtained by coding all democracies as 1 and all non-democracies,
  including all non-democratic nonautocracies, as 0. See the
  documentation for
  [gwf_all_extended](https://xmarquez.github.io/democracyData/reference/gwf_all.md)
  for details on how the dataset was extended to the period before 1945
  for some countries.

- gwf_democracy_strict:

  A measure of democracy from
  [gwf_all](https://xmarquez.github.io/democracyData/reference/gwf_all.md),
  obtained by coding all democracies as 1 and all non-democracies as 0.
  It is `NA` for all non-democratic non-autocracies (e.g., warlord
  regimes, foreign occupation, etc.).

- gwf_democracy_extended_strict:

  A measure of democracy from
  [gwf_all_extended](https://xmarquez.github.io/democracyData/reference/gwf_all.md),
  obtained by coding all democracies as 1 and all non-democracies as 0.
  It is `NA` for all non-democratic non-autocracies (e.g., warlord
  regimes, foreign occupation, etc.). See the documentation for
  [gwf_all_extended](https://xmarquez.github.io/democracyData/reference/gwf_all.md)
  for details on how the dataset was extended to the period before 1945
  for some countries.

- kailitz_binary:

  A measure of democracy from
  [kailitz](https://xmarquez.github.io/democracyData/reference/kailitz.md),
  obtained by coding all liberal democracies as 1 and all other regimes
  as 0.

- kailitz_tri:

  A trichotomous measure of democracy from
  [kailitz](https://xmarquez.github.io/democracyData/reference/kailitz.md),
  obtained by coding all liberal democracies as 2, all electoral
  autocracies as 1, and all other regimes as 0.

- lexical_index:

  The [LIED](https://xmarquez.github.io/democracyData/reference/LIED.md)
  measure of electoral democracy, ranging from 0 to 6.

- lexical_index_plus:

  The [LIED](https://xmarquez.github.io/democracyData/reference/LIED.md)
  measure of polyarchy, ranging from 0 to 7 (including political
  liberties).

- magaloni_democracy:

  A measure of democracy from
  [magaloni](https://xmarquez.github.io/democracyData/reference/magaloni.md),
  obtained by coding all democracies as 1 and all non-democracies as 0.

- magaloni_democracy_extended:

  A measure of democracy from
  [magaloni_extended](https://xmarquez.github.io/democracyData/reference/magaloni.md),
  obtained by coding all democracies as 1 and all non-democracies as 0.
  See the documentation for
  [magaloni_extended](https://xmarquez.github.io/democracyData/reference/magaloni.md)
  for details on how the dataset was extended to the period before 1950
  for some countries.

- mainwaring:

  The measure of democracy from
  [mainwaring](https://xmarquez.github.io/democracyData/reference/mainwaring.md),
  where 0 is non-democracy, 0.5 represents hybrid regimes, and 1 is
  democracy.

- pacl:

  The measure of democracy from
  [pacl](https://xmarquez.github.io/democracyData/reference/pacl.md),
  where 0 is non-democracy, and 1 is democracy.

- pacl_update:

  The measure of democracy from
  [pacl_update](https://xmarquez.github.io/democracyData/reference/pacl_update.md),
  where 0 is non-democracy, and 1 is democracy.

- PEPS1i, PEPS1q, PEPS1v, PEPS2i, PEPS2q, PEPS2v:

  The measures of democracy from
  [peps](https://xmarquez.github.io/democracyData/reference/peps.md).
  Higher values indicate more democracy.

- PIPE_democracy, PIPE_regime:

  The measures of democracy from
  [PIPE](https://xmarquez.github.io/democracyData/reference/PIPE.md).
  Higher values indicate more democracy. See the documentation of
  [PIPE](https://xmarquez.github.io/democracyData/reference/PIPE.md) for
  large caveats - these measures are calculated on the basis of unclear
  instructions and may contain errors.

- pitf, pitf_binary:

  The measures of democracy from
  [pitf](https://xmarquez.github.io/democracyData/reference/pitf.md),
  converted to numeric values. Higher values indicate more democracy.

- pmm_arat:

  The measure of democracy in
  [arat_pmm](https://xmarquez.github.io/democracyData/reference/arat_pmm.md).

- pmm_blm:

  The measure of democracy in
  [blm_pmm](https://xmarquez.github.io/democracyData/reference/blm.md).

- pmm_bollen:

  The measure of democracy in
  [bollen_pmm](https://xmarquez.github.io/democracyData/reference/bollen_pmm.md).

- pmm_fh:

  The measure of democracy in
  [fh_pmm](https://xmarquez.github.io/democracyData/reference/fh_pmm.md).
  Check the documentation of
  [fh_pmm](https://xmarquez.github.io/democracyData/reference/fh_pmm.md)
  for caveats.

- pmm_hadenius:

  The measure of democracy in
  [hadenius_pmm](https://xmarquez.github.io/democracyData/reference/hadenius_pmm.md).

- pmm_mainwaring:

  The measure of democracy in
  [mainwaring_pmm](https://xmarquez.github.io/democracyData/reference/mainwaring.md).

- pmm_munck:

  The measure of democracy in
  [munck_pmm](https://xmarquez.github.io/democracyData/reference/munck_pmm.md).

- pmm_pacl:

  The measure of democracy in
  [pacl_pmm](https://xmarquez.github.io/democracyData/reference/pacl.md).

- pmm_polity:

  The measure of democracy in
  [polity_pmm](https://xmarquez.github.io/democracyData/reference/polity_pmm.md).
  Check the documentation of
  [polity_pmm](https://xmarquez.github.io/democracyData/reference/polity_pmm.md)
  for caveats.

- pmm_polyarchy:

  The measure of democracy in
  [polyarchy_pmm](https://xmarquez.github.io/democracyData/reference/polyarchy.md).

- pmm_prc:

  The measure of democracy in
  [prc_pmm](https://xmarquez.github.io/democracyData/reference/prc_gasiorowski.md).
  Check the documentation of
  [prc_pmm](https://xmarquez.github.io/democracyData/reference/prc_gasiorowski.md)
  for caveats.

- pmm_vanhanen:

  The measure of democracy in
  [vanhanen_pmm](https://xmarquez.github.io/democracyData/reference/vanhanen.md).
  Check the documentation of
  [vanhanen_pmm](https://xmarquez.github.io/democracyData/reference/vanhanen.md)
  for caveats.

- polity:

  The polity measure of democracy in
  [polity](https://xmarquez.github.io/democracyData/reference/download_polity_annual.md)
  (version 5, with NAs for -88, -77, -66).

- polity2:

  The polity2 measure of democracy in
  [polity](https://xmarquez.github.io/democracyData/reference/download_polity_annual.md)
  (version 5, interpolated for periods of interregnum, occupation, and
  the like - see documentation in the polity manual).

- polityIV:

  The polity measure of democracy in
  [polity](https://xmarquez.github.io/democracyData/reference/download_polity_annual.md)
  (version IV, with NAs for -88, -77, -66).

- polity2IV:

  The polity2 measure of democracy in
  [polity](https://xmarquez.github.io/democracyData/reference/download_polity_annual.md)
  (version IV, interpolated for periods of interregnum, occupation, and
  the like - see documentation in the polity manual).

- polyarchy_contestation_dimension:

  The contestation dimension (`CONTEST`) in
  [polyarchy_dimensions](https://xmarquez.github.io/democracyData/reference/polyarchy_dimensions.md).

- polyarchy_inclusion_dimension:

  The inclusion dimension (`INCLUS`) in
  [polyarchy_dimensions](https://xmarquez.github.io/democracyData/reference/polyarchy_dimensions.md).

- polyarchy_original_contestation:

  The contestation dimension (`cont`) in
  [polyarchy](https://xmarquez.github.io/democracyData/reference/polyarchy.md).

- polyarchy_original_polyarchy:

  The original polyarchy scale (`poly`) in
  [polyarchy](https://xmarquez.github.io/democracyData/reference/polyarchy.md),
  reversed so that higher values imply more democracy. The codebook
  suggests this was superseded by `polyarchy_original_contestation`.

- prc:

  The measure of democracy in
  [prc](https://xmarquez.github.io/democracyData/reference/prc_gasiorowski.md),
  where 1 is non-democracy, 3 are hybrid regimes, and 4 are democracies.
  Transitional regimes (2 in the original scale) are coded NA.

- reign_democracy:

  A measure of democracy from
  [reign](https://xmarquez.github.io/democracyData/reference/REIGN.md),
  obtained by coding all presidential and parliamentary democracies as
  1, all other regimes as 0.

- csvmdi:

  The continuous Support Vector Machine democracy index from
  [svmdi](https://xmarquez.github.io/democracyData/reference/svmdi.md),
  2020 version.

- svmdi_2016:

  The continuous Support Vector Machine democracy index from
  [svmdi](https://xmarquez.github.io/democracyData/reference/svmdi.md),
  2016 version.

- dsvmdi:

  The dichotomous Support Vector Machine democracy index from
  [svmdi](https://xmarquez.github.io/democracyData/reference/svmdi.md),
  2020 version.

- svolik_democracy:

  A measure of democracy from
  [svolik_regime](https://xmarquez.github.io/democracyData/reference/svolik_regime.md).
  0 = non-democracy, 1 = democracy.

- uds_2010_mean, uds_2010_median, uds_2011_mean, uds_2011_median,
  uds_2014_mean, uds_2014_median:

  The mean and median posterior scores of the
  [uds](https://xmarquez.github.io/democracyData/reference/uds_2014.md)
  index (2010, 2011, and 2014 releases). Higher values are more
  democratic.

- ulfelder_democracy:

  The dichotomous measure of democracy in
  [ulfelder](https://xmarquez.github.io/democracyData/reference/ulfelder.md).

- ulfelder_democracy_extended:

  The dichotomous measure of democracy in
  [ulfelder_extended](https://xmarquez.github.io/democracyData/reference/ulfelder.md).

- utip_dichotomous:

  A dichotomous measure of democracy from
  [utip](https://xmarquez.github.io/democracyData/reference/utip.md).
  Equals 1 if the regime is a social democracy, conservative democracy,
  or one party democracy, 0 otherwise.

- utip_dichotomous_strict:

  A dichotomous measure of democracy from
  [utip](https://xmarquez.github.io/democracyData/reference/utip.md).
  Equals 1 if the regime is a social democracy or conservative
  democracy, 0 otherwise.

- utip_trichotomous:

  A trichotomous measure of democracy from
  [utip](https://xmarquez.github.io/democracyData/reference/utip.md).
  Equals 2 if the regime is a social democracy or conservative
  democracy, 1 if it is a one-party democracy, 0 otherwise.

- vanhanen_competition:

  The competition index from
  [vanhanen](https://xmarquez.github.io/democracyData/reference/vanhanen.md).

- vanhanen_democratization:

  The democratization index from
  [vanhanen](https://xmarquez.github.io/democracyData/reference/vanhanen.md).

- vanhanen_participation:

  The participation index from
  [vanhanen](https://xmarquez.github.io/democracyData/reference/vanhanen.md).

- vaporeg_binary_strict:

  A dichotomous measure of democracy from the
  [vaporeg](https://xmarquez.github.io/democracyData/reference/vaporeg.md)
  dataset. This is a package-derived strict democracy indicator: it is
  coded 1 only when `vaporeg_regtype_reports == 10`, 0 for all other
  observations that remain inside VaPoReg's binary democracy universe,
  and `NA` where VaPoReg does not classify the observation in that
  universe. See
  [vaporeg](https://xmarquez.github.io/democracyData/reference/vaporeg.md)
  for details.

- vaporeg_binary_non_strict:

  A less restrictive dichotomous measure of democracy from
  [vaporeg](https://xmarquez.github.io/democracyData/reference/vaporeg.md).
  It is the package-facing version of the upstream
  `vaporeg_regtype_bindem` variable, coded 1 for Democracy and 0 for
  Non-Democracy. See
  [vaporeg](https://xmarquez.github.io/democracyData/reference/vaporeg.md)
  for details.

- vaporeg_trichotomous:

  A trichotomous democracy measure from
  [vaporeg](https://xmarquez.github.io/democracyData/reference/vaporeg.md).
  It is a package-facing recode of the upstream `vaporeg_regtype_triple`
  variable, with 2 for Democracy, 1 for Hybrid Regime, and 0 for
  Autocracy. See
  [vaporeg](https://xmarquez.github.io/democracyData/reference/vaporeg.md)
  for details.

- v2x_api:

  The additive polyarchy index from
  [vdem](https://xmarquez.github.io/democracyData/reference/vdem_simple.md).

- v2x_delibdem:

  The deliberative democracy index from
  [vdem](https://xmarquez.github.io/democracyData/reference/vdem_simple.md).

- v2x_egaldem:

  The egalitarian democracy index from
  [vdem](https://xmarquez.github.io/democracyData/reference/vdem_simple.md).

- v2x_libdem:

  The liberal democracy index from
  [vdem](https://xmarquez.github.io/democracyData/reference/vdem_simple.md).

- v2x_mpi:

  The multiplicative polyarchy index from
  [vdem](https://xmarquez.github.io/democracyData/reference/vdem_simple.md).

- v2x_partipdem:

  The participative democracy index from
  [vdem](https://xmarquez.github.io/democracyData/reference/vdem_simple.md).

- v2x_polyarchy:

  The polyarchy (electoral democracy) index from
  [vdem](https://xmarquez.github.io/democracyData/reference/vdem_simple.md).

- wgi_democracy:

  The voice and accountability index from
  [wgi](https://xmarquez.github.io/democracyData/reference/download_wgi_voice_and_accountability.md).

- wth_democ1:

  A dichotomous measure of democracy from
  [wahman_teorell_hadenius](https://xmarquez.github.io/democracyData/reference/wahman_teorell_hadenius.md),
  obtained by coding 1 all democracies according to the `regime1ny`
  variable, 0 all other regimes.

- wth_democrobust:

  A dichotomous measure of democracy from
  [wahman_teorell_hadenius](https://xmarquez.github.io/democracyData/reference/wahman_teorell_hadenius.md),
  obtained by coding 1 all democracies according to the `regimenyrobust`
  variable, 0 all other regimes.

## State-system choices

State system choices are not always straightforward or clear. Most
democracy datasets use some version of the Correlates of War system of
states, though not consistently or entirely correctly (which is why this
package uses
[country_year_coder](https://xmarquez.github.io/democracyData/reference/country_year_coder.md)).
There are a number of alternatives, including the Gleditsch and Ward
system, the Polity system (both based on the COW system, with some
modifications), and the V-Dem system (which is at the basis of
[LIED](https://xmarquez.github.io/democracyData/reference/LIED.md),
though
[LIED](https://xmarquez.github.io/democracyData/reference/LIED.md) also
draws on the idiosyncratic
[PIPE](https://xmarquez.github.io/democracyData/reference/PIPE.md)
system). Freedom House and VaPoReg also develop their own panel of
states, including many units considered non-sovereign by others. I have
opted for maximal coverage (including all non-sovereign units), with
three exceptions.

First, the default is to prefer the successor state where a country-year
unit is measured twice in a single year (for the precursor and the
successor state). This setting affects Ethiopia (Eritrea split in 1993);
Germany (reunification in 1993); Italy (unification in 1861, previously
Piedmont-Sardinia); Pakistan (Bangladesh split in 1971); the Soviet
Union (creation in 1922; dissolution in 1991); Sudan (South Sudan split
in 2011); Vietnam (1945-1953 period and reunification in 1976); Yemen
(unification in 1990); Yugoslavia (1991 breakup). Use
`prefer_successor = FALSE` to override.

Second, the default is to delete various entities in the
[PIPE](https://xmarquez.github.io/democracyData/reference/PIPE.md)
dataset that are measured before their appearance as states (e.g., North
and South Korea in the 19th century). To keep these entities, use
`fix_PIPE = FALSE`.

Finally, whenever there is more than one measurement per year, I keep
only the last one (as far as I can determine it); use
`keep_only_last_in_year = FALSE` to override. I also keep the last year
for no longer existing entities, but delete any subsequent years (if
they appear). Thus the following entities should have no observations in
the years after their dissolution:

|                                     |        |                  |                  |
|-------------------------------------|--------|------------------|------------------|
| extended_country_name               | panel  | dissolution_date | last_observation |
| Austria-Hungary                     | GWn    | 1918-11-13       | 1918             |
| Baden                               | GWn    | 1871-01-17       | 1871             |
| Bavaria                             | GWn    | 1871-01-17       | 1871             |
| British Mandate of Palestine        | none   | 1948-05-14       | 1948             |
| Czechoslovakia                      | GWn    | 1992-12-31       | 1992             |
| German Democratic Republic          | GWn    | 1990-10-02       | 1990             |
| Germany (Prussia)                   | GWn    | 1945-05-07       | 1945             |
| Hanover                             | GWn    | 1871-01-17       | 1871             |
| Hesse-Kassel (Electoral)            | GWn    | 1871-01-17       | 1871             |
| Hesse-Darmstadt (Ducal)             | GWn    | 1871-01-17       | 1871             |
| Mecklenburg-Schwerin                | GWn    | 1871-01-17       | 1871             |
| Modena                              | GWn    | 1861-03-16       | 1861             |
| Papal States                        | GWn    | 1870-09-22       | 1870             |
| Parma                               | GWn    | 1861-03-16       | 1860             |
| Vietnam, Republic of                | GWn    | 1975-04-30       | 1974             |
| Sardinia                            | polity | 1861-03-16       | 1861             |
| Saxony                              | GWn    | 1871-01-17       | 1871             |
| Tuscany                             | GWn    | 1861-03-16       | 1861             |
| Sicily (Two Sicilies)               | GWn    | 1861-03-16       | 1861             |
| Wurttemberg                         | GWn    | 1871-01-17       | 1871             |
| Yemen, People's Republic of         | GWn    | 1990-05-21       | 1990             |
| Yugoslavia                          | GWn    | 2006-06-04       | 2006             |
| Zanzibar                            | GWn    | 1964-04-26       | 1964             |
| Great Colombia                      | GWn    | 1830-09-22       | 1830             |
| Orange Free State                   | GWn    | 1910-05-30       | 1910             |
| Tibet                               | GWn    | 1950-10-01       | 1950             |
| Transvaal                           | GWn    | 1910-05-30       | 1910             |
| United Provinces of Central America | GWn    | 1839-12-31       | 1839             |

As noted, Korea and Vietnam do contain observations for years after
their exit from the system of states in the Gleditsch and Ward panel in
1910 and 1893, respectively, since they have extant successors and are
measured by some datasets for those periods:

|                                     |       |                  |
|-------------------------------------|-------|------------------|
| extended_country_name               | panel | dissolution_date |
| Korea                               | GWn   | 1910-08-22       |
| Vietnam (Annam/Cochin China/Tonkin) | GWn   | 1893-01-01       |

The treatment of Palestine is also complicated. Several datasets (e.g.,
[vdem](https://xmarquez.github.io/democracyData/reference/vdem_simple.md),
[fh](https://xmarquez.github.io/democracyData/reference/fh_pmm.md), and
[LIED](https://xmarquez.github.io/democracyData/reference/LIED.md))
contain separate measurements for the West Bank and Gaza;
[fh](https://xmarquez.github.io/democracyData/reference/fh_pmm.md)
includes the West Bank, Gaza, and "Israeli-Occupied Territories" (I'm
assuming the occupied territories in Lebanon and Syria). I've labeled
them as follows:

|                                   |                                                |               |          |          |
|-----------------------------------|------------------------------------------------|---------------|----------|----------|
| extended_country_name             | original_country_name                          | dataset       | min_year | max_year |
| British Mandate of Palestine      | Palestine/British Mandate                      | LIED          | 1918     | 1947     |
| British Mandate of Palestine      | Palestine/British Mandate                      | vdem          | 1918     | 1948     |
| Israel, occupied territories only | Israeli-Occupied Territories                   | fh            | 1996     | 2009     |
| Palestine, State of               | Palestine                                      | eiu           | 2006     | 2025     |
| Palestine, State of               | Palestinian Authority-Administered Territories | fh            | 1996     | 2009     |
| Palestine, State of               | West Bank and Gaza Strip                       | fh            | 1977     | 1995     |
| Palestine, State of               | Palestine                                      | vaporeg       | 1920     | 1947     |
| Palestine, State of               | West Bank and Gaza                             | wgi_democracy | 1996     | 2024     |
| Palestine/Gaza                    | Gaza Strip                                     | fh            | 2010     | 2025     |
| Palestine/Gaza                    | Gaza Strip                                     | fh_electoral  | 2017     | 2025     |
| Palestine/Gaza                    | Palestine/Gaza                                 | LIED          | 1948     | 2025     |
| Palestine/Gaza                    | Palestine, Gaza Strip                          | vaporeg       | 1948     | 2025     |
| Palestine/Gaza                    | Palestine/Gaza                                 | vdem          | 1948     | 2025     |
| Palestine/West Bank               | West Bank                                      | fh            | 2010     | 2025     |
| Palestine/West Bank               | West Bank                                      | fh_electoral  | 2017     | 2025     |
| Palestine/West Bank               | Palestine/West Bank                            | LIED          | 1948     | 2025     |
| Palestine/West Bank               | Palestine, West Bank                           | vaporeg       | 1948     | 2025     |
| Palestine/West Bank               | Palestine/West Bank                            | vdem          | 1948     | 2025     |

There are some other oddities, primarily concerning
[fh](https://xmarquez.github.io/democracyData/reference/fh_pmm.md) and
the
[polity](https://xmarquez.github.io/democracyData/reference/download_polity_annual.md)
and Polity-derived datasets such as
[pitf](https://xmarquez.github.io/democracyData/reference/pitf.md).
[fh](https://xmarquez.github.io/democracyData/reference/fh_pmm.md)
includes a measure for the "Russian-occupied territories of Ukraine";
I've left it as is
(`extended_country_name = "Russian-occupied territories of Ukraine"`,
not allocated to either Ukraine or Russia). And
[polity](https://xmarquez.github.io/democracyData/reference/download_polity_annual.md)
includes separate observations for both Russia 1922 and USSR 1922; I've
excluded the USSR 1922 observation since it officially began on 31
December 1922.

Note also that though I've kept Germany 1945 (COW code 255, per the
table above, since it ends in 1945 in the Gleditsch-Ward panel), there
are observations for the (occupied) territory of both the later German
Federal Republic and the later German Democratic Republic in 1945.

## References

D. Pemstein, S. Meserve, and J. Melton. "Democratic Compromise: A Latent
Variable Analysis of Ten Measures of Regime Type". In: *Political
Analysis* 18.4 (2010), pp. 426-449. DOI:
[10.1093/pan/mpq020](https://dx.doi.org/10.1093/pan/mpq020).

D. Pemstein, S. A. Meserve, and J. Melton. *Replication Data for:
Democratic Compromise: A Latent Variable Analysis of Ten Measures of
Regime Type*. 2013. DOI: 10.7910/DVN/WWYOHU. HDL: 1902.1/PMM.

## Examples

``` r
# You can select only some datasets

democracy_data_gwf <- generate_democracy_scores_dataset(
 datasets = c("gwf", "pacl", "bmr"),
 output_format = "wide"
 )
#> Adding BMR data
#> Adding GWF data
#> Adding PACL/DD data

# all PMM datasets
democracy_data_pmm <- generate_democracy_scores_dataset(
  selection = "pmm", exclude_pmm_duplicates = FALSE
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

if (FALSE) { # \dontrun{
# This produces scaled scores
generate_democracy_scores_dataset(
 keep_only_last_in_year = FALSE,
 scale_scores = TRUE)

# These require downloads:

democracy_data_long <- generate_democracy_scores_dataset(
 datasets = "pacl",
 force_redownload = TRUE
)

democracy_data_wide <- generate_democracy_scores_dataset(
 datasets = "pacl",
 force_redownload = TRUE,
 output_format = "wide"
)
} # }
```
