# Functions for downloading and processing other datasets -----------------

#'Downloads the 2020 update of the Polity 5 dataset (annual time series) and
#'processes it using [country_year_coder]
#'
#'The original data is available at
#'[http://www.systemicpeace.org/inscrdata.html](http://www.systemicpeace.org/inscrdata.html)
#'
#'@param url The URL of the dataset. Defaults to
#'  http://www.systemicpeace.org/inscr/p5v2018.sav
#'@inheritParams redownload_blm
#'
#'@return The annual time series version of the Polity 5 dataset, as a [tibble],
#'  with the additional columns produced by [country_year_coder]. Consult the
#'  [Polity 5 codebook](http://www.systemicpeace.org/inscr/p5manualv2018.pdf)
#'  for further description.
#'
#'@section Variables:
#'
#'  \describe{
#'
#'  \item{p5}{Polity5 revision indicator. p5 = 1 if the country-year has
#'  undergone systematic review in version 5. Country-years coded 0 report
#'  PolityIV values.}
#'
#'  \item{cyear}{Unique country code-year identifier.}
#'
#'  \item{polity_annual_ccode}{Numeric Country Code. Derived from the Correlates
#'  of War country codes, but with some small differences.}
#'
#'  \item{scode}{Alphabetical Country Code. Derived from the Correlates of War
#'  country codes, but with some small differences.}
#'
#'  \item{polityIV_country}{The original country name in the Polity 5 data.}
#'
#'  \item{year}{The calendar year.}
#'
#'  \item{flag}{From the Polity 5 manual, 2020 edition:
#'
#'  Each case (country-year) is flagged with this trichotomous indicator
#'  denoting the coders' general confidence in the component variable scores
#'  assigned during a Polity annual update. A "0" code indicates reasonable
#'  confidence in the codings listed and is assigned to all historical cases. A
#'  "1" code indicates that codings covering a period of up to five years since
#'  a recent polity change are considered tentative as new authority patterns
#'  emerge and coalesce; these cases are subject to review and possible revision
#'  or "smoothing" ... A "2" code indicates that information is limited and, so,
#'  there are reservations concerning the code assigned, often because a polity
#'  change has occurred very recently and insufficient time has elapsed to
#'  render a confident judgement of the nature of authority changes; the codes
#'  assigned are considered a "best assessment" that require further review and
#'  possible revision (p. 12).}
#'
#'  \item{fragment}{From the Polity5 manual, 2020 edition, pp. 12-13:
#'
#'  Polity Fragmentation: This variable codes the operational existence of a
#'  separate polity, or polities, comprising substantial territory and
#'  population within the recognized borders of the state and over which the
#'  coded polity exercises no effective authority (effective authority may be
#'  participatory or coercive). Local autonomy arrangements voluntarily
#'  established and accepted by both central and local authorities are not
#'  considered fragmentation. A polity that can not exercise relatively
#'  effective authority over at least 50 percent of its established territory is
#'  necessarily considered to be in a condition of "state failure" (i.e.,
#'  interruption or interregnum, see below, that may or may not coincide with
#'  active civil war). Polity fragmentation may result from open warfare (active
#'  or latent) or foreign occupation and may continue in the absence of open
#'  warfare as a situation of de facto separation remains unresolved and
#'  unchallenged by the state. Examples of de facto separation are northern
#'  Cyprus since 1975 (with Turkish occupation), NagornoKarabakh in Azerbaijan
#'  since 1994 (with Armenian occupation), Republika Srpska in Bosnia since 1995
#'  (with NATO occupation), Abkhazia and South Ossetia in Georgia from 1994,
#'  Chechnya in Russia from 1996 to 1999, and Kosovo in Serbia from 1999 to 2008
#'  (Kosovo became a contested, independent state in 2008). This variable is
#'  coded beginning only in the year 2000; it is blank for all prior years
#'  (i.e., it has not yet been coded historically).
#'
#'  (0) No overt fragmentation
#'
#'  (1) Slight fragmentation: Less than ten percent of the country's territory
#'  is effectively under local authority and actively separated from the central
#'  authority of the regime.
#'
#'  (2) Moderate fragmentation: Ten to twenty-five percent of the country's
#'  territory is effectively ruled by local authority and actively separated
#'  from the central authority of the regime.
#'
#'  (3) Serious fragmentation: Over twenty-five percent (and up to fifty
#'  percent) of the country's territory is effectively ruled by local authority
#'  and actively separated from the central authority of the regime.}
#'
#'  \item{democ}{Institutionalized democracy indicator, 0-10 scale. See PolityIV
#'  users' manual at [http://www.systemicpeace.org/inscr/p5manualv2018.pdf](http://www.systemicpeace.org/inscr/p5manualv2018.pdf)}
#'
#'  \item{autoc}{Institutionalized autocracy indicator, 0-10 scale. See PolityIV
#'  users' manual at [http://www.systemicpeace.org/inscr/p5manualv2018.pdf](http://www.systemicpeace.org/inscr/p5manualv2018.pdf)}
#'
#'  \item{polity}{Annual polity index (`autoc` - `democ`), including values for
#'  interruption (-66), interregnum (-77), and transition periods (-88). Higher
#'  values are more democratic. Note that the Polity users' manual (pp. 16-17)
#'  says that "The POLITY score was added to the Polity IV data series in
#'  recognition of its common usage by users in quantitative research and in the
#'  overriding interest of maintaining uniformity among users in this
#'  application. The simple combination of the original DEMOC and AUTOC index
#'  values in a unitary POLITY scale, in many ways, runs contrary to the
#'  original theory stated by Eckstein and Gurr in Patterns of Authority (1975)
#'  and, so, should be treated and interpreted with due caution. Its primary
#'  utility is in investigative research which should be augmented by more
#'  detailed analysis. The original theory posits that autocratic and democratic
#'  authority are distinct patterns of authority, elements of which may co-exist
#'  in any particular regime context. The inclusion of this variable in the data
#'  series should not be seen as an acceptance of the counter-proposal that
#'  autocracy and democracy are alternatives or opposites in a unified authority
#'  spectrum, even though elements of this perspective may be implied in the
#'  original theory. The POLITY variable provides a convenient avenue for
#'  examining general regime effects in analyses but researchers should note
#'  that the middle of the implied POLITY “spectrum” is somewhat muddled in
#'  terms of the original theory, masking various combinations of DEMOC and
#'  AUTOC scores with the same POLITY score. Investigations involving hypotheses
#'  of varying effects of democracy and/or autocracy should employ the original
#'  Polity scheme and test DEMOC and AUTOC separately.}
#'
#'  \item{polity2}{Annual polity2 index, interpolating values for interruption
#'  (-66 is treated as `NA`), interregnum *-77 is treated as 0), and transition
#'  periods (prorated across the transition). Higher values are more
#'  democratic.}
#'
#'  \item{durable}{Regime durability. See PolityIV users' manual at
#'  [http://www.systemicpeace.org/inscr/p5manualv2018.pdf](http://www.systemicpeace.org/inscr/p5manualv2018.pdf) for details.}
#'
#'  \item{xrreg}{Regulation of Chief Executive Recruitment. 1 = unregulated, 2 =
#'  designational/transitional, 3 = regulated. See PolityIV users' manual at
#'  [http://www.systemicpeace.org/inscr/p5manualv2018.pdf](http://www.systemicpeace.org/inscr/p5manualv2018.pdf) for details.}
#'
#'  \item{xrcomp}{Competitiveness of Chief Executive Recruitment. 1 = selection,
#'  2 = dual/transitional, 3 = election. See PolityIV users' manual at
#'  [http://www.systemicpeace.org/inscr/p5manualv2018.pdf](http://www.systemicpeace.org/inscr/p5manualv2018.pdf) for details.}
#'
#'  \item{xropen}{Openness of Chief Executive Recruitment. 1 = unlimited, 2 =
#'  dual/transitional, 3 = election. See PolityIV users' manual at
#'  [http://www.systemicpeace.org/inscr/p5manualv2018.pdf](http://www.systemicpeace.org/inscr/p5manualv2018.pdf) for details.}
#'
#'  \item{xconst}{Executive constraints. 1 = closed, 2 = intermediate, 3 =
#'  slight to moderate limitation, 4 = intermediate, 5 = substantial
#'  limitations, 6 = intermediate, 7 = executive parity or subordination. See
#'  PolityIV users' manual at
#'  [http://www.systemicpeace.org/inscr/p5manualv2018.pdf](http://www.systemicpeace.org/inscr/p5manualv2018.pdf) for details.}
#'
#'  \item{parcomp}{Regulation of participation. 0 = Not applicable, 1 =
#'  repressed, 2 = suppressed, 3 = factional, 4 = transitional, 5 = competitive.
#'  See PolityIV users' manual at
#'  [http://www.systemicpeace.org/inscr/p5manualv2018.pdf](http://www.systemicpeace.org/inscr/p5manualv2018.pdf) for details.}
#'
#'  \item{exrec}{Executive recruitment (concept). 1 = ascription, 2 = dual
#'  (ascription + designation), 3 = designation, 4 = Self selection, 5 = gradual
#'  transition from self selection, 6 = dual (ascription + election), 7 =
#'  transitional or restricted election, 8 = competitive election. See PolityIV
#'  users' manual at [http://www.systemicpeace.org/inscr/p5manualv2018.pdf](http://www.systemicpeace.org/inscr/p5manualv2018.pdf) for
#'  details.}
#'
#'  \item{exconst}{Executive constraints (concept). Identical to `xconst`. 1 =
#'  closed, 2 = intermediate, 3 = slight to moderate limitation, 4 =
#'  intermediate, 5 = substantial limitations, 6 = intermediate, 7 = executive
#'  parity or subordination. See PolityIV users' manual at
#'  [http://www.systemicpeace.org/inscr/p5manualv2018.pdf](http://www.systemicpeace.org/inscr/p5manualv2018.pdf) for details.}
#'
#'  \item{polcomp}{Political competition (concept). 1 = suppressed, 2 =
#'  restricted 3 = Imposed transition, 4 = Uninstitutionalized, 5 = gradual
#'  transition from uninstitutionalized, 6 = factional/restricted, 7 =
#'  factional, 8 = electoral transition: persistent conflict/coercion, 9 =
#'  electoral transition: limited conflict/coercion, 10 = institutionalized
#'  electoral. See PolityIV users' manual at
#'  [http://www.systemicpeace.org/inscr/p5manualv2018.pdf](http://www.systemicpeace.org/inscr/p5manualv2018.pdf) for details.}
#'
#'  \item{prior}{Regime Polity code immediately prior to regime end date. The
#'  polity users' manual (p. 31) says "The PRIOR code may be a number from -10
#'  to 10 or it may be a "begin state" code (88 or 99); it may not be a
#'  standardized authority code (i.e., -66, -77, or -88) as those are
#'  necessarily transitory conditions, not polities. The PRIOR code and the
#'  corresponding EYEAR and EDATE of the initial polity change (i.e., the first
#'  year record) in a multi-year regime change is repeated in the record of the
#'  final year of the multi-year change. This has been done to facilitate
#'  retrieval of information concerning the beginning and ending polities in
#'  multi-year regime changes, particularly when the D3 "flag" variable is used
#'  to select regime transition cases out of the larger dataset."}
#'
#'  \item{emonth}{Polity end month. End month of previous polity, start of
#'  current.}
#'
#'  \item{eday}{Polity end day. End day of previous polity, start of current.}
#'
#'  \item{eyear}{Polity end year. End year of previous polity, start of
#'  current.}
#'
#'  \item{eprec}{End date precision. 1 = exact date, 2 = assigned date (where
#'  more than one event could be used, or event persisted for more than one
#'  day), 3 = approximate date (month could be identified, but not the day), 4 =
#'  missing (year could be identified, but not month or day), 5 = unknown (not
#'  recorded 1995-98).}
#'
#'  \item{interim}{The Polity users' manual says (p. 32) "Interim Polity Code:
#'  Interim Polity coding is used to denote (1) the short-lived nature of a
#'  distinct change in regime authority that spans only a portion of the coded
#'  year (i.e., a POLITY code) that would not otherwise be recorded due to the
#'  annualized structure of the Polity data, (2) a "transition" period of three
#'  years or less while a new Polity is being established (i.e., -88 code), (3)
#'  an "interruption" period of any length while a Polity remains under foreign
#'  authority (i.e., -66 code), or (4) an "interregnal" period denoting a
#'  collapse of central authority (i.e., -77 code). INTERIM is coded for each
#'  year between the end date (EDATE) of the previous Polity and the begin date
#'  (BDATE) of the subsequent Polity whenever standardized authority codes are
#'  used or when a series of incremental changes over a period of three years
#'  orless combine for a consistent POLITY change of three points or more
#'  ("consistent" here means that the incremental changes are all in the same
#'  general direction, positive or negative)."}
#'
#'  \item{bmonth}{Polity beginning month. Beginning month of next polity, end of
#'  current.}
#'
#'  \item{bday}{Polity beginning day. Beginning day of next polity, end of
#'  current.}
#'
#'  \item{eyear}{Polity beginning year. Beginning year of previous polity, end
#'  of current.}
#'
#'  \item{bprec}{Beginning date precision. 1 = exact date, 2 = assigned date
#'  (where more than one event could be used, or event persisted for more than
#'  one day), 3 = approximate date (month could be identified, but not the day),
#'  4 = missing (year could be identified, but not month or day), 5 = unknown
#'  (not recorded 1995-98).}
#'
#'  \item{post}{Regime `polity` code immediately after the current regime.}
#'
#'  \item{change}{Net difference between `prior` and `post`. See PolityIV users'
#'  manual at [http://www.systemicpeace.org/inscr/p5manualv2018.pdf](http://www.systemicpeace.org/inscr/p5manualv2018.pdf) for details.
#'  Note the code 88 denotes a "pre-existing polity" (for polities that existed
#'  before 1800), 96 indicates state disintegration, 0 a state in transition, 97
#'  state transformation, 98 state demise, and 99 state creation.}
#'
#'  \item{d4}{Regime Transition Completed. Variable D4 is a flag variable that
#'  designates (by code "1") the year of a regime change or the final year of a
#'  multi-year regime transition.}
#'
#'  \item{sf}{State failure. Variable SF is a flag variable that designates (by
#'  code "1") every year during which a Polity is considered to be in a
#'  condition of "complete collapse of central authority" or "state failure"
#'  (i.e., -77). The variable SF is also coded "1" for years when a state
#'  disintegrates (variable CHANGE code "96") and when a profound revolutionary
#'  change in political authority occurs (during which the authority of the
#'  previous Polity is assumed to have collapsed completely prior to the
#'  revolutionary seizure of power and subsequent restructuring of authority).}
#'
#'  \item{regtrans}{Regime transition. 3 = major democratic transition, 2 =
#'  minor democratic transition, 1 = positive regime change, 0 = little or no
#'  change, -1 = negative regime change, -2 adverse regime change, -77 state
#'  failure, -66 interruption, 96 = state disintegration, 97 = state
#'  transformation, 98 = state demise, 99 = state creation.}
#'
#'  }
#'
#'@template standard-variables
#'
#'@section Note:
#'
#'  The datasets downloaded by the `download_*` family of functions are not
#'  directly available in this package. You will always need to directly
#'  download them in order to use them.
#'
#'@source Marshall, Monty G., Ted Robert Gurr. 2020.
#'  "Polity5: Political Regime Characteristics and Transitions, 1800-2018".
#'  Dataset Users' Manual. Center for Systemic Peace. Available at
#'  [http://www.systemicpeace.org/inscr/p5manualv2018.pdf](http://www.systemicpeace.org/inscr/p5manualv2018.pdf)
#'
#'
#'@export
#'@import dplyr
#'
#'@aliases polity polity5
#'
#'@seealso [polity_pmm]
#'@seealso [polityIV]
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
    url <- "http://www.systemicpeace.org/inscr/p5v2018.sav"
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
    message("Processing the Polity 5 data - adding state system info...")
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
      message("Note: the number of rows in the processed Polity 5 data is different from the number of rows in the original data.")
      if(nrow(data) != nrow(polity_annual)) {
        warning(sprintf("There should be %d rows in the final processed data. Something went wrong.",
                        nrow(data)))
      }
    }
  }


  standardize_columns(polity_annual, country, ccode, verbose = verbose)
}

