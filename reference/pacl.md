# The Democracy and Dictatorship Dataset (DD/PACL/ACLP/CGV)

This dataset (aka PACL, ACLP or CGV) is described in J. A. Cheibub, J.
Gandhi, and J. R. Vreeland. "Democracy and Dictatorship Revisited". In:
*Public Choice* 143.1-2 (2009), pp. 67-101. DOI:
[10.1007/s11127-009-9491-2](https://dx.doi.org/10.1007/s11127-009-9491-2).
The full data and codebook can be downloaded at
<https://sites.google.com/site/joseantoniocheibub/datasets/dd>. The
documentation below is directly copied from the codebook.

## Usage

``` r
pacl

aclp()

dd()

cgv()

pacl_pmm
```

## Format

An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with
9159 rows and 82 columns.

An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with
9067 rows and 7 columns.

## Source

J. A. Cheibub, J. Gandhi, and J. R. Vreeland. "Democracy and
Dictatorship Revisited". In: *Public Choice* 143.1-2 (2009), pp. 67-101.
DOI:
[10.1007/s11127-009-9491-2](https://dx.doi.org/10.1007/s11127-009-9491-2).
The full data and codebook can be downloaded at
<https://sites.google.com/site/joseantoniocheibub/datasets/dd>.

## Details

- order:

  Sequential numbering of rows (1 through 9159)

- pacl_country:

  String country identifier.

- year:

  Calendar year

- aclpcode:

  Country identifier (numeric) used in previous versions of the regime
  classification contained in this dataset (the so-called ACLP, PPD,
  etc., databases). See Alvarez, Cheibub, Limongi, Przeworski 1996,
  Przeworski, Alvarez, Cheibub and Limongi 2000, and Cheibub 2007.

- pacl_cowcode:

  Correlates of war (numeric) country identifier.

- cowcode2:

  Modified correlates of war (numeric) country identifier. See
  explanation under "Organizing the World."

- ccdcodelet:

  Three letter country code used by the Cline Center for Democracy,
  University of Illinois at Urbana-Champaign.

- ccdcodenum:

  Numeric country code used by the Cline Center for Democracy,
  University of Illinois at Urbana-Champaign.

- aclpyear:

  Concatenation of aclpcode and year.

- cowcode2year:

  Concatenation of cowcode2 and year.

- cowcodeyear:

  Concatenation of cowcode and year.

- chgterr:

  Dummy variable coded 1 for all the years of a country that experienced
  significant gains or losses of territory, 0 otherwise.

- ychgterr:

  Dummy variable coded 1 for the year in which a country gained or lost
  significant parts of its territory, 0 otherwise.

- flagc_cowcode2:

  Dummy variable coded 1 for the first year a country (defined by
  cowcode2) is observed in the dataset, 0 otherwise.

- flage_cowcode2:

  Dummy variable coded 1 for the last year a country (defined by
  cowcode2) is observed in the dataset, 0 otherwise.

- entry:

  Year the country is first observed in the dataset (repeated for all
  years a country is in the dataset).

- exity:

  Year the country is last observed in the dataset (repeated for all
  years a country is in the dataset).

- cid:

  From the introduction to the codebook: We do not assign new country
  codes to countries that experienced changes in their territories but
  which remained in existence after the change. These include, for
  instance, Pakistan (with the creation of Bangladesh in 1971), Cyprus
  (with the "creation" of Turkish Cyprus in 1983, a country not
  recognized as independent

  - and hence not in this dataset - but over which the "remaining"
    Cyprus does not govern), or Ethiopia (with the creation of Eritrea
    in 1993). The variable cid provides a country coding that treats
    these cases as separate countries.

- wdicode:

  World Development Indicators (string) country identifier.

- imf_code:

  International Monetary Fund (numeric) country identifier.

- politycode:

  POLITY IV (numeric) country identifier.

- bankscode:

  Banks (numeric) country identifier.

- dpicode:

  DPI (string) country identifier.

- uncode:

  United Nations (numeric) country identifier.

- un_region:

  United Nations (numeric) geographic region identifier.

- un_region_name:

  United Nations (string) geographic region identifier.

- un_continent:

  United Nations (string) continent identifier.

- un_continent_name:

  United Nations (numeric) continent identifier.

- aclp_region:

  Alvarez, Cheibub, Limongi and Przeworski (1996, 2000) (numeric) region
  identifier.

- bornyear:

  Year the country is first identified as such.

- endyear:

  Year the country stops being identified as such

- exselec:

  Mode of effective executive selection (from Banks to 2002, painted
  yellow in the excel file when modified; own coding from 2003 on): 1.
  Direct election (election of the effective executive by popular vote
  or the election of committed delegates for the purpose of executive
  selection) 2. Indirect election (selection of the effective executive
  by an elected assembly or by an elected but uncommitted electoral
  college) 3. Nonelective (any means of executive selection not
  involving a direct or indirect mandate from an electorate)

- legselec:

  Mode of legislative selection (from Banks to 2002, painted yellow in
  the excel file when modified; own coding from 2003 on): 0. No
  legislature exists (includes cases in which there is a constituent
  assembly without ordinary legislative powers). 1. Non-elective
  legislature (examples include the selection of legislators by the
  effective executive, or on the basis of heredity or ascription) 2.
  Elective (legislators, or members of the lower house in a bicameral
  system, are selected by means of either direct or indirect popular
  election)

- closed:

  Status of legislature. 0. Legislature is closed. 1. Legislature is
  appointed. 2. Legislature is elected

- dejure:

  Legal status of parties0. All parties legally banned1. Legally single
  party state2. Multiple parties legally allowed

- defacto:

  Existence of parties. 0 = No parties. 1 = One party. 2 = Multiple
  parties. N.B. We collected separate variables for dejure and defacto
  status of parties because legal status alone is not always a good
  reflection of empirical reality. Both dejure and defacto refer to
  existence of parties in general, not whether they have seats in the
  legislature. For this information see lparty.

- defacto2:

  Existence of parties outside of regime front. 0. No parties1. One
  party or multiple parties, but they belong to regime front. 2.
  Multiple parties

- lparty:

  Parties within the legislature. 0. Either no legislature or all
  members of the legislature are nonpartisan 1. Legislature with only
  members from the regime party2. Legislature with multiple parties

- incumb:

  Consolidation of incumbent advantage. Dummy variable coded 1 if: (1)
  the regime year qualifies as a democratic regime and (2) sometime
  during its current tenure in office the incumbents (person, party,
  military hierarchy) unconstitutionally closed the lower houseof the
  national legislature and rewrote the rules in their favor. The
  rationale for this variable is discussed in Przeworski et al.
  (2000:20-22). We expand the action that characterizes consolidation of
  incumbent advantage to include cases in which the incumbent was first
  elected in multiparty elections but, for whatever reasons, the
  incumbent's term was extended and subsequent elections were postponed
  (e.g., Angola as of December 31, 2008).

- type2:

  Dummy variable coded 1 for the cases excluded from the set of
  democracies uniquely because they violate the "alternation" rule; 0
  otherwise. These are the cases that would be classified as democratic
  if the only criteria for democracy were multiparty (direct orindirect)
  executive and legislative elections. This, however, as discussed in
  Przeworski etal (2000:23-29) and in Cheibub, Vreeland and Gandhi
  (2009), is not sufficient to identify democracies. In the set of
  regimes that hold multiparty elections, some do it only because they
  know the opposition cannot win and others because the opposition would
  not be allowed to assume office if it won. The difficulty is that in
  many cases there is no historical evidence to allow the observer to
  distinguish these cases. Thus, it is possible that we might identify
  as a democracy a case that is a real dictatorship, or as a
  dictatorship a case that is a real democracy. The alternation rule, as
  well as the present variable, identifies the cases for which we do not
  have sufficient information to decide,according to our rules, whether
  the country is a democracy or not. Note on the type2 name: A type I
  error is a false positive and a type II error is a false negative. In
  the original project for which this variable was created,dictatorships
  were coded 1 (positive) and democracies 0 (negative). The variable was
  named to indicate that we had made a decision to avoid type II errors
  by coding as dictatorships cases that might have been a democracy
  (thus committing type I errors). In the current context, we think of
  democracy as the positive outcome and dictatorship as the negative
  outcome. We should, therefore, rename the variable type1 error since
  we decided to coded possible democracies (real 1s) as dictatorships
  (real 0s). In the end, it does not matter. What is important is that
  this variable can be used to easily reclassify regimes by either
  considering all cases coded as 1 in type2 as democracies or attempting
  to discriminate which ones are democracies and which ones are
  dictatorships.

- collect:

  Dummy variable coded 1 when the effective head is characterized by
  collective leadership, 0 otherwise.

- nheads:

  Number of changes in the nominal head of government in each year.

- nmil:

  Dummy variable coded 1 if the nominal head is or ever was a member of
  the military by profession, 0 if civilian. Note that we code retired
  members of the military as NMIL=1since the shedding of a uniform is
  not necessarily enough to indicate the civilian character of a leader.
  Also note that we do not consider rulers who come to power as head of
  guerilla movements as military. Source: Compiled from Beinen and Van
  deWalle (1991), Beck et al. (2000), Banks (various years), Zarate
  (2001), Lentz (1994), and various internet sources as marked.

- nhead:

  Name of the nominal head of government. Source: Compiled from Banks
  (various years), Beinen and Van de Walle (1991), Rulers website,
  Zarate (2001), and Lentz (1994).

- npost:

  Political title of the nominal head of government. Source: Compiled
  from Banks (various years), Beinen and Van de Walle (1991), Rulers
  website, Zarate (2001), and Lentz (1994).

- ndate:

  Date of entrance into power of nominal head of government. Source:
  Compiled fromBanks (various years), Beinen and Van de Walle (1991),
  Rulers website, Zarate (2001),and Lentz (1994).

- eheads:

  Number of changes in the effective head of government in each year

- ageeh:

  Age of the effective head's spell in office. There is no left
  censoring.

- emil:

  Dummy variable coded 1 if the effective head is or ever was a member
  of the military by profession, 0 if civilian. Note that we code
  retired members of the military as EMIL=1since the shedding of a
  uniform is not necessarily enough to indicate the civilian character
  of a leader. Also note that we do not consider rulers who come to
  power as head of guerilla movements as military. Source: Compiled from
  Beinen and Van deWalle (1991), Beck et al. (2000), Banks (various
  years), Zarate (2001), Lentz (1994), and various internet sources as
  marked.

- royal:

  Dummy variable coded 1 if the effective head is of hereditary royalty,
  0 otherwise. To qualify as royal, the effective head must meet 2
  qualifications: 1) rule under a title such as kings, emirs, sultans,
  and 2) have been preceded or succeeded by a relative. Part 1) means
  that Khama in Botswana, Mutesa in Uganda, Souvanna Phouma in Laos,
  Mohammed Daud in Afghanistan, and Sihanouk in Cambodia do not qualify
  as monarchs because they abdicated their places in the royal line to
  rule as heads of republics. Part 2) means that self-proclaimed royalty
  such as Bokassa in the Central African Republic are not monarchs.
  Source: Banks (various years), Lentz (1994).

