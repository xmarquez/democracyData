# The Bertelsmann Transformation Index

The Bertelsmann Transformation Index of the Bertelsmann Stiftung (2024
edition, up to 2022). Data and coding description available at
<https://bti-project.org/en/index/political-transformation>.

## Usage

``` r
bti
```

## Format

An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with
1370 rows and 87 columns.

## Source

Bertelsmann Stiftung. *Transformation Index of the Bertelsmann Stiftung
2024*. Tech. rep. Bertelsmann Stiftung, 2024. Available at
<https://bti-project.org/en/index/political-transformation>.

## Description

The BTI is calculated at Biennial Intervals for approximately 137
countries since 2006.

- bti_country:

  The original country name in the dataset.

- year:

  Calendar year. This is two years earlier than the report date. For
  example, the codebook indicates that the BTI report for 2020 assesses
  the situation as of January 2019, so I've assigned it a calendar year
  of 2018.

- bti_region:

  Region.

- Ranking_Status_Index:

  Country rank in the status index, which "ranks the countries according
  to the state of their democracy and market economy".

- S_Status_Index:

  Status index, which combines the democracy and economy index.

- SI_Democracy_Status:

  Democracy status index.

- Q1_Stateness (Q1.1-1.4):

  Scores on questions on stateness (1-10), from monopoly on the use of
  force to basic administration. The BTI codebook says that this concept
  measures whether "there is clarity about the nation's existence as a
  state with adequately established and differentiated power
  structures." See codebook at
  \<<https://www.bti-project.org/content/en/downloads/codebooks/BTI_2020_Codebook.pdf>\>
  for details.

- Q2_Political_Participation (Q2.1-2.4):

  Scores on questions on political participation (1-10), from free and
  fair elections to freedom of expression. The BTI codebook says this
  concept indicates whether "The populace decides who rules, and it has
  other political freedoms". See codebook at
  <https://www.bti-project.org/content/en/downloads/codebooks/BTI_2020_Codebook.pdf>
  for details.

- Q3_Rule_of_Law (Q3.1-3.4):

  Scores on questions on rule of law (1-10), from checks and balances to
  civil rights. The BTI codebook says that this concept measures whether
  "state powers check and balance one another and ensure civil rights."
  See codebook at
  <https://www.bti-project.org/content/en/downloads/codebooks/BTI_2020_Codebook.pdf>
  for details.

- Q4_Stability_of_Democratic_Institutions (Q4.1-4.2):

  Scores on questions on stability of democratic institutions (1-10),
  from performance of democratic institutions to commitment to
  democratic institutions. The BTI codebook says that this concept
  measures whether "democratic institutions are capable of performing,
  and they are adequately accepted." See codebook at
  <https://www.bti-project.org/content/en/downloads/codebooks/BTI_2020_Codebook.pdf>
  for details.

- Q5_Political_and_Social_Integration (Q5.1-5.4):

  Scores on questions on political and social integration (1-10), from
  rootedness of party system to social capital. The BTI codebook says
  that this concept measures whether "Stable patterns of representation
  exist for mediating between society and the state; there is also a
  consolidated civic culture." See codebook at
  <https://www.bti-project.org/content/en/downloads/codebooks/BTI_2020_Codebook.pdf>
  for details.

- SII_Economy_Status:

  Economy status index.

- Q6_Level_of_Socioeconomic_Development (Q6.1):

  Score on question on the level of socioeconomic development (1-10).
  The BTI codebook says that this concept measures whether "In
  principle, the country's level of development permits adequate freedom
  of choice for all citizens." See codebook at
  <https://www.bti-project.org/content/en/downloads/codebooks/BTI_2020_Codebook.pdf>
  for details.

- Q7_Organization_of_the_Market_and_Competition (Q7.1-7.4):

  Scores on questions on market organization and competition (1-10),
  from market organization to banking system. The BTI codebook says that
  this concept measures whether "There are clear rules for stable,
  market-based competition." See codebook at
  <https://www.bti-project.org/content/en/downloads/codebooks/BTI_2020_Codebook.pdf>
  for details.

- Q8_Monetary_and_Fiscal_Stability (Q8.1-8.2):

  Scores on questions on monetary and fiscal stability (1-10). The BTI
  codebook says that this concept measures whether "There are
  institutional and political precautions to achieve monetary and fiscal
  stability." See codebook at
  <https://www.bti-project.org/content/en/downloads/codebooks/BTI_2020_Codebook.pdf>
  for details.

- Q9_Private_Property (Q9.1-9.2):

  Scores on questions on private property and property rights (1-10).
  The BTI codebook says that this concept measures whether "There are
  adequate conditions to support a functional private sector." See
  codebook at
  <https://www.bti-project.org/content/en/downloads/codebooks/BTI_2020_Codebook.pdf>
  for details.

