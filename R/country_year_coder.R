#' Given a set of country-years, find appropriate country codes, standardized
#' country names, and determine state system membership
#'
#' @param tbl A data frame with (at least) country and year columns.
#' @param country_col The (unquoted) name of the country column. Defaults to
#'   \code{country}. If missing, but \code{code_col} is given, the function defaults to
#'   matching only on code and does not match on country names. This saves time,
#'   but is not always possible and can introduce errors if the code column is
#'   incorrect.
#' @param date_col The (unquoted) name of the year column. Defaults to \code{year}.
#'   Must exist in \code{tbl} - otherwise just use [countrycode] if you don't care
#'   about country-year matching.
#' @param code_col The (unquoted) name of the code column. Defaults to \code{NULL}.
#' @param code_type Type of code to match on (only needed if \code{code_col} is not
#'   \code{NULL}). Defaults to "cown". Can be any unambiguous substring of the
#'   following:
#'
#'   \itemize{
#'
#'   \item "GWn": Numeric code for the country in the Gleditsch-Ward system of
#'   states (\url{http://privatewww.essex.ac.uk/~ksg/statelist.html}). This is very
#'   similar, but not identical, to the Correlates of War and Polity codes. See
#'   the vignette in this package for the differences.
#'
#'   \item "GWc": Three letter code for the country in the Gleditsch-Ward system of
#'   states (\url{http://privatewww.essex.ac.uk/~ksg/statelist.html}). This is very
#'   similar, but not identical, to the Correlates of War and Polity codes. See
#'   the vignette in this package for an overview of the differences between
#'   these systems.
#'
#'   \item "extended_GWn": Identical to \code{GWn}, but includes a number of not commonly
#'   used codes for units of doubtful sovereignty (751 for Hyderabad before its
#'   incorporation into India, 666.001 and 666.002 for Israel pre 1967 borders
#'   amd occupied territories, and 605 for Western Sahara). These codes are used
#'   in some UCDP/PRIO (\url{https://www.prio.org/Data/Armed-Conflict/UCDP-PRIO/})
#'   datasets.
#'
#'   \item "extended_GWc": Identical to \code{GWc}, but includes a number of not commonly
#'   used codes for units of doubtful sovereignty (HYD for Hyderabad before its
#'   incorporation into India, ISR.1 and ISR.2 for Israel pre 1967 borders amd
#'   occupied territories, and SAH for Western Sahara). These codes are used in
#'   some UCDP/PRIO (\url{https://www.prio.org/Data/Armed-Conflict/UCDP-PRIO/})
#'   datasets.
#'
#'   \item "cown": Numeric code for the country in the Correlates of War system of
#'   states (\url{http://www.correlatesofwar.org/data-sets/cow-country-codes}). This
#'   is very similar, but not identical, to the Gleditsch and Ward and Polity
#'   codes. See the vignette in this package for an overview of the differences
#'   between these systems.
#'
#'   \item "cowc": Three letter code for the country in the Correlates of War
#'   system of
#'   states (\url{http://www.correlatesofwar.org/data-sets/cow-country-codes}). This
#'   is very similar, but not identical, to the Gleditsch and Ward and Polity
#'   codes. See the vignette in this package for an overview of the differences
#'   between these systems.
#'
#'   \item "polity_ccode": Numeric code for the country in the Polity IV
#'   dataset (\url{http://www.systemicpeace.org/polity/polity4.htm}). This is very
#'   similar, but not identical, to the Gleditsch and Ward and COW codes. See
#'   the vignette in this package for the differences.
#'
#'   \item "polity_scode": Three letter code for the country in the Polity IV
#'   dataset (\url{http://www.systemicpeace.org/polity/polity4.htm}). This is very
#'   similar, but not identical, to the Gleditsch and Ward and COW codes. See
#'   the vignette in this package for an overview of the differences between
#'   these systems.
#'
#'   \item "eurostat": Eurostat 2-letter country code. Taken from [countrycode].
#'
#'   \item "eu28": Whether the state is a member of the European Union (as of
#'   December 2015), without special territories. Taken from [countrycode].
#'
#'   \item "fao": Food and Agriculture Organization of the United Nations numerical
#'   country code. Taken from [countrycode].
#'
#'   \item "fips105": FIPS 10-5 (Federal Information Processing Standard) 2-letter
#'   country code. Taken from [countrycode].
#'
#'   \item "icao": International Civil Aviation Organization 2-letter country code.
#'   Taken from [countrycode].
#'
#'   \item "icao_region": International Civil Aviation Organization region code.
#'   Taken from [countrycode].
#'
#'   \item "imf": International Monetary Fund numeric country code. Taken from
#'   [countrycode].
#'
#'   \item "ioc": International Olympic Committee 3-letter country code. Taken from
#'   [countrycode].
#'
#'   \item "iso2c": ISO-2 character. Taken from [countrycode].
#'
#'   \item "iso3c": ISO-3 character. Taken from [countrycode].
#'
#'   \item "iso2n": ISO-2 numeric. Taken from [countrycode].
#'
#'   \item "iso3n": ISO-3 numeric. Taken from [countrycode].
#'
#'   \item "un": United Nations numerical code. Taken from [countrycode].
#'
#'   \item "wb": World Bank (very similar but not identical to iso3c). Taken from
#'   [countrycode].
#'
#'   \item "wb_api2c": World Bank API 2 character code. Taken from [countrycode].
#'
#'   \item "wb_api3c": World Bank API 3 character code. Taken from [countrycode].
#'
#'   \item "wvs": World Values Survey numeric code. Taken from [countrycode].
#'   }
#'
#' @param to_system State system to match to. Default is Gledistsch and Ward.
#' @param include_in_output Columns to include in output. Defaults to
#'   c("extended_country_name", "GWn", "cown", "in_GW_system"), but can be any
#'   character vector containing any combination of the column names in the
#'   internal database of country codes.
#'
#'   The possibilities are:
#'
#'   \itemize{
#'
#'   \item "GW_country_name": The name of the country in the
#'   Gleditsch-Ward system of states (\url{http://privatewww.essex.ac.uk/~ksg/statelist.html})
#'   (Gleditsch and War 1999).
#'
#'   \item "extended_country_name": The name of the country in the
#'   Gleditsch-Ward system of states (\url{http://privatewww.essex.ac.uk/~ksg/statelist.html})
#'   (Gleditsch and War 1999), of the official name of the
#'   entity (for non-sovereign entities and states not in the Gleditsch and Ward
#'   system of states) or else a common name for disputed cases that do not have
#'   an official name (e.g., Western Sahara, Hyderabad).
#'
#'   \item "cow_country_name": The name of the state in the Correlates of War state
#'   system (2016 version). See
#'   \url{http://www.correlatesofwar.org/data-sets/cow-country-codes} for details. Is
#'   \code{NA} if the country is not in the COW system of states.
#'
#'   \item "polity_country_name": The name of the state in the official Polity
#'   dataset. Is \code{NA} if the country is not in Polity.
#'
#'   \item "country_name_en": The official name of the country (official short
#'   English country name), as defined by the ISO organization. Taken from [countrycode]. See also
#'   \url{https://en.wikipedia.org/wiki/ISO_3166-1}.
#'    Some names are missing because the state no longer exists or there is
#'   controversy about its sovereign status.
#'
#'   \item "GWn": Numeric code for the country in the Gleditsch-Ward system of states (\url{http://privatewww.essex.ac.uk/~ksg/statelist.html})
#'   (Gleditsch and War 1999). This is very
#'   similar, but not identical, to the Correlates of War and Polity codes. See
#'   the vignette in this package for the differences.
#'
#'   \item "extended_GWn": Identical to \code{GWn}, but includes a number of not commonly
#'   used codes for units of doubtful sovereignty (751 for Hyderabad before its
#'   incorporation into India, 666.001 and 666.002 for Israel pre 1967 borders
#'   amd occupied territories, and 605 for Western Sahara). These codes are used
#'   in some UCDP/PRIO (\url{https://www.prio.org/Data/Armed-Conflict/UCDP-PRIO/})
#'   datasets.
#'
#'   \item "GWc": Three letter code for the country in the Gleditsch-Ward system of states (\url{http://privatewww.essex.ac.uk/~ksg/statelist.html})
#'   (Gleditsch and War 1999). This is very
#'   similar, but not identical, to the Correlates of War and Polity codes. See
#'   the vignette in this package for an overview of the differences between
#'   these systems.
#'
#'   \item "extended_GWc": Identical to \code{GWc}, but includes a number of not commonly
#'   used codes for units of doubtful sovereignty (HYD for Hyderabad before its
#'   incorporation into India, 666.001 and 666.002 for Israel pre 1967 borders
#'   amd occupied territories, and 605 for Western Sahara). These codes are used
#'   in some UCDP/PRIO (\url{https://www.prio.org/Data/Armed-Conflict/UCDP-PRIO/})
#'   datasets.
#'
#'   \item "cown": Numeric code for the country in the Correlates of War system of
#'   states (\url{http://www.correlatesofwar.org/data-sets/cow-country-codes}), 2016
#'   release. This is very similar, but not identical, to the Gleditsch and Ward
#'   and Polity codes. See the vignette in this package for an overview of the
#'   differences between these systems.
#'
#'   \item "cowc": Three letter code for the country in the Correlates of War
#'   system of
#'   states (\url{http://www.correlatesofwar.org/data-sets/cow-country-codes}), 2016
#'   release. This is very similar, but not identical, to the Gleditsch and Ward
#'   and Polity codes. See the vignette in this package for an overview of the
#'   differences between these systems.
#'
#'   \item "polity_ccode": Numeric code for the country in the Polity IV
#'   dataset (\url{http://www.systemicpeace.org/polity/polity4.htm}). This is very
#'   similar, but not identical, to the Gleditsch and Ward and COW codes. See
#'   the vignette in this package for the differences.
#'
#'   \item "polity_scode": Three letter code for the country in the Polity IV
#'   dataset (\url{http://www.systemicpeace.org/polity/polity4.htm}). This is very
#'   similar, but not identical, to the Gleditsch and Ward and COW codes. See
#'   the vignette in this package for an overview of the differences between
#'   these systems.
#'
#'   \item "regex": The regular expression used to match the country name. Useful
#'   for debugging.
#'
#'   \item "GW_startdate": The entry date of the state into the international system
#'   (usually the date of independence, though there can be more than one if the
#'   country entered or exited the state system at different times), according
#'   to Gleditsch and Ward, or 1 January 1816, whichever is later. Is \code{NA} if
#'   the country was never in the Gleditsch and Ward system of states.
#'
#'   \item "GW_enddate": The exit date of the state from the international system
#'   (usually the date the state lost its independence, though there can be more
#'   than one), according to Gleditsch and Ward, or \code{NA} if the country is still
#'   in the international system as of the time the dataset was compiled. Is
#'   \code{NA} if the country was never in the Gleditsch and Ward system of states.
#'
#'   \item "cow_startdate": The entry date of the state into the international
#'   system (usually the date of independence, though there can be more than one
#'   if the country entered or exited the state system at different times),
#'   according to Correlates of War, or 1 January 1800, whichever is later. Is
#'   always \code{NA} if the country was never in the Correlates of War system of
#'   states.
#'
#'   \item "cow_enddate": The exit date of the state from the international system
#'   (usually the date the state lost its independence, though there can be more
#'   than one), according to the Correlates of War system, or \code{NA} if the
#'   country is still in the international system as of the time the dataset was
#'   compiled. Is always \code{NA} if the country was never in the Correlates of War
#'   system of states.
#'
#'   \item "official_region": Regions as defined in the World Bank Development
#'   Indicators. Taken from [countrycode].
#'
#'   \item "extended_region": The same as "official_region", except it adds region
#'   information for historical states. It assigns "Austria-Hungary" the
#'   (invented) region "Central Europe", since Hungary is assigned to Eastern
#'   Europe and Austria to Western Europe in the World Bank scheme.
#'
#'   \item "official_continent": Continents as defined in the World Bank Development
#'   Indicators. Taken from [countrycode].
#'
#'   \item "extended_continent": The same as "official_continent", except it adds
#'   continent information for historical states. Is \code{NA} only for Antarctica
#'   and a number of isolated islands.
#'
#'   \item "lon": The rough longitude of the state, obtained by geocoding the
#'   official country name via [ggmap::geocode] (with some manual adjustments
#'   for historical states).
#'
#'   \item "lat": The rough latitude of the state, obtained by geocoding the
#'   official country name via [ggmap::geocode] (with some manual adjustments
#'   for historical states).
#'
#'   \item "microstate": Whether the state is a microstate, according to Gleditsch.
#'   His tentative list of microstates is available at
#'   \url{http://privatewww.essex.ac.uk/~ksg/statelist.html}.
#'
#'   \item "in_GW_system": Whether the state is "in system" (that is, is independent
#'   and sovereign), according to Gleditsch and Ward, for a particular date.
#'
#'   \item "in_cow_system": Whether the state is "in system" (that is, is
#'   independent and sovereign), according to the Correlates of War system, for
#'   a particular date.
#'
#'   \item "in_polity_system": Whether the state is "in system" (that is, is
#'   independent and sovereign), according to the Polity IV system, for a
#'   particular date.
#'
#'   \item ar5: IPCC's regional mapping used both in the Fifth Assessment Report
#'   (AR5) and for the Reference Concentration Pathways (RCP). Taken from
#'   [countrycode].
#'
#'   \item continent: Continent as defined in the World Bank Development Indicators.
#'   Taken from [countrycode].
#'
#'   \item "eurocontrol_pru": European Organisation for the Safety of Air Navigation
#'   region. Taken from [countrycode].
#'
#'   \item "eurocontrol_statfor": European Organisation for the Safety of Air
#'   Navigation region. Taken from [countrycode].
#'
#'   \item "eurostat": Eurostat 2-letter country code. Taken from [countrycode].
#'
#'   \item "eu28": Whether the state is a member of the European Union (as of
#'   December 2015), without special territories. Taken from [countrycode].
#'
#'   \item "fao": Food and Agriculture Organization of the United Nations numerical
#'   country code. Taken from [countrycode].
#'
#'   \item "fips105": FIPS 10-5 (Federal Information Processing Standard) 2-letter
#'   country code. Taken from [countrycode].
#'
#'   \item "icao": International Civil Aviation Organization 2-letter country code.
#'   Taken from [countrycode].
#'
#'   \item "icao_region": International Civil Aviation Organization region code. Taken
#'   from [countrycode].
#'
#'   \item "imf": International Monetary Fund numeric country code. Taken from
#'   [countrycode].
#'
#'   \item "ioc": International Olympic Committee 3-letter country code. Taken from
#'   [countrycode].
#'
#'   \item "iso2c": ISO-2 character. Taken from [countrycode].
#'
#'   \item "iso3c": ISO-3 character. Taken from [countrycode].
#'
#'   \item "iso2n": ISO-2 numeric. Taken from [countrycode].
#'
#'   \item "iso3n": ISO-3 numeric. Taken from [countrycode].
#'
#'   \item "un": United Nations numerical code. Taken from [countrycode].
#'
#'   \item "wb": World Bank (very similar but not identical to iso3c). Taken from
#'   [countrycode].
#'
#'   \item "wb_api2c": World Bank API 2 character code. Taken from [countrycode].
#'
#'   \item "wb_api3c": World Bank API 3 character code. Taken from [countrycode].
#'
#'   \item "wvs": World Values Survey numeric code. Taken from [countrycode].
#'
#'   \item "country_name_ar": country name (Arabic). Taken from [countrycode].
#'
#'   \item "country_name_de": country name (German). Taken from [countrycode].
#'
#'   \item "country_name_es": country name (Spanish). Taken from [countrycode].
#'
#'   \item "country_name_fr": country name (French). Taken from [countrycode].
#'
#'   \item "country_name_ru": country name (Russian). Taken from [countrycode].
#'
#'   \item "country_name_zh": country name (Chinese). Taken from [countrycode].
#'   }
#'
#' @param match_type How to match countries when provided with a code column;
#'   the possible options are "country and code" (looks at the country column as
#'   well as the code column, if the latter is supplied) or "code only" (matches
#'   only on the code column). The latter option should only be used if you are
#'   confident about the code column being accurate and not missing any codes,
#'   or if not country name column is present. Default is "country and code".
#'   Can be abbreviated (e.g., "country" is the same as "country and code")
#'
#' @param debug Returns additional columns useful for debugging. Default is
#'   \code{FALSE}.
#' @param verbose Prints information about countries matched multiple times,
#'   name changes, and other problems encountered while processing the data.
#'   Default is \code{TRUE}.
#' @param match_final_year Whether to classify the final year of a country as
#'   "in system". For example, if \code{TRUE}, the country-year pair "Republic of
#'   Vietnam 1975"  will appear as "in system" in 1975, though the country ended
#'   in 1975; if \code{FALSE} it will appear as not in system, as the Republic of
#'   Vietnam (South Vietnam) ceased to exist by the end of 1975. Use with care;
#'   this may result in multiple matches. Default is \code{FALSE}.
#'
#' @return a tidy data frame of country-years merged with information about the
#'   system of states (GWn, COW, or Polity IV), country codes, and standardized
#'   country names.
#' @export
#'
#' @import dplyr
#' @importFrom countrycode countrycode
#' @importFrom tidyr unnest
#' @importFrom tidyr nest
#' @importFrom lubridate now
#' @importFrom lubridate ymd
#' @importFrom lubridate interval
#' @importFrom lubridate as_date
#' @importFrom lubridate floor_date
#' @importFrom lubridate ceiling_date
#' @importFrom lubridate days
#' @import stringr
#' @import rlang
#'
#' @examples
#' \dontrun{
#' library(dplyr)
#' library(haven)
#' bmr <- read_stata("https://sites.google.com/site/mkmtwo/democracy-v2.0.dta?attredirects=0") %>%
#'   as_factor()
#' country_year_coder(bmr, code_col = ccode, code_type = "polity")}
country_year_coder <-  function(tbl,
                          country_col,
                          date_col,
                          code_col,
                          code_type = "cown",
                          to_system = c("GW", "polity", "cow"),
                          match_type = c("country and code", "code only"),
                          include_in_output = c("extended_country_name",
                                                "GWn", "cown", "in_GW_system"),
                          verbose = TRUE,
                          debug = FALSE,
                          match_final_year = FALSE) {


# A hack to pass R CMD check ----------------------------------------------

country <- year <- GW_membership <- cow_membership <- NULL
polity_membership <- matches_code <- matches_code_year <- NULL
matches_country_year <- NULL
startdate <- enddate <- GW_country_name <- matches_code_year <- NULL
matches_code_year_GW <- matches_code_year_polity <- matches_code_year_cow <- matches_code_year <- NULL
matches_country_year_polity <- matches_country_year_GW <- matches_country_year_polity <- NULL
matches_code_year_unofficial <- matches_country_year_unofficial <- NULL
matches_country_year_cow <- total_system_matches <- unofficial_startdate <- NULL
in_GW_system <- in_cow_system <- in_polity_system <- NULL
GW_startdate <- GW_enddate <- polity_startdate <- polity_enddate <- NULL
cow_startdate <- cow_enddate <- NULL

# Extract and check arguments ---------------------------------------------

  if(!missing(country_col)) {
    country_col <- enquo(country_col)
  }

  date_col <- enquo(date_col)

  match_type <- match.arg(match_type)
  to_system <- match.arg(to_system)
  code_type <- match.arg(code_type, choices = c("cown", "GWn", "extended_GWn",
                                                "cowc", "GWc", "extended_GWc",
                                                "eurostat", "fao", "fips105",
                                                "imf", "ioc", "iso2c",
                                                "iso3c", "iso3n",
                                                "polity_ccode", "polity_scode",
                                                "un", "wb", "wb_api2c",
                                                "wb_api3c", "wvs"))

# Prepare the dictionary (fix dates, select variables, etc.) --------------

  dict <- prepare_dict(to_system, match_final_year)

# Match on code only ------------------------------------------------------

  if(match_type == "code only") {
    if(missing(code_col)) {
      stop("To match on code, a code column must be supplied.")
    }
    if(verbose) {
      message(sprintf("Matching on code type %s", code_type))
    }

    code_col <- enquo(code_col)

    if(missing(country_col)) {
      code_years <- tbl %>%
        select(!!code_col, !!date_col) %>%
        distinct()
    } else {
      code_years <- tbl %>%
        select(!!country_col, !!code_col, !!date_col) %>%
        distinct()
    }


    result_df <- code_year_match(data = code_years,
                                 dict = dict,
                                 code_col = !!code_col,
                                 date_col = !!date_col,
                                 code_type = code_type,
                                 to_system = to_system)

    result_df <- result_df %>%
      mutate(matches_country = FALSE,
             matches_country_year = FALSE,
             matches_code = ifelse(is.na(matches_code),
                                   FALSE, matches_code),
             matches_code_year = ifelse(is.na(matches_code_year),
                                        FALSE, matches_code_year),
             !!code_type := ifelse(matches_code, !!code_col, NA))


  }


# Match on country years --------------------------------------------------

  if(match_type != "code only") {
    if(missing(code_col)) {
      country_years <- tbl %>%
        select(!!country_col, !!date_col) %>%
        distinct()

      result_df <- country_year_match(data = country_years,
                                      dict = dict,
                                      country_col = !!country_col,
                                      date_col = !!date_col,
                                      code_type = code_type,
                                      to_system = to_system)

    } else {
      code_col <- enquo(code_col)

      country_years <- tbl %>%
        select(!!country_col, !!date_col, !!code_col) %>%
        distinct()

      result_df <- country_year_match(data = country_years,
                                      dict = dict,
                                      country_col = !!country_col,
                                      code_col = !!code_col,
                                      date_col = !!date_col,
                                      code_type = code_type,
                                      to_system = to_system)

      }
    }



# Fix up results ----------------------------------------------------------


  startdate_col <- parse_expr(paste(to_system, "startdate", sep = "_"))

  enddate_col <- parse_expr(paste(to_system, "enddate", sep = "_"))

  if(!missing(code_col) & !missing(country_col)) {
    result_df <- result_df %>%
      group_by(!!country_col, !!code_col, !!date_col)
  } else if(!missing(code_col) & missing(country_col)) {
    result_df <- result_df %>%
      group_by(!!code_col, !!date_col)
  } else {
    result_df <- result_df %>%
      group_by(!!country_col, !!date_col)
  }

  if(missing(code_col)) {
    result_df$matches_code_year_GW <- FALSE
    result_df$matches_code_year_cow <- FALSE
    result_df$matches_code_year_polity <- FALSE
    result_df$matches_code_year_unofficial <- FALSE
  }

  if(missing(country_col) | match_type == "code only") {
    result_df$matches_country_year_GW <- FALSE
    result_df$matches_country_year_cow <- FALSE
    result_df$matches_country_year_polity <- FALSE
    result_df$matches_country_year_unofficial <- FALSE

  }

  to_system_col <- parse_expr(paste("in", to_system, "system", sep = "_"))

  result_df <- result_df %>%
    mutate(in_GW_system = matches_code_year_GW & GW_membership |
             matches_country_year_GW & GW_membership,
           in_polity_system = matches_code_year_polity & polity_membership |
             matches_country_year_polity & polity_membership,
           in_cow_system = matches_code_year_cow & cow_membership |
             matches_country_year_cow & cow_membership,
           total_system_matches = total_system_matches +
             in_GW_system + in_polity_system + in_cow_system + !!to_system_col)

  result_df <- result_df %>%
    filter(test_condition(as.integer(!!date_col), startdate,
                          enddate,
                          GW_startdate,
                          GW_enddate,
                          polity_startdate,
                          polity_enddate,
                          cow_startdate,
                          cow_enddate,
                          total_system_matches)) %>%
    ungroup()

  if(!missing(code_col) & !missing(country_col)) {
    result_df <- result_df %>%
      select(!!country_col, !!code_col, !!date_col, include_in_output, starts_with("matches_"))
  } else if(!missing(code_col) & missing(country_col)) {
    result_df <- result_df %>%
      select(!!code_col, !!date_col, include_in_output, starts_with("matches_"))
  } else {
    result_df <- result_df %>%
      select(!!country_col, !!date_col, include_in_output, starts_with("matches_"))
  }

  if(!debug) {
    result_df <- result_df %>%
      select(-starts_with("matches_"))
  }

  if(!missing(country_col) & match_type != "code only" & missing(code_col)) {
    join_by <- c(quo_name(country_col), quo_name(date_col))
  } else if(!missing(code_col) & match_type != "code only") {
    join_by <- c(quo_name(country_col), quo_name(code_col), quo_name(date_col))

  } else if(match_type  == "code only" & missing(country_col)) {
    join_by <- c(quo_name(code_col), quo_name(date_col))
  } else if(match_type  == "code only" & !missing(country_col)) {
    join_by <- c(quo_name(country_col), quo_name(code_col), quo_name(date_col))
  }

  suppressWarnings(tbl <- left_join(tbl, result_df, by = join_by))



# Print diagnostics -------------------------------------------------------

  if(verbose) {
    if(!missing(country_col) & missing(code_col)) {
      print_diagnostic(tbl,
                       country_col = !!country_col,
                       date_col = !!date_col)
    } else if(!missing(country_col) & !missing(code_col)) {
      print_diagnostic(tbl,
                       country_col = !!country_col,
                       code_col = !!code_col,
                       date_col = !!date_col)
    } else {
      print_diagnostic(tbl,
                       code_col = !!code_col,
                       date_col = !!date_col)

    }
  }

  tbl %>% distinct()

}


