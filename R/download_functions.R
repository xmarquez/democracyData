# Functions for downloading and processing other datasets -----------------

#' Downloads the 2017 update of the Polity IV dataset (annual time series) and
#' processes it using [country_year_coder].
#'
#' The original data is available at
#' [http://www.systemicpeace.org/inscrdata.html](http://www.systemicpeace.org/inscrdata.html)
#'
#' @param url The URL of the dataset. Defaults to
#'   http://www.systemicpeace.org/inscr/p4v2016.sav
#' @inheritParams redownload_blm
#'
#' @return The annual time series version of the polity dataset, as a [tibble],
#'   with the additional columns produced by [country_year_coder]. Consult the
#'   Polity IV codebook for further description.
#'
#' @template standard-variables
#' @section Note:
#'
#'   The datasets downloaded by the `download_*` family of functions are not
#'   directly available in this package. You will always need to directly
#'   download them in order to use them.
#'
#' @export
#' @import dplyr
#'
#' @aliases polity
#'
#' @seealso [polity_pmm]
#'
#' @examples
#' \dontrun{
#' polity_annual <- download_polity_annual()
#' polity_annual
#' }
download_polity_annual <- function(url,
                                   verbose = TRUE,
                                   return_raw = FALSE,
                                   ...) {
  ccode <- country <- year <- NULL

  if(missing(url)) {
    url <- "http://www.systemicpeace.org/inscr/p4v2016.sav"
  }


  data <- read_data(url,
                    verbose = verbose,
                    name = "polity") %>%
    haven::as_factor()


  if(return_raw) {
    if(verbose) {
      message("Returning raw data, without processing.")
    }
    return(data)
  }

  if(verbose) {
    message(sprintf("Original dataset has %d rows.",
                    nrow(data)))
    message("Processing the Polity IV data - adding state system info...")
  }


  polity_annual <- country_year_coder(data,
                                      country_col = country,
                                      date_col = year,
                                      code_col = ccode,
                                      code_type = "polity_ccode",
                                      match_type = "country",
                                      verbose = verbose,
                                      ...)

  if(verbose) {
    message(sprintf("Resulting dataset after processing has %d rows.",
                    nrow(polity_annual)))
    if(nrow(data) != nrow(polity_annual)) {
      message("Note: the number of rows in the processed Polity IV data is different from the number of rows in the original data.")
      if(nrow(data) != nrow(polity_annual)) {
        warning(sprintf("There should be %d rows in the final processed data. Something went wrong.",
                        nrow(data)))
      }
    }
  }


  standardize_columns(polity_annual, country, ccode, verbose = verbose)
}

