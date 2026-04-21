# Country-Year State System Coding

Given a set of country-years, find appropriate country codes,
standardized country names, and determine state system membership

## Usage

``` r
country_year_coder(
  tbl,
  country_col,
  date_col,
  code_col,
  code_type = "cown",
  to_system = c("GW", "polity", "cow"),
  match_type = c("country and code", "code only"),
  include_in_output = c("extended_country_name", "GWn", "cown", "in_GW_system"),
  verbose = TRUE,
  debug = FALSE,
  match_final_year = FALSE
)
```

## Arguments

- tbl:

  A data frame with (at least) country and year columns.

- country_col:

  The (unquoted) name of the country column. Defaults to `country`. If
  missing, but `code_col` is given, the function defaults to matching
  only on code and does not match on country names. This saves time, but
  is not always possible and can introduce errors if the code column is
  incorrect.

- date_col:

  The (unquoted) name of the year column. Defaults to `year`. Must exist
  in `tbl` - otherwise just use
  [countrycode::countrycode](https://vincentarelbundock.github.io/countrycode/man/countrycode.html)
  if you don't care about country-year matching.

- code_col:

  The (unquoted) name of the code column. Defaults to `NULL`.

- code_type:

  Type of code to match on (only needed if `code_col` is not `NULL`).
  Defaults to "cown". Can be any unambiguous substring of the following:

  - "GWn": Numeric code for the country in the Gleditsch-Ward system of
    states
    ([http://privatewww.essex.ac.uk/~ksg/statelist.html](http://privatewww.essex.ac.uk/~ksg/statelist.md)).
    This is very similar, but not identical, to the Correlates of War
    and Polity codes. See the vignette in this package for the
    differences.

  - "GWc": Three letter code for the country in the Gleditsch-Ward
    system of states
    ([http://privatewww.essex.ac.uk/~ksg/statelist.html](http://privatewww.essex.ac.uk/~ksg/statelist.md)).
    This is very similar, but not identical, to the Correlates of War
    and Polity codes. See the vignette in this package for an overview
    of the differences between these systems.

  - "extended_GWn": Identical to `GWn`, but includes a number of not
    commonly used codes for units of doubtful sovereignty (751 for
    Hyderabad before its incorporation into India, 666.001 and 666.002
    for Israel pre 1967 borders and occupied territories, and 605 for
    Western Sahara). These codes are used in some UCDP/PRIO
    (<https://www.prio.org/Data/Armed-Conflict/UCDP-PRIO/>) datasets.

  - "extended_GWc": Identical to `GWc`, but includes a number of not
    commonly used codes for units of doubtful sovereignty (HYD for
    Hyderabad before its incorporation into India, ISR.1 and ISR.2 for
    Israel pre 1967 borders amd occupied territories, and SAH for
    Western Sahara). These codes are used in some UCDP/PRIO
    (<https://www.prio.org/Data/Armed-Conflict/UCDP-PRIO/>) datasets.

  - "cown": Numeric code for the country in the Correlates of War system
    of states
    (<http://www.correlatesofwar.org/data-sets/cow-country-codes>). This
    is very similar, but not identical, to the Gleditsch and Ward and
    Polity codes. See the vignette in this package for an overview of
    the differences between these systems.

  - "cowc": Three letter code for the country in the Correlates of War
    system of states
    (<http://www.correlatesofwar.org/data-sets/cow-country-codes>). This
    is very similar, but not identical, to the Gleditsch and Ward and
    Polity codes. See the vignette in this package for an overview of
    the differences between these systems.

  - "polity_ccode": Numeric code for the country in the Polity IV
    dataset (<http://www.systemicpeace.org/polity/polity4.htm>). This is
    very similar, but not identical, to the Gleditsch and Ward and COW
    codes. See the vignette in this package for the differences.

  - "polity_scode": Three letter code for the country in the Polity IV
    dataset (<http://www.systemicpeace.org/polity/polity4.htm>). This is
    very similar, but not identical, to the Gleditsch and Ward and COW
    codes. See the vignette in this package for an overview of the
    differences between these systems.

  - "eurostat": Eurostat 2-letter country code. Taken from
    [countrycode::countrycode](https://vincentarelbundock.github.io/countrycode/man/countrycode.html).

  - "eu28": Whether the state is a member of the European Union (as of
    December 2015), without special territories. Taken from
    [countrycode::countrycode](https://vincentarelbundock.github.io/countrycode/man/countrycode.html).

  - "fao": Food and Agriculture Organization of the United Nations
    numerical country code. Taken from
    [countrycode::countrycode](https://vincentarelbundock.github.io/countrycode/man/countrycode.html).

  - "fips105": FIPS 10-5 (Federal Information Processing Standard)
    2-letter country code. Taken from
    [countrycode::countrycode](https://vincentarelbundock.github.io/countrycode/man/countrycode.html).

  - "icao": International Civil Aviation Organization 2-letter country
    code. Taken from
    [countrycode::countrycode](https://vincentarelbundock.github.io/countrycode/man/countrycode.html).

  - "icao_region": International Civil Aviation Organization region
    code. Taken from
    [countrycode::countrycode](https://vincentarelbundock.github.io/countrycode/man/countrycode.html).

  - "imf": International Monetary Fund numeric country code. Taken from
    [countrycode::countrycode](https://vincentarelbundock.github.io/countrycode/man/countrycode.html).

  - "ioc": International Olympic Committee 3-letter country code. Taken
    from
    [countrycode::countrycode](https://vincentarelbundock.github.io/countrycode/man/countrycode.html).

  - "iso2c": ISO-2 character. Taken from
    [countrycode::countrycode](https://vincentarelbundock.github.io/countrycode/man/countrycode.html).

  - "iso3c": ISO-3 character. Taken from
    [countrycode::countrycode](https://vincentarelbundock.github.io/countrycode/man/countrycode.html).

  - "iso2n": ISO-2 numeric. Taken from
    [countrycode::countrycode](https://vincentarelbundock.github.io/countrycode/man/countrycode.html).

  - "iso3n": ISO-3 numeric. Taken from
    [countrycode::countrycode](https://vincentarelbundock.github.io/countrycode/man/countrycode.html).

  - "un": United Nations numerical code. Taken from
    [countrycode::countrycode](https://vincentarelbundock.github.io/countrycode/man/countrycode.html).

  - "wb": World Bank (very similar but not identical to iso3c). Taken
    from
    [countrycode::countrycode](https://vincentarelbundock.github.io/countrycode/man/countrycode.html).

  - "wb_api2c": World Bank API 2 character code. Taken from
    [countrycode::countrycode](https://vincentarelbundock.github.io/countrycode/man/countrycode.html).

  - "wb_api3c": World Bank API 3 character code. Taken from
    [countrycode::countrycode](https://vincentarelbundock.github.io/countrycode/man/countrycode.html).

  - "wvs": World Values Survey numeric code. Taken from
    [countrycode::countrycode](https://vincentarelbundock.github.io/countrycode/man/countrycode.html).

- to_system:

  State system to match to. Default is Gledistsch and Ward.

- match_type:

  How to match countries when provided with a code column; the possible
  options are "country and code" (looks at the country column as well as
  the code column, if the latter is supplied) or "code only" (matches
  only on the code column). The latter option should only be used if you
  are confident about the code column being accurate and not missing any
  codes, or if not country name column is present. Default is "country
  and code". Can be abbreviated (e.g., "country" is the same as "country
  and code")

- include_in_output:

  Columns to include in output. Defaults to c("extended_country_name",
  "GWn", "cown", "in_GW_system"), but can be any character vector
  containing any combination of the column names in the internal
  database of country codes.

  The possibilities are:

  - "GW_country_name": The name of the country in the Gleditsch-Ward
    system of states
    ([http://privatewww.essex.ac.uk/~ksg/statelist.html](http://privatewww.essex.ac.uk/~ksg/statelist.md))
    (Gleditsch and War 1999).

  - "extended_country_name": The name of the country in the
    Gleditsch-Ward system of states
    ([http://privatewww.essex.ac.uk/~ksg/statelist.html](http://privatewww.essex.ac.uk/~ksg/statelist.md))
    (Gleditsch and War 1999), of the official name of the entity (for
    non-sovereign entities and states not in the Gleditsch and Ward
    system of states) or else a common name for disputed cases that do
    not have an official name (e.g., Western Sahara, Hyderabad).

  - "cow_country_name": The name of the state in the Correlates of War
    state system (2016 version). See
    <http://www.correlatesofwar.org/data-sets/cow-country-codes> for
    details. Is `NA` if the country is not in the COW system of states.

  - "polity_country_name": The name of the state in the official Polity
    dataset. Is `NA` if the country is not in Polity.

  - "country_name_en": The official name of the country (official short
    English country name), as defined by the ISO organization. Taken
    from
    [countrycode::countrycode](https://vincentarelbundock.github.io/countrycode/man/countrycode.html).
    See also <https://en.wikipedia.org/wiki/ISO_3166-1>. Some names are
    missing because the state no longer exists or there is controversy
    about its sovereign status.

  - "GWn": Numeric code for the country in the Gleditsch-Ward system of
    states
    ([http://privatewww.essex.ac.uk/~ksg/statelist.html](http://privatewww.essex.ac.uk/~ksg/statelist.md))
    (Gleditsch and War 1999). This is very similar, but not identical,
    to the Correlates of War and Polity codes. See the vignette in this
    package for the differences.

  - "extended_GWn": Identical to `GWn`, but includes a number of not
    commonly used codes for units of doubtful sovereignty (751 for
    Hyderabad before its incorporation into India, 666.001 and 666.002
    for Israel pre 1967 borders amd occupied territories, and 605 for
    Western Sahara). These codes are used in some UCDP/PRIO
    (<https://www.prio.org/Data/Armed-Conflict/UCDP-PRIO/>) datasets.

  - "GWc": Three letter code for the country in the Gleditsch-Ward
    system of states
    ([http://privatewww.essex.ac.uk/~ksg/statelist.html](http://privatewww.essex.ac.uk/~ksg/statelist.md))
    (Gleditsch and War 1999). This is very similar, but not identical,
    to the Correlates of War and Polity codes. See the vignette in this
    package for an overview of the differences between these systems.

  - "extended_GWc": Identical to `GWc`, but includes a number of not
    commonly used codes for units of doubtful sovereignty (HYD for
    Hyderabad before its incorporation into India, 666.001 and 666.002
    for Israel pre 1967 borders amd occupied territories, and 605 for
    Western Sahara). These codes are used in some UCDP/PRIO
    (<https://www.prio.org/Data/Armed-Conflict/UCDP-PRIO/>) datasets.

  - "cown": Numeric code for the country in the Correlates of War system
    of states
    (<http://www.correlatesofwar.org/data-sets/cow-country-codes>), 2016
    release. This is very similar, but not identical, to the Gleditsch
    and Ward and Polity codes. See the vignette in this package for an
    overview of the differences between these systems.

  - "cowc": Three letter code for the country in the Correlates of War
    system of states
    (<http://www.correlatesofwar.org/data-sets/cow-country-codes>), 2016
    release. This is very similar, but not identical, to the Gleditsch
    and Ward and Polity codes. See the vignette in this package for an
    overview of the differences between these systems.

  - "polity_ccode": Numeric code for the country in the Polity IV
    dataset (<http://www.systemicpeace.org/polity/polity4.htm>). This is
    very similar, but not identical, to the Gleditsch and Ward and COW
    codes. See the vignette in this package for the differences.

  - "polity_scode": Three letter code for the country in the Polity IV
    dataset (<http://www.systemicpeace.org/polity/polity4.htm>). This is
    very similar, but not identical, to the Gleditsch and Ward and COW
    codes. See the vignette in this package for an overview of the
    differences between these systems.

  - "regex": The regular expression used to match the country name.
    Useful for debugging.

  - "GW_startdate": The entry date of the state into the international
    system (usually the date of independence, though there can be more
    than one if the country entered or exited the state system at
    different times), according to Gleditsch and Ward, or 1 January
    1816, whichever is later. Is `NA` if the country was never in the
    Gleditsch and Ward system of states.

  - "GW_enddate": The exit date of the state from the international
    system (usually the date the state lost its independence, though
    there can be more than one), according to Gleditsch and Ward, or
    `NA` if the country is still in the international system as of the
    time the dataset was compiled. Is `NA` if the country was never in
    the Gleditsch and Ward system of states.

  - "cow_startdate": The entry date of the state into the international
    system (usually the date of independence, though there can be more
    than one if the country entered or exited the state system at
    different times), according to Correlates of War, or 1 January 1800,
    whichever is later. Is always `NA` if the country was never in the
    Correlates of War system of states.

  - "cow_enddate": The exit date of the state from the international
    system (usually the date the state lost its independence, though
    there can be more than one), according to the Correlates of War
    system, or `NA` if the country is still in the international system
    as of the time the dataset was compiled. Is always `NA` if the
    country was never in the Correlates of War system of states.

  - "official_region": Regions as defined in the World Bank Development
    Indicators. Taken from
    [countrycode::countrycode](https://vincentarelbundock.github.io/countrycode/man/countrycode.html).

  - "extended_region": The same as "official_region", except it adds
    region information for historical states. It assigns
    "Austria-Hungary" the (invented) region "Central Europe", since
    Hungary is assigned to Eastern Europe and Austria to Western Europe
    in the World Bank scheme.

  - "official_continent": Continents as defined in the World Bank
    Development Indicators. Taken from
    [countrycode::countrycode](https://vincentarelbundock.github.io/countrycode/man/countrycode.html).

  - "extended_continent": The same as "official_continent", except it
    adds continent information for historical states. Is `NA` only for
    Antarctica and a number of isolated islands.

  - "lon": The rough longitude of the state, obtained by geocoding the
    official country name via ggmap::geocode (with some manual
    adjustments for historical states).

  - "lat": The rough latitude of the state, obtained by geocoding the
    official country name via ggmap::geocode (with some manual
    adjustments for historical states).

  - "microstate": Whether the state is a microstate, according to
    Gleditsch. His tentative list of microstates is available at
    [http://privatewww.essex.ac.uk/~ksg/statelist.html](http://privatewww.essex.ac.uk/~ksg/statelist.md).

  - "in_GW_system": Whether the state is "in system" (that is, is
    independent and sovereign), according to Gleditsch and Ward, for a
    particular date.

  - "in_cow_system": Whether the state is "in system" (that is, is
    independent and sovereign), according to the Correlates of War
    system, for a particular date.

  - "in_polity_system": Whether the state is "in system" (that is, is
    independent and sovereign), according to the Polity IV system, for a
    particular date.

  - ar5: IPCC's regional mapping used both in the Fifth Assessment
    Report (AR5) and for the Reference Concentration Pathways (RCP).
    Taken from
    [countrycode::countrycode](https://vincentarelbundock.github.io/countrycode/man/countrycode.html).

  - continent: Continent as defined in the World Bank Development
    Indicators. Taken from
    [countrycode::countrycode](https://vincentarelbundock.github.io/countrycode/man/countrycode.html).

  - "eurocontrol_pru": European Organisation for the Safety of Air
    Navigation region. Taken from
    [countrycode::countrycode](https://vincentarelbundock.github.io/countrycode/man/countrycode.html).

  - "eurocontrol_statfor": European Organisation for the Safety of Air
    Navigation region. Taken from
    [countrycode::countrycode](https://vincentarelbundock.github.io/countrycode/man/countrycode.html).

  - "eurostat": Eurostat 2-letter country code. Taken from
    [countrycode::countrycode](https://vincentarelbundock.github.io/countrycode/man/countrycode.html).

  - "eu28": Whether the state is a member of the European Union (as of
    December 2015), without special territories. Taken from
    [countrycode::countrycode](https://vincentarelbundock.github.io/countrycode/man/countrycode.html).

  - "fao": Food and Agriculture Organization of the United Nations
    numerical country code. Taken from
    [countrycode::countrycode](https://vincentarelbundock.github.io/countrycode/man/countrycode.html).

  - "fips105": FIPS 10-5 (Federal Information Processing Standard)
    2-letter country code. Taken from
    [countrycode::countrycode](https://vincentarelbundock.github.io/countrycode/man/countrycode.html).

  - "icao": International Civil Aviation Organization 2-letter country
    code. Taken from
    [countrycode::countrycode](https://vincentarelbundock.github.io/countrycode/man/countrycode.html).

  - "icao_region": International Civil Aviation Organization region
    code. Taken from
    [countrycode::countrycode](https://vincentarelbundock.github.io/countrycode/man/countrycode.html).

  - "imf": International Monetary Fund numeric country code. Taken from
    [countrycode::countrycode](https://vincentarelbundock.github.io/countrycode/man/countrycode.html).

  - "ioc": International Olympic Committee 3-letter country code. Taken
    from
    [countrycode::countrycode](https://vincentarelbundock.github.io/countrycode/man/countrycode.html).

  - "iso2c": ISO-2 character. Taken from
    [countrycode::countrycode](https://vincentarelbundock.github.io/countrycode/man/countrycode.html).

  - "iso3c": ISO-3 character. Taken from
    [countrycode::countrycode](https://vincentarelbundock.github.io/countrycode/man/countrycode.html).

  - "iso2n": ISO-2 numeric. Taken from
    [countrycode::countrycode](https://vincentarelbundock.github.io/countrycode/man/countrycode.html).

  - "iso3n": ISO-3 numeric. Taken from
    [countrycode::countrycode](https://vincentarelbundock.github.io/countrycode/man/countrycode.html).

  - "un": United Nations numerical code. Taken from
    [countrycode::countrycode](https://vincentarelbundock.github.io/countrycode/man/countrycode.html).

  - "wb": World Bank (very similar but not identical to iso3c). Taken
    from
    [countrycode::countrycode](https://vincentarelbundock.github.io/countrycode/man/countrycode.html).

  - "wb_api2c": World Bank API 2 character code. Taken from
    [countrycode::countrycode](https://vincentarelbundock.github.io/countrycode/man/countrycode.html).

  - "wb_api3c": World Bank API 3 character code. Taken from
    [countrycode::countrycode](https://vincentarelbundock.github.io/countrycode/man/countrycode.html).

  - "wvs": World Values Survey numeric code. Taken from
    [countrycode::countrycode](https://vincentarelbundock.github.io/countrycode/man/countrycode.html).

  - "country_name_ar": country name (Arabic). Taken from
    [countrycode::countrycode](https://vincentarelbundock.github.io/countrycode/man/countrycode.html).

  - "country_name_de": country name (German). Taken from
    [countrycode::countrycode](https://vincentarelbundock.github.io/countrycode/man/countrycode.html).

  - "country_name_es": country name (Spanish). Taken from
    [countrycode::countrycode](https://vincentarelbundock.github.io/countrycode/man/countrycode.html).

  - "country_name_fr": country name (French). Taken from
    [countrycode::countrycode](https://vincentarelbundock.github.io/countrycode/man/countrycode.html).

  - "country_name_ru": country name (Russian). Taken from
    [countrycode::countrycode](https://vincentarelbundock.github.io/countrycode/man/countrycode.html).

  - "country_name_zh": country name (Chinese). Taken from
    [countrycode::countrycode](https://vincentarelbundock.github.io/countrycode/man/countrycode.html).

- verbose:

  Prints information about countries matched multiple times, name
  changes, and other problems encountered while processing the data.
  Default is `TRUE`.

- debug:

  Returns additional columns useful for debugging. Default is `FALSE`.

- match_final_year:

  Whether to classify the final year of a country as "in system". For
  example, if `TRUE`, the country-year pair "Republic of Vietnam 1975"
  will appear as "in system" in 1975, though the country ended in 1975;
  if `FALSE` it will appear as not in system, as the Republic of Vietnam
  (South Vietnam) ceased to exist by the end of 1975. Use with care;
  this may result in multiple matches. Default is `FALSE`.

## Value

a tidy data frame of country-years merged with information about the
system of states (GWn, COW, or Polity IV), country codes, and
standardized country names.

## Examples

``` r
# \donttest{
library(dplyr)
bmr <- redownload_bmr(return_raw = TRUE)
#> Downloading BMR data...
#> Trying https://drive.google.com/uc?export=download&id=1T5Kzs7iu8w26UrTJuyskugcD6Z3uR_tX ...
#> The downloaded BMR dataset has 19775 rows
#> Returning raw data, without processing.
country_year_coder(bmr, country_col = country, date_col = year,
                   code_col = ccode, code_type = "polity_ccode")# }
#> The following different countries/country codes match to a single country unit in the destination system:
#> 
#> 
#> |country               | ccode|extended_country_name | GWn| cown| min_date| max_date|  n|
#> |:---------------------|-----:|:---------------------|---:|----:|--------:|--------:|--:|
#> |YUGOSLAVIA            |   345|Yugoslavia            | 345|  345|     1991|     1991|  1|
#> |YUGOSLAVIA, FED. REP. |   347|Yugoslavia            | 345|  345|     1991|     1991|  1|
#> The following country names are different in the destination system:
#> 
#> 
#> |country                    | ccode|extended_country_name                   | GWn| cown| min_date| max_date|   n|
#> |:--------------------------|-----:|:---------------------------------------|---:|----:|--------:|--------:|---:|
#> |ANTIGUA                    |    58|Antigua & Barbuda                       |  58|   58|     1982|     2020|  39|
#> |BELARUS                    |   370|Belarus (Byelorussia)                   | 370|  370|     1991|     2020|  30|
#> |BOSNIA                     |   346|Bosnia-Herzegovina                      | 346|  346|     1992|     2020|  29|
#> |BURKINA FASO               |   439|Burkina Faso (Upper Volta)              | 439|  439|     1960|     2020|  61|
#> |CAMBODIA                   |   811|Cambodia (Kampuchea)                    | 811|  811|     1949|     2020|  72|
#> |CENTRAL AFRICAN REP.       |   482|Central African Republic                | 482|  482|     1960|     2020|  61|
#> |CENTRAL AMERICAN UNION     |    89|United Provinces of Central America     |  89|   NA|     1824|     1838|  15|
#> |CONGO, DEM. REP.           |   490|Congo, Democratic Republic of (Zaire)   | 490|  490|     1960|     2020|  61|
#> |CONGO, REP.                |   484|Congo                                   | 484|  484|     1960|     2020|  61|
#> |ETHIOPIA  (INCL. ERIT)     |   530|Ethiopia                                | 530|  530|     1952|     1992|  41|
#> |GERMANY                    |   255|German Federal Republic                 | 260|  255|     1945|     2020|  32|
#> |GERMANY                    |   255|Germany (Prussia)                       | 255|  255|     1800|     1944| 145|
#> |GERMANY, EAST              |   265|German Democratic Republic              | 265|  265|     1945|     1990|  46|
#> |GERMANY, WEST              |   260|German Federal Republic                 | 260|  260|     1945|     1990|  46|
#> |IRAN                       |   630|Iran (Persia)                           | 630|  630|     1800|     2020| 221|
#> |ITALY                      |   325|Italy/Sardinia                          | 325|  325|     1861|     2020| 160|
#> |KOREA, NORTH               |   731|Korea, People's Republic of             | 731|  731|     1948|     2020|  73|
#> |KOREA, SOUTH               |   732|Korea, Republic of                      | 732|  732|     1948|     2020|  73|
#> |KYRGYZSTAN                 |   703|Kyrgyz Republic                         | 703|  703|     1991|     2020|  30|
#> |LIECHSTENSTEIN             |   223|Liechtenstein                           | 223|  223|     1991|     2020|  30|
#> |MACEDONIA                  |   343|Macedonia (Former Yugoslav Republic of) | 343|  343|     1991|     2020|  30|
#> |MADAGASCAR                 |   580|Madagascar (Malagasy)                   | 580|  580|     1960|     2020|  61|
#> |MICRONESIA, FED.           |   987|Federated States of Micronesia          | 987|  987|     1992|     2020|  29|
#> |MYANMAR                    |   775|Myanmar (Burma)                         | 775|  775|     1948|     2020|  73|
#> |PAKISTAN  (INCL. BANGLAD.) |   769|Pakistan                                | 770|  770|     1947|     1971|  25|
#> |RUSSIA                     |   365|Russia (Soviet Union)                   | 365|  365|     1800|     2020| 151|
#> |SAMOA (WESTERN)            |   990|Samoa/Western Samoa                     | 990|  990|     1962|     2020|  59|
#> |SAO TOME & PRINCIPE        |   403|Sao Tome and Principe                   | 403|  403|     1976|     2020|  45|
#> |SARDINIA                   |   324|Italy/Sardinia                          | 325|  325|     1815|     1860|  46|
#> |SICILY                     |   329|Sicily (Two Sicilies)                   | 329|  329|     1816|     1860|  45|
#> |SRI LANKA                  |   780|Sri Lanka (Ceylon)                      | 780|  780|     1948|     2020|  73|
#> |ST. KITTS & NEVIS          |    60|Saint Kitts and Nevis                   |  60|   60|     1984|     2020|  37|
#> |ST. LUCIA                  |    56|Saint Lucia                             |  56|   56|     1979|     2020|  42|
#> |ST. VINCENT & GREN.        |    57|Saint Vincent and the Grenadines        |  57|   57|     1979|     2020|  42|
#> |SUDAN, NORTH               |   624|Sudan                                   | 625|  625|     2011|     2020|  10|
#> |SUDAN, SOUTH               |   626|South Sudan                             | 626|  626|     2011|     2020|  10|
#> |SURINAME                   |   115|Surinam                                 | 115|  115|     1975|     2020|  46|
#> |TANZANIA                   |   510|Tanzania/Tanganyika                     | 510|  510|     1961|     2020|  60|
#> |TRINIDAD & TOBAGO          |    52|Trinidad and Tobago                     |  52|   52|     1962|     2020|  59|
#> |TURKEY                     |   640|Turkey (Ottoman Empire)                 | 640|  640|     1800|     2020| 221|
#> |USSR                       |   364|Russia (Soviet Union)                   | 365|  365|     1922|     1991|  70|
#> |VIETNAM                    |   818|Vietnam, Democratic Republic of         | 816|  816|     1976|     2020|  45|
#> |VIETNAM, NORTH             |   816|Vietnam, Democratic Republic of         | 816|  816|     1954|     1975|  22|
#> |VIETNAM, SOUTH             |   817|Vietnam, Republic of                    | 817|  817|     1955|     1975|  21|
#> |YEMEN                      |   679|Yemen (Arab Republic of Yemen)          | 678|  679|     1990|     2020|  31|
#> |YEMEN, NORTH               |   678|Yemen (Arab Republic of Yemen)          | 678|  678|     1918|     1989|  72|
#> |YEMEN, SOUTH               |   680|Yemen, People's Republic of             | 680|  680|     1967|     1989|  23|
#> |YUGOSLAVIA, FED. REP.      |   347|Yugoslavia                              | 345|  345|     1991|     2006|  16|
#> |ZIMBABWE                   |   552|Zimbabwe (Rhodesia)                     | 552|  552|     1923|     2020|  98|
#> # A tibble: 19,775 × 15
#>    country  ccode abbreviation abbreviation_undp  year democracy democracy_trans
#>    <chr>    <dbl> <chr>        <chr>             <dbl>     <dbl>           <dbl>
#>  1 UNITED …     2 USA          USA                1800         1               0
#>  2 UNITED …     2 USA          USA                1801         1               0
#>  3 UNITED …     2 USA          USA                1802         1               0
#>  4 UNITED …     2 USA          USA                1803         1               0
#>  5 UNITED …     2 USA          USA                1804         1               0
#>  6 UNITED …     2 USA          USA                1805         1               0
#>  7 UNITED …     2 USA          USA                1806         1               0
#>  8 UNITED …     2 USA          USA                1807         1               0
#>  9 UNITED …     2 USA          USA                1808         1               0
#> 10 UNITED …     2 USA          USA                1809         1               0
#> # ℹ 19,765 more rows
#> # ℹ 8 more variables: democracy_breakdowns <dbl>, democracy_duration <dbl>,
#> #   democracy_omitteddata <dbl>, democracy_femalesuffrage <dbl>,
#> #   extended_country_name <chr>, GWn <dbl>, cown <dbl>, in_GW_system <lgl>
```