# Matching functions ------------------------------------------------------

code_year_match <- function(data, dict, date_col, code_col, code_type,
                            to_system) {

  startdate <- enddate <- GW_startdate <- GW_enddate <- NULL
  polity_startdate <- polity_enddate <- cow_startdate <- cow_enddate <- NULL
  matches_code_year_GW <- matches_code_year_polity <- matches_code_year_cow <- NULL
  total_system_matches <- matches_code_year_unofficial <- NULL
  unofficial_enddate <- unofficial_startdate <- matches_code_year <- NULL
  matches_before_code_year <- matches_before_code_year_GW <- NULL
  matches_before_code_year_cow <- matches_before_code_year_polity <- NULL
  matches_between_code_year <- matches_between_code_year_GW <- NULL
  matches_between_code_year_cow <- matches_between_code_year_polity <- NULL
  matches_after_code_year <- matches_after_code_year_GW <- NULL
  matches_after_code_year_cow <- matches_after_code_year_polity <- NULL
  total_matches_before <- total_matches_between <- total_matches_after <- NULL


  date_col <- enquo(date_col)
  code_col <- enquo(code_col)

  names(code_type) <- quo_name(code_col)

  if(!is.character(data[[quo_name(code_col)]])) {
    data[[quo_name(code_col)]] <- as.numeric(data[[quo_name(code_col)]])
  }


  suppressWarnings(code_matches <- data %>%
                     filter(!is.na(UQ(code_col))) %>%
                     left_join(dict, by = code_type) %>%
                     mutate(matches_code = (!is.na(UQ(code_col)))))

  today <- floor_date(now(), unit = "day")

  code_matches <- code_matches %>%
    mutate(matches_code_year = year_match_fun(!!date_col, startdate, enddate),
           matches_code_year_GW = year_match_fun(!!date_col, GW_startdate, GW_enddate),
           matches_code_year_polity = year_match_fun(!!date_col, polity_startdate, polity_enddate),
           matches_code_year_cow = year_match_fun(!!date_col, cow_startdate, cow_enddate),
           matches_code_year_unofficial = year_match_fun(!!date_col, unofficial_startdate, unofficial_enddate),
           matches_before_code_year = is_before(!!date_col, startdate) & !matches_code_year,
           matches_before_code_year_GW = is_before(!!date_col, GW_startdate) & !matches_code_year_GW,
           matches_before_code_year_cow = is_before(!!date_col, cow_startdate) & !matches_code_year_cow,
           matches_before_code_year_polity = is_before(!!date_col, polity_startdate) & !matches_code_year_polity,
           matches_between_code_year = is_between(!!date_col, startdate, enddate) & !matches_code_year,
           matches_between_code_year_GW = is_between(!!date_col, GW_startdate, GW_enddate) & !matches_code_year_GW,
           matches_between_code_year_cow = is_between(!!date_col, cow_startdate, cow_enddate) & !matches_code_year_cow,
           matches_between_code_year_polity = is_between(!!date_col, polity_startdate, polity_enddate) & !matches_code_year_polity,
           matches_after_code_year = distance_after(!!date_col, enddate),
           matches_after_code_year_GW = distance_after(!!date_col, GW_enddate),
           matches_after_code_year_cow = distance_after(!!date_col, cow_enddate),
           matches_after_code_year_polity = distance_after(!!date_col, polity_enddate),
           total_system_matches = matches_code_year_GW +
             matches_code_year_polity + matches_code_year_cow +
             matches_code_year_unofficial,
           total_matches_before = matches_before_code_year +
             matches_before_code_year_GW +
             matches_before_code_year_cow +
             matches_before_code_year_polity,
           total_matches_between = matches_between_code_year +
             matches_between_code_year_GW +
             matches_between_code_year_cow +
             matches_between_code_year_polity,
           total_matches_after = matches_after_code_year +
             matches_after_code_year_GW +
             matches_after_code_year_cow +
             matches_after_code_year_polity) %>%
    group_by(!!code_col, !!date_col) %>%
    filter(total_system_matches == max(total_system_matches)) %>%
    filter(total_matches_between == max(total_matches_between)) %>%
    filter(total_matches_before == max(total_matches_before)) %>%
    filter(total_matches_after == max(total_matches_after)) %>%
    ungroup()

  code_matches

}