#' Download the latest version (data up to 2015) of the "Democracy, Voice, and
#' Accountability" index from the World Governance Indicators and process it via
#' [country_year_coder]
#'
#'
#' @param url The URL of the dataset. Defaults to \url{http://databank.worldbank.org/data/download/WGI_csv.zip}
#' @inheritParams redownload_blm
#'
#' @import dplyr
#' @export
#'
#' @return A dataset containing the country-year version of the latest update
#'   (to 2015) of the World Governance Indicators "Democracy, Voice and
#'   Accountability" Index, compiled by Daniel Kaufmann and Aart Kraay. The
#'   original data are available at
#'   http://info.worldbank.org/governance/wgi/index.aspx#home, along with a full
#'   explanation of the methodology used to compile the index.
#'
#'   According to the compilers, "Voice and accountability captures perceptions
#'   of the extent to which a country's citizens are able to participate in
#'   selecting their government, as well as freedom of expression, freedom of
#'   association, and a free media."
#'
#'   \describe{
#'
#'   \item{wb_country}{Country name (World Bank standard).}
#'
#'   \item{wb_code}{World bank 3 character country code.}
#'
#'   \item{year}{Year.}
#'
#'   \item{Estimate}{Estimate of governance (ranges from approximately -2.5
#'   (weak) to 2.5 (strong) governance performance), with a mean of 0.}
#'
#'   \item{StdErr}{Standard error reflects variability around the point estimate
#'   of governance.}
#'
#'   \item{NumSrc}{Number of data sources on which estimate is based. The
#'   methodology document lists, among these, the EIU Democracy Index, Freedom
#'   House, the World Economic Forum Global Competitiveness Report, the Gallup
#'   World Poll, the Institutional Profiles Database, the Political Risk
#'   Services International Country Risk Guide, and Reporters Without Borders
#'   Press Freedom Index. See http://info.worldbank.org/governance/wgi/va.pdf
#'   for more details.}
#'
#'   \item{Rank}{Percentile rank among all countries (ranges from 0 (lowest) to
#'   100 (highest) rank).}
#'
#'   \item{Lower}{Lower bound of 90% confidence interval for governance, in
#'   percentile rank terms.}
#'
#'   \item{Upper}{Upper bound of 90% confidence interval for governance, in
#'   percentile rank terms} }
#' @template standard-variables
#' @inheritSection download_polity_annual Note
#' @family democracy
#' @family continuous democracy indexes
#' @aliases wgi
#' @aliases wgi_democracy
#' @source Worldwide Governance Indicators (http://www.govindicators.org).
#' @examples
#' \dontrun{
#' download_wgi_voice_and_accountability()}
download_wgi_voice_and_accountability <- function(url,
                                                  verbose = TRUE,
                                                  return_raw = FALSE,
                                                  ...) {

  if(missing(url)) {
    url <- "http://databank.worldbank.org/data/download/WGI_csv.zip"
  }

  X22 <- `Indicator Name` <- `Country Name` <- `Indicator Code` <- NULL
  `Country Code` <- indicator <- `1996` <- `2015` <- Estimate <- NULL
  variable <- value <-  NULL
  wb_country <- year <-  wb_code <- NULL



  data <- suppressWarnings(read_data(url,
                    verbose = verbose,
                    name = "WGIData.csv"))

  if(return_raw) {
    if(verbose) {
      message("Returning raw data, without processing.")
    }
    return(data)
  }

  data <- data %>%
    select(-X22) %>%
    filter(grepl("^VA", `Indicator Code`))

  if(verbose) {
    message(sprintf("Original dataset has %d rows, but is not in country-year format",
                    nrow(data)))
    message("Processing the WGI data - putting it in country-year format, adding state system info...")
  }

  wgi <- suppressWarnings(data %>%
    select(-`Indicator Name`) %>%
    rename(wb_country = `Country Name`,
           wb_code = `Country Code`,
           indicator = `Indicator Code`) %>%
    mutate(indicator = plyr::mapvalues(indicator,
                                       from =  c("VA.EST",
                                                 "VA.NO.SRC",
                                                 "VA.PER.RNK",
                                                 "VA.PER.RNK.LOWER",
                                                 "VA.PER.RNK.UPPER",
                                                 "VA.STD.ERR"),
                                       to = c("Estimate",
                                              "NumSrc",
                                              "Rank",
                                              "Lower",
                                              "Upper",
                                              "StdErr"),
                                       warn_missing = FALSE)) %>%
    tidyr::gather(year, value, `1996`:`2015`) %>%
    tidyr::spread(indicator, value) %>%
    mutate(year = as.numeric(year)) %>%
    select(wb_country, wb_code, year,
           c("Estimate", "StdErr",
             "NumSrc", "Rank", "Lower", "Upper"),
           everything()) %>%
    filter(!is.na(Estimate)) %>%
    country_year_coder(wb_country,
                       year,
                       wb_code,
                       code_type = "wb",
                       match_type = "country",
                       verbose = verbose,
                       ...))

  wgi

}



