# The Varieties of Political Regimes (VaPoReg) dataset

S. Kailitz. *Varieties of Political Regimes (va-PoReg). Codebook.
Version 1.7*. Tech. rep. Dresden: Hannah Arendt Institute for
Totalitarianism Studies, 2024. The original data and codebook can be
downloaded from \<\`r find_url("vaporeg", "documentation")\>. The
documentation below is derived from the codebook, with modifications.

## Usage

``` r
vaporeg
```

## Format

An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with
29840 rows and 30 columns.

## Source

S. Kailitz. *Varieties of Political Regimes (va-PoReg). Dataset*.
Dresden, 2024.

S. Kailitz. *Varieties of Political Regimes (va-PoReg). Codebook.
Version 1.7*. Tech. rep. Dresden: Hannah Arendt Institute for
Totalitarianism Studies, 2024.

## Credits

The data were originally compiled by Steffen Kailitz and the Varieties
of Political Regimes project. The dataset has been revised and expanded
based on historical sources, country reports, and international
political datasets.

## Introduction

The VaPoReg dataset provides a classification of political regimes
globally from 1900 to 2024. It covers independent states, colonial
regimes, occupation regimes, and semi-sovereign entities such as
protectorates. The dataset codes each country-year according to
different regime typologies, integrating various sources of political
regime data.

The dataset includes unique features such as:

- Distinguishing between **electoral** and **non-electoral**
  autocracies.

- Differentiating between **constitutional monarchies, absolute
  monarchies, and personalist regimes**.

- Identifying **colonial and occupation regimes** separately from
  independent states.

- Incorporating non-sovereign entities that have historically been
  excluded from other datasets.

## Conceptual Framework

The dataset classifies regimes based on their **institutional structure,
political legitimation, and origin of rule**. The classification
emphasizes observable characteristics, such as whether a regime emerged
from a coup, follows ideological principles, or relies on military
governance.

## Variables

- country_name:

  The name of the country for a given year.

- year:

  The calendar year.

- vaporeg_code:

  The country code based on the Correlates of War (COW) dataset.

- GeoNames_ID:

  Geographic identifier for linking with spatial datasets.

- vaporeg_s:

  The **standard classification** of political regimes. Coded as:

  - 10: Democracy

  - 20: Semidemocracy

  - 30: Electoral Oligarchy

  - 40: Non-electoral Transitional Regime

  - 50: Electoral Autocracy

  - 60: Constitutional Monarchy

  - 70: Absolute Monarchy

  - 80: One-party Autocracy

  - 90: Right-wing Autocracy

  - 100: Communist Ideocracy

  - 110: Islamist Ideocracy

  - 120: Military Autocracy

  - 130: Personalist Autocracy

  - 140: Colonial Regime

  - 150: Occupation Regime

  - 160: No Central Authority

- vaporeg_a:

  An **alternative classification**, which merges democracy and
  semidemocracy and groups monarchies together as ruling monarchies.

- vaporeg_cr:

  A classification similar to **VaPoReg_s**, but includes an additional
  category for **"Part of Other Country"**.

- vaporeg_governing_country:

  For colonial and occupation regimes, this variable identifies the
  ruling country.

- vaporeg_s_of_gc:

  The **standard regime classification** for the governing country.

- vaporeg_a_of_gc:

  The **alternative regime classification** for the governing country.

- vaporeg_s_start:

  The date on which the political regime type, as defined by the
  standard version of our political regime categorization, began.

- vaporeg_s_end:

  The date on which the political regime type, as defined by the
  standard version of our political regime categorization, ended.

- vaporeg_s_duration:

  The number of years the political regime has lasted, as defined by the
  standard version of our political regime categorization, counting only
  if the regime was still in power on July 1st of each year.

- vaporeg_s_change:

  The variable identifies regime changes based on the standard version
  of our political regimecategorization. It takes a value of one if a
  different regime is in place on July 1st compared to July 1st of the
  previous year.

- vaporeg_a_start:

  The date on which the political regime type, according to the
  alternative version of our political regime categorization, began.

- vaporeg_a_end:

  The date on which the political regime type, according to the
  alternative version of our political regime categorization, ended.

- vaporeg_a_duration:

  The number of years the political regime has lasted, as defined by the
  alternative version of our political regime categorization, counting
  only if the regime was still in power on July 1st ofeach year.

- vaporeg_a_change:

  The variable identifies regime changes based on the standard version
  of our political regime categorization. It takes a value of one if a
  different regime is in place on July 1st compared to July 1st of the
  previous year.

- vaporeg_binary_strict:

  A **dichotomous classification** of democracy, based on `VaPoReg_s`.
  Coded as 1 if `VaPoReg_s` is a Democracy (10), 0 otherwise.

- vaporeg_binary_non-strict:

  A **dichotomous classification** of democracy, based on `VaPoReg_s`,
  but less strict. Coded as 1 if `VaPoReg_s` is a Democracy (10) or a
  Semidemocracy (20), 0 otherwise.

- vaporeg_trichotomous:

  A **trichotomous classification** of democracy, based on `VaPoReg_s`.
  Coded as 2 if `VaPoReg_s` is a Democracy (10), 1 if it is a
  Semidemocracy (20), 0 otherwise.

- Gapminder_pop:

  Population, per the Gapminder dataset.

- gm_world_pop:

  World population, per the Gapminder dataset

- un_region:

  UN region

- un_cntinent:

  UN continent

## Special Cases

- **Colonial Regimes**: Defined by foreign rule, legal discrimination,
  and lack of sovereignty.

- **Occupation Regimes**: Military-controlled administrations imposed by
  foreign powers.

- **No Central Authority**: Cases where no governing entity holds
  effective control (e.g., Somalia post-1991).

- **Protectorates and Mandates**: Semi-sovereign territories coded
  separately in some instances.

## Sources

The dataset integrates multiple sources, including:

- **Freedom House**

- **Polity IV**

- **V-Dem (Varieties of Democracy Project)**

- **LIED (Lexical Index of Electoral Democracy)**

- **Historical country reports, election archives, and secondary
  literature**

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
  International Interactions 25: 393-413. The list can be found at
  [http://privatewww.essex.ac.uk/~ksg/statelist.html](http://privatewww.essex.ac.uk/~ksg/statelist.md).

- GWn:

  Gleditsch and Ward's numeric country code, from the Gleditsch and Ward
  list of independent states.

- cown:

  The Correlates of War numeric country code, 2016 version. This differs
  from Gleditsch and Ward's numeric country code in a few cases. See
  <http://www.correlatesofwar.org/data-sets/state-system-membership> for
  the full list.

- in_GW_system:

  Whether the state is "in system" (that is, is independent and
  sovereign), according to Gleditsch and Ward, for this particular date.
  Matches at the end of the year; so, for example South Vietnam 1975 is
  `FALSE` because, according to Gleditsch and Ward, the country ended on
  April 1975 (being absorbed by North Vietnam). It is also `TRUE` for
  dates beyond 2012 for countries that did not end by then, depsite the
  fact that the Gleditsch and Ward list has not been updated since.

## References

Kailitz, Steffen. "Varieties of Political Regimes." Available at
<https://www.va-poreg.de/home>.

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
[`vdem_simple`](https://xmarquez.github.io/democracyData/reference/vdem_simple.md),
[`wahman_teorell_hadenius`](https://xmarquez.github.io/democracyData/reference/wahman_teorell_hadenius.md)

Other institutions:
[`LIED`](https://xmarquez.github.io/democracyData/reference/LIED.md),
[`PIPE`](https://xmarquez.github.io/democracyData/reference/PIPE.md)
