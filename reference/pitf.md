# PITF democracy indicator

The democracy indicator used by the political instability task force and
described in J. Goldstone, R. Bates, D. Epstein, et al. "A Global Model
for Forecasting Political Instability". In: *American Journal of
Political Science* 54.1 (2010), pp. 190-208. DOI:
[10.1111/j.1540-5907.2009.00426.x](https://dx.doi.org/10.1111/j.1540-5907.2009.00426.x).
The data is derived from the Polity dataset (pitf uses version 5;
pitf_p4 uses PolityIV updated to 2018).

## Usage

``` r
pitf

pitf_p4
```

## Format

An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with
16582 rows and 13 columns.

An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with
16581 rows and 13 columns.

## Variables

- pitf_country:

  The original country name in the Polity dataset.

- pitf_ccode:

  The `ccode` variable in the polity dataset. Should be identical to
  `cown`.

- year:

  The calendar year.

- exrec:

  The polity "executive recruitment" variable. Can be: 1 = Ascription

  2 = Dual Executive (Designation)

  3 = Designation

  4 = Self-Selection

  5 = Gradual Transition from Self-Selection Dual Executive (Election)

  6 = Transitional or Restricted Election

  7 = Competitive Election.

  See the polity codebook for more details.

- parcomp:

  The polity "competitiveness of participation" variable. See the polity
  codebook for more details. Here's what the codebook says:

  The Competitiveness of Participation: The competitiveness of
  participation refers to the extent to which alternative preferences
  for policy and leadership can be pursued in the political arena.
  Political competition implies a significant degree of civil
  interaction, so polities which are coded Unregulated (1) on Regulation
  of Participation (PARREG, variable 2.5) are not coded for
  competitiveness. Polities in transition between Unregulated and any of
  the regulated forms on variable 2.5 also are not coded on variable
  2.6. Competitiveness is coded on a five category scale:

  \(0\) Not Applicable: This is used for polities that are coded as
  Unregulated, or moving to/from that position, in Regulation of
  Political Participation (variable 2.6).

  \(1\) Repressed: No significant oppositional activity is permitted
  outside the ranks of the regime and ruling party. Totalitarian party
  systems, authoritarian military dictatorships, and despotic monarchies
  are typically coded here. However, the mere existence of these
  structures is not sufficient for a Repressed coding. The regime's
  institutional structure must also be matched by its demonstrated
  ability to repress oppositional competition.

  \(2\) Suppressed: Some organized, political competition occurs outside
  government, without serious factionalism; but the regime
  systematically and sharply limits its form, extent, or both in ways
  that exclude substantial groups (20 percent or more of the adult
  population) from participation. Suppressed competition is
  distinguished from Factional competition (below) by the systematic,
  persisting nature of the restrictions: large classes of people,
  groups, or types of peaceful political competition are continuously
  excluded from the political process. As an operational rule, the
  banning of a political party which received more than 10 percent of
  the vote in a recent national election is sufficient evidence that
  competition is "suppressed." However, other information is required to
  determine whether the appropriate coding is (2) Suppressed or (3)
  Factional competition. This category is also used to characterize
  transitions between Factional and Repressed competition. Examples of
  "suppression" are:

  i\. Prohibiting some kinds of political organizations, either by type
  or group of people involved (e.g., no national political parties or no
  ethnic political organizations).

  ii\. Prohibiting some kinds of political action (e.g., Communist
  parties may organize but are prohibited from competing in elections).

  iii\. Systematic harassment of political opposition (leaders killed,
  jailed, or sent into exile; candidates regularly ruled off ballots;
  opposition media banned, etc.). This is evidence for either Factional,
  Suppressed, or Repressed, depending on the nature of the regime, the
  opposition, and the persistence of political groups. Note 3.6: A newly
  enacted right to engage in political activities is most likely a
  change from category 1 to 2.

  \(3\) Factional: Polities with parochial or ethnic-based political
  factions that regularly compete for political influence in order to
  promote particularist agendas and favor group members to the detriment
  of common, secular, or cross-cutting agendas.

  \(4\) Transitional: Any transitional arrangement from Restricted,
  Suppressed, or Factional patterns to fully Competitive patterns, or
  vice versa. Transitional arrangements are accommodative of competing,
  parochial interests but have not fully linked parochial with broader,
  general interests. Sectarian and secular interest groups coexist.

  \(5\) Competitive: There are relatively stable and enduring, secular
  political groups which regularly compete for political influence at
  the national level; ruling groups and coalitions regularly,
  voluntarily transfer central power to competing groups. Competition
  among groups seldom involves coercion or disruption. Small parties or
  political groups may be restricted in the Competitive pattern.

  By combining scores on Regulation of Political Participation (variable
  3.5) and the Competitiveness of Participation (variable 3.6), a
  relatively detailed picture of the extent of political competition and
  opposition emerges.

- pitf:

  A five category indicator of democracy described in Goldstone et
  al 2010. Can be:

  0-Full autocracy (exrec \< 7, parcomp !=0 and parcomp \< 3)

  1-Partial autocracy (exrec \< 7, parcomp = 0 or parcomp \> 2)

  2-Partial democracy with factionalism (exrec \> 6, parcomp = 3)

  3-Partial democracy (exrec \> 6, parcomp = 0 or parcomp = 4 or parcomp
  = 5 but exrec != 8)

  4-Full democracy (exrec = 8, parcomp = 5). See Goldstone et al. 2010
  for full details.

- pitf_binary:

  A simplification of the pitf indicator of democracy. A country is a
  democracy (1) "if its chief executive is chosen in competitive
  elections (EXREC equal to 7 or 8) and political competition is not
  suppressed (PARCOMP equal to 0 or PARCOMP greater than 2)" Otherwise
  it is a non-democracy (0).

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

## References

J. Goldstone, R. Bates, D. Epstein, et al. "A Global Model for
Forecasting Political Instability". In: *American Journal of Political
Science* 54.1 (2010), pp. 190-208. DOI:
[10.1111/j.1540-5907.2009.00426.x](https://dx.doi.org/10.1111/j.1540-5907.2009.00426.x).

S. J. Taylor and J. Ulfelder. "A Measurement Error Model of Dichotomous
Democracy Status". In: *Available at SSRN* (2015). DOI:
[10.2139/ssrn.2726962](https://dx.doi.org/10.2139/ssrn.2726962).

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

Other polity:
[`peps`](https://xmarquez.github.io/democracyData/reference/peps.md)