- headdiff:

  Dummy variable coded 1 if the effective and nominal heads are
  different people, 0 otherwise. Source: Created from NHEAD and EHEAD.

- ehead:

  Name of the effective head of government.Effective heads are: 1)
  presidents in presidential democracies; 2) prime ministers in
  parliamentary and mixed democracies, except in the cases of Djohar in
  Comoros andPreval in Haiti; 3) general-secretaries of the communist
  party in communist dictatorships, except in the case of Deng Xiaoping
  in China; 4) kings, presidents, and defacto rulers in non-communist
  dictatorships, except in the cases of Singapore, Malaysia,Cambodia,
  Laos, and Myanmar where the effective head is sometimes the prime
  minister; and 5) military or other figure when sources indicate
  nominal head is puppet figure. Included are acting or provisional
  governments, on the assumption that one cannot distinguish between
  cases in which heads attempted to consolidate power and failed from
  cases in which heads did not try to do so. Note that this variable, as
  all other variables with names beginning with "E," codes effective
  rulers as opposed to nominal ones. Source: Compiled from Banks
  (various years), Beinen and Van de Walle (1991),Rulers website, Zarate
  (2001), and Lentz (1994).

- epost:

  Title of the effective head of government.Source: Compiled from Banks
  (various years), Beinen and Van de Walle (1991), da Graca(1985),
  Rulers website, Zarate (2001), and Lentz (1994).