country_year_match <- function(data, dict, country_col,
                               date_col, code_col, code_type,
                               to_system) {

  GW_enddate <- GW_startdate <- GWn <- country <- cow_enddate <- NULL
  cow_startdate <- enddate <- eurostat <- NULL
  matches_code <- matches_code_year <- matches_code_year_GW <- NULL
  matches_code_year_cow <- matches_code_year_polity <- matches_country_year <- NULL
  matches_country_year_GW <- matches_country_year_cow <- matches_country_year_polity <- NULL
  polity_ccode <- polity_enddate <- polity_scode <- polity_startdate <- NULL
  startdate <- total_system_matches <- year <- NULL
  matches_code_year_unofficial <- matches_country_year_unofficial <- NULL
  unofficial_startdate <- unofficial_enddate <- NULL
  matches_before_country_year <- matches_before_country_year_GW <- NULL
  matches_before_country_year_cow <- matches_before_country_year_polity <- NULL
  matches_between_country_year <- matches_between_country_year_GW <- NULL
  matches_between_country_year_cow <- matches_between_country_year_polity <- NULL
  matches_after_country_year <- matches_after_country_year_GW <- NULL
  matches_after_country_year_cow <- matches_after_country_year_polity <- NULL
  total_matches_before <- total_matches_between <- total_matches_after <- NULL

  country_col <- enquo(country_col)
  date_col <- enquo(date_col)

  join_by <- "regex"
  names(join_by) <- quo_name(country_col)

  suppressWarnings(country_matches <- data %>%
                     fuzzyjoin::regex_full_join(dict, by = join_by,
                                     ignore_case = TRUE) %>%
                     filter(!is.na(UQ(country_col))))

  if(!missing(code_col)) {
    code_col <- enquo(code_col)
    code_type <- parse_expr(code_type)

    country_matches <- country_matches %>%
      mutate(matches_code = (UQ(code_col) == UQ(code_type)),
             matches_code = ifelse(is.na(matches_code), FALSE, matches_code))

  } else {
    country_matches <- country_matches %>%
      mutate(matches_code = FALSE)
  }

  today <- as_date(floor_date(now(),unit = "day"))

  country_matches <- country_matches %>%
    mutate(matches_country_year = year_match_fun(!!date_col, startdate, enddate),
           matches_country_year_GW = year_match_fun(!!date_col, GW_startdate, GW_enddate),
           matches_country_year_polity = year_match_fun(!!date_col, polity_startdate, polity_enddate),
           matches_country_year_cow = year_match_fun(!!date_col, cow_startdate, cow_enddate),
           matches_country_year_unofficial = year_match_fun(!!date_col, unofficial_startdate, unofficial_enddate),
           matches_code_year = matches_code & matches_country_year,
           matches_code_year_GW = matches_code & matches_country_year_GW,
           matches_code_year_polity = matches_code & matches_country_year_polity,
           matches_code_year_cow = matches_code & matches_country_year_cow,
           matches_code_year_unofficial = matches_code & matches_country_year_unofficial,
           matches_before_country_year = is_before(!!date_col, startdate),
           matches_before_country_year_GW = is_before(!!date_col, GW_startdate),
           matches_before_country_year_cow = is_before(!!date_col, cow_startdate),
           matches_before_country_year_polity = is_before(!!date_col, polity_startdate),
           matches_between_country_year = is_between(!!date_col, startdate, enddate) & !matches_country_year,
           matches_between_country_year_GW = is_between(!!date_col, GW_startdate, GW_enddate) & !matches_country_year_GW,
           matches_between_country_year_cow = is_between(!!date_col, cow_startdate, cow_enddate) & !matches_country_year_cow,
           matches_between_country_year_polity = is_between(!!date_col, polity_startdate, polity_enddate) & !matches_country_year_polity,
           matches_after_country_year = distance_after(!!date_col, enddate),
           matches_after_country_year_GW = distance_after(!!date_col, GW_enddate),
           matches_after_country_year_cow = distance_after(!!date_col, cow_enddate),
           matches_after_country_year_polity = distance_after(!!date_col, polity_enddate),
           total_system_matches = matches_code +
             matches_country_year +
             matches_country_year_GW +
             matches_country_year_polity +
             matches_country_year_cow +
             matches_country_year_unofficial +
             matches_code_year +
             matches_code_year_GW +
             matches_code_year_polity +
             matches_code_year_cow +
             matches_code_year_unofficial,
           total_matches_before = matches_before_country_year +
             matches_before_country_year_GW +
             matches_before_country_year_cow +
             matches_before_country_year_polity,
           total_matches_between = matches_between_country_year +
             matches_between_country_year_GW +
             matches_between_country_year_cow +
             matches_between_country_year_polity,
           total_matches_after = matches_after_country_year +
             matches_after_country_year_GW +
             matches_after_country_year_cow +
             matches_after_country_year_polity) %>%
    group_by(!!country_col, !!date_col)

  if(!missing(code_col)) {
    country_matches <- country_matches %>%
      group_by(!!code_col, .add = TRUE)
  }

  country_matches <- country_matches %>%
    filter(total_system_matches == max(total_system_matches)) %>%
    filter(total_matches_between == max(total_matches_between)) %>%
    filter(total_matches_before == max(total_matches_before)) %>%
    filter(total_matches_after == max(total_matches_after)) %>%
    ungroup()

  country_matches
}

