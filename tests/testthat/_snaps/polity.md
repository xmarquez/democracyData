# PolityIV is the same as the redownloaded data, has the correct number of rows

    Code
      polityIV_redownloaded <- redownload_polityIV(verbose = TRUE)
    Message
      Downloading polity data...
      Trying http://www.systemicpeace.org/inscr/p4v2018.xls ...
      The downloaded polity dataset has 17562 rows
      Original dataset has 17562 rows.
      Processing the Polity IV data - adding state system info...
      The following different countries/country codes match to a single country unit in the destination system:
    Output
      
      
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
    Message
      The following country names are different in the destination system:
    Output
      
      
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
    Message
      Resulting dataset after processing has 17562 rows.
      Changing the name of the original country column from country to polityIV_country...
      Ensuring year column is numeric...
      Changing the name of the original code column from ccode to polityIV_ccode...

# Polity5 downloads correctly

    Code
      polity5 <- download_polity_annual(verbose = TRUE)
    Message
      Downloading polity data...
      Trying http://www.systemicpeace.org/inscr/p5v2018.sav ...
      The downloaded polity dataset has 17574 rows
      Original dataset has 17574 rows.
      Processing the Polity 5 data - adding state system info...
      The following different countries/country codes match to a single country unit in the destination system:
    Output
      
      
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
    Message
      The following country names are different in the destination system:
    Output
      
      
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
    Message
      Resulting dataset after processing has 17574 rows.
      Changing the name of the original country column from country to polity_annual_country...
      Ensuring year column is numeric...
      Changing the name of the original code column from ccode to polity_annual_ccode...

