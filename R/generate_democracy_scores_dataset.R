#' Generate a data frame containing all the democracy measures accessible from
#' this package
#'
#' This function automates the process of joinning together all the archived and
#' downloadable datasets in this package, producing a comprehensive data frame
#' with every democracy measure. It automatically converts each democracy
#' measure to a numeric value, ensures that larger values are associated with
#' more democracy, and that all country-years are appropriately matched.
#'
#' @param datasets Character vector indicating which datasets to use in
#'   producing the combined data frame. Can be any or all of (an unambiguous
#'   abbreviation of) "[anckar]", "[LIED]", "[PIPE]", "[arat_pmm]", "[blm]",
#'   "[blm_pmm]", "[bmr]", "[bnr]", "[bti]", "[bnr_extended]", "[bollen_pmm]",
#'   "[doorenspleet]", "[eiu]", "[fh_pmm]", "[gwf_all]", "[gwf_all_extended]",
#'   "[hadenius_pmm]", "[kailitz]", "[magaloni]", "[magaloni_extended]",
#'   "[mainwaring]", "[mainwaring_pmm]", "[munck_pmm]", "[pacl]", "[pacl_pmm]",
#'   "[peps]", "[pitf]", "[polity_pmm]", "[polyarchy]",
#'   "[polyarchy_dimensions]", "[polyarchy_pmm]", "[prc_gasiorowski]",
#'   "[prc_pmm]", "[svmdi]", "[svolik_regime]", "[uds_2010]", "[uds_2011]",
#'   "[uds_2014]", "[ulfelder]", "[ulfelder_extended]", "[utip]", "[vanhanen]",
#'   "[wahman_teorell_hadenius]", "[reign]", "[polity]", "[fh]",
#'   "[fh_electoral]", "[wgi]". Default is all of them.
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
#'   [vanhanen_pmm], and [polity_pmm] for details. This is included mostly for
#'   use by the [QuickUDS](https://github.com/xmarquez/QuickUDS) package.
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
#'   explicitly downloaded ([polity], [fh], [reign], [wgi]), using only archived
#'   datasets. This speeds up the process considerably, but you lose some of the
#'   better democracy measures out there. Default is \code{FALSE}.
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
#' @section Variables:
#'
#'   \describe{
#'
#'   \item{year}{The calendar year. Most measures of democracy reflect the
#'   country's situation as of 31 December of the year. If
#'   \code{keep_last_in_year = FALSE} (and \code{format = "long"}), a single
#'   country year may nevertheless contain more than one measurement for some
#'   measures (e.g., [prc]).}
#'
#'   \item{measure}{The dataset whence the measure is taken. (e.g., "blm",
#'   "fh_total_reversed"). }
#'
#'   \item{variable}{The numerical value of the measure, in the original scale
#'   (if \code{scale_scores = FALSE}) or as a z-score (if \code{scale_scores =
#'   TRUE}).}
#'
#'   }
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
#'   \item{blm}{The [blm] measure of democracy, as a numeric value. Can be 0
#'   (authoritarian), 0.5 (hybrid), or 1 (democracy). }
#'
#'   \item{bmr}{The [bmr] measure of democracy, as a numeric value. Can be 0
#'   (non-democracy) or 1 (democracy). }
#'
#'   \item{bmr_democracy_omitteddata}{According to the [bmr] codebook, "this is
#'   the same measure as bmr, except it records an NA for countries occupied
#'   during an international war (e.g., the Netherlands 1940-44) or experiencing
#'   state collapse during a civil war (e.g., Lebanon 1976-89). The democracy
#'   variable instead fills in these years as continuations of the same regime
#'   type."}
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
#' @references Pemstein, Daniel, Stephen Meserve, and James Melton. 2010.
#'   Democratic Compromise: A Latent Variable Analysis of Ten Measures of Regime
#'   Type. Political Analysis 18 (4): 426-449.
#'
#'   Pemstein, Daniel, Stephen A. Meserve, and James Melton. 2013. "Replication
#'   data for: Democratic Compromise: A Latent Variable Analysis of Ten Measures
#'   of Regime Type." In: Harvard Dataverse.
#'   \url{http://hdl.handle.net/1902.1/PMM}
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


  value <- . <-  NULL

  target_system <- match.arg(target_system, several.ok = TRUE)

  include_in_output <- c("extended_country_name", target_system, "in_GW_system")

  standardize_selection <- function(x) {
    x %>%
      filter(!is.na(value)) %>%
      select(include_in_output, "year", "measure", "value") %>%
      mutate(value = as.numeric(value)) %>%
      bind_rows(democracy_data)
  }

  output_format <- match.arg(output_format, c("long", "wide"))

  available_datasets <- c("anckar", "LIED", "PIPE", "arat_pmm", "blm", "blm_pmm",
                          "bmr", "bnr", "bnr_extended", "bti", "bollen_pmm",
                          "doorenspleet", "eiu", "fh_pmm", "gwf_all", "gwf_all_extended",
                          "hadenius_pmm", "kailitz", "magaloni",
                          "magaloni_extended", "mainwaring", "mainwaring_pmm",
                          "munck_pmm", "pacl", "pacl_pmm",
                          "peps", "pitf", "polityIV", "polity_pmm", "polyarchy",
                          "polyarchy_dimensions", "polyarchy_pmm",
                          "prc_gasiorowski", "prc_pmm", "svolik_regime",
                          "uds_2010", "uds_2011", "uds_2014",
                          "ulfelder", "ulfelder_extended", "svmdi", "svmdi_2016",
                          "utip", "vanhanen", "vanhanen_pmm",
                          "wahman_teorell_hadenius",
                          "reign", "polity_annual",
                          "fh", "fh_electoral", "wgi_democracy")

  if(missing(datasets)) {
    datasets <- available_datasets
  } else {
    datasets <- match.arg(datasets, available_datasets, several.ok = TRUE)
  }

  if(!exclude_downloadable) {
    # Freedom House -----------------------------------------------------------

    if("fh" %in% datasets) {
      if(verbose) {
        message("Adding Freedom House data")
      }
      democracy_data <- download_fh(verbose = verbose,
                                    include_territories = TRUE) %>%
        tidyr::gather("measure", "value", "fh_total_reversed")  %>%
        standardize_selection()
    }

    if("fh" %in% datasets & include_extra_pmm | "fh_pmm" %in% datasets) {
      if(verbose) {
        message("Adding fh_pmm data")
      }
      democracy_data <- democracyData::fh_pmm %>%
        rename_with(~"pmm_fh","pmm_freedomhouse") %>%
        tidyr::gather("measure", "value", "pmm_fh") %>%
        standardize_selection()
    }


    # Freedom House Electoral -------------------------------------------------

    if("fh_electoral" %in% datasets) {
      if(verbose) {
        message("Adding Freedom House electoral democracies data")
      }
      democracy_data <- download_fh_electoral(verbose = verbose) %>%
        rename_with(~"fh_electoral", "electoral") %>%
        tidyr::gather("measure", "value", "fh_electoral") %>%
        standardize_selection()
    }

    # Polity ------------------------------------------------------------------

    if("polity_annual" %in% datasets) {
      if(verbose) {
        message("Adding Polity5 data")
      }
      democracy_data <- suppressWarnings(download_polity_annual(verbose = verbose,
                                               include_in_output = include_in_output) %>%
        mutate_at("polity", ~ifelse(. < -10, NA, .)) %>%
        tidyr::gather("measure", "value", "polity", "polity2") %>%
        standardize_selection())
    }

    if("polityIV" %in% datasets) {
      if(verbose) {
        message("Adding old polityIV data")
      }
      democracy_data <- suppressWarnings(democracyData::polityIV %>%
                                           mutate_at("polity", ~ifelse(. < -10, NA, .)) %>%
                                           rename_with(~"polityIV", "polity") %>%
                                           rename_with(~"polity2IV", "polity2") %>%
                         tidyr::gather("measure", "value", "polityIV","polity2IV") %>%
                         standardize_selection())
    }


    if("polity_pmm" %in% datasets | ("polity_annual" %in% datasets & include_extra_pmm)) {
      if(verbose) {
        message("Adding polity_pmm data")
      }
      democracy_data <- democracyData::polity_pmm %>%
        tidyr::gather("measure", "value", "pmm_polity") %>%
        standardize_selection()
    }

    # REIGN -------------------------------------------------------------------

    if("reign" %in% datasets) {
      if(verbose) {
        message("Adding REIGN data")
      }
      reign <- download_reign(verbose = verbose,
                              include_in_output = include_in_output)

      if(keep_only_last_in_year) {
        reign <- reign %>%
          group_by_at(vars(c(include_in_output, "year"))) %>%
          filter_at("End", any_vars(. == max(.))) %>%
          ungroup()
      }

      democracy_data <- reign %>%
        mutate_at("gwf_regimetype",
                  list("reign_democracy" = ~(. %in% c("presidential",
                                                     "parliamentary")))) %>%
        tidyr::gather("measure", "value",
                      "reign_democracy") %>%
        standardize_selection()
    }

    # WGI ---------------------------------------------------------------------


    if("wgi_democracy" %in% datasets) {
      if(verbose) {
        message("Adding WGI data")
      }
      democracy_data <- download_wgi_voice_and_accountability(verbose = verbose) %>%
        rename_with(~"wgi_democracy", "Estimate") %>%
        tidyr::gather("measure", "value",
                      "wgi_democracy") %>%
        standardize_selection()
    }

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
      rename_with(~"anckar_democracy", "democracy") %>%
      tidyr::gather("measure", "value", "anckar_democracy") %>%
      standardize_selection()
  }

  # Arat --------------------------------------------------------------------


  if("arat_pmm" %in% datasets) {
    if(verbose) {
      message("Adding Arat data")
    }
    democracy_data <- democracyData::arat_pmm %>%
      tidyr::gather("measure", "value", ends_with("pmm_arat")) %>%
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
      tidyr::gather("measure", "value", "blm") %>%
      standardize_selection()
  }

  if("blm_pmm" %in% datasets | ("blm" %in% datasets & include_extra_pmm)) {
    if(verbose) {
      message("Adding blm_pmm data")
    }
    democracy_data <- democracyData::blm_pmm %>%
      tidyr::gather("measure", "value", ends_with("pmm_blm")) %>%
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
                                         rename_with(~"bmr_democracy", "democracy") %>%
                                         rename_with(~"bmr_democracy_omitteddata", "democracy_omitteddata") %>%
                                         rename_with(~"bmr_democracy_femalesuffrage", "democracy_femalesuffrage") %>%
      tidyr::gather("measure", "value", "bmr_democracy",
                    "bmr_democracy_omitteddata", "bmr_democracy_femalesuffrage") %>%
      standardize_selection())
  }


  # BNR ---------------------------------------------------------------------

  if("bnr" %in% datasets & use_extended |
     "bnr_extended" %in% datasets) {
    if(verbose) {
      message("Adding BNR data")
    }
    if(force_redownload) {
      bnr_extended <- redownload_bnr(verbose = verbose,
                                     include_in_output = include_in_output,
                                     extend = TRUE)
    } else {
      bnr_extended <- democracyData::bnr_extended
    }

    democracy_data <- bnr_extended %>%
      rename_with(~"bnr_extended", "bnr") %>%
      tidyr::gather("measure", "value", "bnr_extended") %>%
      standardize_selection()
  }

  if("bnr" %in% datasets) {
    if(verbose) {
      message("Adding BNR data")
    }
    if(force_redownload) {
      bnr <- redownload_bnr(verbose = verbose,
                            include_in_output = include_in_output,
                            extend = FALSE)
    } else {
      bnr <- democracyData::bnr
    }

    democracy_data <- bnr %>%
      mutate(across("event", list("bnr" = ~(1 - .)))) %>%
      rename_with(~"bnr", "event_bnr") %>%
      tidyr::gather("measure", "value", "bnr") %>%
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
                                         rename_with(~"bti_democracy", "SI_Democracy_Status") %>%
                                         tidyr::gather("measure", "value", "bti_democracy") %>%
                                         standardize_selection())
  }
  # Bollen ------------------------------------------------------------------


  if("bollen_pmm" %in% datasets) {
    if(verbose) {
      message("Adding Bollen data")
    }
    democracy_data <- democracyData::bollen_pmm %>%
      tidyr::gather("measure", "value", "pmm_bollen") %>%
      standardize_selection()
  }


  # Doorenspleet ------------------------------------------------------------


  if("doorenspleet" %in% datasets) {
    if(verbose) {
      message("Adding Doorenspleet data")
    }
    democracy_data <- democracyData::doorenspleet %>%
      tidyr::gather("measure", "value", "doorenspleet") %>%
      standardize_selection()
  }

  # EIU ------------------------------------------------------------


  if("eiu" %in% datasets) {
    if(verbose) {
      message("Adding EIU data")
    }
    democracy_data <- democracyData::eiu %>%
      tidyr::gather("measure", "value", "eiu") %>%
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
      mutate_at("gwf_nonautocracy",
                list("gwf_democracy_extended" = ~ifelse(. == "democracy" & !is.na(.), 1, 0))) %>%
      mutate_at("gwf_nonautocracy",
                list("gwf_democracy_extended_strict" = ~ifelse(is.na(.), 0,
                                                              ifelse(. == "democracy", 1, NA)))) %>%
      tidyr::gather("measure", "value",
                    "gwf_democracy_extended",
                    "gwf_democracy_extended_strict") %>%
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
      mutate_at(c("gwf_nonautocracy"),
                list("gwf_democracy" = ~ifelse(. == "democracy"  & !is.na(.), 1, 0)))  %>%
      mutate_at("gwf_nonautocracy",
                list("gwf_democracy_strict" = ~ifelse(is.na(.), 0,
                                                     ifelse(. == "democracy", 1, NA)))) %>%
      tidyr::gather("measure", "value",
                    "gwf_democracy",
                    "gwf_democracy_strict") %>%
      standardize_selection()

  }



  # Hadenius ----------------------------------------------------------------

  if("hadenius_pmm" %in% datasets) {
    if(verbose) {
      message("Adding Hadenius data")
    }
    democracy_data <- democracyData::hadenius_pmm %>%
      tidyr::gather("measure", "value", "pmm_hadenius") %>%
      standardize_selection()
  }



  # Kailitz -----------------------------------------------------------------

  if("kailitz" %in% datasets) {
    if(verbose) {
      message("Adding Kailitz data")
    }
    democracy_data <- democracyData::kailitz %>%
      tidyr::gather("measure", "value", "kailitz_binary", "kailitz_tri") %>%
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
      tidyr::gather("measure", "value", "lexical_index") %>%
      standardize_selection()
  }


  # Magaloni ----------------------------------------------------------------

  if("magaloni" %in% datasets & use_extended |
     "magaloni_extended" %in% datasets) {
    if(verbose) {
      message("Adding Magaloni data")
    }
    if(force_redownload) {
      magaloni_extended <- redownload_magaloni(verbose = verbose,
                                               include_in_output = include_in_output,
                                               extend = TRUE)
    } else {
      magaloni_extended <- democracyData::magaloni_extended
    }

    democracy_data <- magaloni_extended %>%
      mutate_at(c("regime_nr"),
                list("magaloni_democracy_extended" = ~(. == "Democracy"))) %>%
      tidyr::gather("measure", "value", "magaloni_democracy_extended") %>%
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
      mutate_at(c("regime_nr"),
                list("magaloni_democracy" = ~(. == "Democracy"))) %>%
      tidyr::gather("measure", "value", "magaloni_democracy") %>%
      standardize_selection()

  }

  # Mainwaring --------------------------------------------------------------

  if("mainwaring" %in% datasets) {
    if(verbose) {
      message("Adding Mainwaring data")
    }
    democracy_data <- democracyData::mainwaring %>%
      tidyr::gather("measure", "value", "mainwaring") %>%
      standardize_selection()
  }

  if("mainwaring_pmm" %in% datasets | ("mainwaring" %in% datasets & include_extra_pmm)) {
    if(verbose) {
      message("Adding mainwaring_pmm data")
    }
    democracy_data <- democracyData::mainwaring_pmm %>%
      tidyr::gather("measure", "value", "pmm_mainwaring") %>%
      standardize_selection()
  }



  # Munck -------------------------------------------------------------------


  if("munck_pmm" %in% datasets) {
    if(verbose) {
      message("Adding Munck data")
    }
    democracy_data <- democracyData::munck_pmm %>%
      tidyr::gather("measure", "value", "pmm_munck") %>%
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
      rename_with(~"pacl", "democracy") %>%
      tidyr::gather("measure", "value", "pacl") %>%
      standardize_selection()
  }

  if("pacl_pmm" %in% datasets | ("pacl" %in% datasets & include_extra_pmm)) {
    if(verbose) {
      message("Adding pacl_pmm data")
    }
    democracy_data <- democracyData::pacl_pmm %>%
      tidyr::gather("measure", "value", "pmm_pacl") %>%
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
      tidyr::gather("measure", "value", dplyr::matches("PEPS[0-9]")) %>%
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
      mutate_at(c("pitf", "pitf_binary"),
                ~stringr::str_extract(., "[0-9]") %>% as.numeric) %>%
      tidyr::gather("measure", "value", "pitf", "pitf_binary") %>%
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
      rename_with(~"polyarchy_original_contestation", "cont") %>%
      mutate_at("poly", list("polyarchy_original_polyarchy" = ~(10 - .))) %>%
      tidyr::gather("measure", "value",
                    "polyarchy_original_contestation",
                    "polyarchy_original_polyarchy") %>%
      standardize_selection()
  }

  if("polyarchy_pmm" %in% datasets | ("polyarchy" %in% datasets & include_extra_pmm)) {
    if(verbose) {
      message("Adding polyarchy_pmm data")
    }
    democracy_data <- democracyData::polyarchy_pmm %>%
      tidyr::gather("measure", "value", "pmm_polyarchy")  %>%
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
      rename_with(~"polyarchy_contestation_dimension", "CONTEST") %>%
      rename_with(~"polyarchy_inclusion_dimension", "INCLUS") %>%
      tidyr::gather("measure", "value",
                    "polyarchy_contestation_dimension",
                    "polyarchy_inclusion_dimension") %>%
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
        group_by_at(c(include_in_output, "year")) %>%
        filter_at("end", any_vars(. == max(.)))  %>%
        filter_at("prc_at_end_year", any_vars(. == last(.))) %>%
        ungroup() %>%
        distinct()
    }

    democracy_data <- prc_gasiorowski %>%
      mutate_at("regime", list("prc" = ~plyr::mapvalues(.,
                                   from = c("A", "D", "S", "T"),
                                   to = c(1, 4, 3, NA)))) %>%
      tidyr::gather("measure", "value",
                    "prc") %>%
      standardize_selection()
  }

  if("prc_pmm" %in% datasets | ("prc_gasiorowski" %in% datasets & include_extra_pmm)) {
    if(verbose) {
      message("Adding prc_pmm data")
    }
    democracy_data <- democracyData::prc_pmm %>%
      tidyr::gather("measure", "value", "pmm_prc") %>%
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
      rename_with(~"PIPE_democracy", "democracy2") %>%
      rename_with(~"PIPE_regime", "regime") %>%
      tidyr::gather("measure", "value",
                    "PIPE_democracy",
                    "PIPE_regime") %>%
      standardize_selection()
  }

  # SVMDI ------------------------------------------------------------------


  if("svmdi" %in% datasets) {
    if(verbose) {
      message("Adding SVMDI data")
    }
    democracy_data <- democracyData::svmdi %>%
      tidyr::gather("measure", "value",
                    "csvmdi") %>%
      standardize_selection()
  }


  # SVMDI 2016 ------------------------------------------------------------------


  if("svmdi_2016" %in% datasets) {
    if(verbose) {
      message("Adding SVMDI 2016 data")
    }
    democracy_data <- democracyData::svmdi_2016 %>%
      rename_with(~"svmdi_2016", "svmdi") %>%
      tidyr::gather("measure", "value",
                    "svmdi_2016") %>%
      standardize_selection()
  }

  # Svolik ------------------------------------------------------------------


  if("svolik_regime" %in% datasets) {
    if(verbose) {
      message("Adding Svolik data")
    }
    democracy_data <- democracyData::svolik_regime %>%
      rename_with(~"svolik_democracy", "regime_numeric") %>%
      tidyr::gather("measure", "value",
                    "svolik_democracy") %>%
      standardize_selection()
  }



  # UDS ---------------------------------------------------------------------

  if("uds_2014" %in% datasets) {
    if(verbose) {
      message("Adding UDS 2014 data")
    }

    uds_2014 <- democracyData::uds_2014

    democracy_data <- uds_2014 %>%
      rename_with(~"uds_2014_mean", "mean") %>%
      rename_with(~"uds_2014_median", "median") %>%
      tidyr::gather("measure", "value",
                    "uds_2014_mean", "uds_2014_median") %>%
      standardize_selection()
  }

  if("uds_2011" %in% datasets) {
    if(verbose) {
      message("Adding UDS 2011 data")
    }
    uds_2011 <- democracyData::uds_2011

    democracy_data <- uds_2011  %>%
      rename_with(~"uds_2011_mean", "mean") %>%
      rename_with(~"uds_2011_median", "median") %>%
      tidyr::gather("measure", "value",
                    "uds_2011_mean", "uds_2011_median") %>%
      standardize_selection()
  }

  if("uds_2010" %in% datasets) {
    if(verbose) {
      message("Adding UDS 2010 data")
    }
    uds_2010 <- democracyData::uds_2010

    democracy_data <- uds_2010  %>%
      rename_with(~"uds_2010_mean", "mean") %>%
      rename_with(~"uds_2010_median", "median") %>%
      tidyr::gather("measure", "value",
                    "uds_2010_mean", "uds_2010_median") %>%
      standardize_selection()
  }

  # Ulfelder ----------------------------------------------------------------

  if("ulfelder" %in% datasets & use_extended |
     "ulfelder_extended" %in% datasets) {
    if(verbose) {
      message("Adding Ulfelder data")
    }
    if(force_redownload) {
      ulfelder_extended <- redownload_ulfelder(verbose = verbose,
                                               include_in_output = include_in_output,
                                               extend = TRUE)
    } else {
      ulfelder_extended <- democracyData::ulfelder_extended
    }

    democracy_data <- ulfelder_extended %>%
      mutate_at("rgjtype",
                list("ulfelder_democracy_extended" = ~plyr::mapvalues(.,
                                                                     from = c("-99", "A", "D", "NS"),
                                                                     to = c(NA, 0, 1, NA)))) %>%
      tidyr::gather("measure", "value",
                    "ulfelder_democracy_extended") %>%
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
      mutate_at("rgjtype",
                list("ulfelder_democracy" = ~plyr::mapvalues(.,
                                                            from = c("-99", "A", "D", "NS"),
                                                            to = c(NA, 0, 1, NA)))) %>%
      tidyr::gather("measure", "value",
                    "ulfelder_democracy") %>%
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
      tidyr::gather("measure", "value",
                    dplyr::matches("utip_(dich|tric)")) %>%
      standardize_selection()
  }


  # Vanhanen ----------------------------------------------------------------

  if("vanhanen" %in% datasets) {
    if(verbose) {
      message("Adding Vanhanen data")
    }
    democracy_data <- democracyData::vanhanen %>%
      tidyr::gather("measure", "value",
                    dplyr::matches("vanhanen_(democ|comp|partic)")) %>%
      standardize_selection()
  }
  if("vanhanen_pmm" %in% datasets | ("vanhanen" %in% datasets & include_extra_pmm)) {
    if(verbose) {
      message("Adding Vanhanen_pmm data")
    }
    democracy_data <- democracyData::vanhanen_pmm %>%
      tidyr::gather("measure", "value", "pmm_vanhanen") %>%
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
      mutate(across("regime1ny", list("wth_democ1" = ~(haven::zap_label(.) == 100)))) %>%
      mutate(across("regimenyrobust", list("wth_democrobust" = ~(haven::zap_label(.) == 100)))) %>%
      rename_with(~"wth_democ1", "regime1ny_wth_democ1") %>%
      rename_with(~"wth_democrobust", "regimenyrobust_wth_democrobust") %>%
      tidyr::gather("measure", "value",
                    starts_with("wth_")) %>%
      standardize_selection()

  }


  # Finalizing --------------------------------------------------------------
  if(verbose) {
    message("Finalizing")
  }

  if(scale_scores) {
    democracy_data <- democracy_data %>%
      group_by_at("measure") %>%
      mutate_at("value", scale) %>%
      ungroup()
  }

  if(keep_only_last_in_year | output_format == "wide") {
    democracy_data <- democracy_data %>%
      group_by_at(c(include_in_output, "year", "measure"))%>%
      filter_at("value", any_vars(. == last(.))) %>%
      ungroup() %>%
      distinct()
  }

  if(output_format == "wide") {
    democracy_data <- democracy_data %>%
      tidyr::spread("measure", "value")
  }

  democracy_data %>%
    arrange_at(vars(c("extended_country_name", "GWn", "cown", "year")))


}
