#' Generate a data frame containing all the democracy measures accessible from
#' this package
#'
#' This function automates the process of joining together all the archived and
#' downloadable datasets in this package, producing a comprehensive data frame
#' with every democracy measure. It automatically converts each democracy
#' measure to a numeric value, ensures that larger values are associated with
#' more democracy, and that all country-years are appropriately matched.
#'
#' @param datasets Character vector indicating which datasets to use in
#'   producing the combined data frame. Can be any or all of (an unambiguous
#'   abbreviation of) "[anckar]", "[anrr]", "[LIED]", "[PIPE]", "[arat_pmm]",
#'   "[blm]", "[blm_pmm]", "[bmr]", "[bnr]", "[bnr_extended]", "[bti]",
#'   "[bollen_pmm]", "[doorenspleet]", "[eiu]", "[fh_pmm]", "[gwf_all]",
#'   "[gwf_all_extended]", "[hadenius_pmm]", "[kailitz]", "[magaloni]",
#'   "[magaloni_extended]", "[mainwaring]", "[mainwaring_pmm]", "[munck_pmm]",
#'   "[pacl]", "[pacl_pmm]", "[pacl_update]", "[peps]", "[pitf]",
#'   "[polity_pmm]", "[polyarchy]", "[polyarchy_dimensions]", "[polyarchy_pmm]",
#'   "[prc_gasiorowski]", "[prc_pmm]", "[svmdi]", "[svolik_regime]",
#'   "[uds_2010]", "[uds_2011]", "[uds_2014]", "[ulfelder]",
#'   "[ulfelder_extended]", "[utip]", "[vanhanen]", "[vdem]",
#'   "[wahman_teorell_hadenius]", "[reign]" or "[REIGN]", "[polityIV]",
#'   "[polity]" (or "[polity_annual](download_polity_annual.html)"),
#'   "[fh](download_fh.html)", "[fh_electoral]", "[wgi]". Default is all of
#'   them.
#'
#' @param selection A regular expression for selecting among the datasets.
#'   Optional.
#'
#' @param output_format Character. Whether to output a "wide" (each measure of
#'   democracy in a separate column) or a "long" (a column with measure names, a
#'   column with values) version of the data frame. Default is "long".
#' @param use_extended Whether to use "extended" (that is, including values
#'   before 1945 for some regimes) versions of some datasets ([gwf], [ulfelder],
#'   [bnr], and [magaloni]). Default is \code{TRUE}.
#' @param include_extra_pmm Whether to include versions of some measures found
#'   in Pemstein, Meserve, and Melton's replication dataset for their 2010 piece
#'   introducing the Unified Democracy Scores (Pemstein, Meserve, and Melton
#'   2010, 2013). See [blm_pmm], [prc_pmm], [fh_pmm], [pacl_pmm],
#'   [vanhanen_pmm], and [polity_pmm] for details. This is included mostly to
#'   extend or replicate the [uds] scores.
#' @param verbose Provides a running commentary on what the function is is
#'   doing. Default is \code{TRUE}.
#' @param target_system Character vector describing which state system to use
#'   for the combined file, and which country codes to use. Can be one or both
#'   of "GWn" (Gleditsch and Ward, numeric codes) and "cown" (numeric codes for
#'   the Correlates of War system). The default is *both* Gleditsch-ward and
#'   Correlates of War (`c("GWn", "cown")`).
#' @param force_redownload Whether to re-download all datasets that can be
#'   re-downloaded, including those archived with this package. Used only for
#'   debugging; default is \code{FALSE}.
#' @param scale_scores Whether to scale each measure (substracting their mean
#'   and dividing by their standard deviation). Default is \code{FALSE}.
#' @param keep_only_last_in_year Whether to keep only the last regime
#'   measurement in a given country-year. Some datasets (e.g., [prc], [reign])
#'   contain more than one regime measurement per country-year in some cases (if
#'   the regime changed multiple times during the year); setting this to
#'   \code{TRUE} discards all except the regime measurement as of 31 December of
#'   the year, the standard practice in most datasets. Default is \code{TRUE}.
#'   This setting is only of interest if you set \code{output_format = "long"},
#'   since it is ignored when \code{output_format = "wide"}, which automatically
#'   discards all regime measurements except the last in the year.
#' @param exclude_downloadable Whether to exclude all datasets that must be
#'   explicitly downloaded ([polity], [fh], [wgi]), using only archived
#'   datasets. This speeds up the process considerably, but you lose some of the
#'   more important democracy measures out there. Default is \code{FALSE}.
#'
#' @import dplyr
#'
#' @return A [tibble] with the selected democracy measures and state system
#'   information, in two versions: "long" and "wide". These contain the
#'   following variables:
#'
#' @template standard-variables
#'
#' @section Long version:
#'
#'   In the "long" version of the dataset (\code{format = "long"}), the output
#'   data frame also contains the following variables:
#'
#'   \describe{
#'
#'   \item{year}{The calendar year. Most measures of democracy reflect the
#'   country's situation as of 31 December of the year. If
#'   \code{keep_last_in_year = FALSE} (and \code{format = "long"}), a single
#'   country year may nevertheless contain more than one measurement for some
#'   measures (e.g., [prc]).}
#'
#'   \item{measure}{The name of the measure. (e.g., "blm", "fh_total_reversed").
#'   }
#'
#'   \item{variable}{The numerical value of the measure, in the original scale
#'   (if \code{scale_scores = FALSE}) or as a z-score (if \code{scale_scores =
#'   TRUE}).}
#'
#'   \item{index_type}{The index type (dichotomous, trichotomous,
#'   ordinal/graded, continuous).}
#'
#'   \item{dataset}{The name of the dataset.} }
#'
#' @section Wide version:
#'
#'   In the "wide" version of the dataset (\code{format = "wide"}), the output
#'   data frame can also contain any of the following variables (in the scales
#'   described below, unless \code{scale_scores = TRUE}, in which case the
#'   measures are converted to z-scores):
#'
#'   \describe{
#'
#'   \item{year}{The calendar year. In the "wide" version, all  measures of
#'   democracy reflect the country's situation as of 31 December of the year as
#'   much as possible.}
#'
#'   \item{anckar_democracy}{The [anckar] measure of democracy, as a numeric
#'   value. Up to 2010 this should be identical to `bmr_democracy_omitteddata`.
#'   0 = non-democracy, 1 = democracy.}
#'
#'   \item{anrr}{The [anrr] measure of democracy, as a numeric value. 0 =
#'   non-democracy, 1 = democracy.}
#'
#'   \item{blm}{The [blm] measure of democracy, as a numeric value. Can be 0
#'   (authoritarian), 0.5 (hybrid), or 1 (democracy). }
#'
#'   \item{bmr_democracy}{The [bmr] measure of democracy, as a numeric value.
#'   Can be 0 (non-democracy) or 1 (democracy). }
#'
#'   \item{bmr_democracy_omitteddata}{According to the [bmr] codebook, "this is
#'   the same measure as bmr, except it records an NA for countries occupied
#'   during an international war (e.g., the Netherlands 1940-44) or experiencing
#'   state collapse during a civil war (e.g., Lebanon 1976-89). The democracy
#'   variable instead fills in these years as continuations of the same regime
#'   type." There are some -1 values that I've converted to `NA` (the measure is
#'   supposed to be between 0 and 1).}
#'
#'   \item{bmr_democracy_femalesuffrage}{According to the [bmr] codebook, this
#'   is the same measure as `bmr`, except that it also requires that at least
#'   half of adult women have the right to vote. 30 countries change values.}
#'
#'   \item{bnr}{The [bnr] event measure of democracy, reversed, so that 0
#'   indicates non-democracy and 1 indicates democracy. Since the \code{event}
#'   variable of the [bnr] dataset only codes terminations of democracy
#'   (ignoring years when the country is non-democratic), this variable is
#'   mostly equal to 1.}
#'
#'   \item{bnr_extended}{The [bnr_extended] variable, with 0 indicating
#'   non-democracy and 1 indicating democracy. See the documentation for
#'   [bnr_extended] for details of how this variable extends [bnr], filling in
#'   years of non-democracy back to 1913.}
#'
#'   \item{bti}{The [bti] - Berteslmann Transformation Democracy Status index.
#'   Ranges from 1 to 10. }
#'
#'   \item{doorenspleet}{The [doorenspleet] measure of democracy, with 1
#'   indicating non-democracy and 2 indicating democracy.}
#'
#'   \item{eiu}{The [eiu] measure of democracy, ranging from 0 (least
#'   democratic) to 10 (most democratic). The report says that the index "is
#'   based on five categories: electoral process and pluralism; civil liberties;
#'   the functioning of government; political participation; and political
#'   culture" which form "one interrelated whole"}
#'
#'   \item{fh_electoral}{The [fh_electoral] measure of electoral democracy, with
#'   0 indicating a lack of electoral democracy, 1 indicating electoral
#'   democracy status.}
#'
#'   \item{fh_total_reversed}{The [Freedom House](fh) combined measure of
#'   political and civil rights, reversed, so that 0 is least free and 12 is
#'   most free.}
#'
#'   \item{gwf_democracy}{A measure of democracy from [gwf_all], obtained by
#'   coding all democracies as 1 and all non-democracies, including all
#'   non-democratic nonautocracies, as 0.}
#'
#'   \item{gwf_democracy_extended}{A measure of democracy from
#'   [gwf_all_extended], obtained by coding all democracies as 1 and all
#'   non-democracies, including all non-democratic nonautocracies, as 0. See the
#'   documentation for [gwf_all_extended] for details on how the dataset was
#'   extended to the period before 1945 for some countries.}
#'
#'   \item{gwf_democracy_strict}{A measure of democracy from [gwf_all], obtained
#'   by coding all democracies as 1 and all non-democracies as 0.  It is
#'   \code{NA} for all non-democratic non-autocracies (e.g., warlord regimes,
#'   foreign occupation, etc.).}
#'
#'   \item{gwf_democracy_extended_strict}{A measure of democracy from
#'   [gwf_all_extended], obtained by coding all democracies as 1 and all
#'   non-democracies as 0. It is \code{NA} for all non-democratic
#'   non-autocracies (e.g., warlord regimes, foreign occupation, etc.). See the
#'   documentation for [gwf_all_extended] for details on how the dataset was
#'   extended to the period before 1945 for some countries.}
#'
#'   \item{kailitz_binary}{A measure of democracy from [kailitz], obtained by
#'   coding all liberal democracies as 1 and all other regimes as 0.}
#'
#'   \item{kailitz_tri}{A trichotomous measure of democracy from [kailitz],
#'   obtained by coding all liberal democracies as 2, all electoral autocracies
#'   as 1, and all other regimes as 0.}
#'
#'   \item{lexical_index}{The [LIED] measure of electoral democracy, ranging
#'   from 0 to 6.}
#'
#'   \item{lexical_index_plus}{The [LIED] measure of polyarchy, ranging from 0
#'   to 7 (including political liberties).}
#'
#'   \item{magaloni_democracy}{A measure of democracy from [magaloni], obtained
#'   by coding all democracies as 1 and all non-democracies as 0.}
#'
#'   \item{magaloni_democracy_extended}{A measure of democracy from
#'   [magaloni_extended], obtained by coding all democracies as 1 and all
#'   non-democracies as 0. See the documentation for [magaloni_extended] for
#'   details on how the dataset was extended to the period before 1950 for some
#'   countries.}
#'
#'   \item{mainwaring}{The measure of democracy from [mainwaring], where 0 is
#'   non-democracy, 0.5 represents hybrid regimes, and 1 is democracy.}
#'
#'   \item{pacl}{The measure of democracy from [pacl], where 0 is non-democracy,
#'   and 1 is democracy.}
#'
#'   \item{pacl_update}{The measure of democracy from [pacl_update], where 0 is
#'   non-democracy, and 1 is democracy.}
#'
#'   \item{PEPS1i, PEPS1q, PEPS1v, PEPS2i, PEPS2q, PEPS2v}{The measures of
#'   democracy from [peps]. Higher values indicate more democracy.}
#'
#'   \item{PIPE_democracy, PIPE_regime}{The measures of democracy from [PIPE].
#'   Higher values indicate more democracy. See the documentation of [PIPE] for
#'   large caveats - these measures are calculated on the basis of unclear
#'   instructions and may contain errors.}
#'
#'   \item{pitf, pitf_binary}{The measures of democracy from [pitf], converted
#'   to numberic values. Higher values indicate more democracy.}
#'
#'   \item{pmm_arat}{The measure of democracy in [arat_pmm].}
#'
#'   \item{pmm_blm}{The measure of democracy in [blm_pmm].}
#'
#'   \item{pmm_bollen}{The measure of democracy in [bollen_pmm].}
#'
#'   \item{pmm_fh}{The measure of democracy in [fh_pmm]. Check the documentation
#'   of [fh_pmm] for caveats.}
#'
#'   \item{pmm_hadenius}{The measure of democracy in [hadenius_pmm].}
#'
#'   \item{pmm_mainwaring}{The measure of democracy in [mainwaring_pmm].}
#'
#'   \item{pmm_munck}{The measure of democracy in [munck_pmm].}
#'
#'   \item{pmm_pacl}{The measure of democracy in [pacl_pmm].}
#'
#'   \item{pmm_polity}{The measure of democracy in [polity_pmm]. Check the
#'   documentation of [polity_pmm] for caveats.}
#'
#'   \item{pmm_polyarchy}{The measure of democracy in [polyarchy_pmm].}
#'
#'   \item{pmm_prc}{The measure of democracy in [prc_pmm]. Check the
#'   documentation of [prc_pmm] for caveats.}
#'
#'   \item{pmm_vanhanen}{The measure of democracy in [vanhanen_pmm]. Check the
#'   documentation of [vanhanen_pmm] for caveats.}
#'
#'   \item{polity}{The polity measure of democracy in [polity] (version 5, with
#'   NAs for -88, -77, -66).}
#'
#'   \item{polity2}{The polity2 measure of democracy in [polity] (version 5,
#'   interpolated for periods of interregnum, occupation, and the like - see
#'   documentation in the polity manual).}
#'
#'   \item{polityIV}{The polity measure of democracy in [polity] (version IV,
#'   with NAs for -88, -77, -66).}
#'
#'   \item{polity2IV}{The polity2 measure of democracy in [polity] (version IV,
#'   interpolated for periods of interregnum, occupation, and the like - see
#'   documentation in the polity manual).}
#'
#'   \item{polyarchy_contestation_dimension}{The contestation dimension
#'   (\code{CONTEST}) in [polyarchy_dimensions].}
#'
#'   \item{polyarchy_inclusion_dimension}{The inclusion dimension
#'   (\code{INCLUS}) in [polyarchy_dimensions].}
#'
#'   \item{polyarchy_original_contestation}{The contestation dimension
#'   (\code{cont}) in [polyarchy].}
#'
#'   \item{polyarchy_original_polyarchy}{The original polyarchy scale
#'   (\code{poly}) in [polyarchy], reversed so that higher values imply more
#'   democracy. The codebook suggests this was superceded by
#'   \code{polyarchy_original_contestation}.}
#'
#'   \item{prc}{The measure of democracy in [prc], where 1 is non-democracy, 3
#'   are hybrid regimes, and 4 are democracies. Transitional regimes (2 in the
#'   original scale) are coded NA.}
#'
#'   \item{reign_democracy}{A measure of democracy from [reign], obtained by
#'   coding all presidential and parliamentary democracies as 1, all other
#'   regimes as 0.}
#'
#'   \item{csvmdi}{The continuous Support Vector Machine democracy index from
#'   [svmdi], 2020 version.}
#'
#'   \item{svmdi_2016}{The continuous Support Vector Machine democracy index
#'   from [svmdi], 2016 version.}
#'
#'   \item{dsvmdi}{The dichotomous Support Vector Machine democracy index from
#'   [svmdi], 2020 version.}
#'
#'   \item{svolik_democracy}{A measure of democracy from [svolik_regime]. 0 =
#'   non-democracy, 1 = democracy. }
#'
#'   \item{uds_2010_mean, uds_2010_median, uds_2011_mean, uds_2011_median,
#'   uds_2014_mean, uds_2014_median}{The mean and median posterior scores of the
#'   [uds] index (2010, 2011, and 2014 releases). Higher values are more
#'   democratic.}
#'
#'   \item{ulfelder_democracy}{The dichotmous measure of democracy in
#'   [ulfelder].}
#'
#'   \item{ulfelder_democracy_extended}{The dichotomous measure of democracy in
#'   [ulfelder_extended].}
#'
#'   \item{utip_dichotomous}{A dichotomous measure of democracy from [utip].
#'   Equals 1 if the regime is a social democracy, conservative democracy, or
#'   one party democracy, 0 otherwise.}
#'
#'   \item{utip_dichotomous_strict}{A dichotomous measure of democracy from
#'   [utip]. Equals 1 if the regime is a social democracy or conservative
#'   democracy, 0 otherwise.}
#'
#'   \item{utip_trichotomous}{A trichotomous measure of democracy from [utip].
#'   Equals 2 if the regime is a social democracy or conservative democracy, 1
#'   if it is a one-party democracy, 0 otherwise.}
#'
#'   \item{vanhanen_competition}{The competition index from [vanhanen].}
#'
#'   \item{vanhanen_democratization}{The democratization index from [vanhanen].}
#'
#'   \item{vanhanen_participation}{The participation index from [vanhanen].}
#'
#'   \item{v2x_api}{The additive polyarchy index from [vdem].}
#'
#'   \item{v2x_delibdem}{The deliberative democracy index from [vdem].}
#'
#'   \item{v2x_egaldem}{The egalitarian democracy index from [vdem].}
#'
#'   \item{v2x_libdem}{The liberal democracy index from [vdem].}
#'
#'   \item{v2x_mpi}{The multiplicative polyarchy index from [vdem].}
#'
#'   \item{v2x_partipdem}{The participative democracy index from [vdem].}
#'
#'   \item{v2x_polyarchy}{The polyarchy (electoral democracy) index from
#'   [vdem].}
#'
#'   \item{wgi_democracy}{The voice and accountability index from [wgi].}
#'
#'   \item{wth_democ1}{A dichotomous measure of democracy from
#'   [wahman_teorell_hadenius], obtaining by coding 1 all democracies according
#'   to the \code{regime1ny} variable, 0 all other regimes.}
#'
#'   \item{wth_democrobust}{A dichotomous measure of democracy from
#'   [wahman_teorell_hadenius], obtaining by coding 1 all democracies according
#'   to the \code{regimenyrobust} variable, 0 all other regimes.}
#'
#'   }
#'
#' @export
#'
#' @references
#'
#' `r roxygen_cite("pmm2010")`
#'
#' `r roxygen_cite("pmm2013")`
#'
#' @examples
#' democracy_data_long_no_download <- generate_democracy_scores_dataset(exclude_downloadable = TRUE,
#'          keep_only_last_in_year = FALSE)
#'
#' # You can select only some datasets
#'
#' democracy_data_gwf <- generate_democracy_scores_dataset(datasets = c("gwf_all"),
#'          output_format = "wide")
#'
#' # all PMM datasets
#' democracy_data_pmm <- generate_democracy_scores_dataset(selection = "pmm")
#'
#' \dontrun{
#' # This produces scaled scores
#' generate_democracy_scores_dataset(exclude_downloadable = TRUE,
#'          keep_only_last_in_year = FALSE,
#'          scale_scores = TRUE)
#'
#' # These require downloads:
#'
#' democracy_data_long <- generate_democracy_scores_dataset()
#' democracy_data_wide <- generate_democracy_scores_dataset(output_format = "wide")
#' }
generate_democracy_scores_dataset <- function(datasets,
                                              selection,
                                              output_format = "long",
                                              use_extended = TRUE,
                                              include_extra_pmm = FALSE,
                                              verbose = TRUE,
                                              target_system = c("GWn", "cown"),
                                              force_redownload = FALSE,
                                              scale_scores = FALSE,
                                              keep_only_last_in_year = TRUE,
                                              exclude_downloadable = FALSE) {

  democracy_data <- NULL

  extended_country_name <- fh_country <- lied_country <- PIPE_country <- NULL

  value <- . <-  NULL

  target_system <- match.arg(target_system, several.ok = TRUE)

  include_in_output <- c("extended_country_name", target_system, "in_GW_system")

  standardize_selection <- function(x) {
    x %>%
      filter(!is.na(value)) %>%
      select(include_in_output, "year", "measure", "value") %>%
      dplyr::mutate(value = as.numeric(value)) %>%
      bind_rows(democracy_data)
  }

  output_format <- match.arg(output_format, c("long", "wide"))

  available_datasets <- c("anckar", "anrr", "LIED", "PIPE", "arat_pmm", "blm", "blm_pmm",
                          "bmr", "bnr", "bnr_extended", "bti", "bollen_pmm",
                          "doorenspleet", "eiu", "fh_pmm", "gwf_all", "gwf_all_extended",
                          "hadenius_pmm", "kailitz", "magaloni",
                          "magaloni_extended", "mainwaring", "mainwaring_pmm",
                          "munck_pmm", "pacl", "pacl_pmm", "pacl_update",
                          "peps", "pitf", "polityIV", "polity_pmm", "polyarchy",
                          "polyarchy_dimensions", "polyarchy_pmm",
                          "prc_gasiorowski", "prc_pmm", "svolik_regime",
                          "uds_2010", "uds_2011", "uds_2014",
                          "ulfelder", "ulfelder_extended", "svmdi", "svmdi_2016",
                          "utip", "vdem", "vanhanen", "vanhanen_pmm",
                          "wahman_teorell_hadenius",
                          "reign", "REIGN", "polity_annual", "polity",
                          "fh", "fh_electoral", "wgi_democracy")

  if(missing(datasets)) {
    datasets <- available_datasets
  } else {
    datasets <- match.arg(datasets, available_datasets, several.ok = TRUE)
  }

  if(!base::missing(selection)) {
    datasets <- datasets[str_detect(datasets, selection)]
  }

    # Freedom House -----------------------------------------------------------

    if(!exclude_downloadable & "fh" %in% datasets) {
      if(verbose) {
        message("Adding Freedom House data")
      }
      democracy_data <- download_fh(verbose = verbose,
                                    include_territories = TRUE) %>%
        tidyr::pivot_longer(all_of("fh_total_reversed"),
                            names_to = "measure", values_to = "value")  %>%
        dplyr::mutate(extended_country_name = ifelse(is.na(extended_country_name),
                                                     fh_country, extended_country_name)) %>%
        standardize_selection()
    }

    if("fh" %in% datasets & include_extra_pmm | "fh_pmm" %in% datasets) {
      if(verbose) {
        message("Adding fh_pmm data")
      }
      democracy_data <- democracyData::fh_pmm %>%
        dplyr::rename_with(~"pmm_fh","pmm_freedomhouse") %>%
        tidyr::pivot_longer(all_of("pmm_fh"),
                            names_to = "measure", values_to = "value") %>%
        dplyr::mutate(extended_country_name = ifelse(is.na(extended_country_name),
                                                     fh_country, extended_country_name)) %>%
        standardize_selection()
    }


    # Freedom House Electoral -------------------------------------------------

    if(!exclude_downloadable & "fh_electoral" %in% datasets) {
      if(verbose) {
        message("Adding Freedom House electoral democracies data")
      }
      democracy_data <- download_fh_electoral(verbose = verbose) %>%
        dplyr::rename_with(~"fh_electoral", "electoral") %>%
        tidyr::pivot_longer(all_of("fh_electoral"),
                            names_to = "measure", values_to = "value") %>%
        dplyr::mutate(extended_country_name = ifelse(is.na(extended_country_name),
                                                     fh_country, extended_country_name)) %>%
        standardize_selection()
    }

    # Polity ------------------------------------------------------------------

    if(!exclude_downloadable & ("polity_annual" %in% datasets || "polity" %in% datasets)) {
      if(verbose) {
        message("Adding Polity5 data")
      }
      democracy_data <- suppressWarnings(download_polity_annual(verbose = verbose,
                                               include_in_output = include_in_output) %>%
                                           dplyr::mutate(across(c("polity", "polity2"), ~ifelse(. < -10, NA, .))) %>%
                                           tidyr::pivot_longer(all_of(c("polity", "polity2")),
                                                               names_to = "measure", values_to = "value") %>%
                                           standardize_selection())
    }

    if("polityIV" %in% datasets) {
      if(verbose) {
        message("Adding old polityIV data")
      }
      democracy_data <- suppressWarnings(democracyData::polityIV %>%
                                           dplyr::mutate(across(c("polity", "polity2"), ~ifelse(. < -10, NA, .))) %>%
                                           dplyr::rename_with(~"polityIV", "polity") %>%
                                           dplyr::rename_with(~"polity2IV", "polity2") %>%
                                           tidyr::pivot_longer(all_of(c("polityIV", "polity2IV")),
                                                               names_to = "measure", values_to = "value") %>%
                                           standardize_selection())
    }


    if("polity_pmm" %in% datasets | ("polity_annual" %in% datasets & include_extra_pmm)) {
      if(verbose) {
        message("Adding polity_pmm data")
      }
      democracy_data <- democracyData::polity_pmm %>%
        tidyr::pivot_longer(all_of(c("pmm_polity")),
                            names_to = "measure", values_to = "value") %>%
        standardize_selection()
    }

    # WGI ---------------------------------------------------------------------


    if(!exclude_downloadable & "wgi_democracy" %in% datasets) {
      if(verbose) {
        message("Adding WGI data")
      }
      democracy_data <- download_wgi_voice_and_accountability(verbose = verbose) %>%
        dplyr::rename_with(~"wgi_democracy", "Estimate") %>%
        tidyr::pivot_longer(all_of(c("wgi_democracy")),
                            names_to = "measure", values_to = "value") %>%
        standardize_selection()
    }



  # anckar ---------------------------------------------------------------------


  if("anckar" %in% datasets) {
    if(verbose) {
      message("Adding Anckar-Fredriksson data")
    }
    if(force_redownload) {
      anckar <- redownload_anckar(verbose = verbose,
                                  include_in_output = include_in_output)
    } else {
      anckar <- democracyData::anckar
    }

    democracy_data <- anckar %>%
      dplyr::rename_with(~"anckar_democracy", "democracy") %>%
      tidyr::pivot_longer(all_of(c("anckar_democracy")),
                          names_to = "measure", values_to = "value") %>%
      standardize_selection()
  }

  # anrr ---------------------------------------------------------------------


  if("anrr" %in% datasets) {
    if(verbose) {
      message("Adding ANRR data")
    }
    anrr <- democracyData::anrr

    democracy_data <- anrr %>%
      dplyr::rename_with(~"anrr_democracy", "dem") %>%
      tidyr::pivot_longer(all_of(c("anrr_democracy")),
                          names_to = "measure", values_to = "value") %>%
      standardize_selection()
  }

    # Arat --------------------------------------------------------------------


  if("arat_pmm" %in% datasets) {
    if(verbose) {
      message("Adding Arat data")
    }
    democracy_data <- democracyData::arat_pmm %>%
      tidyr::pivot_longer(all_of(c("pmm_arat")),
                          names_to = "measure", values_to = "value") %>%
      standardize_selection()
  }


  # BLM ---------------------------------------------------------------------


  if("blm" %in% datasets) {
    if(verbose) {
      message("Adding BLM data")
    }
    if(force_redownload) {
      blm <- redownload_blm(verbose = verbose,
                            include_in_output = include_in_output)
    } else {
      blm <- democracyData::blm
    }

    democracy_data <- blm %>%
      tidyr::pivot_longer(all_of(c("blm")),
                          names_to = "measure", values_to = "value") %>%
      standardize_selection()
  }

  if("blm_pmm" %in% datasets | ("blm" %in% datasets & include_extra_pmm)) {
    if(verbose) {
      message("Adding blm_pmm data")
    }
    democracy_data <- democracyData::blm_pmm %>%
      tidyr::pivot_longer(all_of(c("pmm_blm")),
                          names_to = "measure", values_to = "value") %>%
      standardize_selection()
  }



  # BMR ---------------------------------------------------------------------


  if("bmr" %in% datasets) {
    if(verbose) {
      message("Adding BMR data")
    }
    if(force_redownload) {
      bmr <- redownload_bmr(verbose = verbose,
                            include_in_output = include_in_output)
    } else {
      bmr <- democracyData::bmr
    }

    democracy_data <- suppressWarnings(bmr %>%
                                         dplyr::rename_with(~"bmr_democracy", "democracy") %>%
                                         dplyr::rename_with(~"bmr_democracy_omitteddata", "democracy_omitteddata") %>%
                                         dplyr::rename_with(~"bmr_democracy_femalesuffrage", "democracy_femalesuffrage") %>%
                                         dplyr::mutate(across(all_of("bmr_democracy_omitteddata"), ~ifelse(. < 0, NA, .))) %>%
                                         tidyr::pivot_longer(all_of(c("bmr_democracy", "bmr_democracy_omitteddata",
                                                                      "bmr_democracy_femalesuffrage")),
                                                             names_to = "measure", values_to = "value") %>%
                                         standardize_selection())
  }


  # BNR ---------------------------------------------------------------------

  if("bnr" %in% datasets & use_extended |
     "bnr_extended" %in% datasets) {
    if(verbose) {
      message("Adding BNR extended data")
    }
    bnr_extended <- democracyData::bnr_extended

    democracy_data <- bnr_extended %>%
      dplyr::rename_with(~"bnr_extended", "bnr") %>%
      tidyr::pivot_longer(all_of(c("bnr_extended")),
                          names_to = "measure", values_to = "value") %>%
      standardize_selection()
  }

  if("bnr" %in% datasets) {
    if(verbose) {
      message("Adding BNR data")
    }
    bnr <- democracyData::bnr

    democracy_data <- bnr %>%
      dplyr::mutate(across("event", list("bnr" = ~(1 - .)))) %>%
      dplyr::rename_with(~"bnr", "event_bnr") %>%
      tidyr::pivot_longer(all_of(c("bnr")),
                          names_to = "measure", values_to = "value") %>%
      standardize_selection()

  }


  # BTI ---------------------------------------------------------------------


  if("bti" %in% datasets) {
    if(verbose) {
      message("Adding BTI data")
    }
    if(force_redownload) {
      bti <- redownload_bti(verbose = verbose,
                            include_in_output = include_in_output)
    } else {
      bti <- democracyData::bti
    }

    democracy_data <- suppressWarnings(bti %>%
                                         dplyr::rename_with(~"bti_democracy", "SI_Democracy_Status") %>%
                                         tidyr::pivot_longer(all_of(c("bti_democracy")),
                                                             names_to = "measure", values_to = "value") %>%
                                         standardize_selection())
  }
  # Bollen ------------------------------------------------------------------


  if("bollen_pmm" %in% datasets) {
    if(verbose) {
      message("Adding Bollen data")
    }
    democracy_data <- democracyData::bollen_pmm %>%
      tidyr::pivot_longer(all_of(c("pmm_bollen")),
                          names_to = "measure", values_to = "value") %>%
      standardize_selection()
  }


  # Doorenspleet ------------------------------------------------------------


  if("doorenspleet" %in% datasets) {
    if(verbose) {
      message("Adding Doorenspleet data")
    }
    democracy_data <- democracyData::doorenspleet %>%
      tidyr::pivot_longer(all_of(c("doorenspleet")),
                          names_to = "measure", values_to = "value") %>%
      standardize_selection()
  }

  # EIU ------------------------------------------------------------


  if("eiu" %in% datasets) {
    if(verbose) {
      message("Adding EIU data")
    }
    democracy_data <- democracyData::eiu %>%
      tidyr::pivot_longer(all_of(c("eiu")),
                          names_to = "measure", values_to = "value") %>%
      standardize_selection()
  }

  # GWF ---------------------------------------------------------------------

  if("gwf_all" %in% datasets & use_extended |
     "gwf_all_extended" %in% datasets) {
    if(verbose) {
      message("Adding GWF data")
    }
    if(force_redownload) {
      gwf_all_extended <- redownload_gwf(verbose = verbose,
                                         include_in_output = include_in_output,
                                         extend = TRUE)
    } else {
      gwf_all_extended <- democracyData::gwf_all_extended
    }

    democracy_data <- gwf_all_extended %>%
      dplyr::mutate(across("gwf_nonautocracy",
                list("gwf_democracy_extended" = ~ifelse(. == "democracy" & !is.na(.), 1, 0)),
                .names = "{.fn}")) %>%
      dplyr::mutate(across("gwf_nonautocracy",
                list("gwf_democracy_extended_strict" = ~ifelse(is.na(.), 0,
                                                              ifelse(. == "democracy", 1, NA))),
                .names = "{.fn}")) %>%
      tidyr::pivot_longer(all_of(c("gwf_democracy_extended", "gwf_democracy_extended_strict")),
                          names_to = "measure", values_to = "value") %>%
      standardize_selection()

  }

  if("gwf_all" %in% datasets) {
    if(verbose) {
      message("Adding GWF data")
    }
    if(force_redownload) {
      gwf_all <- redownload_gwf(verbose = verbose,
                                include_in_output = include_in_output,
                                extend = FALSE)
    } else {
      gwf_all <- democracyData::gwf_all
    }

    democracy_data <- gwf_all %>%
      dplyr::mutate(across("gwf_nonautocracy",
                           list("gwf_democracy_extended" = ~ifelse(. == "democracy" & !is.na(.), 1, 0)),
                           .names = "{.fn}")) %>%
      dplyr::mutate(across("gwf_nonautocracy",
                           list("gwf_democracy_extended_strict" = ~ifelse(is.na(.), 0,
                                                                          ifelse(. == "democracy", 1, NA))),
                           .names = "{.fn}")) %>%
      tidyr::pivot_longer(all_of(c("gwf_democracy_extended", "gwf_democracy_extended_strict")),
                          names_to = "measure", values_to = "value") %>%
      standardize_selection()

  }



  # Hadenius ----------------------------------------------------------------

  if("hadenius_pmm" %in% datasets) {
    if(verbose) {
      message("Adding Hadenius data")
    }
    democracy_data <- democracyData::hadenius_pmm %>%
      tidyr::pivot_longer(all_of(c("pmm_hadenius")),
                          names_to = "measure", values_to = "value")  %>%
      standardize_selection()
  }



  # Kailitz -----------------------------------------------------------------

  if("kailitz" %in% datasets) {
    if(verbose) {
      message("Adding Kailitz data")
    }
    democracy_data <- democracyData::kailitz %>%
      tidyr::pivot_longer(all_of(c("kailitz_binary", "kailitz_tri")),
                          names_to = "measure", values_to = "value")  %>%
      standardize_selection()
  }


  # LIED --------------------------------------------------------------------

  if("LIED" %in% datasets) {
    if(verbose) {
      message("Adding LIED data")
    }
    if(force_redownload) {
      LIED <- redownload_lied(verbose = verbose,
                              include_in_output = include_in_output)
    } else {
      LIED <- democracyData::LIED
    }

    democracy_data <- LIED %>%
      tidyr::pivot_longer(all_of(c("lexical_index", "lexical_index_plus")),
                          names_to = "measure", values_to = "value")  %>%
      dplyr::mutate(extended_country_name = ifelse(is.na(extended_country_name),
                                                   lied_country, extended_country_name)) %>%
      standardize_selection()
  }


  # Magaloni ----------------------------------------------------------------

  if("magaloni" %in% datasets & use_extended |
     "magaloni_extended" %in% datasets) {
    if(verbose) {
      message("Adding Magaloni extended data")
    }
    if(force_redownload) {
      magaloni_extended <- redownload_magaloni(verbose = verbose,
                                               include_in_output = include_in_output,
                                               extend = TRUE)
    } else {
      magaloni_extended <- democracyData::magaloni_extended
    }

    democracy_data <- magaloni_extended %>%
      dplyr::mutate(across(c("regime_nr"),
                list("magaloni_democracy_extended" = ~(. == "Democracy")),
                .names = "{.fn}")) %>%
      tidyr::pivot_longer(all_of(c("magaloni_democracy_extended")),
                          names_to = "measure", values_to = "value")  %>%
      standardize_selection()

  }

  if("magaloni" %in% datasets) {
    if(verbose) {
      message("Adding Magaloni data")
    }
    if(force_redownload) {
      magaloni <- redownload_magaloni(verbose = verbose,
                                      include_in_output = include_in_output,
                                      extend = FALSE)
    } else {
      magaloni  <- democracyData::magaloni
    }

    democracy_data <- magaloni %>%
      dplyr::mutate(across(c("regime_nr"),
                           list("magaloni_democracy" = ~(. == "Democracy")),
                           .names = "{.fn}")) %>%
      tidyr::pivot_longer(all_of(c("magaloni_democracy")),
                          names_to = "measure", values_to = "value")  %>%
      standardize_selection()

  }

  # Mainwaring --------------------------------------------------------------

  if("mainwaring" %in% datasets) {
    if(verbose) {
      message("Adding Mainwaring data")
    }
    democracy_data <- democracyData::mainwaring %>%
      tidyr::pivot_longer(all_of(c("mainwaring")),
                          names_to = "measure", values_to = "value")  %>%
      standardize_selection()
  }

  if("mainwaring_pmm" %in% datasets | ("mainwaring" %in% datasets & include_extra_pmm)) {
    if(verbose) {
      message("Adding mainwaring_pmm data")
    }
    democracy_data <- democracyData::mainwaring_pmm %>%
      tidyr::pivot_longer(all_of(c("pmm_mainwaring")),
                          names_to = "measure", values_to = "value") %>%
      standardize_selection()
  }



  # Munck -------------------------------------------------------------------


  if("munck_pmm" %in% datasets) {
    if(verbose) {
      message("Adding Munck data")
    }
    democracy_data <- democracyData::munck_pmm %>%
      tidyr::pivot_longer(all_of(c("pmm_munck")),
                          names_to = "measure", values_to = "value") %>%
      standardize_selection()
  }

  # PACL --------------------------------------------------------------------

  if("pacl" %in% datasets) {
    if(verbose) {
      message("Adding PACL data")
    }
    if(force_redownload) {
      pacl <- redownload_pacl(verbose = verbose,
                              include_in_output = include_in_output)
    } else {
      pacl  <- democracyData::pacl
    }

    democracy_data <- pacl %>%
      dplyr::rename_with(~"pacl", "democracy") %>%
      tidyr::pivot_longer(all_of(c("pacl")),
                          names_to = "measure", values_to = "value") %>%
      standardize_selection()
  }

  if("pacl_pmm" %in% datasets | ("pacl" %in% datasets & include_extra_pmm)) {
    if(verbose) {
      message("Adding pacl_pmm data")
    }
    democracy_data <- democracyData::pacl_pmm %>%
      tidyr::pivot_longer(all_of(c("pmm_pacl")),
                          names_to = "measure", values_to = "value") %>%
      standardize_selection()
  }


  if("pacl_update" %in% datasets) {
    if(verbose) {
      message("Adding Update of PACL data by Bjornskov and Rode")
    }
    if(force_redownload) {
      pacl_update <- redownload_pacl_update(verbose = verbose,
                              include_in_output = include_in_output)
    } else {
      pacl_update  <- democracyData::pacl_update
    }

    democracy_data <- pacl_update %>%
      dplyr::rename_with(~"pacl_update", "Democracy") %>%
      tidyr::pivot_longer(all_of(c("pacl_update")),
                          names_to = "measure", values_to = "value") %>%
      standardize_selection()
  }

  # PEPS --------------------------------------------------------------------

  if("peps" %in% datasets) {
    if(verbose) {
      message("Adding PEPS data")
    }
    if(force_redownload) {
      peps <- redownload_peps(verbose = verbose,
                              include_in_output = include_in_output)
    } else {
      peps  <- democracyData::peps
    }

    democracy_data <- suppressWarnings(peps %>%
                                         tidyr::pivot_longer(matches("PEPS[0-9]"),
                                                             names_to = "measure", values_to = "value") %>%
                                         standardize_selection())
  }


  # PITF --------------------------------------------------------------------

  if("pitf" %in% datasets) {
    if(verbose) {
      message("Adding PITF data")
    }
    if(force_redownload) {
      pitf <- create_pitf_scores(verbose = verbose,
                                 include_in_output = include_in_output)
    } else {
      pitf  <- democracyData::pitf
    }
    democracy_data <- pitf %>%
      dplyr::mutate(across(c("pitf", "pitf_binary"),
                ~stringr::str_extract(., "[0-9]") %>% as.numeric)) %>%
      tidyr::pivot_longer(all_of(c("pitf", "pitf_binary")),
                          names_to = "measure", values_to = "value") %>%
      standardize_selection()
  }

  # Polyarchy ---------------------------------------------------------------

  if("polyarchy" %in% datasets) {
    if(verbose) {
      message("Adding Polyarchy original data")
    }
    if(force_redownload) {
      polyarchy <- redownload_polyarchy_original(verbose = verbose,
                                                 include_in_output = include_in_output)
    } else {
      polyarchy  <- democracyData::polyarchy
    }

    democracy_data <- polyarchy %>%
      dplyr::rename_with(~"polyarchy_original_contestation", "cont") %>%
      dplyr::mutate(across("poly", list("polyarchy_original_polyarchy" = ~(10 - .)),
                           .names = "{.fn}")) %>%
      tidyr::pivot_longer(all_of(c("polyarchy_original_contestation",
                                   "polyarchy_original_polyarchy")),
                          names_to = "measure", values_to = "value") %>%
      standardize_selection()
  }

  if("polyarchy_pmm" %in% datasets | ("polyarchy" %in% datasets & include_extra_pmm)) {
    if(verbose) {
      message("Adding polyarchy_pmm data")
    }
    democracy_data <- democracyData::polyarchy_pmm %>%
      tidyr::pivot_longer(all_of(c("pmm_polyarchy")),
                          names_to = "measure", values_to = "value") %>%
      standardize_selection()
  }


  # Polyarchy Dimensions ----------------------------------------------------

  if("polyarchy_dimensions" %in% datasets) {
    if(verbose) {
      message("Adding Polyarchy Dimensions data")
    }
    if(force_redownload) {
      polyarchy_dimensions <- redownload_polyarchy_dimensions(verbose = verbose,
                                                              include_in_output = include_in_output)
    } else {
      polyarchy_dimensions  <- democracyData::polyarchy_dimensions
    }
    democracy_data <- suppressWarnings(polyarchy_dimensions %>%
      dplyr::rename_with(~"polyarchy_contestation_dimension", "CONTEST") %>%
      dplyr::rename_with(~"polyarchy_inclusion_dimension", "INCLUS") %>%
        tidyr::pivot_longer(all_of(c("polyarchy_contestation_dimension",
                                     "polyarchy_inclusion_dimension")),
                            names_to = "measure", values_to = "value") %>%
        standardize_selection())
  }



  # PRC ---------------------------------------------------------------------

  if("prc_gasiorowski" %in% datasets) {
    if(verbose) {
      message("Adding PRC/Gasiorowski data")
    }

    prc_gasiorowski <- democracyData::prc_gasiorowski

    if(keep_only_last_in_year) {
      prc_gasiorowski <- prc_gasiorowski %>%
        group_by(across(all_of(c(include_in_output, "year")))) %>%
        filter_at("end", any_vars(. == max(.)))  %>%
        filter_at("prc_at_end_year", any_vars(. == last(.))) %>%
        ungroup() %>%
        distinct()
    }

    democracy_data <- prc_gasiorowski %>%
      dplyr::mutate_at("regime", list("prc" = ~case_when(
        . == "A" ~ 1,
        . == "D" ~ 4,
        . == "S" ~ 3,
        . == "T" ~ NA_real_,
        TRUE ~ as.numeric(.)
      ))) %>%
      tidyr::pivot_longer(all_of(c("prc")),
                          names_to = "measure", values_to = "value") %>%
      standardize_selection()
  }

  if("prc_pmm" %in% datasets | ("prc_gasiorowski" %in% datasets & include_extra_pmm)) {
    if(verbose) {
      message("Adding prc_pmm data")
    }
    democracy_data <- democracyData::prc_pmm %>%
      tidyr::pivot_longer(all_of(c("pmm_prc")),
                          names_to = "measure", values_to = "value") %>%
      standardize_selection()
  }



  # PIPE --------------------------------------------------------------------

  if("PIPE" %in% datasets) {
    if(verbose) {
      message("Adding PIPE data")
    }
    if(force_redownload) {
      PIPE <- redownload_pipe(verbose = verbose,
                              include_in_output = include_in_output)
    } else {
      PIPE <- democracyData::PIPE
    }

    democracy_data <- PIPE %>%
      dplyr::rename_with(~"PIPE_democracy", "democracy2") %>%
      dplyr::rename_with(~"PIPE_regime", "regime") %>%
      tidyr::pivot_longer(all_of(c("PIPE_democracy",
                                   "PIPE_regime")),
                          names_to = "measure", values_to = "value") %>%
      dplyr::mutate(extended_country_name = ifelse(is.na(extended_country_name),
                                                   PIPE_country, extended_country_name)) %>%
      standardize_selection()
  }

  # REIGN -------------------------------------------------------------------

  if("reign" %in% datasets || "REIGN" %in% datasets) {
    if(verbose) {
      message("Adding REIGN data")
    }
    if(force_redownload) {
      reign <- redownload_reign(verbose = verbose,
                                include_in_output = include_in_output)
    } else {
      reign <- democracyData::REIGN
    }

    if(keep_only_last_in_year) {
      reign <- reign %>%
        dplyr::group_by(across(c(include_in_output, "year"))) %>%
        dplyr::filter_at("End", any_vars(. == max(.))) %>%
        dplyr::ungroup()
    }

    democracy_data <- reign %>%
      dplyr::mutate(across(all_of("gwf_regimetype"),
                           list("reign_democracy" = ~(. %in% c("presidential",
                                                               "parliamentary"))))) %>%
      dplyr::rename("reign_democracy" = "gwf_regimetype_reign_democracy") %>%
      tidyr::pivot_longer(all_of(c("reign_democracy")),
                          names_to = "measure", values_to = "value") %>%
      standardize_selection()
  }

  # SVMDI ------------------------------------------------------------------


  if("svmdi" %in% datasets) {
    if(verbose) {
      message("Adding SVMDI data")
    }
    democracy_data <- democracyData::svmdi %>%
      tidyr::pivot_longer(all_of(c("csvmdi", "dsvmdi")),
                          names_to = "measure", values_to = "value") %>%
      standardize_selection()
  }


  # SVMDI 2016 ------------------------------------------------------------------


  if("svmdi_2016" %in% datasets) {
    if(verbose) {
      message("Adding SVMDI 2016 data")
    }
    democracy_data <- democracyData::svmdi_2016 %>%
      dplyr::rename_with(~"svmdi_2016", "svmdi") %>%
      tidyr::pivot_longer(all_of(c("svmdi_2016")),
                          names_to = "measure", values_to = "value") %>%
      standardize_selection()
  }

  # Svolik ------------------------------------------------------------------


  if("svolik_regime" %in% datasets) {
    if(verbose) {
      message("Adding Svolik data")
    }
    democracy_data <- democracyData::svolik_regime %>%
      dplyr::rename_with(~"svolik_democracy", "regime_numeric") %>%
      tidyr::pivot_longer(all_of(c("svolik_democracy")),
                          names_to = "measure", values_to = "value") %>%
      standardize_selection()
  }



  # UDS ---------------------------------------------------------------------

  if("uds_2014" %in% datasets) {
    if(verbose) {
      message("Adding UDS 2014 data")
    }

    uds_2014 <- democracyData::uds_2014

    democracy_data <- uds_2014 %>%
      dplyr::rename_with(~"uds_2014_mean", "mean") %>%
      dplyr::rename_with(~"uds_2014_median", "median") %>%
      tidyr::pivot_longer(all_of(c("uds_2014_mean",
                                   "uds_2014_median")),
                          names_to = "measure", values_to = "value") %>%
      standardize_selection()
  }

  if("uds_2011" %in% datasets) {
    if(verbose) {
      message("Adding UDS 2011 data")
    }
    uds_2011 <- democracyData::uds_2011

    democracy_data <- uds_2011  %>%
      dplyr::rename_with(~"uds_2011_mean", "mean") %>%
      dplyr::rename_with(~"uds_2011_median", "median") %>%
      tidyr::pivot_longer(all_of(c("uds_2011_mean",
                                   "uds_2011_median")),
                          names_to = "measure", values_to = "value") %>%
      standardize_selection()
  }

  if("uds_2010" %in% datasets) {
    if(verbose) {
      message("Adding UDS 2010 data")
    }
    uds_2010 <- democracyData::uds_2010

    democracy_data <- uds_2010  %>%
      dplyr::rename_with(~"uds_2010_mean", "mean") %>%
      dplyr::rename_with(~"uds_2010_median", "median") %>%
      tidyr::pivot_longer(all_of(c("uds_2010_mean",
                                   "uds_2010_median")),
                          names_to = "measure", values_to = "value") %>%
      standardize_selection()
  }

  # Ulfelder ----------------------------------------------------------------

  if("ulfelder" %in% datasets & use_extended |
     "ulfelder_extended" %in% datasets) {
    if(verbose) {
      message("Adding extended Ulfelder data")
    }
    if(force_redownload) {
      ulfelder_extended <- redownload_ulfelder(verbose = verbose,
                                               include_in_output = include_in_output,
                                               extend = TRUE)
    } else {
      ulfelder_extended <- democracyData::ulfelder_extended
    }

    democracy_data <- ulfelder_extended %>%
      dplyr::mutate(across("rgjtype",
                list("ulfelder_democracy_extended" = ~dplyr::case_when(
                  . == "-99" | . == "NS" ~ NA_real_,
                  . == "A" ~ 0,
                  . == "D" ~ 1,
                  TRUE ~ NA_real_
                )),
                .names = "{.fn}")) %>%
      tidyr::pivot_longer(all_of(c("ulfelder_democracy_extended")),
                          names_to = "measure", values_to = "value") %>%
      standardize_selection()

  }

  if("ulfelder" %in% datasets) {
    if(verbose) {
      message("Adding Ulfelder data")
    }
    if(force_redownload) {
      ulfelder <- redownload_ulfelder(verbose = verbose,
                                      include_in_output = include_in_output,
                                      extend = FALSE)
    } else {
      ulfelder <- democracyData::ulfelder
    }

    democracy_data <- ulfelder %>%
      dplyr::mutate(across("rgjtype",
                           list("ulfelder_democracy" = ~dplyr::case_when(
                             . == "-99" | . == "NS" ~ NA_real_,
                             . == "A" ~ 0,
                             . == "D" ~ 1,
                             TRUE ~ NA_real_
                             )),
                           .names = "{.fn}")) %>%
      tidyr::pivot_longer(all_of(c("ulfelder_democracy")),
                          names_to = "measure", values_to = "value") %>%
      standardize_selection()

  }


  # UTIP --------------------------------------------------------------------

  if("utip" %in% datasets) {
    if(verbose) {
      message("Adding UTIP data")
    }
    if(force_redownload) {
      utip <- redownload_utip(verbose = verbose,
                              include_in_output = include_in_output)
    }else {
      utip <- democracyData::utip
    }

    democracy_data <- utip %>%
      tidyr::pivot_longer(dplyr::matches("utip_[dt]"),
                          names_to = "measure", values_to = "value") %>%
      standardize_selection()
  }


  # Vanhanen ----------------------------------------------------------------

  if("vanhanen" %in% datasets) {
    if(verbose) {
      message("Adding Vanhanen data")
    }
    democracy_data <- democracyData::vanhanen %>%
      tidyr::pivot_longer(matches("vanhanen_comp|vanhanen_[dp]"),
                          names_to = "measure", values_to = "value") %>%
      standardize_selection()
  }
  if("vanhanen_pmm" %in% datasets | ("vanhanen" %in% datasets & include_extra_pmm)) {
    if(verbose) {
      message("Adding Vanhanen_pmm data")
    }
    democracy_data <- democracyData::vanhanen_pmm %>%
      tidyr::pivot_longer(all_of(c("pmm_vanhanen")),
                          names_to = "measure", values_to = "value") %>%
      standardize_selection()
  }


  # vdem --------------------------------------------------------------------

  if("vdem" %in% datasets) {
    if(verbose) {
      message("Adding vdem data")
    }
    democracy_data <- democracyData::vdem_simple %>%
      tidyr::pivot_longer(matches("v2x_[a-z]+$"),
                          names_to = "measure", values_to = "value") %>%
      standardize_selection()
  }


  # Wahman, Teorell, and Hadenius -------------------------------------------

  if("wahman_teorell_hadenius" %in% datasets) {
    if(verbose) {
      message("Adding Wahman, Teorell, and Hadenius data")
    }
    if(force_redownload) {
      wahman_teorell_hadenius <- redownload_wahman_teorell_hadenius(verbose = verbose,
                                                                    include_in_output = include_in_output)
    } else {
      wahman_teorell_hadenius <- democracyData::wahman_teorell_hadenius
    }

    democracy_data <- wahman_teorell_hadenius %>%
      dplyr::mutate(across("regime1ny", list("wth_democ1" = ~(haven::zap_label(.) == 100)))) %>%
      dplyr::mutate(across("regimenyrobust", list("wth_democrobust" = ~(haven::zap_label(.) == 100)))) %>%
      dplyr::rename_with(~"wth_democ1", "regime1ny_wth_democ1") %>%
      dplyr::rename_with(~"wth_democrobust", "regimenyrobust_wth_democrobust") %>%
      tidyr::pivot_longer(dplyr::starts_with("wth_"),
                          names_to = "measure", values_to = "value") %>%
      standardize_selection()

  }


  # Finalizing --------------------------------------------------------------
  if(verbose) {
    message("Finalizing")
  }

  if(scale_scores) {
    democracy_data <- democracy_data %>%
      dplyr::group_by(all_of("measure")) %>%
      dplyr::mutate(across(all_of("value"), scale)) %>%
      dplyr::ungroup()
  }

  if(keep_only_last_in_year | output_format == "wide") {
    democracy_data <- democracy_data %>%
      group_by(across(all_of(c(include_in_output, "year", "measure"))))%>%
      filter_at("value", any_vars(. == last(.))) %>%
      ungroup() %>%
      distinct()
  }

  if(output_format == "wide") {
    democracy_data <- democracy_data %>%
      arrange(measure) %>%
      tidyr::pivot_wider(names_from = all_of("measure"),
                         values_from = all_of("value"),
                         id_cols = all_of(c(include_in_output, "year")))
  }

  if(output_format == "long") {
    measure <- NULL
    democracy_data <- democracy_data %>%
      group_by(across(all_of("measure"))) %>%
      mutate(index_type = case_when(length(unique(value)) == 2 ~ "dichotomous",
                                    length(unique(value)) == 3 ~ "trichotomous",
                                    length(unique(value)) < 25 ~ "ordinal",
                                    TRUE ~ "continuous"),
             dataset = str_remove(measure,"_.+")) %>%
      ungroup() %>%
      mutate(dataset = case_when(str_detect(dataset, "PEPS") ~ "PEPS",
                                 str_detect(dataset, "svmdi") ~ "svdmi",
                                 str_detect(dataset, "lexical") ~ "LIED",
                                 str_detect(dataset, "v2x") ~ "vdem",
                                 str_detect(dataset, "polity$|polity2$") ~ "Polity 5",
                                 str_detect(dataset, "polityIV$|polity2IV$") ~ "Polity IV",
                                 TRUE ~ dataset))

  }

  democracy_data %>%
    arrange(across(all_of(c("extended_country_name", "GWn", "cown", "year"))))


}