- edate:

  Date of entrance into power of effective head of government.Source:
  Compiled from Banks (various years), Beinen and Van de Walle (1991),
  da Graca(1985), Rulers website, Zarate (2001), and Lentz (1994).

- tenure08:

  Total number of years (up to and including the year 2002) the
  effective head of government is in power. Tenure is invariant during
  the spell of each head.

- comm:

  Dummy variable coded 1 if the ruler is the Communist Party leader, 0
  otherwise.Source: Banks (various years), Lentz (1994).

- ecens08:

  Dummy variable coded 0 for the last year of an effective head's tenure
  due to death or for the last year of effective heads that lasted
  beyond the time of the last observation,usually 1996, and 1 otherwise.
  ecens08 = 0 for rulers who entered as dictators and then legitimately
  won an election and became democrats. Source: Compiled from Banks
  (various years), Beinen and Van de Walle (1991), da Graca (1985),
  Rulers website, Zarate(2001), and Lentz (1994).

- edeath:

  Dummy variable coded 0 for the last year of the effective head's spell
  due to the head's death and 1 otherwise. We do not distinguish between
  natural death, assassination,suicide, and accidents. Source: Banks'
  Political Handbook, Bienen and Van de Walle(1991), Rulers website, and
  Zarate (2001).

- flagh:

  Dummy variable coded 1 for the first year an effective head of
  government is first observed, 0 otherwise.

