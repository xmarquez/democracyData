# Update of the Democracy and Dictatorship Dataset by Bjørnskov and Rode

This dataset updates
[pacl](https://xmarquez.github.io/democracyData/reference/pacl.md) with
more countries and coverage from 1950 to 2025, as described in C.
Bjørnskov and M. Rode. "Regime Types and Regime Change: A New Dataset on
Democracy, Coups, and Political Institutions". In: *The Review of
International Organizations* 15.2 (2020), pp. 531-551. DOI:
10.1007/s11558-019-09345-1. C. Bjørnskov and M. Rode. *Bjørnskov-Rode
Integrated Dataset v6.2*. 2025.
<http://www.christianbjoernskov.com/bjoernskovrodedata/>. The full data
and codebook can be downloaded at
<http://www.christianbjoernskov.com/bjoernskovrodedata/>. The
documentation below is directly copied from the codebook.

## Usage

``` r
pacl_update

aclp_update()

dd_update()

cgv_update()
```

## Format

An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with
15808 rows and 50 columns.

## Source

C. Bjørnskov and M. Rode. "Regime Types and Regime Change: A New Dataset
on Democracy, Coups, and Political Institutions". In: *The Review of
International Organizations* 15.2 (2020), pp. 531-551. DOI:
10.1007/s11558-019-09345-1. C. Bjørnskov and M. Rode. *Bjørnskov-Rode
Integrated Dataset v6.2*. 2025.
<http://www.christianbjoernskov.com/bjoernskovrodedata/>. The full data
and codebook can be downloaded at
<http://www.christianbjoernskov.com/bjoernskovrodedata/>

## Details

- pacl_update_country:

  Country name in the original dataset.

- pacl_update_country_isocode:

  Three letter ISO country code.

- year:

  Year.

- DD_regime:

  Numeric regime category, following Cheibub, Ghandi and Vreeland (2010)
  (Parliamentary democracies = 0, Mixed democracies (with weak
  presidents) = 1, Presidential democracies = 2, Civilian autocracies =
  3, Military dictatorships = 4, and Royal dictatorships = 5)

- DD_category:

  Regime category label, following Cheibub, Ghandi and Vreeland (2010)
  (Parliamentary democracies = 0, Mixed democracies (with weak
  presidents) = 1, Presidential democracies = 2, Civilian autocracies =
  3, Military dictatorships = 4, and Royal dictatorships = 5)

- Monarchy:

  Is the country a hereditary monarchy? (Monarchy = 1, Republic = 0)

- Commonwealth:

  Is the country a member of the British Commonwealth? (Commonwealth =
  1, Other = 0)

- Monarch_name:

  Name of the monarch.

- Monarch_accession:

  Year of accession of the monarch.

- Monarch_birthyear:

  Year of birth of the monarch.

- Female_monarch:

  Is the monarch female? (No=0, Yes=1)

- Democracy:

  Is the country democratic or not? following Cheibub, Ghandi and
  Vreeland (2010) (Democracy = 1, Autocracy = 0) Dichotomous indicator
  of democracy based on a minimalist definition. A country is defined as
  democratic, if elections were conducted, these were free and fair, and
  if there was a peaceful turnover of legislative and executive offices
  following those elections.

- Presidential:

  Is the political system presidential? (No=0, Yes=1)

- President_name:

  Name of the president.

- President_accesion:

  Accession year of the president.

- President_birthyear:

  Year of birth of the president.

- Interim_phase:

  Is the president interim / preliminary? (more than 2
  Presidents/year=1, Otherwise=0)

- Female_president:

  Is the president female? (No=0, Yes=1)

- Colony:

  Is the country a colony? (No=0, Yes=1)

- Colony_of:

  If colony, which country is the colonial power? Country name of the
  colonial power.

- Colony_administrated_by:

  If colony, which country is the colonial administrator?

- Communist:

  Is the country's regime communist / socialist? (No=0, Yes=1)

- Regime_change_lag:

  Regime Change lag (No=0, Yes=1) If a coded event, such as a change in
  the Presidency, took place after 01.07 it is assigned to the following
  calendar year in the data. In this case, the lag variable will be
  equal to one. For all change events before that date, the lag dummy is
  equal to zero.

- spatial_democracy:

  Average of geographical neighbors' Democracy score

- countrycode:

  Numeric country ID. Undocumented in original codebook.

- No_of_chambers_in_parliament:

  Total number of chambers in parliament.

- proportional_voting:

  Is the electoral system characterized by including proportional
  representation? (No=0, Yes=1)

- Election_system:

  Electoral system. Can be FPTP, List PR (large multi-member), List PR,
  Parallel SMD/PR, List PR (small multi-member), PR, Mixed member
  SMD/PR, FPTP and appointed, List PR(small multi-member), Some form of
  FPTP, SNTV, National list, STV, Single-member constituency, Party list
  PR, Bloc voting, Multiple vote, FPTP and bloc voting, FPTP and Hare
  quota, Hagenbasch-Bischoff, Appointed, List PR(large multi-member),
  IRV, Multi-seat PR, Plurality-at-large / d'Hondt, d'Hondt and Saint
  algue, List PR (small multi-party), Mix, Some form of PR, Proportional
  representation, Multi-member constituencies, Block Vote, Mix of
  appointment and local election, d'Hondt, FPTP / PR, Borda count,
  Single-member plurality, FPTP and reserved, PR / Sainte-Laguë, Mixed
  member majoritarian, Two-round FPTP, Endorsement, Most multi-seat
  constituencies by simple majority vote, PR and nomination, Two round
  single-member constituencies, Ethnic FPTP, FPTP / Bloc voting, FPTP /
  Party list, Half single constituency, half PR, Indirectly elected by
  the provincial people's congresses, Multi- and single-seat
  constituency, Closed-list proportional representation, Lists, FPTP,
  party list multi member constituency, Two round absolute majority, All
  appointed, Closed list PR, Single list, Appointed by Basic Peoples
  Congresses, Mix PR and functional constituencies, MMP / FPTP, FPTP in
  two colleges, PR and appointed, Multiple non-transferable vote system,
  Single-member constituencies majority, One constituency, d'Hondt,
  Partially-open list proportional representation, majority bonus, Party
  list and FPTP, PR and Droop quota, PR Hare quota, FPTP and
  proportional, Simple majority constituency, Closed list proportional
  representation, List PR and appointment, Simple majority, one
  constituency, Sainte-Laguë, Single constituency, Party-list
  proportional representation, Party list, Two-round, Elected and
  single-member constituency, FPTP / appointed, Mixed Member SDM/PR,
  Party list majority, PR / FPTP, Single-seat constituencies, FPTP and
  reserved seats, Indirect through eight regional colleges, Largest
  remainder, Party list proportional representation, Two round single
  seat constituency, Appointed by clans, Open party-list proportional
  representation, Plurality party-list system, Elected by people's
  district assemblies, FPTP and nomination, Mixed, Most appointed, FPTP
  and party list, Most in open list multi member constituencies,
  Multi-seat constituency majority, Mainly appointed, Nominated by
  parties, FPTP after some appointed, Mixed PR / FPTP, Single seat
  constituency, Elected by provincial assemblies, FPTP and d'Hondt,
  Mixed appointment and unknown, FPTP and appointment, Single-seat
  constituency, Som form of FPTP, Elected by colleges, Half elected by
  local councils and half by corporations, Majority party list,
  Panchayat system, PR and FPTP, Seven-stage process, FPTP and PR, FPTP
  within two colleges, Appointed by governor, FPTP, multi member
  constituency, Multi-seat constituency, Party nominees, Mix nominated
  and unknown, Mixed member SMD/PR with large bonus, Single list of
  candidates, Parallel SMP/PR, Party Block vote, Single constituency
  majority, Unknown, FPTP and nominated, Limited Vote, Mixed-member
  SMD/PR, Multi-member constituencies. Single Transferable Vote, PR in
  15 of 26 constituencies; Bloc voting, Two-round single-member
  constituency, 346 elected by municipal citizens, 181 chosen by 'social
  sectors', Election in two colleges, Party-list proportional
  representation., Single electoral college, SNTV and appointed, ?,
  Coopted, List P (large multi-member), Selected by committee, Single
  district.

- No_of_members_in_lower_house:

  If bicameral parliament, total number of members in lower house.

- No_of_members_in_upper_house:

  If bicameral parliament, total number of members in upper house.

- No_of_members_in_third_house:

  If tricameral parliament, total number of members in third house.

- New_constitution:

  Whether a new constitution was implemented (No=0, Yes=1)

- fullsuffrage:

  Whether electoral system attributes full suffrage. (No=0, Yes=1)

- Suffrage_restriction:

  If no full suffrage, kind of suffrage restriction

- electoral:

  Alternative democracy indicator capturing degree of multi-party
  competition (No elections=0, Single-party elections=1, non-democratic
  multi-party elections=2, democratic elections= 3)

- spatial_electoral:

  Average of geographical neighbors' electoral.

- alternation:

  Whether there's an alternation in power after election. Undocumented
  in original codebook.

- multiparty:

  Whether the elections are multiparty. Undocumented in original
  codebook.

- free_and_fair_election:

  Whether the elections are free and fair. Undocumented in original
  codebook.

- parliamentary_election_year:

  Year of parliamentary election. Undocumented in original codebook.

- Parliamentary_election_month_year:

  Month and year of parliamentary election. Undocumented in original
  codebook.

- Postponed_parliamentary_election:

  Whether the parliamentary election was postponed. Undocumented in
  original codebook.

- Presidential_election_year:

  Year of presidential election. Undocumented in original codebook.

- Presidential_election_month_year:

  Month and year of presidential election. Undocumented in original
  codebook.

- Postponed_presidential_election:

  Whether the presidential election was postponed. Undocumented in
  original codebook.

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
[`magaloni`](https://xmarquez.github.io/democracyData/reference/magaloni.md),
[`mainwaring`](https://xmarquez.github.io/democracyData/reference/mainwaring.md),
[`munck_pmm`](https://xmarquez.github.io/democracyData/reference/munck_pmm.md),
[`pacl`](https://xmarquez.github.io/democracyData/reference/pacl.md),
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
[`doorenspleet`](https://xmarquez.github.io/democracyData/reference/doorenspleet.md),
[`kailitz`](https://xmarquez.github.io/democracyData/reference/kailitz.md),
[`pacl`](https://xmarquez.github.io/democracyData/reference/pacl.md),
[`svolik_regime`](https://xmarquez.github.io/democracyData/reference/svolik_regime.md),
[`ulfelder`](https://xmarquez.github.io/democracyData/reference/ulfelder.md),
[`utip`](https://xmarquez.github.io/democracyData/reference/utip.md),
[`vaporeg`](https://xmarquez.github.io/democracyData/reference/vaporeg.md),
[`vaporeg_2024`](https://xmarquez.github.io/democracyData/reference/vaporeg_2024.md),
[`wahman_teorell_hadenius`](https://xmarquez.github.io/democracyData/reference/wahman_teorell_hadenius.md)