year_match_fun <- function(date_col, startdate, enddate) {

  today <- as_date(floor_date(now(),unit = "day"))

  result <- ymd(paste0(date_col, "-12-31")) %within%
    interval(startdate, case_when(is.na(enddate) ~ today,
                                  TRUE ~ enddate))

  # Replace any NA values in result with FALSE
  case_when(is.na(result) ~ FALSE,
            TRUE ~ result)

}

# Define a function that checks if a date is before a start date
is_before <- function(date_col, startdate) {

  # Get today's date
  today <- as_date(floor_date(now(), unit = "day"))

  # Create a logical vector indicating whether the date in date_col is before the startdate
  result <- ymd(paste0(date_col, "-12-31")) < case_when(is.na(startdate) ~ today,
                                                        TRUE ~ startdate)

  # Replace any NA values in result with FALSE
  case_when(is.na(result) ~ FALSE,
            TRUE ~ result)

}

# Define a function that checks whether a date is between a start date and an end date
is_between <- function(date_col, startdate, enddate) {

  # Get today's date
  today <- as_date(floor_date(now(), unit = "day"))

  # Create a tibble with the date_col, startdate, and enddate columns
  result <- tibble(date_col = ymd(paste0(date_col, "-12-31")),
                   startdate = startdate,
                   enddate = enddate) %>%
    # Group by the date_col
    group_by(date_col) %>%
    # Add a column indicating whether the date is between the start and end dates
    mutate(between = (date_col > min(startdate) &
                        date_col < max(startdate) &
                        date_col > min(enddate))) %>%
    # Extract the between column
    pull(between)

  # Replace any NA values in result with FALSE
  case_when(is.na(result) ~ FALSE,
            TRUE ~ result)

}