#' Downloads the 2017 update of the Freedom House "Freedom in the World" data
#' and processes it using [country_year_coder].
#'
#' The original data is available at
#' [https://freedomhouse.org/sites/default/files/FIW2017_Data.zip](https://freedomhouse.org/sites/default/files/FIW2017_Data.zip)
#'
#' @param url The URL of the dataset. Defaults to \url{https://freedomhouse.org/sites/default/files/FIW2017_Data.zip}
#' @inheritParams redownload_blm
#' @param include_territories Whether to include scores from non-independent
#'   territories (e.g., Indian Kashmir, Northern Ireland) compiled by FH.
#'   Default is \code{FALSE}.
#'
#' @return A time-series tidy version of the FH dataset, with the following
#'   variables:
#'
#'   * country: The original country name.
#'
#'   * year: The calendar year. This is approximate. The surveys cover specific
#'   periods in the original data that do not always overlap with a single year.
#'   In particular, the year 1981 is "skipped" - a single survey covers Jan.
#'   1981 - Aug. 1982 and its value is assigned to 1982 here.
#'
#'   * pr: Political rights, from 1 to 7, where 7 means more violations of
#'   political rights. Note that South Africa in 1973 was assigned two values
#'   (one for white and one for black South Africa). Here it is given the "not
#'   free" values. See notes for details.
#'
#'   * cl: Civil liberties, from 1 to 7, where 7 means more violations of civil
#'   rights. Note that South Africa in 1973 was assigned two values (one for
#'   white and one for black South Africa). Here it is given the "not free"
#'   values. See notes for details
#'
#'   * status: Political status. Free, not free, or partly free. See notes for
#'   details.
#'
#'   * fh_total: Sum of pr and cl. Higher values are "less free."
#'
#'   * fh_total_reversed: Reversed fh_total, so that higher values are "more
#'   free."
#'
#' @template standard-variables
#'
#' @inheritSection download_polity_annual Note
#'
#' @section Methodological notes:
#'
#'   From FH's Freedom in the World methodology discussion:
#'
#'   Methodological changes have been effected periodically. For discussions of
#'   these changes, please consult the methodology essays for various editions
#'   of the survey.
#'
#'   For a full explanation of the current methodology, please consult the most
#'   recent edition of the survey.
#'
#'   "PR" stands for "Political Rights," "CL" stands for "Civil Liberties," and
#'   "Status" is the Freedom Status. Political Rights and Civil Liberties are
#'   measured on a one-to-seven scale, with one representing the highest degree
#'   of Freedom and seven the lowest.
#'
#'   Until 2003, countries whose combined average ratings for Political Rights
#'   and for Civil Liberties fell between 1.0 and 2.5 were designated "Free";
#'   between 3.0 and 5.5 "Partly Free," and between 5.5 and 7.0 "Not Free."
#'   Beginning with the ratings for 2003, countries whose combined average
#'   ratings fall between 3.0 and 5.0 are "Partly Free," and those between 5.5
#'   and 7.0 are "Not Free." Ratings for territories are not included in this
#'   table.
#'
#'   Several countries became independent, split into two or more countries, or
#'   merged with a neighboring state. Scores for these countries are given only
#'   for the period of their existence as independent states.
#'
#'   The survey years refer to the various editions of Freedom in the World,
#'   except for Jan.-Feb. 1973 through Jan.-Feb. 1977, which are from the
#'   bimonthly journal Freedom at Issue. The first Freedom in the World
#'   book-length survey was the 1978 edition.
#'
#'   For 1972, South Africa was rated as "White" (2,3 Free) and "Black" (5,6 Not
#'   Free). For Yugoslavia, ratings from 1999 to 2002 were for the country that
#'   remained following the departures between 1991 and 1992 of Slovenia,
#'   Croatia, Macedonia and Bosnia-Herzegovina. In February 2003, the Yugoslav
#'   parliament adopted a constitutional charter establishing the state of
#'   Serbia and Montenegro. Thus, beginning in 2003, Yugoslavia is listed as
#'   "Serbia and Montenegro."	The State Union of Serbia and Montenegro dissolved
#'   when Montenegro withdrew in June 2006, making Serbia an independent state.
#'   Thus, the ratings for Serbia and Montenegro are listed separately beginning
#'   in 2006.	 Kosovo was first listed as a territory beginning in 1992. Since
#'   2009, it is listed as an independent country. South Sudan was first listed
#'   as an independent country in 2011 after officially separating from Sudan in
#'   July 2011.	The former Zaire is listed under Congo (Kinshasa), and the
#'   former Western Samoa is listed under Samoa.
#'
#' @export
#'
#' @import dplyr
#' @importFrom utils unzip
#'
#' @family democracy
#' @family Freedom House
#' @family ordinal democracy indexes
#' @source The "Freedom in the World" dataset from Freedom House, updated to
#'   2016. Original data and methodology is available at
#'   \url{https://freedomhouse.org/report/freedom-world/freedom-world-2017}
#'
#' @seealso [fh]
#'
#' @examples
#' \dontrun{
#' fh <- download_fh()
#' fh
#' fh_with_territories <- download_fh(include_territories = TRUE)
#' fh_with_territories
#' }
download_fh <- function(url,
                        include_territories = FALSE,
                        verbose = TRUE,
                        return_raw = FALSE,
                        ...) {

  status <- year <- pr <- cl <- fh_total <- NULL
  indicator <- value <- pr_1972 <- country <- status_2016 <- NULL

  if(missing(url)) {
    url <- "https://freedomhouse.org/sites/default/files/FIW2017_Data.zip"
  }


  data <- read_data(url,
                    verbose = verbose,
                    name = "/FH_Country_and_Territory_Ratings_and_Statuses_1972-2016.xls",
                    sheet = 2,
                    skip = 3,
                    col_names = FALSE,
                    na = c("","-"))


  if(include_territories) {
    territory_data <- read_data(url,
                      verbose = verbose,
                      name = "/FH_Country_and_Territory_Ratings_and_Statuses_1972-2016.xls",
                      sheet = 3,
                      skip = 3,
                      col_names = FALSE,
                      na = c("","-"))


    data <- bind_rows(data, territory_data %>%
                        mutate_at(vars(2:3), as.character))

  }

  if(return_raw) {
    if(verbose) {
      message("Returning raw data, without processing.")
    }
    return(data)
  }

  if(verbose) {
    message(sprintf("Original dataset has %d rows, but is not in country-year format",
                    nrow(data)))
    message("Processing the FH 2017 data - putting it in country-year format, adding state system info...")
  }

  nYears <- (ncol(data) - 1)/3
  var_years <- expand.grid(x = c('pr', 'cl', 'status'), y = c(1972:1980,1982:(1972 + nYears)))
  names(data) <- c('country', paste(var_years$x, var_years$y, sep = "_"))

  # melt the data, split the variable_year column and voila!

  data <- suppressWarnings(data %>%
    tidyr::gather(indicator, value, pr_1972:status_2016) %>%
    tidyr::separate(indicator, into = c("status", "year"), sep ="_")  %>%
    filter(!is.na(value)) %>%
    tidyr::spread(status, value) %>%
    mutate_at(vars(year:pr), as.numeric) %>%
    mutate(cl = ifelse(country == "South Africa" & year == 1972, 5, cl),
           pr = ifelse(country == "South Africa" & year == 1972, 6, pr),
           status = ifelse(country == "South Africa" & year == 1972, "NF", status),
           status = as.factor(status),
           fh_total = pr + cl,
           fh_total_reversed = 14 - fh_total,
           country = plyr::mapvalues(country,
                                     from= c("Yemen, S.",
                                             "Vietnam, S.",
                                             "Germany, E."),
                                     to = c("South Yemen",
                                            "South Vietnam",
                                            "East Germany"),
                                     warn_missing = FALSE)))

  fh <- data %>%
    country_year_coder(country,
                       year,
                       match_type = c("country"),
                       verbose = verbose,
                       ...)

  if(verbose) {
    message(sprintf("Resulting dataset after processing has %d rows.",
                    nrow(fh)))
    if(nrow(data) != nrow(fh)) {
      message("Note: the number of rows in the processed Freedom House data is different from the number of rows in the original data.")
    }
  }


  standardize_columns(fh, country, verbose = verbose)
}

