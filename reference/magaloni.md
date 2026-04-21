# Autocracies of the World, 1950-2012 (Version 1.0).

The "Autocracies of the World" dataset by B. Magaloni, J. Chu, and E.
Min. *Autocracies of the World, 1950-2012 (Version 1.0)*. Dataset. 2013.
<https://dx.doi.org/10.2139/ssrn.4346003>. Original data and codebook
used to be available at the link. The documentation here is directly
derived from this codebook.

## Usage

``` r
magaloni

magaloni_extended
```

## Format

An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with
8629 rows and 28 columns.

An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with
10291 rows and 10 columns.

## Source

B. Magaloni, J. Chu, and E. Min. *Autocracies of the World, 1950-2012
(Version 1.0)*. Dataset. 2013.
<https://dx.doi.org/10.2139/ssrn.4346003>.

## Overview

This dataset classifies the world's political regimes, primarily
focusing on distinctions among different types of autocracies, between
1950 and 2012. Over the last decade, academic work on political
institutions has placed more focus on differences within autocracies-a
group of polities that were long treated as a homogenous pool defined by
"lack of democracy." Advancing the literature, contributions such as
Geddes (2003) have observed and delineated differences in the governing
institutions, power holders, and nature of governance among various
autocratic governments. Such studies have given rise to a wealth of
insightful research.

Attempts to study autocracies in a larger-scale, quantitative manner
have resulted in the creation of datasets that classify countries over
time using varying taxonomies. The field of extant datasets is
relatively new and still developing. (For examples, see Wahman et al.
2013; Geddes et al. 2011; and Cheibub et al. 2010.) We seek to
contribute to this research agenda with this first edition of a new
dataset.

Our dataset includes several features that we believe are quite useful.
These include:

- Avoiding "missing," "transitional," and hybrid classifications. Many
  countries have tumultuous years of instability, transition, and flux.
  However, this does not eliminate the fact that a government of some
  sort exists during these years. Substantial efforts were made to
  figure out the institutions underlying transitional regimes. For
  example, a military government can oversee a transition to democracy.
  Thus, rather than leave certain observations blank, we create a
  separate variable for transitional years to allow researcher the
  flexibility of deciding whether or not those observations are relevant
  to their analysis. (The only exception is Somalia from 1991 to 2006,
  where the polity seems truly "stateless.") Similarly, we sought to
  eliminate hybrid regime classifications. There are high quality
  datasets available for scholars who are interested analyzing hybrid
  authoritarian regimes (such as Geddes et al. 2011). We have found,
  however, that hybrid classifications often (1) hinder useful
  quantitative analysis or (2) are actually essentially one type of
  regime, but only appear hybrid due to certain window-dressing
  institutional features. Finding the "essential" regime type seems to
  be a valuable contribution.

- Providing two novel and objective measures of personalism. Currently
  available datasets recognize that certain autocratic regimes are
  highly "personalistic" and have created a personalist regime type. We
  agree that personalism is an important feature of many autocracies,
  but we depart from previous work in our belief that personalism is a
  quality distinct from the regime's institutions and is a concept that
  should be operationalized as its own variable. In other words, all
  autocracies have some degree of personalism: a military regime, for
  example, could have a very non-personalistic, corporate leadership or
  it can have a highly personalistic general as the head of state. In
  addition to treating personalism as a distinct concept, we have
  observed that measures of personalism lack objective and clear
  criteria for measurement. Most existing datasets rely on general
  consensus of the qualitative literature to identify a personalistic
  regime. Given these two concerns, we provide two measures of
  personalism (detailed below) in this dataset.

- Classifying through 2012. In covering up to 2012, the dataset will
  hopefully retain some longevity as other complementary datasets, many
  of which end in the mid-2000s, are extended into more recent years. We
  also hope to update this dataset periodically with more years and
  useful covariates.

## Summary of Variables

Several sets of variables come in pairs: `variable_r` and `variable_nr`.
These correspond with rounded and non-rounded values. The rationale and
methodology behind these pairs of data is provided in the section
entitled "Transition Years and Rounding." (See online codebook).

Two datasets are provided. The original dataset (`magaloni`) and an
"extended" but simplified dataset (`magaloni_extended`) that extends the
duration of the first regime (`regime_nr` and `demo_nr`) for each
country backwards in time before 1950 (using the variable
`duration_nr`). The `magaloni_extended` dataset omits all the indicators
of personalism or head of government.

- cyear:

  Numeric expression of country-year, made by concatenating ccode and
  year.

- cntyr:

  Alphanumeric expression of country-year, made by concatenating scode
  and year.

- magaloni_ccode:

  Numeric country codes, based on the Correlates of War dataset, as in
  the original dataset. Use `cown` instead.

- scode:

  Three-letter country codes, based on the Correlates of War dataset.

- magaloni_country:

  String version of country, as in original dataset. Use `country_name`
  instead.

- year:

  Four-digit calendar year. In the `magaloni_extended` the year is
  extended to back before 1950 using `duration_nr`, which adds 1662
  observations to `regime_nr` and `demo_nr`.

- un_region:

  Region, based on classifications by the United Nations, as in the
  original dataset. Use `region` instead, which is based on the same
  classifications but is more comprehensive - no missing values.

