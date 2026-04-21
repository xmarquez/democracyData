# Simplified version of the V-Dem version 14 dataset

This data frame contains a very reduced version of version 14 of the
V-Dem dataset, including only the 7 main indexes that measure democracy
directly (v2x_polyarchy, v2x_libdem, v2x_partipdem, v2x_delibdem,
v2x_egaldem, v2x_api, and v2x_mpi) and their associated uncertainty
measures. The full VDem dataset is available via the
[vdemdata](https://github.com/vdeminstitute/vdemdata) package. To cite
VDem, use M. Coppedge, J. Gerring, C. H. Knutsen, et al. *V-Dem Codebook
V14*. Tech. rep. Varieties of Democracy (V-Dem) Project, 2024.

## Usage

``` r
vdem_simple
```

## Format

An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with
27913 rows and 54 columns.

## Details

Variable descriptions taken from the V-Dem codebook directly.

## V-Dem Identifiers

- vdem_country_name:

  Country name. Name of coded country. A V-Dem country is a political
  unit enjoying at least some degree of functional and/or formal
  sovereignty.

- country_text_id:

  Country name abbreviation. Abbreviated country names.

- country_id:

  V-Dem country ID. Unique country ID designated for each country.

- year:

  Year. Four-digit designation of the year for which an observation is
  given that ranges from the start to the end of the coding period.

- historical_date:

  Historical Date. Variable designating the date for which observation
  is given. The date is coded in YYYY-MM-DD format. December 31
  observation always refers to the situation at the end of the year.
  There can be observations on other dates signifying other events, i.e.
  elections or executive appointments.

- project:

  V-Dem Project. Indication what project team has coded country in
  respective year.

- historical:

  Historical V-Dem Coding. Binary indication whether the country in
  question has been coded by the team of Historical V-Dem project.

- histname:

  Time-specific name of coded country. Many countries go by different
  names in different time-periods, for example due to name changes,
  changes in territory, colonization, occupation, or independence. This
  variable contains a brief description of the identity of each polity
  that comprises a country's history. This variable is based on the
  V-Dem Country Coding Units document.

- codingstart:

  Start of coding period. Year in which coding of the country in
  question starts. V-Dem country coding starts in 1789, or from when a
  country first enjoyed at least some degree of functional and/or formal
  sovereignty.

- codingend:

  End of coding period. Either a maximum year of country coding period
  or the year when the country ceased to exist because it lost
  functional or formal sovereignty.

- codingstart_contemporary:

  Contemporary start of coding period. Year in which the coding of
  Contemporary V-Dem project starts. Variables from "Contemporary"
  project can have different question formulation, variable type, or
  number of coders as opposed to the "Historical" one.

- codingend_contemp:

  Historical End of Coding Period. Year in which the coding of
  Contemporary V-Dem project ends. Variables from the "Contemporary"
  project can have different question formulation, variable type, or
  number of coders as opposed to the "Historical" one.

- codingstart_hist:

  Historical start of coding period. Year in which the coding of
  Historical V-Dem project starts. Variables from “Historical” project
  can have different question formulation, variable type, or number of
  coders as opposed to the "Contemporary" one.

- codingend_hist:

  Historical End of Coding Period. Year in which the coding of
  Historical V-Dem project ends. Variables from "Historical" project can
  have different question formulation, variable type, or number of
  coders as opposed to the "Contemporary" one.

- gapstart1, gapstart2, gapstart3:

  Time periods when a country does not fulfill V-Dem's coding period
  criteria are not coded. The date that indicates the gap start is the
  last date coded before the gap. For more details about V-Dem country
  coding periods, please see the V-Dem Country Coding Units document.

- gapend1, gapend2, gapend3:

  The periods of when a country does not fulfill V-Dem's coding period
  criteria are not coded. The date that indicates the gap end is the
  first date coded after the gap. For more details about V-Demcountry
  coding periods, please see the V-Dem Country Coding Units document.

- gap_index:

  An index for each country and continuous non-gap, i.e. it is
  reasonable for interpolation to interpolate only within the same gap
  index. For more details about V-Dem country coding periods, please see
  the V-Dem Country Coding Units document.

- vdem_cowcode:

  COW Country Code. Correlates of War (COW) project country codes.

## V-Dem Main Indexes

Each of the indexes described below comes with associated uncertainty
measures: `_codehigh` and `_codelow` (the interval where the V-Dem
Bayesian measurement model places 68% of the probability mass, or
approximately one standard deviation upper and lower bounds, possibly
asymmetric) and `_sd` (frequentist standard deviation).

- v2x_polyarchy:

  Electoral democracy index. To what extent is the ideal of electoral
  democracy in its fullest sense achieved? The electoral principle of
  democracy seeks to embody the core value of making rulers responsive
  to citizens, achieved through electoral competition for the
  electorate's approval under circumstances when suffrage is extensive;
  political and civil society organizations can operate freely;
  elections are clean and not marred by fraud or systematic
  irregularities; and elections affect the composition of the chief
  executive of the country. In between elections, there is freedom of
  expression and an independent media capable of presenting alternative
  views on matters of political relevance. In the V-Dem conceptual
  scheme, electoral democracy is understood as an essential element of
  any other conception of representative democracy — liberal,
  participatory, deliberative, egalitarian, or some other.

- v2x_libdem:

  Liberal democracy index. To what extent is the ideal of liberal
  democracy achieved?

  The liberal principle of democracy emphasizes the importance of
  protecting individual and minority rights against the tyranny of the
  state and the tyranny of the majority. The liberal model takes a
  ~negative~ view of political power insofar as it judges the quality of
  democracy by the limits placed on government. This is achieved by
  constitutionally protected civil liberties, strong rule of law, an
  independent judiciary, and effective checks and balances that,
  together, limit the exercise of executive power. To make this a
  measure of liberal democracy, the index also takes the level of
  electoral democracy into account.

- v2x_delibdem:

  Deliberative democracy index. To what extent is the ideal of
  deliberative democracy achieved?

  The deliberative principle of democracy focuses on the process by
  which decisions are reached in a polity. A deliberative process is one
  in which public reasoning focused on the common good motivates
  political decisions—as contrasted with emotional appeals, solidary
  attachments, parochial interests, or coercion. According to this
  principle, democracy requires more than an aggregation of existing
  preferences. There should also be respectful dialogue at all
  levels—from preference formation to final decision—among informed and
  competent participants who are open to persuasion. To make it a
  measure of not only the deliberative principle but also of democracy,
  the index also takes the level of electoral democracy into account.

- v2x_partipdem:

  Participatory democracy index. To what extent is the ideal of
  participatory democracy achieved?

  The participatory principle of democracy emphasizes active
  participation by citizens in all political processes, electoral and
  non-electoral. It is motivated by uneasiness about a bedrock practice
  of electoral democracy: delegating authority to representatives. Thus,
  direct rule by citizens is preferred, wherever practicable. This model
  of democracy thus takes suffrage for granted, emphasizing engagement
  in civil society organizations, direct democracy, and subnational
  elected bodies. To make it a measure of participatory democracy, the
  index also takes the level of electoral democracy into account.

- v2x_mpi:

  Multiplicative polyarchy index. To what extent is the electoral
  principle of democracy achieved?

  The electoral principle of democracy seeks to achieve responsiveness
  and accountability between leaders and citizens through the mechanism
  of competitive elections. This is presumed to be achieved when
  suffrage is extensive; political and civil society organizations can
  operate freely; elections are clean and not marred by fraud or
  systematic irregularities; and the chief executive of a country is
  selected directly or indirectly through elections.

- v2x_egaldem:

  Egalitarian democracy index. To what extent is the ideal of
  egalitarian democracy achieved?

  The egalitarian principle of democracy holds that material and
  immaterial inequalities inhibit the exercise of formal rights and
  liberties, and diminish the ability of citizens from all social groups
  to participate. Egalitarian democracy is achieved when 1) rights and
  freedoms of individuals are protected equally across all social
  groups; and 2) resources are distributed equally across all social
  groups; 3) groups and individuals enjoy equal access to power. To make
  it a measure of egalitarian democracy, the index also takes the level
  of electoral democracy into account.