#' Download the latest version (data up to 2019) of the Democracy, Voice, and
#' Accountability index from the World Governance Indicators and process it via
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
#'   (to 2019) of the World Governance Indicators "Democracy, Voice and
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

  X25 <- `Indicator Name` <- `Country Name` <- `Indicator Code` <- NULL
  `Country Code` <- indicator <- Estimate <- NULL
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
    select(-X25) %>%
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
    tidyr::gather(year, value, dplyr::matches("[1-2][0-9]{3}")) %>%
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



#' Downloads the 2021 update of the Freedom House Freedom in the World data
#' and processes it using [country_year_coder]
#'
#' The original data is available at
#' [https://freedomhouse.org/report-types/freedom-world](https://freedomhouse.org/report/freedom-world)
#'
#' @param url The URL of the dataset. Defaults to
#'   \url{https://freedomhouse.org/sites/default/files/2021-02/Country_and_Territory_Ratings_and_Statuses_FIW1973-2021.xlsx}
#'
#'
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
#'   1981 - Aug. 1982 and its value is assigned to 1982 here. Surveys from 1981
#'   to 1988 covered the periods Jan.1981-Aug. 1982, Aug. 1982-Nov. 1983, Nov.
#'   1983-Nov. 1984, Nov. 1984-Nov. 1985, Nov. 1985-Nov. 1986, Nov. 1986-Nov.
#'   1987, Nov. 1987-Nov. 1988, and Nov.1988-Dec.1989, and results are assigned
#'   to years 1982, 1983, 1984, 1985, 1986, 1987, 1988, and 1989.
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
#'   2020 (Freedom in the World 2021 Report). Original data and methodology is
#'   available at \url{https://freedomhouse.org/report/freedom-world}
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
  indicator <- value <- country <- NULL

  if(missing(url)) {
    url <- "https://freedomhouse.org/sites/default/files/2021-02/Country_and_Territory_Ratings_and_Statuses_FIW1973-2021.xlsx"
  }


  data <- read_data(url,
                    verbose = verbose,
                    sheet = 2,
                    skip = 3,
                    col_names = FALSE)


  if(include_territories) {
    territory_data <- read_data(url,
                                verbose = verbose,
                                sheet = 3,
                                skip = 3,
                                col_names = FALSE)

    data <- rbind(data, territory_data %>%
                        mutate(across(c(2:3), as.character)))

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
    message("Processing the FH 2021 data - putting it in country-year format, adding state system info...")
  }

  nYears <- (ncol(data) - 1)/3
  var_years <- expand.grid(x = c('pr', 'cl', 'status'), y = c(1972:1980,1982:(1972 + nYears)))
  names(data) <- c('country', paste(var_years$x, var_years$y, sep = "_"))

  data$pr_1972 <- as.double(data$pr_1972)
  data$cl_1972 <- as.double(data$cl_1972)

  # melt the data, split the variable_year column and voila!

  data <- data %>%
    tidyr::pivot_longer(names_to = "indicator", values_to = "value", dplyr::matches("[12][0-9]{3}"),
                        values_transform = list(value = as.character)) %>%
    tidyr::separate(indicator, into = c("status", "year"), sep ="_")  %>%
    filter(!is.na(value)) %>%
    distinct() %>%
    tidyr::pivot_wider(names_from = "status", values_from = "value") %>%
    mutate(across(year:cl, as.numeric)) %>%
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
                                     warn_missing = FALSE))

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