- un_continent:

  Continent, based on classifications by the United Nations, as in the
  original dataset. Use `continent` instead, which is based on the same
  classifications but is more comprehensive - no missing values.

- reg_id:

  A unique number identifying a specific regime in a specific country.
  The number is created by combining the country code (ccode) with a
  basic regime count in the country in the following manner:
  100\*(ccode) + running total. For example, the first country-year in
  the data for Haiti (country code is 41) is 4101, and changes to 4102
  the year that regime type changes in the country. Note that this ID is
  created using the non-rounded regime classifications.

- demo_r:

  A dummy variable for whether a given country-year has a democratic
  regime, using the rounding rule. (Note that these classifications do
  not necessarily align with a strict threshold based on Polity scores.)

- demo_nr:

  A dummy variable for whether a given country-year has a democratic
  regime, without rounding. (Note that these classifications do not
  necessarily align with a strict threshold based on Polity scores.)

- regime_r:

  The regime type of a given country-year, using the rounding rule so
  that the regime type that constituted the majority (or plurality) of
  the year is used. The list of potential regimes includes:

  - Democracy

  - Multiparty

  - Single party

  - Military

  - Monarchy

  Definitions of each are provided in the "Classifying Autocracies"
  section. Note that these classifications are mutually exclusive for
  any given country-year.

- regime_nr:

  The regime type of a given country-year, in which the classification
  is based on the regime type that exists at the end of the year. This
  is the more "conventional" approach of other regime datasets.

- duration_r:

  The age of a regime up to the given country-year, using the rounding
  rule. The count begins at 1.

- duration_nr:

  The age of a regime up to the given country-year, without rounding.
  The first year in which a new regime takes hold is recorded as 1,
  regardless of when in the year this new regime appears.

- personal1:

  A three-point measure of the country-year's regime's degree of
  personalism. This is based on the seven-point `xconst` (executive
  constraints) scale of the Polity IV dataset. The following conversion
  was used:

  xconst 1 Highly personal 2

  xconst 2-4 Moderately personal 1

  xconst 5-7 Weakly/not personal 0

  In contrast to `personal2`, whenever Polity IV does not provide an
  `xconst` measure (periods of transition, interregnum, or occupation),
  this measure is left blank.

- personal2:

  Identical to `personal1`, except missing values are filled in.
  Whenever possible, missing values are imputed using the xconst
  measures that do exist for a given regime. When a regime has the same
  recorded `xconst` throughout, this value is used for missing values.
  When xconst is not the same throughout a given regime, values are
  prorated to fill middle years and based on the closest xconst measure
  to fill years that are on either end of the regime's lifespan.

- lindex:

  A newly constructed measure of personalism within each regime. (See
  the "Personalism" subsection for a substantive explanation of this
  metric.) The variable is essentially a Herfendahl index (sum of
  squared shares) using the column exname. For a given country-year in a
  unique regime (see `reg_id`), the following calculation is made:
  \$sum\_{i=1}^{m} (exec_i/n)^2\$ where n is the age of the regime up to
  that year, and exec is the number of years that a unique executive i
  (out of a total m executives up to that year) has led the regime. As
  such, a regime led by only one person up through that year yields a
  personalism index of

  1.  A theoretical scenario where leadership changes every single year
      would yield 1/n. These calculations are made using the non-rounded
      values. We note that this is a relatively sensitive measure in the
      early/formative years of an individual regime, but we propose this
      is a useful way of considering personalism as an evolving
      attribute of a regime over time. More discussion on the relative
      merits of this measure can be found below.

- exname:

  The name of the executive head of state in the country-year. Country
  years from 1950 to 2008 are based on Cheibub, Gandhi, and Vreeland
  (2010).

- change:

  A dummy for whether a regime change occurred in this country-year.
  (Note that in cases such as coups and counter-coups, such changes can
  occur without the overarching regime type changing.)

- tdate:

  The date a country underwent transition to a new regime type. The
  format is MM.DD.YYYY, and this date is used in the rounding rule (see
  the section entitled "Transitional Years and Rounding"). When a
  specific month or date cannot be identified, "00" is used.

- trans:

  A dummy variable indicating whether the country was in the midst of
  transition, as noted by the Polity IV dataset.

- occup:

  A dummy variable indicating whether the country was occupied by a
  foreign power in the given year, as noted by the Polity IV dataset.

- interreg:

  A dummy variable indicating whether the country was in the midst of
  interregnum in the given year, as noted by the Polity IV dataset.

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

Other authoritarianism:
[`REIGN`](https://xmarquez.github.io/democracyData/reference/REIGN.md),
[`anckar`](https://xmarquez.github.io/democracyData/reference/anckar.md),
[`gwf_all`](https://xmarquez.github.io/democracyData/reference/gwf_all.md),
[`kailitz`](https://xmarquez.github.io/democracyData/reference/kailitz.md),
[`utip`](https://xmarquez.github.io/democracyData/reference/utip.md),
[`wahman_teorell_hadenius`](https://xmarquez.github.io/democracyData/reference/wahman_teorell_hadenius.md)
