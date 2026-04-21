# The Polyarchy Scale and the Contestation Scale

M. Coppedge and W. H. Reinicke. "Measuring Polyarchy". In: *Studies in
Comparative International Development* 25.1 (1990), pp. 51-72. Data
available at
<https://web.archive.org/web/20160309180905/http://www3.nd.edu/~mcoppedg/crd/datacrd.htm>.
The codebook below is copied from that website.

## Usage

``` r
polyarchy

polyarchy_pmm
```

## Format

An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with 363
rows and 14 columns.

An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with 353
rows and 7 columns.

## Source

M. Coppedge and W. H. Reinicke. "Measuring Polyarchy". In: *Studies in
Comparative International Development* 25.1 (1990), pp. 51-72.

## About the Coding and the Scales

The Polyarchy Scale and the Contestation Scale are quasi-Guttman scales
using polytomous items.

The Contestation Scale is a less precise but more reliable version of
the Polyarchy Scale.

For that scale, there were two coders–Coppedge and Reinicke. A
reliability check was later performed by Anna Papavlachopoulou.
Beginning in 2003, Coppedge had the undergraduate students in his
quantitative methods course replicate the coding for all countries as of
July 1, 2000.

In 2003, 11 students coded 60 randomly-selected countries. In 2004, 15
students coded 85 countries. In 2005, 15 students coded the remaining 47
countries (and 3 countries repeated from 2003). Each year, five
countries were coded by every student and these initial codes discussed,
and sometimes revised, before coding the rest.

In 2003 and 2004, the rest of the countries were each coded by 3
students each. In 2005, the rest of the countries were coded by 5
students each. Because some of the ratings were based on weak agreement,
in 2006 nine graduate students were asked to code them, and others from
2000, independently. Their ratings have been pooled with those of the
undergraduate coders and the scalogram analysis repeated. This resulted
in modified ratings for 21 countries (11 percent): 5 becoming less
polyarchic, 16 more polyarchic.

The data posted here are the revised data. The earlier ratings are
available on request. For the 1985 data, multiple sources of information
were used. For the 2000 data, all coders consulted only the State
Department's Country Reports on Human Rights Practices for 2001 as their
source of information. This information is available on line at
<http://www.state.gov/g/drl/rls/hrrpt/2001/>.

Every year, 82-86 percent of their ratings were in agreement. This is
about the same level of reliability that Reinicke and Coppedge reported
in 1990. For the data presented here, however, Coppedge selected the
modal rating for each country on each variable and repeated the
scalogram analysis.

Because some different scale types were found in 1985 and 2000, Coppedge
decided to combine categories 4 and 5, and 8 and 9, in order to produce
a more reliable scale, the Contestation scale. This scale ranges from 9
(greatest contestation) to 1 (least contestation). To convert the old
scale into the new one, if old\<=5, new=9-old; if 5\<old\<9, new=10-old;
if old\>=9, new=11-old.

Note that the new coding corrects the confusing convention of the
Polyarchy Scale of having the lowest score represent the most democratic
level. Categories are combined in the aggregated scale only, not in the
component variables. This increases reliability while minimizing the
loss of information. There is still a one-to-one correspondence between
scale scores and the brief descriptions of the scale types, although
types 2 and 5 build in a greater variety of ways to attain those
scores.The coefficient of reproducibility for the 2000 Contestation
scale (allowing for combined ranks) is .950. Coefficient alpha for its
four variables is .927.

## Variables

Ratings are based on actual practice rather than formal constitutional
provisions.

When there is regional diversity in the regime, pay attention only to
the largest, most populous, and most politically important region(s) of
the country.

Read the coding criteria carefully and refer to them often to make sure
you are applying them faithfully.

- polyarchy_country:

  The country name in the original dataset. Note "Western Sahara" has
  been changed to "Morocco (Western Sahara)"

- polyarchy_code:

  The alphanumeric country code in the original dataset.

- altinf:

  Media pluralism.

  1 Alternative sources of information exist and are protected by law.
  If there is significant government ownership of the media, they are
  effectively controlled by truly independent or multi-party bodies.

  2 Alternative sources of information are widely available but
  government versions are presented in preferential fashion. This may be
  the result of partiality in and greater availability of
  government-controlled media; selective closure, punishment,
  harassment, or censorship of dissident reporters, publishers, or
  broadcasters; or mild self-censorship resulting from any of these.

  3 The government or ruling party dominates the diffusion of
  information to such a degree that alternative sources exist only for
  nonpolitical issues, for short periods of time, or for small segments
  of the population. The media are either mostly controlled directly by
  the government or party or restricted by routine prior censorship,
  near-certain punishment of dissident reporters, publishers, and
  broadcasters, or pervasive self-censorship. Foreign media or the
  Internet may be available to a small segment of the population without
  restrictions.

  4 There is no public alternative to official information. All sources
  of information are official organs or completely subservient private
  sources. The media are considered instruments of indoctrination.
  Foreign publications and the Internet are usually unavailable or
  censored, and foreign broadcasts may be jammed.

- fairelt:

  Fair elections.

  1 The most important effective heads of the government are elected,
  and national elections take place without significant or routine fraud
  or coercion, or with incidents of fraud or coercion that are likely to
  be punished.

  2 The most important effective heads of the government are elected,
  but national elections have significant fraud or coercion that goes
  unpunished, such as widespread voter intimidation or assassination of
  candidates, whether it changes the winner of the election or merely
  alters the margin of victory.

  3 No meaningful elections: i.e., elections without choice of
  candidates or parties, or no elections at all.

