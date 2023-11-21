# Functions for downloading and processing other datasets -----------------

#'Polity 5
#'
#'Downloads the 2020 update of the Polity 5 dataset (annual time series) and
#'processes it using [country_year_coder]. The original data is available at
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
#'  that the middle of the implied POLITY "spectrum" is somewhat muddled in
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

#' Democracy, Voice, and Accountability Index from the World Governance
#' Indicators
#'
#' Download the latest version (data up to 2021) of the Democracy, Voice, and
#' Accountability index from the World Governance Indicators and process it via
#' [country_year_coder]
#'
#'
#' @param url The URL of the dataset. Defaults to
#'   \url{https://www.worldbank.org/content/dam/sites/govindicators/doc/wgidataset.xlsx}
#' @inheritParams redownload_blm
#'
#' @import dplyr
#' @export
#'
#' @return A dataset containing the country-year version of the latest update
#'   (to 2021) of the World Governance Indicators "Democracy, Voice and
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
    url <- "https://www.worldbank.org/content/dam/sites/govindicators/doc/wgidataset.xlsx"
  }

  Estimate <- wb_country <- year <-  wb_code <- name <- NULL

  tmp <- tempfile(fileext = ".xlsx")
  utils::download.file(url, tmp, mode = "wb")

  data <- readxl::read_excel(tmp, sheet = 2, skip = 14,
                             .name_repair = "unique_quiet")

  names(data) <- c("wb_country", "wb_code",
                   paste(rep(c("Estimate", "StdErr", "NumSrc",
                               "Rank", "Lower", "Upper"),
                             (ncol(data) - 2)/6),
                         rep(c(1996, 1998, 2000, 2002:2022), each = 6),
                         sep = "_"))

  if(return_raw) {
    if(verbose) {
      message("Returning raw data, without processing.")
    }
    return(data)
  }

  if(verbose) {
    message(sprintf("Original dataset has %d rows, but is not in country-year format",
                    nrow(data)))
    message("Processing the WGI data - putting it in country-year format, adding state system info...")
  }

  wgi <- suppressWarnings(data %>%
                            mutate(across(everything(), as.character)) %>%
                            tidyr::pivot_longer(!starts_with("wb_")) %>%
                            tidyr::separate(name, into = c("measure", "year"), sep = "_") %>%
                            tidyr::pivot_wider(names_from = "measure") %>%
                            mutate(across(all_of(c("year", "Estimate", "StdErr",
                                                   "NumSrc", "Rank", "Lower",
                                                   "Upper")),
                                          as.numeric)) %>%
                            filter(!is.na(Estimate)) %>%
                            country_year_coder(wb_country,
                                               year,
                                               wb_code,
                                               code_type = "wb",
                                               match_type = "country",
                                               verbose = verbose,
                                               ...))

  unlink(tmp)

  wgi

}



#' Freedom House "Freedom in the World" data
#'
#' Downloads the 2023 update of the Freedom House "Freedom in the World" data
#' and processes it using [country_year_coder]. The original data is available
#' at \url{https://freedomhouse.org/report-types/freedom-world}
#'
#' @param url The URL of the dataset. Defaults to
#'   https://freedomhouse.org/sites/default/files/2023-02/Country_and_Territory_Ratings_and_Statuses_FIW_1973-2023%20.xlsx
#'
#' @param include_territories Whether to include scores from non-independent
#'   territories (e.g., Indian Kashmir, Northern Ireland) compiled by FH.
#'   Default is \code{FALSE}.
#'
#' @inheritParams redownload_blm
#'
#' @return A time-series tidy version of the FH dataset, with the following
#'   variables:
#'
#'   * country: The original country name.
#'
#'   * year: The calendar year. This is approximate. The surveys cover specific
#'   periods in the original data that do not always overlap with a single year.
#'   In particular, the year 1981 is "skipped" -- a single survey covers Jan.
#'   1981 - Aug. 1982 and its value is assigned to 1982 here. Surveys from 1981
#'   to 1988 covered the periods Jan. 1981-Aug. 1982, Aug. 1982-Nov. 1983, Nov.
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
#'   2022 (Freedom in the World 2023 Report). Original data and methodology is
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
    url <- "https://freedomhouse.org/sites/default/files/2023-02/Country_and_Territory_Ratings_and_Statuses_FIW_1973-2023%20.xlsx"
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
    message("Processing the FH 2022 data - ",
            "putting it in country-year format, adding state system info...")
  }

  nYears <- (ncol(data) - 1)/3
  var_years <- expand.grid(x = c('pr', 'cl', 'status'), y = c(1972:1980,1982:(1972 + nYears)))
  names(data) <- c('country', paste(var_years$x, var_years$y, sep = "_"))

  data$pr_1972 <- as.double(data$pr_1972)
  data$cl_1972 <- as.double(data$cl_1972)

  # melt the data, split the variable_year column and voila!

  data <- data %>%
    tidyr::pivot_longer(names_to = "indicator", values_to = "value", matches("[12][0-9]{3}"),
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
           country = case_when(country == "Yemen, S." ~ "South Yemen",
                                      country == "Vietnam, S." ~ "South Vietnam",
                                      country == "Germany, E." ~ "East Germany",
                                      TRUE ~ as.character(country)))

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
      message("Note: the number of rows in the processed Freedom House data ",
              "is different from the number of rows in the original data.")
    }
  }


  standardize_columns(fh, country, verbose = verbose)
}