#' Downloads the 2020 update of the Freedom House Electoral Democracies list and
#' processes it using [country_year_coder].
#'
#' The original data is available at
#' [https://freedomhouse.org/report/freedom-world](https://freedomhouse.org/report/freedom-world)
#'
#' @param url The URL of the dataset. Defaults to
#'   \url{https://freedomhouse.org/sites/default/files/2020-02/2020_List_of_Electoral_Democracies_FIW_2020.xlsx}
#'
#' @inheritParams redownload_blm
#'
#' @return A time-series tidy version of the FH electoral democracies dataset,
#'   with the following variables:
#'
#'   * country: The original country name.
#'
#'   * year: The calendar year. This is approximate. The surveys cover specific
#'   periods in the original data that do not always overlap with a single year.
#'   In particular, the year 1981 is "skipped" – a single survey covers Jan.
#'   1981 - Aug. 1982 and its value is assigned to 1982 here.
#'
#'   * electoral: Electoral democracy indicator. \code{TRUE} = yes, \code{FALSE}
#'   = no.
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
#'   2019 (Freedom in the World report 2020 edition). Original data and methodology is available at
#'   \url{https://freedomhouse.org/report/freedom-world}
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
    url_2018 = "https://freedomhouse.org/sites/default/files/List%20of%20Electoral%20Democracies%20FIW%202018.xlsx"
    url_2019 = "https://freedomhouse.org/sites/default/files/List_of_Electoral_Democracies_FIW19.xls"
    url_2020 = "https://freedomhouse.org/sites/default/files/2020-02/2020_List_of_Electoral_Democracies_FIW_2020.xlsx"
  }

  indicator <- value <- electoral_dem <- year <- NULL
  electoral <- country <- Country <- NULL
  `Electoral Democracy Status in FIW 2018` <- NULL
  `Electoral Democracy Status in FIW 2019` <- NULL
  `Electoral Democracy Designation in FIW 2020` <- NULL


  data <- read_data(url,
                    verbose = verbose,
                    name = "/FH_Electoral_Democracies_1988-2016.xls",
                    sheet = 1,
                    skip = 3,
                    col_names = FALSE,
                    na = c("","-"))

  data_2018 <- read_data(url_2018, skip = 1)
  data_2019 <- read_data(url_2019, skip = 1)
  data_2020 <- read_data(url_2020, skip = 1)

  if(return_raw) {
    if(verbose) {
      message("Returning raw data, without processing.")
    }
    return(data)
  }

  if(verbose) {
    message(sprintf("Original dataset has %d rows, but is not in country-year format",
                    nrow(data) + nrow(data_2018) + nrow(data_2019) + nrow(data_2020)))
    message("Processing the FH Electoral Democracies 1989-2020 data - putting it in country-year format, adding state system info...")
  }

  names(data) <- c('country', paste("electoral", 1989:2016, sep = "_"))

  # melt the data, split the variable_year column and voila!

  data <- suppressWarnings(data %>%
    tidyr::gather(indicator, value, dplyr::matches("electoral_[0-9]{4}")) %>%
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

  data_2018 <- suppressWarnings(data_2018 %>%
                                  rename(electoral = `Electoral Democracy Status in FIW 2018`) %>%
                                  mutate(year = 2017,
                                         electoral = ifelse(electoral == "yes", TRUE, FALSE),
                                         country = plyr::mapvalues(Country,
                                                              from= c("Yemen, S.",
                                                                      "Vietnam, S.",
                                                                      "Germany, E."),
                                                              to = c("South Yemen",
                                                                     "South Vietnam",
                                                                     "East Germany"),
                                                              warn_missing = FALSE)) %>%
                                  select(-Country))


  data_2019 <- suppressWarnings(data_2019 %>%
                                  rename(electoral = `Electoral Democracy Status in FIW 2019`) %>%
                                  mutate(year = 2018,
                                         electoral = ifelse(electoral == "Yes", TRUE, FALSE),
                                         country = plyr::mapvalues(Country,
                                                                   from= c("Yemen, S.",
                                                                           "Vietnam, S.",
                                                                           "Germany, E."),
                                                                   to = c("South Yemen",
                                                                          "South Vietnam",
                                                                          "East Germany"),
                                                                   warn_missing = FALSE)) %>%
                                  select(-Country))

  data_2020 <- suppressWarnings(data_2020 %>%
                                  rename(electoral = `Electoral Democracy Designation in FIW 2020`) %>%
                                  mutate(year = 2019,
                                         electoral = ifelse(electoral == "Yes", TRUE, FALSE),
                                         country = plyr::mapvalues(Country,
                                                                   from= c("Yemen, S.",
                                                                           "Vietnam, S.",
                                                                           "Germany, E."),
                                                                   to = c("South Yemen",
                                                                          "South Vietnam",
                                                                          "East Germany"),
                                                                   warn_missing = FALSE)) %>%
                                  select(-Country))

  data <- bind_rows(data,
                    data_2018,
                    data_2019,
                    data_2020)

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

#' Downloads the 2021 update of the Freedom House Freedom in the World All
#' Data 2013-2021 file and processes it using [country_year_coder].
#'
#' The original data is available at
#' [https://freedomhouse.org/report-types/freedom-world](https://freedomhouse.org/report/freedom-world)
#'
#' @param url The URL of the dataset. Defaults to
#'   \url{https://freedomhouse.org/sites/default/files/2021-02/All_data_FIW_2013-2021.xlsx}
#'
#'
#'
#' @inheritParams redownload_blm
#'
#' @return A time-series tidy version of the FH "all data 2013-2021" dataset,
#'   with the following variables:
#'
#'   * country: The original country name.
#'
#'   * region: Freedom House's regional classification.
#'
#'   * country_or_territory: Whether Freedom House classifies the unit as a
#'   country or a territory.
#'
#'   * edition: the edition of FIW in which the data appeared.
#'
#'   * status: Freedom status: Free, Partly Free, Not Free.
#'
#'   * year: The calendar year of the survey. (Added).
#'
#'   * pr: Political rights, from 1 to 7, where 7 means more violations of
#'   political rights.
#'
#'   * cl: Civil liberties, from 1 to 7, where 7 means more violations of civil
#'   rights.
#'
#'   * A1: score for electoral process subcategory question 1.
#'
#'   * A2: score for electoral process subcategory question 2.
#'
#'   * A3: score for electoral process subcategory question 3.
#'
#'   * A: aggregate score for electoral process subcategory.
#'
#'   * B1: score for political pluralism and participation subcategory question
#'   1.
#'
#'   * B2: score for political pluralism and participation subcategory question
#'   2.
#'
#'   * B3: score for political pluralism and participation subcategory question
#'   3.
#'
#'   * B4: score for political pluralism and participation subcategory question
#'   4.
#'
#'   * B: aggregate score for political pluralism and participation subcategory.
#'
#'   * C1: score for functioning of government subcategory question 1.
#'
#'   * C2: score for functioning of government subcategory question 2.
#'
#'   * C3: score for functioning of government subcategory question 3.
#'
#'   * C: aggregate score for functioning of government subcategory.
#'
#'   * AddQ: score for Additional Discretionary Question (B). Note in FIW2018,
#'   AddA (Additional Discretionary Question A) was eliminated, and AddB
#'   (Additional Discretionary Question B) was renamed AddQ.
#'
#'   * AddA: score for Additional Discretionary Question (B). Note in FIW2018,
#'   AddA (Additional Discretionary Question A) was eliminated, and AddB
#'   (Additional Discretionary Question B) was renamed AddQ.
#'
#'   * pr_full: aggregate score for subsections A-C on political rights.
#'
#'   * D1: score for freedom of expression subcategory question 1.
#'
#'   * D2: score for freedom of expression subcategory question 2.
#'
#'   * D3: score for freedom of expression subcategory question 3.
#'
#'   * D4: score for freedom of expression subcategory question 4.
#'
#'   * D: aggregate score for freedom of expression subcategory.
#'
#'   * E1: score for associational and organizational rights subcategory question
#'   1.
#'
#'   * E2: score for associational and organizational rights subcategory question
#'   2.
#'
#'   * E3: score for associational and organizational rights subcategory question
#'   3.
#'
#'   * E: aggregate score for associational and organizational rights subcategory.
#'
#'   * F1: score for rule of law subcategory question 1.
#'
#'   * F2: score for rule of law subcategory question 2.
#'
#'   * F3: score for rule of law subcategory question 3.
#'
#'   * F4: score for rule of law subcategory question 4.
#'
#'   * F: aggregate score for rule of law subcategory.
#'
#'   * G1: score for personal autonomy and individual rights subcategory question 1.
#'
#'   * G2: score for personal autonomy and individual rights question 2.
#'
#'   * G3: score for personal autonomy and individual rights subcategory question 3.
#'
#'   * G4: score for personal autonomy and individual rights subcategory question 4.
#'
#'   * G: aggregate score for personal autonomy and individual rights subcategory.
#'
#'   * cl_full: aggregate score for subsections D-G on civil liberties.
#'
#'   * total: full score (pr_full + cl_full), out of 100.
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
#'   and 7.0 are "Not Free."
#'
#'   Several countries became independent, split into two or more countries, or
#'   merged with a neighboring state. Scores for these countries are given only
#'   for the period of their existence as independent states.
#'
#'
#' @export
#'
#' @import dplyr
#' @importFrom utils unzip
#'
#' @aliases fh_full
#'
#' @family democracy
#' @family Freedom House
#' @family ordinal democracy indexes
#' @source The "Freedom in the World" dataset from Freedom House, updated to
#'   2020 (Freedom in the World 2021 Report). Original data and methodology is
#'   available at \url{https://freedomhouse.org/report/freedom-world}
#'
#' @seealso [fh]
#'
#' @examples
#' \dontrun{
#' fh_full <- download_fh_full()
#' fh_full
#' }
download_fh_full <- function(url,
                        verbose = TRUE,
                        return_raw = FALSE,
                        ...) {

  status <- year <- country <- edition <- NULL

  if(missing(url)) {
    url <- "https://freedomhouse.org/sites/default/files/2021-02/All_data_FIW_2013-2021.xlsx"
  }


  data <- read_data(url,
                    verbose = verbose,
                    sheet = 2,
                    skip = 1,
                    col_names = TRUE)

  if(return_raw) {
    if(verbose) {
      message("Returning raw data, without processing.")
    }
    return(data)
  }

  if(verbose) {
    message(sprintf("Original dataset has %d rows",
                    nrow(data)))
    message("Processing the FH full 2013-2021 data - adding state system info, fixing column names...")
  }

  names(data) <- c("country", "region", "country_or_territory",
                   "edition", "status", "pr", "cl", "A1", "A2", "A3",
                   "A", "B1", "B2", "B3", "B4", "B", "C1", "C2", "C3", "C",
                   "AddQ", "AddA", "pr_full", "D1", "D2", "D3", "D4",
                   "D", "E1", "E2", "E3", "E", "F1", "F2", "F3", "F4",
                   "F", "G1", "G2", "G3", "G4", "G", "cl_full", "total")


  data <- data %>%
    mutate(status = as.factor(status),
           year = edition - 1,
           country = plyr::mapvalues(country,
                                     from= c("Yemen, S.",
                                             "Vietnam, S.",
                                             "Germany, E."),
                                     to = c("South Yemen",
                                            "South Vietnam",
                                            "East Germany"),
                                     warn_missing = FALSE))

  fh_full <- data %>%
    country_year_coder(country,
                       year,
                       match_type = c("country"),
                       verbose = verbose,
                       ...)

  if(verbose) {
    message(sprintf("Resulting dataset after processing has %d rows.",
                    nrow(fh_full)))
    if(nrow(data) != nrow(fh_full)) {
      message("Note: the number of rows in the processed Freedom House data is different from the number of rows in the original data.")
    }
  }

  fh_full <- fh_full %>%
    relocate(year, .after = edition)


  standardize_columns(fh_full, country, verbose = verbose)
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
#'   available here: \url{http://oefresearch.org/sites/default/files/REIGN%20Data%202016.10.05.pdf}
#'
#' @param url The URL of the googlesheet where the REIGN dataset lives. Defaults
#'   to
#'   \url{https://github.com/OEFDataScience/REIGN.github.io/blob/gh-pages/data_sets/regime_list.csv?raw=true}.
#'    This is fragile - if someone "unpublishes" the sheet,it may cease to work.
#'
#' @inheritParams redownload_blm
#'
#' @return A [tibble] with the REIGN dataset, plus additional state system
#'   information generated by [country_year_coder]. The dataset has the
#'   following variables:
#'
#'   reign_cowcode: The COW code of the country in REIGN.
#'
#'   reign_country: The country name in REIGN.
#'
#'   gwf_casename: The case name in the [gwf] dataset.
#'
#'   gwf_startdate: The startdate of the case in the [gwf] dataset.
#'
#'   gwf_enddate: The enddate of the case in the [gwf] dataset.
#'
#'   Start: The start date of the regime.
#'
#'   End: The end date of the regime, or 31 December of the current year.
#'
#'   gwf_regimetype: The regime type. This is what the codebook says about the regime
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
    url <- "https://github.com/OEFDataScience/REIGN.github.io/blob/gh-pages/data_sets/regime_list.csv?raw=true"

  }

  cowcode <- gwf_country <- gwf_casename <- gwf_startdate <- gwf_enddate <- gwf_regimetype <- NULL
  Start <- End <- year <- NULL

  data <- read_data(url,
                    verbose = verbose, file_extension = "csv")

  if(return_raw) {
    if(verbose) {
      message("Returning raw data, without processing.")
    }
    return(data)
  }

  reign <- data %>%
    mutate(Start = lubridate::mdy(gwf_startdate),
           End = lubridate::mdy(gwf_enddate),
           cow = as.double(cowcode),
           gwf_country = case_when(gwf_country == "Cananda" ~ "Canada",
                                   gwf_country == "UKG" ~ "United Kingdom",
                                   TRUE ~ gwf_country)) %>%
    group_by_all() %>%
    mutate(year = list(lubridate::year(Start):lubridate::year(End))) %>%
    tidyr::unnest(cols = c(year)) %>%
    ungroup() %>%
    # filter(year < lubridate::year(lubridate::now())) %>% # If excluding the 2017 countries
    country_year_coder(gwf_country,
                       year,
                       cowcode,
                       code_type = "cown",
                       match_type = "country",
                       verbose = verbose,
                       ...)

  standardize_columns(reign, gwf_country, cowcode, verbose = verbose)
}