- v2x_api:

  Additive polyarchy index. To what extent is the electoral principle of
  democracy achieved?

  electoral principle of democracy seeks to achieve responsiveness and
  accountability between leaders and citizens through the mechanism of
  competitive elections. This is presumed to be achieved when suffrage
  is extensive; political and civil society organizations can operate
  freely; elections are clean and not marred by fraud or systematic
  irregularities; and the chief executive of a country is selected
  directly or indirectly through elections.

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

M. Coppedge, J. Gerring, C. H. Knutsen, et al. *V-Dem Codebook V14*.
Tech. rep. Varieties of Democracy (V-Dem) Project, 2024.

D. Pemstein, K. L. Marquardt, E. Tzelgov, et al. *The V-dem Measurement
Model: Latent Variable Analysis for Cross-national and Cross-temporal
Expert-coded Data*. Tech. rep. 21. Varieties of Democracy Institute,
University of Gothenburg, 2022.

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
[`vaporeg`](https://xmarquez.github.io/democracyData/reference/vaporeg.md),
[`wahman_teorell_hadenius`](https://xmarquez.github.io/democracyData/reference/wahman_teorell_hadenius.md)

Other continuous democracy indexes:
[`arat_pmm`](https://xmarquez.github.io/democracyData/reference/arat_pmm.md),
[`bollen_pmm`](https://xmarquez.github.io/democracyData/reference/bollen_pmm.md),
[`bti`](https://xmarquez.github.io/democracyData/reference/bti.md),
[`download_wgi_voice_and_accountability()`](https://xmarquez.github.io/democracyData/reference/download_wgi_voice_and_accountability.md),
[`eiu`](https://xmarquez.github.io/democracyData/reference/eiu.md),
[`hadenius_pmm`](https://xmarquez.github.io/democracyData/reference/hadenius_pmm.md),
[`munck_pmm`](https://xmarquez.github.io/democracyData/reference/munck_pmm.md),
[`svmdi`](https://xmarquez.github.io/democracyData/reference/svmdi.md),
[`vanhanen`](https://xmarquez.github.io/democracyData/reference/vanhanen.md)