#' Freedom House Electoral Democracies List
#'
#' Downloads the 2023 update of the Freedom House Electoral Democracies list and
#' processes it using [country_year_coder]. The original data is available at
#' [https://freedomhouse.org/report/freedom-world](https://freedomhouse.org/report/freedom-world),
#' spread over a number of different urls.
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
#'   In particular, the year 1981 is "skipped" -- a single survey covers Jan.
#'   1981 - Aug. 1982 and its value is assigned to 1982 here. Freedom House did
#'   not appear to issue a list of electoral democracies in its 2021 Freedom in
#'   the World report, so the year 2020 is not available; but there is a list of
#'   electoral democracies for the 2022 report, so the year 2021 is available.
#'   2020 is thus "skipped". (It is in principle possible to reconstruct the
#'   list of electoral democracies using the full FH data, but the methodology
#'   is a little opaque).
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
#'   2022 (Freedom in the World report 2023 edition). Original data and
#'   methodology is available at
#'   \url{https://freedomhouse.org/report/freedom-world}
#' @examples
#' \dontrun{
#' fh <- download_fh_electoral()
#' fh
#' }
download_fh_electoral <- function(verbose = TRUE,
                                  return_raw = FALSE,
                                  ...) {

  url <- "https://freedomhouse.org/sites/default/files/FIW2017_Data.zip"
  later_urls = c("https://freedomhouse.org/sites/default/files/List%20of%20Electoral%20Democracies%20FIW%202018.xlsx",
                 "https://freedomhouse.org/sites/default/files/List_of_Electoral_Democracies_FIW19.xls",
                 "https://freedomhouse.org/sites/default/files/2020-02/2020_List_of_Electoral_Democracies_FIW_2020.xlsx",
                 "https://freedomhouse.org/sites/default/files/2022-03/List_of_Electoral_Democracies_FIW22.xlsx",
                 "https://freedomhouse.org/sites/default/files/2023-02/List_of_Electoral_Democracies_FIW23.xlsx")

  indicator <- value <- electoral_dem <- year <- NULL
  electoral <- country <- Country <- NULL

  data <- read_data(url,
                    verbose = verbose,
                    name = "/FH_Electoral_Democracies_1988-2016.xls",
                    sheet = 1,
                    skip = 3,
                    col_names = FALSE,
                    na = c("","-"))

  later_urls <- lapply(later_urls, read_data, skip = 1) %>%
    lapply(function(x) rename_with(x, ~"electoral",
                                          starts_with("Electoral Democracy")))

  if(return_raw) {
    if(verbose) {
      message("Returning raw data, without processing.")
    }
    return(data)
  }

  if(verbose) {
    message(sprintf("Original dataset has %d rows, but is not in country-year format",
                    nrow(data) + sum(unlist(lapply(later_urls, nrow)))))
    message("Processing the FH Electoral Democracies 1989-2022 data",
            " - putting it in country-year format, adding state system info...")
  }

  names(data) <- c('country', paste("electoral", 1989:2016, sep = "_"))

  # melt the data, split the variable_year column and voila!

  data <- data %>%
    tidyr::pivot_longer(names_to = "indicator", values_to = "value", matches("electoral_[0-9]{4}")) %>%
    tidyr::separate(indicator, into = c("electoral_dem", "year"), sep ="_")  %>%
    filter(!is.na(value)) %>%
    tidyr::spread(electoral_dem, value) %>%
    mutate(year = as.numeric(year),
           electoral = ifelse(electoral == "Yes", TRUE, FALSE),
           country = case_when(country == "Yemen, S." ~ "South Yemen",
                                      country == "Vietnam, S." ~ "South Vietnam",
                                      country == "Germany, E." ~ "East Germany",
                                      TRUE ~ as.character(country)))

  for(i in 1:length(later_urls)) {
    later_urls[[i]] <- later_urls[[i]] %>%
      mutate(year = 2017+i,
             electoral = ifelse(electoral == "yes", TRUE, FALSE),
             country = case_when(Country == "Yemen, S." ~ "South Yemen",
                                        Country == "Vietnam, S." ~ "South Vietnam",
                                        Country == "Germany, E." ~ "East Germany",
                                        TRUE ~ as.character(Country))) %>%
      select(-Country)
  }

  later_urls <- bind_rows(later_urls)

  data <- bind_rows(data, later_urls)

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

#' Freedom House All Data 2013-2023
#'
#' Downloads the 2023 update of the Freedom House Freedom in the World All Data
#' 2013-2023 file and processes it using [country_year_coder]. The original data
#' is available at
#' [https://freedomhouse.org/report-types/freedom-world](https://freedomhouse.org/report/freedom-world)
#'
#' @param url The URL of the dataset. Defaults to
#'   \url{https://freedomhouse.org/sites/default/files/2023-02/All_data_FIW_2013-2023.xlsx}
#'
#'
#'
#' @inheritParams redownload_blm
#'
#' @return A time-series tidy version of the FH "all data 2013-2023" dataset,
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
#'   2021 (Freedom in the World 2022 Report). Original data and methodology is
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
    url <- "https://freedomhouse.org/sites/default/files/2023-02/All_data_FIW_2013-2023.xlsx"
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
    message("Processing the FH full 2013-2022 data - ",
            "adding state system info, fixing column names...")
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
           country = case_when(country == "Yemen, S." ~ "South Yemen",
                               country == "Vietnam, S." ~ "South Vietnam",
                               country == "Germany, E." ~ "East Germany",
                               TRUE ~ as.character(country)))

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













