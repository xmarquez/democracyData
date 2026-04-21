# The Rulers, Elections, and Irregular Governance Dataset (Regime data)

C. Bell. *The Rulers, Elections, and Irregular Governance Dataset
(REIGN)*. 2016. The dataset, variable descriptions, and technical notes,
are available at <https://oefdatascience.github.io/REIGN.github.io/>.
Collection stopped in 2021; this dataset is now archived in this
package.

## Usage

``` r
REIGN
```

## Format

An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with
13937 rows and 14 columns.

## Source

C. Bell. *The Rulers, Elections, and Irregular Governance Dataset
(REIGN)*. 2016.

## Overview

The REIGN regime characteristics dataset is based on the regime
classifications of Geddes, Wright, and Frantz
([gwf_autocratic](https://xmarquez.github.io/democracyData/reference/gwf_all.md)),
but it is updated monthly, and it has some differences with
[gwf_autocratic](https://xmarquez.github.io/democracyData/reference/gwf_all.md).
These are described as follows in the online technical notes:

REIGN data is updated to the present month (up to August 2021). We also
added the following countries to the dataset: The Bahamas, Jamaica,
Trinidad and Tobago, Barbados, Dominica, Grenada, St. Lucia, St. Vincent
and the Grenadines, Antigua and Barbuda, St. Kitts and Nevis, Belize,
Guyana, Surinam, Andorra, San Marino, Malta, Cyprus, Cape Verde, Sao
Tome and Principe, Equatorial Guinea, Djibouti, Comoros, Mauritius,
Seychelles, South Sudan, Bhutan, Maldives, South Vietnam, Brunei, East
Timor, Papua New Guinea, Vanuatu, Solomon Islands, Kiribati, Tuvalu,
Fiji, Tonga, Nauru, Marshall Islands, Palau, Micronesia, and Samoa.

We also added political systems that lasted for less than a year and
specified start and end months. This allows for a more granular look at
transitional periods and interim governments. These new short-lived
regimes appear in countries including Haiti, the Dominican Republic,
Guatemala, Peru, Benin, Niger, Ghana, and Nigeria.

Finally, GWF generally does not allow for yearly changes in institutions
over the course of a regime. If a government begins as personalist, it
stays personalist until that leader leaves power. In several cases we
code a change in regime type following reforms during the tenure of a
single leader, including Lanzana in Burkina Faso, Rawlings in Ghana,
etc.

Further discussion of the differences between REIGN and GWF
([gwf_autocratic](https://xmarquez.github.io/democracyData/reference/gwf_all.md))
is available here:
<http://oefresearch.org/sites/default/files/REIGN%20Data%202016.10.05.pdf>

## Variables

- reign_cowcode:

  The COW code of the country in REIGN.

- reign_country:

  The country name in REIGN.

- gwf_casename:

  The case name in the
  [gwf](https://xmarquez.github.io/democracyData/reference/gwf_all.md)
  dataset.

- gwf_startdate:

  The startdate of the case in the
  [gwf](https://xmarquez.github.io/democracyData/reference/gwf_all.md)
  dataset.

- gwf_enddate:

  The enddate of the case in the
  [gwf](https://xmarquez.github.io/democracyData/reference/gwf_all.md)
  dataset.

- Start:

  The start date of the regime.

- End:

  The end date of the regime, or 31 December of the current year.

- gwf_regimetype:

  The regime type. This is what the codebook says about the regime
  types:

  DEMOCRACIES

  We use a procedural definition of democracy, meaning we are interested
  in the institutional rules that dictate how leaders gain power and not
  in other correlates of democracy, including strong traditions of
  freedom of speech and assembly. Non-competitive single-party systems
  are classified as such, even if some are somewhat more liberal than
  others (see Botswana and Namibia). Democracies have reasonably
  free-and-fair competitions for political power.

  1.  Presidential Democracy: Democracy in which the executive is
      distinct from the legislative branch and considerable
      decision-making authority is granted to the executive.
      Presidential systems have presidents who serve as chief executives
      rather than figureheads.

  2.  Parliamentary Democracy: Democracy in which legislatures are more
      powerful and executives are less autonomous. Generally speaking,
      countries with powerful prime ministers and general elections are
      parliamentary democracies. Hybrid semi-presidential systems are
      classified case-by-case, but are usually grouped with
      parliamentary democracies.

  NON-DEMOCRACIES

  The Autocratic Regimes dataset by Professors Barbara Geddes, Joseph
  Wright, and Erica Frantz classifies all non-democratic governments
  into one of ten categories. Though our data differs from this dataset
  in important ways, it uses the same typology. We document major
  differences in the extended technical notes.

  1.  Personalist Systems: Power is highly concentrated in the hands of
      a non-monarch dictator who is relatively unconstrained by a
      military or political party. Contemporary examples include Russia,
      Sudan, and Chad.

  2.  Monarchies: Power is highly concentrated in the hands of a monarch
      who is much more than just a figurehead. Contemporary examples
      include Swaziland, Kuwait, and Morocco.

  3.  Single-Party Systems: Power is held by the head of a party.
      Executive power is effectively checked by the party or ruling
      committee. Contemporary examples include China, Angola, and
      Ethiopia.

  4.  Oligarchies: Power is held by the head of party, but unlike other
      single-party systems this party explicitly represents the
      interests of one elite segment of society. Past examples include
      apartheid-era South Africa and Rhodesia under Ian Smith.

  5.  Party-Personalist Hybrids: An intermediate hybrid where a party
      apparatus supports a dictator, yet the party's identity is
      concentrated around the person in power and it has few meaningful
      checks on executive power. Examples include Eritrea, and North
      Korea.

  6.  Military Juntas: A military committee runs the country. One
      officer typically serves as head, but this head serves the
      interests of the committee and his power is checked by other
      members of the military. Recent examples include Thailand and
      Algeria.

  7.  Indirect Military Juntas: The military has de facto power, but
      rules behind a civilian puppet. See pre-Mobutu Zaire and Suriname
      under Bouterse (1980-1988).

  8.  Personalist-Military Hybrids: A hybrid of military and personalist
      institutions in which a dictator holds most power and is
      relatively unchecked, yet the dictator's authority is rooted in
      military support. These systems often evolve from juntas when
      power is consolidated around a single individual. Examples include
      Chile under Pinochet, Pakistan under Zia and Musharraf, and Fiji
      under Bainimarama.

  9.  Party-Military Hybrids: Militarized single-party states in which
      most or all members of the ruling party are military elites.
      Examples include Algeria from 1962-1992, El Salvador before 1982,
      and Congo-Brazzaville between the 1968 coup and 1991.

  10. Party-Personalist-Military Hybrids: A dictator rules with the
      support of a militarized single-party state, but is relatively
      unchecked by these institutions. Examples include Egypt after
      1952, Indonesia under Suharto, and Syria under the Assads.

  INTERIM PERIODS

  Finally, we include four forms of government that are explicitly
  provisional or transitional:

  1.  Warlordism: occurs only in countries that are torn apart by
      conflict to the extent that they do not have a functional
      government. As of 2016, only Libya and Yemen meet this definition.
      War-torn countries like Syria are not included because a strong
      government continues to hold power in the capital and a
      significant part of the country.

  2.  Foreign-Occupied governments occur where foreign politicians or
      militaries hold de facto power over a government.

  3.  Civilian Provisional and Military Provisional governments are
      explicitly temporary arrangementsthat usually proceed completed
      transitions to democracy or follow coups and constitutional
      crises. Interim regimes are only called "military provisional" if
      the military is holding power until an election or some other
      formalized legitimizing event can occur.

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
[`vdem_simple`](https://xmarquez.github.io/democracyData/reference/vdem_simple.md),
[`wahman_teorell_hadenius`](https://xmarquez.github.io/democracyData/reference/wahman_teorell_hadenius.md)

Other authoritarianism:
[`anckar`](https://xmarquez.github.io/democracyData/reference/anckar.md),
[`gwf_all`](https://xmarquez.github.io/democracyData/reference/gwf_all.md),
[`kailitz`](https://xmarquez.github.io/democracyData/reference/kailitz.md),
[`magaloni`](https://xmarquez.github.io/democracyData/reference/magaloni.md),
[`utip`](https://xmarquez.github.io/democracyData/reference/utip.md),
[`wahman_teorell_hadenius`](https://xmarquez.github.io/democracyData/reference/wahman_teorell_hadenius.md)