- democracy:

  Dummy variable coded 1 if the regime qualifies as democratic. The
  conditions for this variable are the following: democracy=1 ifexselec
  \<2 (and)legselec=2 (and) closed=2 (and) dejure=2 (and) defacto=2
  (and) defacto2=2 (and) lparty=2 (and) type2=0 (and) incumb=0.

- assconfid:

  Dummy variable coded 1 if the regime is a democracy and the government
  is subject to assembly confidence, 0 otherwise. Assembly confidence
  refers to collective cabinet responsibility and must include the head
  of government. All cases in which assembly confidence is explicitly
  stated in the constitution are coded 1. Cases in which assembly
  confidence is not explicitly stated in the constitution (i.e.,
  Iceland) or there is no constitution (i.e., England) are included when
  we observed at least one instance of successful government removal via
  a parliamentary vote of no confidence since 1946.

- poppreselec:

  Dummy variable coded 1 if the regime is a democracy and the head of
  state is chosen via popular election. Note that it is possible that a
  country will have no direct presidential elections, poppreselec=0, and
  still be presidential. These are the cases in which presidents are
  indirectly elected (exselec=2)

- regime:

  Six-fold regime classification. 0. Parliamentary democracy 1. Mixed
  (semi-presidential) democracy 2. Presidential democracy 3. Civilian
  dictatorship 4. Military dictatorship 5. Royal dictatorship

- tt:

  Dummy variable coded 1 when there is a transition to or from
  democracy, 0 otherwise.

- ttd:

  Dummy variable coded 1 when there is a transition to democracy, 0
  otherwise.

- tta:

  Dummy variable coded 1 when there is a transition to dictatorship, 0
  otherwise.

- flagdem:

  Dummy variable coded 1 for the first year a country is observed or a
  new regime (as defined by democracy) emerges, 0 otherwise.

- flagreg:

  Dummy variable coded 1 for the first year a country is observed or a
  new regime (as defined by regime) emerges, 0 otherwise.

- agedem:

  Age in years of the current regime as classified by democracy. The
  year in which the regime comes into existence is coded as 1. When
  applicable, ages were extended back as far as 1870.

- agereg:

  Age in years of the current regime as classified by regime. The year
  in which the regime comes into existence is coded as 1. When
  applicable, ages were extended back as far as 1870.

- stra:

  Sum of past transitions to authoritarianism in a country. If a country
  experienced more than one transition to authoritarianism before 1946,
  STRA is coded 1 in 1946.

## Organizing the world

As simple as it may be, there is no one system of numbering the
countries of the world that would allow scholars to easily merge all the
varied datasets into one overall dataset. The difficulty, of course,
comes from the fact that countries come and go and countries sometimes
change significantly their territorial basis while retaining their old
names. For some analyses (e.g., for economic or demographic time
series), we want to mark the fact that Pakistan lost the territory that
became Bangladesh in 1971, or that Ethiopia lost the territory that
became Eritrea in 1993, or that Indonesia lost the territory that became
East Timor in 2002. At the same time, for some other analyses (e.g.,
those related to the occurrence of elections and the changes of heads of
state and government), the fact that some territory was lost is
irrelevant. For the first type of analyses, Pakistan before 1971 should
be treated as a different country as Pakistan after 1971. For the second
type of analyses, Pakistan between 1947 and 2008 should be treated as
one country. The solution we found to be the most flexible is the
following:

1.  We follow the Correlates of War country code, since this seems to be
    the most complete and widely used country identifier available. We
    create four additional country codes (which do not match any COW
    country code):

2.  COW assigns one code to Yugoslavia from 1946 through 2008. We
    consider that Yugoslavia (COW = 345) stopped existing in 1991 and
    assign a new country code to Serbia and Montenegro (1991-2006) and
    to Serbia (2006-)

3.  COW assigns one code to the USSR/Russia from 1946 through 2008. We
    consider that the USSR (COW=365) stopped existing in 1991 and assign
    a new code to Russia (1991-).

4.  COW assigns one number to Vietnam between 1954 and 2008 and another
    to South Vietnam between 1954 and 1975. We assign different codes
    for South Vietnam (1954-1976), North Vietnam (1954-1976) and Vietnam
    (1976- present).

We do not assign new country codes to countries that experienced changes
in their territories but which remained in existence after the change.
These include, for instance, Pakistan (with the creation of Bangladesh
in 1971), Cyprus (with the "creation" of Turkish Cyprus in 1983, a
country not recognized as independent - and hence not in this dataset -
but over which the "remaining" Cyprus does not govern), or Ethiopia
(with the creation of Eritrea in 1993). The variable cid provides a
country coding that treats these cases as separate countries.

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

## Note

The `pacl_pmm` version of this data is taken from D. Pemstein, S. A.
Meserve, and J. Melton. *Replication Data for: Democratic Compromise: A
Latent Variable Analysis of Ten Measures of Regime Type*. 2013. DOI:
10.7910/DVN/WWYOHU. HDL: 1902.1/PMM. It only contains the numeric
version of the variable `democracy` in the original dataset. The
original dataset is found in `pacl`. `pacl_pmm` is missing a few
country-years when compared with `pacl`.

The functions dd, cgv, and aclp are aliases for pacl, provided for
convenience.

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

Other PMM replication data:
[`arat_pmm`](https://xmarquez.github.io/democracyData/reference/arat_pmm.md),
[`blm`](https://xmarquez.github.io/democracyData/reference/blm.md),
[`bollen_pmm`](https://xmarquez.github.io/democracyData/reference/bollen_pmm.md),
[`fh_pmm`](https://xmarquez.github.io/democracyData/reference/fh_pmm.md),
[`hadenius_pmm`](https://xmarquez.github.io/democracyData/reference/hadenius_pmm.md),
[`mainwaring`](https://xmarquez.github.io/democracyData/reference/mainwaring.md),
[`munck_pmm`](https://xmarquez.github.io/democracyData/reference/munck_pmm.md),
[`polity_pmm`](https://xmarquez.github.io/democracyData/reference/polity_pmm.md),
[`prc_gasiorowski`](https://xmarquez.github.io/democracyData/reference/prc_gasiorowski.md)

Other dichotomous democracy indexes:
[`anckar`](https://xmarquez.github.io/democracyData/reference/anckar.md),
[`anrr`](https://xmarquez.github.io/democracyData/reference/anrr.md),
[`bmr`](https://xmarquez.github.io/democracyData/reference/bmr.md),
[`bnr`](https://xmarquez.github.io/democracyData/reference/bnr.md),
[`doorenspleet`](https://xmarquez.github.io/democracyData/reference/doorenspleet.md),
[`kailitz`](https://xmarquez.github.io/democracyData/reference/kailitz.md),
[`pacl_update`](https://xmarquez.github.io/democracyData/reference/pacl_update.md),
[`svolik_regime`](https://xmarquez.github.io/democracyData/reference/svolik_regime.md),
[`ulfelder`](https://xmarquez.github.io/democracyData/reference/ulfelder.md),
[`utip`](https://xmarquez.github.io/democracyData/reference/utip.md),
[`vaporeg`](https://xmarquez.github.io/democracyData/reference/vaporeg.md),
[`vaporeg_2024`](https://xmarquez.github.io/democracyData/reference/vaporeg_2024.md),
[`wahman_teorell_hadenius`](https://xmarquez.github.io/democracyData/reference/wahman_teorell_hadenius.md)