distance_after <- function(date_col, enddate) {

  # Get today's date
  today <- as_date(floor_date(now(), unit = "day"))

  # Calculate the difference in days between the date in date_col and the enddate
  result <- ymd(paste0(date_col, "-12-31")) - case_when(is.na(enddate) ~ today,
                                                        TRUE ~ enddate)

  # Replace negative values with 0
  result[ result < 0 ] <- 0

  # Change the sign of non-missing values
  -result

}

# Helper functions --------------------------------------------------------


prepare_dict <- function(to_system, match_final_year) {
  startdate <- GW_startdate <- cow_startdate <- NULL
  polity_startdate <- unofficial_startdate <- NULL
  enddate <- GW_enddate <- cow_enddate <- NULL
  polity_enddate <- unofficial_enddate <- NULL

  dict <- data

  if(match_final_year) {
    dict <- dict %>%
      mutate_at(c("GW_enddate",
                  "cow_enddate",
                  "polity_enddate",
                  "unofficial_enddate"),
                ~ceiling_date(., unit = "year") - days(1))
  }


  dict$startdate <- dict[[paste(to_system, "startdate", sep ="_")]]
  dict$enddate <- dict[[paste(to_system, "enddate", sep ="_")]]

  today <- as_date(floor_date(now(),unit = "day"))

  dict <- dict %>%
    mutate(enddate = if_else(is.na(enddate) & !is.na(startdate), today, enddate)) %>%
    group_by_all() %>%
    mutate(interval = list(c(startdate,enddate)),
           GW_interval = list(c(GW_startdate,GW_enddate)),
           cow_interval = list(c(cow_startdate,cow_enddate)),
           polity_interval = list(c(polity_startdate,polity_enddate))) %>%
    ungroup()

  dict
}