- freorg:

  Freedom of organization.

  1 Some trade union or interest groups may be harassed or banned but
  there are no restrictions on purely political organization for parties
  that have not previously committed mass murder. Permits may be
  required but are not used to limit opposition activities.

  2 Some political parties that have not committed mass murder are
  banned and trade unions or interest groups are harassed or banned, but
  membership in some alternatives to official organizations is
  permitted. Permits may be required and are used to limit opposition
  activities.

  3 The only relatively independent organizations that are allowed to
  exist are nonpolitical.

  4 No independent organizations are allowed. All organizations are
  banned or controlled by the government or the party.

- frexp:

  Freedom of expression.

  1 Citizens express their views on all topics without fear of
  punishment.

  2 Dissent is discouraged, whether by informal pressure or by
  systematic censorship, but control is incomplete. The extent of
  control may range from selective punishment of dissidents on a limited
  number of issues to a situation in which only determined critics
  manage to make themselves heard, yet they sometimes can sway public
  opinion. There is some freedom of private discussion.

  3 All open dissent is forbidden and effectively suppressed, though a
  few citizens may express dissent publicly in covert ways. Citizens are
  wary of criticizing the government even privately.

- poly:

  Polyarchy scale. Superceded by Contestation scale.

- cont:

  Contestation scale.

  9 pattern = 1111 Meaningful fair elections are held, there is full
  freedom for political organization and expression, and there is no
  preferential presentation of official views in the media.

  8 pattern = 1112 Meaningful fair elections are held and there is full
  freedom for political organization and expression, but there is
  preferential presentation of official views in the media.

  7 pattern = 1122 Meaningful fair elections are held and there is full
  freedom for political organization, but some public dissent is
  suppressed and there is preferential presentation of official views in
  the media.

  6 pattern = 1222 Meaningful fair elections are held, but some
  independent political organizations are banned, some public dissent is
  suppressed, and there is preferential presentation of official views
  in the media.

  5 pattern = 2222 Elections are marred by fraud or coercion, some
  independent political organizations are banned, some public dissent is
  suppressed, and there is preferential presentation of official views
  in the media.

  4 patterns = 3222, 2223, 3223, or 3322 Like score 5 except that there
  is less contestation in one or two of the following respects: no
  meaningful elections are held, only nonpolitical organizations are
  allowed to be independent, or alternatives to the official media are
  very limited.

  3 pattern = 3323 No meaningful elections are held, only nonpolitical
  organizations are allowed to be independent, some public dissent is
  suppressed, and alternatives to the official media are very limited.

  2 patterns = 3423, 3333, 3424, 3433, or 3334 Like score 3 except that
  there is less contestation in one or two of the following respects:
  all organizations are banned or controlled by the government or
  official party, all public dissent is suppressed, or there is no
  public alternative to official information.

  1 pattern= 3434 No meaningful elections are held, all organizations
  are banned or controlled by the government or official party, all
  public dissent is suppressed, and there is no public alternative to
  official information.

- suff:

  Extent of suffrage (1985 only).

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

## Note

The `polyarchy_pmm` version of this data is taken from D. Pemstein, S.
A. Meserve, and J. Melton. *Replication Data for: Democratic Compromise:
A Latent Variable Analysis of Ten Measures of Regime Type*. 2013. DOI:
[10.7910/DVN/WWYOHU](https://dx.doi.org/10.7910/DVN/WWYOHU). The
original dataset is found in polyarchy. It only contains a reversed
version of the `poly` variable in the original polyarchy dataset (higher
values being more democratic). 22 country-years differ between PMM's
replication data and the original Polyarchy dataset (Coppedge and
Reinicke 1990), and four are missing. These seem to be due to simple
transcription errors:

    polyarchy |>
       dplyr::full_join(polyarchy_pmm) |>
       dplyr::mutate(poly_reversed = (10 - poly)) |>
       dplyr::filter(pmm_polyarchy != poly_reversed | (is.na(pmm_polyarchy) & !is.na(poly_reversed))) |>
       dplyr::select(extended_country_name, year, poly_reversed, pmm_polyarchy) |>
       print(n = 32)
    #> Joining with `by = join_by(year, extended_country_name, GWn, cown,
    #> in_GW_system)`
    #> # A tibble: 26 x 4
    #>    extended_country_name    year poly_reversed pmm_polyarchy
    #>    <chr>                   <dbl>         <dbl>         <int>
    #>  1 Algeria                  2000             6             7
    #>  2 Myanmar (Burma)          2000             1             0
    #>  3 Burundi                  2000             5             4
    #>  4 Brunei                   1985             3            NA
    #>  5 Colombia                 2000             8             7
    #>  6 Egypt                    2000             4             6
    #>  7 Eritrea                  2000             3             2
    #>  8 East Timor               2000            10            NA
    #>  9 Fiji                     2000             5             4
    #> 10 German Federal Republic  2000            10             9
    #> 11 Iran (Persia)            2000             5             3
    #> 12 Mongolia                 2000             9             8
    #> 13 Oman                     2000             3             2
    #> 14 Panama                   2000            10             9
    #> 15 Poland                   2000            10             8
    #> 16 Russia (Soviet Union)    2000             6             8
    #> 17 Western Sahara           2000             0            NA
    #> 18 San Marino               1985            10            NA
    #> 19 Senegal                  2000             9             7
    #> 20 Solomon Islands          2000             9             7
    #> 21 Tonga                    2000             8             7
    #> 22 Uganda                   2000             6             7
    #> 23 Ukraine                  2000             6             9
    #> 24 Uruguay                  2000            10             9
    #> 25 Venezuela                2000            10             8
    #> 26 Zimbabwe (Rhodesia)      2000             6             7

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

Other polyarchy:
[`polyarchy_dimensions`](https://xmarquez.github.io/democracyData/reference/polyarchy_dimensions.md)