- Q10_Welfare_Regime (Q10.1-10.2):

  Scores on questions on welfare policy and safety nets (1-10). The BTI
  codebook says that this concept measures whether "There are viable
  arrangements to compensate for social risks." See codebook at
  <https://www.bti-project.org/content/en/downloads/codebooks/BTI_2020_Codebook.pdf>
  for details.

- Q11_Economic_Performance (Q11.1):

  Score on question on economic performance (1-10). The BTI codebook
  says that this concept measures whether "The economy's performance
  points to solid development." See codebook at
  <https://www.bti-project.org/content/en/downloads/codebooks/BTI_2020_Codebook.pdf>
  for details.

- Q12_Sustainability (Q12.1-12.2):

  Scores on questions on sustainability, from environmental policy to
  R&D policy (1-10). The BTI codebook says that this concept measures
  whether "Economic growth is balanced, environmentally sustainable and
  future-oriented." See codebook at
  <https://www.bti-project.org/content/en/downloads/codebooks/BTI_2020_Codebook.pdf>
  for details.

- Ranking_Governance_Index:

  Ranking in governance status index.

- G_Governance_Index:

  Governance status index.

- Q13_Level_of_Difficulty (Q13.1-13.5):

  Scores on questions on level of difficulty in governance (1-10), plus
  some rescaled measures of objective difficulty (education, stateness,
  GNI per capita). See codebook at
  <https://www.bti-project.org/content/en/downloads/codebooks/BTI_2020_Codebook.pdf>
  for details.

- Q14_Steering_Capability (Q14.1-14.3):

  Scores on questions on the government's steering capability, from
  prioritization to policy learning (1-10). The BTI codebook says that
  this concept measures whether "The government manages reforms
  effectively and can achieve its policy priorities." See codebook at
  <https://www.bti-project.org/content/en/downloads/codebooks/BTI_2020_Codebook.pdf>
  for details.

- Q15_Resource_Efficiency (Q15.1-15.3):

  Scores on questions on the government's efficiency, from efficient use
  of assets to anti-corruption capability (1-10). The BTI codebook says
  that this concept measures whether "The government makes optimum use
  of available resources." See codebook at
  <https://www.bti-project.org/content/en/downloads/codebooks/BTI_2020_Codebook.pdf>
  for details.

- Q16_Consensus-Building (Q16.1-16.6):

  Scores on questions on the government's ability to build consensus,
  from consensus on goals to civil society participation to
  reconciliation (1-10). The BTI codebook says that this concept
  measures whether "The political leadership establishes a broad
  consensus on reform with other actors in society without sacrificing
  its reform goals." See codebook at
  <https://www.bti-project.org/content/en/downloads/codebooks/BTI_2020_Codebook.pdf>
  for details.

- Q17_Consensus-Building (Q17.1-17.3):

  Scores on questions on the government's international cooperation,
  from effective use of support to credibility to regional cooperation
  (1-10). The BTI codebook says that this concept measures whether "The
  political leadership is willing and able to cooperate with external
  supporters and organizations." See codebook at
  <https://www.bti-project.org/content/en/downloads/codebooks/BTI_2020_Codebook.pdf>
  for details.

- pol_sys:

  A dichotomous indicator of the political system. 1 = democracy, 0 =
  autocracy.

- cat_dem_stat:

  A more fine-grained indicator of democracy, ranging from 1 (most
  democratic) to 5 (least democratic).

- cat_dem_stat_label:

  A label for the more fine-grained indicator of democracy, ranging from
  "Democracies in consolidation" to "Hard-line autocracies".

- report_year:

  Report year. This is always two years more than `year`

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
[`vaporeg`](https://xmarquez.github.io/democracyData/reference/vaporeg.md),
[`vdem_simple`](https://xmarquez.github.io/democracyData/reference/vdem_simple.md),
[`wahman_teorell_hadenius`](https://xmarquez.github.io/democracyData/reference/wahman_teorell_hadenius.md)

Other continuous democracy indexes:
[`arat_pmm`](https://xmarquez.github.io/democracyData/reference/arat_pmm.md),
[`bollen_pmm`](https://xmarquez.github.io/democracyData/reference/bollen_pmm.md),
[`download_wgi_voice_and_accountability()`](https://xmarquez.github.io/democracyData/reference/download_wgi_voice_and_accountability.md),
[`eiu`](https://xmarquez.github.io/democracyData/reference/eiu.md),
[`hadenius_pmm`](https://xmarquez.github.io/democracyData/reference/hadenius_pmm.md),
[`munck_pmm`](https://xmarquez.github.io/democracyData/reference/munck_pmm.md),
[`svmdi`](https://xmarquez.github.io/democracyData/reference/svmdi.md),
[`vanhanen`](https://xmarquez.github.io/democracyData/reference/vanhanen.md),
[`vdem_simple`](https://xmarquez.github.io/democracyData/reference/vdem_simple.md)
