# The Acemoglu, Naidu, Restrepo and Robinson democracy dataset

Dataset described in D. Acemoglu, S. Naidu, P. Restrepo, et al.
"Democracy Does Cause Growth". In: *Journal of Political Economy* 127.1
(2019), pp. 47-100. DOI:
[10.1086/700936](https://dx.doi.org/10.1086/700936). Original data
available at
<https://www.journals.uchicago.edu/doi/suppl/10.1086/700936>.

## Usage

``` r
anrr
```

## Format

An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with
8733 rows and 8 columns.

## Source

D. Acemoglu, S. Naidu, P. Restrepo, et al. "Democracy Does Cause
Growth". In: *Journal of Political Economy* 127.1 (2019), pp. 47-100.
DOI: [10.1086/700936](https://dx.doi.org/10.1086/700936).

## Variables

- anrr_country:

  The country name, as in the original dataset, with minimal
  modification (Sao Tome and Principe). Use `extended_country_name`
  instead if you want a consistent name.

- anrr_wbcode:

  The World Bank Code as in the original dataset.

- dem:

  The democracy variable (1 = democratic, 0 = non-democratic). The
  supplementary material describes the construction of the variable as
  follows (I copy, paste, and lightly edit from pp. A1-A2):

  We construct our consolidated measure of democracy using [Freedom
  House](https://xmarquez.github.io/democracyData/reference/download_fh.md)
  and [Polity
  IV](https://xmarquez.github.io/democracyData/reference/polityIV.md) as
  our main sources. We also use secondary sources to resolve ambiguous
  cases (those in which Polity and Freedom house report contrary
  assessments) or those without data coverage in Freedom House or
  Polity IV. For instance, Freedom House only covers the period since
  1972, so we use secondary sources and the Polity IV index to code our
  measure of democracy prior to this period. Likewise, Polity IV does
  not cover some small countries that are in the Freedom House sample
  and in other secondary sources. The secondary sources are the
  dichotomous measures introduced by Cheibub, Gandhi, and
  Vreeland (2010) - henceforth
  [CGV](https://xmarquez.github.io/democracyData/reference/pacl.md) -
  and Boix, Miller, and Rosato (2012)

  - henceforth
    [BMR](https://xmarquez.github.io/democracyData/reference/bmr.md).
    Both measures extend and refine Przeworski et al.'s (2000) measure
    of democracy. Finally, we use Papaioannou and Siourounis's (2008)
    data–henceforth PS–which contains the exact year of a permanent
    transition to democracy for many of the countries in our sample, but
    that does not include temporary transitions in and out of democracy.

  1.  We code a country c as democratic in year t if Freedom House
      regards it as "Free" or "Partially Free" and Polity IV gives it a
      positive democracy score (The Polity IV index is between -10 and
      10). This procedure generates the bulk of the variation in our
      democracy measure.

  2.  For small countries that only appear in the [Freedom
      House](https://xmarquez.github.io/democracyData/reference/download_fh.md)
      sample, we code them as democratic if their Freedom House status
      is "Free" or "Partially Free," and either
      [CGV](https://xmarquez.github.io/democracyData/reference/pacl.md)
      or
      [BMR](https://xmarquez.github.io/democracyData/reference/bmr.md)
      consider them to be democratic. There is overwhelming agreement
      between Freedom House,
      [CGV](https://xmarquez.github.io/democracyData/reference/pacl.md)
      and
      [BMR](https://xmarquez.github.io/democracyData/reference/bmr.md)
      in all such cases, making the coding straightforward. The only
      ambiguous case is Samoa, which is coded as "Free" since 1989 by
      [Freedom
      House](https://xmarquez.github.io/democracyData/reference/download_fh.md),
      while
      [CGV](https://xmarquez.github.io/democracyData/reference/pacl.md)
      and
      [BMR](https://xmarquez.github.io/democracyData/reference/bmr.md)
      both code it as nondemocratic. We follow the latter coding since
      rulers in Samoa have a long tenure and are appointed to office for
      life. Besides this particular case, there are some countries for
      which only Freedom House provides information for the years 2009
      and 2010 (the
      [CGV](https://xmarquez.github.io/democracyData/reference/pacl.md)
      and
      [BMR](https://xmarquez.github.io/democracyData/reference/bmr.md)
      sample ends in 2008 and 2009 respectively). These include
      Afghanistan, Bahamas, Barbados, Belize, Bosnia & Herzegovina,
      Brunei Darussalam, Dominica, Grenada, Iceland, Iraq, Kiribati,
      Luxembourg, Maldives, Malta, Nauru, Palau, Samoa, Seychelles, St.
      Kitts and Nevis, St. Lucia, St. Vincent & Grens., Suriname, Sao
      Tome and Prıncipe, Tonga and Vanuatu. In all of these cases the
      Freedom House indicator remains the same since 2008, so we assume
      these countries remain in the same political regime that was in
      place in 2008.

  3.  Freedom House does not provide any data before 1972. For these
      early years, we code a country as democractic if it has a positive
      Polity score and either
      [CGV](https://xmarquez.github.io/democracyData/reference/pacl.md)
      or
      [BMR](https://xmarquez.github.io/democracyData/reference/bmr.md)
      code it as democratic. There are a few cases coded as
      nondemocracies by
      [CGV](https://xmarquez.github.io/democracyData/reference/pacl.md)
      and
      [BMR](https://xmarquez.github.io/democracyData/reference/bmr.md)
      with a positive
      [Polity](https://xmarquez.github.io/democracyData/reference/polity)
      score. In these cases, the
      [Polity](https://xmarquez.github.io/democracyData/reference/polityIV.md)
      score is always near zero and we code the observation as a
      nondemocracy.

  4.  Ex-Soviet and Ex-Yugoslav countries are coded as nondemocracies
      before 1990, based on the USSR and Yugoslavia scores before their
      dissolution.

  5.  When both Freedom House and Polity are missing (174 observations
      for 16 countries), we rely on our secondary sources and code our
      measure of democracy manually. The first country is Antigua and
      Barbuda, which is coded as democratic following its independence
      in 1981. Barbados is set as democratic from its independence in
      1966 until it enters the Freedom House sample in 1972, after which
      Freedom House codes it as democratic. Germany, Iceland, and
      Luxembourg are coded as always democratic. This matches the
      Freedom House coding once they enter into its sample. Kuwait is
      set to nondemocratic in 1961 and 1962, until it enters the Polity
      sample in 1963 and is also coded as nondemocratic. The Maldives
      are set as nondemocratic from its independence in 1965, until they
      enter the Freedom House sample in 1972 and is also coded as
      nondemocratic. Malta is set as democratic from its independence in
      1964, until it enters the Freedom House sample in 1972 and is also
      coded as democratic. Nauru is set as democratic from its
      independence in 1968 until it enters the Freedom House sample in
      1972, remaining democratic. Syria is coded as nondemocratic in
      1960 when it was not in the Polity sample. It remains
      nondemocratic in the Polity sample. Tonga is coded as
      nondemocratic since its independence. This matches the Freedom
      House coding when it enters the sample. Vietnam and Yemen are
      coded as always nondemocratic, but they are not in Polity and
      Freedom House prior to their unification. However, they were
      nondemocratic according to all secondary sources. Samoa is
      nondemocratic since its independence based on
      [CGV](https://xmarquez.github.io/democracyData/reference/pacl.md)
      and
      [BMR](https://xmarquez.github.io/democracyData/reference/bmr.md)
      for years in which Polity and Freedom House are missing. Finally,
      Zimbabwe is also nondemocratic in 1965-1969, according to our
      secondary sources.

  6.  We remove spurious transitions created when countries enter or
      leave the Freedom House, Polity, or our secondary sources'
      samples. For instance, these spurious transitions arise when a
      country appears in (or leaves) the sample for one of our sources
      that gives it a more (or less) favorable assessment than the
      others. This is the case for Cyprus, Malaysia, Gambia, and Guyana,
      which we handled manually. The particular coding of these
      countries does not affect our results. We follow most sources and
      code Cyprus as democratic after 1974. Malaysia is coded as
      nondemocratic throughout. Guyana is coded as nondemocratic between
      1966 and 1990 and democratic in all other years. Finally, Gambia
      is coded as democratic between 1965 and 1993 only.

  7.  Finally, we perform an additional refinements of our measure and
      adjust it to match the dates for permanent democratizations that
      PS coded. These dates are available for 68 transitions in our
      sample (recall PS only code permanent transitions), and are based
      on historical sources. Some special cases, for which PS transition
      dates and our coding are not close in time, include Guatemala, El
      Salvador, Iran, Tanzania, and South Africa. For Guatemala, our
      coding described above dates a democratization in 1986, while PS
      code a permanent transition at the end of the civil war in 1996.
      For El Salvador, we code the democratization episode in 1982 based
      on Freedom House and Polity, while PS code it in 1994. We do not
      detect any transition to democracy for Iran and Tanzania. In all
      of these cases we keep our original coding. Our coding produces a
      transition to democracy in South Africa during the early 80s based
      solely on Freedom House and Polity. However, PS and all secondary
      sources agree that the official democratization was in 1994, so we
      use this date.

  Our dichotomous measure of democracy is available for 183 countries
  and covers their postindependence period since 1960 and until 2010.
  Out of the 8,733 country/year observations, we code 3,777 instances of
  democracy and 4,956 instances of nondemocracy. Out of the 183
  countries, 45 are always democratic, 45 are always nondemocratic, and
  the rest transition in and out of democracy. A total of 122
  democratizations and 71 reversals suggest significant within-country
  variation in our democracy measure.

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
[`vdem_simple`](https://xmarquez.github.io/democracyData/reference/vdem_simple.md),
[`wahman_teorell_hadenius`](https://xmarquez.github.io/democracyData/reference/wahman_teorell_hadenius.md)

Other dichotomous democracy indexes:
[`anckar`](https://xmarquez.github.io/democracyData/reference/anckar.md),
[`bmr`](https://xmarquez.github.io/democracyData/reference/bmr.md),
[`bnr`](https://xmarquez.github.io/democracyData/reference/bnr.md),
[`doorenspleet`](https://xmarquez.github.io/democracyData/reference/doorenspleet.md),
[`kailitz`](https://xmarquez.github.io/democracyData/reference/kailitz.md),
[`pacl`](https://xmarquez.github.io/democracyData/reference/pacl.md),
[`pacl_update`](https://xmarquez.github.io/democracyData/reference/pacl_update.md),
[`svolik_regime`](https://xmarquez.github.io/democracyData/reference/svolik_regime.md),
[`ulfelder`](https://xmarquez.github.io/democracyData/reference/ulfelder.md),
[`utip`](https://xmarquez.github.io/democracyData/reference/utip.md),
[`wahman_teorell_hadenius`](https://xmarquez.github.io/democracyData/reference/wahman_teorell_hadenius.md)