print_diagnostic <- function(tbl, country_col, code_col, date_col, print_as_table = TRUE) {

  tbl <- tbl %>%
    distinct()

  date_col <- enquo(date_col)
  matched_cols <- names(tbl)[ names(tbl) %in% names(data) ]
  matched_country_col <- parse_expr(matched_cols[ grepl("country", matched_cols) ][1])


  if(missing(country_col)) {

    code_col <- enquo(code_col)

    multiple_matches <- tbl %>%
      group_by(!!code_col, !!date_col) %>%
      filter(n() > 1) %>%
      group_by(!!code_col) %>%
      group_by_at(.vars = vars(matched_cols), .add = TRUE) %>%
      summarise(min_date = min(!!date_col),
                max_date  = max(!!date_col),
                n = n())

    multiple_matches_2 <- tbl %>%
      group_by(!!date_col) %>%
      group_by_at(.vars = vars(matched_cols), .add = TRUE) %>%
      filter(n() > 1, !is.na(!!matched_country_col)) %>%
      group_by(!!code_col) %>%
      group_by_at(.vars = vars(matched_cols), .add = TRUE) %>%
      summarise(min_date = min(!!date_col),
                max_date  = max(!!date_col),
                n = n())

    not_matched <- tbl %>%
      filter(is.na(!!matched_country_col)) %>%
      group_by(!!code_col) %>%
      group_by_at(vars(matched_cols), .add = TRUE)  %>%
      summarise(min_date = min(!!date_col),
                max_date  = max(!!date_col),
                n = n())

  } else if(missing(code_col)) {

    country_col <- enquo(country_col)

    multiple_matches <- tbl %>%
      group_by(!!country_col, !!date_col) %>%
      filter(n() > 1) %>%
      group_by(!!country_col) %>%
      group_by_at(.vars = vars(matched_cols), .add = TRUE) %>%
      summarise(min_date = min(!!date_col),
                max_date  = max(!!date_col),
                n = n())

    multiple_matches_2 <- tbl %>%
      group_by(!!date_col) %>%
      group_by_at(.vars = vars(matched_cols), .add = TRUE) %>%
      filter(n() > 1, !is.na(!!matched_country_col)) %>%
      group_by(!!country_col) %>%
      group_by_at(.vars = vars(matched_cols), .add = TRUE) %>%
      summarise(min_date = min(!!date_col),
                max_date  = max(!!date_col),
                n = n())

    not_matched <- tbl %>%
      filter(is.na(!!matched_country_col)) %>%
      group_by(!!country_col)  %>%
      group_by_at(vars(matched_cols), .add = TRUE)  %>%
      summarise(min_date = min(!!date_col),
                max_date  = max(!!date_col),
                n = n())

  } else {

    country_col <- enquo(country_col)

    code_col <- enquo(code_col)

    multiple_matches <- tbl %>%
      group_by(!!country_col, !!code_col, !!date_col) %>%
      filter(n() > 1) %>%
      group_by(!!country_col, !!code_col) %>%
      group_by_at(.vars = vars(matched_cols), .add = TRUE) %>%
      summarise(min_date = min(!!date_col),
                max_date  = max(!!date_col),
                n = n())

    multiple_matches_2 <- tbl %>%
      group_by(!!date_col) %>%
      group_by_at(.vars = vars(matched_cols), .add = TRUE) %>%
      filter(n() > 1, !is.na(!!matched_country_col)) %>%
      group_by(!!country_col, !!code_col) %>%
      group_by_at(.vars = vars(matched_cols), .add = TRUE) %>%
      summarise(min_date = min(!!date_col),
                max_date  = max(!!date_col),
                n = n())

    not_matched <- tbl %>%
      filter(is.na(!!matched_country_col)) %>%
      group_by(!!country_col, !!code_col)  %>%
      group_by_at(vars(matched_cols), .add = TRUE)  %>%
      summarise(min_date = min(!!date_col),
                max_date  = max(!!date_col),
                n = n())
  }


  if(!missing(country_col) & !missing(code_col)) {
    country_name_changes <- tbl %>%
      filter(stringr::str_to_lower(!!country_col) !=
               stringr::str_to_lower(!!matched_country_col)) %>%
      group_by(!!country_col, !!code_col) %>%
      group_by_at(vars(matched_cols), .add = TRUE)  %>%
      summarise(min_date = min(!!date_col),
                max_date  = max(!!date_col),
                n = n())
  } else if(!missing(country_col)) {
    country_name_changes <- tbl %>%
      filter(stringr::str_to_lower(!!country_col) !=
               stringr::str_to_lower(!!matched_country_col)) %>%
      group_by(!!country_col) %>%
      group_by_at(vars(matched_cols), .add = TRUE)  %>%
      summarise(min_date = min(!!date_col),
                max_date  = max(!!date_col),
                n = n())
  } else {
    country_name_changes <- tibble()
  }

  if(nrow(multiple_matches) > 0) {
    if(print_as_table) {
      message("The following country and/or code-years were matched more than once:")
      print(knitr::kable(multiple_matches),
            caption = "The following country and/or code-years were matched more than once:")

    } else {
      print("The following country and/or code-years were matched more than once:")
      print(multiple_matches)
    }

  }

  if(nrow(multiple_matches_2) > 0) {
    if(print_as_table) {
      message("The following different countries/country codes match to a single country unit in the destination system:")
      print(knitr::kable(multiple_matches_2),
            caption = "The following different countries/country codes match to a single country unit in the destination system:")

    } else {
      print("The following different countries/country codes match to a single country unit in the destination system:")
      print(multiple_matches_2)
    }
  }

  if(nrow(not_matched) > 0) {
    if(print_as_table) {
      message("The following country and/or code-years were not matched:")
      print(knitr::kable(not_matched),
            caption = "The following country and/or code-years were not matched:")

    } else {
      print("The following country and/or code-years were not matched:")
      print(not_matched)
    }
  }

  if(nrow(country_name_changes) > 0) {
    if(print_as_table) {
      message("The following country names are different in the destination system:")
      print(knitr::kable(country_name_changes),
            caption = "The following country names are different in the destination system:")

    } else {
      print("The following country names are different in the destination system:")
      print(country_name_changes)
    }
  }

}