#' Downloads the 2017 update of the Freedom House Electoral Democracies list
#' and processes it using [country_year_coder].
#'
#' The original data is available at
#' [https://freedomhouse.org/sites/default/files/FIW2017_Data.zip](https://freedomhouse.org/sites/default/files/FIW2017_Data.zip)
#'
#' @param url The URL of the dataset. Defaults to https://freedomhouse.org/sites/default/files/FIW2017_Data.zip
#' @inheritParams redownload_blm
#'
#' @return A time-series tidy version of the FH electoral democracies dataset, with the following
#'   variables:
#'
#'   * country: The original country name.
#'
#'   * year: The calendar year. This is approximate. The surveys cover specific
#'   periods in the original data that do not always overlap with a single year.
#'   In particular, the year 1981 is "skipped" – a single survey covers Jan.
#'   1981 - Aug. 1982 and its value is assigned to 1982 here.
#'
#'   * electoral: Electoral democracy indicator. \code{TRUE} = yes, \code{FALSE} = no.
#'
#' @template standard-variables
#' @inheritSection download_polity_annual Note
#'
#' @export
#'
#' @import dplyr
#' @importFrom utils unzip
#'
#' @aliases fh_electoral
#'
#' @family democracy
#' @family Freedom House
#' @family ordinal democracy indexes
#' @source The "Freedom in the World" dataset from Freedom House, updated to
#'   2016. Original data and methodology is available at
#'   \url{https://freedomhouse.org/report/freedom-world/freedom-world-2017}
#' @examples
#' \dontrun{
#' fh <- download_fh_electoral()
#' fh
#' }
download_fh_electoral <- function(url,
                                  verbose = TRUE,
                                  return_raw = FALSE,
                                  ...) {

  if(missing(url)) {
    url <- "https://freedomhouse.org/sites/default/files/FIW2017_Data.zip"
  }

  indicator <- value <- electoral_1989 <- electoral_2016 <- electoral_dem <- year <- NULL
  electoral <- country <- NULL


  data <- read_data(url,
                    verbose = verbose,
                    name = "/FH_Electoral_Democracies_1988-2016.xls",
                    sheet = 1,
                    skip = 3,
                    col_names = FALSE,
                    na = c("","-"))

  if(return_raw) {
    if(verbose) {
      message("Returning raw data, without processing.")
    }
    return(data)
  }

  if(verbose) {
    message(sprintf("Original dataset has %d rows, but is not in country-year format",
                    nrow(data)))
    message("Processing the FH Electoral Democracies 2017 data - putting it in country-year format, adding state system info...")
  }

  names(data) <- c('country', paste("electoral", 1989:2016, sep = "_"))

  # melt the data, split the variable_year column and voila!

  data <- suppressWarnings(data %>%
    tidyr::gather(indicator, value, electoral_1989:electoral_2016) %>%
    tidyr::separate(indicator, into = c("electoral_dem", "year"), sep ="_")  %>%
    filter(!is.na(value)) %>%
    tidyr::spread(electoral_dem, value) %>%
    mutate(year = as.numeric(year),
           electoral = ifelse(electoral == "Yes", TRUE, FALSE),
           country = plyr::mapvalues(country,
                                     from= c("Yemen, S.",
                                             "Vietnam, S.",
                                             "Germany, E."),
                                     to = c("South Yemen",
                                            "South Vietnam",
                                            "East Germany"),
                                     warn_missing = FALSE)))

  fh_electoral <- data %>%
    country_year_coder(country,
                       year,
                       match_type = c("country"),
                       verbose = verbose,
                       ...)

  if(verbose) {
    message(sprintf("Resulting dataset after processing has %d rows.",
                    nrow(fh_electoral)))
    if(nrow(data) != nrow(fh_electoral)) {
      message("Note: the number of rows in the processed FH data is different from the number of rows in the original data.")
    }
  }

   standardize_columns(fh_electoral, country, verbose = verbose)
}


