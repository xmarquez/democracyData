# Mainwaring, Brinks, and Perez Liñán's democracy measure for Latin America

Trichotomous democracy indicator from S. Mainwaring, D. Brinks, and A.
Pérez-Liñán. "Classifying Political Regimes in Latin America". In:
*Studies in Comparative International Development* 36.1 (2001), pp.
37-65. DOI: [10.1007/bf02687584](https://dx.doi.org/10.1007/bf02687584).
Extended in S. Mainwaring, A. Pérez-Liñán, and D. Brinks. "Political
Regimes in Latin America, 1900-2007 (with Daniel Brinks)". In:
*Democracies and Dictatorships in Latin America: Emergence, Survival,
and Fall*. New York: Cambridge University Press, 2014. Original data
description archived at
<https://web.archive.org/web/20120119050029/https://kellogg.nd.edu/scottmainwaring/Political_Regimes.pdf>.

## Usage

``` r
mainwaring

mainwaring_pmm
```

## Format

An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with
2156 rows and 14 columns.

An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with 835
rows and 7 columns.

## Source

S. Mainwaring, A. Pérez-Liñán, and D. Brinks. "Political Regimes in
Latin America, 1900-2007 (with Daniel Brinks)". In: *Democracies and
Dictatorships in Latin America: Emergence, Survival, and Fall*. New
York: Cambridge University Press, 2014.

D. Pemstein, S. A. Meserve, and J. Melton. *Replication Data for:
Democratic Compromise: A Latent Variable Analysis of Ten Measures of
Regime Type*. 2013. DOI:
[10.7910/DVN/WWYOHU](https://dx.doi.org/10.7910/DVN/WWYOHU).

## Variables

- mainwaring_country:

  The original country name.

- year:

  The calendar year.

- mainwaring:

  Trichotomous numerical democracy indicator from S. Mainwaring, D.
  Brinks, and A. Pérez-Liñán. "Classifying Political Regimes in Latin
  America". In: *Studies in Comparative International Development* 36.1
  (2001), pp. 37-65. DOI: 10.1007/bf02687584. S. Mainwaring, A.
  Pérez-Liñán, and D. Brinks. "Political Regimes in Latin America,
  1900-2007 (with Daniel Brinks)". In: *Democracies and Dictatorships in
  Latin America: Emergence, Survival, and Fall*. New York: Cambridge
  University Press, 2014. 0 = non-democracy, 0.5 = hybrid, 1 =
  democracy.

- Regime:

  Trichotomous democracy indicator. From the published article:

  When governments commit no violation of any of the four criteria
  (elections, franchise, civil liberties, and civilian power), they are
  coded as democratic. They rank as authoritarian if they present one or
  more major violations or as semi-democratic if they display only
  partial failures in one or more categories.

- Elections:

  Measure of whether the principle of free and fair elections is
  violated. MV = major violation, NV = No violation, PV = partial
  violation. From the published article:

  A major violation of this democratic principle occurs if:

  - the head of government or the legislature is not elected.

  - the government uses its resources (patronage, repression, or a
    combination of both) to ensure electoral victory–i.e., there are
    systematic complaints about fraud or repression, and there is
    virtual certainty about the outcome of presidential elections (e.g.,
    Mexico 1945-88, Argentina 1952-55, E1 Salvador 1952-63, Paraguay
    1960-89).

  - through fraud, manipulation, or outright repression, the government
    makes it impossible for a wide gamut of parties to compete (or if
    they do compete, to take office).

  A partial violation occurs if:

  - there are systematic complaints of rigged elections and/or
    harassment of the opposition but there is still uncertainty about
    electoral outcomes and the government fails to capture large
    majorities in the legislature; or the military vetoed a few
    "unacceptable" but important presidential candidates (e.g.,
    Argentina 1958-66); fraud affected but did not thoroughly skew
    electoral results; or the elections were conducted under
    substantially unequal playing rules (e.g., Nicaragua in 1984 because
    the Sandinistas dominated the media and pressured opposition groups,
    E1 Salvador in the 1980s because the left faced massive repression).

- Franchise:

  Measure of whether the principle of inclusive franchise is violated.
  MV = major violation, NV = No violation, PV = partial violation. NA if
  the electoral principle is coded MV. From the published article:

  A major violation of this democratic principle occurs if a large part
  of the adult population is disenfranchised on ethnic, class, gender,
  or educational grounds in ways that:

  - likely prevent very different electoral outcomes (or so is widely
    believed); or

  - are unusually exclusionary for that historical period; or

  - trigger mass social protests.

  A partial violation occurs if disenfranchisement of some social groups
  occurs in ways that are not likely to significantly shape electoral
  outcomes.

- Civil.Liberties:

  Measure of whether the civil liberties are violated. MV = major
  violation, NV = No violation, PV = partial violation. NA if the
  electoral principle is coded MV. From the published article;

  A major violation of democratic principles occurs if:

  - gross human rights violations or censorship against opposition media
    occur systematically; or

  - political parties are not free to organize–i.e., most major parties
    are banned, just a single party is allowed to exist, or a few
    parties are tightly controlled by the government (e.g., Panama
    1968-1980, Paraguay 1947-59, Brazil 1965-79).

  A partial violation occurs if:

  - violations of human rights are less widespread but still affect the
    opposition's capacity to organize in some geographic areas or some
    social sectors; or

  - there is intermittent censorship of the media or regular prohibition
    of one major party or candidate.

- Civilian.Power:

  Measure of whether the elected rulers enjoy real governing capacity
  (e.g., are not overruled by the military). MV = major violation, NV =
  No violation, PV = partial violation. NA if the electoral principle is
  coded MV. From the published article:

  A major violation of this democratic principle occurs if:

  - military leaders or the military as an institution openly dominate
    major policy areas not strictly related to the armed forces; or

  - if the elected head of government is a puppet, such that the
    electoral process does not really determine who governs.

  A partial violation occurs if military leaders or the military as an
  institution are able to veto important policies in a few areas not
  related to the armed forces (e.g., Ecuador 1961-62).

- From:

  First year of the regime.

- To:

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

The mainwaring_pmm version of this data is taken from D. Pemstein, S. A.
Meserve, and J. Melton. *Replication Data for: Democratic Compromise: A
Latent Variable Analysis of Ten Measures of Regime Type*. 2013. DOI:
[10.7910/DVN/WWYOHU](https://dx.doi.org/10.7910/DVN/WWYOHU). It only
contains a numeric version of the Mainwaring Regime indicator, ranging
from -1 (Authoritarian) to 0 (Semidemocracy) to 1 (Democracy). The
original dataset is found in mainwaring. PMM's replication data is
actually missing a fair number of the data points in the original
dataset, but the original dataset is not missing any of their data
points, and there are no differences between the data points wherever
both the original and the replication data have values. It is included
here for completeness.

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

Other PMM replication data:
[`arat_pmm`](https://xmarquez.github.io/democracyData/reference/arat_pmm.md),
[`blm`](https://xmarquez.github.io/democracyData/reference/blm.md),
[`bollen_pmm`](https://xmarquez.github.io/democracyData/reference/bollen_pmm.md),
[`fh_pmm`](https://xmarquez.github.io/democracyData/reference/fh_pmm.md),
[`hadenius_pmm`](https://xmarquez.github.io/democracyData/reference/hadenius_pmm.md),
[`munck_pmm`](https://xmarquez.github.io/democracyData/reference/munck_pmm.md),
[`pacl`](https://xmarquez.github.io/democracyData/reference/pacl.md),
[`polity_pmm`](https://xmarquez.github.io/democracyData/reference/polity_pmm.md),
[`prc_gasiorowski`](https://xmarquez.github.io/democracyData/reference/prc_gasiorowski.md)

Other regional democracy indexes:
[`blm`](https://xmarquez.github.io/democracyData/reference/blm.md)

Other trichotomous democracy indexes:
[`blm`](https://xmarquez.github.io/democracyData/reference/blm.md),
[`kailitz`](https://xmarquez.github.io/democracyData/reference/kailitz.md),
[`prc_gasiorowski`](https://xmarquez.github.io/democracyData/reference/prc_gasiorowski.md),
[`utip`](https://xmarquez.github.io/democracyData/reference/utip.md)
