# Indicators of Contestation and Inclusiveness by Michael Coppedge, Angel Alvarez, and Claudia Maldonado

From the codebook at
<https://web.archive.org/web/20160309180905/http://www3.nd.edu/~mcoppedg/crd/datacrd.htm>:
This dataset contains several versions of two indicators that measure
Robert Dahl's two dimensions of polyarchy: contestation and
inclusiveness. For complete documentation of the analysis that
identifies these two dimensions, see the published article: M. Coppedge,
A. Alvarez, and C. Maldonado. "Two Persistent Dimensions of Democracy:
Contestation and Inclusiveness". In: *The journal of politics* 70.03
(2008), pp. 632-647. DOI:
[10.1017/S0022381608080663](https://dx.doi.org/10.1017/S0022381608080663).

## Usage

``` r
polyarchy_dimensions
```

## Format

An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with
7563 rows and 32 columns.

## Source

M. Coppedge, A. Alvarez, and C. Maldonado. "Two Persistent Dimensions of
Democracy: Contestation and Inclusiveness". In: *The journal of
politics* 70.03 (2008), pp. 632-647. DOI:
[10.1017/S0022381608080663](https://dx.doi.org/10.1017/S0022381608080663).

## Introduction

These variables are the first (and usually, only) two principal
component scores obtained when analyzing a dozen or more of the most
commonly used indicators of democracy. A principal components analysis
(PCA) was done separately for each year, 1950-2000. The mix of variables
changed over time, but the mix was fixed in three partially overlapping
intervals: 1950-1971, 1972-1988, and 1982-2000.

In order to make these scores comparable over time, they were
standardized. Because these estimates are constrained to have a mean of
zero and a standard deviation of one, they do not reflect the changes in
the mean levels of contestation or inclusiveness, or their dispersion,
that occur during waves of democratization or authoritarianism. We
therefore calculated versions of our component scores that do reflect
these trends. First we repeated the PCA using each of the samples
(1950-1971, 1972-1988, and 1981-2000) with all the years in each sample
pooled together. We then generated the component scores for each year
within each of the three samples, based on these pooled estimates. Then
we calculated the mean and standard deviation of these pooled-sample
contestation and inclusiveness components for each year. Finally, we
adjusted the original component scores so that their annual means and
standard deviations would be the same as those of the pooled-sample
estimates. Therefore, the new "standardized" component scores are
defined as

CONTEST' = sigma(CONTEST)t \* CONTEST + mu(CONTEST)t

INCLUS' = sigma(INCLUS)t \* INCLUS + mu(INCLUS)t

where CONTEST and INCLUS are the component scores estimated with annual
samples, and sigma(CONTEST)t and mu(CONTEST)t are the standard deviation
and mean in year t of the contestation component scores estimated with
the pooled sample; the same goes for INCLUS'. The 1972-1988 pooled
sample is used as a baseline. Standardized scores for 1989-2000 are
chained forward from 1988 based on changes in the later sample, or the
average of changes in both samples, where they overlap.

This adjustment yields mean scores that reflect the wave of
authoritarianism of the 1960s and 1970s and the third wave of
democratization:

It also shows homogenization of levels of inclusiveness after 1970. This
procedure for adjusting the component scores yields data with greater
face validity. Nevertheless, the adjustments are not very large: the
correlations between the original and standardized component scores are
.97 for Contestation and .96 for Inclusiveness.

## Variables

polyarchy_dimensions_cname: Country Name.

abbr: country abbreviation.

year: Year.

yr: abbreviated year.

CONTEST: Contestation (pooled years). This series combines the component
scores from all three samples. For the years of overlap (1982-1988), the
1972-1988 estimates are used.

INCLUS: Inclusiveness (pooled years). This series combines the component
scores from all three samples. For the years of overlap (1982-1988), the
1972-1988 estimates are used.

CONTESTstd: Contestation standardized to be comparable across years. See
explanation on introduction.

INCLUSstd: Inclusiveness standardized to be comparable across years. See
explanation on introduction.

ContestationA: Contestation (1950-71 estimate). These are estimates from
each annual cross-section, pooled.

INCLUSA: Inclusiveness (1950-71 estimate). These are estimates from each
annual cross-section, pooled.

CONTESTB: Contestation (1972-88 estimates). These are estimates from
each annual cross-section, pooled.

INCLUSB: Inclusiveness (1972-88 estimates). These are estimates from
each annual cross-section, pooled.

CONTESTC: Contestation (1990-2000 estimates). These are estimates from
each annual cross-section, pooled.

INCLUSC: Inclusiveness (1990-2000 estimates). These are estimates from
each annual cross-section, pooled.

CRSUFF: Coppedge-Reinicke (1990) suffrage. 1 Full suffrage 2 Suffrage
with minor restrictions 3 Suffrage with major restrictions 4 No suffrage

FAIRELT: Coppedge-Reinicke (1990) Fair elections. 1 Elections without
significant or routine fraud or coercion. 2 Elections with significant
fraud or coercion whether or not it changes the outcome of the election.
3 No meaningful elections: i.e., elections without choice of candidates
or parties, or no elections at all.

FREEORG: Coppedge-Reinicke (1990) Freedom of Organization. 1 Some trade
union or interest groups may be harassed or banned but there are no
restrictions on purely political organization. Permits may be required
but are not used to limit opposition activities. 2 Some political
parties are banned and trade unions or interest groups are harassed or
banned, but membership in some alternatives to official organizations is
permitted. Permits may be required and are used to limit opposition
activities.3 The only relatively independent organizations that are
allowed to exist are nonpolitical. 4 No independent organizations are
allowed. All organizations are banned or controlled by the government or
the party.

FREXP: Coppedge-Reinicke (1990) Freedom of Expression 1 Citizens express
their views on all topics without fear of punishment. 2 Dissent is
discouraged, whether by informal pressure or by systematic censorship,
but control is incomplete. The extent of control may range from
selective punishment of dissidents on a limited number of issues to a
situation in which only determined critics manage to make themselves
heard, yet they sometimes can sway public opinion. There is some freedom
of private discussion. 3 All open dissent is forbidden and effectively
suppressed, though a few citizens may express dissent publicly in covert
ways. Citizens are wary of criticizing the government even privately.

ALTINF: Coppedge-Reinicke (1990) Alternative Sources of Information 1
Alternative sources of information exist and are protected by law. If
there is significant government ownership of the media, they are
effectively controlled by truly independent or multi-party bodies. 2
Alternative sources of information are widely available but government
versions are presented in preferential fashion. This may be the result
of partiality in and greater availability of government-controlled
media; selective closure, punishment, harassment, or censorship of
dissident reporters, publishers, or broadcasters; or mild
self-censorship resulting from any of these. 3 The government or ruling
party dominates the diffusion of information to such a degree that
alternative sources exist only for nonpolitical issues, for short
periods of time, or for small segments of the population. The media are
either mostly controlled directly by the government or party or
restricted by routine prior censorship, near-certain punishment of
dissident reporters, publishers, and broadcasters, or pervasive
self-censorship. Foreign media or the Internet may be available to a
small segment of the population without restrictions. 4 There is no
public alternative to official information. All sources of information
are official organs or completely subservient private sources. The media
are considered instruments of indoctrination. Foreign publications and
the Internet are usually unavailable or censored, and foreign broadcasts
may be jammed.

POLY: Coppedge-Reinicke (1990) Polyarchy Scale. The sum of FAIRELT,
FREORG, FREXP, and ALTINF minus 4.

ccode: Country Code Numeric

ccodecow: Country Code (from Correlates of War)

ccodealp: 3-letter Country Code (from Alvarez, Limongi, and Przeworski)

ccodewb: Country Code (from World Bank)

f1mean: mean contestation score for this year in pooled analysis

f2mean: mean inclusiveness score for this year in pooled analysis

f1sd: mean std dev of contestation for this year in pooled analysis

f2sd: mean std dev of inclusiveness for this year in pooled analysis

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

Other polyarchy:
[`polyarchy`](https://xmarquez.github.io/democracyData/reference/polyarchy.md)

Other latent variable indexes of democracy:
[`extended_uds`](https://xmarquez.github.io/democracyData/reference/extended_uds.md),
[`uds_2014`](https://xmarquez.github.io/democracyData/reference/uds_2014.md)

Other continuous indexes of democracy:
[`peps`](https://xmarquez.github.io/democracyData/reference/peps.md)