#' The Rulers, Elections, and Irregular Governance Dataset (Regime data)
#'
#' Bell, Curtis. 2016. The Rulers, Elections, and Irregular Governance Dataset
#' (REIGN). Broomfield, CO: OEF Research. The dataset, variable decriptions, and
#' technical notes, are available at
#' \url{http://oefresearch.org/datasets/reign}. The variable descriptions below
#' are taken from
#' \url{http://oefresearch.org/sites/default/files/REIGN_descriptions.pdf}
#'
#' @section Overview:
#'
#'   The REIGN regime characteristics dataset is based on the regime
#'   classifications of Geddes, Wright, and Frantz ([gwf_autocratic]), but it is
#'   updated monthly, and it has some differences with [gwf_autocratic]. These
#'   are described as follows in the online technical notes:
#'
#'   REIGN data is updated to the present month. We also added the following
#'   countries to the  dataset: The Bahamas, Jamaica, Trinidad and Tobago,
#'   Barbados, Dominica, Grenada, St. Lucia, St. Vincent and the Grenadines,
#'   Antigua and Barbuda, St. Kitts and Nevis, Belize, Guyana, Surinam, Andorra,
#'   San Marino, Malta, Cyprus, Cape Verde, Sao Tome and Principe, Equatorial
#'   Guinea, Djibouti, Comoros, Mauritius, Seychelles, South Sudan, Bhutan,
#'   Maldives, South Vietnam, Brunei, East Timor, Papua New Guinea, Vanuatu,
#'   Solomon Islands, Kiribati, Tuvalu, Fiji, Tonga, Nauru, Marshall Islands,
#'   Palau, Micronesia, and Samoa.
#'
#'   We also added political systems that lasted for less than a year and
#'   specified start and end months. This allows for a more granular look at
#'   transitional periods and interim governments. These new short-lived regimes
#'   appear in countries including Haiti, the Dominican Republic, Guatemala,
#'   Peru, Benin, Niger, Ghana, and Nigeria.
#'
#'   Finally, GWF generally does not allow for yearly changes in institutions
#'   over the course of a regime. If a government begins as personalist, it
#'   stays personalist until that leader leaves power. In several cases we code
#'   a change in regime type following reforms during the tenure of a single
#'   leader, including Lanzana in Burkina Faso, Rawlings in Ghana, etc.
#'
#'   Further discussion of the differences between REIGN and GWF ([gwf_autocratic]) is
#'   available here: \url{http://oefresearch.org/sites/default/files/REIGN Data 2016.10.05.pdf}
#'
#' @param url The URL of the googlesheet where the REIGN dataset lives. Defaults
#'   to
#'   \url{https://docs.google.com/spreadsheets/d/1mrtORyhXw9TJMBYLAGPrikA4VDpla_Eq7L-NsEQ5VXg/edit#gid=1765819258}.
#'    This is fragile - if someone "unpublishes" the sheet,it may cease to work.
#' @inheritParams redownload_blm
#'
#' @return A [tibble] with the REIGN dataset, plus additional state system
#'   information generated by [country_year_coder]. The dataset has the
#'   following variables:
#'
#'   reign_cow: The COW code of the country in REIGN.
#'
#'   reign_country: The country name in REIGN.
#'
#'   Start: The start date of the regime.
#'
#'   End: The end date of the regime, or 31 December of the current year.
#'
#'   Type: The regime type. This is what the codebook says about the regime
#'   types:
#'
#'   DEMOCRACIES
#'
#'   We use a procedural definition of democracy, meaning we are interested in
#'   the institutional rules that dictate how leaders gain power and not in
#'   other correlates of democracy, including strong traditions of freedom of
#'   speech and assembly. Non-competitive single-party systems are classified as
#'   such, even if some are somewhat more liberal than others (see Botswana and
#'   Namibia). Democracies have reasonably free-and-fair competitions for
#'   political power.
#'
#'   1. Presidential Democracy: Democracy in which the executive is distinct
#'   from the legislative branch and considerable decision-making authority is
#'   granted to the executive. Presidential systems have presidents who serve as
#'   chief executives rather than figureheads.
#'
#'   2. Parliamentary Democracy: Democracy in which legislatures are more
#'   powerful and executives are less autonomous. Generally speaking, countries
#'   with powerful prime ministers and general elections are parliamentary
#'   democracies. Hybrid semi-presidential systems are classified case-by-case,
#'   but are usually grouped with parliamentary democracies.
#'
#'   NON-DEMOCRACIES
#'
#'   The Autocratic Regimes dataset by Professors Barbara Geddes, Joseph Wright,
#'   and Erica Frantz classifies all non-democratic governments into one of ten
#'   categories. Though our data differs from this dataset in important ways, it
#'   uses the same typology. We document major differences in the extended
#'   technical notes.
#'
#'   1.  Personalist Systems: Power is highly concentrated in the hands of a
#'   non-monarch dictator who is relatively unconstrained by a military or
#'   political party. Contemporary examples include Russia, Sudan, and Chad.
#'
#'   2.  Monarchies: Power is highly concentrated in the hands of a monarch who
#'   is much more than just a figurehead. Contemporary examples include
#'   Swaziland, Kuwait, and Morocco.
#'
#'   3. Single-Party Systems: Power is held by the head of a party. Executive
#'   power is effectively checked by the party or ruling committee. Contemporary
#'   examples include China, Angola, and Ethiopia.
#'
#'   4. Oligarchies: Power is held by the head of party, but unlike other
#'   single-party systems this party explicitly represents the interests of one
#'   elite segment of society. Past examples include apartheid-era South Africa
#'   and Rhodesia under Ian Smith.
#'
#'   5. Party-Personalist Hybrids: An intermediate hybrid where a party
#'   apparatus supports a dictator, yet the party's identity is concentrated
#'   around the person in power and it has few meaningful checks on executive
#'   power. Examples include Eritrea, and North Korea.
#'
#'   6. Military Juntas: A military committee runs the country. One officer
#'   typically serves as head, but this head serves the interests of the
#'   committee and his power is checked by other members of the military. Recent
#'   examples include Thailand and Algeria.
#'
#'   7. Indirect Military Juntas: The military has de facto power, but rules
#'   behind a civilian puppet. See pre-Mobutu Zaire and Suriname under Bouterse
#'   (1980-1988).
#'
#'   8. Personalist-Military Hybrids: A hybrid of military and personalist
#'   institutions in which a dictator holds most power and is relatively
#'   unchecked, yet the dictator's authority is rooted in military support.
#'   These systems often evolve from juntas when power is consolidated around a
#'   single individual. Examples include Chile under Pinochet, Pakistan under
#'   Zia and Musharraf, and Fiji under Bainimarama.
#'
#'   9. Party-Military Hybrids: Militarized single-party states in which most or
#'   all members of the ruling party are military elites. Examples include
#'   Algeria from 1962-1992, El Salvador before 1982, and Congo-Brazzaville
#'   between the 1968 coup and 1991.
#'
#'   10. Party-Personalist-Military Hybrids: A dictator rules with the support
#'   of a militarized single-party state, but is relatively unchecked by these
#'   institutions. Examples include Egypt after 1952, Indonesia under Suharto,
#'   and Syria under the Assads.
#'
#'   INTERIM PERIODS
#'
#'   Finally, we include four forms of government that are explicitly
#'   provisional or transitional:
#'
#'   1. Warlordism: occurs only in countries that are torn apart by conflict to
#'   the extent that they do not have a functional government. As of 2016, only
#'   Libya and Yemen meet this definition. War-torn countries like Syria are not
#'   included because a strong government continues to hold power in the capital
#'   and a significant part of the country.
#'
#'   2. Foreign-Occupied governments occur where foreign politicians or
#'   militaries hold de facto power over a government.
#'
#'   3. Civilian Provisional and Military Provisional governments are explicitly
#'   temporary arrangementsthat usually proceed completed transitions to
#'   democracy or follow coups and constitutional crises. Interim regimes are
#'   only called "military provisional" if the military is holding power until
#'   an election or some other formalized legitimizing event can occur.
#'
#' @template standard-variables
#' @inheritSection download_polity_annual Note
#' @export
#' @aliases reign
#'
#' @source Bell, Curtis. 2016. The Rulers, Elections, and Irregular Governance
#'   Dataset (REIGN). Broomfield, CO: OEF Research. Available at
#'   \url{http://oefresearch.org/datasets/reign}
#' @family democracy
#' @family authoritarianism
#'
#' @examples
#' \dontrun{
#' reign <- download_reign()}
download_reign <- function(url,
                           verbose = TRUE,
                           return_raw = FALSE,
                           ...) {
  if(missing(url)) {
    url <- "https://docs.google.com/spreadsheets/d/1mrtORyhXw9TJMBYLAGPrikA4VDpla_Eq7L-NsEQ5VXg/edit#gid=1765819258"

  }

  COUNTRY <- `COUNTRY CODE` <-  End <- Start <- cow <- year <- NULL

  data <- googlesheets::gs_url(url) %>%
    googlesheets::gs_read(ws = 3)

  if(return_raw) {
    if(verbose) {
      message("Returning raw data, without processing.")
    }
    return(data)
  }

  reign <- data %>%
    rename(cow = `COUNTRY CODE`) %>%
    mutate(Start = lubridate::mdy(Start),
           End = lubridate::mdy(End)) %>%
    group_by_all() %>%
    mutate(year = list(lubridate::year(Start):lubridate::year(End))) %>%
    tidyr::unnest() %>%
    ungroup() %>%
    # filter(year < lubridate::year(lubridate::now())) %>% # If excluding the 2017 countries
    country_year_coder(COUNTRY,
                       year,
                       cow,
                       code_type = "cown",
                       match_type = "country",
                       verbose = verbose,
                       ...)

  standardize_columns(reign, COUNTRY, cow, verbose = verbose)
}