test_condition <- function(date_col,
                           startdate,
                           enddate,
                           GW_startdate,
                           GW_enddate,
                           polity_startdate,
                           polity_enddate,
                           cow_startdate,
                           cow_enddate,
                           total_system_matches) {

  if(length(total_system_matches) == 1) {
    return(TRUE)
  }

  GW_startdate <- case_when(is.na(GW_startdate) ~ as.Date(lubridate::now()),
                            TRUE ~ GW_startdate)

  GW_enddate <- case_when(is.na(GW_enddate) ~ as.Date(lubridate::now()),
                          TRUE ~ GW_enddate)

  cow_startdate <- case_when(is.na(cow_startdate) ~ as.Date(lubridate::now()),
                             TRUE ~ cow_startdate)

  cow_enddate <- case_when(is.na(cow_enddate) ~ as.Date(lubridate::now()),
                           TRUE ~ cow_enddate)

  polity_startdate <- case_when(is.na(polity_startdate) ~ as.Date(lubridate::now()),
                                TRUE ~ polity_startdate)

  polity_enddate <- case_when(is.na(polity_enddate) ~ as.Date(lubridate::now()),
                              TRUE ~ polity_enddate)


  before_GW <- unique(ymd(paste0(date_col,"-12-31"))) < min(GW_startdate, na.rm = TRUE)
  before_cow <- unique(ymd(paste0(date_col,"-12-31"))) < min(cow_startdate, na.rm = TRUE)
  before_polity <- unique(ymd(paste0(date_col,"-12-31"))) < min(polity_startdate, na.rm = TRUE)

  before_return <- TRUE

  if(before_GW) {
    # Country year falls before the entry of the country into the system
    before_return <- (GW_startdate == min(GW_startdate, na.rm = TRUE)) & before_return
  }

  if(before_cow) {
    # Country year falls before the entry of the country into the system
    before_return <- (cow_startdate == min(cow_startdate, na.rm = TRUE)) & before_return
  }

  if(before_polity) {
    # Country year falls before the entry of the country into the system
    before_return <- (polity_startdate == min(polity_startdate, na.rm = TRUE)) & before_return
  }

  if(sum(before_return) == 1) {
    return(before_return)
  }

  after_GW <- unique(ymd(paste0(date_col,"-12-31"))) > max(GW_enddate, na.rm = TRUE)
  after_cow <- unique(ymd(paste0(date_col,"-12-31"))) > max(cow_enddate, na.rm = TRUE)
  after_polity <- unique(ymd(paste0(date_col,"-12-31"))) > max(polity_enddate, na.rm = TRUE)

  if(after_GW | after_cow | after_polity) {
    # Country year falls after the exit of the country into the system
    return((GW_enddate == max(GW_enddate, na.rm = TRUE)) &
             (cow_enddate == max(cow_enddate, na.rm = TRUE)) &
             (polity_enddate == max(polity_enddate, na.rm = TRUE)))
  }

  startdate <- case_when(is.na(startdate) ~ as.Date(lubridate::now()),
                         TRUE ~ startdate)

  enddate <- case_when(is.na(enddate) ~ as.Date(lubridate::now()),
                       TRUE ~ enddate)

  if(unique(ymd(paste0(date_col,"-12-31"))) > min(startdate, na.rm = TRUE) &
     unique(ymd(paste0(date_col,"-12-31"))) < max(startdate, na.rm = TRUE) &
     unique(ymd(paste0(date_col,"-12-31"))) > min(enddate, na.rm = TRUE)) {
    # Country-year falls between periods
    return(startdate == min(startdate, na.rm = TRUE) &
             enddate == min(enddate, na.rm = TRUE))
  }

  between_GW <- unique(ymd(paste0(date_col,"-12-31"))) > min(GW_startdate, na.rm = TRUE) &
    unique(ymd(paste0(date_col,"-12-31"))) < max(GW_startdate, na.rm = TRUE) &
    unique(ymd(paste0(date_col,"-12-31"))) > min(GW_enddate, na.rm = TRUE)

  between_cow <- unique(ymd(paste0(date_col,"-12-31"))) > min(cow_startdate, na.rm = TRUE) &
    unique(ymd(paste0(date_col,"-12-31"))) < max(cow_startdate, na.rm = TRUE) &
    unique(ymd(paste0(date_col,"-12-31"))) > min(cow_enddate, na.rm = TRUE)

  between_polity <- unique(ymd(paste0(date_col,"-12-31"))) > min(polity_startdate, na.rm = TRUE) &
    unique(ymd(paste0(date_col,"-12-31"))) < max(polity_startdate, na.rm = TRUE) &
    unique(ymd(paste0(date_col,"-12-31"))) > min(polity_enddate, na.rm = TRUE)

  if(between_GW | between_polity | between_cow) {
    return_value <- (GW_startdate == min(GW_startdate, na.rm = TRUE) &
                       GW_enddate == min(GW_enddate, na.rm = TRUE) &
                       cow_startdate == min(cow_startdate, na.rm = TRUE) &
                       cow_enddate == min(cow_enddate, na.rm = TRUE) &
                       polity_startdate == min(polity_startdate, na.rm = TRUE) &
                       polity_enddate == min(polity_enddate, na.rm = TRUE))
    # Country year falls between two in-system dates
    return(return_value)
  } else {
    return(TRUE)
  }
}




