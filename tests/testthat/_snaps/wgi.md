# World Governance Indicators data downloads correctly

    Code
      wgi_democracy <- download_wgi_voice_and_accountability(verbose = TRUE)
    Message
      Original dataset has 214 rows, but is not in country-year format
      Processing the WGI data - putting it in country-year format, adding state system info...
      The following country names are different in the destination system:
    Output
      
      
      |wb_country                     |wb_code |extended_country_name                   | GWn| cown| min_date| max_date|  n|
      |:------------------------------|:-------|:---------------------------------------|---:|----:|--------:|--------:|--:|
      |Antigua and Barbuda            |ATG     |Antigua & Barbuda                       |  58|   58|     1996|     2022| 24|
      |Bahamas, The                   |BHS     |Bahamas                                 |  31|   31|     1996|     2022| 24|
      |Belarus                        |BLR     |Belarus (Byelorussia)                   | 370|  370|     1996|     2022| 24|
      |Bosnia and Herzegovina         |BIH     |Bosnia-Herzegovina                      | 346|  346|     1996|     2022| 24|
      |Brunei Darussalam              |BRN     |Brunei                                  | 835|  835|     1996|     2022| 24|
      |Burkina Faso                   |BFA     |Burkina Faso (Upper Volta)              | 439|  439|     1996|     2022| 24|
      |Cambodia                       |KHM     |Cambodia (Kampuchea)                    | 811|  811|     1996|     2022| 24|
      |Congo, Dem. Rep.               |ZAR     |Congo, Democratic Republic of (Zaire)   | 490|  490|     1996|     2022| 24|
      |Congo, Rep.                    |COG     |Congo                                   | 484|  484|     1996|     2022| 24|
      |Côte d'Ivoire                  |CIV     |Cote D'Ivoire                           | 437|  437|     1996|     2022| 24|
      |Egypt, Arab Rep.               |EGY     |Egypt                                   | 651|  651|     1996|     2022| 24|
      |Eswatini                       |SWZ     |Swaziland                               | 572|  572|     1996|     2022| 24|
      |Gambia, The                    |GMB     |Gambia                                  | 420|  420|     1996|     2022| 24|
      |Germany                        |DEU     |German Federal Republic                 | 260|  255|     1996|     2022| 24|
      |Hong Kong SAR, China           |HKG     |Hong Kong                               |  NA|   NA|     1996|     2022| 24|
      |Iran, Islamic Rep.             |IRN     |Iran (Persia)                           | 630|  630|     1996|     2022| 24|
      |Italy                          |ITA     |Italy/Sardinia                          | 325|  325|     1996|     2022| 24|
      |Jersey, Channel Islands        |JEY     |Jersey                                  |  NA|   NA|     2011|     2022| 12|
      |Korea, Dem. Rep.               |PRK     |Korea, People's Republic of             | 731|  731|     1996|     2022| 24|
      |Korea, Rep.                    |KOR     |Korea, Republic of                      | 732|  732|     1996|     2022| 24|
      |Lao PDR                        |LAO     |Laos                                    | 812|  812|     1996|     2022| 24|
      |Macao SAR, China               |MAC     |Macao                                   |  NA|   NA|     1996|     2022| 24|
      |Madagascar                     |MDG     |Madagascar (Malagasy)                   | 580|  580|     1996|     2022| 24|
      |Micronesia, Fed. Sts.          |FSM     |Federated States of Micronesia          | 987|  987|     1996|     2022| 24|
      |Myanmar                        |MMR     |Myanmar (Burma)                         | 775|  775|     1996|     2022| 24|
      |Netherlands Antilles (former)  |ANT     |Netherlands Antilles                    |  NA|   NA|     2004|     2013| 10|
      |North Macedonia                |MKD     |Macedonia (Former Yugoslav Republic of) | 343|  343|     1996|     2022| 24|
      |Russian Federation             |RUS     |Russia (Soviet Union)                   | 365|  365|     1996|     2022| 24|
      |Réunion                        |REU     |Reunion                                 |  NA|   NA|     2004|     2013| 10|
      |Samoa                          |WSM     |Samoa/Western Samoa                     | 990|  990|     1996|     2022| 24|
      |Serbia                         |SRB     |Yugoslavia                              | 345|  345|     1996|     2005|  7|
      |Slovak Republic                |SVK     |Slovakia                                | 317|  317|     1996|     2022| 24|
      |Sri Lanka                      |LKA     |Sri Lanka (Ceylon)                      | 780|  780|     1996|     2022| 24|
      |St. Kitts and Nevis            |KNA     |Saint Kitts and Nevis                   |  60|   60|     1996|     2022| 24|
      |St. Lucia                      |LCA     |Saint Lucia                             |  56|   56|     1996|     2022| 24|
      |St. Vincent and the Grenadines |VCT     |Saint Vincent and the Grenadines        |  57|   57|     1996|     2022| 24|
      |Suriname                       |SUR     |Surinam                                 | 115|  115|     1996|     2022| 24|
      |Syrian Arab Republic           |SYR     |Syria                                   | 652|  652|     1996|     2022| 24|
      |São Tomé and Principe          |STP     |Sao Tome and Principe                   | 403|  403|     1996|     2022| 24|
      |Taiwan, China                  |TWN     |Taiwan                                  | 713|  713|     1996|     2022| 24|
      |Tanzania                       |TZA     |Tanzania/Tanganyika                     | 510|  510|     1996|     2022| 24|
      |Timor-Leste                    |TMP     |East Timor                              | 860|  860|     1996|     2022| 24|
      |Türkiye                        |TUR     |Turkey (Ottoman Empire)                 | 640|  640|     1996|     2022| 24|
      |United States                  |USA     |United States of America                |   2|    2|     1996|     2022| 24|
      |Venezuela, RB                  |VEN     |Venezuela                               | 101|  101|     1996|     2022| 24|
      |Vietnam                        |VNM     |Vietnam, Democratic Republic of         | 816|  816|     1996|     2022| 24|
      |Virgin Islands (U.S.)          |VIR     |Virgin Islands, U.S.                    |  NA|   NA|     2004|     2013| 10|
      |West Bank and Gaza             |WBG     |Palestine, State of                     |  NA|   NA|     1996|     2022| 24|
      |Yemen, Rep.                    |YEM     |Yemen (Arab Republic of Yemen)          | 678|  679|     1996|     2022| 24|
      |Zimbabwe                       |ZWE     |Zimbabwe (Rhodesia)                     | 552|  552|     1996|     2022| 24|

