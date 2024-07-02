# Freedom House data with territories downloads correctly

    Code
      fh <- download_fh(include_territories = TRUE)
    Message
      Downloading  data...
      Trying https://freedomhouse.org/sites/default/files/2024-02/Country_and_Territory_Ratings_and_Statuses_FIW_1973-2024.xlsx ...
      The downloaded  dataset has 205 rows
      Downloading  data...
      Trying https://freedomhouse.org/sites/default/files/2024-02/Country_and_Territory_Ratings_and_Statuses_FIW_1973-2024.xlsx ...
      The downloaded  dataset has 25 rows
      Original dataset has 230 rows, but is not in country-year format
      Processing the FH 2024 data - putting it in country-year format, adding state system info...
      The following different countries/country codes match to a single country unit in the destination system:
    Output
      
      
      |country                      |extended_country_name | GWn| cown| min_date| max_date|  n|
      |:----------------------------|:---------------------|---:|----:|--------:|--------:|--:|
      |Gaza Strip                   |Palestine, State of   |  NA|   NA|     2010|     2023| 14|
      |Israel                       |Israel                | 666|  666|     1996|     2009| 14|
      |Israeli-Occupied Territories |Israel                | 666|  666|     1996|     2009| 14|
      |West Bank                    |Palestine, State of   |  NA|   NA|     2010|     2023| 14|
    Message
      The following country names are different in the destination system:
    Output
      
      
      |country                                        |extended_country_name                   | GWn| cown| min_date| max_date|  n|
      |:----------------------------------------------|:---------------------------------------|---:|----:|--------:|--------:|--:|
      |Antigua and Barbuda                            |Antigua & Barbuda                       |  58|   58|     1982|     2023| 42|
      |Belarus                                        |Belarus (Byelorussia)                   | 370|  370|     1991|     2023| 33|
      |Bosnia and Herzegovina                         |Bosnia-Herzegovina                      | 346|  346|     1992|     2023| 32|
      |Burkina Faso                                   |Burkina Faso (Upper Volta)              | 439|  439|     1972|     2023| 51|
      |Cabo Verde                                     |Cape Verde                              | 402|  402|     1975|     2023| 48|
      |Cambodia                                       |Cambodia (Kampuchea)                    | 811|  811|     1972|     2023| 51|
      |Congo (Brazzaville)                            |Congo                                   | 484|  484|     1972|     2023| 51|
      |Congo (Kinshasa)                               |Congo, Democratic Republic of (Zaire)   | 490|  490|     1972|     2023| 51|
      |East Germany                                   |German Democratic Republic              | 265|  265|     1972|     1989| 17|
      |Eswatini                                       |Swaziland                               | 572|  572|     1972|     2023| 51|
      |Gaza Strip                                     |Palestine, State of                     |  NA|   NA|     2010|     2023| 14|
      |Germany                                        |German Federal Republic                 | 260|  255|     1990|     2023| 34|
      |Germany, W.                                    |German Federal Republic                 | 260|  260|     1972|     1989| 17|
      |Iran                                           |Iran (Persia)                           | 630|  630|     1972|     2023| 51|
      |Israeli-Occupied Territories                   |Israel                                  | 666|  666|     1996|     2009| 14|
      |Italy                                          |Italy/Sardinia                          | 325|  325|     1972|     2023| 51|
      |Kyrgyzstan                                     |Kyrgyz Republic                         | 703|  703|     1991|     2023| 33|
      |Madagascar                                     |Madagascar (Malagasy)                   | 580|  580|     1972|     2023| 51|
      |Micronesia                                     |Federated States of Micronesia          | 987|  987|     1991|     2023| 33|
      |Myanmar                                        |Myanmar (Burma)                         | 775|  775|     1972|     2023| 51|
      |North Korea                                    |Korea, People's Republic of             | 731|  731|     1972|     2023| 51|
      |North Macedonia                                |Macedonia (Former Yugoslav Republic of) | 343|  343|     1992|     2023| 32|
      |Palestinian Authority-Administered Territories |Palestine, State of                     |  NA|   NA|     1996|     2009| 14|
      |Russia                                         |Russia (Soviet Union)                   | 365|  365|     1991|     2023| 33|
      |Samoa                                          |Samoa/Western Samoa                     | 990|  990|     1972|     2023| 51|
      |Serbia and Montenegro                          |Yugoslavia                              | 345|  345|     2003|     2005|  3|
      |South Korea                                    |Korea, Republic of                      | 732|  732|     1972|     2023| 51|
      |South Vietnam                                  |Vietnam, Republic of                    | 817|  817|     1972|     1975|  4|
      |South Yemen                                    |Yemen, People's Republic of             | 680|  680|     1972|     1989| 17|
      |Sri Lanka                                      |Sri Lanka (Ceylon)                      | 780|  780|     1972|     2023| 51|
      |St. Kitts and Nevis                            |Saint Kitts and Nevis                   |  60|   60|     1983|     2023| 41|
      |St. Lucia                                      |Saint Lucia                             |  56|   56|     1979|     2023| 44|
      |St. Vincent and the Grenadines                 |Saint Vincent and the Grenadines        |  57|   57|     1979|     2023| 44|
      |Suriname                                       |Surinam                                 | 115|  115|     1975|     2023| 48|
      |Tanzania                                       |Tanzania/Tanganyika                     | 510|  510|     1972|     2023| 51|
      |The Gambia                                     |Gambia                                  | 420|  420|     1972|     2023| 51|
      |Timor-Leste                                    |East Timor                              | 860|  860|     1999|     2023| 25|
      |Turkey                                         |Turkey (Ottoman Empire)                 | 640|  640|     1972|     2023| 51|
      |USSR                                           |Russia (Soviet Union)                   | 365|  365|     1972|     1990| 18|
      |United States                                  |United States of America                |   2|    2|     1972|     2023| 51|
      |Vietnam                                        |Vietnam, Democratic Republic of         | 816|  816|     1976|     2023| 47|
      |Vietnam, N.                                    |Vietnam, Democratic Republic of         | 816|  816|     1972|     1975|  4|
      |West Bank                                      |Palestine, State of                     |  NA|   NA|     2010|     2023| 14|
      |West Bank and Gaza Strip                       |Palestine, State of                     |  NA|   NA|     1977|     1995| 18|
      |Yemen                                          |Yemen (Arab Republic of Yemen)          | 678|  679|     1990|     2023| 34|
      |Yemen, N.                                      |Yemen (Arab Republic of Yemen)          | 678|  678|     1972|     1989| 17|
      |Zimbabwe                                       |Zimbabwe (Rhodesia)                     | 552|  552|     1972|     2023| 51|
    Message
      Resulting dataset after processing has 9757 rows.
      Changing the name of the original country column from country to fh_country...
      Ensuring year column is numeric...

