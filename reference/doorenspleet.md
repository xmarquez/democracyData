# Renske Doorenspleet's Democracy Dataset

A dataset containing the country-year version of the democracy
classification described in R. Doorenspleet. "Reassessing the Three
Waves of Democratization". In: *World Politics* 52.03 (2000), pp.
384-406. DOI:
[10.1017/S0043887100016580](https://dx.doi.org/10.1017/S0043887100016580).

## Usage

``` r
doorenspleet
```

## Format

An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with
13877 rows and 10 columns.

## Source

R. Doorenspleet. "Reassessing the Three Waves of Democratization". In:
*World Politics* 52.03 (2000), pp. 384-406. DOI:
[10.1017/S0043887100016580](https://dx.doi.org/10.1017/S0043887100016580).

## Details

- doorenspleet_country:

  Country name as in Doorenspleet.

- doorenspleet_regime:

  Regime type: A = Authoritarian, D = Democracy, I = interruption.

  Doorenspleet notes that the classification of democracy depends on two
  things (pp. 391-392 of the article):

  The first requirement of minimal democracies, the presence of
  competition, can be seen to be met if there exist institutions and
  procedures through which citizens can express effective preferences
  about alternative policies at the national level and if there are
  institutionalized constraints on the exercise of power by the
  executive. Indicators of these phenomena have already been collated in
  Gurr's well-known Polity III data set, which covers most independent
  countries on an annual basis from 1800 to 1994; it is therefore an
  ideal source to measure the presence of competition.21 Moreover, these
  data are also easily adapted to the definition of competition employed
  in this analysis. In operational terms, I will consider a national
  political system to be competitive if there is at least one executive
  chosen by competitive popular elections (if Gurr's indicator
  "competitiveness of executive recruitment" is coded 3 or 4); if all
  the politically active population has an opportunity, in principle, to
  attain an executive position through a regularized process (if Gurr's
  indicator "openness of executive recruitment" is coded 3 or 4); if
  alternative preferences for policy and leadership can be pursued in
  the political arena, such that oppositional activity is not restricted
  or suppressed (if Gurr's indicator "competitiveness of participation"
  is coded 0, 3, 4, 5); and if there are at least substantial
  limitations on the exercise of executive power (if Gurr's indicator
  "constraints on the power of the chief executive" is coded 4, 5, 6, or
  7).

  The second requirement of minimal democracies is that there be
  inclusive, universal suffrage at the national level. The norm of
  universality requires that all citizens of the state–without regard to
  sex, race, language, descent, income, land holdings, education, or
  religious beliefs–formally enjoy the right to vote and to be elected
  to public office. The fact that certain prerequisites are demanded,
  such as a minimum age, a sound mind, or the absence of criminal
  record, does not negate this principle. Only countries that at some
  stage meet the first requirement of competition from 1800 to 1994 are
  considered when measuring the inclusiveness of the system. Levels of
  inclusiveness of the political system may be broken down into one of
  the following four categories: (1) no popular suffrage; (2) suffrage
  denied to large segments of the population (more than 20 percent is
  excluded); (3) suffrage with partial restrictions (less than 20
  percent of the population is excluded);(4) universal suffrage or minor
  restrictions. For the purposes of this analysis, countries are
  considered "sufficiently" inclusive to meet the criterion of a minimal
  democracy if they fall into the third or fourth category. Should they
  fall within either of the first two categories or should they not meet
  the competition criterion, they are classified as authoritarian
  regimes. Reliable data on inclusiveness are of course difficult to
  obtain and to standardize, and I have had to rely on historical
  sources and various monographs for each country, as well as on
  Keesing's *Record of World Events* and many of the standard handbooks
  and almanacs. The appendix gives an overview of the years in which
  political systems can be considered as both competitive and inclusive
  and hence are classified in this study as "minimal democracies."

  (This description suggests one could replicate Doorenspleet's measure
  using data from
  [PIPE](https://xmarquez.github.io/democracyData/reference/PIPE.md) or
  [LIED](https://xmarquez.github.io/democracyData/reference/LIED.md) as
  well as the newest version of
  [polity](https://xmarquez.github.io/democracyData/reference/download_polity_annual.md);
  Doorenspleet uses Polity III data)

- doorenspleet:

  Regime type: 1 = Authoritarian, 2 = Democracy, interruption codes as
  NA.

- year:

  Year. Regimes are coded as of the 31 Dec of the year.

- start_year:

  First year of the regime.

- end_year:

  Last year of the regime.

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
[`download_fh()`](https://xmarquez.github.io/democracyData/reference/download_fh.md),
[`download_fh_electoral()`](https://xmarquez.github.io/democracyData/reference/download_fh_electoral.md),
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

Other dichotomous democracy indexes:
[`anckar`](https://xmarquez.github.io/democracyData/reference/anckar.md),
[`anrr`](https://xmarquez.github.io/democracyData/reference/anrr.md),
[`bmr`](https://xmarquez.github.io/democracyData/reference/bmr.md),
[`bnr`](https://xmarquez.github.io/democracyData/reference/bnr.md),
[`kailitz`](https://xmarquez.github.io/democracyData/reference/kailitz.md),
[`pacl`](https://xmarquez.github.io/democracyData/reference/pacl.md),
[`pacl_update`](https://xmarquez.github.io/democracyData/reference/pacl_update.md),
[`svolik_regime`](https://xmarquez.github.io/democracyData/reference/svolik_regime.md),
[`ulfelder`](https://xmarquez.github.io/democracyData/reference/ulfelder.md),
[`utip`](https://xmarquez.github.io/democracyData/reference/utip.md),
[`vaporeg`](https://xmarquez.github.io/democracyData/reference/vaporeg.md),
[`vaporeg_2024`](https://xmarquez.github.io/democracyData/reference/vaporeg_2024.md),
[`wahman_teorell_hadenius`](https://xmarquez.github.io/democracyData/reference/wahman_teorell_hadenius.md)
