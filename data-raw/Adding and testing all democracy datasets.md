---
title: "Adding all democracy datasets, testing Targets pipeline works"
author: "Xavier Marquez"
date: "2023-03-28 16:45:40"
output: 
  html_document: 
    toc: yes
---



## Anckar and Fredriksson


```r
cite_dataset("anckar")
```

[1] C. Anckar and C. Fredriksson. "Classifying political regimes
1800-2016: a typology and a new dataset". In: _European Political
Science_ (2018). DOI: 10.1057/s41304-018-0149-8.
<https://doi.org/10.1057/s41304-018-0149-8>.

```r
anckar <- redownload_anckar(verbose = verbose,
                            include_in_output = include_in_output)
```

```
## Downloading Anckar and Fredricksson data...
```

```
## Trying https://dataverse.harvard.edu/api/access/datafile/3868064?format=original&gbrecs=true ...
```

```
## The downloaded Anckar and Fredricksson dataset has 18777 rows
```

```
## Fixing country names, adding state system information and regime category names
```

```
## The following country names are different in the destination system:
```



|country                   | ccode|extended_country_name                   | GWn| cown| min_date| max_date|   n|
|:-------------------------|-----:|:---------------------------------------|---:|----:|--------:|--------:|---:|
|BELARUS                   |   370|Belarus (Byelorussia)                   | 370|  370|     1991|     2019|  29|
|BOSNIA & HERZEGOVINA      |   346|Bosnia-Herzegovina                      | 346|  346|     1992|     2019|  28|
|BURKINA FASO              |   439|Burkina Faso (Upper Volta)              | 439|  439|     1960|     2019|  60|
|CAMBODIA                  |   811|Cambodia (Kampuchea)                    | 811|  811|     1949|     2019|  71|
|CENTRAL AFR.R.            |   482|Central African Republic                | 482|  482|     1960|     2019|  60|
|CONGO, DEM. REP.          |   490|Congo, Democratic Republic of (Zaire)   | 490|  490|     1960|     2019|  60|
|CONGO, REP.               |   484|Congo                                   | 484|  484|     1960|     2019|  60|
|DOMINICAN REP.            |    42|Dominican Republic                      |  42|   42|     1844|     2019| 176|
|ESWATINI                  |   572|Swaziland                               | 572|  572|     1968|     2019|  52|
|ETHIOPIA  (INCL. ERIT)    |   529|Ethiopia                                | 530|  530|     1952|     1992|  41|
|GERMANY                   |   255|German Federal Republic                 | 260|  255|     1990|     2019|  30|
|GERMANY                   |   255|Germany (Prussia)                       | 255|  255|     1800|     1944| 145|
|GERMANY EAST              |   265|German Democratic Republic              | 265|  265|     1945|     1989|  45|
|GERMANY WEST              |   260|German Federal Republic                 | 260|  260|     1945|     1989|  45|
|IRAN                      |   630|Iran (Persia)                           | 630|  630|     1800|     2019| 220|
|ITALY                     |   325|Italy/Sardinia                          | 325|  325|     1861|     2019| 159|
|KOREA NORTH               |   731|Korea, People's Republic of             | 731|  731|     1948|     2019|  72|
|KOREA SOUTH               |   732|Korea, Republic of                      | 732|  732|     1948|     2019|  72|
|KYRGYZSTAN                |   703|Kyrgyz Republic                         | 703|  703|     1991|     2019|  29|
|MADAGASCAR                |   580|Madagascar (Malagasy)                   | 580|  580|     1960|     2019|  60|
|MICRONESIA, FED.          |   987|Federated States of Micronesia          | 987|  987|     1992|     2019|  28|
|MYANMAR                   |   775|Myanmar (Burma)                         | 775|  775|     1948|     2019|  72|
|NORTH MACEDONIA           |   343|Macedonia (Former Yugoslav Republic of) | 343|  343|     1991|     2019|  29|
|PAKISTAN  (INCL. BANGLAD  |   769|Pakistan                                | 770|  770|     1947|     1971|  25|
|RUSSIA                    |   365|Russia (Soviet Union)                   | 365|  365|     1800|     2019| 150|
|SAMOA                     |   990|Samoa/Western Samoa                     | 990|  990|     1962|     2019|  58|
|SAO TOME & PRINCIPE       |   403|Sao Tome and Principe                   | 403|  403|     1976|     2019|  44|
|SERBIA                    |   342|Yugoslavia                              | 345|  345|     1918|     1920|   3|
|SLOVAK REPUBLIC           |   317|Slovakia                                | 317|  317|     1993|     2019|  27|
|SRI LANKA                 |   780|Sri Lanka (Ceylon)                      | 780|  780|     1948|     2019|  72|
|ST.KITTS&NEVIS            |    60|Saint Kitts and Nevis                   |  60|   60|     1984|     2019|  36|
|ST.LUCIA                  |    56|Saint Lucia                             |  56|   56|     1980|     2019|  40|
|ST.VINCENT&GRENADINES     |    57|Saint Vincent and the Grenadines        |  57|   57|     1979|     2019|  41|
|SURINAME                  |   115|Surinam                                 | 115|  115|     1975|     2019|  45|
|TANZANIA                  |   510|Tanzania/Tanganyika                     | 510|  510|     1961|     2019|  59|
|TRINIDAD&TOBAGO           |    52|Trinidad and Tobago                     |  52|   52|     1962|     2019|  58|
|TURKEY                    |   640|Turkey (Ottoman Empire)                 | 640|  640|     1800|     2019| 220|
|USSR                      |   364|Russia (Soviet Union)                   | 365|  365|     1922|     1991|  70|
|VIETNAM                   |   818|Vietnam, Democratic Republic of         | 816|  816|     1976|     2019|  44|
|VIETNAM NORTH             |   816|Vietnam, Democratic Republic of         | 816|  816|     1954|     1975|  22|
|VIETNAM SOUTH             |   817|Vietnam, Republic of                    | 817|  817|     1955|     1975|  21|
|YEMEN                     |   679|Yemen (Arab Republic of Yemen)          | 678|  679|     1990|     2019|  30|
|YEMEN ARAB REPUBLIC       |   678|Yemen (Arab Republic of Yemen)          | 678|  678|     1918|     1989|  72|
|YEMEN, PEOPLE'S DEM. REP. |   680|Yemen, People's Republic of             | 680|  680|     1967|     1989|  23|
|YUGOSLAVIA, FED. REP.     |   347|Yugoslavia                              | 345|  345|     1992|     2005|  14|
|ZIMBABWE                  |   552|Zimbabwe (Rhodesia)                     | 552|  552|     1965|     2019|  55|

```
## Resulting dataset after processing has 18777 rows.
```

```
## Changing the name of the original country column from country to anckar_country...
```

```
## Ensuring year column is numeric...
```

```
## Changing the name of the original code column from ccode to anckar_ccode...
```

```r
stopifnot(identical(anckar,tar_read(anckar, store = here::here("_targets"))))
stopifnot(identical(anckar, democracyData::anckar))
```

## ANRR


```r
cite_dataset("anrr")
```

[1] D. Acemoglu, S. Naidu, P. Restrepo, et al. "Democracy Does Cause
Growth". In: _Journal of Political Economy_ 127.1 (2019), pp. 47-100.
DOI: 10.1086/700936.
<https://www.journals.uchicago.edu/doi/10.1086/700936>.

```r
anrr <- prepare_anrr(path = here::here("data-raw/DDCGdata_final.dta"),
                     verbose = verbose,
                     include_in_output = include_in_output)
```

```
## The following country names are different in the destination system:
```



|country_name         |extended_country_name                   | GWn| cown| min_date| max_date|  n|
|:--------------------|:---------------------------------------|---:|----:|--------:|--------:|--:|
|Antigua and Barbuda  |Antigua & Barbuda                       |  58|   58|     1981|     2010| 30|
|Belarus              |Belarus (Byelorussia)                   | 370|  370|     1960|     2010| 51|
|Bosnia & Herzegovina |Bosnia-Herzegovina                      | 346|  346|     1960|     2010| 51|
|Brunei Darussalam    |Brunei                                  | 835|  835|     1984|     2010| 27|
|Burkina Faso         |Burkina Faso (Upper Volta)              | 439|  439|     1960|     2010| 51|
|Cambodia             |Cambodia (Kampuchea)                    | 811|  811|     1960|     2010| 51|
|Central African Rep. |Central African Republic                | 482|  482|     1960|     2010| 51|
|Congo, Dem. Rep. of  |Congo, Democratic Republic of (Zaire)   | 490|  490|     1960|     2010| 51|
|Congo, Republic of   |Congo                                   | 484|  484|     1960|     2010| 51|
|Czech Republic       |Czechoslovakia                          | 315|  315|     1960|     1992| 33|
|C<f4>te d'Ivoire     |Cote D'Ivoire                           | 437|  437|     1960|     2010| 51|
|Gambia, The          |Gambia                                  | 420|  420|     1965|     2010| 46|
|Germany              |German Federal Republic                 | 260|  255|     1990|     2010| 21|
|Germany              |German Federal Republic                 | 260|  260|     1960|     1989| 30|
|Iran, I.R. of        |Iran (Persia)                           | 630|  630|     1960|     2010| 51|
|Italy                |Italy/Sardinia                          | 325|  325|     1960|     2010| 51|
|Korea                |Korea, Republic of                      | 732|  732|     1960|     2010| 51|
|Lao People's Dem.Rep |Laos                                    | 812|  812|     1960|     2010| 51|
|Macedonia, FYR       |Macedonia (Former Yugoslav Republic of) | 343|  343|     1960|     2010| 51|
|Madagascar           |Madagascar (Malagasy)                   | 580|  580|     1960|     2010| 51|
|Myanmar              |Myanmar (Burma)                         | 775|  775|     1960|     2010| 51|
|North Korea          |Korea, People's Republic of             | 731|  731|     1960|     2010| 51|
|Russia               |Russia (Soviet Union)                   | 365|  365|     1960|     2010| 51|
|Samoa                |Samoa/Western Samoa                     | 990|  990|     1962|     2010| 49|
|Serbia & Montenegro  |Yugoslavia                              | 345|  345|     1960|     2010| 51|
|Slovak Republic      |Slovakia                                | 317|  317|     1960|     2010| 51|
|Sri Lanka            |Sri Lanka (Ceylon)                      | 780|  780|     1960|     2010| 51|
|St. Kitts and Nevis  |Saint Kitts and Nevis                   |  60|   60|     1983|     2010| 28|
|St. Lucia            |Saint Lucia                             |  56|   56|     1979|     2010| 32|
|St. Vincent & Grens. |Saint Vincent and the Grenadines        |  57|   57|     1979|     2010| 32|
|Suriname             |Surinam                                 | 115|  115|     1975|     2010| 36|
|Syrian Arab Republic |Syria                                   | 652|  652|     1960|     2010| 51|
|Tanzania             |Tanzania/Tanganyika                     | 510|  510|     1961|     2010| 50|
|Turkey               |Turkey (Ottoman Empire)                 | 640|  640|     1960|     2010| 51|
|United States        |United States of America                |   2|    2|     1960|     2010| 51|
|Venezuela, Rep. Bol. |Venezuela                               | 101|  101|     1960|     2010| 51|
|Vietnam              |Vietnam, Democratic Republic of         | 816|  816|     1960|     2010| 51|
|Yemen, Republic of   |Yemen (Arab Republic of Yemen)          | 678|  678|     1960|     1989| 30|
|Yemen, Republic of   |Yemen (Arab Republic of Yemen)          | 678|  679|     1990|     2010| 21|
|Zimbabwe             |Zimbabwe (Rhodesia)                     | 552|  552|     1965|     2010| 46|

```
## Changing the name of the original country column from country_name to anrr_country...
```

```
## Ensuring year column is numeric...
```

```
## Changing the name of the original code column from wbcode to anrr_wbcode...
```

```r
stopifnot(identical(anrr,tar_read(anrr, store = here::here("_targets"))))
stopifnot(identical(anrr, democracyData::anrr))
```

## Arat


```r
cite_dataset("arat")
```

[1] Z. F. Arat. _Democracy and human rights in developing countries_.
Boulder: Lynne Rienner Publishers, 1991.

```r
arat_pmm <- extract_pmm_var(pmm_replication, pmm_arat, 
                            include_in_output = include_in_output)

stopifnot(identical(arat_pmm,tar_read(arat_pmm, store = here::here("_targets"))))
stopifnot(identical(arat_pmm, democracyData::arat_pmm))
```

## BLM


```r
cite_dataset("blm")
```

[1] K. Bowman, F. Lehoucq, and J. Mahoney. "Measuring Political
Democracy: Case Expertise, Data Adequacy, and Central America". In:
_Comparative Political Studies_ 38.8 (2005), pp. 939-970. DOI:
10.1177/0010414005277083.

```r
# Expired certificate
# blm <- redownload_blm(verbose = verbose,
#                       include_in_output = include_in_output)

blm_pmm <- extract_pmm_var(pmm_replication, pmm_blm,
                           include_in_output = include_in_output)

# usethis::use_data(blm, overwrite = TRUE)

stopifnot(identical(blm_pmm,tar_read(blm_pmm, store = here::here("_targets"))))
stopifnot(identical(blm_pmm, democracyData::blm_pmm))
```

# BMR (Boix Miller Rosato)


```r
cite_dataset("bmr")
```

[1] C. Boix, M. Miller, and S. Rosato. "A Complete Dataset of Political
Regimes, 1800-2007". In: _Comparative Political Studies_ 46.12 (2012),
pp. 1523-1554. DOI: 10.1177/0010414012463905.

```r
bmr <- redownload_bmr(verbose = verbose, 
                      include_in_output = include_in_output)
```

```
## Downloading BMR data...
```

```
## Trying https://drive.google.com/u/0/uc?id=1P9fBqJejGktGLlRMSDgTkjyKMnVFcXac&export=download ...
```

```
## Rows: 19775 Columns: 11
## ── Column specification ────────────────────────────────────────────────────────
## Delimiter: ","
## chr (3): country, abbreviation, abbreviation_undp
## dbl (8): ccode, year, democracy, democracy_trans, democracy_breakdowns, demo...
## 
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
## The downloaded BMR dataset has 19775 rows
## 
## Original dataset has 19775 rows.
## 
## Processing the BMR data - adding state system info, fixing bad ccode...
## 
## The following different countries/country codes match to a single country unit in the destination system:
```



|country               | ccode|extended_country_name | GWn| cown| min_date| max_date|  n|
|:---------------------|-----:|:---------------------|---:|----:|--------:|--------:|--:|
|YUGOSLAVIA            |   345|Yugoslavia            | 345|  345|     1991|     1991|  1|
|YUGOSLAVIA, FED. REP. |   347|Yugoslavia            | 345|  345|     1991|     1991|  1|

```
## The following country names are different in the destination system:
```



|country                    | ccode|extended_country_name                   | GWn| cown| min_date| max_date|   n|
|:--------------------------|-----:|:---------------------------------------|---:|----:|--------:|--------:|---:|
|ANTIGUA                    |    58|Antigua & Barbuda                       |  58|   58|     1982|     2020|  39|
|BELARUS                    |   370|Belarus (Byelorussia)                   | 370|  370|     1991|     2020|  30|
|BOSNIA                     |   346|Bosnia-Herzegovina                      | 346|  346|     1992|     2020|  29|
|BURKINA FASO               |   439|Burkina Faso (Upper Volta)              | 439|  439|     1960|     2020|  61|
|CAMBODIA                   |   811|Cambodia (Kampuchea)                    | 811|  811|     1949|     2020|  72|
|CENTRAL AFRICAN REP.       |   482|Central African Republic                | 482|  482|     1960|     2020|  61|
|CENTRAL AMERICAN UNION     |    89|United Provinces of Central America     |  89|   NA|     1824|     1838|  15|
|CONGO, DEM. REP.           |   490|Congo, Democratic Republic of (Zaire)   | 490|  490|     1960|     2020|  61|
|CONGO, REP.                |   484|Congo                                   | 484|  484|     1960|     2020|  61|
|ETHIOPIA  (INCL. ERIT)     |   530|Ethiopia                                | 530|  530|     1952|     1992|  41|
|GERMANY                    |   255|German Federal Republic                 | 260|  255|     1945|     2020|  32|
|GERMANY                    |   255|Germany (Prussia)                       | 255|  255|     1800|     1944| 145|
|GERMANY, EAST              |   265|German Democratic Republic              | 265|  265|     1945|     1990|  46|
|GERMANY, WEST              |   260|German Federal Republic                 | 260|  260|     1945|     1990|  46|
|IRAN                       |   630|Iran (Persia)                           | 630|  630|     1800|     2020| 221|
|ITALY                      |   325|Italy/Sardinia                          | 325|  325|     1861|     2020| 160|
|KOREA, NORTH               |   731|Korea, People's Republic of             | 731|  731|     1948|     2020|  73|
|KOREA, SOUTH               |   732|Korea, Republic of                      | 732|  732|     1948|     2020|  73|
|KYRGYZSTAN                 |   703|Kyrgyz Republic                         | 703|  703|     1991|     2020|  30|
|LIECHSTENSTEIN             |   223|Liechtenstein                           | 223|  223|     1991|     2020|  30|
|MACEDONIA                  |   343|Macedonia (Former Yugoslav Republic of) | 343|  343|     1991|     2020|  30|
|MADAGASCAR                 |   580|Madagascar (Malagasy)                   | 580|  580|     1960|     2020|  61|
|MICRONESIA, FED.           |   987|Federated States of Micronesia          | 987|  987|     1992|     2020|  29|
|MYANMAR                    |   775|Myanmar (Burma)                         | 775|  775|     1948|     2020|  73|
|PAKISTAN  (INCL. BANGLAD.) |   769|Pakistan                                | 770|  770|     1947|     1971|  25|
|RUSSIA                     |   365|Russia (Soviet Union)                   | 365|  365|     1800|     2020| 151|
|SAMOA (WESTERN)            |   990|Samoa/Western Samoa                     | 990|  990|     1962|     2020|  59|
|SAO TOME & PRINCIPE        |   403|Sao Tome and Principe                   | 403|  403|     1976|     2020|  45|
|SARDINIA                   |   324|Italy/Sardinia                          | 325|  325|     1815|     1860|  46|
|SICILY                     |   329|Sicily (Two Sicilies)                   | 329|  329|     1816|     1860|  45|
|SRI LANKA                  |   780|Sri Lanka (Ceylon)                      | 780|  780|     1948|     2020|  73|
|ST. KITTS & NEVIS          |    60|Saint Kitts and Nevis                   |  60|   60|     1984|     2020|  37|
|ST. LUCIA                  |    56|Saint Lucia                             |  56|   56|     1979|     2020|  42|
|ST. VINCENT & GREN.        |    57|Saint Vincent and the Grenadines        |  57|   57|     1979|     2020|  42|
|SUDAN, NORTH               |   624|Sudan                                   | 625|  625|     2011|     2020|  10|
|SUDAN, SOUTH               |   525|South Sudan                             | 626|  626|     2011|     2020|  10|
|SURINAME                   |   115|Surinam                                 | 115|  115|     1975|     2020|  46|
|TANZANIA                   |   510|Tanzania/Tanganyika                     | 510|  510|     1961|     2020|  60|
|TRINIDAD & TOBAGO          |    52|Trinidad and Tobago                     |  52|   52|     1962|     2020|  59|
|TURKEY                     |   640|Turkey (Ottoman Empire)                 | 640|  640|     1800|     2020| 221|
|USSR                       |   364|Russia (Soviet Union)                   | 365|  365|     1922|     1991|  70|
|VIETNAM                    |   818|Vietnam, Democratic Republic of         | 816|  816|     1976|     2020|  45|
|VIETNAM, NORTH             |   816|Vietnam, Democratic Republic of         | 816|  816|     1954|     1975|  22|
|VIETNAM, SOUTH             |   817|Vietnam, Republic of                    | 817|  817|     1955|     1975|  21|
|YEMEN                      |   679|Yemen (Arab Republic of Yemen)          | 678|  679|     1990|     2020|  31|
|YEMEN, NORTH               |   678|Yemen (Arab Republic of Yemen)          | 678|  678|     1918|     1989|  72|
|YEMEN, SOUTH               |   680|Yemen, People's Republic of             | 680|  680|     1967|     1989|  23|
|YUGOSLAVIA, FED. REP.      |   347|Yugoslavia                              | 345|  345|     1991|     2006|  16|
|ZIMBABWE                   |   552|Zimbabwe (Rhodesia)                     | 552|  552|     1923|     2020|  98|

```
## Resulting dataset after processing has 19775 rows.
## Changing the name of the original country column from country to bmr_country...
## Ensuring year column is numeric...
## Changing the name of the original code column from ccode to bmr_ccode...
```

```r
stopifnot(identical(bmr,tar_read(bmr, store = here::here("_targets"))))
stopifnot(identical(bmr, democracyData::bmr))
```

# BNR

Redownload not fixable - 


```r
cite_dataset("bnr")
```

[1] M. Bernhard, T. Nordstrom, and C. Reenock. "Economic Performance,
Institutional Intermediation, and Democratic Survival". In: _Journal of
Politics_ 63.3 (2001), pp. 775-803. DOI: 10.1111/0022-3816.00087.

```r
# bnr <- redownload_bnr(include_in_output = include_in_output, extend = FALSE)
# 
# bnr_extended <- redownload_bnr(include_in_output = include_in_output, extend = TRUE)
# 
# anti_join(bnr_extended, bnr %>% select(-bnr_country)) %>%
#         group_by(bnr_country) %>%
#         arrange(bnr_country, cown, year) %>%
#         mutate(period = count_sequence_breaks(year)) %>%
#         group_by(bnr_country, bnr, period) %>%
#         summarise(min= min(year), max = max(year)) %>%
#   knitr::kable()
# 
# anti_join(bnr %>% select(-bnr_country), bnr_extended) %>%
#   knitr::kable()
```

# BTI


```r
cite_dataset("bti")
```

[1] Bertelsmann Stiftung. _Transformation Index of the Bertelsmann
Stiftung 2022_. Tech. rep. Bertelsmann Stiftung, 2022.

```r
bti <- redownload_bti(verbose = verbose, 
                      include_in_output = include_in_output)
```

```
## The downloaded BTI dataset has 137 rows
## The downloaded BTI dataset has 137 rows
## The downloaded BTI dataset has 137 rows
## The downloaded BTI dataset has 137 rows
## The downloaded BTI dataset has 137 rows
## The downloaded BTI dataset has 137 rows
## The downloaded BTI dataset has 137 rows
## The downloaded BTI dataset has 137 rows
## The downloaded BTI dataset has 137 rows
```

```
## Original dataset has 1233 rows.
```

```
## Processing the BTI data - adding state system info, regions...
```

```
## The following country names are different in the destination system:
```



|country                |extended_country_name                   | GWn| cown| min_date| max_date|  n|
|:----------------------|:---------------------------------------|---:|----:|--------:|--------:|--:|
|Belarus                |Belarus (Byelorussia)                   | 370|  370|     2004|     2020|  9|
|Bosnia and Herzegovina |Bosnia-Herzegovina                      | 346|  346|     2004|     2020|  9|
|Burkina Faso           |Burkina Faso (Upper Volta)              | 439|  439|     2004|     2020|  9|
|Cambodia               |Cambodia (Kampuchea)                    | 811|  811|     2004|     2020|  9|
|Congo, DR              |Congo, Democratic Republic of (Zaire)   | 490|  490|     2004|     2020|  9|
|Congo, Rep.            |Congo                                   | 484|  484|     2004|     2020|  9|
|Côte d'Ivoire          |Cote D'Ivoire                           | 437|  437|     2004|     2020|  9|
|Eswatini               |Swaziland                               | 572|  572|     2004|     2020|  9|
|Iran                   |Iran (Persia)                           | 630|  630|     2004|     2020|  9|
|Kyrgyzstan             |Kyrgyz Republic                         | 703|  703|     2004|     2020|  9|
|Madagascar             |Madagascar (Malagasy)                   | 580|  580|     2004|     2020|  9|
|Myanmar                |Myanmar (Burma)                         | 775|  775|     2004|     2020|  9|
|North Korea            |Korea, People's Republic of             | 731|  731|     2004|     2020|  9|
|North Macedonia        |Macedonia (Former Yugoslav Republic of) | 343|  343|     2004|     2020|  9|
|Russia                 |Russia (Soviet Union)                   | 365|  365|     2004|     2020|  9|
|Serbia                 |Yugoslavia                              | 345|  345|     2004|     2004|  1|
|South Korea            |Korea, Republic of                      | 732|  732|     2004|     2020|  9|
|Sri Lanka              |Sri Lanka (Ceylon)                      | 780|  780|     2004|     2020|  9|
|Tanzania               |Tanzania/Tanganyika                     | 510|  510|     2004|     2020|  9|
|Timor-Leste            |East Timor                              | 860|  860|     2004|     2020|  9|
|Turkey                 |Turkey (Ottoman Empire)                 | 640|  640|     2004|     2020|  9|
|Vietnam                |Vietnam, Democratic Republic of         | 816|  816|     2004|     2020|  9|
|Yemen                  |Yemen (Arab Republic of Yemen)          | 678|  679|     2004|     2020|  9|
|Zimbabwe               |Zimbabwe (Rhodesia)                     | 552|  552|     2004|     2020|  9|

```
## Resulting dataset after processing has 1233 rows.
```

```
## Changing the name of the original country column from country to bti_country...
```

```
## Ensuring year column is numeric...
```

```r
stopifnot(identical(bti, tar_read(bti, store = here::here("_targets"))))
stopifnot(identical(bti, democracyData::bti))
```

# Bollen


```r
cite_dataset("bollen")
```

[1] K. A. Bollen. _Cross-National Indicators of Liberal Democracy,
1950-1990_. Data set. 2001.

[2] K. Bollen and P. Paxton. "Subjective Measures of Liberal
Democracy". In: _Comparative Political Studies_ 33.1 (2000), pp. 58-86.
DOI: 10.1177/0010414000033001003.

```r
bollen_pmm <- extract_pmm_var(pmm_replication, pmm_bollen,
                              include_in_output = include_in_output)

stopifnot(identical(bollen_pmm, tar_read(bollen_pmm, store = here::here("_targets"))))
stopifnot(identical(bollen_pmm, democracyData::bollen_pmm))
```

# Doorenspleet


```r
cite_dataset("doorenspleet")
```

[1] R. Doorenspleet. "Reassessing the Three Waves of Democratization".
In: _World Politics_ 52.03 (2000), pp. 384-406. DOI:
10.1017/S0043887100016580.

```r
doorenspleet <- prepare_doorenspleet(path = here::here("data-raw/Doorenspleet data.csv"),
                                     verbose = verbose, 
                                     include_in_output = include_in_output)
```

```
## Preparing Doorenspleet data...
```

```
## Trying C:/Users/marquexa/Dropbox/Rpackages/democracyData/data-raw/Doorenspleet data.csv ...
```

```
## Rows: 667 Columns: 4
## ── Column specification ────────────────────────────────────────────────────────
## Delimiter: ","
## chr (2): country, regime
## dbl (2): start_year, end_year
## 
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
## Original dataset has 667 rows but is not in country-year format
## 
## Processing the Doorenspleet data - turning to country-year format, adding state system info...
## 
## The following country names are different in the destination system:
```



|country                               |extended_country_name                   | GWn| cown| min_date| max_date|   n|
|:-------------------------------------|:---------------------------------------|---:|----:|--------:|--------:|---:|
|Belarus                               |Belarus (Byelorussia)                   | 370|  370|     1991|     1994|   4|
|Bosnia                                |Bosnia-Herzegovina                      | 346|  346|     1992|     1994|   3|
|Burkina Faso                          |Burkina Faso (Upper Volta)              | 439|  439|     1960|     1994|  35|
|Cambodia                              |Cambodia (Kampuchea)                    | 811|  811|     1950|     1994|  45|
|Democratic People’s Republic of Korea |Korea, People's Republic of             | 731|  731|     1948|     1994|  47|
|Democratic Republic of Vietnam        |Vietnam, Democratic Republic of         | 816|  816|     1954|     1994|  41|
|Germany                               |German Federal Republic                 | 260|  255|     1990|     1994|   5|
|Germany                               |German Federal Republic                 | 260|  260|     1945|     1989|  45|
|Germany                               |Germany (Prussia)                       | 255|  255|     1800|     1944| 145|
|Gran Colombia                         |Great Colombia                          |  99|   NA|     1821|     1830|  10|
|Iran                                  |Iran (Persia)                           | 630|  630|     1800|     1994| 195|
|Italy                                 |Italy/Sardinia                          | 325|  325|     1861|     1994| 134|
|Ivory Coast                           |Cote D'Ivoire                           | 437|  437|     1960|     1994|  35|
|Korea                                 |Korea, Republic of                      | 732|  732|     1910|     1910|   1|
|Kyrgyzstan                            |Kyrgyz Republic                         | 703|  703|     1991|     1994|   4|
|Macedonia                             |Macedonia (Former Yugoslav Republic of) | 343|  343|     1991|     1994|   4|
|Madagascar                            |Madagascar (Malagasy)                   | 580|  580|     1961|     1994|  34|
|Republic of Korea                     |Korea, Republic of                      | 732|  732|     1948|     1994|  47|
|Russia                                |Russia (Soviet Union)                   | 365|  365|     1800|     1994| 195|
|Sardinia                              |Italy/Sardinia                          | 325|  325|     1815|     1860|  46|
|South Vietnam                         |Vietnam, Republic of                    | 817|  817|     1955|     1975|  21|
|Sri Lanka                             |Sri Lanka (Ceylon)                      | 780|  780|     1948|     1994|  47|
|Tanzania                              |Tanzania/Tanganyika                     | 510|  510|     1963|     1994|  32|
|Trinidad                              |Trinidad and Tobago                     |  52|   52|     1962|     1994|  33|
|Turkey                                |Turkey (Ottoman Empire)                 | 640|  640|     1800|     1994| 195|
|Two Sicilies                          |Sicily (Two Sicilies)                   | 329|  329|     1816|     1860|  45|
|United Arabic Emirates                |United Arab Emirates                    | 696|  696|     1971|     1994|  24|
|Wurttemburg                           |Wurttemberg                             | 271|  271|     1800|     1871|  72|
|Yemen                                 |Yemen (Arab Republic of Yemen)          | 678|  679|     1990|     1994|   5|
|Yemen Arab Republic                   |Yemen (Arab Republic of Yemen)          | 678|  678|     1918|     1989|  72|
|Yemen People’s Republic               |Yemen, People's Republic of             | 680|  680|     1967|     1989|  23|
|Zaire                                 |Congo, Democratic Republic of (Zaire)   | 490|  490|     1960|     1994|  35|
|Zimbabwe                              |Zimbabwe (Rhodesia)                     | 552|  552|     1923|     1994|  72|

```
## Resulting dataset after processing has 13877 rows.
## Note: the number of rows in the processed data is different from the number of rows in the original data.
## Changing the name of the original country column from country to doorenspleet_country...
## Ensuring year column is numeric...
```

```r
stopifnot(identical(doorenspleet, tar_read(doorenspleet, store = here::here("_targets"))))
stopifnot(identical(doorenspleet, democracyData::doorenspleet))
```

# WGI


```r
cite_dataset("wgi")
```

[1] D. Kaufmann and A. Kraay. _Worldwide Governance Indicators_. 2020.
<http://www.govindicators.org>.

```r
wgi <- download_wgi_voice_and_accountability(verbose = verbose, 
                                             include_in_output = include_in_output)
```

```
## Original dataset has 214 rows, but is not in country-year format
```

```
## Processing the WGI data - putting it in country-year format, adding state system info...
```

```
## The following country names are different in the destination system:
```



|wb_country                     |wb_code |extended_country_name                   | GWn| cown| min_date| max_date|  n|
|:------------------------------|:-------|:---------------------------------------|---:|----:|--------:|--------:|--:|
|Antigua and Barbuda            |ATG     |Antigua & Barbuda                       |  58|   58|     1996|     2021| 23|
|Bahamas, The                   |BHS     |Bahamas                                 |  31|   31|     1996|     2021| 23|
|Belarus                        |BLR     |Belarus (Byelorussia)                   | 370|  370|     1996|     2021| 23|
|Bosnia and Herzegovina         |BIH     |Bosnia-Herzegovina                      | 346|  346|     1996|     2021| 23|
|Brunei Darussalam              |BRN     |Brunei                                  | 835|  835|     1996|     2021| 23|
|Burkina Faso                   |BFA     |Burkina Faso (Upper Volta)              | 439|  439|     1996|     2021| 23|
|Cambodia                       |KHM     |Cambodia (Kampuchea)                    | 811|  811|     1996|     2021| 23|
|Congo, Dem. Rep.               |ZAR     |Congo, Democratic Republic of (Zaire)   | 490|  490|     1996|     2021| 23|
|Congo, Rep.                    |COG     |Congo                                   | 484|  484|     1996|     2021| 23|
|Côte d'Ivoire                  |CIV     |Cote D'Ivoire                           | 437|  437|     1996|     2021| 23|
|Egypt, Arab Rep.               |EGY     |Egypt                                   | 651|  651|     1996|     2021| 23|
|Eswatini                       |SWZ     |Swaziland                               | 572|  572|     1996|     2021| 23|
|Gambia, The                    |GMB     |Gambia                                  | 420|  420|     1996|     2021| 23|
|Germany                        |DEU     |German Federal Republic                 | 260|  255|     1996|     2021| 23|
|Hong Kong SAR, China           |HKG     |Hong Kong                               |  NA|   NA|     1996|     2021| 23|
|Iran, Islamic Rep.             |IRN     |Iran (Persia)                           | 630|  630|     1996|     2021| 23|
|Italy                          |ITA     |Italy/Sardinia                          | 325|  325|     1996|     2021| 23|
|Jersey, Channel Islands        |JEY     |Jersey                                  |  NA|   NA|     2011|     2021| 11|
|Korea, Dem. Rep.               |PRK     |Korea, People's Republic of             | 731|  731|     1996|     2021| 23|
|Korea, Rep.                    |KOR     |Korea, Republic of                      | 732|  732|     1996|     2021| 23|
|Lao PDR                        |LAO     |Laos                                    | 812|  812|     1996|     2021| 23|
|Macao SAR, China               |MAC     |Macao                                   |  NA|   NA|     1996|     2021| 23|
|Madagascar                     |MDG     |Madagascar (Malagasy)                   | 580|  580|     1996|     2021| 23|
|Micronesia, Fed. Sts.          |FSM     |Federated States of Micronesia          | 987|  987|     1996|     2021| 23|
|Myanmar                        |MMR     |Myanmar (Burma)                         | 775|  775|     1996|     2021| 23|
|Netherlands Antilles (former)  |ANT     |Netherlands Antilles                    |  NA|   NA|     2004|     2013| 10|
|North Macedonia                |MKD     |Macedonia (Former Yugoslav Republic of) | 343|  343|     1996|     2021| 23|
|Russian Federation             |RUS     |Russia (Soviet Union)                   | 365|  365|     1996|     2021| 23|
|Réunion                        |REU     |Reunion                                 |  NA|   NA|     2004|     2013| 10|
|Samoa                          |WSM     |Samoa/Western Samoa                     | 990|  990|     1996|     2021| 23|
|Serbia                         |SRB     |Yugoslavia                              | 345|  345|     1996|     2005|  7|
|Slovak Republic                |SVK     |Slovakia                                | 317|  317|     1996|     2021| 23|
|Sri Lanka                      |LKA     |Sri Lanka (Ceylon)                      | 780|  780|     1996|     2021| 23|
|St. Kitts and Nevis            |KNA     |Saint Kitts and Nevis                   |  60|   60|     1996|     2021| 23|
|St. Lucia                      |LCA     |Saint Lucia                             |  56|   56|     1996|     2021| 23|
|St. Vincent and the Grenadines |VCT     |Saint Vincent and the Grenadines        |  57|   57|     1996|     2021| 23|
|Suriname                       |SUR     |Surinam                                 | 115|  115|     1996|     2021| 23|
|Syrian Arab Republic           |SYR     |Syria                                   | 652|  652|     1996|     2021| 23|
|São Tomé and Principe          |STP     |Sao Tome and Principe                   | 403|  403|     1996|     2021| 23|
|Taiwan, China                  |TWN     |Taiwan                                  | 713|  713|     1996|     2021| 23|
|Tanzania                       |TZA     |Tanzania/Tanganyika                     | 510|  510|     1996|     2021| 23|
|Timor-Leste                    |TMP     |East Timor                              | 860|  860|     1996|     2021| 23|
|Türkiye                        |TUR     |Turkey (Ottoman Empire)                 | 640|  640|     1996|     2021| 23|
|United States                  |USA     |United States of America                |   2|    2|     1996|     2021| 23|
|Venezuela, RB                  |VEN     |Venezuela                               | 101|  101|     1996|     2021| 23|
|Vietnam                        |VNM     |Vietnam, Democratic Republic of         | 816|  816|     1996|     2021| 23|
|Virgin Islands (U.S.)          |VIR     |Virgin Islands, U.S.                    |  NA|   NA|     2004|     2013| 10|
|West Bank and Gaza             |WBG     |Palestine, State of                     |  NA|   NA|     1996|     2021| 23|
|Yemen, Rep.                    |YEM     |Yemen (Arab Republic of Yemen)          | 678|  679|     1996|     2021| 23|
|Zimbabwe                       |ZWE     |Zimbabwe (Rhodesia)                     | 552|  552|     1996|     2021| 23|

```r
stopifnot(identical(wgi, tar_read(wgi, store = here::here("_targets"))))
stopifnot(identical(wgi, democracyData::wgi))
```

# EIU


```r
cite_dataset("eiu")
```

[1] The Economist Intelligence Unit. _Democracy Index 2022: Frontline
democracy and the battle for Ukraine_. Tech. rep. The Economist
Intelligence Unit, 2023.

```r
eiu <- prepare_eiu(path = here::here("data-raw/DI-final-version-report-2022.pdf"),
                   verbose = verbose, include_in_output = include_in_output)
```

```
## Preparing EIU data...
```

```
## Trying C:/Users/marquexa/Dropbox/Rpackages/democracyData/data-raw/DI-final-version-report-2022.pdf ...
```

```
## Original dataset has 2505 rows and is in country-year format
```

```
## Processing the EIU data - adding state system info...
```

```
## The following country names are different in the destination system:
```



|country                      |extended_country_name                   | GWn| cown| min_date| max_date|  n|
|:----------------------------|:---------------------------------------|---:|----:|--------:|--------:|--:|
|Belarus                      |Belarus (Byelorussia)                   | 370|  370|     2006|     2022| 15|
|Bosnia and Hercegovina       |Bosnia-Herzegovina                      | 346|  346|     2006|     2022| 15|
|Burkina Faso                 |Burkina Faso (Upper Volta)              | 439|  439|     2006|     2022| 15|
|Cabo Verde                   |Cape Verde                              | 402|  402|     2006|     2022| 15|
|Cambodia                     |Cambodia (Kampuchea)                    | 811|  811|     2006|     2022| 15|
|Congo (Brazzaville)          |Congo                                   | 484|  484|     2006|     2022| 15|
|Côte d’Ivoire                |Cote D'Ivoire                           | 437|  437|     2006|     2022| 15|
|Democratic Republic of Congo |Congo, Democratic Republic of (Zaire)   | 490|  490|     2006|     2022| 15|
|Germany                      |German Federal Republic                 | 260|  255|     2006|     2022| 15|
|Iran                         |Iran (Persia)                           | 630|  630|     2006|     2022| 15|
|Italy                        |Italy/Sardinia                          | 325|  325|     2006|     2022| 15|
|Madagascar                   |Madagascar (Malagasy)                   | 580|  580|     2006|     2022| 15|
|Myanmar                      |Myanmar (Burma)                         | 775|  775|     2006|     2022| 15|
|North Korea                  |Korea, People's Republic of             | 731|  731|     2006|     2022| 15|
|North Macedonia              |Macedonia (Former Yugoslav Republic of) | 343|  343|     2006|     2022| 15|
|Palestine                    |Palestine, State of                     |  NA|   NA|     2006|     2022| 15|
|Russia                       |Russia (Soviet Union)                   | 365|  365|     2006|     2022| 15|
|South Korea                  |Korea, Republic of                      | 732|  732|     2006|     2022| 15|
|Sri Lanka                    |Sri Lanka (Ceylon)                      | 780|  780|     2006|     2022| 15|
|Suriname                     |Surinam                                 | 115|  115|     2006|     2022| 15|
|Tanzania                     |Tanzania/Tanganyika                     | 510|  510|     2006|     2022| 15|
|Timor Leste                  |East Timor                              | 860|  860|     2006|     2022| 15|
|Turkey                       |Turkey (Ottoman Empire)                 | 640|  640|     2006|     2022| 15|
|UAE                          |United Arab Emirates                    | 696|  696|     2006|     2022| 15|
|UK                           |United Kingdom                          | 200|  200|     2006|     2022| 15|
|US                           |United States of America                |   2|    2|     2006|     2022| 15|
|Vietnam                      |Vietnam, Democratic Republic of         | 816|  816|     2006|     2022| 15|
|Yemen                        |Yemen (Arab Republic of Yemen)          | 678|  679|     2006|     2022| 15|
|Zimbabwe                     |Zimbabwe (Rhodesia)                     | 552|  552|     2006|     2022| 15|
|eSwatini                     |Swaziland                               | 572|  572|     2006|     2022| 15|

```
## Resulting dataset after processing has 2505 rows.
```

```
## Changing the name of the original country column from country to eiu_country...
```

```
## Ensuring year column is numeric...
```

```r
stopifnot(identical(eiu, tar_read(eiu, store = here::here("_targets"))))
stopifnot(identical(eiu, democracyData::eiu))
```

# Freedom House


```r
cite_dataset("fh")
```

[1] Freedom House. _Freedom in the World 2023: Marking 50 Years in the
Struggle for Democracy_. Tech. rep. Freedom House, 2023.
<https://freedomhouse.org/report/freedom-world/2023/marking-50-years>.

```r
fh <- download_fh(verbose = verbose,
                  include_in_output = include_in_output)
```

```
## Downloading  data...
```

```
## Trying https://freedomhouse.org/sites/default/files/2023-02/Country_and_Territory_Ratings_and_Statuses_FIW_1973-2023%20.xlsx ...
```

```
## The downloaded  dataset has 205 rows
```

```
## Original dataset has 205 rows, but is not in country-year format
```

```
## Processing the FH 2022 data - putting it in country-year format, adding state system info...
```

```
## Warning in download_fh(verbose = verbose, include_in_output =
## include_in_output): NAs introduced by coercion

## Warning in download_fh(verbose = verbose, include_in_output =
## include_in_output): NAs introduced by coercion
```

```
## The following country names are different in the destination system:
```



|country                        |extended_country_name                   | GWn| cown| min_date| max_date|  n|
|:------------------------------|:---------------------------------------|---:|----:|--------:|--------:|--:|
|Antigua and Barbuda            |Antigua & Barbuda                       |  58|   58|     1982|     2022| 41|
|Belarus                        |Belarus (Byelorussia)                   | 370|  370|     1991|     2022| 32|
|Bosnia and Herzegovina         |Bosnia-Herzegovina                      | 346|  346|     1992|     2022| 31|
|Burkina Faso                   |Burkina Faso (Upper Volta)              | 439|  439|     1972|     2022| 50|
|Cabo Verde                     |Cape Verde                              | 402|  402|     1975|     2022| 47|
|Cambodia                       |Cambodia (Kampuchea)                    | 811|  811|     1972|     2022| 50|
|Congo (Brazzaville)            |Congo                                   | 484|  484|     1972|     2022| 50|
|Congo (Kinshasa)               |Congo, Democratic Republic of (Zaire)   | 490|  490|     1972|     2022| 50|
|East Germany                   |German Democratic Republic              | 265|  265|     1972|     1989| 17|
|Eswatini                       |Swaziland                               | 572|  572|     1972|     2022| 50|
|Germany                        |German Federal Republic                 | 260|  255|     1990|     2022| 33|
|Germany, W.                    |German Federal Republic                 | 260|  260|     1972|     1989| 17|
|Iran                           |Iran (Persia)                           | 630|  630|     1972|     2022| 50|
|Italy                          |Italy/Sardinia                          | 325|  325|     1972|     2022| 50|
|Kyrgyzstan                     |Kyrgyz Republic                         | 703|  703|     1991|     2022| 32|
|Madagascar                     |Madagascar (Malagasy)                   | 580|  580|     1972|     2022| 50|
|Micronesia                     |Federated States of Micronesia          | 987|  987|     1991|     2022| 32|
|Myanmar                        |Myanmar (Burma)                         | 775|  775|     1972|     2022| 50|
|North Korea                    |Korea, People's Republic of             | 731|  731|     1972|     2022| 50|
|North Macedonia                |Macedonia (Former Yugoslav Republic of) | 343|  343|     1992|     2022| 31|
|Russia                         |Russia (Soviet Union)                   | 365|  365|     1991|     2022| 32|
|Samoa                          |Samoa/Western Samoa                     | 990|  990|     1972|     2022| 50|
|Serbia and Montenegro          |Yugoslavia                              | 345|  345|     2003|     2005|  3|
|South Korea                    |Korea, Republic of                      | 732|  732|     1972|     2022| 50|
|South Vietnam                  |Vietnam, Republic of                    | 817|  817|     1972|     1975|  4|
|South Yemen                    |Yemen, People's Republic of             | 680|  680|     1972|     1989| 17|
|Sri Lanka                      |Sri Lanka (Ceylon)                      | 780|  780|     1972|     2022| 50|
|St. Kitts and Nevis            |Saint Kitts and Nevis                   |  60|   60|     1983|     2022| 40|
|St. Lucia                      |Saint Lucia                             |  56|   56|     1979|     2022| 43|
|St. Vincent and the Grenadines |Saint Vincent and the Grenadines        |  57|   57|     1979|     2022| 43|
|Suriname                       |Surinam                                 | 115|  115|     1975|     2022| 47|
|Tanzania                       |Tanzania/Tanganyika                     | 510|  510|     1972|     2022| 50|
|The Gambia                     |Gambia                                  | 420|  420|     1972|     2022| 50|
|Timor-Leste                    |East Timor                              | 860|  860|     1999|     2022| 24|
|Turkey                         |Turkey (Ottoman Empire)                 | 640|  640|     1972|     2022| 50|
|USSR                           |Russia (Soviet Union)                   | 365|  365|     1972|     1990| 18|
|United States                  |United States of America                |   2|    2|     1972|     2022| 50|
|Vietnam                        |Vietnam, Democratic Republic of         | 816|  816|     1976|     2022| 46|
|Vietnam, N.                    |Vietnam, Democratic Republic of         | 816|  816|     1972|     1975|  4|
|Yemen                          |Yemen (Arab Republic of Yemen)          | 678|  679|     1990|     2022| 33|
|Yemen, N.                      |Yemen (Arab Republic of Yemen)          | 678|  678|     1972|     1989| 17|
|Zimbabwe                       |Zimbabwe (Rhodesia)                     | 552|  552|     1972|     2022| 50|

```
## Resulting dataset after processing has 9045 rows.
```

```
## Changing the name of the original country column from country to fh_country...
```

```
## Ensuring year column is numeric...
```

```r
fh_with_territories <- download_fh(verbose = verbose,
                                   include_in_output = include_in_output,
                                   include_territories = TRUE)
```

```
## Downloading  data...
```

```
## Trying https://freedomhouse.org/sites/default/files/2023-02/Country_and_Territory_Ratings_and_Statuses_FIW_1973-2023%20.xlsx ...
```

```
## The downloaded  dataset has 205 rows
```

```
## Downloading  data...
```

```
## Trying https://freedomhouse.org/sites/default/files/2023-02/Country_and_Territory_Ratings_and_Statuses_FIW_1973-2023%20.xlsx ...
```

```
## The downloaded  dataset has 25 rows
```

```
## Original dataset has 230 rows, but is not in country-year format
```

```
## Processing the FH 2022 data - putting it in country-year format, adding state system info...
```

```
## Warning in download_fh(verbose = verbose, include_in_output =
## include_in_output, : NAs introduced by coercion
```

```
## Warning in download_fh(verbose = verbose, include_in_output =
## include_in_output, : NAs introduced by coercion
```

```
## The following different countries/country codes match to a single country unit in the destination system:
```



|country    |extended_country_name | GWn| cown| min_date| max_date|  n|
|:----------|:---------------------|---:|----:|--------:|--------:|--:|
|Gaza Strip |Palestine, State of   |  NA|   NA|     2010|     2022| 13|
|West Bank  |Palestine, State of   |  NA|   NA|     2010|     2022| 13|

```
## The following country and/or code-years were not matched:
```



|country           |extended_country_name | GWn| cown| min_date| max_date|  n|
|:-----------------|:---------------------|---:|----:|--------:|--------:|--:|
|Chechnya          |NA                    |  NA|   NA|     1998|     2008| 11|
|Crimea            |NA                    |  NA|   NA|     2014|     2022|  9|
|Eastern Donbas    |NA                    |  NA|   NA|     2019|     2022|  4|
|Indian Kashmir    |NA                    |  NA|   NA|     1990|     2022| 33|
|Kurdistan         |NA                    |  NA|   NA|     1992|     2003| 12|
|Nagorno-Karabakh  |NA                    |  NA|   NA|     1993|     2022| 30|
|Northern Cyprus   |NA                    |  NA|   NA|     1982|     2022| 41|
|Northern Ireland  |NA                    |  NA|   NA|     2000|     2003|  4|
|Pakistani Kashmir |NA                    |  NA|   NA|     2002|     2022| 21|
|Transnistria      |NA                    |  NA|   NA|     1996|     2022| 27|
|West Papua        |NA                    |  NA|   NA|     2000|     2003|  4|

```
## The following country names are different in the destination system:
```



|country                                        |extended_country_name                   | GWn| cown| min_date| max_date|  n|
|:----------------------------------------------|:---------------------------------------|---:|----:|--------:|--------:|--:|
|Antigua and Barbuda                            |Antigua & Barbuda                       |  58|   58|     1982|     2022| 41|
|Belarus                                        |Belarus (Byelorussia)                   | 370|  370|     1991|     2022| 32|
|Bosnia and Herzegovina                         |Bosnia-Herzegovina                      | 346|  346|     1992|     2022| 31|
|Burkina Faso                                   |Burkina Faso (Upper Volta)              | 439|  439|     1972|     2022| 50|
|Cabo Verde                                     |Cape Verde                              | 402|  402|     1975|     2022| 47|
|Cambodia                                       |Cambodia (Kampuchea)                    | 811|  811|     1972|     2022| 50|
|Congo (Brazzaville)                            |Congo                                   | 484|  484|     1972|     2022| 50|
|Congo (Kinshasa)                               |Congo, Democratic Republic of (Zaire)   | 490|  490|     1972|     2022| 50|
|East Germany                                   |German Democratic Republic              | 265|  265|     1972|     1989| 17|
|Eswatini                                       |Swaziland                               | 572|  572|     1972|     2022| 50|
|Gaza Strip                                     |Palestine, State of                     |  NA|   NA|     2010|     2022| 13|
|Germany                                        |German Federal Republic                 | 260|  255|     1990|     2022| 33|
|Germany, W.                                    |German Federal Republic                 | 260|  260|     1972|     1989| 17|
|Iran                                           |Iran (Persia)                           | 630|  630|     1972|     2022| 50|
|Israeli-Occupied Territories                   |Israel, occupied territories only       |  NA|   NA|     1996|     2009| 14|
|Italy                                          |Italy/Sardinia                          | 325|  325|     1972|     2022| 50|
|Kyrgyzstan                                     |Kyrgyz Republic                         | 703|  703|     1991|     2022| 32|
|Madagascar                                     |Madagascar (Malagasy)                   | 580|  580|     1972|     2022| 50|
|Micronesia                                     |Federated States of Micronesia          | 987|  987|     1991|     2022| 32|
|Myanmar                                        |Myanmar (Burma)                         | 775|  775|     1972|     2022| 50|
|North Korea                                    |Korea, People's Republic of             | 731|  731|     1972|     2022| 50|
|North Macedonia                                |Macedonia (Former Yugoslav Republic of) | 343|  343|     1992|     2022| 31|
|Palestinian Authority-Administered Territories |Palestine, State of                     |  NA|   NA|     1996|     2009| 14|
|Russia                                         |Russia (Soviet Union)                   | 365|  365|     1991|     2022| 32|
|Samoa                                          |Samoa/Western Samoa                     | 990|  990|     1972|     2022| 50|
|Serbia and Montenegro                          |Yugoslavia                              | 345|  345|     2003|     2005|  3|
|South Korea                                    |Korea, Republic of                      | 732|  732|     1972|     2022| 50|
|South Vietnam                                  |Vietnam, Republic of                    | 817|  817|     1972|     1975|  4|
|South Yemen                                    |Yemen, People's Republic of             | 680|  680|     1972|     1989| 17|
|Sri Lanka                                      |Sri Lanka (Ceylon)                      | 780|  780|     1972|     2022| 50|
|St. Kitts and Nevis                            |Saint Kitts and Nevis                   |  60|   60|     1983|     2022| 40|
|St. Lucia                                      |Saint Lucia                             |  56|   56|     1979|     2022| 43|
|St. Vincent and the Grenadines                 |Saint Vincent and the Grenadines        |  57|   57|     1979|     2022| 43|
|Suriname                                       |Surinam                                 | 115|  115|     1975|     2022| 47|
|Tanzania                                       |Tanzania/Tanganyika                     | 510|  510|     1972|     2022| 50|
|The Gambia                                     |Gambia                                  | 420|  420|     1972|     2022| 50|
|Timor-Leste                                    |East Timor                              | 860|  860|     1999|     2022| 24|
|Turkey                                         |Turkey (Ottoman Empire)                 | 640|  640|     1972|     2022| 50|
|USSR                                           |Russia (Soviet Union)                   | 365|  365|     1972|     1990| 18|
|United States                                  |United States of America                |   2|    2|     1972|     2022| 50|
|Vietnam                                        |Vietnam, Democratic Republic of         | 816|  816|     1976|     2022| 46|
|Vietnam, N.                                    |Vietnam, Democratic Republic of         | 816|  816|     1972|     1975|  4|
|West Bank                                      |Palestine, State of                     |  NA|   NA|     2010|     2022| 13|
|West Bank and Gaza Strip                       |Palestine, State of                     |  NA|   NA|     1977|     1995| 18|
|Yemen                                          |Yemen (Arab Republic of Yemen)          | 678|  679|     1990|     2022| 33|
|Yemen, N.                                      |Yemen (Arab Republic of Yemen)          | 678|  678|     1972|     1989| 17|
|Zimbabwe                                       |Zimbabwe (Rhodesia)                     | 552|  552|     1972|     2022| 50|

```
## Resulting dataset after processing has 9547 rows.
```

```
## Changing the name of the original country column from country to fh_country...
```

```
## Ensuring year column is numeric...
```

```r
fh_electoral <- download_fh_electoral(verbose = verbose,
                                      include_in_output = include_in_output)
```

```
## Downloading /FH_Electoral_Democracies_1988-2016.xls data...
```

```
## Trying https://freedomhouse.org/sites/default/files/FIW2017_Data.zip ...
```

```
## The files in the archive are:
```

 [1] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/FIW2017_Data/.DS_Store"                                                             
 [2] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/__MACOSX/FIW2017_Data/._.DS_Store"                                                  
 [3] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/FIW2017_Data/FH_Country_and_Territory_Ratings_and_Statuses_1972-2016.xls"           
 [4] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/__MACOSX/FIW2017_Data/._FH_Country_and_Territory_Ratings_and_Statuses_1972-2016.xls"
 [5] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/FIW2017_Data/FH_Country_Status_Distribution_1972-2016.xls"                          
 [6] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/__MACOSX/FIW2017_Data/._FH_Country_Status_Distribution_1972-2016.xls"               
 [7] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/FIW2017_Data/FH_Electoral_Democracies_1988-2016.xls"                                
 [8] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/__MACOSX/FIW2017_Data/._FH_Electoral_Democracies_1988-2016.xls"                     
 [9] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/FIW2017_Data/Subcategory_Scores_FIW2017.xlsx"                                       
[10] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/__MACOSX/FIW2017_Data/._Subcategory_Scores_FIW2017.xlsx"                            
[11] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/__MACOSX/._FIW2017_Data"                                                            

```
## Extracting C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/FIW2017_Data/FH_Electoral_Democracies_1988-2016.xls
```

```
## The downloaded /FH_Electoral_Democracies_1988-2016.xls dataset has 208 rows
```

```
## Downloading  data...
```

```
## Trying https://freedomhouse.org/sites/default/files/List%20of%20Electoral%20Democracies%20FIW%202018.xlsx ...
```

```
## The downloaded  dataset has 195 rows
```

```
## Downloading  data...
```

```
## Trying https://freedomhouse.org/sites/default/files/List_of_Electoral_Democracies_FIW19.xls ...
```

```
## The downloaded  dataset has 195 rows
```

```
## Downloading  data...
```

```
## Trying https://freedomhouse.org/sites/default/files/2020-02/2020_List_of_Electoral_Democracies_FIW_2020.xlsx ...
```

```
## The downloaded  dataset has 195 rows
```

```
## Downloading  data...
```

```
## Trying https://freedomhouse.org/sites/default/files/2022-03/List_of_Electoral_Democracies_FIW22.xlsx ...
```

```
## The downloaded  dataset has 195 rows
```

```
## Downloading  data...
```

```
## Trying https://freedomhouse.org/sites/default/files/2023-02/List_of_Electoral_Democracies_FIW23.xlsx ...
```

```
## The downloaded  dataset has 195 rows
```

```
## Original dataset has 1183 rows, but is not in country-year format
```

```
## Processing the FH Electoral Democracies 1989-2022 data - putting it in country-year format, adding state system info...
```

```
## The following different countries/country codes match to a single country unit in the destination system:
```



|country |extended_country_name | GWn| cown| min_date| max_date|  n|
|:-------|:---------------------|---:|----:|--------:|--------:|--:|
|Russia  |Russia (Soviet Union) | 365|  365|     1991|     1991|  1|
|USSR    |Russia (Soviet Union) | 365|  365|     1991|     1991|  1|

```
## The following country names are different in the destination system:
```



|country                        |extended_country_name                   | GWn| cown| min_date| max_date|  n|
|:------------------------------|:---------------------------------------|---:|----:|--------:|--------:|--:|
|Antigua and Barbuda            |Antigua & Barbuda                       |  58|   58|     2018|     2022|  5|
|Belarus                        |Belarus (Byelorussia)                   | 370|  370|     1991|     2022| 31|
|Bosnia and Herzegovina         |Bosnia-Herzegovina                      | 346|  346|     2018|     2022|  5|
|Burkina Faso                   |Burkina Faso (Upper Volta)              | 439|  439|     1989|     2022| 33|
|Cabo Verde                     |Cape Verde                              | 402|  402|     2020|     2022|  3|
|Cambodia                       |Cambodia (Kampuchea)                    | 811|  811|     1989|     2022| 33|
|Congo (Brazzaville)            |Congo                                   | 484|  484|     1989|     2022| 33|
|Congo (Kinshasa)               |Congo, Democratic Republic of (Zaire)   | 490|  490|     1989|     2022| 33|
|East Germany                   |German Democratic Republic              | 265|  265|     1989|     1989|  1|
|Eswatini                       |Swaziland                               | 572|  572|     2019|     2019|  1|
|Gambia, The                    |Gambia                                  | 420|  420|     1989|     2016| 28|
|Germany                        |German Federal Republic                 | 260|  255|     1990|     2022| 32|
|Germany, W.                    |German Federal Republic                 | 260|  260|     1989|     1989|  1|
|Iran                           |Iran (Persia)                           | 630|  630|     1989|     2022| 33|
|Italy                          |Italy/Sardinia                          | 325|  325|     1989|     2022| 33|
|Kyrgyzstan                     |Kyrgyz Republic                         | 703|  703|     1991|     2022| 31|
|Macedonia                      |Macedonia (Former Yugoslav Republic of) | 343|  343|     1992|     2019| 27|
|Madagascar                     |Madagascar (Malagasy)                   | 580|  580|     1989|     2022| 33|
|Micronesia                     |Federated States of Micronesia          | 987|  987|     1991|     2022| 31|
|Myanmar                        |Myanmar (Burma)                         | 775|  775|     1989|     2022| 33|
|North Korea                    |Korea, People's Republic of             | 731|  731|     1989|     2022| 33|
|North Macedonia                |Macedonia (Former Yugoslav Republic of) | 343|  343|     2020|     2022|  3|
|Russia                         |Russia (Soviet Union)                   | 365|  365|     1991|     2022| 31|
|Samoa                          |Samoa/Western Samoa                     | 990|  990|     1989|     2022| 33|
|Sao Tome & Principe            |Sao Tome and Principe                   | 403|  403|     1989|     2016| 28|
|Serbia & Montenegro            |Yugoslavia                              | 345|  345|     2003|     2005|  3|
|South Korea                    |Korea, Republic of                      | 732|  732|     1989|     2022| 33|
|South Yemen                    |Yemen, People's Republic of             | 680|  680|     1989|     1989|  1|
|Sri Lanka                      |Sri Lanka (Ceylon)                      | 780|  780|     1989|     2022| 33|
|St. Kitts & Nevis              |Saint Kitts and Nevis                   |  60|   60|     1989|     2016| 28|
|St. Kitts and Nevis            |Saint Kitts and Nevis                   |  60|   60|     2018|     2022|  5|
|St. Lucia                      |Saint Lucia                             |  56|   56|     1989|     2022| 33|
|St. Vincent & Grenadines       |Saint Vincent and the Grenadines        |  57|   57|     1989|     2016| 28|
|St. Vincent and the Grenadines |Saint Vincent and the Grenadines        |  57|   57|     2018|     2022|  5|
|Suriname                       |Surinam                                 | 115|  115|     1989|     2022| 33|
|Tanzania                       |Tanzania/Tanganyika                     | 510|  510|     1989|     2022| 33|
|The Gambia                     |Gambia                                  | 420|  420|     2018|     2022|  5|
|Timor-Leste                    |East Timor                              | 860|  860|     1999|     2022| 23|
|Trinidad & Tobago              |Trinidad and Tobago                     |  52|   52|     1989|     2016| 28|
|Turkey                         |Turkey (Ottoman Empire)                 | 640|  640|     1989|     2022| 33|
|USSR                           |Russia (Soviet Union)                   | 365|  365|     1989|     1991|  3|
|United States                  |United States of America                |   2|    2|     1989|     2022| 33|
|Vietnam                        |Vietnam, Democratic Republic of         | 816|  816|     1989|     2022| 33|
|Yemen                          |Yemen (Arab Republic of Yemen)          | 678|  679|     1990|     2022| 32|
|Yemen, N.                      |Yemen (Arab Republic of Yemen)          | 678|  678|     1989|     1989|  1|
|Zimbabwe                       |Zimbabwe (Rhodesia)                     | 552|  552|     1989|     2022| 33|
|eSwatini                       |Swaziland                               | 572|  572|     2020|     2022|  3|

```
## Resulting dataset after processing has 6296 rows.
```

```
## Changing the name of the original country column from country to fh_electoral_country...
```

```
## Ensuring year column is numeric...
```

```r
fh_full <- download_fh_full(verbose = verbose,
                                      include_in_output = include_in_output)
```

```
## Downloading  data...
```

```
## Trying https://freedomhouse.org/sites/default/files/2023-02/All_data_FIW_2013-2023.xlsx ...
```

```
## The downloaded  dataset has 2305 rows
```

```
## Original dataset has 2305 rows
```

```
## Processing the FH full 2013-2022 data - adding state system info, fixing column names...
```

```
## The following different countries/country codes match to a single country unit in the destination system:
```



|country    |extended_country_name | GWn| cown| min_date| max_date|  n|
|:----------|:---------------------|---:|----:|--------:|--------:|--:|
|Gaza Strip |Palestine, State of   |  NA|   NA|     2012|     2022| 11|
|West Bank  |Palestine, State of   |  NA|   NA|     2012|     2022| 11|

```
## The following country and/or code-years were not matched:
```



|country           |extended_country_name | GWn| cown| min_date| max_date|  n|
|:-----------------|:---------------------|---:|----:|--------:|--------:|--:|
|Crimea            |NA                    |  NA|   NA|     2014|     2022|  9|
|Eastern Donbas    |NA                    |  NA|   NA|     2019|     2022|  4|
|Indian Kashmir    |NA                    |  NA|   NA|     2012|     2022| 11|
|Nagorno-Karabakh  |NA                    |  NA|   NA|     2012|     2022| 11|
|Northern Cyprus   |NA                    |  NA|   NA|     2012|     2022| 11|
|Pakistani Kashmir |NA                    |  NA|   NA|     2012|     2022| 11|
|Transnistria      |NA                    |  NA|   NA|     2012|     2022| 11|

```
## The following country names are different in the destination system:
```



|country                        |extended_country_name                   | GWn| cown| min_date| max_date|  n|
|:------------------------------|:---------------------------------------|---:|----:|--------:|--------:|--:|
|Antigua and Barbuda            |Antigua & Barbuda                       |  58|   58|     2012|     2022| 11|
|Belarus                        |Belarus (Byelorussia)                   | 370|  370|     2012|     2022| 11|
|Bosnia and Herzegovina         |Bosnia-Herzegovina                      | 346|  346|     2012|     2022| 11|
|Burkina Faso                   |Burkina Faso (Upper Volta)              | 439|  439|     2012|     2022| 11|
|Cabo Verde                     |Cape Verde                              | 402|  402|     2012|     2022| 11|
|Cambodia                       |Cambodia (Kampuchea)                    | 811|  811|     2012|     2022| 11|
|Congo (Brazzaville)            |Congo                                   | 484|  484|     2012|     2022| 11|
|Congo (Kinshasa)               |Congo, Democratic Republic of (Zaire)   | 490|  490|     2012|     2022| 11|
|Eswatini                       |Swaziland                               | 572|  572|     2012|     2022| 11|
|Gaza Strip                     |Palestine, State of                     |  NA|   NA|     2012|     2022| 11|
|Germany                        |German Federal Republic                 | 260|  255|     2012|     2022| 11|
|Iran                           |Iran (Persia)                           | 630|  630|     2012|     2022| 11|
|Italy                          |Italy/Sardinia                          | 325|  325|     2012|     2022| 11|
|Kyrgyzstan                     |Kyrgyz Republic                         | 703|  703|     2012|     2022| 11|
|Madagascar                     |Madagascar (Malagasy)                   | 580|  580|     2012|     2022| 11|
|Micronesia                     |Federated States of Micronesia          | 987|  987|     2012|     2022| 11|
|Myanmar                        |Myanmar (Burma)                         | 775|  775|     2012|     2022| 11|
|North Korea                    |Korea, People's Republic of             | 731|  731|     2012|     2022| 11|
|North Macedonia                |Macedonia (Former Yugoslav Republic of) | 343|  343|     2012|     2022| 11|
|Russia                         |Russia (Soviet Union)                   | 365|  365|     2012|     2022| 11|
|Samoa                          |Samoa/Western Samoa                     | 990|  990|     2012|     2022| 11|
|South Korea                    |Korea, Republic of                      | 732|  732|     2012|     2022| 11|
|Sri Lanka                      |Sri Lanka (Ceylon)                      | 780|  780|     2012|     2022| 11|
|St. Kitts and Nevis            |Saint Kitts and Nevis                   |  60|   60|     2012|     2022| 11|
|St. Lucia                      |Saint Lucia                             |  56|   56|     2012|     2022| 11|
|St. Vincent and the Grenadines |Saint Vincent and the Grenadines        |  57|   57|     2012|     2022| 11|
|Suriname                       |Surinam                                 | 115|  115|     2012|     2022| 11|
|Tanzania                       |Tanzania/Tanganyika                     | 510|  510|     2012|     2022| 11|
|The Gambia                     |Gambia                                  | 420|  420|     2012|     2022| 11|
|Timor-Leste                    |East Timor                              | 860|  860|     2012|     2022| 11|
|Turkey                         |Turkey (Ottoman Empire)                 | 640|  640|     2012|     2022| 11|
|United States                  |United States of America                |   2|    2|     2012|     2022| 11|
|Vietnam                        |Vietnam, Democratic Republic of         | 816|  816|     2012|     2022| 11|
|West Bank                      |Palestine, State of                     |  NA|   NA|     2012|     2022| 11|
|Yemen                          |Yemen (Arab Republic of Yemen)          | 678|  679|     2012|     2022| 11|
|Zimbabwe                       |Zimbabwe (Rhodesia)                     | 552|  552|     2012|     2022| 11|

```
## Resulting dataset after processing has 2305 rows.
```

```
## Changing the name of the original country column from country to fh_full_country...
```

```
## Ensuring year column is numeric...
```

```r
fh_pmm <- extract_pmm_var(pmm_replication, pmm_freedomhouse,
                          include_in_output = include_in_output) 

stopifnot(identical(fh, tar_read(fh, store = here::here("_targets"))))
stopifnot(identical(fh_with_territories, tar_read(fh_with_territories, store = here::here("_targets"))))
stopifnot(identical(fh_electoral, tar_read(fh_electoral, store = here::here("_targets"))))
stopifnot(identical(fh_full, tar_read(fh_full, store = here::here("_targets"))))
stopifnot(identical(fh_pmm, tar_read(fh_pmm, store = here::here("_targets"))))
stopifnot(identical(fh_pmm, democracyData::fh_pmm))
```

# GWF


```r
cite_dataset("gwf")
```

[1] B. Geddes, J. Wright, and E. Frantz. "Autocratic Breakdown and
Regime Transitions: A New Data Set". In: _Perspectives on Politics_
12.1 (2014), pp. 313-331. DOI: 10.1017/S1537592714000851.

```r
gwf_autocratic <- redownload_gwf(verbose = verbose,
                                 dataset = "autocratic",
                                 include_in_output = include_in_output)
```

```
## Downloading GWFtscs.dta data...
```

```
## Trying http://sites.psu.edu/dictators/wp-content/uploads/sites/12570/2016/05/GWF-Autocratic-Regimes-1.2.zip ...
```

```
## The files in the archive are:
```

 [1] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/GWF Autocratic Regimes 1.2/clean.do"                               
 [2] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/GWF Autocratic Regimes 1.2/GWF All Political Regimes Case List.xls"
 [3] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/GWF Autocratic Regimes 1.2/GWF Autocratic Regimes.xlsx"            
 [4] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/GWF Autocratic Regimes 1.2/GWF Codebook.pdf"                       
 [5] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/GWF Autocratic Regimes 1.2/GWF_AllPoliticalRegimes.dta"            
 [6] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/GWF Autocratic Regimes 1.2/GWF_AllPoliticalRegimes.txt"            
 [7] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/GWF Autocratic Regimes 1.2/GWFcases.dta"                           
 [8] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/GWF Autocratic Regimes 1.2/GWFtscs.dta"                            
 [9] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/GWF Autocratic Regimes 1.2/GWFtscs.txt"                            
[10] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/GWF Autocratic Regimes 1.2/README.tex"                             
[11] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/GWF Autocratic Regimes 1.2/UPDATES.tex"                            

```
## Extracting C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/GWF Autocratic Regimes 1.2/GWFtscs.dta
```

```
## The downloaded GWFtscs.dta dataset has 4591 rows
```

```
## Original dataset has 4591 rows
```

```
## Processing the Autocratic Regimes dataset - adding state system info, fixing NA values...
```

```
## The following country names are different in the destination system:
```



|gwf_country     |extended_country_name                 | GWn| cown| min_date| max_date|  n|
|:---------------|:-------------------------------------|---:|----:|--------:|--------:|--:|
|Belarus         |Belarus (Byelorussia)                 | 370|  370|     1992|     2010| 19|
|Burkina Faso    |Burkina Faso (Upper Volta)            | 439|  439|     1961|     2010| 50|
|Cambodia        |Cambodia (Kampuchea)                  | 811|  811|     1954|     2010| 57|
|Cen African Rep |Central African Republic              | 482|  482|     1961|     2010| 40|
|Congo-Brz       |Congo                                 | 484|  484|     1961|     2010| 44|
|Congo/Zaire     |Congo, Democratic Republic of (Zaire) | 490|  490|     1961|     2010| 50|
|Dominican Rep   |Dominican Republic                    |  42|   42|     1946|     1978| 31|
|Germany East    |German Democratic Republic            | 265|  265|     1950|     1990| 41|
|Guinea Bissau   |Guinea-Bissau                         | 404|  404|     1975|     2003| 26|
|Iran            |Iran (Persia)                         | 630|  630|     1946|     2010| 65|
|Ivory Coast     |Cote D'Ivoire                         | 437|  437|     1961|     2010| 50|
|Korea North     |Korea, People's Republic of           | 731|  731|     1949|     2010| 62|
|Korea South     |Korea, Republic of                    | 732|  732|     1949|     1987| 38|
|Kyrgyzstan      |Kyrgyz Republic                       | 703|  703|     1992|     2010| 19|
|Madagascar      |Madagascar (Malagasy)                 | 580|  580|     1961|     2010| 34|
|Myanmar         |Myanmar (Burma)                       | 775|  775|     1959|     2010| 50|
|Russia          |Russia (Soviet Union)                 | 365|  365|     1994|     2010| 17|
|Serbia          |Yugoslavia                            | 345|  345|     1992|     2000|  9|
|Soviet Union    |Russia (Soviet Union)                 | 365|  365|     1946|     1991| 46|
|Sri Lanka       |Sri Lanka (Ceylon)                    | 780|  780|     1979|     1994| 16|
|Tanzania        |Tanzania/Tanganyika                   | 510|  510|     1965|     2010| 46|
|Turkey          |Turkey (Ottoman Empire)               | 640|  640|     1946|     1983| 12|
|Vietnam         |Vietnam, Democratic Republic of       | 816|  816|     1955|     2010| 56|
|Vietnam South   |Vietnam, Republic of                  | 817|  817|     1955|     1975| 21|
|Yemen           |Yemen (Arab Republic of Yemen)        | 678|  678|     1946|     1989| 44|
|Yemen           |Yemen (Arab Republic of Yemen)        | 678|  679|     1990|     2010| 21|
|Yemen South     |Yemen, People's Republic of           | 680|  680|     1968|     1990| 23|
|Zimbabwe        |Zimbabwe (Rhodesia)                   | 552|  552|     1981|     2010| 30|

```
## Resulting dataset after processing has 4591 rows.
```

```
## Changing the name of the original country column from gwf_country to gwf_country...
```

```
## Ensuring year column is numeric...
```

```
## Changing the name of the original code column from cowcode to gwf_cowcode...
```

```r
gwf_autocratic_extended <- redownload_gwf(verbose = verbose,
                                          dataset = "autocratic",
                                          include_in_output = include_in_output,
                                          extend = TRUE)
```

```
## Downloading GWFtscs.dta data...
```

```
## Trying http://sites.psu.edu/dictators/wp-content/uploads/sites/12570/2016/05/GWF-Autocratic-Regimes-1.2.zip ...
```

```
## The files in the archive are:
```

 [1] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/GWF Autocratic Regimes 1.2/clean.do"                               
 [2] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/GWF Autocratic Regimes 1.2/GWF All Political Regimes Case List.xls"
 [3] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/GWF Autocratic Regimes 1.2/GWF Autocratic Regimes.xlsx"            
 [4] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/GWF Autocratic Regimes 1.2/GWF Codebook.pdf"                       
 [5] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/GWF Autocratic Regimes 1.2/GWF_AllPoliticalRegimes.dta"            
 [6] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/GWF Autocratic Regimes 1.2/GWF_AllPoliticalRegimes.txt"            
 [7] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/GWF Autocratic Regimes 1.2/GWFcases.dta"                           
 [8] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/GWF Autocratic Regimes 1.2/GWFtscs.dta"                            
 [9] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/GWF Autocratic Regimes 1.2/GWFtscs.txt"                            
[10] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/GWF Autocratic Regimes 1.2/README.tex"                             
[11] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/GWF Autocratic Regimes 1.2/UPDATES.tex"                            

```
## Extracting C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/GWF Autocratic Regimes 1.2/GWFtscs.dta
```

```
## The downloaded GWFtscs.dta dataset has 4591 rows
```

```
## Original dataset has 4591 rows
```

```
## Processing the Autocratic Regimes dataset - adding state system info, fixing NA values...
```

```
## Extending the dataset...
```

```
## Joining with `by = join_by(gwf_casename, gwf_country, cowcode, gwf_spell,
## year)`
## The following country names are different in the destination system:
```



|gwf_country     |extended_country_name                 | GWn| cown| min_date| max_date|  n|
|:---------------|:-------------------------------------|---:|----:|--------:|--------:|--:|
|Belarus         |Belarus (Byelorussia)                 | 370|  370|     1992|     2010| 19|
|Burkina Faso    |Burkina Faso (Upper Volta)            | 439|  439|     1961|     2010| 50|
|Cambodia        |Cambodia (Kampuchea)                  | 811|  811|     1954|     2010| 57|
|Cen African Rep |Central African Republic              | 482|  482|     1961|     2010| 40|
|Congo-Brz       |Congo                                 | 484|  484|     1961|     2010| 44|
|Congo/Zaire     |Congo, Democratic Republic of (Zaire) | 490|  490|     1961|     2010| 50|
|Dominican Rep   |Dominican Republic                    |  42|   42|     1931|     1978| 46|
|Germany East    |German Democratic Republic            | 265|  265|     1950|     1990| 41|
|Guinea Bissau   |Guinea-Bissau                         | 404|  404|     1975|     2003| 26|
|Iran            |Iran (Persia)                         | 630|  630|     1926|     2010| 85|
|Ivory Coast     |Cote D'Ivoire                         | 437|  437|     1961|     2010| 50|
|Korea North     |Korea, People's Republic of           | 731|  731|     1949|     2010| 62|
|Korea South     |Korea, Republic of                    | 732|  732|     1949|     1987| 38|
|Kyrgyzstan      |Kyrgyz Republic                       | 703|  703|     1992|     2010| 19|
|Madagascar      |Madagascar (Malagasy)                 | 580|  580|     1961|     2010| 34|
|Myanmar         |Myanmar (Burma)                       | 775|  775|     1959|     2010| 50|
|Russia          |Russia (Soviet Union)                 | 365|  365|     1994|     2010| 17|
|Serbia          |Yugoslavia                            | 345|  345|     1992|     2000|  9|
|Soviet Union    |Russia (Soviet Union)                 | 365|  365|     1918|     1991| 74|
|Sri Lanka       |Sri Lanka (Ceylon)                    | 780|  780|     1979|     1994| 16|
|Tanzania        |Tanzania/Tanganyika                   | 510|  510|     1965|     2010| 46|
|Turkey          |Turkey (Ottoman Empire)               | 640|  640|     1924|     1983| 34|
|Vietnam         |Vietnam, Democratic Republic of       | 816|  816|     1955|     2010| 56|
|Vietnam South   |Vietnam, Republic of                  | 817|  817|     1955|     1975| 21|
|Yemen           |Yemen (Arab Republic of Yemen)        | 678|  678|     1919|     1989| 71|
|Yemen           |Yemen (Arab Republic of Yemen)        | 678|  679|     1990|     2010| 21|
|Yemen South     |Yemen, People's Republic of           | 680|  680|     1968|     1990| 23|
|Zimbabwe        |Zimbabwe (Rhodesia)                   | 552|  552|     1981|     2010| 30|

```
## Resulting dataset after processing has 5301 rows.
## Note: the number of rows in the processed Autocratic Regimes Dataset is different from the number of rows in the original data.
## Changing the name of the original country column from gwf_country to gwf_country...
## Ensuring year column is numeric...
## Changing the name of the original code column from cowcode to gwf_cowcode...
```

```r
gwf_all <- redownload_gwf(verbose = verbose,
                          dataset = "all",
                          include_in_output = include_in_output)
```

```
## Downloading GWF_AllPoliticalRegimes.dta data...
## Trying http://sites.psu.edu/dictators/wp-content/uploads/sites/12570/2016/05/GWF-Autocratic-Regimes-1.2.zip ...
## The files in the archive are:
```

 [1] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/GWF Autocratic Regimes 1.2/clean.do"                               
 [2] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/GWF Autocratic Regimes 1.2/GWF All Political Regimes Case List.xls"
 [3] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/GWF Autocratic Regimes 1.2/GWF Autocratic Regimes.xlsx"            
 [4] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/GWF Autocratic Regimes 1.2/GWF Codebook.pdf"                       
 [5] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/GWF Autocratic Regimes 1.2/GWF_AllPoliticalRegimes.dta"            
 [6] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/GWF Autocratic Regimes 1.2/GWF_AllPoliticalRegimes.txt"            
 [7] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/GWF Autocratic Regimes 1.2/GWFcases.dta"                           
 [8] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/GWF Autocratic Regimes 1.2/GWFtscs.dta"                            
 [9] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/GWF Autocratic Regimes 1.2/GWFtscs.txt"                            
[10] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/GWF Autocratic Regimes 1.2/README.tex"                             
[11] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/GWF Autocratic Regimes 1.2/UPDATES.tex"                            

```
## Extracting C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/GWF Autocratic Regimes 1.2/GWF_AllPoliticalRegimes.dta
## The downloaded GWF_AllPoliticalRegimes.dta dataset has 7954 rows
## Original dataset has 7954 rows
## Processing the Autocratic Regimes dataset - adding state system info, fixing NA values...
## The following country names are different in the destination system:
```



|gwf_country            |extended_country_name                   | GWn| cown| min_date| max_date|  n|
|:----------------------|:---------------------------------------|---:|----:|--------:|--------:|--:|
|Belarus                |Belarus (Byelorussia)                   | 370|  370|     1992|     2010| 19|
|Bosnia and Herzegovina |Bosnia-Herzegovina                      | 346|  346|     1993|     2009| 17|
|Burkina Faso           |Burkina Faso (Upper Volta)              | 439|  439|     1961|     2010| 50|
|Cambodia               |Cambodia (Kampuchea)                    | 811|  811|     1954|     2010| 57|
|Cen African Rep        |Central African Republic                | 482|  482|     1961|     2010| 50|
|Congo-Brz              |Congo                                   | 484|  484|     1961|     2010| 50|
|Congo/Zaire            |Congo, Democratic Republic of (Zaire)   | 490|  490|     1961|     2010| 50|
|Dominican Rep          |Dominican Republic                      |  42|   42|     1946|     2010| 65|
|Germany                |German Federal Republic                 | 260|  255|     1990|     2010| 21|
|Germany                |German Federal Republic                 | 260|  260|     1950|     1989| 40|
|Germany East           |German Democratic Republic              | 265|  265|     1950|     1990| 41|
|Guinea Bissau          |Guinea-Bissau                           | 404|  404|     1975|     2010| 36|
|Iran                   |Iran (Persia)                           | 630|  630|     1946|     2010| 65|
|Italy                  |Italy/Sardinia                          | 325|  325|     1947|     2010| 64|
|Ivory Coast            |Cote D'Ivoire                           | 437|  437|     1961|     2010| 50|
|Korea North            |Korea, People's Republic of             | 731|  731|     1949|     2010| 62|
|Korea South            |Korea, Republic of                      | 732|  732|     1949|     2010| 62|
|Kyrgyzstan             |Kyrgyz Republic                         | 703|  703|     1992|     2010| 19|
|Luxemburg              |Luxembourg                              | 212|  212|     1946|     2010| 65|
|Macedonia              |Macedonia (Former Yugoslav Republic of) | 343|  343|     1992|     2010| 19|
|Madagascar             |Madagascar (Malagasy)                   | 580|  580|     1961|     2010| 50|
|Myanmar                |Myanmar (Burma)                         | 775|  775|     1949|     2010| 62|
|Russia                 |Russia (Soviet Union)                   | 365|  365|     1992|     2010| 19|
|Serbia                 |Yugoslavia                              | 345|  345|     1992|     2005| 14|
|South Vietnam          |Vietnam, Republic of                    | 817|  817|     1955|     1975| 21|
|South Yemen            |Yemen, People's Republic of             | 680|  680|     1968|     1990| 23|
|Soviet Union           |Russia (Soviet Union)                   | 365|  365|     1946|     1991| 46|
|Sri Lanka              |Sri Lanka (Ceylon)                      | 780|  780|     1949|     2010| 62|
|Tanzania               |Tanzania/Tanganyika                     | 510|  510|     1961|     2010| 50|
|Turkey                 |Turkey (Ottoman Empire)                 | 640|  640|     1946|     2010| 65|
|UAE                    |United Arab Emirates                    | 696|  696|     1972|     2010| 39|
|UK                     |United Kingdom                          | 200|  200|     1946|     2010| 65|
|USA                    |United States of America                |   2|    2|     1946|     2010| 65|
|Vietnam                |Vietnam, Democratic Republic of         | 816|  816|     1955|     2010| 56|
|Yemen                  |Yemen (Arab Republic of Yemen)          | 678|  678|     1946|     1989| 44|
|Yemen                  |Yemen (Arab Republic of Yemen)          | 678|  679|     1990|     2010| 21|
|Zimbabwe               |Zimbabwe (Rhodesia)                     | 552|  552|     1966|     2010| 45|

```
## Resulting dataset after processing has 7954 rows.
## Changing the name of the original country column from gwf_country to gwf_country...
## Ensuring year column is numeric...
## Changing the name of the original code column from cowcode to gwf_cowcode...
```

```r
gwf_all_extended <- redownload_gwf(verbose = verbose,
                                   dataset = "all",
                                   include_in_output = include_in_output,
                                   extend = TRUE)
```

```
## Downloading GWF_AllPoliticalRegimes.dta data...
## Trying http://sites.psu.edu/dictators/wp-content/uploads/sites/12570/2016/05/GWF-Autocratic-Regimes-1.2.zip ...
## The files in the archive are:
```

 [1] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/GWF Autocratic Regimes 1.2/clean.do"                               
 [2] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/GWF Autocratic Regimes 1.2/GWF All Political Regimes Case List.xls"
 [3] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/GWF Autocratic Regimes 1.2/GWF Autocratic Regimes.xlsx"            
 [4] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/GWF Autocratic Regimes 1.2/GWF Codebook.pdf"                       
 [5] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/GWF Autocratic Regimes 1.2/GWF_AllPoliticalRegimes.dta"            
 [6] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/GWF Autocratic Regimes 1.2/GWF_AllPoliticalRegimes.txt"            
 [7] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/GWF Autocratic Regimes 1.2/GWFcases.dta"                           
 [8] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/GWF Autocratic Regimes 1.2/GWFtscs.dta"                            
 [9] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/GWF Autocratic Regimes 1.2/GWFtscs.txt"                            
[10] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/GWF Autocratic Regimes 1.2/README.tex"                             
[11] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/GWF Autocratic Regimes 1.2/UPDATES.tex"                            

```
## Extracting C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/GWF Autocratic Regimes 1.2/GWF_AllPoliticalRegimes.dta
## The downloaded GWF_AllPoliticalRegimes.dta dataset has 7954 rows
## Original dataset has 7954 rows
## Processing the Autocratic Regimes dataset - adding state system info, fixing NA values...
## Extending the dataset...
## Joining with `by = join_by(gwf_casename, gwf_country, cowcode, gwf_spell, year)`The following country names are different in the destination system:
```



|gwf_country            |extended_country_name                   | GWn| cown| min_date| max_date|   n|
|:----------------------|:---------------------------------------|---:|----:|--------:|--------:|---:|
|Belarus                |Belarus (Byelorussia)                   | 370|  370|     1992|     2010|  19|
|Bosnia and Herzegovina |Bosnia-Herzegovina                      | 346|  346|     1993|     2009|  17|
|Burkina Faso           |Burkina Faso (Upper Volta)              | 439|  439|     1961|     2010|  50|
|Cambodia               |Cambodia (Kampuchea)                    | 811|  811|     1954|     2010|  57|
|Cen African Rep        |Central African Republic                | 482|  482|     1961|     2010|  50|
|Congo-Brz              |Congo                                   | 484|  484|     1961|     2010|  50|
|Congo/Zaire            |Congo, Democratic Republic of (Zaire)   | 490|  490|     1961|     2010|  50|
|Dominican Rep          |Dominican Republic                      |  42|   42|     1931|     2010|  80|
|Germany                |German Federal Republic                 | 260|  255|     1990|     2010|  21|
|Germany                |German Federal Republic                 | 260|  260|     1950|     1989|  40|
|Germany East           |German Democratic Republic              | 265|  265|     1950|     1990|  41|
|Guinea Bissau          |Guinea-Bissau                           | 404|  404|     1975|     2010|  36|
|Iran                   |Iran (Persia)                           | 630|  630|     1926|     2010|  85|
|Italy                  |Italy/Sardinia                          | 325|  325|     1947|     2010|  64|
|Ivory Coast            |Cote D'Ivoire                           | 437|  437|     1961|     2010|  50|
|Korea North            |Korea, People's Republic of             | 731|  731|     1949|     2010|  62|
|Korea South            |Korea, Republic of                      | 732|  732|     1949|     2010|  62|
|Kyrgyzstan             |Kyrgyz Republic                         | 703|  703|     1992|     2010|  19|
|Luxemburg              |Luxembourg                              | 212|  212|     1871|     2010| 140|
|Macedonia              |Macedonia (Former Yugoslav Republic of) | 343|  343|     1992|     2010|  19|
|Madagascar             |Madagascar (Malagasy)                   | 580|  580|     1961|     2010|  50|
|Myanmar                |Myanmar (Burma)                         | 775|  775|     1949|     2010|  62|
|Russia                 |Russia (Soviet Union)                   | 365|  365|     1992|     2010|  19|
|Serbia                 |Yugoslavia                              | 345|  345|     1992|     2005|  14|
|South Vietnam          |Vietnam, Republic of                    | 817|  817|     1955|     1975|  21|
|South Yemen            |Yemen, People's Republic of             | 680|  680|     1968|     1990|  23|
|Soviet Union           |Russia (Soviet Union)                   | 365|  365|     1918|     1991|  74|
|Sri Lanka              |Sri Lanka (Ceylon)                      | 780|  780|     1949|     2010|  62|
|Tanzania               |Tanzania/Tanganyika                     | 510|  510|     1961|     2010|  50|
|Turkey                 |Turkey (Ottoman Empire)                 | 640|  640|     1924|     2010|  87|
|UAE                    |United Arab Emirates                    | 696|  696|     1972|     2010|  39|
|UK                     |United Kingdom                          | 200|  200|     1912|     2010|  99|
|USA                    |United States of America                |   2|    2|     1872|     2010| 139|
|Vietnam                |Vietnam, Democratic Republic of         | 816|  816|     1955|     2010|  56|
|Yemen                  |Yemen (Arab Republic of Yemen)          | 678|  678|     1919|     1989|  71|
|Yemen                  |Yemen (Arab Republic of Yemen)          | 678|  679|     1990|     2010|  21|
|Zimbabwe               |Zimbabwe (Rhodesia)                     | 552|  552|     1966|     2010|  45|

```
## Resulting dataset after processing has 9411 rows.
## Note: the number of rows in the processed Autocratic Regimes Dataset is different from the number of rows in the original data.
## Changing the name of the original country column from gwf_country to gwf_country...
## Ensuring year column is numeric...
## Changing the name of the original code column from cowcode to gwf_cowcode...
```

```r
stopifnot(identical(gwf_autocratic, tar_read(gwf_autocratic, store = here::here("_targets"))))
stopifnot(identical(gwf_autocratic, democracyData::gwf_autocratic))
stopifnot(identical(gwf_autocratic_extended, tar_read(gwf_autocratic_extended, store = here::here("_targets"))))
stopifnot(identical(gwf_autocratic_extended, democracyData::gwf_autocratic_extended))
stopifnot(identical(gwf_all, tar_read(gwf_all, store = here::here("_targets"))))
stopifnot(identical(gwf_all, democracyData::gwf_all))
stopifnot(identical(gwf_all_extended, tar_read(gwf_all_extended, store = here::here("_targets"))))
stopifnot(identical(gwf_all_extended, democracyData::gwf_all_extended))
```

# Hadenius


```r
cite_dataset("hadenius")
```

[1] A. Hadenius. _Democracy and development_. New York: Cambridge
University Press, 1992.

[2] A. Hadenius and J. Teorell. "Pathways from Authoritarianism". In:
_Journal of Democracy_ 18.1 (2007), pp. 143-157.

[3] M. Wahman, J. Teorell, and A. Hadenius. "Authoritarian Regime Types
Revisited: Updated Data in Comparative Perspective". In: _Contemporary
Politics_ 19.1 (2013), pp. 19-34.
<https://sites.google.com/site/authoritarianregimedataset/data>.

```r
hadenius_pmm <- extract_pmm_var(pmm_replication, pmm_hadenius,
                                include_in_output = include_in_output)

stopifnot(identical(hadenius_pmm, tar_read(hadenius_pmm, store = here::here("_targets"))))
stopifnot(identical(hadenius_pmm, democracyData::hadenius_pmm))
```

# Kailitz


```r
cite_dataset("kailitz")
```

[1] S. Kailitz. "Classifying political regimes revisited: legitimation
and durability". In: _Democratization_ 20.1 (2013), pp. 39-60. DOI:
10.1080/13510347.2013.738861.

```r
kailitz <- prepare_kailitz(path = here::here("data-raw/kailitz.yearly.rds"),
                           verbose = verbose, include_in_output = include_in_output)
```

```
## The following country names are different in the destination system:
```



|kailitz_country | kailitz_cown|extended_country_name | GWn| cown| min_date| max_date|  n|
|:---------------|------------:|:---------------------|---:|----:|--------:|--------:|--:|
|Rumania         |          360|Romania               | 360|  360|     1946|     2010| 64|

```
## Changing the name of the original country column from kailitz_country to kailitz_country...
```

```
## Ensuring year column is numeric...
```

```
## Changing the name of the original code column from kailitz_cown to kailitz_kailitz_cown...
```

```r
stopifnot(identical(kailitz, tar_read(kailitz, store = here::here("_targets"))))
stopifnot(identical(kailitz, democracyData::kailitz))
```


# LIED


```r
cite_dataset("LIED")
```

[1] S. Skaaning, J. Gerring, and H. Bartusevičius. "A Lexical Index of
Electoral Democracy". In: _Comparative Political Studies_ 48.12 (2015),
pp. 1491-1525. DOI: 10.1177/0010414015581050.

```r
LIED <- redownload_lied(verbose = verbose,
                        include_in_output = include_in_output)
```

```
## Downloading LIED data...
```

```
## Trying https://dataverse.harvard.edu/api/access/datafile/6290760 ...
```

```
## The downloaded LIED dataset has 32292 rows
```

```
## Changing column names, adding state system information, reconstructing index
```

```
## The following country and/or code-years were matched more than once:
```



|countryn | cow|extended_country_name               | GWn| cown| min_date| max_date|  n|
|:--------|---:|:-----------------------------------|---:|----:|--------:|--------:|--:|
|Serbia   | 345|Serbia                              | 340|  345|     1804|     1829| 26|
|Serbia   | 345|Yugoslavia                          | 345|  345|     1804|     1829| 26|
|Vietnam  | 817|Vietnam (Annam/Cochin China/Tonkin) | 815|   NA|     1789|     1815| 27|
|Vietnam  | 817|Vietnam, Democratic Republic of     | 816|  816|     1789|     1815| 27|

```
## The following different countries/country codes match to a single country unit in the destination system:
```



|countryn            | cow|extended_country_name           | GWn| cown| min_date| max_date|  n|
|:-------------------|---:|:-------------------------------|---:|----:|--------:|--------:|--:|
|Palestine/Gaza      | 668|Palestine, State of             |  NA|   NA|     1948|     2021| 17|
|Palestine/West Bank | 667|Palestine, State of             |  NA|   NA|     1948|     2021| 17|
|Vietnam             | 817|Vietnam, Democratic Republic of | 816|  816|     1945|     1953|  9|
|Vietnam, North      | 816|Vietnam, Democratic Republic of | 816|  816|     1945|     1953|  9|

```
## The following country and/or code-years were not matched:
```



|countryn             | cow|extended_country_name | GWn| cown| min_date| max_date|   n|
|:--------------------|---:|:---------------------|---:|----:|--------:|--------:|---:|
|Brunswick            | 242|NA                    |  NA|   NA|     1789|     1867|  79|
|Cape Colony          | 559|NA                    |  NA|   NA|     1853|     1907|  55|
|Hamburg              | 241|NA                    |  NA|   NA|     1789|     1867|  79|
|Nassau               | 276|NA                    |  NA|   NA|     1806|     1866|  61|
|Natal                | 558|NA                    |  NA|   NA|     1856|     1907|  52|
|Newfoundland         |  21|NA                    |  NA|   NA|     1832|     1932| 101|
|Oldenburg            | 266|NA                    |  NA|   NA|     1789|     1867|  79|
|Saxe-Weimar-Eisenach | 268|NA                    |  NA|   NA|     1809|     1867|  59|

```
## The following country names are different in the destination system:
```



|countryn                       | cow|extended_country_name                   | GWn| cown| min_date| max_date|   n|
|:------------------------------|---:|:---------------------------------------|---:|----:|--------:|--------:|---:|
|Antigua and Barbuda            |  58|Antigua & Barbuda                       |  58|   58|     1951|     2021|  71|
|Belarus                        | 370|Belarus (Byelorussia)                   | 370|  370|     1991|     2021|  31|
|Bosnia and Herzegovina         | 346|Bosnia-Herzegovina                      | 346|  346|     1990|     2021|  32|
|Burkina Faso                   | 439|Burkina Faso (Upper Volta)              | 439|  439|     1919|     2021|  88|
|Cambodia                       | 811|Cambodia (Kampuchea)                    | 811|  811|     1789|     2021| 233|
|Congo Brazzaville              | 484|Congo                                   | 484|  484|     1882|     2021| 140|
|Congo, Democratic Republic     | 490|Congo, Democratic Republic of (Zaire)   | 490|  490|     1877|     2021| 145|
|Germany                        | 255|German Federal Republic                 | 260|  255|     1990|     2021|  32|
|Germany                        | 255|Germany (Prussia)                       | 255|  255|     1867|     1944|  78|
|Germany, East                  | 265|German Democratic Republic              | 265|  265|     1945|     1989|  45|
|Germany, West                  | 260|German Federal Republic                 | 260|  260|     1945|     1989|  45|
|Gran Colombia                  | 100|Great Colombia                          |  99|   NA|     1821|     1829|   9|
|Hesse-Darmstadt                | 275|Hesse-Darmstadt (Ducal)                 | 275|  275|     1789|     1870|  82|
|Hesse-Kassel                   | 273|Hesse-Kassel (Electoral)                | 273|  273|     1789|     1870|  82|
|Iran                           | 630|Iran (Persia)                           | 630|  630|     1789|     2021| 233|
|Italy                          | 325|Italy/Sardinia                          | 325|  325|     1861|     2021| 161|
|Korea, North                   | 731|Korea, People's Republic of             | 731|  731|     1948|     2021|  74|
|Korea, South                   | 732|Korea, Republic of                      | 732|  732|     1948|     2021|  74|
|Kyrgyzstan                     | 703|Kyrgyz Republic                         | 703|  703|     1990|     2021|  32|
|Macedonia                      | 343|Macedonia (Former Yugoslav Republic of) | 343|  343|     1990|     2021|  32|
|Madagascar                     | 580|Madagascar (Malagasy)                   | 580|  580|     1817|     2021| 205|
|Micronesia                     | 987|Federated States of Micronesia          | 987|  987|     1947|     2021|  75|
|Myanmar                        | 775|Myanmar (Burma)                         | 775|  775|     1789|     2021| 233|
|Ottoman Empire                 | 640|Turkey (Ottoman Empire)                 | 640|  640|     1789|     1920| 132|
|Palestine/British Mandate      | 665|British Mandate of Palestine            |  NA|   NA|     1918|     1947|  30|
|Palestine/Gaza                 | 668|Palestine, State of                     |  NA|   NA|     1948|     2021|  34|
|Palestine/West Bank            | 667|Palestine, State of                     |  NA|   NA|     1948|     2021|  57|
|Papal states, the              | 327|Papal States                            | 327|  327|     1789|     1869|  81|
|Prussia                        | 255|Germany (Prussia)                       | 255|  255|     1789|     1866|  78|
|Russia                         | 365|Russia (Soviet Union)                   | 365|  365|     1789|     2021| 164|
|Sahrawi                        | 601|Western Sahara                          |  NA|   NA|     1963|     2021|  59|
|Samoa                          | 990|Samoa/Western Samoa                     | 990|  990|     1902|     2021| 120|
|Sardinia                       | 325|Italy/Sardinia                          | 325|  325|     1790|     1860|  71|
|Serbia                         | 345|Yugoslavia                              | 345|  345|     1804|     1829|  26|
|Serbia-Montenegro              | 345|Yugoslavia                              | 345|  345|     1992|     2005|  14|
|Sicily                         | 329|Sicily (Two Sicilies)                   | 329|  329|     1789|     1860|  72|
|Sri Lanka                      | 780|Sri Lanka (Ceylon)                      | 780|  780|     1789|     2021| 233|
|St. Kitts and Nevis            |  60|Saint Kitts and Nevis                   |  60|   60|     1937|     2021|  85|
|St. Lucia                      |  56|Saint Lucia                             |  56|   56|     1951|     2021|  71|
|St. Vincent and the Grenadines |  57|Saint Vincent and the Grenadines        |  57|   57|     1951|     2021|  71|
|Suriname                       | 115|Surinam                                 | 115|  115|     1863|     2021| 159|
|Tanzania                       | 510|Tanzania/Tanganyika                     | 510|  510|     1914|     2021| 108|
|Turkey                         | 640|Turkey (Ottoman Empire)                 | 640|  640|     1921|     2021| 101|
|USSR                           | 365|Russia (Soviet Union)                   | 365|  365|     1922|     1990|  69|
|United States                  |   2|United States of America                |   2|    2|     1789|     2021| 233|
|Vietnam                        | 816|Vietnam, Democratic Republic of         | 816|  816|     1976|     2021|  46|
|Vietnam                        | 817|Vietnam (Annam/Cochin China/Tonkin)     | 815|   NA|     1789|     1892| 104|
|Vietnam                        | 817|Vietnam, Democratic Republic of         | 816|  816|     1789|     1953|  88|
|Vietnam, North                 | 816|Vietnam, Democratic Republic of         | 816|  816|     1945|     1974|  30|
|Vietnam, South                 | 817|Vietnam, Republic of                    | 817|  817|     1954|     1975|  22|
|Wuerttemberg                   | 271|Wurttemberg                             | 271|  271|     1789|     1870|  82|
|Yemen                          | 679|Yemen (Arab Republic of Yemen)          | 678|  679|     1990|     2021|  32|
|Yemen, North                   | 678|Yemen (Arab Republic of Yemen)          | 678|  678|     1789|     1989| 201|
|Yemen, South                   | 680|Yemen, People's Republic of             | 680|  680|     1874|     1989| 116|
|Zimbabwe                       | 552|Zimbabwe (Rhodesia)                     | 552|  552|     1895|     2021| 127|

```
## Column `executive elections` has been renamed exselec
```

```
## Column `legislative elections` has been renamed legselec
```

```
## Column `multi-party_legislative_elections` has been renamed opposition
```

```
## Column `competitive_elections` has been renamed competition
```

```
## Resulting dataset after processing has 32345 rows.
```

```
## Note: the number of rows in the processed LIED data is different from the number of rows in the original data.
```

```
## Changing the name of the original country column from countryn to lied_country...
```

```
## Ensuring year column is numeric...
```

```
## Changing the name of the original code column from cow to lied_cow...
```

```r
stopifnot(identical(LIED, tar_read(LIED, store = here::here("_targets"))))
stopifnot(identical(LIED, democracyData::LIED))
```


# Magaloni


```r
cite_dataset("magaloni")
```

[1] B. Magaloni, J. Chu, and E. Min. _Autocracies of the World,
1950-2012 (Version 1.0)_. Dataset. 2013.
<http://cddrl.fsi.stanford.edu/research/autocracies_of_the_world_dataset>.

```r
magaloni <- redownload_magaloni(verbose = verbose, 
                                include_in_output = include_in_output)
```

```
## Downloading Magaloni, Chu, and Min data...
```

```
## Trying https://fsi-live.s3.us-west-1.amazonaws.com/s3fs-public/res/Data_Set.xls ...
```

```
## The downloaded Magaloni, Chu, and Min dataset has 8629 rows
```

```
## The following different countries/country codes match to a single country unit in the destination system:
```



|country      |extended_country_name   | GWn| cown| min_date| max_date|  n|
|:------------|:-----------------------|---:|----:|--------:|--------:|--:|
|Germany      |German Federal Republic | 260|  255|     1990|     1990|  1|
|Germany West |German Federal Republic | 260|  255|     1990|     1990|  1|

```
## The following country names are different in the destination system:
```



|country               |extended_country_name                   | GWn| cown| min_date| max_date|  n|
|:---------------------|:---------------------------------------|---:|----:|--------:|--------:|--:|
|Belarus               |Belarus (Byelorussia)                   | 370|  370|     1991|     2012| 22|
|Bosnia                |Bosnia-Herzegovina                      | 346|  346|     1992|     2012| 21|
|Burkina Faso          |Burkina Faso (Upper Volta)              | 439|  439|     1960|     2012| 53|
|Cambodia              |Cambodia (Kampuchea)                    | 811|  811|     1953|     2012| 60|
|Congo Brazzaville     |Congo                                   | 484|  484|     1960|     2012| 53|
|Congo Kinshasa        |Congo, Democratic Republic of (Zaire)   | 490|  490|     1960|     2012| 53|
|Germany               |German Federal Republic                 | 260|  255|     1990|     2012| 23|
|Germany East          |German Democratic Republic              | 265|  265|     1950|     1990| 41|
|Germany West          |German Federal Republic                 | 260|  255|     1990|     1990|  1|
|Germany West          |German Federal Republic                 | 260|  260|     1950|     1989| 40|
|Iran                  |Iran (Persia)                           | 630|  630|     1950|     2012| 63|
|Italy                 |Italy/Sardinia                          | 325|  325|     1950|     2012| 63|
|Ivory Coast           |Cote D'Ivoire                           | 437|  437|     1960|     2012| 53|
|Korea North           |Korea, People's Republic of             | 731|  731|     1950|     2012| 63|
|Korea South           |Korea, Republic of                      | 732|  732|     1950|     2012| 63|
|Kyrgyzstan            |Kyrgyz Republic                         | 703|  703|     1991|     2012| 22|
|Macedonia             |Macedonia (Former Yugoslav Republic of) | 343|  343|     1991|     2012| 22|
|Madagascar            |Madagascar (Malagasy)                   | 580|  580|     1960|     2012| 53|
|Russia                |Russia (Soviet Union)                   | 365|  365|     1992|     2012| 21|
|Serbia and Montenegro |Yugoslavia                              | 345|  345|     1992|     2005| 14|
|Slovak Republic       |Slovakia                                | 317|  317|     1993|     2012| 20|
|Sri Lanka             |Sri Lanka (Ceylon)                      | 780|  780|     1950|     2012| 63|
|Suriname              |Surinam                                 | 115|  115|     1975|     2012| 38|
|Tanzania              |Tanzania/Tanganyika                     | 510|  510|     1961|     2012| 52|
|Turkey                |Turkey (Ottoman Empire)                 | 640|  640|     1950|     2012| 63|
|USSR                  |Russia (Soviet Union)                   | 365|  365|     1950|     1991| 42|
|United States         |United States of America                |   2|    2|     1950|     2012| 63|
|Vietnam               |Vietnam, Democratic Republic of         | 816|  816|     1976|     2012| 37|
|Vietnam North         |Vietnam, Democratic Republic of         | 816|  816|     1954|     1975| 22|
|Vietnam South         |Vietnam (Annam/Cochin China/Tonkin)     | 815|   NA|     1976|     1976|  1|
|Vietnam South         |Vietnam, Republic of                    | 817|  817|     1955|     1975| 21|
|Yemen                 |Yemen (Arab Republic of Yemen)          | 678|  679|     1990|     2012| 23|
|Yemen North           |Yemen (Arab Republic of Yemen)          | 678|  678|     1950|     1989| 40|
|Yemen South           |Yemen, People's Republic of             | 680|  680|     1967|     1989| 23|
|Zimbabwe              |Zimbabwe (Rhodesia)                     | 552|  552|     1965|     2012| 48|

```
## Resulting dataset after processing has 8629 rows.
```

```
## Changing the name of the original country column from country to magaloni_country...
```

```
## Ensuring year column is numeric...
```

```
## Changing the name of the original code column from ccode to magaloni_ccode...
```

```r
magaloni_extended <- redownload_magaloni(extend = TRUE,
                                         verbose = verbose, 
                                         include_in_output = include_in_output)
```

```
## Downloading Magaloni, Chu, and Min data...
```

```
## Trying https://fsi-live.s3.us-west-1.amazonaws.com/s3fs-public/res/Data_Set.xls ...
```

```
## The downloaded Magaloni, Chu, and Min dataset has 8629 rows
```

```
## Extending the dataset using the duration_nr variable
```

```
## The following country and/or code-years were matched more than once:
```



|country  |extended_country_name | GWn| cown| min_date| max_date|  n|
|:--------|:---------------------|---:|----:|--------:|--------:|--:|
|Pakistan |Pakistan              | 770|  770|     1969|     1971|  6|

```
## The following different countries/country codes match to a single country unit in the destination system:
```



|country  |extended_country_name | GWn| cown| min_date| max_date|  n|
|:--------|:---------------------|---:|----:|--------:|--------:|--:|
|Pakistan |Pakistan              | 770|  770|     1969|     1971|  6|

```
## The following country names are different in the destination system:
```



|country               |extended_country_name                   | GWn| cown| min_date| max_date|   n|
|:---------------------|:---------------------------------------|---:|----:|--------:|--------:|---:|
|Belarus               |Belarus (Byelorussia)                   | 370|  370|     1991|     2012|  22|
|Bosnia                |Bosnia-Herzegovina                      | 346|  346|     1992|     2012|  21|
|Burkina Faso          |Burkina Faso (Upper Volta)              | 439|  439|     1960|     2012|  53|
|Cambodia              |Cambodia (Kampuchea)                    | 811|  811|     1953|     2012|  60|
|Congo Brazzaville     |Congo                                   | 484|  484|     1960|     2012|  53|
|Congo Kinshasa        |Congo, Democratic Republic of (Zaire)   | 490|  490|     1960|     2012|  53|
|Germany               |German Federal Republic                 | 260|  255|     1990|     2012|  23|
|Germany East          |German Democratic Republic              | 265|  265|     1949|     1989|  41|
|Germany West          |German Federal Republic                 | 260|  260|     1949|     1989|  41|
|Iran                  |Iran (Persia)                           | 630|  630|     1925|     2012|  88|
|Italy                 |Italy/Sardinia                          | 325|  325|     1946|     2012|  67|
|Ivory Coast           |Cote D'Ivoire                           | 437|  437|     1960|     2012|  53|
|Korea North           |Korea, People's Republic of             | 731|  731|     1948|     2012|  65|
|Korea South           |Korea, Republic of                      | 732|  732|     1948|     2012|  65|
|Kyrgyzstan            |Kyrgyz Republic                         | 703|  703|     1991|     2012|  22|
|Macedonia             |Macedonia (Former Yugoslav Republic of) | 343|  343|     1991|     2012|  22|
|Madagascar            |Madagascar (Malagasy)                   | 580|  580|     1960|     2012|  53|
|Russia                |Russia (Soviet Union)                   | 365|  365|     1992|     2012|  21|
|Serbia and Montenegro |Yugoslavia                              | 345|  345|     1992|     2005|  14|
|Slovak Republic       |Slovakia                                | 317|  317|     1993|     2012|  20|
|Sri Lanka             |Sri Lanka (Ceylon)                      | 780|  780|     1948|     2012|  65|
|Suriname              |Surinam                                 | 115|  115|     1975|     2012|  38|
|Tanzania              |Tanzania/Tanganyika                     | 510|  510|     1961|     2012|  52|
|Turkey                |Turkey (Ottoman Empire)                 | 640|  640|     1946|     2012|  67|
|USSR                  |Russia (Soviet Union)                   | 365|  365|     1922|     1990|  69|
|United States         |United States of America                |   2|    2|     1809|     2012| 204|
|Vietnam               |Vietnam, Democratic Republic of         | 816|  816|     1976|     2012|  37|
|Vietnam North         |Vietnam, Democratic Republic of         | 816|  816|     1954|     1975|  22|
|Vietnam South         |Vietnam, Republic of                    | 817|  817|     1955|     1975|  21|
|Yemen                 |Yemen (Arab Republic of Yemen)          | 678|  679|     1990|     2012|  23|
|Yemen North           |Yemen (Arab Republic of Yemen)          | 678|  678|     1918|     1989|  72|
|Yemen South           |Yemen, People's Republic of             | 680|  680|     1967|     1989|  23|
|Zimbabwe              |Zimbabwe (Rhodesia)                     | 552|  552|     1965|     2012|  48|

```
## Resulting dataset after processing has 10291 rows.
```

```
## Note: the number of rows in the processed Magaloni, Min, and Chu Dataset is different from the number of rows in the original data.
```

```
## Changing the name of the original country column from country to magaloni_country...
```

```
## Ensuring year column is numeric...
```

```
## Changing the name of the original code column from ccode to magaloni_ccode...
```

```r
anti_join(magaloni_extended, magaloni) %>%
    group_by(magaloni_country, magaloni_ccode, cown) %>% summarise(min(year), max(year), n()) %>%
  knitr::kable()
```

```
## Joining with `by = join_by(magaloni_country, magaloni_ccode, demo_nr,
## regime_nr, reg_id, year, extended_country_name, GWn, cown, in_GW_system)`
```

```
## `summarise()` has grouped output by 'magaloni_country', 'magaloni_ccode'. You
## can override using the `.groups` argument.
```



|magaloni_country   | magaloni_ccode| cown| min(year)| max(year)| n()|
|:------------------|--------------:|----:|---------:|---------:|---:|
|Afghanistan        |            700|  700|      1926|      1949|  24|
|Albania            |            339|  339|      1946|      1949|   4|
|Argentina          |            160|  160|      1943|      1949|   7|
|Australia          |            900|  900|      1901|      1949|  49|
|Austria            |            305|  305|      1945|      1949|   5|
|Belgium            |            211|  211|      1830|      1949| 120|
|Bhutan             |            760|  760|      1907|      1949|  43|
|Bolivia            |            145|  145|      1946|      1949|   4|
|Brazil             |            140|  140|      1946|      1949|   4|
|Bulgaria           |            355|  355|      1946|      1949|   4|
|Canada             |             20|   20|      1931|      1949|  19|
|Chile              |            155|  155|      1932|      1949|  18|
|China              |            710|  710|      1949|      1949|   1|
|Colombia           |            100|  100|      1949|      1949|   1|
|Costa Rica         |             94|   94|      1949|      1949|   1|
|Cuba               |             40|   40|      1902|      1949|  48|
|Czechoslovakia     |            315|  315|      1948|      1949|   2|
|Denmark            |            390|  390|      1945|      1949|   5|
|Dominican Republic |             42|   42|      1930|      1949|  20|
|Ecuador            |            130|  130|      1948|      1949|   2|
|Egypt              |            651|  651|      1922|      1949|  28|
|El Salvador        |             92|   92|      1931|      1949|  19|
|Ethiopia           |            530|  530|      1944|      1949|   6|
|Finland            |            375|  375|      1917|      1949|  33|
|France             |            220|  220|      1870|      1949|  80|
|Germany East       |            265|  265|      1949|      1949|   1|
|Germany West       |            260|  260|      1949|      1949|   1|
|Greece             |            350|  350|      1944|      1949|   6|
|Guatemala          |             90|   90|      1944|      1949|   6|
|Honduras           |             91|   91|      1949|      1949|   1|
|Hungary            |            310|  310|      1949|      1949|   1|
|Indonesia          |            850|  850|      1945|      1949|   5|
|Iran               |            630|  630|      1925|      1949|  25|
|Iraq               |            645|  645|      1932|      1949|  18|
|Ireland            |            205|  205|      1921|      1949|  29|
|Israel             |            666|  666|      1948|      1949|   2|
|Italy              |            325|  325|      1946|      1949|   4|
|Japan              |            740|  740|      1947|      1949|   3|
|Jordan             |            663|  663|      1946|      1949|   4|
|Korea North        |            731|  731|      1948|      1949|   2|
|Korea South        |            732|  732|      1948|      1949|   2|
|Lebanon            |            660|  660|      1946|      1949|   4|
|Liberia            |            450|  450|      1878|      1949|  72|
|Luxembourg         |            212|  212|      1867|      1949|  83|
|Mexico             |             70|   70|      1917|      1949|  33|
|Mongolia           |            712|  712|      1924|      1949|  26|
|Myanmar (Burma)    |            775|  775|      1948|      1949|   2|
|Nepal              |            790|  790|      1769|      1949| 181|
|Netherlands        |            210|  210|      1945|      1949|   5|
|New Zealand        |            920|  920|      1947|      1949|   3|
|Nicaragua          |             93|   93|      1936|      1949|  14|
|Norway             |            385|  385|      1945|      1949|   5|
|Pakistan           |            769|  770|      1947|      1971|   6|
|Paraguay           |            150|  150|      1948|      1949|   2|
|Peru               |            135|  135|      1948|      1949|   2|
|Philippines        |            840|  840|      1946|      1949|   4|
|Poland             |            290|  290|      1948|      1949|   2|
|Portugal           |            235|  235|      1933|      1949|  17|
|Romania            |            360|  360|      1947|      1949|   3|
|Saudi Arabia       |            670|  670|      1932|      1949|  18|
|South Africa       |            560|  560|      1931|      1949|  19|
|Spain              |            230|  230|      1936|      1949|  14|
|Sri Lanka          |            780|  780|      1948|      1949|   2|
|Sweden             |            380|  380|      1917|      1949|  33|
|Switzerland        |            225|  225|      1848|      1949| 102|
|Syria              |            652|  652|      1949|      1949|   1|
|Taiwan             |            713|  713|      1949|      1949|   1|
|Thailand           |            800|  800|      1932|      1949|  18|
|Turkey             |            640|  640|      1946|      1949|   4|
|USSR               |            364|  365|      1922|      1949|  28|
|United Kingdom     |            200|  200|      1832|      1949| 118|
|United States      |              2|    2|      1809|      1949| 141|
|Uruguay            |            165|  165|      1942|      1949|   8|
|Venezuela          |            101|  101|      1948|      1949|   2|
|Yemen North        |            678|  678|      1918|      1949|  32|
|Yugoslavia         |            345|  345|      1946|      1949|   4|

```r
anti_join(magaloni_extended, magaloni) %>%
  filter(grepl("Pakis",magaloni_country)) %>%
  knitr::kable()
```

```
## Joining with `by = join_by(magaloni_country, magaloni_ccode, demo_nr,
## regime_nr, reg_id, year, extended_country_name, GWn, cown, in_GW_system)`
```



|magaloni_country | magaloni_ccode| demo_nr|regime_nr | reg_id| year|extended_country_name | GWn| cown|in_GW_system |
|:----------------|--------------:|-------:|:---------|------:|----:|:---------------------|---:|----:|:------------|
|Pakistan         |            769|       1|Democracy |  76901| 1947|Pakistan              | 770|  770|TRUE         |
|Pakistan         |            769|       1|Democracy |  76901| 1948|Pakistan              | 770|  770|TRUE         |
|Pakistan         |            769|       1|Democracy |  76901| 1949|Pakistan              | 770|  770|TRUE         |
|Pakistan         |            769|       1|Military  |  76904| 1969|Pakistan              | 770|  770|TRUE         |
|Pakistan         |            769|       1|Military  |  76904| 1970|Pakistan              | 770|  770|TRUE         |
|Pakistan         |            769|       0|Military  |  76904| 1971|Pakistan              | 770|  770|TRUE         |

```r
stopifnot(identical(magaloni, tar_read(magaloni, store = here::here("_targets"))))
stopifnot(identical(magaloni, democracyData::magaloni))
stopifnot(identical(magaloni_extended, tar_read(magaloni_extended, store = here::here("_targets"))))
stopifnot(identical(magaloni_extended, democracyData::magaloni_extended))
```


# Mainwaring


```r
cite_dataset("mainwaring")
```

[1] S. Mainwaring, D. Brinks, and A. Pérez-Liñán. "Classifying
Political Regimes in Latin America". In: _Studies in Comparative
International Development_ 36.1 (2001), pp. 37-65. DOI:
10.1007/bf02687584.

[2] S. Mainwaring, A. Pérez-Liñán, and D. Brinks. "Political Regimes in
Latin America, 1900-2007 (with Daniel Brinks)". In: _Democracies and
Dictatorships in Latin America: Emergence, Survival, and Fall_. New
York: Cambridge University Press, 2014. Chap. Political Regimes in
Latin America, 1900-2007 (with Daniel Brinks).

```r
mainwaring <- prepare_mainwaring(path = here::here("data-raw/Mainwaring Linan.txt"), 
                                 verbose = verbose,
                                 include_in_output = include_in_output)
```

```
## Preparing Mainwaring data...
```

```
## Trying C:/Users/marquexa/Dropbox/Rpackages/democracyData/data-raw/Mainwaring Linan.txt ...
```

```
## Rows: 215 Columns: 8
## ── Column specification ────────────────────────────────────────────────────────
## Delimiter: "\t"
## chr (6): Country, Regime, Elections, Franchise, Civil.Liberties, Civilian.Power
## dbl (2): From, To
## 
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
## Original dataset has 215 rows
## 
## Processing the Mainwaring data - adding state system info...
## 
## The following country names are different in the destination system:
```



|Country           |extended_country_name | GWn| cown| min_date| max_date|   n|
|:-----------------|:---------------------|---:|----:|--------:|--------:|---:|
|Dominican Repulic |Dominican Republic    |  42|   42|     1900|     2007| 108|

```
## Resulting dataset after processing has 2156 rows.
## Note: the number of rows in the processed data is different from the number of rows in the original data.
## Changing the name of the original country column from Country to mainwaring_country...
## Ensuring year column is numeric...
```

```r
mainwaring_pmm <- extract_pmm_var(pmm_replication, pmm_mainwaring,
                                 include_in_output = include_in_output)

stopifnot(identical(mainwaring, tar_read(mainwaring, store = here::here("_targets"))))
stopifnot(identical(mainwaring, democracyData::mainwaring))
stopifnot(identical(mainwaring_pmm, tar_read(mainwaring_pmm, store = here::here("_targets"))))
stopifnot(identical(mainwaring_pmm, democracyData::mainwaring_pmm))
```

# Munck


```r
cite_dataset("munck")
```

[1] G. Munck. _Measuring Democracy: A Bridge between Scholarship and
Politics_. Baltimore: The Johns Hopkins University Press, 2009.

```r
munck_pmm <- extract_pmm_var(pmm_replication, pmm_munck,
                             include_in_output = include_in_output)

stopifnot(identical(munck_pmm, tar_read(munck_pmm, store = here::here("_targets"))))
stopifnot(identical(munck_pmm, democracyData::munck_pmm))
```

# PACL


```r
cite_dataset("pacl")
```

[1] C. Bjørnskov and M. Rode. "Regime types and regime change: A new
dataset on democracy, coups, and political institutions". In: _The
Review of International Organizations_ 15.2 (2020), pp. 531-551. DOI:
10.1007/s11558-019-09345-1.

[2] J. Cheibub, J. Gandhi, and J. Vreeland. "Democracy and dictatorship
revisited". In: _Public Choice_ 143.1 (2010), pp. 67-101. DOI:
10.1007/s11127-009-9491-2.

```r
pacl_pmm <- extract_pmm_var(pmm_replication, pmm_pacl,
                            include_in_output = include_in_output)

pacl <- redownload_pacl(verbose = verbose,
                        include_in_output = include_in_output)
```

```
## Downloading PACL/ACLP data...
```

```
## Trying https://uofi.box.com/shared/static/bba3968d7c3397c024ec.dta ...
```

```
## The downloaded PACL/ACLP dataset has 9159 rows
```

```
## Original dataset has 9159 rows
```

```
## Processing the PACL/ACLP data - adding state system info...
```

```
## The following country names are different in the destination system:
```



|ctryname                                                  | cowcode|extended_country_name                   | GWn| cown| min_date| max_date|  n|
|:---------------------------------------------------------|-------:|:---------------------------------------|---:|----:|--------:|--------:|--:|
|Belarus                                                   |     370|Belarus (Byelorussia)                   | 370|  370|     1991|     2008| 18|
|Bosnia and Herzegovina                                    |     346|Bosnia-Herzegovina                      | 346|  346|     1991|     2008| 18|
|Brunei Darussalam                                         |     835|Brunei                                  | 835|  835|     1984|     2008| 25|
|Burkina Faso                                              |     439|Burkina Faso (Upper Volta)              | 439|  439|     1960|     2008| 49|
|Cambodia                                                  |     811|Cambodia (Kampuchea)                    | 811|  811|     1953|     2008| 56|
|Congo (Brazzaville, Republic of Congo)                    |     484|Congo                                   | 484|  484|     1960|     2008| 49|
|Democratic Republic of the Congo (Zaire, Congo-Kinshasha) |     490|Congo, Democratic Republic of (Zaire)   | 490|  490|     1960|     2008| 49|
|Germany                                                   |     255|German Federal Republic                 | 260|  255|     1990|     2008| 19|
|Germany, East                                             |     265|German Democratic Republic              | 265|  265|     1949|     1989| 41|
|Germany, West                                             |     260|German Federal Republic                 | 260|  260|     1949|     1989| 41|
|Iran                                                      |     630|Iran (Persia)                           | 630|  630|     1946|     2008| 63|
|Italy                                                     |     325|Italy/Sardinia                          | 325|  325|     1946|     2008| 63|
|Kyrgyzstan                                                |     703|Kyrgyz Republic                         | 703|  703|     1991|     2008| 18|
|Libyan Arab Jamahiriya                                    |     620|Libya                                   | 620|  620|     1951|     2008| 58|
|Macedonia                                                 |     343|Macedonia (Former Yugoslav Republic of) | 343|  343|     1991|     2008| 18|
|Madagascar                                                |     580|Madagascar (Malagasy)                   | 580|  580|     1960|     2008| 49|
|Micronesia, Federated States of                           |     987|Federated States of Micronesia          | 987|  987|     1991|     2008| 18|
|Myanmar                                                   |     775|Myanmar (Burma)                         | 775|  775|     1948|     2008| 61|
|North Korea                                               |     731|Korea, People's Republic of             | 731|  731|     1948|     2008| 61|
|Russian Federation                                        |     365|Russia (Soviet Union)                   | 365|  365|     1991|     2008| 18|
|Samoa                                                     |     990|Samoa/Western Samoa                     | 990|  990|     1962|     2008| 47|
|Serbia and Montenegro                                     |     345|Yugoslavia                              | 345|  345|     1991|     2005| 15|
|South Korea                                               |     732|Korea, Republic of                      | 732|  732|     1948|     2008| 61|
|Sri Lanka                                                 |     780|Sri Lanka (Ceylon)                      | 780|  780|     1948|     2008| 61|
|St. Kitts and Nevis                                       |      60|Saint Kitts and Nevis                   |  60|   60|     1983|     2008| 26|
|St. Lucia                                                 |      56|Saint Lucia                             |  56|   56|     1979|     2008| 30|
|St. Vincent and the Grenadines                            |      57|Saint Vincent and the Grenadines        |  57|   57|     1979|     2008| 30|
|Suriname                                                  |     115|Surinam                                 | 115|  115|     1975|     2008| 34|
|Tanzania                                                  |     510|Tanzania/Tanganyika                     | 510|  510|     1961|     2008| 48|
|Turkey                                                    |     640|Turkey (Ottoman Empire)                 | 640|  640|     1946|     2008| 63|
|U.S.S.R.                                                  |     365|Russia (Soviet Union)                   | 365|  365|     1946|     1990| 45|
|Viet Nam                                                  |     816|Vietnam, Democratic Republic of         | 816|  816|     1976|     2008| 33|
|Vietnam, North                                            |     816|Vietnam, Democratic Republic of         | 816|  816|     1954|     1975| 22|
|Vietnam, South                                            |     817|Vietnam, Republic of                    | 817|  817|     1954|     1975| 22|
|Yemen                                                     |     679|Yemen (Arab Republic of Yemen)          | 678|  679|     1990|     2008| 19|
|Yemen Arab Republic                                       |     678|Yemen (Arab Republic of Yemen)          | 678|  678|     1946|     1989| 44|
|Yemen PDR (South)                                         |     680|Yemen, People's Republic of             | 680|  680|     1967|     1989| 23|
|Zimbabwe                                                  |     552|Zimbabwe (Rhodesia)                     | 552|  552|     1965|     2008| 44|

```
## Resulting dataset after processing has 9159 rows.
```

```
## Changing the name of the original country column from ctryname to pacl_country...
```

```
## Ensuring year column is numeric...
```

```
## Changing the name of the original code column from cowcode to pacl_cowcode...
```

```r
stopifnot(identical(pacl_pmm, tar_read(pacl_pmm, store = here::here("_targets"))))
stopifnot(identical(pacl_pmm, democracyData::pacl_pmm))
stopifnot(identical(pacl, tar_read(pacl, store = here::here("_targets"))))
stopifnot(identical(pacl, democracyData::pacl))
```
# PACL Update


```r
cite_dataset("pacl_update")
```

[1] C. Bjørnskov and M. Rode. "Regime types and regime change: A new
dataset on democracy, coups, and political institutions". In: _The
Review of International Organizations_ 15.2 (2020), pp. 531-551. DOI:
10.1007/s11558-019-09345-1.

```r
pacl_update <- redownload_pacl_update(verbose = verbose,
                                      include_in_output = include_in_output)
```

```
## Downloading Regime characteristics data...
```

```
## Trying http://www.christianbjoernskov.com/wp-content/uploads/2020/09/Bj%C3%B8rnskov-Rode-integrated-dataset-v3.2.xlsx ...
```

```
## The downloaded Regime characteristics dataset has 14768 rows
```

```
## Original dataset has 14768 rows
```

```
## Processing the Bjornskov and Rode PACL update data - adding state system info...
```

```
## The following country names are different in the destination system:
```



|country                  |extended_country_name                   | GWn| cown| min_date| max_date|  n|
|:------------------------|:---------------------------------------|---:|----:|--------:|--------:|--:|
|Antigua and Barbuda      |Antigua & Barbuda                       |  58|   58|     1950|     2020| 71|
|Belarus                  |Belarus (Byelorussia)                   | 370|  370|     1950|     2020| 71|
|Bosnia and Herzegovina   |Bosnia-Herzegovina                      | 346|  346|     1950|     2020| 71|
|British Virgin Islands   |Virgin Islands, British                 |  NA|   NA|     1950|     2020| 71|
|Burkina Faso             |Burkina Faso (Upper Volta)              | 439|  439|     1950|     2020| 71|
|Cambodia                 |Cambodia (Kampuchea)                    | 811|  811|     1950|     2020| 71|
|Congo, Dem. Rep.         |Congo, Democratic Republic of (Zaire)   | 490|  490|     1950|     2020| 71|
|Congo, Republic of       |Congo                                   | 484|  484|     1950|     2020| 71|
|Czech Republic           |Czechoslovakia                          | 315|  315|     1950|     1992| 43|
|Côte d`Ivoire            |Cote D'Ivoire                           | 437|  437|     1950|     2020| 71|
|Gambia, The              |Gambia                                  | 420|  420|     1950|     2020| 71|
|Germany                  |German Federal Republic                 | 260|  255|     1990|     2020| 31|
|Germany                  |German Federal Republic                 | 260|  260|     1950|     1989| 40|
|Iran                     |Iran (Persia)                           | 630|  630|     1950|     2020| 71|
|Italy                    |Italy/Sardinia                          | 325|  325|     1950|     2020| 71|
|Korea, People's Republic |Korea, People's Republic of             | 731|  731|     1950|     2020| 71|
|Kyrgyzstan               |Kyrgyz Republic                         | 703|  703|     1950|     2020| 71|
|Madagascar               |Madagascar (Malagasy)                   | 580|  580|     1950|     2020| 71|
|Micronesia, Fed. Sts.    |Federated States of Micronesia          | 987|  987|     1950|     2020| 71|
|Myanmar                  |Myanmar (Burma)                         | 775|  775|     1950|     2020| 71|
|North Macedonia          |Macedonia (Former Yugoslav Republic of) | 343|  343|     1950|     2020| 71|
|Russia                   |Russia (Soviet Union)                   | 365|  365|     1950|     2020| 71|
|Samoa                    |Samoa/Western Samoa                     | 990|  990|     1950|     2020| 71|
|Serbia                   |Yugoslavia                              | 345|  345|     1950|     2005| 56|
|Sint Maarten             |Sint Maarten (Dutch part)               |  NA|   NA|     1950|     2020| 71|
|Slovak Republic          |Slovakia                                | 317|  317|     1950|     2020| 71|
|Sri Lanka                |Sri Lanka (Ceylon)                      | 780|  780|     1950|     2020| 71|
|St. Kitts & Nevis        |Saint Kitts and Nevis                   |  60|   60|     1950|     2020| 71|
|St. Lucia                |Saint Lucia                             |  56|   56|     1950|     2020| 71|
|St.Vincent & Grenadines  |Saint Vincent and the Grenadines        |  57|   57|     1950|     2020| 71|
|Suriname                 |Surinam                                 | 115|  115|     1950|     2020| 71|
|Tanzania                 |Tanzania/Tanganyika                     | 510|  510|     1950|     2020| 71|
|Timor-Leste              |East Timor                              | 860|  860|     1950|     2020| 71|
|Trinidad &Tobago         |Trinidad and Tobago                     |  52|   52|     1950|     2020| 71|
|Turkey                   |Turkey (Ottoman Empire)                 | 640|  640|     1950|     2020| 71|
|Turks and Caicos         |Turks and Caicos Islands                |  NA|   NA|     1950|     2020| 71|
|US Virgin Islands        |Virgin Islands, U.S.                    |  NA|   NA|     1950|     2020| 71|
|United States            |United States of America                |   2|    2|     1950|     2020| 71|
|Vietnam                  |Vietnam, Democratic Republic of         | 816|  816|     1950|     2020| 71|
|Yemen                    |Yemen (Arab Republic of Yemen)          | 678|  678|     1950|     1989| 40|
|Yemen                    |Yemen (Arab Republic of Yemen)          | 678|  679|     1990|     2020| 31|
|Zimbabwe                 |Zimbabwe (Rhodesia)                     | 552|  552|     1950|     2020| 71|

```
## Resulting dataset after processing has 14768 rows.
```

```
## Changing the name of the original country column from country to pacl_update_country...
```

```
## Ensuring year column is numeric...
```

```
## Changing the name of the original code column from country_isocode to pacl_update_country_isocode...
```

```r
stopifnot(identical(pacl_update, tar_read(pacl_update, store = here::here("_targets"))))
stopifnot(identical(pacl_update, democracyData::pacl_update))
```

# PEPS 


```r
cite_dataset("peps")
```

[1] B. E. Moon, J. H. Birdsall, S. Ciesluk, et al. "Voting Counts:
Participation in the Measurement of Democracy". In: _Studies in
Comparative International Development_ 41.2 (2006), pp. 3-32. DOI:
10.1007/BF02686309.

```r
peps <- redownload_peps(verbose = verbose,
                        include_in_output = include_in_output)
```

```
## Downloading PEPS data...
```

```
## Trying http://www.lehigh.edu/~bm05/democracy/PEPS1pub.dta ...
```

```
## The downloaded PEPS dataset has 16403 rows
```

```
## Original dataset has 16403 rows
```

```
## Processing the PEPS data - fixing country names, adding state system info...
```

```
## New country column combines country names from Pname, Iname, and FHname to fill in blanks...
```

```
## The following different countries/country codes match to a single country unit in the destination system:
```



|country  | ccode|extended_country_name | GWn| cown| min_date| max_date|  n|
|:--------|-----:|:---------------------|---:|----:|--------:|--------:|--:|
|Italy    |   325|Italy/Sardinia        | 325|  325|     1861|     1861|  1|
|Sardinia |   324|Italy/Sardinia        | 325|  325|     1861|     1861|  1|

```
## The following country names are different in the destination system:
```



|country               | ccode|extended_country_name                   | GWn| cown| min_date| max_date|   n|
|:---------------------|-----:|:---------------------------------------|---:|----:|--------:|--------:|---:|
|Belarus               |   370|Belarus (Byelorussia)                   | 370|  370|     1991|     2003|  13|
|Bosnia                |   346|Bosnia-Herzegovina                      | 346|  346|     1992|     2003|  12|
|Burkina Faso          |   439|Burkina Faso (Upper Volta)              | 439|  439|     1960|     2003|  44|
|Cambodia              |   811|Cambodia (Kampuchea)                    | 811|  811|     1953|     2003|  51|
|Congo Brazzaville     |   484|Congo                                   | 484|  484|     1960|     2003|  44|
|Congo Kinshasa        |   490|Congo, Democratic Republic of (Zaire)   | 490|  490|     1960|     2003|  44|
|Dominican Rep         |    42|Dominican Republic                      |  42|   42|     1844|     2003| 160|
|Germany               |   255|German Federal Republic                 | 260|  255|     1990|     2003|  14|
|Germany               |   255|Germany (Prussia)                       | 255|  255|     1868|     1944|  77|
|Germany East          |   265|German Democratic Republic              | 265|  265|     1945|     1989|  45|
|Germany West          |   260|German Federal Republic                 | 260|  260|     1945|     1989|  45|
|Gran Colombia         |    99|Great Colombia                          |  99|   NA|     1821|     1832|  12|
|Iran                  |   630|Iran (Persia)                           | 630|  630|     1800|     2003| 204|
|Italy                 |   325|Italy/Sardinia                          | 325|  325|     1861|     2003| 143|
|Ivory Coast           |   437|Cote D'Ivoire                           | 437|  437|     1960|     2003|  44|
|Korea North           |   731|Korea, People's Republic of             | 731|  731|     1948|     2003|  56|
|Korea South           |   732|Korea, Republic of                      | 732|  732|     1948|     2003|  56|
|Kyrgyzstan            |   703|Kyrgyz Republic                         | 703|  703|     1991|     2003|  13|
|Macedonia             |   343|Macedonia (Former Yugoslav Republic of) | 343|  343|     1991|     2003|  13|
|Madagascar            |   580|Madagascar (Malagasy)                   | 580|  580|     1960|     2003|  44|
|Prussia               |   255|Germany (Prussia)                       | 255|  255|     1800|     1867|  68|
|Russia                |   365|Russia (Soviet Union)                   | 365|  365|     1800|     2003| 134|
|Sardinia              |   324|Italy/Sardinia                          | 325|  325|     1815|     1861|  47|
|Serbia and Montenegro |   347|Yugoslavia                              | 345|  345|     2003|     2003|   1|
|Sri Lanka             |   780|Sri Lanka (Ceylon)                      | 780|  780|     1948|     2003|  56|
|Tanzania              |   510|Tanzania/Tanganyika                     | 510|  510|     1961|     2003|  43|
|Trinidad              |    52|Trinidad and Tobago                     |  52|   52|     1962|     2003|  42|
|Turkey                |   640|Turkey (Ottoman Empire)                 | 640|  640|     1800|     2003| 204|
|Two Sicilies          |   329|Sicily (Two Sicilies)                   | 329|  329|     1816|     1860|  45|
|UAE                   |   696|United Arab Emirates                    | 696|  696|     1971|     2003|  33|
|USSR                  |   364|Russia (Soviet Union)                   | 365|  365|     1922|     1991|  70|
|United Province CA    |    89|United Provinces of Central America     |  89|   NA|     1824|     1838|  15|
|United States         |     2|United States of America                |   2|    2|     1800|     2003| 204|
|Vietnam               |   818|Vietnam, Democratic Republic of         | 816|  816|     1976|     2003|  28|
|Vietnam North         |   816|Vietnam, Democratic Republic of         | 816|  816|     1954|     1975|  22|
|Vietnam South         |   817|Vietnam, Republic of                    | 817|  817|     1955|     1975|  21|
|Wuerttemburg          |   271|Wurttemberg                             | 271|  271|     1800|     1871|  72|
|Yemen                 |   679|Yemen (Arab Republic of Yemen)          | 678|  679|     1990|     2003|  14|
|Yemen North           |   678|Yemen (Arab Republic of Yemen)          | 678|  678|     1918|     1989|  72|
|Yemen South           |   680|Yemen, People's Republic of             | 680|  680|     1967|     1989|  23|
|Zimbabwe              |   552|Zimbabwe (Rhodesia)                     | 552|  552|     1970|     2003|  34|

```
## Resulting dataset after processing has 15089 rows.
```

```
## Note: the number of rows in the processed PEPS data is different from the number of rows in the original data.
```

```
## This is due to the exclusion of rows where Pname is blank and no data is available in other columns.
```

```
## Dropping Pname, Iname, and FHname columns...
```

```
## Changing the name of the original country column from country to peps_country...
```

```
## Ensuring year column is numeric...
```

```
## Changing the name of the original code column from ccode to peps_ccode...
```

```r
stopifnot(identical(peps, tar_read(peps, store = here::here("_targets"))))
stopifnot(identical(peps, democracyData::peps))
```

# Polity


```r
cite_dataset("polity")
```

[1] M. G. Marshall and T. R. Gurr. _Polity 5: Political Regime
Characteristics and Transitions, 1800-2018. Dataset Users' Manual._
Center for Systemic Peace, 2020.

[2] M. G. Marshall, T. R. Gurr, and K. Jaggers. _Polity IV Project:
Political Regime Characteristics and Transitions, 1800-2018. Dataset
Users' Manual._ Center for Systemic Peace, 2019.

```r
polity_pmm <- extract_pmm_var(pmm_replication, pmm_polity,
                              include_in_output = include_in_output)

polityIV <- redownload_polityIV(verbose = verbose,
                                 include_in_output = include_in_output)
```

```
## Downloading polity data...
```

```
## Trying http://www.systemicpeace.org/inscr/p4v2018.xls ...
```

```
## The downloaded polity dataset has 17562 rows
```

```
## Original dataset has 17562 rows.
```

```
## Processing the Polity IV data - adding state system info...
```

```
## The following different countries/country codes match to a single country unit in the destination system:
```



|country       | ccode|extended_country_name           | GWn| cown| min_date| max_date|  n|
|:-------------|-----:|:-------------------------------|---:|----:|--------:|--------:|--:|
|Ethiopia      |   529|Ethiopia                        | 530|  530|     1993|     1993|  1|
|Ethiopia      |   530|Ethiopia                        | 530|  530|     1993|     1993|  1|
|Italy         |   325|Italy/Sardinia                  | 325|  325|     1861|     1861|  1|
|Russia        |   365|Russia (Soviet Union)           | 365|  365|     1922|     1922|  1|
|Sardinia      |   324|Italy/Sardinia                  | 325|  325|     1861|     1861|  1|
|Sudan         |   625|Sudan                           | 625|  625|     2011|     2011|  1|
|Sudan-North   |   626|Sudan                           | 625|  625|     2011|     2011|  1|
|USSR          |   364|Russia (Soviet Union)           | 365|  365|     1922|     1922|  1|
|Vietnam       |   818|Vietnam, Democratic Republic of | 816|  816|     1976|     1976|  1|
|Vietnam North |   816|Vietnam, Democratic Republic of | 816|  816|     1976|     1976|  1|
|Yugoslavia    |   345|Yugoslavia                      | 345|  345|     1991|     1991|  1|
|Yugoslavia    |   347|Yugoslavia                      | 345|  345|     1991|     1991|  1|

```
## The following country names are different in the destination system:
```



|country               | ccode|extended_country_name                   | GWn| cown| min_date| max_date|   n|
|:---------------------|-----:|:---------------------------------------|---:|----:|--------:|--------:|---:|
|Belarus               |   370|Belarus (Byelorussia)                   | 370|  370|     1991|     2018|  28|
|Bosnia                |   346|Bosnia-Herzegovina                      | 346|  346|     1992|     2018|  27|
|Burkina Faso          |   439|Burkina Faso (Upper Volta)              | 439|  439|     1960|     2018|  59|
|Cambodia              |   811|Cambodia (Kampuchea)                    | 811|  811|     1953|     2018|  66|
|Congo Brazzaville     |   484|Congo                                   | 484|  484|     1960|     2018|  59|
|Congo Kinshasa        |   490|Congo, Democratic Republic of (Zaire)   | 490|  490|     1960|     2018|  59|
|Germany               |   255|German Federal Republic                 | 260|  255|     1945|     2018|  30|
|Germany               |   255|Germany (Prussia)                       | 255|  255|     1868|     1944|  77|
|Germany East          |   265|German Democratic Republic              | 265|  265|     1945|     1990|  46|
|Germany West          |   260|German Federal Republic                 | 260|  260|     1945|     1990|  46|
|Gran Colombia         |    99|Great Colombia                          |  99|   NA|     1821|     1832|  12|
|Iran                  |   630|Iran (Persia)                           | 630|  630|     1800|     2018| 219|
|Italy                 |   325|Italy/Sardinia                          | 325|  325|     1861|     2018| 158|
|Ivory Coast           |   437|Cote D'Ivoire                           | 437|  437|     1960|     2015|  56|
|Korea North           |   731|Korea, People's Republic of             | 731|  731|     1948|     2018|  71|
|Korea South           |   732|Korea, Republic of                      | 732|  732|     1948|     2018|  71|
|Kyrgyzstan            |   703|Kyrgyz Republic                         | 703|  703|     1991|     2018|  28|
|Macedonia             |   343|Macedonia (Former Yugoslav Republic of) | 343|  343|     1991|     2018|  28|
|Madagascar            |   580|Madagascar (Malagasy)                   | 580|  580|     1960|     2018|  59|
|Prussia               |   255|Germany (Prussia)                       | 255|  255|     1800|     1867|  68|
|Russia                |   365|Russia (Soviet Union)                   | 365|  365|     1800|     2018| 150|
|Sardinia              |   324|Italy/Sardinia                          | 325|  325|     1815|     1861|  47|
|Serbia and Montenegro |   347|Yugoslavia                              | 345|  345|     2003|     2006|   4|
|Slovak Republic       |   317|Slovakia                                | 317|  317|     1993|     2018|  26|
|Sri Lanka             |   780|Sri Lanka (Ceylon)                      | 780|  780|     1948|     2018|  71|
|Sudan-North           |   626|Sudan                                   | 625|  625|     2011|     2018|   8|
|Suriname              |   115|Surinam                                 | 115|  115|     1975|     2018|  44|
|Tanzania              |   510|Tanzania/Tanganyika                     | 510|  510|     1961|     2018|  58|
|Timor Leste           |   860|East Timor                              | 860|  860|     2016|     2018|   3|
|Turkey                |   640|Turkey (Ottoman Empire)                 | 640|  640|     1800|     2018| 219|
|Two Sicilies          |   329|Sicily (Two Sicilies)                   | 329|  329|     1816|     1860|  45|
|UAE                   |   696|United Arab Emirates                    | 696|  696|     1971|     2018|  48|
|USSR                  |   364|Russia (Soviet Union)                   | 365|  365|     1922|     1991|  70|
|United Province CA    |    89|United Provinces of Central America     |  89|   NA|     1824|     1838|  15|
|United States         |     2|United States of America                |   2|    2|     1800|     2018| 219|
|Vietnam               |   818|Vietnam, Democratic Republic of         | 816|  816|     1976|     2018|  43|
|Vietnam North         |   816|Vietnam, Democratic Republic of         | 816|  816|     1954|     1976|  23|
|Vietnam South         |   817|Vietnam, Republic of                    | 817|  817|     1955|     1975|  21|
|Wuerttemburg          |   271|Wurttemberg                             | 271|  271|     1800|     1871|  72|
|Yemen                 |   679|Yemen (Arab Republic of Yemen)          | 678|  679|     1990|     2018|  29|
|Yemen North           |   678|Yemen (Arab Republic of Yemen)          | 678|  678|     1918|     1990|  73|
|Yemen South           |   680|Yemen, People's Republic of             | 680|  680|     1967|     1990|  24|
|Zimbabwe              |   552|Zimbabwe (Rhodesia)                     | 552|  552|     1970|     2018|  49|

```
## Resulting dataset after processing has 17562 rows.
```

```
## Changing the name of the original country column from country to polityIV_country...
```

```
## Ensuring year column is numeric...
```

```
## Changing the name of the original code column from ccode to polityIV_ccode...
```

```r
polity5 <- download_polity_annual(verbose = verbose,
                                 include_in_output = include_in_output)
```

```
## Downloading polity data...
```

```
## Trying http://www.systemicpeace.org/inscr/p5v2018.sav ...
```

```
## The downloaded polity dataset has 17574 rows
```

```
## Original dataset has 17574 rows.
```

```
## Processing the Polity 5 data - adding state system info...
```

```
## The following different countries/country codes match to a single country unit in the destination system:
```



|country       | ccode|extended_country_name           | GWn| cown| min_date| max_date|  n|
|:-------------|-----:|:-------------------------------|---:|----:|--------:|--------:|--:|
|Ethiopia      |   529|Ethiopia                        | 530|  530|     1993|     1993|  1|
|Ethiopia      |   530|Ethiopia                        | 530|  530|     1993|     1993|  1|
|Italy         |   325|Italy/Sardinia                  | 325|  325|     1861|     1861|  1|
|Russia        |   365|Russia (Soviet Union)           | 365|  365|     1922|     1922|  1|
|Sardinia      |   324|Italy/Sardinia                  | 325|  325|     1861|     1861|  1|
|Sudan         |   625|Sudan                           | 625|  625|     2011|     2011|  1|
|Sudan-North   |   626|Sudan                           | 625|  625|     2011|     2011|  1|
|USSR          |   364|Russia (Soviet Union)           | 365|  365|     1922|     1922|  1|
|Vietnam       |   818|Vietnam, Democratic Republic of | 816|  816|     1976|     1976|  1|
|Vietnam North |   816|Vietnam, Democratic Republic of | 816|  816|     1976|     1976|  1|
|Yugoslavia    |   345|Yugoslavia                      | 345|  345|     1991|     1991|  1|
|Yugoslavia    |   347|Yugoslavia                      | 345|  345|     1991|     1991|  1|

```
## The following country names are different in the destination system:
```



|country               | ccode|extended_country_name                   | GWn| cown| min_date| max_date|   n|
|:---------------------|-----:|:---------------------------------------|---:|----:|--------:|--------:|---:|
|Belarus               |   370|Belarus (Byelorussia)                   | 370|  370|     1991|     2018|  28|
|Bosnia                |   346|Bosnia-Herzegovina                      | 346|  346|     1992|     2018|  27|
|Burkina Faso          |   439|Burkina Faso (Upper Volta)              | 439|  439|     1960|     2018|  59|
|Cambodia              |   811|Cambodia (Kampuchea)                    | 811|  811|     1953|     2018|  66|
|Congo Brazzaville     |   484|Congo                                   | 484|  484|     2005|     2018|  14|
|Congo Kinshasa        |   490|Congo, Democratic Republic of (Zaire)   | 490|  490|     1960|     2018|  59|
|Congo-Brazzaville     |   484|Congo                                   | 484|  484|     1960|     2004|  45|
|Germany               |   255|German Federal Republic                 | 260|  255|     1945|     2018|  30|
|Germany               |   255|Germany (Prussia)                       | 255|  255|     1868|     1944|  77|
|Germany East          |   265|German Democratic Republic              | 265|  265|     1945|     1990|  46|
|Germany West          |   260|German Federal Republic                 | 260|  260|     1945|     1990|  46|
|Gran Colombia         |    99|Great Colombia                          |  99|   NA|     1821|     1832|  12|
|Iran                  |   630|Iran (Persia)                           | 630|  630|     1800|     2018| 219|
|Italy                 |   325|Italy/Sardinia                          | 325|  325|     1861|     2018| 158|
|Ivory Coast           |   437|Cote D'Ivoire                           | 437|  437|     2014|     2015|   2|
|Korea North           |   731|Korea, People's Republic of             | 731|  731|     1948|     2018|  71|
|Korea South           |   732|Korea, Republic of                      | 732|  732|     1948|     2018|  71|
|Kyrgyzstan            |   703|Kyrgyz Republic                         | 703|  703|     1991|     2018|  28|
|Macedonia             |   343|Macedonia (Former Yugoslav Republic of) | 343|  343|     1991|     2018|  28|
|Madagascar            |   580|Madagascar (Malagasy)                   | 580|  580|     1960|     2018|  59|
|Prussia               |   255|Germany (Prussia)                       | 255|  255|     1800|     1867|  68|
|Russia                |   365|Russia (Soviet Union)                   | 365|  365|     1800|     2018| 150|
|Sardinia              |   324|Italy/Sardinia                          | 325|  325|     1815|     1861|  47|
|Serbia and Montenegro |   347|Yugoslavia                              | 345|  345|     2003|     2006|   4|
|Slovak Republic       |   317|Slovakia                                | 317|  317|     1993|     2018|  26|
|South Vietnam         |   817|Vietnam, Republic of                    | 817|  817|     1955|     1975|  21|
|Sri Lanka             |   780|Sri Lanka (Ceylon)                      | 780|  780|     1948|     2018|  71|
|Sudan-North           |   626|Sudan                                   | 625|  625|     2011|     2018|   8|
|Suriname              |   115|Surinam                                 | 115|  115|     1975|     2018|  44|
|Tanzania              |   510|Tanzania/Tanganyika                     | 510|  510|     1961|     2018|  58|
|Timor Leste           |   860|East Timor                              | 860|  860|     2002|     2018|  17|
|Turkey                |   640|Turkey (Ottoman Empire)                 | 640|  640|     1800|     2018| 219|
|Two Sicilies          |   329|Sicily (Two Sicilies)                   | 329|  329|     1816|     1860|  45|
|UAE                   |   696|United Arab Emirates                    | 696|  696|     1971|     2018|  48|
|USSR                  |   364|Russia (Soviet Union)                   | 365|  365|     1922|     1991|  70|
|United Province CA    |    89|United Provinces of Central America     |  89|   NA|     1824|     1838|  15|
|United States         |     2|United States of America                |   2|    2|     1776|     2020| 245|
|Vietnam               |   818|Vietnam, Democratic Republic of         | 816|  816|     1976|     2018|  43|
|Vietnam North         |   816|Vietnam, Democratic Republic of         | 816|  816|     1954|     1976|  23|
|Wuerttemburg          |   271|Wurttemberg                             | 271|  271|     1800|     1871|  72|
|Yemen                 |   679|Yemen (Arab Republic of Yemen)          | 678|  679|     1990|     2018|  29|
|Yemen North           |   678|Yemen (Arab Republic of Yemen)          | 678|  678|     1918|     1990|  73|
|Yemen South           |   680|Yemen, People's Republic of             | 680|  680|     1967|     1990|  24|
|Zimbabwe              |   552|Zimbabwe (Rhodesia)                     | 552|  552|     1980|     2018|  39|

```
## Resulting dataset after processing has 17574 rows.
```

```
## Changing the name of the original country column from country to polity_annual_country...
```

```
## Ensuring year column is numeric...
```

```
## Changing the name of the original code column from ccode to polity_annual_ccode...
```

```r
stopifnot(identical(polity_pmm, tar_read(polity_pmm, store = here::here("_targets"))))
stopifnot(identical(polity_pmm, democracyData::polity_pmm))
stopifnot(identical(polityIV, tar_read(polityIV, store = here::here("_targets"))))
stopifnot(identical(polityIV, democracyData::polityIV))
stopifnot(identical(polity5, tar_read(polity5)))
stopifnot(identical(polity5, democracyData::polity5))
```

# PITF


```r
cite_dataset("pitf")
```

[1] J. Goldstone, R. Bates, D. Epstein, et al. "A Global Model for
Forecasting Political Instability". In: _American Journal of Political
Science_ 54.1 (2010), pp. 190-208. DOI:
10.1111/j.1540-5907.2009.00426.x.

[2] S. J. Taylor and J. Ulfelder. "A Measurement Error Model of
Dichotomous Democracy Status". In: _Available at SSRN_ (2015). DOI:
10.2139/ssrn.2726962.

```r
pitf_p4 <- create_pitf_scores(polityIV, verbose = verbose, include_in_output = include_in_output)
```

```
## Creating PITF scores -- excluding interruption codes...
```

```
## Resulting data has 16581 rows, fewer than Polity dataset, because of exclusion of interruption codes
```

```r
pitf <- create_pitf_scores(verbose = verbose, include_in_output = include_in_output)
```

```
## Downloading polity data...
```

```
## Trying http://www.systemicpeace.org/inscr/p5v2018.sav ...
```

```
## The downloaded polity dataset has 17574 rows
```

```
## Original dataset has 17574 rows.
```

```
## Processing the Polity 5 data - adding state system info...
```

```
## The following different countries/country codes match to a single country unit in the destination system:
```



|country       | ccode|extended_country_name           | GWn| cown| min_date| max_date|  n|
|:-------------|-----:|:-------------------------------|---:|----:|--------:|--------:|--:|
|Ethiopia      |   529|Ethiopia                        | 530|  530|     1993|     1993|  1|
|Ethiopia      |   530|Ethiopia                        | 530|  530|     1993|     1993|  1|
|Italy         |   325|Italy/Sardinia                  | 325|  325|     1861|     1861|  1|
|Russia        |   365|Russia (Soviet Union)           | 365|  365|     1922|     1922|  1|
|Sardinia      |   324|Italy/Sardinia                  | 325|  325|     1861|     1861|  1|
|Sudan         |   625|Sudan                           | 625|  625|     2011|     2011|  1|
|Sudan-North   |   626|Sudan                           | 625|  625|     2011|     2011|  1|
|USSR          |   364|Russia (Soviet Union)           | 365|  365|     1922|     1922|  1|
|Vietnam       |   818|Vietnam, Democratic Republic of | 816|  816|     1976|     1976|  1|
|Vietnam North |   816|Vietnam, Democratic Republic of | 816|  816|     1976|     1976|  1|
|Yugoslavia    |   345|Yugoslavia                      | 345|  345|     1991|     1991|  1|
|Yugoslavia    |   347|Yugoslavia                      | 345|  345|     1991|     1991|  1|

```
## The following country names are different in the destination system:
```



|country               | ccode|extended_country_name                   | GWn| cown| min_date| max_date|   n|
|:---------------------|-----:|:---------------------------------------|---:|----:|--------:|--------:|---:|
|Belarus               |   370|Belarus (Byelorussia)                   | 370|  370|     1991|     2018|  28|
|Bosnia                |   346|Bosnia-Herzegovina                      | 346|  346|     1992|     2018|  27|
|Burkina Faso          |   439|Burkina Faso (Upper Volta)              | 439|  439|     1960|     2018|  59|
|Cambodia              |   811|Cambodia (Kampuchea)                    | 811|  811|     1953|     2018|  66|
|Congo Brazzaville     |   484|Congo                                   | 484|  484|     2005|     2018|  14|
|Congo Kinshasa        |   490|Congo, Democratic Republic of (Zaire)   | 490|  490|     1960|     2018|  59|
|Congo-Brazzaville     |   484|Congo                                   | 484|  484|     1960|     2004|  45|
|Germany               |   255|German Federal Republic                 | 260|  255|     1945|     2018|  30|
|Germany               |   255|Germany (Prussia)                       | 255|  255|     1868|     1944|  77|
|Germany East          |   265|German Democratic Republic              | 265|  265|     1945|     1990|  46|
|Germany West          |   260|German Federal Republic                 | 260|  260|     1945|     1990|  46|
|Gran Colombia         |    99|Great Colombia                          |  99|   NA|     1821|     1832|  12|
|Iran                  |   630|Iran (Persia)                           | 630|  630|     1800|     2018| 219|
|Italy                 |   325|Italy/Sardinia                          | 325|  325|     1861|     2018| 158|
|Ivory Coast           |   437|Cote D'Ivoire                           | 437|  437|     2014|     2015|   2|
|Korea North           |   731|Korea, People's Republic of             | 731|  731|     1948|     2018|  71|
|Korea South           |   732|Korea, Republic of                      | 732|  732|     1948|     2018|  71|
|Kyrgyzstan            |   703|Kyrgyz Republic                         | 703|  703|     1991|     2018|  28|
|Macedonia             |   343|Macedonia (Former Yugoslav Republic of) | 343|  343|     1991|     2018|  28|
|Madagascar            |   580|Madagascar (Malagasy)                   | 580|  580|     1960|     2018|  59|
|Prussia               |   255|Germany (Prussia)                       | 255|  255|     1800|     1867|  68|
|Russia                |   365|Russia (Soviet Union)                   | 365|  365|     1800|     2018| 150|
|Sardinia              |   324|Italy/Sardinia                          | 325|  325|     1815|     1861|  47|
|Serbia and Montenegro |   347|Yugoslavia                              | 345|  345|     2003|     2006|   4|
|Slovak Republic       |   317|Slovakia                                | 317|  317|     1993|     2018|  26|
|South Vietnam         |   817|Vietnam, Republic of                    | 817|  817|     1955|     1975|  21|
|Sri Lanka             |   780|Sri Lanka (Ceylon)                      | 780|  780|     1948|     2018|  71|
|Sudan-North           |   626|Sudan                                   | 625|  625|     2011|     2018|   8|
|Suriname              |   115|Surinam                                 | 115|  115|     1975|     2018|  44|
|Tanzania              |   510|Tanzania/Tanganyika                     | 510|  510|     1961|     2018|  58|
|Timor Leste           |   860|East Timor                              | 860|  860|     2002|     2018|  17|
|Turkey                |   640|Turkey (Ottoman Empire)                 | 640|  640|     1800|     2018| 219|
|Two Sicilies          |   329|Sicily (Two Sicilies)                   | 329|  329|     1816|     1860|  45|
|UAE                   |   696|United Arab Emirates                    | 696|  696|     1971|     2018|  48|
|USSR                  |   364|Russia (Soviet Union)                   | 365|  365|     1922|     1991|  70|
|United Province CA    |    89|United Provinces of Central America     |  89|   NA|     1824|     1838|  15|
|United States         |     2|United States of America                |   2|    2|     1776|     2020| 245|
|Vietnam               |   818|Vietnam, Democratic Republic of         | 816|  816|     1976|     2018|  43|
|Vietnam North         |   816|Vietnam, Democratic Republic of         | 816|  816|     1954|     1976|  23|
|Wuerttemburg          |   271|Wurttemberg                             | 271|  271|     1800|     1871|  72|
|Yemen                 |   679|Yemen (Arab Republic of Yemen)          | 678|  679|     1990|     2018|  29|
|Yemen North           |   678|Yemen (Arab Republic of Yemen)          | 678|  678|     1918|     1990|  73|
|Yemen South           |   680|Yemen, People's Republic of             | 680|  680|     1967|     1990|  24|
|Zimbabwe              |   552|Zimbabwe (Rhodesia)                     | 552|  552|     1980|     2018|  39|

```
## Resulting dataset after processing has 17574 rows.
```

```
## Changing the name of the original country column from country to polity_annual_country...
```

```
## Ensuring year column is numeric...
```

```
## Changing the name of the original code column from ccode to polity_annual_ccode...
```

```
## Creating PITF scores -- excluding interruption codes...
```

```
## Resulting data has 16582 rows, fewer than Polity dataset, because of exclusion of interruption codes
```

```r
stopifnot(identical(pitf_p4, tar_read(pitf_p4)))
stopifnot(identical(pitf_p4, democracyData::pitf_p4))
stopifnot(identical(pitf, tar_read(pitf, store = here::here("_targets"))))
stopifnot(identical(pitf, democracyData::pitf))
```

# Polyarchy


```r
cite_dataset("polyarchy")
```

[1] M. Coppedge, A. Alvarez, and C. Maldonado. "Two Persistent
Dimensions of Democracy: Contestation and Inclusiveness". In: _The
journal of politics_ 70.03 (2008), pp. 632-647. DOI:
10.1017/S0022381608080663.

[2] M. Coppedge and W. H. Reinicke. "Measuring Polyarchy". In: _Studies
in Comparative International Development_ 25.1 (1990), pp. 51-72. DOI:
10.1007/Bf02716905.

```r
polyarchy_pmm <- extract_pmm_var(pmm_replication, pmm_polyarchy,
                                 include_in_output = include_in_output)

polyarchy <- redownload_polyarchy_original(verbose = verbose,
                                           include_in_output = include_in_output)
```

```
## Downloading Polyarchy original data...
```

```
## Trying https://www3.nd.edu/~mcoppedg/crd/poly8500.sav ...
```

```
## The downloaded Polyarchy original dataset has 197 rows
```

```
## Putting the dataset in country-year format and adding state system information.
```

```
## Warning: attributes are not identical across measure variables; they will be
## dropped
```

```
## The following country names are different in the destination system:
```



|Country          |extended_country_name                   | GWn| cown| min_date| max_date|  n|
|:----------------|:---------------------------------------|---:|----:|--------:|--------:|--:|
|Antigua          |Antigua & Barbuda                       |  58|   58|     1985|     2000|  2|
|Belarus          |Belarus (Byelorussia)                   | 370|  370|     2000|     2000|  1|
|Bosnia & Herzego |Bosnia-Herzegovina                      | 346|  346|     2000|     2000|  1|
|Burkina          |Burkina Faso (Upper Volta)              | 439|  439|     1985|     2000|  2|
|Burma            |Myanmar (Burma)                         | 775|  775|     1985|     2000|  2|
|Cambodia         |Cambodia (Kampuchea)                    | 811|  811|     1985|     2000|  2|
|Central Af. Rep. |Central African Republic                | 482|  482|     1985|     2000|  2|
|Congo, Dem. Rep. |Congo, Democratic Republic of (Zaire)   | 490|  490|     1985|     2000|  2|
|Congo, Rep. of   |Congo                                   | 484|  484|     1985|     2000|  2|
|Czech Rep        |Czech Republic                          | 316|  316|     2000|     2000|  1|
|Czech Rep        |Czechoslovakia                          | 315|  315|     1985|     1985|  1|
|Equ. Guinea      |Equatorial Guinea                       | 411|  411|     1985|     2000|  2|
|GDR              |German Democratic Republic              | 265|  265|     1985|     1985|  1|
|Germany          |German Federal Republic                 | 260|  255|     2000|     2000|  1|
|Germany          |German Federal Republic                 | 260|  260|     1985|     1985|  1|
|Iran             |Iran (Persia)                           | 630|  630|     1985|     2000|  2|
|Italy            |Italy/Sardinia                          | 325|  325|     1985|     2000|  2|
|Kyrgyz Rep.      |Kyrgyz Republic                         | 703|  703|     2000|     2000|  1|
|Macedonia        |Macedonia (Former Yugoslav Republic of) | 343|  343|     2000|     2000|  1|
|Madagascar       |Madagascar (Malagasy)                   | 580|  580|     1985|     2000|  2|
|Marshall         |Marshall Islands                        | 983|  983|     2000|     2000|  1|
|Micronesia       |Federated States of Micronesia          | 987|  987|     2000|     2000|  1|
|North Korea      |Korea, People's Republic of             | 731|  731|     1985|     2000|  2|
|North Yemen      |Yemen (Arab Republic of Yemen)          | 678|  678|     1985|     1985|  1|
|North Yemen      |Yemen (Arab Republic of Yemen)          | 678|  679|     2000|     2000|  1|
|Russia/USSR      |Russia (Soviet Union)                   | 365|  365|     1985|     2000|  2|
|Saint Kitts & N  |Saint Kitts and Nevis                   |  60|   60|     1985|     2000|  2|
|Saint Vincent G  |Saint Vincent and the Grenadines        |  57|   57|     1985|     2000|  2|
|Samoa            |Samoa/Western Samoa                     | 990|  990|     1985|     2000|  2|
|Sao Tome & P     |Sao Tome and Principe                   | 403|  403|     1985|     2000|  2|
|Slovak Rep       |Slovakia                                | 317|  317|     2000|     2000|  1|
|South Korea      |Korea, Republic of                      | 732|  732|     1985|     2000|  2|
|South Yemen      |Yemen, People's Republic of             | 680|  680|     1985|     1985|  1|
|Sri Lanka        |Sri Lanka (Ceylon)                      | 780|  780|     1985|     2000|  2|
|Suriname         |Surinam                                 | 115|  115|     1985|     2000|  2|
|Tanzania         |Tanzania/Tanganyika                     | 510|  510|     1985|     2000|  2|
|Trinidad         |Trinidad and Tobago                     |  52|   52|     1985|     2000|  2|
|Turkey           |Turkey (Ottoman Empire)                 | 640|  640|     1985|     2000|  2|
|United Arab Emir |United Arab Emirates                    | 696|  696|     1985|     2000|  2|
|United States    |United States of America                |   2|    2|     1985|     2000|  2|
|Vatican          |Papal States                            | 327|  327|     1985|     1985|  1|
|Vietnam          |Vietnam, Democratic Republic of         | 816|  816|     1985|     2000|  2|
|Zimbabwe         |Zimbabwe (Rhodesia)                     | 552|  552|     1985|     2000|  2|

```
## Resulting dataset after processing has 363 rows.
```

```
## Note: the number of rows in the processed Polyarchy data is different from the number of rows in the original data.
```

```
## This is due to putting the dataset in country-year format.
```

```
## Changing the name of the original country column from Country to polyarchy_country...
```

```
## Ensuring year column is numeric...
```

```r
polyarchy_dimensions <- redownload_polyarchy_dimensions(verbose = verbose,
                                                        include_in_output = include_in_output)
```

```
## Downloading Polyarchy dimensions data...
```

```
## Trying http://www3.nd.edu/~mcoppedg/crd/DahlDims.sav ...
```

```
## The downloaded Polyarchy dimensions dataset has 7563 rows
```

```
## The following different countries/country codes match to a single country unit in the destination system:
```



|cname          |extended_country_name          | GWn| cown| min_date| max_date|  n|
|:--------------|:------------------------------|---:|----:|--------:|--------:|--:|
|Czech Republic |Czechoslovakia                 | 315|  315|     1989|     1989|  1|
|Czechoslovakia |Czechoslovakia                 | 315|  315|     1989|     1989|  1|
|Yemen          |Yemen (Arab Republic of Yemen) | 678|  678|     1989|     1989|  1|
|Yemen          |Yemen (Arab Republic of Yemen) | 678|  679|     1990|     1990|  1|
|Yemen, North   |Yemen (Arab Republic of Yemen) | 678|  678|     1989|     1989|  1|
|Yemen, North   |Yemen (Arab Republic of Yemen) | 678|  679|     1990|     1990|  1|

```
## The following country names are different in the destination system:
```



|cname                         |extended_country_name                   | GWn| cown| min_date| max_date|  n|
|:-----------------------------|:---------------------------------------|---:|----:|--------:|--------:|--:|
|Antigua and Barbuda           |Antigua & Barbuda                       |  58|   58|     1981|     2000| 20|
|Belarus                       |Belarus (Byelorussia)                   | 370|  370|     1989|     2000| 12|
|Bosnia and Herzegovina        |Bosnia-Herzegovina                      | 346|  346|     1989|     2000| 12|
|Brunei Darussalam             |Brunei                                  | 835|  835|     1971|     2000| 30|
|Burkina Faso                  |Burkina Faso (Upper Volta)              | 439|  439|     1960|     2000| 41|
|Cambodia                      |Cambodia (Kampuchea)                    | 811|  811|     1953|     2000| 48|
|Congo, Democratic Republic    |Congo, Democratic Republic of (Zaire)   | 490|  490|     1960|     2000| 41|
|Czech Republic                |Czechoslovakia                          | 315|  315|     1989|     1989|  1|
|Germany                       |German Federal Republic                 | 260|  255|     1990|     2000| 11|
|Germany, East                 |German Democratic Republic              | 265|  265|     1950|     1989| 40|
|Germany, West                 |German Federal Republic                 | 260|  260|     1950|     1989| 40|
|Iran                          |Iran (Persia)                           | 630|  630|     1950|     2000| 51|
|Italy                         |Italy/Sardinia                          | 325|  325|     1950|     2000| 51|
|Korea, North                  |Korea, People's Republic of             | 731|  731|     1950|     2000| 51|
|Korea, South                  |Korea, Republic of                      | 732|  732|     1950|     2000| 51|
|Kyrgyzstan                    |Kyrgyz Republic                         | 703|  703|     1989|     2000| 12|
|Macedonia                     |Macedonia (Former Yugoslav Republic of) | 343|  343|     1989|     2000| 12|
|Madagascar                    |Madagascar (Malagasy)                   | 580|  580|     1960|     2000| 41|
|Micronesia                    |Federated States of Micronesia          | 987|  987|     1989|     2000| 12|
|Myanmar                       |Myanmar (Burma)                         | 775|  775|     1950|     2000| 51|
|Pakistan (-1971)              |Pakistan                                | 770|  770|     1950|     1971| 22|
|Pakistan (1972-)              |Pakistan                                | 770|  770|     1972|     2000| 29|
|Russian Federation            |Russia (Soviet Union)                   | 365|  365|     1992|     2000|  9|
|Samoa                         |Samoa/Western Samoa                     | 990|  990|     1962|     2000| 39|
|Serbia and Montenegro         |Yugoslavia                              | 345|  345|     1992|     2000|  9|
|Sri Lanka                     |Sri Lanka (Ceylon)                      | 780|  780|     1950|     2000| 51|
|St Kitts and Nevis            |Saint Kitts and Nevis                   |  60|   60|     1983|     2000| 18|
|St Lucia                      |Saint Lucia                             |  56|   56|     1979|     2000| 22|
|St Vincent and the Grenadines |Saint Vincent and the Grenadines        |  57|   57|     1979|     2000| 22|
|Suriname                      |Surinam                                 | 115|  115|     1975|     2000| 26|
|Tanzania                      |Tanzania/Tanganyika                     | 510|  510|     1961|     2000| 40|
|Timor-Leste                   |East Timor                              | 860|  860|     1989|     2000|  3|
|Turkey                        |Turkey (Ottoman Empire)                 | 640|  640|     1950|     2000| 51|
|USSR                          |Russia (Soviet Union)                   | 365|  365|     1950|     1991| 42|
|United States                 |United States of America                |   2|    2|     1950|     2000| 51|
|Vietnam                       |Vietnam, Democratic Republic of         | 816|  816|     1976|     2000| 25|
|Vietnam, North                |Vietnam, Democratic Republic of         | 816|  816|     1954|     1975| 22|
|Vietnam, South                |Vietnam (Annam/Cochin China/Tonkin)     | 815|   NA|     1989|     1989|  1|
|Vietnam, South                |Vietnam, Republic of                    | 817|  817|     1950|     1975| 26|
|Yemen                         |Yemen (Arab Republic of Yemen)          | 678|  678|     1989|     1989|  1|
|Yemen                         |Yemen (Arab Republic of Yemen)          | 678|  679|     1990|     2000| 11|
|Yemen, North                  |Yemen (Arab Republic of Yemen)          | 678|  678|     1950|     1989| 40|
|Yemen, North                  |Yemen (Arab Republic of Yemen)          | 678|  679|     1990|     1990|  1|
|Yemen, South                  |Yemen, People's Republic of             | 680|  680|     1967|     1990| 24|
|Zimbabwe                      |Zimbabwe (Rhodesia)                     | 552|  552|     1965|     2000| 36|

```
## Resulting dataset after processing has 7563 rows.
```

```
## Changing the name of the original country column from cname to polyarchy_dimensions_country...
```

```
## Ensuring year column is numeric...
```

```
## Changing the name of the original code column from ccodecow to polyarchy_dimensions_ccodecow...
```

```r
stopifnot(identical(polyarchy_pmm, tar_read(polyarchy_pmm, store = here::here("_targets"))))
stopifnot(identical(polyarchy_pmm, democracyData::polyarchy_pmm))
stopifnot(identical(polyarchy, tar_read(polyarchy, store = here::here("_targets"))))
stopifnot(identical(polyarchy, democracyData::polyarchy))
stopifnot(identical(polyarchy_dimensions, tar_read(polyarchy_dimensions, store = here::here("_targets"))))
stopifnot(identical(polyarchy_dimensions, democracyData::polyarchy_dimensions))
```

# Political Regime Change (PRC)/Gasiorowski dataset


```r
cite_dataset("prc_gasiorowski")
```

[1] M. Gasiorowski. "An Overview of the Political Regime Change
Dataset". In: _Comparative Political Studies_ 29.4 (1996), pp. 469-483.
DOI: 10.1177/0010414096029004004.

[2] G. Reich. "Categorizing Political Regimes: New Data for Old
Problems". In: _Democratization_ 9.4 (2002), pp. 1-24. DOI:
10.1080/714000289.

```r
prc_gasiorowski <- prepare_prc(path = here::here("data-raw/Gasiorowski.csv"),
                               verbose = verbose,
                               include_in_output = include_in_output)
```

```
## Rows: 503 Columns: 4
## ── Column specification ────────────────────────────────────────────────────────
## Delimiter: ","
## chr (2): country, regime
## dbl (2): start, end
## 
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
## The downloaded Political Regime Change (Gasiorowski) dataset has 503 rows
## 
## Converting to country-year format and adding state system info...
## 
## The following country and/or code-years were matched more than once:
```



|country                              |extended_country_name                 | GWn| cown| min_date| max_date|  n|
|:------------------------------------|:-------------------------------------|---:|----:|--------:|--------:|--:|
|Albania                              |Albania                               | 339|  339|     1990|     1991|  4|
|Algeria                              |Algeria                               | 615|  615|     1988|     1992|  6|
|Argentina                            |Argentina                             | 160|  160|     1862|     1983| 24|
|Australia                            |Australia                             | 900|  900|     1901|     1901|  2|
|Austria                              |Austria                               | 305|  305|     1934|     1934|  2|
|Bangladesh                           |Bangladesh                            | 771|  771|     1972|     1991| 16|
|Belgium                              |Belgium                               | 211|  211|     1919|     1919|  2|
|Benin                                |Benin                                 | 434|  434|     1963|     1991|  6|
|Bolivia                              |Bolivia                               | 145|  145|     1952|     1982|  8|
|Bosnia and Herzegovina               |Bosnia-Herzegovina                    | 346|  346|     1998|     1998|  2|
|Brazil                               |Brazil                                | 140|  140|     1945|     1985| 10|
|Bulgaria                             |Bulgaria                              | 355|  355|     1990|     1990|  3|
|Burkina Faso                         |Burkina Faso (Upper Volta)            | 439|  439|     1969|     1992| 14|
|Burundi                              |Burundi                               | 516|  516|     1992|     1996|  6|
|Cambodia                             |Cambodia (Kampuchea)                  | 811|  811|     1955|     1993|  6|
|Central Africa Republic              |Central African Republic              | 482|  482|     1991|     1993|  4|
|Chad                                 |Chad                                  | 483|  483|     1962|     1996|  4|
|Chile                                |Chile                                 | 155|  155|     1840|     1990| 10|
|Colombia                             |Colombia                              | 100|  100|     1910|     1958|  8|
|Congo                                |Congo                                 | 484|  484|     1963|     1997| 10|
|Costa Rica                           |Costa Rica                            |  94|   94|     1909|     1949| 10|
|Croatia                              |Croatia                               | 344|  344|     1990|     1990|  2|
|Cuba                                 |Cuba                                  |  40|   40|     1940|     1952|  4|
|Czechoslovakia                       |Czechoslovakia                        | 315|  315|     1938|     1990| 12|
|Denmark                              |Denmark                               | 390|  390|     1915|     1915|  2|
|Dominican Republic                   |Dominican Republic                    |  42|   42|     1962|     1978|  7|
|Ecuador                              |Ecuador                               | 130|  130|     1948|     1984| 16|
|El Salvador                          |El Salvador                           |  92|   92|     1927|     1994|  9|
|Estonia                              |Estonia                               | 366|  366|     1992|     1992|  2|
|Ethiopia                             |Ethiopia                              | 530|  530|     1991|     1995|  4|
|Finland                              |Finland                               | 375|  375|     1919|     1919|  2|
|France                               |France                                | 220|  220|     1851|     1944|  8|
|Gabon                                |Gabon                                 | 481|  481|     1964|     1995|  8|
|Georgia                              |Georgia                               | 372|  372|     1992|     1992|  3|
|Germany                              |German Federal Republic               | 260|  260|     1945|     1949|  4|
|Germany                              |Germany (Prussia)                     | 255|  255|     1919|     1933|  4|
|Ghana                                |Ghana                                 | 452|  452|     1960|     1992| 16|
|Greece                               |Greece                                | 350|  350|     1926|     1974| 11|
|Guatemala                            |Guatemala                             |  90|   90|     1944|     1996| 12|
|Haiti                                |Haiti                                 |  41|   41|     1990|     1994|  7|
|Honduras                             |Honduras                              |  91|   91|     1949|     1996| 12|
|Hungary                              |Hungary                               | 310|  310|     1922|     1989|  7|
|India                                |India                                 | 750|  750|     1952|     1977|  7|
|Indonesia                            |Indonesia                             | 850|  850|     1957|     1957|  2|
|Israel                               |Israel                                | 666|  666|     1949|     1949|  2|
|Italy                                |Italy/Sardinia                        | 325|  325|     1887|     1946| 10|
|Ivory Coast                          |Cote D'Ivoire                         | 437|  437|     1995|     1995|  2|
|Kenya                                |Kenya                                 | 501|  501|     1966|     1992| 10|
|Kyrgyzstan                           |Kyrgyz Republic                       | 703|  703|     1993|     1993|  2|
|Laos                                 |Laos                                  | 812|  812|     1956|     1959|  6|
|Latvia                               |Latvia                                | 367|  367|     1991|     1991|  2|
|Lebanon                              |Lebanon                               | 660|  660|     1975|     1992|  6|
|Lesotho                              |Lesotho                               | 570|  570|     1970|     1993|  4|
|Lithuania                            |Lithuania                             | 368|  368|     1992|     1992|  2|
|Madagascar                           |Madagascar (Malagasy)                 | 580|  580|     1971|     1993|  6|
|Malawi                               |Malawi                                | 553|  553|     1993|     1994|  4|
|Malaysia                             |Malaysia                              | 820|  820|     1969|     1971|  4|
|Mali                                 |Mali                                  | 432|  432|     1991|     1992|  4|
|Mexico                               |Mexico                                |  70|   70|     1988|     1997|  4|
|Moldova                              |Moldova                               | 359|  359|     1994|     1994|  2|
|Mongolia                             |Mongolia                              | 712|  712|     1988|     1990|  4|
|Morocco                              |Morocco                               | 600|  600|     1998|     1998|  2|
|Mozambique                           |Mozambique                            | 541|  541|     1995|     1995|  2|
|Myanmar                              |Myanmar (Burma)                       | 775|  775|     1962|     1962|  2|
|Namibia                              |Namibia                               | 565|  565|     1998|     1998|  2|
|Nepal                                |Nepal                                 | 790|  790|     1990|     1991|  4|
|Netherlands                          |Netherlands                           | 210|  210|     1917|     1917|  2|
|Nicaragua                            |Nicaragua                             |  93|   93|     1989|     1990|  4|
|Niger                                |Niger                                 | 436|  436|     1990|     1996|  6|
|Nigeria                              |Nigeria                               | 475|  475|     1966|     1983|  8|
|Norway                               |Norway                                | 385|  385|     1898|     1898|  2|
|Pakistan                             |Pakistan                              | 770|  770|     1958|     1990| 12|
|Panama                               |Panama                                |  95|   95|     1989|     1994|  4|
|Paraguay                             |Paraguay                              | 150|  150|     1989|     1993|  5|
|Peru                                 |Peru                                  | 135|  135|     1945|     1995| 20|
|Philippines                          |Philippines                           | 840|  840|     1953|     1986|  6|
|Poland                               |Poland                                | 290|  290|     1921|     1990| 10|
|Portugal                             |Portugal                              | 235|  235|     1911|     1976| 12|
|Romania                              |Romania                               | 360|  360|     1917|     1992| 10|
|Russia (Soviet Union)                |Russia (Soviet Union)                 | 365|  365|     1991|     1994|  4|
|Rwanda                               |Rwanda                                | 517|  517|     1963|     1963|  2|
|Senegal                              |Senegal                               | 433|  433|     1962|     1998|  8|
|Sierra Leone                         |Sierra Leone                          | 451|  451|     1967|     1973|  7|
|Slovak Republic                      |Slovakia                              | 317|  317|     1998|     1998|  2|
|Slovenia                             |Slovenia                              | 349|  349|     1990|     1990|  2|
|Somalia                              |Somalia                               | 520|  520|     1969|     1969|  2|
|South Africa                         |South Africa                          | 560|  560|     1993|     1994|  4|
|South Korea                          |Korea, Republic of                    | 732|  732|     1948|     1988| 11|
|Spain                                |Spain                                 | 230|  230|     1873|     1977| 18|
|Sri Lanka                            |Sri Lanka (Ceylon)                    | 780|  780|     1983|     1983|  2|
|Sudan                                |Sudan                                 | 625|  625|     1958|     1989| 14|
|Sweden                               |Sweden                                | 380|  380|     1866|     1917|  4|
|Taiwan                               |Taiwan                                | 713|  713|     1988|     1996|  6|
|Tanzania                             |Tanzania/Tanganyika                   | 510|  510|     1962|     1995|  8|
|Thailand                             |Thailand                              | 800|  800|     1946|     1992| 16|
|Togo                                 |Togo                                  | 461|  461|     1961|     1998| 10|
|Turkey                               |Turkey (Ottoman Empire)               | 640|  640|     1925|     1983| 22|
|Uganda                               |Uganda                                | 500|  500|     1966|     1966|  2|
|Ukraine                              |Ukraine                               | 369|  369|     1991|     1991|  2|
|United Kingdom                       |United Kingdom                        | 200|  200|     1885|     1885|  2|
|United States                        |United States of America              |   2|    2|     1870|     1870|  2|
|Uruguay                              |Uruguay                               | 165|  165|     1904|     1985| 15|
|Venezuela                            |Venezuela                             | 101|  101|     1945|     1959| 10|
|Yugoslavia                           |Yugoslavia                            | 345|  345|     1990|     1990|  2|
|Zaire (Democratic Republic of Congo) |Congo, Democratic Republic of (Zaire) | 490|  490|     1960|     1960|  2|
|Zambia                               |Zambia                                | 551|  551|     1971|     1993|  8|

```
## The following different countries/country codes match to a single country unit in the destination system:
```



|country                              |extended_country_name                 | GWn| cown| min_date| max_date|  n|
|:------------------------------------|:-------------------------------------|---:|----:|--------:|--------:|--:|
|Albania                              |Albania                               | 339|  339|     1990|     1991|  4|
|Algeria                              |Algeria                               | 615|  615|     1988|     1992|  6|
|Argentina                            |Argentina                             | 160|  160|     1862|     1983| 24|
|Australia                            |Australia                             | 900|  900|     1901|     1901|  2|
|Austria                              |Austria                               | 305|  305|     1934|     1934|  2|
|Bangladesh                           |Bangladesh                            | 771|  771|     1972|     1991| 16|
|Belgium                              |Belgium                               | 211|  211|     1919|     1919|  2|
|Benin                                |Benin                                 | 434|  434|     1963|     1991|  6|
|Bolivia                              |Bolivia                               | 145|  145|     1952|     1982|  8|
|Bosnia and Herzegovina               |Bosnia-Herzegovina                    | 346|  346|     1998|     1998|  2|
|Brazil                               |Brazil                                | 140|  140|     1945|     1985| 10|
|Bulgaria                             |Bulgaria                              | 355|  355|     1990|     1990|  3|
|Burkina Faso                         |Burkina Faso (Upper Volta)            | 439|  439|     1969|     1992| 14|
|Burundi                              |Burundi                               | 516|  516|     1992|     1996|  6|
|Cambodia                             |Cambodia (Kampuchea)                  | 811|  811|     1955|     1993|  6|
|Central Africa Republic              |Central African Republic              | 482|  482|     1991|     1993|  4|
|Chad                                 |Chad                                  | 483|  483|     1962|     1996|  4|
|Chile                                |Chile                                 | 155|  155|     1840|     1990| 10|
|Colombia                             |Colombia                              | 100|  100|     1910|     1958|  8|
|Congo                                |Congo                                 | 484|  484|     1963|     1997| 10|
|Costa Rica                           |Costa Rica                            |  94|   94|     1909|     1949| 10|
|Croatia                              |Croatia                               | 344|  344|     1990|     1990|  2|
|Cuba                                 |Cuba                                  |  40|   40|     1940|     1952|  4|
|Czechoslovakia                       |Czechoslovakia                        | 315|  315|     1938|     1990| 12|
|Denmark                              |Denmark                               | 390|  390|     1915|     1915|  2|
|Dominican Republic                   |Dominican Republic                    |  42|   42|     1962|     1978|  7|
|Ecuador                              |Ecuador                               | 130|  130|     1948|     1984| 16|
|El Salvador                          |El Salvador                           |  92|   92|     1927|     1994|  9|
|Estonia                              |Estonia                               | 366|  366|     1992|     1992|  2|
|Ethiopia                             |Ethiopia                              | 530|  530|     1991|     1995|  4|
|Finland                              |Finland                               | 375|  375|     1919|     1919|  2|
|France                               |France                                | 220|  220|     1851|     1944|  8|
|Gabon                                |Gabon                                 | 481|  481|     1964|     1995|  8|
|Georgia                              |Georgia                               | 372|  372|     1992|     1992|  3|
|Germany                              |German Federal Republic               | 260|  260|     1945|     1949|  4|
|Germany                              |Germany (Prussia)                     | 255|  255|     1919|     1933|  4|
|Ghana                                |Ghana                                 | 452|  452|     1960|     1992| 16|
|Greece                               |Greece                                | 350|  350|     1926|     1974| 11|
|Guatemala                            |Guatemala                             |  90|   90|     1944|     1996| 12|
|Haiti                                |Haiti                                 |  41|   41|     1990|     1994|  7|
|Honduras                             |Honduras                              |  91|   91|     1949|     1996| 12|
|Hungary                              |Hungary                               | 310|  310|     1922|     1989|  7|
|India                                |India                                 | 750|  750|     1952|     1977|  7|
|Indonesia                            |Indonesia                             | 850|  850|     1957|     1957|  2|
|Israel                               |Israel                                | 666|  666|     1949|     1949|  2|
|Italy                                |Italy/Sardinia                        | 325|  325|     1887|     1946| 10|
|Ivory Coast                          |Cote D'Ivoire                         | 437|  437|     1995|     1995|  2|
|Kenya                                |Kenya                                 | 501|  501|     1966|     1992| 10|
|Kyrgyzstan                           |Kyrgyz Republic                       | 703|  703|     1993|     1993|  2|
|Laos                                 |Laos                                  | 812|  812|     1956|     1959|  6|
|Latvia                               |Latvia                                | 367|  367|     1991|     1991|  2|
|Lebanon                              |Lebanon                               | 660|  660|     1975|     1992|  6|
|Lesotho                              |Lesotho                               | 570|  570|     1970|     1993|  4|
|Lithuania                            |Lithuania                             | 368|  368|     1992|     1992|  2|
|Madagascar                           |Madagascar (Malagasy)                 | 580|  580|     1971|     1993|  6|
|Malawi                               |Malawi                                | 553|  553|     1993|     1994|  4|
|Malaysia                             |Malaysia                              | 820|  820|     1969|     1971|  4|
|Mali                                 |Mali                                  | 432|  432|     1991|     1992|  4|
|Mexico                               |Mexico                                |  70|   70|     1988|     1997|  4|
|Moldova                              |Moldova                               | 359|  359|     1994|     1994|  2|
|Mongolia                             |Mongolia                              | 712|  712|     1988|     1990|  4|
|Morocco                              |Morocco                               | 600|  600|     1998|     1998|  2|
|Mozambique                           |Mozambique                            | 541|  541|     1995|     1995|  2|
|Myanmar                              |Myanmar (Burma)                       | 775|  775|     1962|     1962|  2|
|Namibia                              |Namibia                               | 565|  565|     1998|     1998|  2|
|Nepal                                |Nepal                                 | 790|  790|     1990|     1991|  4|
|Netherlands                          |Netherlands                           | 210|  210|     1917|     1917|  2|
|Nicaragua                            |Nicaragua                             |  93|   93|     1989|     1990|  4|
|Niger                                |Niger                                 | 436|  436|     1990|     1996|  6|
|Nigeria                              |Nigeria                               | 475|  475|     1966|     1983|  8|
|Norway                               |Norway                                | 385|  385|     1898|     1898|  2|
|Pakistan                             |Pakistan                              | 770|  770|     1958|     1990| 12|
|Panama                               |Panama                                |  95|   95|     1989|     1994|  4|
|Paraguay                             |Paraguay                              | 150|  150|     1989|     1993|  5|
|Peru                                 |Peru                                  | 135|  135|     1945|     1995| 20|
|Philippines                          |Philippines                           | 840|  840|     1953|     1986|  6|
|Poland                               |Poland                                | 290|  290|     1921|     1990| 10|
|Portugal                             |Portugal                              | 235|  235|     1911|     1976| 12|
|Romania                              |Romania                               | 360|  360|     1917|     1992| 10|
|Russia (Soviet Union)                |Russia (Soviet Union)                 | 365|  365|     1991|     1994|  4|
|Rwanda                               |Rwanda                                | 517|  517|     1963|     1963|  2|
|Senegal                              |Senegal                               | 433|  433|     1962|     1998|  8|
|Sierra Leone                         |Sierra Leone                          | 451|  451|     1967|     1973|  7|
|Slovak Republic                      |Slovakia                              | 317|  317|     1998|     1998|  2|
|Slovenia                             |Slovenia                              | 349|  349|     1990|     1990|  2|
|Somalia                              |Somalia                               | 520|  520|     1969|     1969|  2|
|South Africa                         |South Africa                          | 560|  560|     1993|     1994|  4|
|South Korea                          |Korea, Republic of                    | 732|  732|     1948|     1988| 11|
|Spain                                |Spain                                 | 230|  230|     1873|     1977| 18|
|Sri Lanka                            |Sri Lanka (Ceylon)                    | 780|  780|     1983|     1983|  2|
|Sudan                                |Sudan                                 | 625|  625|     1958|     1989| 14|
|Sweden                               |Sweden                                | 380|  380|     1866|     1917|  4|
|Taiwan                               |Taiwan                                | 713|  713|     1988|     1996|  6|
|Tanzania                             |Tanzania/Tanganyika                   | 510|  510|     1962|     1995|  8|
|Thailand                             |Thailand                              | 800|  800|     1946|     1992| 16|
|Togo                                 |Togo                                  | 461|  461|     1961|     1998| 10|
|Turkey                               |Turkey (Ottoman Empire)               | 640|  640|     1925|     1983| 22|
|Uganda                               |Uganda                                | 500|  500|     1966|     1966|  2|
|Ukraine                              |Ukraine                               | 369|  369|     1991|     1991|  2|
|United Kingdom                       |United Kingdom                        | 200|  200|     1885|     1885|  2|
|United States                        |United States of America              |   2|    2|     1870|     1870|  2|
|Uruguay                              |Uruguay                               | 165|  165|     1904|     1985| 15|
|Venezuela                            |Venezuela                             | 101|  101|     1945|     1959| 10|
|Yugoslavia                           |Yugoslavia                            | 345|  345|     1990|     1990|  2|
|Zaire (Democratic Republic of Congo) |Congo, Democratic Republic of (Zaire) | 490|  490|     1960|     1960|  2|
|Zambia                               |Zambia                                | 551|  551|     1971|     1993|  8|

```
## The following country names are different in the destination system:
```



|country                               |extended_country_name                   | GWn| cown| min_date| max_date|   n|
|:-------------------------------------|:---------------------------------------|---:|----:|--------:|--------:|---:|
|Belarus                               |Belarus (Byelorussia)                   | 370|  370|     1991|     1998|   8|
|Bosnia and Herzegovina                |Bosnia-Herzegovina                      | 346|  346|     1992|     1998|   8|
|Burkina Faso                          |Burkina Faso (Upper Volta)              | 439|  439|     1960|     1998|  46|
|Cambodia                              |Cambodia (Kampuchea)                    | 811|  811|     1953|     1998|  49|
|Central Africa Republic               |Central African Republic                | 482|  482|     1960|     1998|  41|
|Germany                               |German Federal Republic                 | 260|  255|     1990|     1998|   9|
|Germany                               |German Federal Republic                 | 260|  260|     1945|     1989|  47|
|Germany                               |Germany (Prussia)                       | 255|  255|     1871|     1944|  76|
|Iran                                  |Iran (Persia)                           | 630|  630|     1906|     1998|  93|
|Italy                                 |Italy/Sardinia                          | 325|  325|     1870|     1998| 134|
|Ivory Coast                           |Cote D'Ivoire                           | 437|  437|     1960|     1998|  40|
|Kyrgyzstan                            |Kyrgyz Republic                         | 703|  703|     1991|     1998|   9|
|Macedonia                             |Macedonia (Former Yugoslav Republic of) | 343|  343|     1991|     1998|   8|
|Madagascar                            |Madagascar (Malagasy)                   | 580|  580|     1960|     1998|  42|
|Myanmar                               |Myanmar (Burma)                         | 775|  775|     1948|     1998|  52|
|North Korea                           |Korea, People's Republic of             | 731|  731|     1948|     1998|  51|
|Slovak Republic                       |Slovakia                                | 317|  317|     1993|     1998|   7|
|South Korea                           |Korea, Republic of                      | 732|  732|     1948|     1998|  57|
|Sri Lanka                             |Sri Lanka (Ceylon)                      | 780|  780|     1948|     1998|  52|
|Tanzania                              |Tanzania/Tanganyika                     | 510|  510|     1961|     1998|  42|
|Turkey                                |Turkey (Ottoman Empire)                 | 640|  640|     1921|     1998|  89|
|United States                         |United States of America                |   2|    2|     1789|     1998| 211|
|Vietnam North                         |Vietnam, Democratic Republic of         | 816|  816|     1954|     1998|  45|
|Vietnam South                         |Vietnam, Republic of                    | 817|  817|     1954|     1975|  22|
|Yemen Arab Republic                   |Yemen (Arab Republic of Yemen)          | 678|  678|     1918|     1989|  72|
|Yemen Arab Republic                   |Yemen (Arab Republic of Yemen)          | 678|  679|     1990|     1998|   9|
|Yemen People's Democratic Republic of |Yemen, People's Republic of             | 680|  680|     1967|     1990|  24|
|Zaire (Democratic Republic of Congo)  |Congo, Democratic Republic of (Zaire)   | 490|  490|     1960|     1998|  40|
|Zimbabwe                              |Zimbabwe (Rhodesia)                     | 552|  552|     1980|     1998|  19|

```
## Resulting dataset after processing has 11384 rows.
## Note: the number of rows in the processed Gasiorowski data is different from the number of rows in the original data.
## Changing the name of the original country column from country to prc_gasiorowski_country...
## Ensuring year column is numeric...
```

```r
prc_pmm <- extract_pmm_var(pmm_replication, pmm_prc,
                           include_in_output = include_in_output)

stopifnot(identical(prc_gasiorowski, tar_read(prc_gasiorowski, store = here::here("_targets"))))
stopifnot(identical(prc_gasiorowski, democracyData::prc_gasiorowski))
stopifnot(identical(prc_pmm, tar_read(prc_pmm, store = here::here("_targets"))))
stopifnot(identical(prc_pmm, democracyData::prc_pmm))
```

# PIPE


```r
cite_dataset("PIPE")
```

[1] A. Przeworski. _Political Institutions and Political Events (PIPE)
Data Set_. Data set. 2013.
<https://sites.google.com/a/nyu.edu/adam-przeworski/home/data>.

```r
# PIPE <- redownload_pipe(verbose = verbose,
#                         include_in_output = include_in_output)
```

# REIGN


```r
cite_dataset("reign")
```

[1] C. Bell. _The Rulers, Elections, and Irregular Governance Dataset
(REIGN)_. 2016. <http://oefresearch.org/datasets/reign>.

```r
REIGN <- redownload_reign(verbose = verbose,
                          include_in_output = include_in_output)
```

```
## Downloading  data...
```

```
## Trying https://github.com/OEFDataScience/REIGN.github.io/blob/gh-pages/data_sets/regime_list.csv?raw=true ...
```

```
## Rows: 629 Columns: 6
## ── Column specification ────────────────────────────────────────────────────────
## Delimiter: ","
## chr (5): gwf_country, gwf_casename, gwf_startdate, gwf_enddate, gwf_regimetype
## dbl (1): cowcode
## 
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
## The downloaded  dataset has 629 rows
## 
## The following country and/or code-years were matched more than once:
```



|gwf_country           | cowcode|extended_country_name                 | GWn| cown| min_date| max_date|  n|
|:---------------------|-------:|:-------------------------------------|---:|----:|--------:|--------:|--:|
|Afghanistan           |     700|Afghanistan                           | 700|  700|     1973|     2014| 12|
|Albania               |     339|Albania                               | 339|  339|     1991|     1991|  2|
|Algeria               |     615|Algeria                               | 615|  615|     1992|     2020|  6|
|Argentina             |     160|Argentina                             | 160|  160|     1951|     1983| 14|
|Armenia               |     371|Armenia                               | 371|  371|     2018|     2018|  2|
|Austria               |     305|Austria                               | 305|  305|     1955|     1955|  2|
|Azerbaijan            |     373|Azerbaijan                            | 373|  373|     1992|     1993|  4|
|Bangladesh            |     771|Bangladesh                            | 771|  771|     1975|     2009| 10|
|Belarus               |     370|Belarus (Byelorussia)                 | 370|  370|     1994|     1994|  2|
|Benin                 |     434|Benin                                 | 434|  434|     1963|     1991| 18|
|Bhutan                |     760|Bhutan                                | 760|  760|     2008|     2008|  2|
|Bolivia               |     145|Bolivia                               | 145|  145|     1951|     2020| 22|
|Bosnia                |     346|Bosnia-Herzegovina                    | 346|  346|     1995|     1995|  2|
|Brazil                |     140|Brazil                                | 140|  140|     1961|     1985|  8|
|Bulgaria              |     355|Bulgaria                              | 355|  355|     1990|     1990|  2|
|Burkina Faso          |     439|Burkina Faso (Upper Volta)            | 439|  439|     1966|     2015| 14|
|Burundi               |     516|Burundi                               | 516|  516|     1966|     2015| 15|
|Cambodia              |     811|Cambodia (Kampuchea)                  | 811|  811|     1970|     1979|  6|
|Cameroon              |     471|Cameroon                              | 471|  471|     1983|     1983|  2|
|Cape Verde            |     402|Cape Verde                            | 402|  402|     1991|     1991|  2|
|Cen African Rep       |     482|Central African Republic              | 482|  482|     1965|     2016| 14|
|Chad                  |     483|Chad                                  | 483|  483|     1975|     2021| 12|
|Chile                 |     155|Chile                                 | 155|  155|     1973|     1989|  4|
|Colombia              |     100|Colombia                              | 100|  100|     1953|     1958|  4|
|Comoros               |     581|Comoros                               | 581|  581|     1989|     2006|  8|
|Congo-Brz             |     484|Congo                                 | 484|  484|     1963|     1997| 10|
|Congo/Zaire           |     490|Congo, Democratic Republic of (Zaire) | 490|  490|     1960|     1997|  6|
|Croatia               |     344|Croatia                               | 344|  344|     2000|     2000|  2|
|Cuba                  |      40|Cuba                                  |  40|   40|     1952|     1959|  4|
|Czechoslovakia        |     315|Czechoslovakia                        | 315|  315|     1989|     1989|  2|
|Dominican Rep         |      42|Dominican Republic                    |  42|   42|     1961|     1978| 13|
|Ecuador               |     130|Ecuador                               | 130|  130|     1963|     1979| 14|
|Egypt                 |     651|Egypt                                 | 651|  651|     1952|     2019| 12|
|El Salvador           |      92|El Salvador                           |  92|   92|     1950|     1989| 12|
|Equatorial Guinea     |     411|Equatorial Guinea                     | 411|  411|     1971|     1979|  4|
|Ethiopia              |     530|Ethiopia                              | 530|  530|     1974|     1991|  4|
|Fiji                  |     950|Fiji                                  | 950|  950|     1987|     2006| 11|
|Finland               |     375|Finland                               | 375|  375|     2000|     2000|  2|
|France                |     220|France                                | 220|  220|     1958|     1958|  2|
|Gambia                |     420|Gambia                                | 420|  420|     1994|     2017|  6|
|Georgia               |     372|Georgia                               | 372|  372|     1992|     2018|  8|
|Ghana                 |     452|Ghana                                 | 452|  452|     1960|     1993| 16|
|Greece                |     350|Greece                                | 350|  350|     1967|     1974|  4|
|Grenada               |      55|Grenada                               |  55|   55|     1979|     1984|  8|
|Guatemala             |      90|Guatemala                             |  90|   90|     1954|     1995| 24|
|Guinea                |     438|Guinea                                | 438|  438|     1984|     2010|  6|
|Guinea Bissau         |     404|Guinea-Bissau                         | 404|  404|     1980|     2014| 14|
|Guyana                |     110|Guyana                                | 110|  110|     1992|     1992|  2|
|Haiti                 |      41|Haiti                                 |  41|   41|     1950|     2017| 30|
|Honduras              |      91|Honduras                              |  91|   91|     1954|     1981| 18|
|Hungary               |     310|Hungary                               | 310|  310|     1990|     2020|  4|
|Indonesia             |     850|Indonesia                             | 850|  850|     1966|     1999|  4|
|Iran                  |     630|Iran (Persia)                         | 630|  630|     1979|     1979|  2|
|Iraq                  |     645|Iraq                                  | 645|  645|     1958|     2011| 12|
|Ivory Coast           |     437|Cote D'Ivoire                         | 437|  437|     1999|     2011|  6|
|Japan                 |     740|Japan                                 | 740|  740|     1951|     1951|  2|
|Kenya                 |     501|Kenya                                 | 501|  501|     2002|     2002|  2|
|Korea South           |     732|Korea, Republic of                    | 732|  732|     1960|     1987|  6|
|Kosovo                |     347|Kosovo                                | 347|  347|     2008|     2008|  2|
|Kyrgyzstan            |     703|Kyrgyz Republic                       | 703|  703|     2005|     2021| 10|
|Laos                  |     812|Laos                                  | 812|  812|     1959|     1975|  8|
|Lebanon               |     660|Lebanon                               | 660|  660|     1976|     2005|  4|
|Lesotho               |     570|Lesotho                               | 570|  570|     1970|     1993|  6|
|Liberia               |     450|Liberia                               | 450|  450|     1980|     2006| 10|
|Libya                 |     620|Libya                                 | 620|  620|     1969|     2021|  6|
|Madagascar            |     580|Madagascar (Malagasy)                 | 580|  580|     1972|     2014| 10|
|Malawi                |     553|Malawi                                | 553|  553|     1994|     1994|  2|
|Malaysia              |     820|Malaysia                              | 820|  820|     2018|     2018|  2|
|Maldives              |     781|Maldives                              | 781|  781|     2008|     2008|  2|
|Mali                  |     432|Mali                                  | 432|  432|     1968|     2020| 13|
|Mauritania            |     435|Mauritania                            | 435|  435|     1978|     2008|  8|
|Mexico                |      70|Mexico                                |  70|   70|     2000|     2000|  2|
|Mongolia              |     712|Mongolia                              | 712|  712|     1993|     1993|  2|
|Myanmar               |     775|Myanmar (Burma)                       | 775|  775|     1958|     2021| 12|
|Nepal                 |     790|Nepal                                 | 790|  790|     1951|     2006|  8|
|Nicaragua             |      93|Nicaragua                             |  93|   93|     1979|     2020|  6|
|Niger                 |     436|Niger                                 | 436|  436|     1974|     2011| 15|
|Nigeria               |     475|Nigeria                               | 475|  475|     1966|     1999| 15|
|Pakistan              |     770|Pakistan                              | 770|  770|     1958|     2008| 14|
|Panama                |      95|Panama                                |  95|   95|     1951|     1989| 14|
|Paraguay              |     150|Paraguay                              | 150|  150|     1954|     1993|  4|
|Peru                  |     135|Peru                                  | 135|  135|     1956|     2001| 16|
|Philippines           |     840|Philippines                           | 840|  840|     1972|     1986|  4|
|Poland                |     290|Poland                                | 290|  290|     1989|     1989|  2|
|Portugal              |     235|Portugal                              | 235|  235|     1974|     1976|  4|
|Romania               |     360|Romania                               | 360|  360|     1989|     1991|  4|
|Russia                |     365|Russia (Soviet Union)                 | 365|  365|     1993|     1993|  2|
|Rwanda                |     517|Rwanda                                | 517|  517|     1973|     1994|  4|
|Sao Tome and Principe |     403|Sao Tome and Principe                 | 403|  403|     1987|     1991|  4|
|Senegal               |     433|Senegal                               | 433|  433|     2000|     2000|  2|
|Serbia                |     345|Yugoslavia                            | 345|  345|     2000|     2000|  2|
|Seychelles            |     591|Seychelles                            | 591|  591|     1977|     1993|  4|
|Sierra Leone          |     451|Sierra Leone                          | 451|  451|     1967|     1998| 12|
|Somalia               |     520|Somalia                               | 520|  520|     1969|     2012|  6|
|South Africa          |     560|South Africa                          | 560|  560|     1994|     1994|  2|
|Spain                 |     230|Spain                                 | 230|  230|     1975|     1976|  4|
|Sri Lanka             |     780|Sri Lanka (Ceylon)                    | 780|  780|     1978|     1994|  4|
|Sudan                 |     625|Sudan                                 | 625|  625|     1958|     2019| 17|
|Suriname              |     115|Surinam                               | 115|  115|     1980|     1991|  8|
|Syria                 |     652|Syria                                 | 652|  652|     1951|     1963| 12|
|Tanzania              |     510|Tanzania/Tanganyika                   | 510|  510|     1964|     1964|  2|
|Thailand              |     800|Thailand                              | 800|  800|     1957|     2014| 20|
|Togo                  |     461|Togo                                  | 461|  461|     1961|     1963|  4|
|Tunisia               |     616|Tunisia                               | 616|  616|     1957|     2015|  6|
|Turkey                |     640|Turkey (Ottoman Empire)               | 640|  640|     1950|     2019| 14|
|Uganda                |     500|Uganda                                | 500|  500|     1966|     1986| 12|
|Uruguay               |     165|Uruguay                               | 165|  165|     1952|     1984|  8|
|Venezuela             |     101|Venezuela                             | 101|  101|     1958|     2005|  4|
|Vietnam South         |     817|Vietnam, Republic of                  | 817|  817|     1963|     1963|  2|
|Yemen                 |     678|Yemen (Arab Republic of Yemen)        | 678|  678|     1962|     1978|  8|
|Yemen                 |     679|Yemen (Arab Republic of Yemen)        | 678|  679|     2015|     2015|  2|
|Zambia                |     551|Zambia                                | 551|  551|     1991|     2011|  6|
|Zimbabwe              |     552|Zimbabwe (Rhodesia)                   | 552|  552|     1979|     1980|  4|

```
## The following different countries/country codes match to a single country unit in the destination system:
```



|gwf_country           | cowcode|extended_country_name                 | GWn| cown| min_date| max_date|  n|
|:---------------------|-------:|:-------------------------------------|---:|----:|--------:|--------:|--:|
|Afghanistan           |     700|Afghanistan                           | 700|  700|     1973|     2014| 12|
|Albania               |     339|Albania                               | 339|  339|     1991|     1991|  2|
|Algeria               |     615|Algeria                               | 615|  615|     1992|     2020|  6|
|Argentina             |     160|Argentina                             | 160|  160|     1951|     1983| 14|
|Armenia               |     371|Armenia                               | 371|  371|     2018|     2018|  2|
|Austria               |     305|Austria                               | 305|  305|     1955|     1955|  2|
|Azerbaijan            |     373|Azerbaijan                            | 373|  373|     1992|     1993|  4|
|Bangladesh            |     771|Bangladesh                            | 771|  771|     1975|     2009| 10|
|Belarus               |     370|Belarus (Byelorussia)                 | 370|  370|     1994|     1994|  2|
|Benin                 |     434|Benin                                 | 434|  434|     1963|     1991| 18|
|Bhutan                |     760|Bhutan                                | 760|  760|     2008|     2008|  2|
|Bolivia               |     145|Bolivia                               | 145|  145|     1951|     2020| 22|
|Bosnia                |     346|Bosnia-Herzegovina                    | 346|  346|     1995|     1995|  2|
|Brazil                |     140|Brazil                                | 140|  140|     1961|     1985|  8|
|Bulgaria              |     355|Bulgaria                              | 355|  355|     1990|     1990|  2|
|Burkina Faso          |     439|Burkina Faso (Upper Volta)            | 439|  439|     1966|     2015| 14|
|Burundi               |     516|Burundi                               | 516|  516|     1966|     2015| 15|
|Cambodia              |     811|Cambodia (Kampuchea)                  | 811|  811|     1970|     1979|  6|
|Cameroon              |     471|Cameroon                              | 471|  471|     1983|     1983|  2|
|Cape Verde            |     402|Cape Verde                            | 402|  402|     1991|     1991|  2|
|Cen African Rep       |     482|Central African Republic              | 482|  482|     1965|     2016| 14|
|Chad                  |     483|Chad                                  | 483|  483|     1975|     2021| 12|
|Chile                 |     155|Chile                                 | 155|  155|     1973|     1989|  4|
|Colombia              |     100|Colombia                              | 100|  100|     1953|     1958|  4|
|Comoros               |     581|Comoros                               | 581|  581|     1989|     2006|  8|
|Congo-Brz             |     484|Congo                                 | 484|  484|     1963|     1997| 10|
|Congo/Zaire           |     490|Congo, Democratic Republic of (Zaire) | 490|  490|     1960|     1997|  6|
|Croatia               |     344|Croatia                               | 344|  344|     2000|     2000|  2|
|Cuba                  |      40|Cuba                                  |  40|   40|     1952|     1959|  4|
|Czech Rep             |     316|Czechoslovakia                        | 315|  315|     1992|     1992|  1|
|Czechoslovakia        |     315|Czechoslovakia                        | 315|  315|     1989|     1992|  3|
|Dominican Rep         |      42|Dominican Republic                    |  42|   42|     1961|     1978| 13|
|Ecuador               |     130|Ecuador                               | 130|  130|     1963|     1979| 14|
|Egypt                 |     651|Egypt                                 | 651|  651|     1952|     2019| 12|
|El Salvador           |      92|El Salvador                           |  92|   92|     1950|     1989| 12|
|Equatorial Guinea     |     411|Equatorial Guinea                     | 411|  411|     1971|     1979|  4|
|Ethiopia              |     530|Ethiopia                              | 530|  530|     1974|     1991|  4|
|Fiji                  |     950|Fiji                                  | 950|  950|     1987|     2006| 11|
|Finland               |     375|Finland                               | 375|  375|     2000|     2000|  2|
|France                |     220|France                                | 220|  220|     1958|     1958|  2|
|Gambia                |     420|Gambia                                | 420|  420|     1994|     2017|  6|
|Georgia               |     372|Georgia                               | 372|  372|     1992|     2018|  8|
|Ghana                 |     452|Ghana                                 | 452|  452|     1960|     1993| 16|
|Greece                |     350|Greece                                | 350|  350|     1967|     1974|  4|
|Grenada               |      55|Grenada                               |  55|   55|     1979|     1984|  8|
|Guatemala             |      90|Guatemala                             |  90|   90|     1954|     1995| 24|
|Guinea                |     438|Guinea                                | 438|  438|     1984|     2010|  6|
|Guinea Bissau         |     404|Guinea-Bissau                         | 404|  404|     1980|     2014| 14|
|Guyana                |     110|Guyana                                | 110|  110|     1992|     1992|  2|
|Haiti                 |      41|Haiti                                 |  41|   41|     1950|     2017| 30|
|Honduras              |      91|Honduras                              |  91|   91|     1954|     1981| 18|
|Hungary               |     310|Hungary                               | 310|  310|     1990|     2020|  4|
|Indonesia             |     850|Indonesia                             | 850|  850|     1966|     1999|  4|
|Iran                  |     630|Iran (Persia)                         | 630|  630|     1979|     1979|  2|
|Iraq                  |     645|Iraq                                  | 645|  645|     1958|     2011| 12|
|Ivory Coast           |     437|Cote D'Ivoire                         | 437|  437|     1999|     2011|  6|
|Japan                 |     740|Japan                                 | 740|  740|     1951|     1951|  2|
|Kenya                 |     501|Kenya                                 | 501|  501|     2002|     2002|  2|
|Korea South           |     732|Korea, Republic of                    | 732|  732|     1960|     1987|  6|
|Kosovo                |     347|Kosovo                                | 347|  347|     2008|     2008|  2|
|Kyrgyzstan            |     703|Kyrgyz Republic                       | 703|  703|     2005|     2021| 10|
|Laos                  |     812|Laos                                  | 812|  812|     1959|     1975|  8|
|Lebanon               |     660|Lebanon                               | 660|  660|     1976|     2005|  4|
|Lesotho               |     570|Lesotho                               | 570|  570|     1970|     1993|  6|
|Liberia               |     450|Liberia                               | 450|  450|     1980|     2006| 10|
|Libya                 |     620|Libya                                 | 620|  620|     1969|     2021|  6|
|Madagascar            |     580|Madagascar (Malagasy)                 | 580|  580|     1972|     2014| 10|
|Malawi                |     553|Malawi                                | 553|  553|     1994|     1994|  2|
|Malaysia              |     820|Malaysia                              | 820|  820|     2018|     2018|  2|
|Maldives              |     781|Maldives                              | 781|  781|     2008|     2008|  2|
|Mali                  |     432|Mali                                  | 432|  432|     1968|     2020| 13|
|Mauritania            |     435|Mauritania                            | 435|  435|     1978|     2008|  8|
|Mexico                |      70|Mexico                                |  70|   70|     2000|     2000|  2|
|Mongolia              |     712|Mongolia                              | 712|  712|     1993|     1993|  2|
|Myanmar               |     775|Myanmar (Burma)                       | 775|  775|     1958|     2021| 12|
|Nepal                 |     790|Nepal                                 | 790|  790|     1951|     2006|  8|
|Nicaragua             |      93|Nicaragua                             |  93|   93|     1979|     2020|  6|
|Niger                 |     436|Niger                                 | 436|  436|     1974|     2011| 15|
|Nigeria               |     475|Nigeria                               | 475|  475|     1966|     1999| 15|
|Pakistan              |     770|Pakistan                              | 770|  770|     1958|     2008| 14|
|Panama                |      95|Panama                                |  95|   95|     1951|     1989| 14|
|Paraguay              |     150|Paraguay                              | 150|  150|     1954|     1993|  4|
|Peru                  |     135|Peru                                  | 135|  135|     1956|     2001| 16|
|Philippines           |     840|Philippines                           | 840|  840|     1972|     1986|  4|
|Poland                |     290|Poland                                | 290|  290|     1989|     1989|  2|
|Portugal              |     235|Portugal                              | 235|  235|     1974|     1976|  4|
|Romania               |     360|Romania                               | 360|  360|     1989|     1991|  4|
|Russia                |     365|Russia (Soviet Union)                 | 365|  365|     1991|     1993|  3|
|Rwanda                |     517|Rwanda                                | 517|  517|     1973|     1994|  4|
|Sao Tome and Principe |     403|Sao Tome and Principe                 | 403|  403|     1987|     1991|  4|
|Senegal               |     433|Senegal                               | 433|  433|     2000|     2000|  2|
|Serbia                |     345|Yugoslavia                            | 345|  345|     1991|     2000|  3|
|Seychelles            |     591|Seychelles                            | 591|  591|     1977|     1993|  4|
|Sierra Leone          |     451|Sierra Leone                          | 451|  451|     1967|     1998| 12|
|Somalia               |     520|Somalia                               | 520|  520|     1969|     2012|  6|
|South Africa          |     560|South Africa                          | 560|  560|     1994|     1994|  2|
|Soviet Union          |     365|Russia (Soviet Union)                 | 365|  365|     1991|     1991|  1|
|Spain                 |     230|Spain                                 | 230|  230|     1975|     1976|  4|
|Sri Lanka             |     780|Sri Lanka (Ceylon)                    | 780|  780|     1978|     1994|  4|
|Sudan                 |     625|Sudan                                 | 625|  625|     1958|     2019| 17|
|Suriname              |     115|Surinam                               | 115|  115|     1980|     1991|  8|
|Syria                 |     652|Syria                                 | 652|  652|     1951|     1963| 12|
|Tanzania              |     510|Tanzania/Tanganyika                   | 510|  510|     1964|     1964|  2|
|Thailand              |     800|Thailand                              | 800|  800|     1957|     2014| 20|
|Togo                  |     461|Togo                                  | 461|  461|     1961|     1963|  4|
|Tunisia               |     616|Tunisia                               | 616|  616|     1957|     2015|  6|
|Turkey                |     640|Turkey (Ottoman Empire)               | 640|  640|     1950|     2019| 14|
|Uganda                |     500|Uganda                                | 500|  500|     1966|     1986| 12|
|Uruguay               |     165|Uruguay                               | 165|  165|     1952|     1984|  8|
|Venezuela             |     101|Venezuela                             | 101|  101|     1958|     2005|  4|
|Vietnam South         |     817|Vietnam, Republic of                  | 817|  817|     1963|     1963|  2|
|Yemen                 |     678|Yemen (Arab Republic of Yemen)        | 678|  678|     1962|     1978|  8|
|Yemen                 |     679|Yemen (Arab Republic of Yemen)        | 678|  679|     2015|     2015|  2|
|Yugoslavia            |     345|Yugoslavia                            | 345|  345|     1991|     1991|  1|
|Zambia                |     551|Zambia                                | 551|  551|     1991|     2011|  6|
|Zimbabwe              |     552|Zimbabwe (Rhodesia)                   | 552|  552|     1979|     1980|  4|

```
## The following country names are different in the destination system:
```



|gwf_country         | cowcode|extended_country_name                   | GWn| cown| min_date| max_date|   n|
|:-------------------|-------:|:---------------------------------------|---:|----:|--------:|--------:|---:|
|Antigua and Barbuda |      58|Antigua & Barbuda                       |  58|   58|     1981|     2020|  40|
|Belarus             |     370|Belarus (Byelorussia)                   | 370|  370|     1991|     2020|  31|
|Bosnia              |     346|Bosnia-Herzegovina                      | 346|  346|     1992|     2020|  30|
|Burkina Faso        |     439|Burkina Faso (Upper Volta)              | 439|  439|     1960|     2020|  68|
|Cambodia            |     811|Cambodia (Kampuchea)                    | 811|  811|     1953|     2020|  71|
|Cen African Rep     |     482|Central African Republic                | 482|  482|     1960|     2020|  68|
|Congo-Brz           |     484|Congo                                   | 484|  484|     1960|     2020|  66|
|Congo/Zaire         |     490|Congo, Democratic Republic of (Zaire)   | 490|  490|     1960|     2020|  64|
|Czech Rep           |     316|Czech Republic                          | 316|  316|     1993|     2020|  28|
|Czech Rep           |     316|Czechoslovakia                          | 315|  315|     1992|     1992|   1|
|Dominican Rep       |      42|Dominican Republic                      |  42|   42|     1930|     2020|  98|
|Germany             |     255|German Federal Republic                 | 260|  255|     1990|     2020|  31|
|Germany             |     260|German Federal Republic                 | 260|  260|     1949|     1990|  42|
|Germany East        |     265|German Democratic Republic              | 265|  265|     1949|     1990|  42|
|Guinea Bissau       |     404|Guinea-Bissau                           | 404|  404|     1974|     2020|  54|
|Iran                |     630|Iran (Persia)                           | 630|  630|     1925|     2020|  97|
|Italy               |     325|Italy/Sardinia                          | 325|  325|     1945|     2020|  76|
|Ivory Coast         |     437|Cote D'Ivoire                           | 437|  437|     1960|     2020|  64|
|Korea North         |     731|Korea, People's Republic of             | 731|  731|     1948|     2020|  73|
|Korea South         |     732|Korea, Republic of                      | 732|  732|     1948|     2020|  76|
|Kyrgyzstan          |     703|Kyrgyz Republic                         | 703|  703|     1990|     2021|  37|
|Macedonia           |     343|Macedonia (Former Yugoslav Republic of) | 343|  343|     1991|     2020|  30|
|Madagascar          |     580|Madagascar (Malagasy)                   | 580|  580|     1960|     2020|  66|
|Micronesia          |     987|Federated States of Micronesia          | 987|  987|     1979|     2020|  42|
|Myanmar             |     775|Myanmar (Burma)                         | 775|  775|     1948|     2021|  80|
|Russia              |     365|Russia (Soviet Union)                   | 365|  365|     1991|     2020|  31|
|Samoa               |     990|Samoa/Western Samoa                     | 990|  990|     1961|     2020|  60|
|Serbia              |     345|Yugoslavia                              | 345|  345|     1991|     2005|  16|
|Soviet Union        |     365|Russia (Soviet Union)                   | 365|  365|     1917|     1991|  75|
|Sri Lanka           |     780|Sri Lanka (Ceylon)                      | 780|  780|     1949|     2020|  74|
|St Kitts and Nevis  |      60|Saint Kitts and Nevis                   |  60|   60|     1983|     2020|  38|
|St Lucia            |      56|Saint Lucia                             |  56|   56|     1979|     2020|  42|
|St Vincent          |      57|Saint Vincent and the Grenadines        |  57|   57|     1979|     2020|  42|
|Suriname            |     115|Surinam                                 | 115|  115|     1975|     2020|  50|
|Tanzania            |     510|Tanzania/Tanganyika                     | 510|  510|     1961|     2020|  61|
|Turkey              |     640|Turkey (Ottoman Empire)                 | 640|  640|     1923|     2020| 105|
|USA                 |       2|United States of America                |   2|    2|     1789|     2020| 232|
|Vietnam             |     816|Vietnam, Democratic Republic of         | 816|  816|     1949|     2020|  72|
|Vietnam South       |     817|Vietnam, Republic of                    | 817|  817|     1953|     1975|  24|
|Yemen               |     678|Yemen (Arab Republic of Yemen)          | 678|  678|     1918|     1990|  77|
|Yemen               |     679|Yemen (Arab Republic of Yemen)          | 678|  679|     1990|     2020|  32|
|Yemen South         |     680|Yemen, People's Republic of             | 680|  680|     1967|     1990|  24|
|Zimbabwe            |     552|Zimbabwe (Rhodesia)                     | 552|  552|     1965|     2020|  58|

```
## Changing the name of the original country column from gwf_country to reign_country...
## Ensuring year column is numeric...
## Changing the name of the original code column from cowcode to reign_cowcode...
```

```r
stopifnot(identical(REIGN, tar_read(REIGN, store = here::here("_targets"))))
stopifnot(identical(REIGN, democracyData::REIGN))
```

# SVMDI


```r
cite_dataset("svmdi")
```

[1] K. Gründler and T. Krieger. "Democracy and growth: Evidence from a
machine learning indicator". In: _European Journal of Political
Economy_ 45 (2016), pp. 85-107. DOI:
https://doi.org/10.1016/j.ejpoleco.2016.05.005.
<http://www.sciencedirect.com/science/article/pii/S0176268016300222>.

[2] K. Gründler and T. Krieger. _Machine Learning Indices, Political
Institutions, and Economic Development_. Report. CESifo Group Munich,
2018. <https://www.cesifo-group.de/DocDL/cesifo1_wp6930.pdf>.

[3] K. Gründler and T. Krieger. "Using Machine Learning for measuring
democracy: A practitioners guide and a new updated dataset for 186
countries from 1919 to 2019". In: _European Journal of Political
Economy_ (2021), pp. 102-47. DOI:
https://doi.org/10.1016/j.ejpoleco.2021.102047.

```r
svmdi <- redownload_svmdi(verbose = verbose,
                          include_in_output = include_in_output)
```

```
## release_year can only be 2020 or 2016. Defaulting to 2020.
```

```
## Downloading svmdi data...
```

```
## Trying https://ml-democracy-index.net/downloadfiles/ML%20indices.xlsx ...
```

```
## The downloaded svmdi dataset has 12588 rows
```

```
## The following country names are different in the destination system:
```



|country                        |extended_country_name                   | GWn| cown| min_date| max_date|   n|
|:------------------------------|:---------------------------------------|---:|----:|--------:|--------:|---:|
|Antigua and Barbuda            |Antigua & Barbuda                       |  58|   58|     1981|     2019|  39|
|Belarus                        |Belarus (Byelorussia)                   | 370|  370|     1991|     2019|  29|
|Bosnia and Herzegovina         |Bosnia-Herzegovina                      | 346|  346|     1990|     2019|  30|
|Burkina Faso                   |Burkina Faso (Upper Volta)              | 439|  439|     1960|     2019|  60|
|Burma_Myanmar                  |Myanmar (Burma)                         | 775|  775|     1948|     2019|  72|
|Cambodia                       |Cambodia (Kampuchea)                    | 811|  811|     1953|     2019|  67|
|Congo_Republic of the          |Congo                                   | 484|  484|     1960|     2019|  60|
|Czech Republic                 |Czechoslovakia                          | 315|  315|     1919|     1992|  67|
|Democratic Republic of Congo   |Congo, Democratic Republic of (Zaire)   | 490|  490|     1960|     2019|  60|
|Germany                        |German Federal Republic                 | 260|  255|     1990|     2019|  30|
|Germany                        |German Federal Republic                 | 260|  260|     1949|     1989|  41|
|Germany                        |Germany (Prussia)                       | 255|  255|     1919|     1944|  26|
|Germany (East)                 |German Democratic Republic              | 265|  265|     1949|     1989|  41|
|Iran                           |Iran (Persia)                           | 630|  630|     1919|     2019| 101|
|Italy                          |Italy/Sardinia                          | 325|  325|     1919|     2019| 101|
|Ivory Coast                    |Cote D'Ivoire                           | 437|  437|     1960|     2019|  60|
|Korea_North                    |Korea, People's Republic of             | 731|  731|     1948|     2019|  72|
|Korea_South                    |Korea, Republic of                      | 732|  732|     1948|     2019|  72|
|Kyrgyzstan                     |Kyrgyz Republic                         | 703|  703|     1991|     2019|  29|
|Macedonia                      |Macedonia (Former Yugoslav Republic of) | 343|  343|     1990|     2019|  30|
|Madagascar                     |Madagascar (Malagasy)                   | 580|  580|     1960|     2019|  60|
|Russia                         |Russia (Soviet Union)                   | 365|  365|     1919|     2019| 101|
|Samoa                          |Samoa/Western Samoa                     | 990|  990|     1962|     2019|  58|
|Serbia                         |Yugoslavia                              | 345|  345|     1919|     2005|  83|
|Sri Lanka                      |Sri Lanka (Ceylon)                      | 780|  780|     1948|     2019|  72|
|St. Kitts and Nevis            |Saint Kitts and Nevis                   |  60|   60|     1983|     2019|  37|
|St. Lucia                      |Saint Lucia                             |  56|   56|     1979|     2019|  41|
|St. Vincent and the Grenadines |Saint Vincent and the Grenadines        |  57|   57|     1979|     2019|  41|
|Suriname                       |Surinam                                 | 115|  115|     1975|     2019|  45|
|Tanzania                       |Tanzania/Tanganyika                     | 510|  510|     1961|     2019|  59|
|Turkey                         |Turkey (Ottoman Empire)                 | 640|  640|     1919|     2019| 101|
|United States                  |United States of America                |   2|    2|     1919|     2019| 101|
|Vietnam                        |Vietnam, Democratic Republic of         | 816|  816|     1945|     2019|  75|
|Yemen                          |Yemen (Arab Republic of Yemen)          | 678|  678|     1919|     1989|  71|
|Yemen                          |Yemen (Arab Republic of Yemen)          | 678|  679|     1990|     2019|  30|
|Zimbabwe                       |Zimbabwe (Rhodesia)                     | 552|  552|     1980|     2019|  40|

```
## Resulting dataset after processing has 12588 rows.
```

```
## Changing the name of the original country column from country to svmdi_country...
```

```
## Ensuring year column is numeric...
```

```
## Changing the name of the original code column from iso to svmdi_iso...
```

```r
svmdi_2016 <- redownload_svmdi(release_year = 2016, verbose = verbose,
                               include_in_output = include_in_output)
```

```
## Downloading svmdi data...
```

```
## Trying http://www.wiwi.uni-wuerzburg.de/fileadmin/12010400/Data.dta ...
```

```
## The downloaded svmdi dataset has 5376 rows
```

```
## The following country names are different in the destination system:
```



|country                |extended_country_name                   | GWn| cown| min_date| max_date|  n|
|:----------------------|:---------------------------------------|---:|----:|--------:|--------:|--:|
|Antigua and Barbuda    |Antigua & Barbuda                       |  58|   58|     1981|     2011| 31|
|Belarus                |Belarus (Byelorussia)                   | 370|  370|     1991|     2011| 21|
|Bosnia And Herzegovina |Bosnia-Herzegovina                      | 346|  346|     1991|     2011| 21|
|Brunei Darussalam      |Brunei                                  | 835|  835|     1981|     2011| 31|
|Burkina Faso           |Burkina Faso (Upper Volta)              | 439|  439|     1981|     2011| 31|
|Cambodia               |Cambodia (Kampuchea)                    | 811|  811|     1981|     2011| 31|
|Congo, Dem Rep         |Congo, Democratic Republic of (Zaire)   | 490|  490|     1981|     2011| 31|
|Congo, Rep             |Congo                                   | 484|  484|     1981|     2011| 31|
|Germany                |German Federal Republic                 | 260|  255|     1990|     2011| 22|
|Germany                |German Federal Republic                 | 260|  260|     1981|     1989|  9|
|Iran                   |Iran (Persia)                           | 630|  630|     1981|     2011| 31|
|Italy                  |Italy/Sardinia                          | 325|  325|     1981|     2011| 31|
|Kyrgyzstan             |Kyrgyz Republic                         | 703|  703|     1991|     2011| 21|
|Macedonia              |Macedonia (Former Yugoslav Republic of) | 343|  343|     1991|     2011| 21|
|Madagascar             |Madagascar (Malagasy)                   | 580|  580|     1981|     2011| 31|
|Myanmar                |Myanmar (Burma)                         | 775|  775|     1981|     2011| 31|
|North Korea            |Korea, People's Republic of             | 731|  731|     1981|     2011| 31|
|Russia                 |Russia (Soviet Union)                   | 365|  365|     1991|     2011| 21|
|Samoa                  |Samoa/Western Samoa                     | 990|  990|     1981|     2011| 31|
|Serbia and Montenegro  |Yugoslavia                              | 345|  345|     1992|     2005| 14|
|South Korea            |Korea, Republic of                      | 732|  732|     1981|     2011| 31|
|Soviet Union           |Russia (Soviet Union)                   | 365|  365|     1981|     1990| 10|
|Sri Lanka              |Sri Lanka (Ceylon)                      | 780|  780|     1981|     2011| 31|
|Suriname               |Surinam                                 | 115|  115|     1981|     2011| 31|
|Tanzania               |Tanzania/Tanganyika                     | 510|  510|     1981|     2011| 31|
|Turkey                 |Turkey (Ottoman Empire)                 | 640|  640|     1981|     2011| 31|
|United States          |United States of America                |   2|    2|     1981|     2011| 31|
|Vietnam                |Vietnam, Democratic Republic of         | 816|  816|     1981|     2011| 31|
|Yemen                  |Yemen (Arab Republic of Yemen)          | 678|  678|     1981|     1989|  9|
|Yemen                  |Yemen (Arab Republic of Yemen)          | 678|  679|     1990|     2011| 22|
|Zimbabwe               |Zimbabwe (Rhodesia)                     | 552|  552|     1981|     2011| 31|

```
## Resulting dataset after processing has 5376 rows.
```

```
## Changing the name of the original country column from country to svmdi_country...
```

```
## Ensuring year column is numeric...
```

```
## Changing the name of the original code column from iso to svmdi_iso...
```

```r
stopifnot(identical(svmdi, tar_read(svmdi, store = here::here("_targets"))))
stopifnot(identical(svmdi, democracyData::svmdi))
stopifnot(identical(svmdi_2016, tar_read(svmdi_2016)))
stopifnot(identical(svmdi_2016, democracyData::svmdi_2016))
```
# Svolik


```r
cite_dataset("svolik")
```

[1] M. Svolik. _The Politics of Authoritarian Rule_. Cambridge:
Cambridge University Press, 2012.

```r
svolik_regime <- prepare_svolik_regime(path = here::here("data-raw/regime and no authority spells, country-year, 1946-2008.dta"),
                                       verbose = verbose,
                                       include_in_output = include_in_output)
```

```
## The downloaded Svolik regime data dataset has 8977 rows
```

```
## The following country names are different in the destination system:
```



|cname                          | ccode|extended_country_name                   | GWn| cown| min_date| max_date|  n|
|:------------------------------|-----:|:---------------------------------------|---:|----:|--------:|--------:|--:|
|Belarus                        |   370|Belarus (Byelorussia)                   | 370|  370|     1991|     2008| 18|
|Bosnia and Herzegovina         |   346|Bosnia-Herzegovina                      | 346|  346|     1992|     2008| 17|
|Burkina Faso                   |   439|Burkina Faso (Upper Volta)              | 439|  439|     1960|     2008| 49|
|Cambodia                       |   811|Cambodia (Kampuchea)                    | 811|  811|     1953|     2008| 56|
|Congo (Brazzaville)            |   484|Congo                                   | 484|  484|     1960|     2008| 49|
|Congo (Zaire)                  |   490|Congo, Democratic Republic of (Zaire)   | 490|  490|     1960|     2008| 49|
|Germany                        |   255|German Federal Republic                 | 260|  255|     1990|     2008| 19|
|Iran                           |   630|Iran (Persia)                           | 630|  630|     1946|     2008| 63|
|Italy                          |   325|Italy/Sardinia                          | 325|  325|     1946|     2008| 63|
|Ivory Coast                    |   437|Cote D'Ivoire                           | 437|  437|     1960|     2008| 49|
|Korea, North                   |   731|Korea, People's Republic of             | 731|  731|     1948|     2008| 61|
|Korea, South                   |   732|Korea, Republic of                      | 732|  732|     1948|     2008| 61|
|Kyrgyzstan                     |   703|Kyrgyz Republic                         | 703|  703|     1991|     2008| 18|
|Macedonia                      |   343|Macedonia (Former Yugoslav Republic of) | 343|  343|     1993|     2008| 16|
|Madagascar                     |   580|Madagascar (Malagasy)                   | 580|  580|     1960|     2008| 49|
|Myanmar                        |   775|Myanmar (Burma)                         | 775|  775|     1948|     2008| 61|
|Russia                         |   365|Russia (Soviet Union)                   | 365|  365|     1946|     2008| 63|
|Samoa                          |   990|Samoa/Western Samoa                     | 990|  990|     1976|     2008| 33|
|Serbia                         |   345|Yugoslavia                              | 345|  345|     1992|     2005| 14|
|Sri Lanka                      |   780|Sri Lanka (Ceylon)                      | 780|  780|     1948|     2008| 61|
|St. Kitts and Nevis            |    60|Saint Kitts and Nevis                   |  60|   60|     1983|     2008| 26|
|St. Lucia                      |    56|Saint Lucia                             |  56|   56|     1979|     2008| 30|
|St. Vincent and the Grenadines |    57|Saint Vincent and the Grenadines        |  57|   57|     1979|     2008| 30|
|Suriname                       |   115|Surinam                                 | 115|  115|     1975|     2008| 34|
|Tanzania                       |   510|Tanzania/Tanganyika                     | 510|  510|     1961|     2008| 48|
|Turkey                         |   640|Turkey (Ottoman Empire)                 | 640|  640|     1946|     2008| 63|
|Vietnam, North                 |   816|Vietnam, Democratic Republic of         | 816|  816|     1954|     2008| 55|
|Vietnam, South                 |   817|Vietnam, Republic of                    | 817|  817|     1954|     1975| 22|
|Yemen                          |   679|Yemen (Arab Republic of Yemen)          | 678|  679|     1990|     2008| 19|
|Yemen Arab Republic            |   678|Yemen (Arab Republic of Yemen)          | 678|  678|     1946|     1989| 44|
|Yemen People's Republic        |   680|Yemen, People's Republic of             | 680|  680|     1967|     1989| 23|
|Zimbabwe                       |   511|Zimbabwe (Rhodesia)                     | 552|  552|     1963|     1964|  2|
|Zimbabwe                       |   552|Zimbabwe (Rhodesia)                     | 552|  552|     1965|     2008| 44|

```
## Changing the name of the original country column from cname to svolik_regime_country...
```

```
## Ensuring year column is numeric...
```

```
## Changing the name of the original code column from ccode to svolik_regime_ccode...
```

```r
stopifnot(identical(svolik_regime, tar_read(svolik_regime, store = here::here("_targets"))))
stopifnot(identical(svolik_regime, democracyData::svolik_regime))
```

# UDS


```r
cite_dataset("uds")
```

[1] X. Marquez. "A Quick Method for Extending the Unified Democracy
Scores". In: _Available at SSRN 2753830_ (2016).
<https://papers.ssrn.com/sol3/papers.cfm?abstract_id=2753830>.

[2] D. Pemstein, S. A. Meserve, and J. Melton. _Replication data for:
Democratic Compromise: A Latent Variable Analysis of Ten Measures of
Regime Type_. 2013. <http://hdl.handle.net/1902.1/PMM>.

[3] D. Pemstein, S. Meserve, and J. Melton. "Democratic Compromise: A
Latent Variable Analysis of Ten Measures of Regime Type". In:
_Political Analysis_ 18.4 (2010), pp. 426-449. DOI: 10.1093/pan/mpq020.

```r
# The website is no longer online.

# uds_2014 <- redownload_uds(verbose = verbose,
#                            include_in_output = include_in_output)
# 
# uds_2011 <- redownload_uds(2011,
#                            verbose = verbose,
#                            include_in_output = include_in_output)
# 
# uds_2010 <- redownload_uds(2010,
#                            verbose = verbose,
#                            include_in_output = include_in_output)

# usethis::use_data(uds_2014, uds_2011, uds_2010, overwrite = TRUE)

cite_dataset("extended_uds")
```

[1] X. Marquez. "A Quick Method for Extending the Unified Democracy
Scores". In: _Available at SSRN 2753830_ (2016).
<https://papers.ssrn.com/sol3/papers.cfm?abstract_id=2753830>.

```r
set.seed(tar_meta() |> filter(name == "extended_uds") |> pull(seed))
extended_uds <- generate_extended_uds(verbose = verbose)
```

```
## Adding Freedom House data
```

```
## Downloading  data...
```

```
## Trying https://freedomhouse.org/sites/default/files/2023-02/Country_and_Territory_Ratings_and_Statuses_FIW_1973-2023%20.xlsx ...
```

```
## The downloaded  dataset has 205 rows
```

```
## Downloading  data...
```

```
## Trying https://freedomhouse.org/sites/default/files/2023-02/Country_and_Territory_Ratings_and_Statuses_FIW_1973-2023%20.xlsx ...
```

```
## The downloaded  dataset has 25 rows
```

```
## Original dataset has 230 rows, but is not in country-year format
```

```
## Processing the FH 2022 data - putting it in country-year format, adding state system info...
```

```
## Warning in download_fh(verbose = verbose, include_territories = TRUE): NAs
## introduced by coercion

## Warning in download_fh(verbose = verbose, include_territories = TRUE): NAs
## introduced by coercion
```

```
## The following different countries/country codes match to a single country unit in the destination system:
```



|country    |extended_country_name | GWn| cown| min_date| max_date|  n|
|:----------|:---------------------|---:|----:|--------:|--------:|--:|
|Gaza Strip |Palestine, State of   |  NA|   NA|     2010|     2022| 13|
|West Bank  |Palestine, State of   |  NA|   NA|     2010|     2022| 13|

```
## The following country and/or code-years were not matched:
```



|country           |extended_country_name | GWn| cown| min_date| max_date|  n|
|:-----------------|:---------------------|---:|----:|--------:|--------:|--:|
|Chechnya          |NA                    |  NA|   NA|     1998|     2008| 11|
|Crimea            |NA                    |  NA|   NA|     2014|     2022|  9|
|Eastern Donbas    |NA                    |  NA|   NA|     2019|     2022|  4|
|Indian Kashmir    |NA                    |  NA|   NA|     1990|     2022| 33|
|Kurdistan         |NA                    |  NA|   NA|     1992|     2003| 12|
|Nagorno-Karabakh  |NA                    |  NA|   NA|     1993|     2022| 30|
|Northern Cyprus   |NA                    |  NA|   NA|     1982|     2022| 41|
|Northern Ireland  |NA                    |  NA|   NA|     2000|     2003|  4|
|Pakistani Kashmir |NA                    |  NA|   NA|     2002|     2022| 21|
|Transnistria      |NA                    |  NA|   NA|     1996|     2022| 27|
|West Papua        |NA                    |  NA|   NA|     2000|     2003|  4|

```
## The following country names are different in the destination system:
```



|country                                        |extended_country_name                   | GWn| cown| min_date| max_date|  n|
|:----------------------------------------------|:---------------------------------------|---:|----:|--------:|--------:|--:|
|Antigua and Barbuda                            |Antigua & Barbuda                       |  58|   58|     1982|     2022| 41|
|Belarus                                        |Belarus (Byelorussia)                   | 370|  370|     1991|     2022| 32|
|Bosnia and Herzegovina                         |Bosnia-Herzegovina                      | 346|  346|     1992|     2022| 31|
|Burkina Faso                                   |Burkina Faso (Upper Volta)              | 439|  439|     1972|     2022| 50|
|Cabo Verde                                     |Cape Verde                              | 402|  402|     1975|     2022| 47|
|Cambodia                                       |Cambodia (Kampuchea)                    | 811|  811|     1972|     2022| 50|
|Congo (Brazzaville)                            |Congo                                   | 484|  484|     1972|     2022| 50|
|Congo (Kinshasa)                               |Congo, Democratic Republic of (Zaire)   | 490|  490|     1972|     2022| 50|
|East Germany                                   |German Democratic Republic              | 265|  265|     1972|     1989| 17|
|Eswatini                                       |Swaziland                               | 572|  572|     1972|     2022| 50|
|Gaza Strip                                     |Palestine, State of                     |  NA|   NA|     2010|     2022| 13|
|Germany                                        |German Federal Republic                 | 260|  255|     1990|     2022| 33|
|Germany, W.                                    |German Federal Republic                 | 260|  260|     1972|     1989| 17|
|Iran                                           |Iran (Persia)                           | 630|  630|     1972|     2022| 50|
|Israeli-Occupied Territories                   |Israel, occupied territories only       |  NA|   NA|     1996|     2009| 14|
|Italy                                          |Italy/Sardinia                          | 325|  325|     1972|     2022| 50|
|Kyrgyzstan                                     |Kyrgyz Republic                         | 703|  703|     1991|     2022| 32|
|Madagascar                                     |Madagascar (Malagasy)                   | 580|  580|     1972|     2022| 50|
|Micronesia                                     |Federated States of Micronesia          | 987|  987|     1991|     2022| 32|
|Myanmar                                        |Myanmar (Burma)                         | 775|  775|     1972|     2022| 50|
|North Korea                                    |Korea, People's Republic of             | 731|  731|     1972|     2022| 50|
|North Macedonia                                |Macedonia (Former Yugoslav Republic of) | 343|  343|     1992|     2022| 31|
|Palestinian Authority-Administered Territories |Palestine, State of                     |  NA|   NA|     1996|     2009| 14|
|Russia                                         |Russia (Soviet Union)                   | 365|  365|     1991|     2022| 32|
|Samoa                                          |Samoa/Western Samoa                     | 990|  990|     1972|     2022| 50|
|Serbia and Montenegro                          |Yugoslavia                              | 345|  345|     2003|     2005|  3|
|South Korea                                    |Korea, Republic of                      | 732|  732|     1972|     2022| 50|
|South Vietnam                                  |Vietnam, Republic of                    | 817|  817|     1972|     1975|  4|
|South Yemen                                    |Yemen, People's Republic of             | 680|  680|     1972|     1989| 17|
|Sri Lanka                                      |Sri Lanka (Ceylon)                      | 780|  780|     1972|     2022| 50|
|St. Kitts and Nevis                            |Saint Kitts and Nevis                   |  60|   60|     1983|     2022| 40|
|St. Lucia                                      |Saint Lucia                             |  56|   56|     1979|     2022| 43|
|St. Vincent and the Grenadines                 |Saint Vincent and the Grenadines        |  57|   57|     1979|     2022| 43|
|Suriname                                       |Surinam                                 | 115|  115|     1975|     2022| 47|
|Tanzania                                       |Tanzania/Tanganyika                     | 510|  510|     1972|     2022| 50|
|The Gambia                                     |Gambia                                  | 420|  420|     1972|     2022| 50|
|Timor-Leste                                    |East Timor                              | 860|  860|     1999|     2022| 24|
|Turkey                                         |Turkey (Ottoman Empire)                 | 640|  640|     1972|     2022| 50|
|USSR                                           |Russia (Soviet Union)                   | 365|  365|     1972|     1990| 18|
|United States                                  |United States of America                |   2|    2|     1972|     2022| 50|
|Vietnam                                        |Vietnam, Democratic Republic of         | 816|  816|     1976|     2022| 46|
|Vietnam, N.                                    |Vietnam, Democratic Republic of         | 816|  816|     1972|     1975|  4|
|West Bank                                      |Palestine, State of                     |  NA|   NA|     2010|     2022| 13|
|West Bank and Gaza Strip                       |Palestine, State of                     |  NA|   NA|     1977|     1995| 18|
|Yemen                                          |Yemen (Arab Republic of Yemen)          | 678|  679|     1990|     2022| 33|
|Yemen, N.                                      |Yemen (Arab Republic of Yemen)          | 678|  678|     1972|     1989| 17|
|Zimbabwe                                       |Zimbabwe (Rhodesia)                     | 552|  552|     1972|     2022| 50|

```
## Resulting dataset after processing has 9547 rows.
```

```
## Changing the name of the original country column from country to fh_country...
```

```
## Ensuring year column is numeric...
```

```
## Adding fh_pmm data
```

```
## Adding Freedom House electoral democracies data
```

```
## Downloading /FH_Electoral_Democracies_1988-2016.xls data...
```

```
## Trying https://freedomhouse.org/sites/default/files/FIW2017_Data.zip ...
```

```
## The files in the archive are:
```

 [1] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/FIW2017_Data/.DS_Store"                                                             
 [2] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/__MACOSX/FIW2017_Data/._.DS_Store"                                                  
 [3] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/FIW2017_Data/FH_Country_and_Territory_Ratings_and_Statuses_1972-2016.xls"           
 [4] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/__MACOSX/FIW2017_Data/._FH_Country_and_Territory_Ratings_and_Statuses_1972-2016.xls"
 [5] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/FIW2017_Data/FH_Country_Status_Distribution_1972-2016.xls"                          
 [6] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/__MACOSX/FIW2017_Data/._FH_Country_Status_Distribution_1972-2016.xls"               
 [7] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/FIW2017_Data/FH_Electoral_Democracies_1988-2016.xls"                                
 [8] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/__MACOSX/FIW2017_Data/._FH_Electoral_Democracies_1988-2016.xls"                     
 [9] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/FIW2017_Data/Subcategory_Scores_FIW2017.xlsx"                                       
[10] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/__MACOSX/FIW2017_Data/._Subcategory_Scores_FIW2017.xlsx"                            
[11] "C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/__MACOSX/._FIW2017_Data"                                                            

```
## Extracting C:/Users/marquexa/AppData/Local/Temp/RtmpS6r4ID/FIW2017_Data/FH_Electoral_Democracies_1988-2016.xls
```

```
## The downloaded /FH_Electoral_Democracies_1988-2016.xls dataset has 208 rows
```

```
## Downloading  data...
```

```
## Trying https://freedomhouse.org/sites/default/files/List%20of%20Electoral%20Democracies%20FIW%202018.xlsx ...
```

```
## The downloaded  dataset has 195 rows
```

```
## Downloading  data...
```

```
## Trying https://freedomhouse.org/sites/default/files/List_of_Electoral_Democracies_FIW19.xls ...
```

```
## The downloaded  dataset has 195 rows
```

```
## Downloading  data...
```

```
## Trying https://freedomhouse.org/sites/default/files/2020-02/2020_List_of_Electoral_Democracies_FIW_2020.xlsx ...
```

```
## The downloaded  dataset has 195 rows
```

```
## Downloading  data...
```

```
## Trying https://freedomhouse.org/sites/default/files/2022-03/List_of_Electoral_Democracies_FIW22.xlsx ...
```

```
## The downloaded  dataset has 195 rows
```

```
## Downloading  data...
```

```
## Trying https://freedomhouse.org/sites/default/files/2023-02/List_of_Electoral_Democracies_FIW23.xlsx ...
```

```
## The downloaded  dataset has 195 rows
```

```
## Original dataset has 1183 rows, but is not in country-year format
```

```
## Processing the FH Electoral Democracies 1989-2022 data - putting it in country-year format, adding state system info...
```

```
## The following different countries/country codes match to a single country unit in the destination system:
```



|country |extended_country_name | GWn| cown| min_date| max_date|  n|
|:-------|:---------------------|---:|----:|--------:|--------:|--:|
|Russia  |Russia (Soviet Union) | 365|  365|     1991|     1991|  1|
|USSR    |Russia (Soviet Union) | 365|  365|     1991|     1991|  1|

```
## The following country names are different in the destination system:
```



|country                        |extended_country_name                   | GWn| cown| min_date| max_date|  n|
|:------------------------------|:---------------------------------------|---:|----:|--------:|--------:|--:|
|Antigua and Barbuda            |Antigua & Barbuda                       |  58|   58|     2018|     2022|  5|
|Belarus                        |Belarus (Byelorussia)                   | 370|  370|     1991|     2022| 31|
|Bosnia and Herzegovina         |Bosnia-Herzegovina                      | 346|  346|     2018|     2022|  5|
|Burkina Faso                   |Burkina Faso (Upper Volta)              | 439|  439|     1989|     2022| 33|
|Cabo Verde                     |Cape Verde                              | 402|  402|     2020|     2022|  3|
|Cambodia                       |Cambodia (Kampuchea)                    | 811|  811|     1989|     2022| 33|
|Congo (Brazzaville)            |Congo                                   | 484|  484|     1989|     2022| 33|
|Congo (Kinshasa)               |Congo, Democratic Republic of (Zaire)   | 490|  490|     1989|     2022| 33|
|East Germany                   |German Democratic Republic              | 265|  265|     1989|     1989|  1|
|Eswatini                       |Swaziland                               | 572|  572|     2019|     2019|  1|
|Gambia, The                    |Gambia                                  | 420|  420|     1989|     2016| 28|
|Germany                        |German Federal Republic                 | 260|  255|     1990|     2022| 32|
|Germany, W.                    |German Federal Republic                 | 260|  260|     1989|     1989|  1|
|Iran                           |Iran (Persia)                           | 630|  630|     1989|     2022| 33|
|Italy                          |Italy/Sardinia                          | 325|  325|     1989|     2022| 33|
|Kyrgyzstan                     |Kyrgyz Republic                         | 703|  703|     1991|     2022| 31|
|Macedonia                      |Macedonia (Former Yugoslav Republic of) | 343|  343|     1992|     2019| 27|
|Madagascar                     |Madagascar (Malagasy)                   | 580|  580|     1989|     2022| 33|
|Micronesia                     |Federated States of Micronesia          | 987|  987|     1991|     2022| 31|
|Myanmar                        |Myanmar (Burma)                         | 775|  775|     1989|     2022| 33|
|North Korea                    |Korea, People's Republic of             | 731|  731|     1989|     2022| 33|
|North Macedonia                |Macedonia (Former Yugoslav Republic of) | 343|  343|     2020|     2022|  3|
|Russia                         |Russia (Soviet Union)                   | 365|  365|     1991|     2022| 31|
|Samoa                          |Samoa/Western Samoa                     | 990|  990|     1989|     2022| 33|
|Sao Tome & Principe            |Sao Tome and Principe                   | 403|  403|     1989|     2016| 28|
|Serbia & Montenegro            |Yugoslavia                              | 345|  345|     2003|     2005|  3|
|South Korea                    |Korea, Republic of                      | 732|  732|     1989|     2022| 33|
|South Yemen                    |Yemen, People's Republic of             | 680|  680|     1989|     1989|  1|
|Sri Lanka                      |Sri Lanka (Ceylon)                      | 780|  780|     1989|     2022| 33|
|St. Kitts & Nevis              |Saint Kitts and Nevis                   |  60|   60|     1989|     2016| 28|
|St. Kitts and Nevis            |Saint Kitts and Nevis                   |  60|   60|     2018|     2022|  5|
|St. Lucia                      |Saint Lucia                             |  56|   56|     1989|     2022| 33|
|St. Vincent & Grenadines       |Saint Vincent and the Grenadines        |  57|   57|     1989|     2016| 28|
|St. Vincent and the Grenadines |Saint Vincent and the Grenadines        |  57|   57|     2018|     2022|  5|
|Suriname                       |Surinam                                 | 115|  115|     1989|     2022| 33|
|Tanzania                       |Tanzania/Tanganyika                     | 510|  510|     1989|     2022| 33|
|The Gambia                     |Gambia                                  | 420|  420|     2018|     2022|  5|
|Timor-Leste                    |East Timor                              | 860|  860|     1999|     2022| 23|
|Trinidad & Tobago              |Trinidad and Tobago                     |  52|   52|     1989|     2016| 28|
|Turkey                         |Turkey (Ottoman Empire)                 | 640|  640|     1989|     2022| 33|
|USSR                           |Russia (Soviet Union)                   | 365|  365|     1989|     1991|  3|
|United States                  |United States of America                |   2|    2|     1989|     2022| 33|
|Vietnam                        |Vietnam, Democratic Republic of         | 816|  816|     1989|     2022| 33|
|Yemen                          |Yemen (Arab Republic of Yemen)          | 678|  679|     1990|     2022| 32|
|Yemen, N.                      |Yemen (Arab Republic of Yemen)          | 678|  678|     1989|     1989|  1|
|Zimbabwe                       |Zimbabwe (Rhodesia)                     | 552|  552|     1989|     2022| 33|
|eSwatini                       |Swaziland                               | 572|  572|     2020|     2022|  3|

```
## Resulting dataset after processing has 6296 rows.
```

```
## Changing the name of the original country column from country to fh_electoral_country...
```

```
## Ensuring year column is numeric...
```

```
## Adding Polity5 data
```

```
## Downloading polity data...
```

```
## Trying http://www.systemicpeace.org/inscr/p5v2018.sav ...
```

```
## The downloaded polity dataset has 17574 rows
```

```
## Original dataset has 17574 rows.
```

```
## Processing the Polity 5 data - adding state system info...
```

```
## The following different countries/country codes match to a single country unit in the destination system:
```



|country       | ccode|extended_country_name           | GWn| cown| min_date| max_date|  n|
|:-------------|-----:|:-------------------------------|---:|----:|--------:|--------:|--:|
|Ethiopia      |   529|Ethiopia                        | 530|  530|     1993|     1993|  1|
|Ethiopia      |   530|Ethiopia                        | 530|  530|     1993|     1993|  1|
|Italy         |   325|Italy/Sardinia                  | 325|  325|     1861|     1861|  1|
|Russia        |   365|Russia (Soviet Union)           | 365|  365|     1922|     1922|  1|
|Sardinia      |   324|Italy/Sardinia                  | 325|  325|     1861|     1861|  1|
|Sudan         |   625|Sudan                           | 625|  625|     2011|     2011|  1|
|Sudan-North   |   626|Sudan                           | 625|  625|     2011|     2011|  1|
|USSR          |   364|Russia (Soviet Union)           | 365|  365|     1922|     1922|  1|
|Vietnam       |   818|Vietnam, Democratic Republic of | 816|  816|     1976|     1976|  1|
|Vietnam North |   816|Vietnam, Democratic Republic of | 816|  816|     1976|     1976|  1|
|Yugoslavia    |   345|Yugoslavia                      | 345|  345|     1991|     1991|  1|
|Yugoslavia    |   347|Yugoslavia                      | 345|  345|     1991|     1991|  1|

```
## The following country names are different in the destination system:
```



|country               | ccode|extended_country_name                   | GWn| cown| min_date| max_date|   n|
|:---------------------|-----:|:---------------------------------------|---:|----:|--------:|--------:|---:|
|Belarus               |   370|Belarus (Byelorussia)                   | 370|  370|     1991|     2018|  28|
|Bosnia                |   346|Bosnia-Herzegovina                      | 346|  346|     1992|     2018|  27|
|Burkina Faso          |   439|Burkina Faso (Upper Volta)              | 439|  439|     1960|     2018|  59|
|Cambodia              |   811|Cambodia (Kampuchea)                    | 811|  811|     1953|     2018|  66|
|Congo Brazzaville     |   484|Congo                                   | 484|  484|     2005|     2018|  14|
|Congo Kinshasa        |   490|Congo, Democratic Republic of (Zaire)   | 490|  490|     1960|     2018|  59|
|Congo-Brazzaville     |   484|Congo                                   | 484|  484|     1960|     2004|  45|
|Germany               |   255|German Federal Republic                 | 260|  255|     1945|     2018|  30|
|Germany               |   255|Germany (Prussia)                       | 255|  255|     1868|     1944|  77|
|Germany East          |   265|German Democratic Republic              | 265|  265|     1945|     1990|  46|
|Germany West          |   260|German Federal Republic                 | 260|  260|     1945|     1990|  46|
|Gran Colombia         |    99|Great Colombia                          |  99|   NA|     1821|     1832|  12|
|Iran                  |   630|Iran (Persia)                           | 630|  630|     1800|     2018| 219|
|Italy                 |   325|Italy/Sardinia                          | 325|  325|     1861|     2018| 158|
|Ivory Coast           |   437|Cote D'Ivoire                           | 437|  437|     2014|     2015|   2|
|Korea North           |   731|Korea, People's Republic of             | 731|  731|     1948|     2018|  71|
|Korea South           |   732|Korea, Republic of                      | 732|  732|     1948|     2018|  71|
|Kyrgyzstan            |   703|Kyrgyz Republic                         | 703|  703|     1991|     2018|  28|
|Macedonia             |   343|Macedonia (Former Yugoslav Republic of) | 343|  343|     1991|     2018|  28|
|Madagascar            |   580|Madagascar (Malagasy)                   | 580|  580|     1960|     2018|  59|
|Prussia               |   255|Germany (Prussia)                       | 255|  255|     1800|     1867|  68|
|Russia                |   365|Russia (Soviet Union)                   | 365|  365|     1800|     2018| 150|
|Sardinia              |   324|Italy/Sardinia                          | 325|  325|     1815|     1861|  47|
|Serbia and Montenegro |   347|Yugoslavia                              | 345|  345|     2003|     2006|   4|
|Slovak Republic       |   317|Slovakia                                | 317|  317|     1993|     2018|  26|
|South Vietnam         |   817|Vietnam, Republic of                    | 817|  817|     1955|     1975|  21|
|Sri Lanka             |   780|Sri Lanka (Ceylon)                      | 780|  780|     1948|     2018|  71|
|Sudan-North           |   626|Sudan                                   | 625|  625|     2011|     2018|   8|
|Suriname              |   115|Surinam                                 | 115|  115|     1975|     2018|  44|
|Tanzania              |   510|Tanzania/Tanganyika                     | 510|  510|     1961|     2018|  58|
|Timor Leste           |   860|East Timor                              | 860|  860|     2002|     2018|  17|
|Turkey                |   640|Turkey (Ottoman Empire)                 | 640|  640|     1800|     2018| 219|
|Two Sicilies          |   329|Sicily (Two Sicilies)                   | 329|  329|     1816|     1860|  45|
|UAE                   |   696|United Arab Emirates                    | 696|  696|     1971|     2018|  48|
|USSR                  |   364|Russia (Soviet Union)                   | 365|  365|     1922|     1991|  70|
|United Province CA    |    89|United Provinces of Central America     |  89|   NA|     1824|     1838|  15|
|United States         |     2|United States of America                |   2|    2|     1776|     2020| 245|
|Vietnam               |   818|Vietnam, Democratic Republic of         | 816|  816|     1976|     2018|  43|
|Vietnam North         |   816|Vietnam, Democratic Republic of         | 816|  816|     1954|     1976|  23|
|Wuerttemburg          |   271|Wurttemberg                             | 271|  271|     1800|     1871|  72|
|Yemen                 |   679|Yemen (Arab Republic of Yemen)          | 678|  679|     1990|     2018|  29|
|Yemen North           |   678|Yemen (Arab Republic of Yemen)          | 678|  678|     1918|     1990|  73|
|Yemen South           |   680|Yemen, People's Republic of             | 680|  680|     1967|     1990|  24|
|Zimbabwe              |   552|Zimbabwe (Rhodesia)                     | 552|  552|     1980|     2018|  39|

```
## Resulting dataset after processing has 17574 rows.
```

```
## Changing the name of the original country column from country to polity_annual_country...
```

```
## Ensuring year column is numeric...
```

```
## Changing the name of the original code column from ccode to polity_annual_ccode...
```

```
## Adding old polityIV data
```

```
## Adding polity_pmm data
```

```
## Adding WGI data
```

```
## Original dataset has 214 rows, but is not in country-year format
```

```
## Processing the WGI data - putting it in country-year format, adding state system info...
```

```
## The following country names are different in the destination system:
```



|wb_country                     |wb_code |extended_country_name                   | GWn| cown| min_date| max_date|  n|
|:------------------------------|:-------|:---------------------------------------|---:|----:|--------:|--------:|--:|
|Antigua and Barbuda            |ATG     |Antigua & Barbuda                       |  58|   58|     1996|     2021| 23|
|Bahamas, The                   |BHS     |Bahamas                                 |  31|   31|     1996|     2021| 23|
|Belarus                        |BLR     |Belarus (Byelorussia)                   | 370|  370|     1996|     2021| 23|
|Bosnia and Herzegovina         |BIH     |Bosnia-Herzegovina                      | 346|  346|     1996|     2021| 23|
|Brunei Darussalam              |BRN     |Brunei                                  | 835|  835|     1996|     2021| 23|
|Burkina Faso                   |BFA     |Burkina Faso (Upper Volta)              | 439|  439|     1996|     2021| 23|
|Cambodia                       |KHM     |Cambodia (Kampuchea)                    | 811|  811|     1996|     2021| 23|
|Congo, Dem. Rep.               |ZAR     |Congo, Democratic Republic of (Zaire)   | 490|  490|     1996|     2021| 23|
|Congo, Rep.                    |COG     |Congo                                   | 484|  484|     1996|     2021| 23|
|Côte d'Ivoire                  |CIV     |Cote D'Ivoire                           | 437|  437|     1996|     2021| 23|
|Egypt, Arab Rep.               |EGY     |Egypt                                   | 651|  651|     1996|     2021| 23|
|Eswatini                       |SWZ     |Swaziland                               | 572|  572|     1996|     2021| 23|
|Gambia, The                    |GMB     |Gambia                                  | 420|  420|     1996|     2021| 23|
|Germany                        |DEU     |German Federal Republic                 | 260|  255|     1996|     2021| 23|
|Hong Kong SAR, China           |HKG     |Hong Kong                               |  NA|   NA|     1996|     2021| 23|
|Iran, Islamic Rep.             |IRN     |Iran (Persia)                           | 630|  630|     1996|     2021| 23|
|Italy                          |ITA     |Italy/Sardinia                          | 325|  325|     1996|     2021| 23|
|Jersey, Channel Islands        |JEY     |Jersey                                  |  NA|   NA|     2011|     2021| 11|
|Korea, Dem. Rep.               |PRK     |Korea, People's Republic of             | 731|  731|     1996|     2021| 23|
|Korea, Rep.                    |KOR     |Korea, Republic of                      | 732|  732|     1996|     2021| 23|
|Lao PDR                        |LAO     |Laos                                    | 812|  812|     1996|     2021| 23|
|Macao SAR, China               |MAC     |Macao                                   |  NA|   NA|     1996|     2021| 23|
|Madagascar                     |MDG     |Madagascar (Malagasy)                   | 580|  580|     1996|     2021| 23|
|Micronesia, Fed. Sts.          |FSM     |Federated States of Micronesia          | 987|  987|     1996|     2021| 23|
|Myanmar                        |MMR     |Myanmar (Burma)                         | 775|  775|     1996|     2021| 23|
|Netherlands Antilles (former)  |ANT     |Netherlands Antilles                    |  NA|   NA|     2004|     2013| 10|
|North Macedonia                |MKD     |Macedonia (Former Yugoslav Republic of) | 343|  343|     1996|     2021| 23|
|Russian Federation             |RUS     |Russia (Soviet Union)                   | 365|  365|     1996|     2021| 23|
|Réunion                        |REU     |Reunion                                 |  NA|   NA|     2004|     2013| 10|
|Samoa                          |WSM     |Samoa/Western Samoa                     | 990|  990|     1996|     2021| 23|
|Serbia                         |SRB     |Yugoslavia                              | 345|  345|     1996|     2005|  7|
|Slovak Republic                |SVK     |Slovakia                                | 317|  317|     1996|     2021| 23|
|Sri Lanka                      |LKA     |Sri Lanka (Ceylon)                      | 780|  780|     1996|     2021| 23|
|St. Kitts and Nevis            |KNA     |Saint Kitts and Nevis                   |  60|   60|     1996|     2021| 23|
|St. Lucia                      |LCA     |Saint Lucia                             |  56|   56|     1996|     2021| 23|
|St. Vincent and the Grenadines |VCT     |Saint Vincent and the Grenadines        |  57|   57|     1996|     2021| 23|
|Suriname                       |SUR     |Surinam                                 | 115|  115|     1996|     2021| 23|
|Syrian Arab Republic           |SYR     |Syria                                   | 652|  652|     1996|     2021| 23|
|São Tomé and Principe          |STP     |Sao Tome and Principe                   | 403|  403|     1996|     2021| 23|
|Taiwan, China                  |TWN     |Taiwan                                  | 713|  713|     1996|     2021| 23|
|Tanzania                       |TZA     |Tanzania/Tanganyika                     | 510|  510|     1996|     2021| 23|
|Timor-Leste                    |TMP     |East Timor                              | 860|  860|     1996|     2021| 23|
|Türkiye                        |TUR     |Turkey (Ottoman Empire)                 | 640|  640|     1996|     2021| 23|
|United States                  |USA     |United States of America                |   2|    2|     1996|     2021| 23|
|Venezuela, RB                  |VEN     |Venezuela                               | 101|  101|     1996|     2021| 23|
|Vietnam                        |VNM     |Vietnam, Democratic Republic of         | 816|  816|     1996|     2021| 23|
|Virgin Islands (U.S.)          |VIR     |Virgin Islands, U.S.                    |  NA|   NA|     2004|     2013| 10|
|West Bank and Gaza             |WBG     |Palestine, State of                     |  NA|   NA|     1996|     2021| 23|
|Yemen, Rep.                    |YEM     |Yemen (Arab Republic of Yemen)          | 678|  679|     1996|     2021| 23|
|Zimbabwe                       |ZWE     |Zimbabwe (Rhodesia)                     | 552|  552|     1996|     2021| 23|

```
## Adding Anckar-Fredriksson data
```

```
## Adding ANRR data
```

```
## Adding Arat data
```

```
## Adding BLM data
```

```
## Adding blm_pmm data
```

```
## Adding BMR data
```

```
## Adding BNR extended data
```

```
## Adding BNR data
```

```
## Adding BTI data
```

```
## Adding Bollen data
```

```
## Adding Doorenspleet data
```

```
## Adding EIU data
```

```
## Adding GWF data
```

```
## Adding GWF data
```

```
## Adding Hadenius data
```

```
## Adding Kailitz data
```

```
## Adding LIED data
```

```
## Adding Magaloni extended data
```

```
## Adding Magaloni data
```

```
## Adding Mainwaring data
```

```
## Adding mainwaring_pmm data
```

```
## Adding Munck data
```

```
## Adding PACL data
```

```
## Adding pacl_pmm data
```

```
## Adding Update of PACL data by Bjornskov and Rode
```

```
## Adding PEPS data
```

```
## Adding PITF data
```

```
## Adding Polyarchy original data
```

```
## Adding polyarchy_pmm data
```

```
## Adding Polyarchy Dimensions data
```

```
## Adding PRC/Gasiorowski data
```

```
## Warning: There was 1 warning in `mutate()`.
## ℹ In argument: `prc = (structure(function (..., .x = ..1, .y = ..2, . = ..1)
##   ...`.
## Caused by warning:
## ! NAs introduced by coercion
```

```
## Adding prc_pmm data
```

```
## Adding PIPE data
```

```
## Adding REIGN data
```

```
## Adding SVMDI data
```

```
## Adding SVMDI 2016 data
```

```
## Adding Svolik data
```

```
## Adding UDS 2014 data
```

```
## Adding UDS 2011 data
```

```
## Adding UDS 2010 data
```

```
## Adding extended Ulfelder data
```

```
## Adding Ulfelder data
```

```
## Adding UTIP data
```

```
## Adding Vanhanen data
```

```
## Adding Vanhanen_pmm data
```

```
## Adding vdem data
```

```
## Adding Wahman, Teorell, and Hadenius data
```

```
## Finalizing
```

```
## Using anckar_democracy to generate extended uds...Using anrr_democracy to generate extended uds...Using blm to generate extended uds...Using bmr_democracy_femalesuffrage to generate extended uds...Using bnr_extended to generate extended uds...Using bti_democracy to generate extended uds...Using csvmdi to generate extended uds...Using doorenspleet to generate extended uds...Using eiu to generate extended uds...Using fh_electoral to generate extended uds...Using fh_total_reversed to generate extended uds...Using gwf_democracy_extended_strict to generate extended uds...Using kailitz_tri to generate extended uds...Using lexical_index to generate extended uds...Using magaloni_democracy_extended to generate extended uds...Using mainwaring to generate extended uds...Using pacl to generate extended uds...Using pacl_update to generate extended uds...Using PEPS1v to generate extended uds...Using pitf to generate extended uds...Using pmm_arat to generate extended uds...Using pmm_bollen to generate extended uds...Using pmm_hadenius to generate extended uds...Using pmm_munck to generate extended uds...Using polity2 to generate extended uds...Using polyarchy_contestation_dimension to generate extended uds...Using polyarchy_inclusion_dimension to generate extended uds...Using polyarchy_original_contestation to generate extended uds...Using polyarchy_original_polyarchy to generate extended uds...Using prc to generate extended uds...Using reign_democracy to generate extended uds...Using svolik_democracy to generate extended uds...Using ulfelder_democracy_extended to generate extended uds...Using utip_trichotomous to generate extended uds...Using v2x_polyarchy to generate extended uds...Using vanhanen_democratization to generate extended uds...Using wgi_democracy to generate extended uds...Using wth_democrobust to generate extended uds...
```

```
## Now preparing data for use with mirt...
```

```
## Now fitting mirt model...
```

Iteration: 1, Log-Lik: -566378.366, Max-Change: 0.97330Iteration: 2, Log-Lik: -492442.249, Max-Change: 0.59497Iteration: 3, Log-Lik: -468581.891, Max-Change: 0.60253Iteration: 4, Log-Lik: -440577.754, Max-Change: 0.85307Iteration: 5, Log-Lik: -416564.634, Max-Change: 0.91488Iteration: 6, Log-Lik: -399878.441, Max-Change: 1.61025Iteration: 7, Log-Lik: -383294.681, Max-Change: 1.21616Iteration: 8, Log-Lik: -371067.722, Max-Change: 2.06306Iteration: 9, Log-Lik: -361996.510, Max-Change: 1.34074Iteration: 10, Log-Lik: -353206.969, Max-Change: 1.68873Iteration: 11, Log-Lik: -346508.784, Max-Change: 1.61638Iteration: 12, Log-Lik: -342241.761, Max-Change: 1.28088Iteration: 13, Log-Lik: -339996.524, Max-Change: 0.56922Iteration: 14, Log-Lik: -338427.614, Max-Change: 0.50607Iteration: 15, Log-Lik: -337019.553, Max-Change: 0.44502Iteration: 16, Log-Lik: -335811.400, Max-Change: 0.41511Iteration: 17, Log-Lik: -334744.873, Max-Change: 0.43416Iteration: 18, Log-Lik: -333787.460, Max-Change: 0.42140Iteration: 19, Log-Lik: -332925.214, Max-Change: 0.36430Iteration: 20, Log-Lik: -332163.058, Max-Change: 0.36052Iteration: 21, Log-Lik: -331459.988, Max-Change: 0.33791Iteration: 22, Log-Lik: -330819.820, Max-Change: 0.34659Iteration: 23, Log-Lik: -330207.757, Max-Change: 0.29315Iteration: 24, Log-Lik: -329651.061, Max-Change: 0.35275Iteration: 25, Log-Lik: -328309.641, Max-Change: 0.20614Iteration: 26, Log-Lik: -327824.185, Max-Change: 0.24279Iteration: 27, Log-Lik: -327070.318, Max-Change: 0.19461Iteration: 28, Log-Lik: -326636.906, Max-Change: 0.20878Iteration: 29, Log-Lik: -326204.785, Max-Change: 0.20332Iteration: 30, Log-Lik: -325795.926, Max-Change: 0.19629Iteration: 31, Log-Lik: -325408.681, Max-Change: 0.18220Iteration: 32, Log-Lik: -325055.516, Max-Change: 0.19084Iteration: 33, Log-Lik: -324744.057, Max-Change: 0.15722Iteration: 34, Log-Lik: -324457.872, Max-Change: 0.15411Iteration: 35, Log-Lik: -324154.147, Max-Change: 0.20417Iteration: 36, Log-Lik: -323683.127, Max-Change: 0.14212Iteration: 37, Log-Lik: -323406.037, Max-Change: 0.14495Iteration: 38, Log-Lik: -323145.338, Max-Change: 0.13755Iteration: 39, Log-Lik: -322884.806, Max-Change: 0.13934Iteration: 40, Log-Lik: -322727.542, Max-Change: 0.21057Iteration: 41, Log-Lik: -322458.153, Max-Change: 0.18132Iteration: 42, Log-Lik: -322225.471, Max-Change: 0.10892Iteration: 43, Log-Lik: -322083.051, Max-Change: 0.15224Iteration: 44, Log-Lik: -321913.718, Max-Change: 0.12060Iteration: 45, Log-Lik: -321740.203, Max-Change: 0.11197Iteration: 46, Log-Lik: -321588.981, Max-Change: 0.11280Iteration: 47, Log-Lik: -321443.077, Max-Change: 0.11069Iteration: 48, Log-Lik: -321335.413, Max-Change: 0.10861Iteration: 49, Log-Lik: -321212.465, Max-Change: 0.09540Iteration: 50, Log-Lik: -321093.370, Max-Change: 0.10931Iteration: 51, Log-Lik: -320956.814, Max-Change: 0.11441Iteration: 52, Log-Lik: -320844.653, Max-Change: 0.10974Iteration: 53, Log-Lik: -320733.004, Max-Change: 0.08977Iteration: 54, Log-Lik: -320633.685, Max-Change: 0.08588Iteration: 55, Log-Lik: -320547.757, Max-Change: 0.08688Iteration: 56, Log-Lik: -320450.230, Max-Change: 0.08945Iteration: 57, Log-Lik: -320374.613, Max-Change: 0.09818Iteration: 58, Log-Lik: -320274.796, Max-Change: 0.08382Iteration: 59, Log-Lik: -320204.420, Max-Change: 0.07832Iteration: 60, Log-Lik: -320129.772, Max-Change: 0.08452Iteration: 61, Log-Lik: -320062.270, Max-Change: 0.08276Iteration: 62, Log-Lik: -320002.890, Max-Change: 0.11159Iteration: 63, Log-Lik: -319942.184, Max-Change: 0.10262Iteration: 64, Log-Lik: -319888.136, Max-Change: 0.06923Iteration: 65, Log-Lik: -319841.721, Max-Change: 0.09645Iteration: 66, Log-Lik: -319794.495, Max-Change: 0.10080Iteration: 67, Log-Lik: -319749.267, Max-Change: 0.11765Iteration: 68, Log-Lik: -319712.080, Max-Change: 0.07488Iteration: 69, Log-Lik: -319676.332, Max-Change: 0.05847Iteration: 70, Log-Lik: -319643.627, Max-Change: 0.05771Iteration: 71, Log-Lik: -319612.084, Max-Change: 0.05686Iteration: 72, Log-Lik: -319586.193, Max-Change: 0.05618Iteration: 73, Log-Lik: -319561.275, Max-Change: 0.05776Iteration: 74, Log-Lik: -319530.797, Max-Change: 0.05421Iteration: 75, Log-Lik: -319507.477, Max-Change: 0.05264Iteration: 76, Log-Lik: -319477.409, Max-Change: 0.05064Iteration: 77, Log-Lik: -319453.676, Max-Change: 0.05140Iteration: 78, Log-Lik: -319424.654, Max-Change: 0.04788Iteration: 79, Log-Lik: -319395.877, Max-Change: 0.04489Iteration: 80, Log-Lik: -319374.413, Max-Change: 0.04362Iteration: 81, Log-Lik: -319353.328, Max-Change: 0.04459Iteration: 82, Log-Lik: -319325.152, Max-Change: 0.04053Iteration: 83, Log-Lik: -319298.863, Max-Change: 0.04166Iteration: 84, Log-Lik: -319273.217, Max-Change: 0.03963Iteration: 85, Log-Lik: -319245.884, Max-Change: 0.04338Iteration: 86, Log-Lik: -319215.889, Max-Change: 0.04241Iteration: 87, Log-Lik: -319186.611, Max-Change: 0.04287Iteration: 88, Log-Lik: -319154.639, Max-Change: 0.04542Iteration: 89, Log-Lik: -319128.317, Max-Change: 0.04684Iteration: 90, Log-Lik: -319089.419, Max-Change: 0.05212Iteration: 91, Log-Lik: -319055.646, Max-Change: 0.04800Iteration: 92, Log-Lik: -319029.834, Max-Change: 0.06959Iteration: 93, Log-Lik: -318989.636, Max-Change: 0.05083Iteration: 94, Log-Lik: -318957.653, Max-Change: 0.05561Iteration: 95, Log-Lik: -318918.764, Max-Change: 0.05562Iteration: 96, Log-Lik: -318887.250, Max-Change: 0.05313Iteration: 97, Log-Lik: -318855.882, Max-Change: 0.05519Iteration: 98, Log-Lik: -318828.233, Max-Change: 0.05674Iteration: 99, Log-Lik: -318796.193, Max-Change: 0.05303Iteration: 100, Log-Lik: -318768.175, Max-Change: 0.05073Iteration: 101, Log-Lik: -318744.381, Max-Change: 0.06170Iteration: 102, Log-Lik: -318718.901, Max-Change: 0.05361Iteration: 103, Log-Lik: -318696.606, Max-Change: 0.05345Iteration: 104, Log-Lik: -318672.915, Max-Change: 0.06306Iteration: 105, Log-Lik: -318650.475, Max-Change: 0.04635Iteration: 106, Log-Lik: -318632.057, Max-Change: 0.04045Iteration: 107, Log-Lik: -318616.313, Max-Change: 0.04198Iteration: 108, Log-Lik: -318599.949, Max-Change: 0.03888Iteration: 109, Log-Lik: -318586.785, Max-Change: 0.03956Iteration: 110, Log-Lik: -318574.958, Max-Change: 0.04596Iteration: 111, Log-Lik: -318563.411, Max-Change: 0.04675Iteration: 112, Log-Lik: -318552.039, Max-Change: 0.03708Iteration: 113, Log-Lik: -318542.679, Max-Change: 0.03441Iteration: 114, Log-Lik: -318534.534, Max-Change: 0.03374Iteration: 115, Log-Lik: -318526.868, Max-Change: 0.03332Iteration: 116, Log-Lik: -318520.839, Max-Change: 0.04101Iteration: 117, Log-Lik: -318513.713, Max-Change: 0.03774Iteration: 118, Log-Lik: -318507.453, Max-Change: 0.03255Iteration: 119, Log-Lik: -318501.740, Max-Change: 0.03309Iteration: 120, Log-Lik: -318496.608, Max-Change: 0.04934Iteration: 121, Log-Lik: -318491.516, Max-Change: 0.03656Iteration: 122, Log-Lik: -318486.419, Max-Change: 0.02740Iteration: 123, Log-Lik: -318483.335, Max-Change: 0.04998Iteration: 124, Log-Lik: -318476.683, Max-Change: 0.05553Iteration: 125, Log-Lik: -318471.186, Max-Change: 0.01953Iteration: 126, Log-Lik: -318468.159, Max-Change: 0.02431Iteration: 127, Log-Lik: -318464.030, Max-Change: 0.03373Iteration: 128, Log-Lik: -318461.405, Max-Change: 0.02341Iteration: 129, Log-Lik: -318459.445, Max-Change: 0.02387Iteration: 130, Log-Lik: -318456.356, Max-Change: 0.01782Iteration: 131, Log-Lik: -318454.795, Max-Change: 0.02208Iteration: 132, Log-Lik: -318453.171, Max-Change: 0.03456Iteration: 133, Log-Lik: -318449.607, Max-Change: 0.01821Iteration: 134, Log-Lik: -318447.675, Max-Change: 0.01300Iteration: 135, Log-Lik: -318446.498, Max-Change: 0.05126Iteration: 136, Log-Lik: -318444.897, Max-Change: 0.02181Iteration: 137, Log-Lik: -318443.454, Max-Change: 0.01431Iteration: 138, Log-Lik: -318442.321, Max-Change: 0.04919Iteration: 139, Log-Lik: -318441.071, Max-Change: 0.01828Iteration: 140, Log-Lik: -318439.891, Max-Change: 0.02458Iteration: 141, Log-Lik: -318439.055, Max-Change: 0.08691Iteration: 142, Log-Lik: -318437.519, Max-Change: 0.01281Iteration: 143, Log-Lik: -318436.609, Max-Change: 0.06437Iteration: 144, Log-Lik: -318435.809, Max-Change: 0.01009Iteration: 145, Log-Lik: -318435.673, Max-Change: 0.00892Iteration: 146, Log-Lik: -318435.093, Max-Change: 0.00437Iteration: 147, Log-Lik: -318434.644, Max-Change: 0.12742Iteration: 148, Log-Lik: -318433.666, Max-Change: 0.01036Iteration: 149, Log-Lik: -318432.989, Max-Change: 0.00756Iteration: 150, Log-Lik: -318432.517, Max-Change: 0.00523Iteration: 151, Log-Lik: -318431.033, Max-Change: 0.00865Iteration: 152, Log-Lik: -318430.440, Max-Change: 0.00442Iteration: 153, Log-Lik: -318429.991, Max-Change: 0.01880Iteration: 154, Log-Lik: -318429.438, Max-Change: 0.00357Iteration: 155, Log-Lik: -318429.081, Max-Change: 0.00479Iteration: 156, Log-Lik: -318428.714, Max-Change: 0.00336Iteration: 157, Log-Lik: -318427.924, Max-Change: 0.00647Iteration: 158, Log-Lik: -318427.533, Max-Change: 0.02481Iteration: 159, Log-Lik: -318427.001, Max-Change: 0.00451Iteration: 160, Log-Lik: -318426.903, Max-Change: 0.00411Iteration: 161, Log-Lik: -318426.529, Max-Change: 0.00440Iteration: 162, Log-Lik: -318426.308, Max-Change: 0.00581Iteration: 163, Log-Lik: -318425.833, Max-Change: 0.00426Iteration: 164, Log-Lik: -318425.424, Max-Change: 0.04126Iteration: 165, Log-Lik: -318424.887, Max-Change: 0.00434Iteration: 166, Log-Lik: -318424.831, Max-Change: 0.00471Iteration: 167, Log-Lik: -318424.458, Max-Change: 0.00340Iteration: 168, Log-Lik: -318424.138, Max-Change: 0.00284Iteration: 169, Log-Lik: -318423.896, Max-Change: 0.00566Iteration: 170, Log-Lik: -318423.486, Max-Change: 0.00721Iteration: 171, Log-Lik: -318423.089, Max-Change: 0.00478Iteration: 172, Log-Lik: -318423.007, Max-Change: 0.00405Iteration: 173, Log-Lik: -318422.677, Max-Change: 0.00389Iteration: 174, Log-Lik: -318422.327, Max-Change: 0.00315Iteration: 175, Log-Lik: -318422.121, Max-Change: 0.01124Iteration: 176, Log-Lik: -318421.669, Max-Change: 0.00539Iteration: 177, Log-Lik: -318421.267, Max-Change: 0.00679Iteration: 178, Log-Lik: -318421.028, Max-Change: 0.00548Iteration: 179, Log-Lik: -318420.674, Max-Change: 0.01263Iteration: 180, Log-Lik: -318420.210, Max-Change: 0.00451Iteration: 181, Log-Lik: -318420.050, Max-Change: 0.00438Iteration: 182, Log-Lik: -318419.694, Max-Change: 0.00403Iteration: 183, Log-Lik: -318419.380, Max-Change: 0.00403Iteration: 184, Log-Lik: -318419.004, Max-Change: 0.01427Iteration: 185, Log-Lik: -318418.524, Max-Change: 0.00473Iteration: 186, Log-Lik: -318418.123, Max-Change: 0.00510Iteration: 187, Log-Lik: -318417.010, Max-Change: 0.00910Iteration: 188, Log-Lik: -318416.572, Max-Change: 0.00369Iteration: 189, Log-Lik: -318416.196, Max-Change: 0.00337Iteration: 190, Log-Lik: -318414.659, Max-Change: 0.00868Iteration: 191, Log-Lik: -318414.201, Max-Change: 0.01544Iteration: 192, Log-Lik: -318413.615, Max-Change: 0.00557Iteration: 193, Log-Lik: -318413.457, Max-Change: 0.00488Iteration: 194, Log-Lik: -318413.014, Max-Change: 0.00443Iteration: 195, Log-Lik: -318412.581, Max-Change: 0.01206Iteration: 196, Log-Lik: -318411.879, Max-Change: 0.00460Iteration: 197, Log-Lik: -318411.423, Max-Change: 0.00568Iteration: 198, Log-Lik: -318410.941, Max-Change: 0.00487Iteration: 199, Log-Lik: -318409.317, Max-Change: 0.00946Iteration: 200, Log-Lik: -318408.546, Max-Change: 0.01917Iteration: 201, Log-Lik: -318407.829, Max-Change: 0.00663Iteration: 202, Log-Lik: -318407.625, Max-Change: 0.00557Iteration: 203, Log-Lik: -318407.070, Max-Change: 0.00608Iteration: 204, Log-Lik: -318406.472, Max-Change: 0.00397Iteration: 205, Log-Lik: -318405.405, Max-Change: 0.01471Iteration: 206, Log-Lik: -318404.735, Max-Change: 0.00545Iteration: 207, Log-Lik: -318404.136, Max-Change: 0.01687Iteration: 208, Log-Lik: -318403.194, Max-Change: 0.00637Iteration: 209, Log-Lik: -318402.471, Max-Change: 0.00545Iteration: 210, Log-Lik: -318401.808, Max-Change: 0.02025Iteration: 211, Log-Lik: -318400.706, Max-Change: 0.00726Iteration: 212, Log-Lik: -318399.939, Max-Change: 0.00499Iteration: 213, Log-Lik: -318399.334, Max-Change: 0.01617Iteration: 214, Log-Lik: -318398.060, Max-Change: 0.00670Iteration: 215, Log-Lik: -318397.339, Max-Change: 0.00567Iteration: 216, Log-Lik: -318396.602, Max-Change: 0.01505Iteration: 217, Log-Lik: -318395.457, Max-Change: 0.00766Iteration: 218, Log-Lik: -318394.621, Max-Change: 0.00696Iteration: 219, Log-Lik: -318393.752, Max-Change: 0.00637Iteration: 220, Log-Lik: -318389.106, Max-Change: 0.01360Iteration: 221, Log-Lik: -318387.682, Max-Change: 0.00727Iteration: 222, Log-Lik: -318386.960, Max-Change: 0.01167Iteration: 223, Log-Lik: -318385.622, Max-Change: 0.00986Iteration: 224, Log-Lik: -318384.582, Max-Change: 0.01322Iteration: 225, Log-Lik: -318383.317, Max-Change: 0.01026Iteration: 226, Log-Lik: -318381.243, Max-Change: 0.01064Iteration: 227, Log-Lik: -318379.616, Max-Change: 0.01195Iteration: 228, Log-Lik: -318377.877, Max-Change: 0.01363Iteration: 229, Log-Lik: -318372.828, Max-Change: 0.01072Iteration: 230, Log-Lik: -318370.938, Max-Change: 0.00954Iteration: 231, Log-Lik: -318369.616, Max-Change: 0.01138Iteration: 232, Log-Lik: -318368.106, Max-Change: 0.01540Iteration: 233, Log-Lik: -318362.576, Max-Change: 0.01171Iteration: 234, Log-Lik: -318359.838, Max-Change: 0.01566Iteration: 235, Log-Lik: -318356.172, Max-Change: 0.01419Iteration: 236, Log-Lik: -318354.302, Max-Change: 0.01327Iteration: 237, Log-Lik: -318352.104, Max-Change: 0.01481Iteration: 238, Log-Lik: -318350.663, Max-Change: 0.01209Iteration: 239, Log-Lik: -318347.073, Max-Change: 0.01335Iteration: 240, Log-Lik: -318345.120, Max-Change: 0.01418Iteration: 241, Log-Lik: -318356.786, Max-Change: 0.02175Iteration: 242, Log-Lik: -318341.005, Max-Change: 0.01578Iteration: 243, Log-Lik: -318335.909, Max-Change: 0.01516Iteration: 244, Log-Lik: -318333.205, Max-Change: 0.02028Iteration: 245, Log-Lik: -318331.421, Max-Change: 0.01603Iteration: 246, Log-Lik: -318329.301, Max-Change: 0.01904Iteration: 247, Log-Lik: -318326.267, Max-Change: 0.01917Iteration: 248, Log-Lik: -318323.963, Max-Change: 0.02006Iteration: 249, Log-Lik: -318322.304, Max-Change: 0.01385Iteration: 250, Log-Lik: -318320.066, Max-Change: 0.01987Iteration: 251, Log-Lik: -318318.494, Max-Change: 0.01588Iteration: 252, Log-Lik: -318316.904, Max-Change: 0.01367Iteration: 253, Log-Lik: -318312.438, Max-Change: 0.01572Iteration: 254, Log-Lik: -318310.353, Max-Change: 0.01954Iteration: 255, Log-Lik: -318308.925, Max-Change: 0.01964Iteration: 256, Log-Lik: -318306.299, Max-Change: 0.03017Iteration: 257, Log-Lik: -318301.862, Max-Change: 0.01506Iteration: 258, Log-Lik: -318299.891, Max-Change: 0.01549Iteration: 259, Log-Lik: -318297.830, Max-Change: 0.01434Iteration: 260, Log-Lik: -318296.465, Max-Change: 0.01701Iteration: 261, Log-Lik: -318295.302, Max-Change: 0.01407Iteration: 262, Log-Lik: -318292.597, Max-Change: 0.01296Iteration: 263, Log-Lik: -318291.401, Max-Change: 0.01979Iteration: 264, Log-Lik: -318290.507, Max-Change: 0.04627Iteration: 265, Log-Lik: -318288.387, Max-Change: 0.01338Iteration: 266, Log-Lik: -318287.291, Max-Change: 0.01006Iteration: 267, Log-Lik: -318286.495, Max-Change: 0.03155Iteration: 268, Log-Lik: -318285.389, Max-Change: 0.01098Iteration: 269, Log-Lik: -318284.744, Max-Change: 0.04943Iteration: 270, Log-Lik: -318284.009, Max-Change: 0.00928Iteration: 271, Log-Lik: -318283.837, Max-Change: 0.00872Iteration: 272, Log-Lik: -318283.223, Max-Change: 0.00679Iteration: 273, Log-Lik: -318282.760, Max-Change: 0.00614Iteration: 274, Log-Lik: -318282.464, Max-Change: 0.07494Iteration: 275, Log-Lik: -318281.644, Max-Change: 0.00795Iteration: 276, Log-Lik: -318281.163, Max-Change: 0.04675Iteration: 277, Log-Lik: -318280.558, Max-Change: 0.00688Iteration: 278, Log-Lik: -318280.105, Max-Change: 0.00665Iteration: 279, Log-Lik: -318279.703, Max-Change: 0.02060Iteration: 280, Log-Lik: -318279.116, Max-Change: 0.00640Iteration: 281, Log-Lik: -318278.750, Max-Change: 0.00559Iteration: 282, Log-Lik: -318278.465, Max-Change: 0.00910Iteration: 283, Log-Lik: -318278.024, Max-Change: 0.02653Iteration: 284, Log-Lik: -318277.574, Max-Change: 0.00681Iteration: 285, Log-Lik: -318277.282, Max-Change: 0.00646Iteration: 286, Log-Lik: -318276.347, Max-Change: 0.01180Iteration: 287, Log-Lik: -318276.000, Max-Change: 0.00389Iteration: 288, Log-Lik: -318275.852, Max-Change: 0.01023Iteration: 289, Log-Lik: -318275.546, Max-Change: 0.00579Iteration: 290, Log-Lik: -318275.358, Max-Change: 0.00270Iteration: 291, Log-Lik: -318275.235, Max-Change: 0.02924Iteration: 292, Log-Lik: -318274.893, Max-Change: 0.00416Iteration: 293, Log-Lik: -318274.710, Max-Change: 0.00240Iteration: 294, Log-Lik: -318274.643, Max-Change: 0.00496Iteration: 295, Log-Lik: -318274.470, Max-Change: 0.00191Iteration: 296, Log-Lik: -318274.459, Max-Change: 0.01365Iteration: 297, Log-Lik: -318274.243, Max-Change: 0.00466Iteration: 298, Log-Lik: -318274.176, Max-Change: 0.00255Iteration: 299, Log-Lik: -318274.094, Max-Change: 0.00389Iteration: 300, Log-Lik: -318273.975, Max-Change: 0.00219Iteration: 301, Log-Lik: -318273.950, Max-Change: 0.00170Iteration: 302, Log-Lik: -318273.899, Max-Change: 0.00976Iteration: 303, Log-Lik: -318273.748, Max-Change: 0.00371Iteration: 304, Log-Lik: -318273.702, Max-Change: 0.00404Iteration: 305, Log-Lik: -318273.585, Max-Change: 0.00443Iteration: 306, Log-Lik: -318273.474, Max-Change: 0.00280Iteration: 307, Log-Lik: -318273.442, Max-Change: 0.00197Iteration: 308, Log-Lik: -318273.412, Max-Change: 0.00094Iteration: 309, Log-Lik: -318273.408, Max-Change: 0.02239Iteration: 310, Log-Lik: -318273.210, Max-Change: 0.00381Iteration: 311, Log-Lik: -318273.115, Max-Change: 0.00461Iteration: 312, Log-Lik: -318273.035, Max-Change: 0.00129Iteration: 313, Log-Lik: -318273.031, Max-Change: 0.00170Iteration: 314, Log-Lik: -318273.001, Max-Change: 0.00184Iteration: 315, Log-Lik: -318272.961, Max-Change: 0.00183Iteration: 316, Log-Lik: -318272.953, Max-Change: 0.00180Iteration: 317, Log-Lik: -318272.914, Max-Change: 0.00388Iteration: 318, Log-Lik: -318272.835, Max-Change: 0.00141Iteration: 319, Log-Lik: -318272.827, Max-Change: 0.00143Iteration: 320, Log-Lik: -318272.799, Max-Change: 0.00159Iteration: 321, Log-Lik: -318272.768, Max-Change: 0.00136Iteration: 322, Log-Lik: -318272.761, Max-Change: 0.00162Iteration: 323, Log-Lik: -318272.723, Max-Change: 0.00118Iteration: 324, Log-Lik: -318272.710, Max-Change: 0.00069Iteration: 325, Log-Lik: -318272.700, Max-Change: 0.00020Iteration: 326, Log-Lik: -318272.698, Max-Change: 0.00116Iteration: 327, Log-Lik: -318272.679, Max-Change: 0.00154Iteration: 328, Log-Lik: -318272.634, Max-Change: 0.00144Iteration: 329, Log-Lik: -318272.612, Max-Change: 0.00074Iteration: 330, Log-Lik: -318272.604, Max-Change: 0.00021Iteration: 331, Log-Lik: -318272.603, Max-Change: 0.00017Iteration: 332, Log-Lik: -318272.601, Max-Change: 0.00046Iteration: 333, Log-Lik: -318272.597, Max-Change: 0.00043Iteration: 334, Log-Lik: -318272.595, Max-Change: 0.00019Iteration: 335, Log-Lik: -318272.593, Max-Change: 0.00032Iteration: 336, Log-Lik: -318272.590, Max-Change: 0.00035Iteration: 337, Log-Lik: -318272.588, Max-Change: 0.00025Iteration: 338, Log-Lik: -318272.585, Max-Change: 0.00028Iteration: 339, Log-Lik: -318272.582, Max-Change: 0.00047Iteration: 340, Log-Lik: -318272.582, Max-Change: 0.00031Iteration: 341, Log-Lik: -318272.578, Max-Change: 0.00023Iteration: 342, Log-Lik: -318272.576, Max-Change: 0.00012Iteration: 343, Log-Lik: -318272.575, Max-Change: 0.00045Iteration: 344, Log-Lik: -318272.575, Max-Change: 0.00030Iteration: 345, Log-Lik: -318272.571, Max-Change: 0.00029Iteration: 346, Log-Lik: -318272.569, Max-Change: 0.00022Iteration: 347, Log-Lik: -318272.566, Max-Change: 0.00033Iteration: 348, Log-Lik: -318272.564, Max-Change: 0.00013Iteration: 349, Log-Lik: -318272.563, Max-Change: 0.00053Iteration: 350, Log-Lik: -318272.563, Max-Change: 0.00031Iteration: 351, Log-Lik: -318272.559, Max-Change: 0.00044Iteration: 352, Log-Lik: -318272.559, Max-Change: 0.00040Iteration: 353, Log-Lik: -318272.550, Max-Change: 0.00012Iteration: 354, Log-Lik: -318272.549, Max-Change: 0.00089Iteration: 355, Log-Lik: -318272.544, Max-Change: 0.00071Iteration: 356, Log-Lik: -318272.533, Max-Change: 0.00025Iteration: 357, Log-Lik: -318272.529, Max-Change: 0.00031Iteration: 358, Log-Lik: -318272.528, Max-Change: 0.00014Iteration: 359, Log-Lik: -318272.525, Max-Change: 0.00040Iteration: 360, Log-Lik: -318272.523, Max-Change: 0.00010Iteration: 361, Log-Lik: -318272.522, Max-Change: 0.00043Iteration: 362, Log-Lik: -318272.522, Max-Change: 0.00018Iteration: 363, Log-Lik: -318272.519, Max-Change: 0.00037Iteration: 364, Log-Lik: -318272.518, Max-Change: 0.00023Iteration: 365, Log-Lik: -318272.514, Max-Change: 0.00040Iteration: 366, Log-Lik: -318272.513, Max-Change: 0.00014Iteration: 367, Log-Lik: -318272.512, Max-Change: 0.00012Iteration: 368, Log-Lik: -318272.511, Max-Change: 0.00031Iteration: 369, Log-Lik: -318272.508, Max-Change: 0.00048Iteration: 370, Log-Lik: -318272.506, Max-Change: 0.00015Iteration: 371, Log-Lik: -318272.505, Max-Change: 0.00025Iteration: 372, Log-Lik: -318272.503, Max-Change: 0.00063Iteration: 373, Log-Lik: -318272.502, Max-Change: 0.00024Iteration: 374, Log-Lik: -318272.499, Max-Change: 0.00034Iteration: 375, Log-Lik: -318272.497, Max-Change: 0.00019Iteration: 376, Log-Lik: -318272.497, Max-Change: 0.00015Iteration: 377, Log-Lik: -318272.496, Max-Change: 0.00024Iteration: 378, Log-Lik: -318272.493, Max-Change: 0.00045Iteration: 379, Log-Lik: -318272.492, Max-Change: 0.00028Iteration: 380, Log-Lik: -318272.490, Max-Change: 0.00040Iteration: 381, Log-Lik: -318272.488, Max-Change: 0.00016Iteration: 382, Log-Lik: -318272.488, Max-Change: 0.00013Iteration: 383, Log-Lik: -318272.487, Max-Change: 0.00022Iteration: 384, Log-Lik: -318272.484, Max-Change: 0.00054Iteration: 385, Log-Lik: -318272.484, Max-Change: 0.00026Iteration: 386, Log-Lik: -318272.481, Max-Change: 0.00035Iteration: 387, Log-Lik: -318272.479, Max-Change: 0.00020Iteration: 388, Log-Lik: -318272.479, Max-Change: 0.00016Iteration: 389, Log-Lik: -318272.478, Max-Change: 0.00025Iteration: 390, Log-Lik: -318272.475, Max-Change: 0.00047Iteration: 391, Log-Lik: -318272.475, Max-Change: 0.00028Iteration: 392, Log-Lik: -318272.472, Max-Change: 0.00040Iteration: 393, Log-Lik: -318272.471, Max-Change: 0.00017Iteration: 394, Log-Lik: -318272.470, Max-Change: 0.00013Iteration: 395, Log-Lik: -318272.469, Max-Change: 0.00021Iteration: 396, Log-Lik: -318272.467, Max-Change: 0.00055Iteration: 397, Log-Lik: -318272.466, Max-Change: 0.00025Iteration: 398, Log-Lik: -318272.463, Max-Change: 0.00034Iteration: 399, Log-Lik: -318272.462, Max-Change: 0.00019Iteration: 400, Log-Lik: -318272.461, Max-Change: 0.00015Iteration: 401, Log-Lik: -318272.460, Max-Change: 0.00024Iteration: 402, Log-Lik: -318272.458, Max-Change: 0.00045Iteration: 403, Log-Lik: -318272.458, Max-Change: 0.00026Iteration: 404, Log-Lik: -318272.455, Max-Change: 0.00037Iteration: 405, Log-Lik: -318272.454, Max-Change: 0.00015Iteration: 406, Log-Lik: -318272.453, Max-Change: 0.00012Iteration: 407, Log-Lik: -318272.452, Max-Change: 0.00020Iteration: 408, Log-Lik: -318272.450, Max-Change: 0.00050Iteration: 409, Log-Lik: -318272.449, Max-Change: 0.00021Iteration: 410, Log-Lik: -318272.447, Max-Change: 0.00032Iteration: 411, Log-Lik: -318272.445, Max-Change: 0.00017Iteration: 412, Log-Lik: -318272.445, Max-Change: 0.00013Iteration: 413, Log-Lik: -318272.443, Max-Change: 0.00022Iteration: 414, Log-Lik: -318272.441, Max-Change: 0.00045Iteration: 415, Log-Lik: -318272.441, Max-Change: 0.00022Iteration: 416, Log-Lik: -318272.438, Max-Change: 0.00032Iteration: 417, Log-Lik: -318272.437, Max-Change: 0.00015Iteration: 418, Log-Lik: -318272.436, Max-Change: 0.00012Iteration: 419, Log-Lik: -318272.435, Max-Change: 0.00021Iteration: 420, Log-Lik: -318272.433, Max-Change: 0.00045Iteration: 421, Log-Lik: -318272.433, Max-Change: 0.00020Iteration: 422, Log-Lik: -318272.430, Max-Change: 0.00034Iteration: 423, Log-Lik: -318272.429, Max-Change: 0.00015Iteration: 424, Log-Lik: -318272.428, Max-Change: 0.00012Iteration: 425, Log-Lik: -318272.427, Max-Change: 0.00019Iteration: 426, Log-Lik: -318272.425, Max-Change: 0.00048Iteration: 427, Log-Lik: -318272.425, Max-Change: 0.00020Iteration: 428, Log-Lik: -318272.422, Max-Change: 0.00033Iteration: 429, Log-Lik: -318272.421, Max-Change: 0.00016Iteration: 430, Log-Lik: -318272.420, Max-Change: 0.00013Iteration: 431, Log-Lik: -318272.419, Max-Change: 0.00022Iteration: 432, Log-Lik: -318272.417, Max-Change: 0.00047Iteration: 433, Log-Lik: -318272.417, Max-Change: 0.00020Iteration: 434, Log-Lik: -318272.415, Max-Change: 0.00035Iteration: 435, Log-Lik: -318272.413, Max-Change: 0.00016Iteration: 436, Log-Lik: -318272.413, Max-Change: 0.00012Iteration: 437, Log-Lik: -318272.411, Max-Change: 0.00020Iteration: 438, Log-Lik: -318272.410, Max-Change: 0.00051Iteration: 439, Log-Lik: -318272.409, Max-Change: 0.00020Iteration: 440, Log-Lik: -318272.407, Max-Change: 0.00034Iteration: 441, Log-Lik: -318272.405, Max-Change: 0.00016Iteration: 442, Log-Lik: -318272.405, Max-Change: 0.00013Iteration: 443, Log-Lik: -318272.404, Max-Change: 0.00023Iteration: 444, Log-Lik: -318272.402, Max-Change: 0.00049Iteration: 445, Log-Lik: -318272.401, Max-Change: 0.00021Iteration: 446, Log-Lik: -318272.399, Max-Change: 0.00036Iteration: 447, Log-Lik: -318272.398, Max-Change: 0.00016Iteration: 448, Log-Lik: -318272.397, Max-Change: 0.00013Iteration: 449, Log-Lik: -318272.396, Max-Change: 0.00021Iteration: 450, Log-Lik: -318272.394, Max-Change: 0.00052Iteration: 451, Log-Lik: -318272.394, Max-Change: 0.00021Iteration: 452, Log-Lik: -318272.392, Max-Change: 0.00034Iteration: 453, Log-Lik: -318272.390, Max-Change: 0.00017Iteration: 454, Log-Lik: -318272.390, Max-Change: 0.00013Iteration: 455, Log-Lik: -318272.389, Max-Change: 0.00023Iteration: 456, Log-Lik: -318272.387, Max-Change: 0.00050Iteration: 457, Log-Lik: -318272.386, Max-Change: 0.00021Iteration: 458, Log-Lik: -318272.384, Max-Change: 0.00036Iteration: 459, Log-Lik: -318272.383, Max-Change: 0.00016Iteration: 460, Log-Lik: -318272.382, Max-Change: 0.00013Iteration: 461, Log-Lik: -318272.381, Max-Change: 0.00021Iteration: 462, Log-Lik: -318272.379, Max-Change: 0.00052Iteration: 463, Log-Lik: -318272.379, Max-Change: 0.00021Iteration: 464, Log-Lik: -318272.377, Max-Change: 0.00034Iteration: 465, Log-Lik: -318272.375, Max-Change: 0.00017Iteration: 466, Log-Lik: -318272.375, Max-Change: 0.00013Iteration: 467, Log-Lik: -318272.374, Max-Change: 0.00023Iteration: 468, Log-Lik: -318272.372, Max-Change: 0.00050Iteration: 469, Log-Lik: -318272.372, Max-Change: 0.00021Iteration: 470, Log-Lik: -318272.369, Max-Change: 0.00036Iteration: 471, Log-Lik: -318272.368, Max-Change: 0.00016Iteration: 472, Log-Lik: -318272.368, Max-Change: 0.00013Iteration: 473, Log-Lik: -318272.367, Max-Change: 0.00021Iteration: 474, Log-Lik: -318272.365, Max-Change: 0.00052Iteration: 475, Log-Lik: -318272.364, Max-Change: 0.00021Iteration: 476, Log-Lik: -318272.362, Max-Change: 0.00034Iteration: 477, Log-Lik: -318272.361, Max-Change: 0.00017Iteration: 478, Log-Lik: -318272.360, Max-Change: 0.00013Iteration: 479, Log-Lik: -318272.359, Max-Change: 0.00023Iteration: 480, Log-Lik: -318272.358, Max-Change: 0.00050Iteration: 481, Log-Lik: -318272.357, Max-Change: 0.00021Iteration: 482, Log-Lik: -318272.355, Max-Change: 0.00036Iteration: 483, Log-Lik: -318272.354, Max-Change: 0.00016Iteration: 484, Log-Lik: -318272.353, Max-Change: 0.00013Iteration: 485, Log-Lik: -318272.352, Max-Change: 0.00021Iteration: 486, Log-Lik: -318272.351, Max-Change: 0.00052Iteration: 487, Log-Lik: -318272.350, Max-Change: 0.00021Iteration: 488, Log-Lik: -318272.348, Max-Change: 0.00034Iteration: 489, Log-Lik: -318272.347, Max-Change: 0.00017Iteration: 490, Log-Lik: -318272.346, Max-Change: 0.00013Iteration: 491, Log-Lik: -318272.345, Max-Change: 0.00023Iteration: 492, Log-Lik: -318272.343, Max-Change: 0.00050Iteration: 493, Log-Lik: -318272.343, Max-Change: 0.00021Iteration: 494, Log-Lik: -318272.341, Max-Change: 0.00036Iteration: 495, Log-Lik: -318272.340, Max-Change: 0.00016Iteration: 496, Log-Lik: -318272.339, Max-Change: 0.00013Iteration: 497, Log-Lik: -318272.338, Max-Change: 0.00021Iteration: 498, Log-Lik: -318272.337, Max-Change: 0.00052Iteration: 499, Log-Lik: -318272.336, Max-Change: 0.00021Iteration: 500, Log-Lik: -318272.334, Max-Change: 0.00034Iteration: 501, Log-Lik: -318272.333, Max-Change: 0.00016Iteration: 502, Log-Lik: -318272.332, Max-Change: 0.00013Iteration: 503, Log-Lik: -318272.331, Max-Change: 0.00023Iteration: 504, Log-Lik: -318272.330, Max-Change: 0.00050Iteration: 505, Log-Lik: -318272.329, Max-Change: 0.00021Iteration: 506, Log-Lik: -318272.327, Max-Change: 0.00036Iteration: 507, Log-Lik: -318272.326, Max-Change: 0.00016Iteration: 508, Log-Lik: -318272.325, Max-Change: 0.00013Iteration: 509, Log-Lik: -318272.324, Max-Change: 0.00021Iteration: 510, Log-Lik: -318272.323, Max-Change: 0.00052Iteration: 511, Log-Lik: -318272.322, Max-Change: 0.00020Iteration: 512, Log-Lik: -318272.320, Max-Change: 0.00034Iteration: 513, Log-Lik: -318272.319, Max-Change: 0.00016Iteration: 514, Log-Lik: -318272.319, Max-Change: 0.00013Iteration: 515, Log-Lik: -318272.318, Max-Change: 0.00023Iteration: 516, Log-Lik: -318272.316, Max-Change: 0.00050Iteration: 517, Log-Lik: -318272.316, Max-Change: 0.00021Iteration: 518, Log-Lik: -318272.314, Max-Change: 0.00036Iteration: 519, Log-Lik: -318272.312, Max-Change: 0.00016Iteration: 520, Log-Lik: -318272.312, Max-Change: 0.00013Iteration: 521, Log-Lik: -318272.311, Max-Change: 0.00021Iteration: 522, Log-Lik: -318272.309, Max-Change: 0.00051Iteration: 523, Log-Lik: -318272.309, Max-Change: 0.00020Iteration: 524, Log-Lik: -318272.307, Max-Change: 0.00034Iteration: 525, Log-Lik: -318272.306, Max-Change: 0.00016Iteration: 526, Log-Lik: -318272.305, Max-Change: 0.00013Iteration: 527, Log-Lik: -318272.304, Max-Change: 0.00023Iteration: 528, Log-Lik: -318272.303, Max-Change: 0.00049Iteration: 529, Log-Lik: -318272.302, Max-Change: 0.00021Iteration: 530, Log-Lik: -318272.300, Max-Change: 0.00035Iteration: 531, Log-Lik: -318272.299, Max-Change: 0.00016Iteration: 532, Log-Lik: -318272.299, Max-Change: 0.00013Iteration: 533, Log-Lik: -318272.298, Max-Change: 0.00021Iteration: 534, Log-Lik: -318272.296, Max-Change: 0.00051Iteration: 535, Log-Lik: -318272.296, Max-Change: 0.00020Iteration: 536, Log-Lik: -318272.294, Max-Change: 0.00033Iteration: 537, Log-Lik: -318272.293, Max-Change: 0.00016Iteration: 538, Log-Lik: -318272.292, Max-Change: 0.00013Iteration: 539, Log-Lik: -318272.291, Max-Change: 0.00022Iteration: 540, Log-Lik: -318272.290, Max-Change: 0.00049Iteration: 541, Log-Lik: -318272.289, Max-Change: 0.00020Iteration: 542, Log-Lik: -318272.287, Max-Change: 0.00035Iteration: 543, Log-Lik: -318272.286, Max-Change: 0.00016Iteration: 544, Log-Lik: -318272.286, Max-Change: 0.00013Iteration: 545, Log-Lik: -318272.285, Max-Change: 0.00021Iteration: 546, Log-Lik: -318272.283, Max-Change: 0.00050Iteration: 547, Log-Lik: -318272.283, Max-Change: 0.00020Iteration: 548, Log-Lik: -318272.281, Max-Change: 0.00033Iteration: 549, Log-Lik: -318272.280, Max-Change: 0.00016Iteration: 550, Log-Lik: -318272.279, Max-Change: 0.00013Iteration: 551, Log-Lik: -318272.278, Max-Change: 0.00022Iteration: 552, Log-Lik: -318272.277, Max-Change: 0.00048Iteration: 553, Log-Lik: -318272.276, Max-Change: 0.00020Iteration: 554, Log-Lik: -318272.274, Max-Change: 0.00035Iteration: 555, Log-Lik: -318272.273, Max-Change: 0.00015Iteration: 556, Log-Lik: -318272.273, Max-Change: 0.00012Iteration: 557, Log-Lik: -318272.272, Max-Change: 0.00020Iteration: 558, Log-Lik: -318272.270, Max-Change: 0.00050Iteration: 559, Log-Lik: -318272.270, Max-Change: 0.00020Iteration: 560, Log-Lik: -318272.268, Max-Change: 0.00033Iteration: 561, Log-Lik: -318272.267, Max-Change: 0.00016Iteration: 562, Log-Lik: -318272.266, Max-Change: 0.00013Iteration: 563, Log-Lik: -318272.266, Max-Change: 0.00022Iteration: 564, Log-Lik: -318272.264, Max-Change: 0.00048Iteration: 565, Log-Lik: -318272.263, Max-Change: 0.00020Iteration: 566, Log-Lik: -318272.262, Max-Change: 0.00034Iteration: 567, Log-Lik: -318272.261, Max-Change: 0.00015Iteration: 568, Log-Lik: -318272.260, Max-Change: 0.00012Iteration: 569, Log-Lik: -318272.259, Max-Change: 0.00020Iteration: 570, Log-Lik: -318272.258, Max-Change: 0.00050Iteration: 571, Log-Lik: -318272.257, Max-Change: 0.00020Iteration: 572, Log-Lik: -318272.255, Max-Change: 0.00033Iteration: 573, Log-Lik: -318272.254, Max-Change: 0.00016Iteration: 574, Log-Lik: -318272.254, Max-Change: 0.00013Iteration: 575, Log-Lik: -318272.253, Max-Change: 0.00022Iteration: 576, Log-Lik: -318272.252, Max-Change: 0.00048Iteration: 577, Log-Lik: -318272.251, Max-Change: 0.00020Iteration: 578, Log-Lik: -318272.249, Max-Change: 0.00034Iteration: 579, Log-Lik: -318272.248, Max-Change: 0.00015Iteration: 580, Log-Lik: -318272.248, Max-Change: 0.00012Iteration: 581, Log-Lik: -318272.247, Max-Change: 0.00020Iteration: 582, Log-Lik: -318272.245, Max-Change: 0.00049Iteration: 583, Log-Lik: -318272.245, Max-Change: 0.00020Iteration: 584, Log-Lik: -318272.243, Max-Change: 0.00032Iteration: 585, Log-Lik: -318272.242, Max-Change: 0.00016Iteration: 586, Log-Lik: -318272.242, Max-Change: 0.00013Iteration: 587, Log-Lik: -318272.241, Max-Change: 0.00022Iteration: 588, Log-Lik: -318272.239, Max-Change: 0.00047Iteration: 589, Log-Lik: -318272.239, Max-Change: 0.00020Iteration: 590, Log-Lik: -318272.237, Max-Change: 0.00034Iteration: 591, Log-Lik: -318272.236, Max-Change: 0.00015Iteration: 592, Log-Lik: -318272.236, Max-Change: 0.00012Iteration: 593, Log-Lik: -318272.235, Max-Change: 0.00020Iteration: 594, Log-Lik: -318272.233, Max-Change: 0.00049Iteration: 595, Log-Lik: -318272.233, Max-Change: 0.00019Iteration: 596, Log-Lik: -318272.231, Max-Change: 0.00032Iteration: 597, Log-Lik: -318272.230, Max-Change: 0.00015Iteration: 598, Log-Lik: -318272.230, Max-Change: 0.00012Iteration: 599, Log-Lik: -318272.229, Max-Change: 0.00021Iteration: 600, Log-Lik: -318272.227, Max-Change: 0.00047Iteration: 601, Log-Lik: -318272.227, Max-Change: 0.00020Iteration: 602, Log-Lik: -318272.225, Max-Change: 0.00034Iteration: 603, Log-Lik: -318272.224, Max-Change: 0.00015Iteration: 604, Log-Lik: -318272.224, Max-Change: 0.00012Iteration: 605, Log-Lik: -318272.223, Max-Change: 0.00020Iteration: 606, Log-Lik: -318272.221, Max-Change: 0.00048Iteration: 607, Log-Lik: -318272.221, Max-Change: 0.00019Iteration: 608, Log-Lik: -318272.219, Max-Change: 0.00032Iteration: 609, Log-Lik: -318272.218, Max-Change: 0.00015Iteration: 610, Log-Lik: -318272.218, Max-Change: 0.00012Iteration: 611, Log-Lik: -318272.217, Max-Change: 0.00021Iteration: 612, Log-Lik: -318272.215, Max-Change: 0.00047Iteration: 613, Log-Lik: -318272.215, Max-Change: 0.00019Iteration: 614, Log-Lik: -318272.213, Max-Change: 0.00033Iteration: 615, Log-Lik: -318272.212, Max-Change: 0.00015Iteration: 616, Log-Lik: -318272.212, Max-Change: 0.00012Iteration: 617, Log-Lik: -318272.211, Max-Change: 0.00020Iteration: 618, Log-Lik: -318272.209, Max-Change: 0.00048Iteration: 619, Log-Lik: -318272.209, Max-Change: 0.00019Iteration: 620, Log-Lik: -318272.207, Max-Change: 0.00032Iteration: 621, Log-Lik: -318272.206, Max-Change: 0.00015Iteration: 622, Log-Lik: -318272.206, Max-Change: 0.00012Iteration: 623, Log-Lik: -318272.205, Max-Change: 0.00021Iteration: 624, Log-Lik: -318272.204, Max-Change: 0.00046Iteration: 625, Log-Lik: -318272.203, Max-Change: 0.00019Iteration: 626, Log-Lik: -318272.201, Max-Change: 0.00033Iteration: 627, Log-Lik: -318272.200, Max-Change: 0.00015Iteration: 628, Log-Lik: -318272.200, Max-Change: 0.00012Iteration: 629, Log-Lik: -318272.199, Max-Change: 0.00020Iteration: 630, Log-Lik: -318272.198, Max-Change: 0.00048Iteration: 631, Log-Lik: -318272.197, Max-Change: 0.00019Iteration: 632, Log-Lik: -318272.196, Max-Change: 0.00031Iteration: 633, Log-Lik: -318272.195, Max-Change: 0.00015Iteration: 634, Log-Lik: -318272.194, Max-Change: 0.00012Iteration: 635, Log-Lik: -318272.193, Max-Change: 0.00021Iteration: 636, Log-Lik: -318272.192, Max-Change: 0.00046Iteration: 637, Log-Lik: -318272.192, Max-Change: 0.00019Iteration: 638, Log-Lik: -318272.190, Max-Change: 0.00033Iteration: 639, Log-Lik: -318272.189, Max-Change: 0.00015Iteration: 640, Log-Lik: -318272.189, Max-Change: 0.00012Iteration: 641, Log-Lik: -318272.188, Max-Change: 0.00019Iteration: 642, Log-Lik: -318272.186, Max-Change: 0.00047Iteration: 643, Log-Lik: -318272.186, Max-Change: 0.00019Iteration: 644, Log-Lik: -318272.184, Max-Change: 0.00031Iteration: 645, Log-Lik: -318272.183, Max-Change: 0.00015Iteration: 646, Log-Lik: -318272.183, Max-Change: 0.00012Iteration: 647, Log-Lik: -318272.182, Max-Change: 0.00021Iteration: 648, Log-Lik: -318272.181, Max-Change: 0.00046Iteration: 649, Log-Lik: -318272.180, Max-Change: 0.00019Iteration: 650, Log-Lik: -318272.179, Max-Change: 0.00033Iteration: 651, Log-Lik: -318272.178, Max-Change: 0.00015Iteration: 652, Log-Lik: -318272.177, Max-Change: 0.00012Iteration: 653, Log-Lik: -318272.176, Max-Change: 0.00019Iteration: 654, Log-Lik: -318272.175, Max-Change: 0.00047Iteration: 655, Log-Lik: -318272.175, Max-Change: 0.00019Iteration: 656, Log-Lik: -318272.173, Max-Change: 0.00031Iteration: 657, Log-Lik: -318272.172, Max-Change: 0.00015Iteration: 658, Log-Lik: -318272.172, Max-Change: 0.00012Iteration: 659, Log-Lik: -318272.171, Max-Change: 0.00021Iteration: 660, Log-Lik: -318272.169, Max-Change: 0.00045Iteration: 661, Log-Lik: -318272.169, Max-Change: 0.00019Iteration: 662, Log-Lik: -318272.167, Max-Change: 0.00032Iteration: 663, Log-Lik: -318272.166, Max-Change: 0.00014Iteration: 664, Log-Lik: -318272.166, Max-Change: 0.00012Iteration: 665, Log-Lik: -318272.165, Max-Change: 0.00019Iteration: 666, Log-Lik: -318272.164, Max-Change: 0.00047Iteration: 667, Log-Lik: -318272.163, Max-Change: 0.00019Iteration: 668, Log-Lik: -318272.162, Max-Change: 0.00031Iteration: 669, Log-Lik: -318272.161, Max-Change: 0.00015Iteration: 670, Log-Lik: -318272.161, Max-Change: 0.00012Iteration: 671, Log-Lik: -318272.160, Max-Change: 0.00021Iteration: 672, Log-Lik: -318272.158, Max-Change: 0.00045Iteration: 673, Log-Lik: -318272.158, Max-Change: 0.00019Iteration: 674, Log-Lik: -318272.156, Max-Change: 0.00032Iteration: 675, Log-Lik: -318272.155, Max-Change: 0.00014Iteration: 676, Log-Lik: -318272.155, Max-Change: 0.00012Iteration: 677, Log-Lik: -318272.154, Max-Change: 0.00019Iteration: 678, Log-Lik: -318272.153, Max-Change: 0.00046Iteration: 679, Log-Lik: -318272.152, Max-Change: 0.00018Iteration: 680, Log-Lik: -318272.151, Max-Change: 0.00031Iteration: 681, Log-Lik: -318272.150, Max-Change: 0.00015Iteration: 682, Log-Lik: -318272.150, Max-Change: 0.00012Iteration: 683, Log-Lik: -318272.149, Max-Change: 0.00020Iteration: 684, Log-Lik: -318272.147, Max-Change: 0.00045Iteration: 685, Log-Lik: -318272.147, Max-Change: 0.00019Iteration: 686, Log-Lik: -318272.146, Max-Change: 0.00032Iteration: 687, Log-Lik: -318272.145, Max-Change: 0.00014Iteration: 688, Log-Lik: -318272.144, Max-Change: 0.00011Iteration: 689, Log-Lik: -318272.143, Max-Change: 0.00019Iteration: 690, Log-Lik: -318272.142, Max-Change: 0.00046Iteration: 691, Log-Lik: -318272.142, Max-Change: 0.00018Iteration: 692, Log-Lik: -318272.140, Max-Change: 0.00030Iteration: 693, Log-Lik: -318272.139, Max-Change: 0.00015Iteration: 694, Log-Lik: -318272.139, Max-Change: 0.00012Iteration: 695, Log-Lik: -318272.138, Max-Change: 0.00020Iteration: 696, Log-Lik: -318272.137, Max-Change: 0.00044Iteration: 697, Log-Lik: -318272.136, Max-Change: 0.00018Iteration: 698, Log-Lik: -318272.135, Max-Change: 0.00032Iteration: 699, Log-Lik: -318272.134, Max-Change: 0.00014Iteration: 700, Log-Lik: -318272.134, Max-Change: 0.00011Iteration: 701, Log-Lik: -318272.133, Max-Change: 0.00019Iteration: 702, Log-Lik: -318272.131, Max-Change: 0.00046Iteration: 703, Log-Lik: -318272.131, Max-Change: 0.00018Iteration: 704, Log-Lik: -318272.130, Max-Change: 0.00030Iteration: 705, Log-Lik: -318272.129, Max-Change: 0.00014Iteration: 706, Log-Lik: -318272.128, Max-Change: 0.00012Iteration: 707, Log-Lik: -318272.127, Max-Change: 0.00020Iteration: 708, Log-Lik: -318272.126, Max-Change: 0.00044Iteration: 709, Log-Lik: -318272.126, Max-Change: 0.00018Iteration: 710, Log-Lik: -318272.124, Max-Change: 0.00031Iteration: 711, Log-Lik: -318272.123, Max-Change: 0.00014Iteration: 712, Log-Lik: -318272.123, Max-Change: 0.00011Iteration: 713, Log-Lik: -318272.122, Max-Change: 0.00019Iteration: 714, Log-Lik: -318272.121, Max-Change: 0.00045Iteration: 715, Log-Lik: -318272.121, Max-Change: 0.00018Iteration: 716, Log-Lik: -318272.119, Max-Change: 0.00030Iteration: 717, Log-Lik: -318272.118, Max-Change: 0.00014Iteration: 718, Log-Lik: -318272.118, Max-Change: 0.00012Iteration: 719, Log-Lik: -318272.117, Max-Change: 0.00020Iteration: 720, Log-Lik: -318272.116, Max-Change: 0.00044Iteration: 721, Log-Lik: -318272.115, Max-Change: 0.00018Iteration: 722, Log-Lik: -318272.114, Max-Change: 0.00031Iteration: 723, Log-Lik: -318272.113, Max-Change: 0.00014Iteration: 724, Log-Lik: -318272.113, Max-Change: 0.00011Iteration: 725, Log-Lik: -318272.112, Max-Change: 0.00018Iteration: 726, Log-Lik: -318272.111, Max-Change: 0.00045Iteration: 727, Log-Lik: -318272.110, Max-Change: 0.00018Iteration: 728, Log-Lik: -318272.109, Max-Change: 0.00030Iteration: 729, Log-Lik: -318272.108, Max-Change: 0.00014Iteration: 730, Log-Lik: -318272.107, Max-Change: 0.00011Iteration: 731, Log-Lik: -318272.107, Max-Change: 0.00020Iteration: 732, Log-Lik: -318272.105, Max-Change: 0.00043Iteration: 733, Log-Lik: -318272.105, Max-Change: 0.00018Iteration: 734, Log-Lik: -318272.104, Max-Change: 0.00031Iteration: 735, Log-Lik: -318272.103, Max-Change: 0.00014Iteration: 736, Log-Lik: -318272.102, Max-Change: 0.00011Iteration: 737, Log-Lik: -318272.102, Max-Change: 0.00018Iteration: 738, Log-Lik: -318272.100, Max-Change: 0.00045Iteration: 739, Log-Lik: -318272.100, Max-Change: 0.00018Iteration: 740, Log-Lik: -318272.098, Max-Change: 0.00030Iteration: 741, Log-Lik: -318272.098, Max-Change: 0.00014Iteration: 742, Log-Lik: -318272.097, Max-Change: 0.00011Iteration: 743, Log-Lik: -318272.096, Max-Change: 0.00020Iteration: 744, Log-Lik: -318272.095, Max-Change: 0.00043Iteration: 745, Log-Lik: -318272.095, Max-Change: 0.00018Iteration: 746, Log-Lik: -318272.093, Max-Change: 0.00031Iteration: 747, Log-Lik: -318272.093, Max-Change: 0.00014Iteration: 748, Log-Lik: -318272.092, Max-Change: 0.00011Iteration: 749, Log-Lik: -318272.091, Max-Change: 0.00018Iteration: 750, Log-Lik: -318272.090, Max-Change: 0.00044Iteration: 751, Log-Lik: -318272.090, Max-Change: 0.00018Iteration: 752, Log-Lik: -318272.088, Max-Change: 0.00029Iteration: 753, Log-Lik: -318272.088, Max-Change: 0.00014Iteration: 754, Log-Lik: -318272.087, Max-Change: 0.00011Iteration: 755, Log-Lik: -318272.086, Max-Change: 0.00020Iteration: 756, Log-Lik: -318272.085, Max-Change: 0.00043Iteration: 757, Log-Lik: -318272.085, Max-Change: 0.00018Iteration: 758, Log-Lik: -318272.083, Max-Change: 0.00031Iteration: 759, Log-Lik: -318272.083, Max-Change: 0.00014Iteration: 760, Log-Lik: -318272.082, Max-Change: 0.00011Iteration: 761, Log-Lik: -318272.081, Max-Change: 0.00018Iteration: 762, Log-Lik: -318272.080, Max-Change: 0.00044Iteration: 763, Log-Lik: -318272.080, Max-Change: 0.00018Iteration: 764, Log-Lik: -318272.078, Max-Change: 0.00029Iteration: 765, Log-Lik: -318272.078, Max-Change: 0.00014Iteration: 766, Log-Lik: -318272.077, Max-Change: 0.00011Iteration: 767, Log-Lik: -318272.077, Max-Change: 0.00019Iteration: 768, Log-Lik: -318272.075, Max-Change: 0.00043Iteration: 769, Log-Lik: -318272.075, Max-Change: 0.00018Iteration: 770, Log-Lik: -318272.074, Max-Change: 0.00030Iteration: 771, Log-Lik: -318272.073, Max-Change: 0.00014Iteration: 772, Log-Lik: -318272.072, Max-Change: 0.00011Iteration: 773, Log-Lik: -318272.072, Max-Change: 0.00018Iteration: 774, Log-Lik: -318272.070, Max-Change: 0.00044Iteration: 775, Log-Lik: -318272.070, Max-Change: 0.00017Iteration: 776, Log-Lik: -318272.069, Max-Change: 0.00029Iteration: 777, Log-Lik: -318272.068, Max-Change: 0.00014Iteration: 778, Log-Lik: -318272.067, Max-Change: 0.00011Iteration: 779, Log-Lik: -318272.067, Max-Change: 0.00019Iteration: 780, Log-Lik: -318272.066, Max-Change: 0.00042Iteration: 781, Log-Lik: -318272.065, Max-Change: 0.00018Iteration: 782, Log-Lik: -318272.064, Max-Change: 0.00030Iteration: 783, Log-Lik: -318272.063, Max-Change: 0.00014Iteration: 784, Log-Lik: -318272.063, Max-Change: 0.00011Iteration: 785, Log-Lik: -318272.062, Max-Change: 0.00018Iteration: 786, Log-Lik: -318272.061, Max-Change: 0.00044Iteration: 787, Log-Lik: -318272.060, Max-Change: 0.00017Iteration: 788, Log-Lik: -318272.059, Max-Change: 0.00029Iteration: 789, Log-Lik: -318272.058, Max-Change: 0.00014Iteration: 790, Log-Lik: -318272.058, Max-Change: 0.00011Iteration: 791, Log-Lik: -318272.057, Max-Change: 0.00019Iteration: 792, Log-Lik: -318272.056, Max-Change: 0.00042Iteration: 793, Log-Lik: -318272.056, Max-Change: 0.00018Iteration: 794, Log-Lik: -318272.054, Max-Change: 0.00030Iteration: 795, Log-Lik: -318272.053, Max-Change: 0.00013Iteration: 796, Log-Lik: -318272.053, Max-Change: 0.00011Iteration: 797, Log-Lik: -318272.052, Max-Change: 0.00018Iteration: 798, Log-Lik: -318272.051, Max-Change: 0.00043Iteration: 799, Log-Lik: -318272.051, Max-Change: 0.00017Iteration: 800, Log-Lik: -318272.049, Max-Change: 0.00029Iteration: 801, Log-Lik: -318272.049, Max-Change: 0.00014Iteration: 802, Log-Lik: -318272.048, Max-Change: 0.00011Iteration: 803, Log-Lik: -318272.048, Max-Change: 0.00019Iteration: 804, Log-Lik: -318272.046, Max-Change: 0.00042Iteration: 805, Log-Lik: -318272.046, Max-Change: 0.00017Iteration: 806, Log-Lik: -318272.045, Max-Change: 0.00030Iteration: 807, Log-Lik: -318272.044, Max-Change: 0.00013Iteration: 808, Log-Lik: -318272.044, Max-Change: 0.00011Iteration: 809, Log-Lik: -318272.043, Max-Change: 0.00018Iteration: 810, Log-Lik: -318272.042, Max-Change: 0.00043Iteration: 811, Log-Lik: -318272.041, Max-Change: 0.00017Iteration: 812, Log-Lik: -318272.040, Max-Change: 0.00028Iteration: 813, Log-Lik: -318272.039, Max-Change: 0.00014Iteration: 814, Log-Lik: -318272.039, Max-Change: 0.00011Iteration: 815, Log-Lik: -318272.038, Max-Change: 0.00019Iteration: 816, Log-Lik: -318272.037, Max-Change: 0.00042Iteration: 817, Log-Lik: -318272.037, Max-Change: 0.00017Iteration: 818, Log-Lik: -318272.035, Max-Change: 0.00030Iteration: 819, Log-Lik: -318272.035, Max-Change: 0.00013Iteration: 820, Log-Lik: -318272.034, Max-Change: 0.00011Iteration: 821, Log-Lik: -318272.033, Max-Change: 0.00018Iteration: 822, Log-Lik: -318272.032, Max-Change: 0.00043Iteration: 823, Log-Lik: -318272.032, Max-Change: 0.00017Iteration: 824, Log-Lik: -318272.031, Max-Change: 0.00028Iteration: 825, Log-Lik: -318272.030, Max-Change: 0.00014Iteration: 826, Log-Lik: -318272.030, Max-Change: 0.00011Iteration: 827, Log-Lik: -318272.029, Max-Change: 0.00019Iteration: 828, Log-Lik: -318272.028, Max-Change: 0.00041Iteration: 829, Log-Lik: -318272.027, Max-Change: 0.00017Iteration: 830, Log-Lik: -318272.026, Max-Change: 0.00029Iteration: 831, Log-Lik: -318272.025, Max-Change: 0.00013Iteration: 832, Log-Lik: -318272.025, Max-Change: 0.00011Iteration: 833, Log-Lik: -318272.024, Max-Change: 0.00017Iteration: 834, Log-Lik: -318272.023, Max-Change: 0.00042Iteration: 835, Log-Lik: -318272.023, Max-Change: 0.00017Iteration: 836, Log-Lik: -318272.021, Max-Change: 0.00028Iteration: 837, Log-Lik: -318272.021, Max-Change: 0.00013Iteration: 838, Log-Lik: -318272.020, Max-Change: 0.00011Iteration: 839, Log-Lik: -318272.020, Max-Change: 0.00019Iteration: 840, Log-Lik: -318272.019, Max-Change: 0.00041Iteration: 841, Log-Lik: -318272.018, Max-Change: 0.00017Iteration: 842, Log-Lik: -318272.017, Max-Change: 0.00029Iteration: 843, Log-Lik: -318272.016, Max-Change: 0.00013Iteration: 844, Log-Lik: -318272.016, Max-Change: 0.00011Iteration: 845, Log-Lik: -318272.015, Max-Change: 0.00017Iteration: 846, Log-Lik: -318272.014, Max-Change: 0.00042Iteration: 847, Log-Lik: -318272.014, Max-Change: 0.00017Iteration: 848, Log-Lik: -318272.012, Max-Change: 0.00028Iteration: 849, Log-Lik: -318272.012, Max-Change: 0.00013Iteration: 850, Log-Lik: -318272.011, Max-Change: 0.00011Iteration: 851, Log-Lik: -318272.011, Max-Change: 0.00018Iteration: 852, Log-Lik: -318272.010, Max-Change: 0.00041Iteration: 853, Log-Lik: -318272.009, Max-Change: 0.00017Iteration: 854, Log-Lik: -318272.008, Max-Change: 0.00029Iteration: 855, Log-Lik: -318272.007, Max-Change: 0.00013Iteration: 856, Log-Lik: -318272.007, Max-Change: 0.00010Iteration: 857, Log-Lik: -318272.006, Max-Change: 0.00017Iteration: 858, Log-Lik: -318272.005, Max-Change: 0.00042Iteration: 859, Log-Lik: -318272.005, Max-Change: 0.00017Iteration: 860, Log-Lik: -318272.003, Max-Change: 0.00028Iteration: 861, Log-Lik: -318272.003, Max-Change: 0.00013Iteration: 862, Log-Lik: -318272.002, Max-Change: 0.00011Iteration: 863, Log-Lik: -318272.002, Max-Change: 0.00018Iteration: 864, Log-Lik: -318272.001, Max-Change: 0.00041Iteration: 865, Log-Lik: -318272.000, Max-Change: 0.00017Iteration: 866, Log-Lik: -318271.999, Max-Change: 0.00029Iteration: 867, Log-Lik: -318271.998, Max-Change: 0.00013Iteration: 868, Log-Lik: -318271.998, Max-Change: 0.00010Iteration: 869, Log-Lik: -318271.997, Max-Change: 0.00017Iteration: 870, Log-Lik: -318271.996, Max-Change: 0.00042Iteration: 871, Log-Lik: -318271.996, Max-Change: 0.00017Iteration: 872, Log-Lik: -318271.995, Max-Change: 0.00028Iteration: 873, Log-Lik: -318271.994, Max-Change: 0.00013Iteration: 874, Log-Lik: -318271.993, Max-Change: 0.00011Iteration: 875, Log-Lik: -318271.993, Max-Change: 0.00018Iteration: 876, Log-Lik: -318271.992, Max-Change: 0.00040Iteration: 877, Log-Lik: -318271.991, Max-Change: 0.00017Iteration: 878, Log-Lik: -318271.990, Max-Change: 0.00029Iteration: 879, Log-Lik: -318271.989, Max-Change: 0.00013Iteration: 880, Log-Lik: -318271.989, Max-Change: 0.00010Iteration: 881, Log-Lik: -318271.988, Max-Change: 0.00017Iteration: 882, Log-Lik: -318271.987, Max-Change: 0.00041Iteration: 883, Log-Lik: -318271.987, Max-Change: 0.00016Iteration: 884, Log-Lik: -318271.986, Max-Change: 0.00027Iteration: 885, Log-Lik: -318271.985, Max-Change: 0.00013Iteration: 886, Log-Lik: -318271.985, Max-Change: 0.00011Iteration: 887, Log-Lik: -318271.984, Max-Change: 0.00018Iteration: 888, Log-Lik: -318271.983, Max-Change: 0.00040Iteration: 889, Log-Lik: -318271.983, Max-Change: 0.00017Iteration: 890, Log-Lik: -318271.981, Max-Change: 0.00029Iteration: 891, Log-Lik: -318271.981, Max-Change: 0.00013Iteration: 892, Log-Lik: -318271.980, Max-Change: 0.00010Iteration: 893, Log-Lik: -318271.980, Max-Change: 0.00017Iteration: 894, Log-Lik: -318271.979, Max-Change: 0.00041Iteration: 895, Log-Lik: -318271.978, Max-Change: 0.00016Iteration: 896, Log-Lik: -318271.977, Max-Change: 0.00027Iteration: 897, Log-Lik: -318271.976, Max-Change: 0.00013Iteration: 898, Log-Lik: -318271.976, Max-Change: 0.00010Iteration: 899, Log-Lik: -318271.975, Max-Change: 0.00018Iteration: 900, Log-Lik: -318271.974, Max-Change: 0.00040Iteration: 901, Log-Lik: -318271.974, Max-Change: 0.00017Iteration: 902, Log-Lik: -318271.973, Max-Change: 0.00028Iteration: 903, Log-Lik: -318271.972, Max-Change: 0.00013Iteration: 904, Log-Lik: -318271.972, Max-Change: 0.00010Iteration: 905, Log-Lik: -318271.971, Max-Change: 0.00017Iteration: 906, Log-Lik: -318271.970, Max-Change: 0.00041Iteration: 907, Log-Lik: -318271.970, Max-Change: 0.00016Iteration: 908, Log-Lik: -318271.969, Max-Change: 0.00027Iteration: 909, Log-Lik: -318271.968, Max-Change: 0.00013Iteration: 910, Log-Lik: -318271.968, Max-Change: 0.00010Iteration: 911, Log-Lik: -318271.967, Max-Change: 0.00018Iteration: 912, Log-Lik: -318271.966, Max-Change: 0.00040Iteration: 913, Log-Lik: -318271.966, Max-Change: 0.00016Iteration: 914, Log-Lik: -318271.964, Max-Change: 0.00028Iteration: 915, Log-Lik: -318271.964, Max-Change: 0.00013Iteration: 916, Log-Lik: -318271.963, Max-Change: 0.00010Iteration: 917, Log-Lik: -318271.963, Max-Change: 0.00017Iteration: 918, Log-Lik: -318271.962, Max-Change: 0.00041Iteration: 919, Log-Lik: -318271.961, Max-Change: 0.00016Iteration: 920, Log-Lik: -318271.960, Max-Change: 0.00027Iteration: 921, Log-Lik: -318271.959, Max-Change: 0.00013Iteration: 922, Log-Lik: -318271.959, Max-Change: 0.00010Iteration: 923, Log-Lik: -318271.959, Max-Change: 0.00018Iteration: 924, Log-Lik: -318271.958, Max-Change: 0.00039Iteration: 925, Log-Lik: -318271.957, Max-Change: 0.00016Iteration: 926, Log-Lik: -318271.956, Max-Change: 0.00028Iteration: 927, Log-Lik: -318271.955, Max-Change: 0.00013Iteration: 928, Log-Lik: -318271.955, Max-Change: 0.00010Iteration: 929, Log-Lik: -318271.954, Max-Change: 0.00017Iteration: 930, Log-Lik: -318271.953, Max-Change: 0.00040Iteration: 931, Log-Lik: -318271.953, Max-Change: 0.00016Iteration: 932, Log-Lik: -318271.952, Max-Change: 0.00027Iteration: 933, Log-Lik: -318271.951, Max-Change: 0.00013Iteration: 934, Log-Lik: -318271.951, Max-Change: 0.00010Iteration: 935, Log-Lik: -318271.950, Max-Change: 0.00018Iteration: 936, Log-Lik: -318271.949, Max-Change: 0.00039Iteration: 937, Log-Lik: -318271.949, Max-Change: 0.00016Iteration: 938, Log-Lik: -318271.948, Max-Change: 0.00028Iteration: 939, Log-Lik: -318271.947, Max-Change: 0.00012Iteration: 940, Log-Lik: -318271.947, Max-Change: 0.00010Iteration: 941, Log-Lik: -318271.946, Max-Change: 0.00017Iteration: 942, Log-Lik: -318271.945, Max-Change: 0.00040Iteration: 943, Log-Lik: -318271.945, Max-Change: 0.00016Iteration: 944, Log-Lik: -318271.944, Max-Change: 0.00027Iteration: 945, Log-Lik: -318271.943, Max-Change: 0.00013Iteration: 946, Log-Lik: -318271.943, Max-Change: 0.00010Iteration: 947, Log-Lik: -318271.942, Max-Change: 0.00018Iteration: 948, Log-Lik: -318271.941, Max-Change: 0.00039Iteration: 949, Log-Lik: -318271.941, Max-Change: 0.00016Iteration: 950, Log-Lik: -318271.940, Max-Change: 0.00028Iteration: 951, Log-Lik: -318271.939, Max-Change: 0.00012Iteration: 952, Log-Lik: -318271.939, Max-Change: 0.00010

Calculating information matrix...

Call:
mirt::mirt(data = extended_data %>% select(-dplyr::any_of(identifiers)), 
    model = 1, itemtype = "graded", SE = TRUE, verbose = verbose, 
    technical = list(NCYCLES = 1000))

Full-information item factor analysis with 1 factor(s).
Converged within 1e-04 tolerance after 952 EM iterations.
mirt version: 1.38.1 
M-step optimizer: BFGS 
EM acceleration: Ramsay 
Number of rectangular quadrature: 61
Latent density type: Gaussian 

Information matrix estimated with method: Oakes
Second-order test: model is a possible local maximum
Condition number of information matrix =  47871.77

Log-likelihood = -318271.9
Estimated parameters: 310 
AIC = 637163.9
BIC = 639803.3; SABIC = 638818.1

                                    F1    h2
anckar_democracy                 0.987 0.974
anrr_democracy                   0.982 0.965
blm                              0.984 0.968
bmr_democracy_femalesuffrage     0.985 0.971
bnr_extended                     0.967 0.935
bti_democracy                    0.977 0.954
csvmdi                           0.965 0.931
doorenspleet                     0.971 0.943
eiu                              0.966 0.934
fh_electoral                     0.889 0.791
fh_total_reversed                0.950 0.903
gwf_democracy_extended_strict    0.961 0.923
kailitz_tri                      0.946 0.895
lexical_index                    0.947 0.897
magaloni_democracy_extended      0.973 0.947
mainwaring                       0.977 0.955
pacl                             0.968 0.937
pacl_update                      0.951 0.905
PEPS1v                           0.982 0.965
pitf                             0.958 0.918
pmm_arat                         0.935 0.873
pmm_bollen                       0.946 0.894
pmm_hadenius                     0.964 0.930
pmm_munck                        0.932 0.868
polity2                          0.974 0.948
polyarchy_contestation_dimension 0.936 0.876
polyarchy_inclusion_dimension    0.556 0.309
polyarchy_original_contestation  0.964 0.930
polyarchy_original_polyarchy     0.968 0.937
prc                              0.970 0.941
reign_democracy                  0.944 0.890
svolik_democracy                 0.965 0.932
ulfelder_democracy_extended      0.970 0.940
utip_trichotomous                0.939 0.881
v2x_polyarchy                    0.958 0.917
vanhanen_democratization         0.937 0.878
wgi_democracy                    0.967 0.936
wth_democrobust                  0.987 0.973

SS loadings:  34.463 
Proportion Var:  0.907 

Factor correlations: 

   F1
F1  1
$rotF
                                        F1
anckar_democracy                 0.9869261
anrr_democracy                   0.9821582
blm                              0.9838808
bmr_democracy_femalesuffrage     0.9851457
bnr_extended                     0.9667473
bti_democracy                    0.9769765
csvmdi                           0.9647516
doorenspleet                     0.9709470
eiu                              0.9663488
fh_electoral                     0.8894242
fh_total_reversed                0.9501173
gwf_democracy_extended_strict    0.9608242
kailitz_tri                      0.9459496
lexical_index                    0.9469682
magaloni_democracy_extended      0.9732907
mainwaring                       0.9771093
pacl                             0.9682423
pacl_update                      0.9510803
PEPS1v                           0.9822472
pitf                             0.9581711
pmm_arat                         0.9345189
pmm_bollen                       0.9456436
pmm_hadenius                     0.9641867
pmm_munck                        0.9318719
polity2                          0.9738126
polyarchy_contestation_dimension 0.9362095
polyarchy_inclusion_dimension    0.5557239
polyarchy_original_contestation  0.9642085
polyarchy_original_polyarchy     0.9677568
prc                              0.9698938
reign_democracy                  0.9435291
svolik_democracy                 0.9653264
ulfelder_democracy_extended      0.9696240
utip_trichotomous                0.9387012
v2x_polyarchy                    0.9575238
vanhanen_democratization         0.9368946
wgi_democracy                    0.9674633
wth_democrobust                  0.9866270

$h2
                                        h2
anckar_democracy                 0.9740232
anrr_democracy                   0.9646348
blm                              0.9680214
bmr_democracy_femalesuffrage     0.9705121
bnr_extended                     0.9346003
bti_democracy                    0.9544831
csvmdi                           0.9307456
doorenspleet                     0.9427380
eiu                              0.9338300
fh_electoral                     0.7910754
fh_total_reversed                0.9027230
gwf_democracy_extended_strict    0.9231832
kailitz_tri                      0.8948206
lexical_index                    0.8967487
magaloni_democracy_extended      0.9472948
mainwaring                       0.9547426
pacl                             0.9374931
pacl_update                      0.9045538
PEPS1v                           0.9648095
pitf                             0.9180919
pmm_arat                         0.8733257
pmm_bollen                       0.8942419
pmm_hadenius                     0.9296560
pmm_munck                        0.8683853
polity2                          0.9483110
polyarchy_contestation_dimension 0.8764882
polyarchy_inclusion_dimension    0.3088290
polyarchy_original_contestation  0.9296980
polyarchy_original_polyarchy     0.9365532
prc                              0.9406940
reign_democracy                  0.8902472
svolik_democracy                 0.9318550
ulfelder_democracy_extended      0.9401708
utip_trichotomous                0.8811600
v2x_polyarchy                    0.9168519
vanhanen_democratization         0.8777715
wgi_democracy                    0.9359853
wth_democrobust                  0.9734328

$fcor
   F1
F1  1

TOTAL:   Data  Estep  Mstep     SE   Post 
194.35   1.99  53.56  94.44  44.15   0.00 

```
## Extracting scores and binding to identifiers...
```

```
## Adding number of measures and finalizing...
```

```
## Joining with `by = join_by(extended_country_name, GWn, cown, in_GW_system,
## year)`
```

```r
stopifnot(identical(extended_uds, tar_read(extended_uds, store = here::here("_targets"))))
stopifnot(identical(extended_uds, democracyData::extended_uds))
```

# Ulfelder


```r
cite_dataset("ulfelder")
```

[1] J. Ulfelder. _Democracy/Autocracy Data Set_. 2012.
<http://hdl.handle.net/1902.1/18836>.

[2] J. Ulfelder and M. Lustik. "Modelling Transitions To and From
Democracy". In: _Democratization_ 14.3 (2007), pp. 351-387. DOI:
10.1080/13510340701303196.

```r
ulfelder <- redownload_ulfelder(verbose = verbose,
                                include_in_output = include_in_output)
```

```
## Downloading  data...
```

```
## Trying https://dataverse.harvard.edu/api/access/datafile/2420018 ...
```

```
## Rows: 9730 Columns: 57
## ── Column specification ────────────────────────────────────────────────────────
## Delimiter: ","
## chr  (6): pitfcode, rgjtype, sftgreg1, sftgreg2, sfrgregc, sftgreg
## dbl (51): cowcode, year, rgjdem, rgjtrans, rgjdurd, rgjtaut, rgjatype, rgjal...
## 
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
## The downloaded  dataset has 9730 rows
## 
## Column ulfelder_scodes has been created by changing pitfcodes GER, MNE, SRB, UK, USS to polity character codes GMY, MNT, SER, UKG, USR
## 
## Excluding all rows where rgjtype is NA
## 
## Matching on code type polity_scode
## 
## The following different countries/country codes match to a single country unit in the destination system:
```



|ulfelder_scode |extended_country_name           | GWn| cown| min_date| max_date|  n|
|:--------------|:-------------------------------|---:|----:|--------:|--------:|--:|
|DRV            |Vietnam, Democratic Republic of | 816|  816|     1976|     1976|  1|
|RUS            |Russia (Soviet Union)           | 365|  365|     1991|     1991|  1|
|USR            |Russia (Soviet Union)           | 365|  365|     1991|     1991|  1|
|VIE            |Vietnam, Democratic Republic of | 816|  816|     1976|     1976|  1|
|YGS            |Yugoslavia                      | 345|  345|     1992|     1992|  1|
|YUG            |Yugoslavia                      | 345|  345|     1992|     1992|  1|

```
## Resulting dataset after processing has 7721 rows.
```

```r
ulfelder_extended <- redownload_ulfelder(verbose = verbose,
                                include_in_output = include_in_output,
                                extend = TRUE)
```

```
## Downloading  data...
## Trying https://dataverse.harvard.edu/api/access/datafile/2420018 ...
## Rows: 9730 Columns: 57── Column specification ────────────────────────────────────────────────────────
## Delimiter: ","
## chr  (6): pitfcode, rgjtype, sftgreg1, sftgreg2, sfrgregc, sftgreg
## dbl (51): cowcode, year, rgjdem, rgjtrans, rgjdurd, rgjtaut, rgjatype, rgjal...
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.The downloaded  dataset has 9730 rows
## Column ulfelder_scodes has been created by changing pitfcodes GER, MNE, SRB, UK, USS to polity character codes GMY, MNT, SER, UKG, USR
## Excluding all rows where rgjtype is NA
## Extending the data back in time using the duration variable
## Matching on code type polity_scode
## The following different countries/country codes match to a single country unit in the destination system:
```



|ulfelder_scode |extended_country_name           | GWn| cown| min_date| max_date|  n|
|:--------------|:-------------------------------|---:|----:|--------:|--------:|--:|
|DRV            |Vietnam, Democratic Republic of | 816|  816|     1976|     1976|  1|
|RUS            |Russia (Soviet Union)           | 365|  365|     1991|     1991|  1|
|USR            |Russia (Soviet Union)           | 365|  365|     1991|     1991|  1|
|VIE            |Vietnam, Democratic Republic of | 816|  816|     1976|     1976|  1|
|YGS            |Yugoslavia                      | 345|  345|     1992|     1992|  1|
|YUG            |Yugoslavia                      | 345|  345|     1992|     1992|  1|

```
## Resulting dataset after processing has 11582 rows.
```

```r
stopifnot(identical(ulfelder, tar_read(ulfelder, store = here::here("_targets"))))
stopifnot(identical(ulfelder, democracyData::ulfelder))
stopifnot(identical(ulfelder_extended, tar_read(ulfelder_extended, store = here::here("_targets"))))
stopifnot(identical(ulfelder_extended, democracyData::ulfelder_extended))
```

# UTIP


```r
cite_dataset("utip")
```

[1] S. Hsu. "The Effect of Political Regimes on Inequality, 1963-2002".
In: _UTIP Working Paper_ (2008).

```r
utip <- redownload_utip(verbose = verbose,
                        include_in_output = include_in_output)
```

```
## Downloading UTIP data...
```

```
## Trying http://utip.lbj.utexas.edu/data/political%20regime%20data%20set%20RV.xls ...
```

```
## The downloaded UTIP dataset has 8990 rows
```

```
## The following different countries/country codes match to a single country unit in the destination system:
```



|cname                 |extended_country_name           | GWn| cown| min_date| max_date|  n|
|:---------------------|:-------------------------------|---:|----:|--------:|--------:|--:|
|Czech Republic        |Czechoslovakia                  | 315|  315|     1963|     1992| 30|
|Czechoslovakia        |Czechoslovakia                  | 315|  315|     1963|     1992| 30|
|Ethiopia (-1992)      |Ethiopia                        | 530|  530|     1963|     2005| 43|
|Ethiopia (1993-)      |Ethiopia                        | 530|  530|     1963|     2005| 43|
|Germany               |German Federal Republic         | 260|  255|     1990|     2005| 16|
|Germany               |German Federal Republic         | 260|  260|     1963|     1989| 27|
|Germany, West         |German Federal Republic         | 260|  255|     1990|     2005| 16|
|Germany, West         |German Federal Republic         | 260|  260|     1963|     1989| 27|
|Pakistan (-1971)      |Pakistan                        | 770|  770|     1963|     2005| 43|
|Pakistan (1972-)      |Pakistan                        | 770|  770|     1963|     2005| 43|
|Russian Federation    |Russia (Soviet Union)           | 365|  365|     1963|     2005| 43|
|Serbia and Montenegro |Yugoslavia                      | 345|  345|     1963|     2005| 43|
|USSR                  |Russia (Soviet Union)           | 365|  365|     1963|     2005| 43|
|Vietnam               |Vietnam, Democratic Republic of | 816|  816|     1963|     2005| 43|
|Vietnam, North        |Vietnam, Democratic Republic of | 816|  816|     1963|     2005| 43|
|Yemen                 |Yemen (Arab Republic of Yemen)  | 678|  678|     1963|     1989| 27|
|Yemen                 |Yemen (Arab Republic of Yemen)  | 678|  679|     1990|     2005| 16|
|Yemen, North          |Yemen (Arab Republic of Yemen)  | 678|  678|     1963|     1989| 27|
|Yemen, North          |Yemen (Arab Republic of Yemen)  | 678|  679|     1990|     2005| 16|
|Yugoslavia            |Yugoslavia                      | 345|  345|     1963|     2005| 43|

```
## The following country names are different in the destination system:
```



|cname                         |extended_country_name                   | GWn| cown| min_date| max_date|  n|
|:-----------------------------|:---------------------------------------|---:|----:|--------:|--------:|--:|
|Antigua and Barbuda           |Antigua & Barbuda                       |  58|   58|     1963|     2005| 43|
|Belarus                       |Belarus (Byelorussia)                   | 370|  370|     1963|     2005| 43|
|Bosnia and Herzegovina        |Bosnia-Herzegovina                      | 346|  346|     1963|     2005| 43|
|Brunei Darussalam             |Brunei                                  | 835|  835|     1963|     2005| 43|
|Burkina Faso                  |Burkina Faso (Upper Volta)              | 439|  439|     1963|     2005| 43|
|Cambodia                      |Cambodia (Kampuchea)                    | 811|  811|     1963|     2005| 43|
|Congo, Democratic Republic    |Congo, Democratic Republic of (Zaire)   | 490|  490|     1963|     2005| 43|
|Czech Republic                |Czechoslovakia                          | 315|  315|     1963|     1992| 30|
|Ethiopia (-1992)              |Ethiopia                                | 530|  530|     1963|     2005| 43|
|Ethiopia (1993-)              |Ethiopia                                | 530|  530|     1963|     2005| 43|
|Germany                       |German Federal Republic                 | 260|  255|     1990|     2005| 16|
|Germany                       |German Federal Republic                 | 260|  260|     1963|     1989| 27|
|Germany, East                 |German Democratic Republic              | 265|  265|     1963|     2005| 43|
|Germany, West                 |German Federal Republic                 | 260|  255|     1990|     2005| 16|
|Germany, West                 |German Federal Republic                 | 260|  260|     1963|     1989| 27|
|Iran                          |Iran (Persia)                           | 630|  630|     1963|     2005| 43|
|Italy                         |Italy/Sardinia                          | 325|  325|     1963|     2005| 43|
|Korea, North                  |Korea, People's Republic of             | 731|  731|     1963|     2005| 43|
|Korea, South                  |Korea, Republic of                      | 732|  732|     1963|     2005| 43|
|Kyrgyzstan                    |Kyrgyz Republic                         | 703|  703|     1963|     2005| 43|
|Macedonia                     |Macedonia (Former Yugoslav Republic of) | 343|  343|     1963|     2005| 43|
|Madagascar                    |Madagascar (Malagasy)                   | 580|  580|     1963|     2005| 43|
|Micronesia                    |Federated States of Micronesia          | 987|  987|     1963|     2005| 43|
|Myanmar                       |Myanmar (Burma)                         | 775|  775|     1963|     2005| 43|
|Pakistan (-1971)              |Pakistan                                | 770|  770|     1963|     2005| 43|
|Pakistan (1972-)              |Pakistan                                | 770|  770|     1963|     2005| 43|
|Russian Federation            |Russia (Soviet Union)                   | 365|  365|     1963|     2005| 43|
|Samoa                         |Samoa/Western Samoa                     | 990|  990|     1963|     2005| 43|
|Serbia and Montenegro         |Yugoslavia                              | 345|  345|     1963|     2005| 43|
|Sri Lanka                     |Sri Lanka (Ceylon)                      | 780|  780|     1963|     2005| 43|
|St Kitts and Nevis            |Saint Kitts and Nevis                   |  60|   60|     1963|     2005| 43|
|St Lucia                      |Saint Lucia                             |  56|   56|     1963|     2005| 43|
|St Vincent and the Grenadines |Saint Vincent and the Grenadines        |  57|   57|     1963|     2005| 43|
|Suriname                      |Surinam                                 | 115|  115|     1963|     2005| 43|
|Tanzania                      |Tanzania/Tanganyika                     | 510|  510|     1963|     2005| 43|
|Timor-Leste                   |East Timor                              | 860|  860|     1963|     2005| 43|
|Turkey                        |Turkey (Ottoman Empire)                 | 640|  640|     1963|     2005| 43|
|USSR                          |Russia (Soviet Union)                   | 365|  365|     1963|     2005| 43|
|United States                 |United States of America                |   2|    2|     1963|     2005| 43|
|Vietnam                       |Vietnam, Democratic Republic of         | 816|  816|     1963|     2005| 43|
|Vietnam, North                |Vietnam, Democratic Republic of         | 816|  816|     1963|     2005| 43|
|Vietnam, South                |Vietnam (Annam/Cochin China/Tonkin)     | 815|   NA|     1976|     2005| 30|
|Vietnam, South                |Vietnam, Republic of                    | 817|  817|     1963|     1975| 13|
|Yemen                         |Yemen (Arab Republic of Yemen)          | 678|  678|     1963|     1989| 27|
|Yemen                         |Yemen (Arab Republic of Yemen)          | 678|  679|     1990|     2005| 16|
|Yemen, North                  |Yemen (Arab Republic of Yemen)          | 678|  678|     1963|     1989| 27|
|Yemen, North                  |Yemen (Arab Republic of Yemen)          | 678|  679|     1990|     2005| 16|
|Yemen, South                  |Yemen, People's Republic of             | 680|  680|     1963|     2005| 43|
|Zimbabwe                      |Zimbabwe (Rhodesia)                     | 552|  552|     1963|     2005| 43|

```
## Column DI has been renamed other_dictatorship
```

```
## Column MD has been renamed military_dictatorship
```

```
## Column W has been renamed civil_war
```

```
## Column OD has been renamed one_party_democracy
```

```
## Column C has been renamed communist
```

```
## Column IR has been renamed islamic_republic
```

```
## Column SD has been renamed social_democracy
```

```
## Column CO has been renamed conservative_democracy
```

```
## Columns utip_dichotomous, utip_dichotomous_strict, and utip_trichotomous have been created
```

```
## Resulting dataset after processing has 6215 rows.
```

```
## Note: the number of rows in the processed UTIP data is different from the number of rows in the original data.
```

```
## This is due to the exclusion of rows where DI was na and other columns contain no data.
```

```
## Changing the name of the original country column from cname to utip_country...
```

```
## Ensuring year column is numeric...
```

```r
stopifnot(identical(utip, tar_read(utip, store = here::here("_targets"))))
stopifnot(identical(utip, democracyData::utip))
```

# Vanhanen


```r
cite_dataset("vanhanen")
```

[1] T. Vanhanen. _Measures of Democracy 1810-2018 (dataset). Version
8.0 (2019-06-17)._ Tampere, 2019.
<http://urn.fi/urn:nbn:fi:fsd:T-FSD1289>.

```r
vanhanen_pmm <- extract_pmm_var(pmm_replication, pmm_vanhanen,
                                verbose = verbose, include_in_output = include_in_output)

vanhanen <- prepare_vanhanen(path = here::here("data-raw/FSD1289/FSD1289/Study/data/daF1289e.csv"),
                             verbose = verbose, include_in_output = include_in_output)
```

```
## Rows: 191 Columns: 632
## ── Column specification ────────────────────────────────────────────────────────
## Delimiter: ";"
## chr (629): fsd_li, bv1, q1_1, q1_2, q1_3, q2_1, q2_2, q2_3, q3_1, q3_2, q3_3...
## dbl   (3): fsd_no, fsd_vr, fsd_id
## 
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
## Converted to country-year format, the dataset has 16849 rows
## 
## The following country names are different in the destination system:
```



|Country                                        |extended_country_name                   | GWn| cown| min_date| max_date|   n|
|:----------------------------------------------|:---------------------------------------|---:|----:|--------:|--------:|---:|
|Antigua and Barbuda                            |Antigua & Barbuda                       |  58|   58|     1981|     2018|  38|
|Belarus                                        |Belarus (Byelorussia)                   | 370|  370|     1991|     2018|  28|
|Benin (Dahomey)                                |Benin                                   | 434|  434|     1960|     2018|  59|
|Bosnia and Herzegovina                         |Bosnia-Herzegovina                      | 346|  346|     1991|     2018|  28|
|Burma (Myanmar)                                |Myanmar (Burma)                         | 775|  775|     1947|     2018|  72|
|Congo, Republic of (Brazzaville)               |Congo                                   | 484|  484|     1960|     2018|  59|
|Cote d'Ivoire (Ivory Coast)                    |Cote D'Ivoire                           | 437|  437|     1960|     2018|  59|
|Czech Republic (Czechoslovakia)                |Czech Republic                          | 316|  316|     1993|     2018|  26|
|Czech Republic (Czechoslovakia)                |Czechoslovakia                          | 315|  315|     1918|     1992|  69|
|East Timor (Timor-Leste)                       |East Timor                              | 860|  860|     2002|     2018|  17|
|Germany                                        |German Federal Republic                 | 260|  255|     1990|     2018|  29|
|Germany                                        |German Federal Republic                 | 260|  260|     1949|     1989|  41|
|Germany                                        |Germany (Prussia)                       | 255|  255|     1810|     1944| 135|
|Iran                                           |Iran (Persia)                           | 630|  630|     1810|     2018| 209|
|Italy                                          |Italy/Sardinia                          | 325|  325|     1861|     2018| 158|
|Korea, Democratic People's Republic            |Korea, People's Republic of             | 731|  731|     1948|     2018|  71|
|Kyrgyzstan                                     |Kyrgyz Republic                         | 703|  703|     1991|     2018|  28|
|Macedonia                                      |Macedonia (Former Yugoslav Republic of) | 343|  343|     1991|     2018|  28|
|Madagascar                                     |Madagascar (Malagasy)                   | 580|  580|     1960|     2017|  58|
|Micronesia                                     |Federated States of Micronesia          | 987|  987|     1991|     2018|  28|
|Samoa (Western Samoa)                          |Samoa/Western Samoa                     | 990|  990|     1962|     2018|  57|
|Serbia                                         |Yugoslavia                              | 345|  345|     2003|     2005|   3|
|Sri Lanka                                      |Sri Lanka (Ceylon)                      | 780|  780|     1948|     2018|  71|
|Suriname                                       |Surinam                                 | 115|  115|     1975|     2018|  44|
|Taiwan, Republic of China on                   |Taiwan                                  | 713|  713|     1949|     2018|  70|
|Tanzania                                       |Tanzania/Tanganyika                     | 510|  510|     1961|     2018|  58|
|Turkey                                         |Turkey (Ottoman Empire)                 | 640|  640|     1810|     2018| 209|
|United States                                  |United States of America                |   2|    2|     1810|     2018| 209|
|Vietnam, Republic of (South Vietnam)           |Vietnam, Republic of                    | 817|  817|     1954|     1974|  21|
|Vietnam, Socialist Republic of                 |Vietnam, Democratic Republic of         | 816|  816|     1954|     2018|  65|
|Yemen                                          |Yemen (Arab Republic of Yemen)          | 678|  678|     1921|     1989|  69|
|Yemen                                          |Yemen (Arab Republic of Yemen)          | 678|  679|     1990|     2018|  29|
|Yemen, People's Democratic Republic of (South) |Yemen, People's Republic of             | 680|  680|     1967|     1989|  23|
|Yugoslavia (Serbia and Montenegro)             |Serbia                                  | 340|  345|     1878|     1917|  40|
|Yugoslavia (Serbia and Montenegro)             |Yugoslavia                              | 345|  345|     1918|     2002|  81|
|Zimbabwe                                       |Zimbabwe (Rhodesia)                     | 552|  552|     1980|     2018|  39|

```
## Changing the name of the original country column from Country to vanhanen_country...
## Ensuring year column is numeric...
```

```r
stopifnot(identical(vanhanen_pmm, tar_read(vanhanen_pmm, store = here::here("_targets"))))
stopifnot(identical(vanhanen_pmm, democracyData::vanhanen_pmm))
stopifnot(identical(vanhanen, tar_read(vanhanen, store = here::here("_targets"))))
stopifnot(identical(vanhanen, democracyData::vanhanen))
```

# VDem


```r
cite_dataset("vdem")
```

[1] M. Coppedge, J. Gerring, C. H. Knutsen, et al. _V-Dem Codebook
v13_.

[2] D. Pemstein, K. L. Marquardt, E. Tzelgov, et al. _The V-Dem
Measurement Model: Latent Variable Analysis for Cross-National and
Cross-Temporal Expert-Coded Data_. Tech. rep. 21. Varieties of
Democracy Institute, University of Gothenburg, 2022.
<https://www.v-dem.net/media/filer_public/25/cb/25cb3f3f-290d-46e1-8eaf-ff2d2c13f4a9/v-dem_working_paper_21.pdf>.

```r
vdem_simple <- prepare_vdem_simple(verbose = verbose, version = "13.0", include_in_output = include_in_output)
```

```
## The following country and/or code-years were matched more than once:
```



|country_name | COWcode|extended_country_name | GWn| cown| min_date| max_date|  n|
|:------------|-------:|:---------------------|---:|----:|--------:|--------:|--:|
|Serbia       |     345|Serbia                | 340|  345|     1804|     1829| 25|
|Serbia       |     345|Yugoslavia            | 345|  345|     1804|     1829| 25|

```
## The following different countries/country codes match to a single country unit in the destination system:
```



|country_name        | COWcode|extended_country_name | GWn| cown| min_date| max_date|  n|
|:-------------------|-------:|:---------------------|---:|----:|--------:|--------:|--:|
|Italy               |     325|Italy/Sardinia        | 325|  325|     1861|     1861|  1|
|Palestine/Gaza      |      NA|Palestine, State of   |  NA|   NA|     1948|     2022| 18|
|Palestine/West Bank |      NA|Palestine, State of   |  NA|   NA|     1948|     2022| 18|
|Piedmont-Sardinia   |      NA|Italy/Sardinia        | 325|  325|     1861|     1861|  1|

```
## The following country and/or code-years were not matched:
```



|country_name         | COWcode|extended_country_name | GWn| cown| min_date| max_date|  n|
|:--------------------|-------:|:---------------------|---:|----:|--------:|--------:|--:|
|Brunswick            |      NA|NA                    |  NA|   NA|     1789|     1867| 74|
|Hamburg              |      NA|NA                    |  NA|   NA|     1789|     1867| 79|
|Nassau               |      NA|NA                    |  NA|   NA|     1806|     1866| 61|
|Oldenburg            |      NA|NA                    |  NA|   NA|     1789|     1867| 77|
|Saxe-Weimar-Eisenach |      NA|NA                    |  NA|   NA|     1809|     1867| 59|
|WÃ¼rtemberg          |     271|NA                    |  NA|   NA|     1789|     1871| 83|

```
## The following country names are different in the destination system:
```



|country_name                     | COWcode|extended_country_name                   | GWn| cown| min_date| max_date|   n|
|:--------------------------------|-------:|:---------------------------------------|---:|----:|--------:|--------:|---:|
|Belarus                          |     370|Belarus (Byelorussia)                   | 370|  370|     1990|     2022|  33|
|Bosnia and Herzegovina           |     346|Bosnia-Herzegovina                      | 346|  346|     1992|     2022|  31|
|Burkina Faso                     |     439|Burkina Faso (Upper Volta)              | 439|  439|     1919|     2022|  89|
|Burma/Myanmar                    |     775|Myanmar (Burma)                         | 775|  775|     1789|     2022| 234|
|Cambodia                         |     811|Cambodia (Kampuchea)                    | 811|  811|     1900|     2022| 123|
|Czechia                          |     315|Czech Republic                          | 316|  316|     1918|     1992|  75|
|Czechia                          |     316|Czech Republic                          | 316|  316|     1993|     2022|  30|
|Democratic Republic of the Congo |     490|Congo, Democratic Republic of (Zaire)   | 490|  490|     1900|     2022| 123|
|Eswatini                         |     572|Swaziland                               | 572|  572|     1900|     2022| 123|
|Germany                          |     255|German Federal Republic                 | 260|  255|     1991|     2022|  32|
|Germany                          |     255|Germany (Prussia)                       | 255|  255|     1789|     1944| 156|
|Germany                          |     260|German Federal Republic                 | 260|  260|     1949|     1990|  42|
|Hesse-Darmstadt                  |     275|Hesse-Darmstadt (Ducal)                 | 275|  275|     1789|     1867|  79|
|Hesse-Darmstadt                  |      NA|Hesse-Darmstadt (Ducal)                 | 275|  275|     1868|     1871|   4|
|Hesse-Kassel                     |     273|Hesse-Kassel (Electoral)                | 273|  273|     1789|     1866|  78|
|Iran                             |     630|Iran (Persia)                           | 630|  630|     1789|     2022| 234|
|Italy                            |     325|Italy/Sardinia                          | 325|  325|     1861|     2022| 162|
|Ivory Coast                      |     437|Cote D'Ivoire                           | 437|  437|     1900|     2022| 123|
|Kyrgyzstan                       |     703|Kyrgyz Republic                         | 703|  703|     1990|     2022|  33|
|Madagascar                       |     580|Madagascar (Malagasy)                   | 580|  580|     1817|     2022| 206|
|Mecklenburg Schwerin             |     280|Mecklenburg-Schwerin                    | 280|  280|     1789|     1867|  79|
|North Korea                      |     731|Korea, People's Republic of             | 731|  731|     1945|     2022|  78|
|North Macedonia                  |     343|Macedonia (Former Yugoslav Republic of) | 343|  343|     1991|     2022|  32|
|Palestine/British Mandate        |      NA|British Mandate of Palestine            |  NA|   NA|     1918|     1948|  31|
|Palestine/Gaza                   |      NA|Palestine, State of                     |  NA|   NA|     1948|     2022|  35|
|Palestine/West Bank              |      NA|Palestine, State of                     |  NA|   NA|     1948|     2022|  58|
|Piedmont-Sardinia                |      NA|Italy/Sardinia                          | 325|  325|     1789|     1861|  73|
|Republic of Vietnam              |     817|Vietnam, Republic of                    | 817|  817|     1802|     1975| 174|
|Republic of the Congo            |     484|Congo                                   | 484|  484|     1903|     2022| 120|
|Russia                           |     365|Russia (Soviet Union)                   | 365|  365|     1789|     2022| 234|
|Serbia                           |     345|Yugoslavia                              | 345|  345|     1804|     2005| 113|
|South Korea                      |     730|Korea                                   | 730|  730|     1789|     1905| 117|
|South Korea                      |     732|Korea                                   | 730|  730|     1906|     1909|   4|
|South Korea                      |     732|Korea, Republic of                      | 732|  732|     1910|     2022| 113|
|South Yemen                      |     680|Yemen, People's Republic of             | 680|  680|     1900|     1990|  91|
|Sri Lanka                        |     780|Sri Lanka (Ceylon)                      | 780|  780|     1900|     2022| 123|
|Suriname                         |     115|Surinam                                 | 115|  115|     1900|     2022| 123|
|Tanzania                         |     510|Tanzania/Tanganyika                     | 510|  510|     1914|     2022| 109|
|The Gambia                       |     420|Gambia                                  | 420|  420|     1900|     2022| 123|
|Timor-Leste                      |     860|East Timor                              | 860|  860|     1900|     2022| 123|
|Turkey                           |     640|Turkey (Ottoman Empire)                 | 640|  640|     1789|     2022| 234|
|Two Sicilies                     |     329|Sicily (Two Sicilies)                   | 329|  329|     1789|     1860|  72|
|Vietnam                          |     816|Vietnam, Democratic Republic of         | 816|  816|     1945|     2022|  78|
|Yemen                            |     678|Yemen (Arab Republic of Yemen)          | 678|  678|     1789|     1989| 134|
|Yemen                            |     679|Yemen (Arab Republic of Yemen)          | 678|  679|     1990|     2022|  33|
|Zimbabwe                         |     552|Zimbabwe (Rhodesia)                     | 552|  552|     1900|     2022| 123|

```
## The following country and/or code-years were matched more than once:
```



|country_name |extended_country_name | GWn| cown| min_date| max_date|  n|
|:------------|:---------------------|---:|----:|--------:|--------:|--:|
|Serbia       |Serbia                | 340|  345|     1804|     1829| 25|
|Serbia       |Yugoslavia            | 345|  345|     1804|     1829| 25|

```
## The following different countries/country codes match to a single country unit in the destination system:
```



|country_name        |extended_country_name | GWn| cown| min_date| max_date|  n|
|:-------------------|:---------------------|---:|----:|--------:|--------:|--:|
|Italy               |Italy/Sardinia        | 325|  325|     1861|     1861|  1|
|Palestine/Gaza      |Palestine, State of   |  NA|   NA|     1948|     2022| 18|
|Palestine/West Bank |Palestine, State of   |  NA|   NA|     1948|     2022| 18|
|Piedmont-Sardinia   |Italy/Sardinia        | 325|  325|     1861|     1861|  1|

```
## The following country and/or code-years were not matched:
```



|country_name         |extended_country_name | GWn| cown| min_date| max_date|  n|
|:--------------------|:---------------------|---:|----:|--------:|--------:|--:|
|Brunswick            |NA                    |  NA|   NA|     1789|     1867| 74|
|Hamburg              |NA                    |  NA|   NA|     1789|     1867| 79|
|Nassau               |NA                    |  NA|   NA|     1806|     1866| 61|
|Oldenburg            |NA                    |  NA|   NA|     1789|     1867| 77|
|Saxe-Weimar-Eisenach |NA                    |  NA|   NA|     1809|     1867| 59|
|WÃ¼rtemberg          |NA                    |  NA|   NA|     1789|     1871| 83|

```
## The following country names are different in the destination system:
```



|country_name                     |extended_country_name                   | GWn| cown| min_date| max_date|   n|
|:--------------------------------|:---------------------------------------|---:|----:|--------:|--------:|---:|
|Belarus                          |Belarus (Byelorussia)                   | 370|  370|     1990|     2022|  33|
|Bosnia and Herzegovina           |Bosnia-Herzegovina                      | 346|  346|     1992|     2022|  31|
|Burkina Faso                     |Burkina Faso (Upper Volta)              | 439|  439|     1919|     2022|  89|
|Burma/Myanmar                    |Myanmar (Burma)                         | 775|  775|     1789|     2022| 234|
|Cambodia                         |Cambodia (Kampuchea)                    | 811|  811|     1900|     2022| 123|
|Czechia                          |Czech Republic                          | 316|  316|     1918|     2022| 105|
|Democratic Republic of the Congo |Congo, Democratic Republic of (Zaire)   | 490|  490|     1900|     2022| 123|
|Eswatini                         |Swaziland                               | 572|  572|     1900|     2022| 123|
|Germany                          |German Federal Republic                 | 260|  255|     1990|     2022|  33|
|Germany                          |German Federal Republic                 | 260|  260|     1949|     1989|  41|
|Germany                          |Germany (Prussia)                       | 255|  255|     1789|     1944| 156|
|Hesse-Darmstadt                  |Hesse-Darmstadt (Ducal)                 | 275|  275|     1789|     1871|  83|
|Hesse-Kassel                     |Hesse-Kassel (Electoral)                | 273|  273|     1789|     1866|  78|
|Iran                             |Iran (Persia)                           | 630|  630|     1789|     2022| 234|
|Italy                            |Italy/Sardinia                          | 325|  325|     1861|     2022| 162|
|Ivory Coast                      |Cote D'Ivoire                           | 437|  437|     1900|     2022| 123|
|Kyrgyzstan                       |Kyrgyz Republic                         | 703|  703|     1990|     2022|  33|
|Madagascar                       |Madagascar (Malagasy)                   | 580|  580|     1817|     2022| 206|
|Mecklenburg Schwerin             |Mecklenburg-Schwerin                    | 280|  280|     1789|     1867|  79|
|North Korea                      |Korea, People's Republic of             | 731|  731|     1945|     2022|  78|
|North Macedonia                  |Macedonia (Former Yugoslav Republic of) | 343|  343|     1991|     2022|  32|
|Palestine/British Mandate        |British Mandate of Palestine            |  NA|   NA|     1918|     1948|  31|
|Palestine/Gaza                   |Palestine, State of                     |  NA|   NA|     1948|     2022|  35|
|Palestine/West Bank              |Palestine, State of                     |  NA|   NA|     1948|     2022|  58|
|Piedmont-Sardinia                |Italy/Sardinia                          | 325|  325|     1789|     1861|  73|
|Republic of Vietnam              |Vietnam, Republic of                    | 817|  817|     1802|     1975| 174|
|Republic of the Congo            |Congo                                   | 484|  484|     1903|     2022| 120|
|Russia                           |Russia (Soviet Union)                   | 365|  365|     1789|     2022| 234|
|Serbia                           |Yugoslavia                              | 345|  345|     1804|     2005| 113|
|South Korea                      |Korea                                   | 730|  730|     1789|     1909| 121|
|South Korea                      |Korea, Republic of                      | 732|  732|     1910|     2022| 113|
|South Yemen                      |Yemen, People's Republic of             | 680|  680|     1900|     1990|  91|
|Sri Lanka                        |Sri Lanka (Ceylon)                      | 780|  780|     1900|     2022| 123|
|Suriname                         |Surinam                                 | 115|  115|     1900|     2022| 123|
|Tanzania                         |Tanzania/Tanganyika                     | 510|  510|     1914|     2022| 109|
|The Gambia                       |Gambia                                  | 420|  420|     1900|     2022| 123|
|Timor-Leste                      |East Timor                              | 860|  860|     1900|     2022| 123|
|Turkey                           |Turkey (Ottoman Empire)                 | 640|  640|     1789|     2022| 234|
|Two Sicilies                     |Sicily (Two Sicilies)                   | 329|  329|     1789|     1860|  72|
|Vietnam                          |Vietnam, Democratic Republic of         | 816|  816|     1945|     2022|  78|
|Yemen                            |Yemen (Arab Republic of Yemen)          | 678|  678|     1789|     1989| 134|
|Yemen                            |Yemen (Arab Republic of Yemen)          | 678|  679|     1990|     2022|  33|
|Zimbabwe                         |Zimbabwe (Rhodesia)                     | 552|  552|     1900|     2022| 123|

```
## Joining with `by = join_by(country_name, country_text_id, country_id, year,
## historical_date, project, historical, histname, codingstart, codingend,
## codingstart_contemp, codingend_contemp, codingstart_hist, codingend_hist,
## gapstart1, gapstart2, gapstart3, gapend1, gapend2, gapend3, gap_index, COWcode,
## v2x_polyarchy, v2x_polyarchy_codelow, v2x_polyarchy_codehigh, v2x_polyarchy_sd,
## v2x_libdem, v2x_libdem_codelow, v2x_libdem_codehigh, v2x_libdem_sd,
## v2x_partipdem, v2x_partipdem_codelow, v2x_partipdem_codehigh, v2x_partipdem_sd,
## v2x_delibdem, v2x_delibdem_codelow, v2x_delibdem_codehigh, v2x_delibdem_sd,
## v2x_egaldem, v2x_egaldem_codelow, v2x_egaldem_codehigh, v2x_egaldem_sd,
## v2x_api, v2x_api_codelow, v2x_api_codehigh, v2x_api_sd, v2x_mpi,
## v2x_mpi_codelow, v2x_mpi_codehigh, v2x_mpi_sd, extended_country_name, GWn,
## cown, in_GW_system)`
```

```r
stopifnot(identical(vdem_simple, tar_read(vdem_simple, store = here::here("_targets"))))
stopifnot(identical(vdem_simple, democracyData::vdem_simple))
```


# Wahman Teorell and Hadenius


```r
cite_dataset("wahman_teorell")
```

[1] A. Hadenius and J. Teorell. "Pathways from Authoritarianism". In:
_Journal of Democracy_ 18.1 (2007), pp. 143-157.

[2] M. Wahman, J. Teorell, and A. Hadenius. "Authoritarian Regime Types
Revisited: Updated Data in Comparative Perspective". In: _Contemporary
Politics_ 19.1 (2013), pp. 19-34.
<https://sites.google.com/site/authoritarianregimedataset/data>.

```r
wahman_teorell_hadenius <- redownload_wahman_teorell_hadenius(verbose = verbose,
                                                              include_in_output = include_in_output)
```

```
## Downloading Wahman, Teorell, and Hadenius data...
```

```
## Trying https://sites.google.com/site/authoritarianregimedataset/data/ARD_V6.dta?attredirects=0&d=1 ...
```

```
## The downloaded Wahman, Teorell, and Hadenius dataset has 8231 rows
```

```
## The following different countries/country codes match to a single country unit in the destination system:
```



|country        |extended_country_name          | GWn| cown| min_date| max_date|  n|
|:--------------|:------------------------------|---:|----:|--------:|--------:|--:|
|Czech Republic |Czechoslovakia                 | 315|  315|     1972|     1992| 21|
|Czechoslovakia |Czechoslovakia                 | 315|  315|     1972|     1992| 21|
|North Yemen    |Yemen (Arab Republic of Yemen) | 678|  679|     1990|     2010| 21|
|Yemen, Rep.    |Yemen (Arab Republic of Yemen) | 678|  679|     1990|     2010| 21|

```
## The following country names are different in the destination system:
```



|country                            |extended_country_name                   | GWn| cown| min_date| max_date|  n|
|:----------------------------------|:---------------------------------------|---:|----:|--------:|--------:|--:|
|Antigua and Barbuda                |Antigua & Barbuda                       |  58|   58|     1972|     2014| 43|
|Bahamas, The                       |Bahamas                                 |  31|   31|     1973|     2014| 42|
|Belarus                            |Belarus (Byelorussia)                   | 370|  370|     1972|     2014| 43|
|Bosnia and Herzegovina             |Bosnia-Herzegovina                      | 346|  346|     1972|     2014| 43|
|Burkina Faso                       |Burkina Faso (Upper Volta)              | 439|  439|     1972|     2014| 43|
|Cambodia                           |Cambodia (Kampuchea)                    | 811|  811|     1972|     2014| 43|
|Congo, Dem. Rep. (Zaire, Kinshasa) |Congo, Democratic Republic of (Zaire)   | 490|  490|     1972|     2014| 43|
|Congo, Rep.(Brazzaville)           |Congo                                   | 484|  484|     1972|     2014| 43|
|Czech Republic                     |Czechoslovakia                          | 315|  315|     1972|     1992| 21|
|East Germany                       |German Democratic Republic              | 265|  265|     1972|     2014| 43|
|Egypt, Arab Rep.                   |Egypt                                   | 651|  651|     1972|     2014| 43|
|Gambia, The                        |Gambia                                  | 420|  420|     1972|     2014| 43|
|Germany                            |German Federal Republic                 | 260|  255|     1990|     2014| 25|
|Germany                            |German Federal Republic                 | 260|  260|     1972|     1989| 18|
|Iran, Islamic Rep.                 |Iran (Persia)                           | 630|  630|     1972|     2014| 43|
|Italy                              |Italy/Sardinia                          | 325|  325|     1972|     2014| 43|
|Korea, Dem. Rep. (N)               |Korea, People's Republic of             | 731|  731|     1972|     2014| 43|
|Korea, Rep. (S)                    |Korea, Republic of                      | 732|  732|     1972|     2014| 43|
|Lao, PDR                           |Laos                                    | 812|  812|     1972|     2014| 43|
|Macedonia, FYR                     |Macedonia (Former Yugoslav Republic of) | 343|  343|     1972|     2014| 43|
|Madagascar                         |Madagascar (Malagasy)                   | 580|  580|     1972|     2014| 43|
|Micronesia                         |Federated States of Micronesia          | 987|  987|     1972|     2014| 43|
|Myanmar                            |Myanmar (Burma)                         | 775|  775|     1972|     2014| 43|
|North Yemen                        |Yemen (Arab Republic of Yemen)          | 678|  678|     1972|     1989| 18|
|North Yemen                        |Yemen (Arab Republic of Yemen)          | 678|  679|     1990|     2010| 21|
|Russian Federation                 |Russia (Soviet Union)                   | 365|  365|     1992|     2014| 23|
|Samoa                              |Samoa/Western Samoa                     | 990|  990|     1972|     2014| 43|
|Slovak Republic                    |Slovakia                                | 317|  317|     1972|     2014| 43|
|South Vietnam                      |Vietnam (Annam/Cochin China/Tonkin)     | 815|   NA|     1976|     2014| 39|
|South Vietnam                      |Vietnam, Republic of                    | 817|  817|     1972|     1975|  4|
|South Yemen                        |Yemen, People's Republic of             | 680|  680|     1972|     2014| 43|
|Sri Lanka                          |Sri Lanka (Ceylon)                      | 780|  780|     1972|     2014| 43|
|St. Kitts and Nevis                |Saint Kitts and Nevis                   |  60|   60|     1972|     2014| 43|
|St. Lucia                          |Saint Lucia                             |  56|   56|     1972|     2014| 43|
|St. Vincent and the Grenadines     |Saint Vincent and the Grenadines        |  57|   57|     1972|     2014| 43|
|Suriname                           |Surinam                                 | 115|  115|     1972|     2014| 43|
|Syrian Arab Republic               |Syria                                   | 652|  652|     1972|     2014| 43|
|Taiwan, China                      |Taiwan                                  | 713|  713|     1972|     2014| 43|
|Tanzania                           |Tanzania/Tanganyika                     | 510|  510|     1972|     2014| 43|
|Timor-Leste                        |East Timor                              | 860|  860|     1972|     2014| 43|
|Turkey                             |Turkey (Ottoman Empire)                 | 640|  640|     1972|     2014| 43|
|USSR                               |Russia (Soviet Union)                   | 365|  365|     1972|     1991| 20|
|United States                      |United States of America                |   2|    2|     1972|     2014| 43|
|Venezuela, RB                      |Venezuela                               | 101|  101|     1972|     2014| 43|
|Vietnam                            |Vietnam, Democratic Republic of         | 816|  816|     1972|     2014| 43|
|Yemen, Rep.                        |Yemen (Arab Republic of Yemen)          | 678|  679|     1990|     2014| 25|
|Yugoslavia, FPR                    |Yugoslavia                              | 345|  345|     1972|     1991| 20|
|Yugoslavia, FR (Serbia/Montenegro) |Serbia                                  | 340|  345|     2006|     2014|  9|
|Yugoslavia, FR (Serbia/Montenegro) |Yugoslavia                              | 345|  345|     1992|     2005| 14|
|Zimbabwe                           |Zimbabwe (Rhodesia)                     | 552|  552|     1972|     2014| 43|

```
## Resulting dataset after processing has 8231 rows.
```

```
## Changing the name of the original country column from country to wahman_teorell_hadenius_country...
```

```
## Ensuring year column is numeric...
```

```
## Changing the name of the original code column from cowcode to wahman_teorell_hadenius_cowcode...
```

```r
stopifnot(identical(wahman_teorell_hadenius, tar_read(wahman_teorell_hadenius, store = here::here("_targets"))))
stopifnot(identical(wahman_teorell_hadenius, democracyData::wahman_teorell_hadenius))
```


