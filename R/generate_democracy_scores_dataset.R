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
#'   "[prc_gasiorowski]", "[prc_pmm]", "[svmdi]", "[svolik_regime]", "[uds]",
#'   "[ulfelder]", "[ulfelder_extended]", "[utip]", "[vanhanen]", "[vdem]",
#'   "[wahman_teorell_hadenius]", "[reign]" or "[REIGN]", "[polityIV]",
#'   "[polity5]", "[fh]", "[fh_electoral]", "[wgi]". It can also be empty; the
#'   default is all of them.
#'
#' @param selection A regular expression for selecting among the datasets.
#'   Optional.
#'
#' @param output_format Character. Whether to output a "wide" (each measure of
#'   democracy in a separate column) or a "long" (a column with measure names, a
#'   column with values) version of the data frame. Default is "long". 
#' 
#' @param use_extended Whether to use "extended" (that is, including values
#'   before 1945 for some regimes) versions of some datasets ([gwf], [ulfelder],
#'   [bnr], and [magaloni]). Default is \code{TRUE}. 
#' 
#' @param verbose Provides a running commentary on what the function is is
#' doing. Default is \code{TRUE}. 
#' 
#' @param force_redownload Whether to re-download all datasets that can be
#'   re-downloaded, including those archived with this package. Used only for
#'   debugging; default is \code{FALSE}.
#'   
#' @param scale_scores Whether to scale each measure (substracting their mean
#'   and dividing by their standard deviation). Default is \code{FALSE}. 
#' 
#' @param keep_only_last_in_year Whether to keep only the last regime
#'   measurement in a given country-year. Some datasets (e.g., [prc], [reign])
#'   contain more than one regime measurement per country-year in some cases (if
#'   the regime changed multiple times during the year); setting this to
#'   \code{TRUE} discards all except the regime measurement as of 31 December of
#'   the year, the standard practice in most datasets. Default is \code{TRUE}.
#'   This setting is only of interest if you set \code{output_format = "long"},
#'   since it is ignored when \code{output_format = "wide"}, which automatically
#'   discards all regime measurements except the last in the year. 
#' 
#' @param uds_release_year Which release of the original [uds] dataset to
#'   include. Defaults to the latest, 2014. Can be 2014, 2011, or 2010, or all
#'   of them. 
#' 
#' @param svmdi_release_year Which release of the [svmdi] dataset to include.
#'   Defaults to the latest, 2020. Can be 2020 or 2016, or both of them. 
#' 
#' @param exclude_pmm_duplicates Whether to exclude versions of some measures
#'   found in Pemstein, Meserve, and Melton's replication dataset for their 2010
#'   piece introducing the Unified Democracy Scores (Pemstein, Meserve, and
#'   Melton 2010, 2013). See [blm_pmm], [prc_pmm], [fh_pmm], [pacl_pmm],
#'   [vanhanen_pmm], and [polity_pmm] for details. This is included mostly to
#'   extend or replicate the [uds] scores. Default is \code{TRUE}; set to
#'   `FALSE` to keep these. 
#' 
#' @param prefer_successor In some cases (e.g., Italy 1861) some datasets
#'   contain two measurements in the same year: one for the precursor state
#'   (Piedmont-Sardinia, which is Italy/Sardinia in `extended_country_name`) and
#'   one for the successor state (unified Italy). The problem affects the
#'   following entities in different datasets: Ethiopia (Eritrea split in 1993);
#'   Germany (reunification in 1993); Italy (unification in 1861, previously
#'   Piedmont-Sardinia); Pakistan (Bangladesh split in 1971); the Soviet Union
#'   (creation in 1922; dissolution in 1991); Sudan (South Sudan split in 2011);
#'   Vietnam (1945-1953 period and reunification in 1976); Yemen (unification in
#'   1990); Yugoslavia (1991 breakup). Setting `prefer_successor` to `TRUE`
#'   ensures the successor state is the only measurement included, where the
#'   successor state is preferentially the state in the Gleditsch-Ward system.
#'   Setting it to `FALSE` ensures both measurements are included, which results
#'   in two measurements for the same country-year (where country means the
#'   country in `extended_country_name`). 
#' 
#' @param fix_PIPE The [PIPE] dataset uses a particularly tangled state system,
#'   measuring some countries when they should not exist, or splitting some
#'   countries into historical and modern states but measuring both during the
#'   historical period:
#' 
#' |extended_country_name           |PIPE_country                | min_year| max_year|
#' |:-------------------------------|:---------------------------|--------:|--------:|
#' |Austria                         |Austria                     |     1918|     1918|
#' |Austria                         |Austria-Hungary (Austria)   |     1918|     1918|
#' |Austria-Hungary                 |Austria-Hungary (Austria)   |     1848|     1917|
#' |Austria-Hungary                 |Austria-Hungary (Hungary)   |     1848|     1917|
#' |Czechoslovakia                  |Czech Republic              |     1990|     1992|
#' |Czechoslovakia                  |Czechoslovakia              |     1990|     1992|
#' |German Federal Republic         |Germany                     |     1990|     1990|
#' |German Federal Republic         |Germanywest                 |     1990|     1990|
#' |Korea                           |North Korea                 |     1820|     1870|
#' |Korea                           |South Korea                 |     1820|     1870|
#' |Pakistan                        |Pakistan                    |     1950|     1970|
#' |Pakistan                        |Pakistanincludingbangladesh |     1950|     1970|
#' |Turkey (Ottoman Empire)         |Ottoman Empire              |     1820|     1913|
#' |Turkey (Ottoman Empire)         |Turkey                      |     1820|     1913|
#' |Vietnam, Democratic Republic of |Vietnam                     |     1954|     1975|
#' |Vietnam, Democratic Republic of |Vietnam, North              |     1954|     1975|
#' |Yemen (Arab Republic of Yemen)  |Yemen                       |     1990|     1990|
#' |Yemen (Arab Republic of Yemen)  |Yemennorth                  |     1990|     1990|
#' |Yugoslavia                      |Serbia                      |     1990|     1990|
#' |Yugoslavia                      |Serbia And Montenegro       |     1991|     1991|
#' |Yugoslavia                      |Yugoslavia                  |     1990|     1991|
#' 
#' Some of these are fixed by setting `prefer_successor` to `TRUE` (the default)
#' but others do not make much sense. `fix_PIPE = TRUE` (the default) deletes
#' Austria-Hungary entirely (as there is no principled choice about which half
#' to retain); removes the Czech Republic from the period 1990-1992; removes
#' North and South Korea from the 19th century; assumes Pakistan from 1950-1970
#' must include Bangladesh, and Turkey from 1820-1913 refers to the Ottoman
#' Empire; removes unified Vietnam from the period 1954-1975, Serbia from 1990,
#' and Serbia and Montenegro from 1990 to 1991 (leaving only Yugoslabia from
#' 1990 to 1991).
#' 
#' @param enforce_GW_enddates This enforces the Gleditsch-Ward enddates of
#' historical states, so they are not measured after their dissolution. This
#' only affects a limited number of entities: Tibet (ends in 1950),
#' Czechoslovakia (ends in 1992), Gran Colombia (ends in 1831; Polity measures
#' it until 1832), the Vatican (identified with the Papal States, ends in 1870)
#' and Zanzibar (ends in 1964). The default is `FALSE`.
#'  
#' @import dplyr
#'
#' @return A [tibble::tibble()] with the selected democracy measures and state system
#'   information, in two versions: "long" and "wide". These contain the
#'   following variables:
#'
#' @template standard-variables
#'
#' @section Long version:
#'
#'   In the "long" version of the dataset (\code{output_format = "long"}), the
#'   output data frame also contains the following variables:
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
#'   In the "wide" version of the dataset (\code{output_format = "wide"}), the
#'   output data frame can also contain any of the following variables (in the
#'   scales described below, unless \code{scale_scores = TRUE}, in which case
#'   the measures are converted to z-scores):
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
#'   \item{arat}{The original [arat] measure of democracy, converted to numeric
#'   form. Ranges from 29 (least democratic) to 109 (most democratic). See
#'   [arat] for details.}
#'
#'   \item{anrr_democracy}{The [anrr] measure of democracy, as a numeric value.
#'   0 = non-democracy, 1 = democracy.}
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
#'   \item{vaporeg_binary_strict}{A dichotomous measure of democracy from the
#'   [vaporeg] dataset. Coded as 1 if the regime is classified as a full
#'   democracy (VaPoReg_s = 10), and 0 otherwise. This strict definition
#'   excludes semi-democracies and other intermediate forms. See [vaporeg] for
#'   details.}
#'
#'   \item{vaporeg_binary_non_strict}{A less restrictive dichotomous measure of
#'   democracy from [vaporeg], coded as 1 if the regime is a full democracy
#'   (VaPoReg_s = 10) or a semi-democracy (VaPoReg_s = 20), and 0 otherwise. See
#'   [vaporeg] for details.}
#'
#'   \item{vaporeg_trichotomous}{A trichotomous democracy measure from
#'   [vaporeg], based on the VaPoReg_s classification. Coded as 2 for full
#'   democracies (10), 1 for semi-democracies (20), and 0 for all other regime
#'   types. This measure distinguishes between fully and partially democratic
#'   regimes. See [vaporeg] for details.}
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
#' @section State-system choices:
#'
#'   State system choices are not always straightforward or clear. Most
#'   democracy datasets use some version of the Correlates of War system of
#'   states, though not consistently or entirely correctly (which is why this
#'   package uses [country_year_coder]). There are a number of alternatives,
#'   including the Gleditsch and Ward system, the Polity system (both based on
#'   the COW system, with some modifications), and the V-Dem system (wich is at
#'   the basis of [LIED], though [LIED] also draws on the idiosyncratic [PIPE]
#'   system). Freedom House and VaPoReg also develop their own panel of states,
#'   including many units considered non-sovereign by others. I have opted for
#'   maximal coverage (including all non-sovereign units), with three
#'   exceptions. 
#' 
#'   First, the default is to prefer the successor state where a country-year
#'   unit is measured twice in a single year (for the precursor and the
#'   successor state). This setting affects Ethiopia (Eritrea split in 1993);
#'   Germany (reunification in 1993); Italy (unification in 1861, previously
#'   Piedmont-Sardinia); Pakistan (Bangladesh split in 1971); the Soviet Union
#'   (creation in 1922; dissolution in 1991); Sudan (South Sudan split in 2011);
#'   Vietnam (1945-1953 period and reunification in 1976); Yemen (unification in
#'   1990); Yugoslavia (1991 breakup). Use `prefer_successor = FALSE` to
#'   override.
#' 
#'   Second, the default is to delete various entities in the [PIPE] dataset
#'   that are measured before their appearance as states (e.g., North and South
#'   Korea in the 19th century). To keep these entities, use `fix_PIPE = FALSE`.
#'
#'   Finally, whenever there is more than one measurement per year, I keep only
#'   the last one (as far as I can determine it); use `keep_only_last_in_year =
#'   FALSE` to override. I also keep the last year for no longer existing
#'   entities, but delete any subsequent years (if they appear). Thus the
#'   following entities should have no observations in the years after their
#'   dissolution:
#'
#' |extended_country_name               |panel |dissolution_date    | last_observation |
#' |:-----------------------------------|:-----|:----------|---------:|
#' |Austria-Hungary                     |GWn   |1918-11-13 |      1918|
#' |Baden                               |GWn   |1871-01-17 |      1871|
#' |Bavaria                             |GWn   |1871-01-17 |      1871|
#' |British Mandate of Palestine        |none  |1948-05-14 |      1948|
#' |Czechoslovakia                      |GWn   |1992-12-31 |      1992|
#' |German Democratic Republic          |GWn   |1990-10-02 |      1990|
#' |Germany (Prussia)                   |GWn   |1945-05-07 |      1945|
#' |Hanover                             |GWn   |1871-01-17 |      1871|
#' |Hesse-Kassel (Electoral)            |GWn   |1871-01-17 |      1871|
#' |Hesse-Darmstadt (Ducal)             |GWn   |1871-01-17 |      1871|
#' |Mecklenburg-Schwerin                |GWn   |1871-01-17 |      1871|
#' |Modena                              |GWn   |1861-03-16 |      1861|
#' |Papal States                        |GWn   |1870-09-22 |      1870|
#' |Parma                               |GWn   |1861-03-16 |      1860|
#' |Vietnam, Republic of                |GWn   |1975-04-30 |      1974|
#' |Sardinia                            |polity |1861-03-16 |      1861|
#' |Saxony                              |GWn   |1871-01-17 |      1871|
#' |Tuscany                             |GWn   |1861-03-16 |      1861|
#' |Sicily (Two Sicilies)               |GWn   |1861-03-16 |      1861|
#' |Wurttemberg                         |GWn   |1871-01-17 |      1871|
#' |Yemen, People's Republic of         |GWn   |1990-05-21 |      1990|
#' |Yugoslavia                          |GWn   |2006-06-04 |      2006|
#' |Zanzibar                            |GWn   |1964-04-26 |      1964|
#' |Great Colombia                      |GWn   |1830-09-22 |      1830|
#' |Orange Free State                   |GWn   |1910-05-30 |      1910|
#' |Tibet                               |GWn   |1950-10-01 |      1950|
#' |Transvaal                           |GWn   |1910-05-30 |      1910|
#' |United Provinces of Central America |GWn   |1839-12-31 |      1839|
#'
#' As noted, Korea and Vietnam do contain observations for years after their
#' exit from the system of states in the Gleditsch and Ward panel in 1910 and
#' 1893, respectively, since they have extant successors and are measured by
#' some datasets for those periods:
#'
#'   |extended_country_name               |panel |dissolution_date |
#'   |:-----------------------------------|:-----|:----------|
#'   |Korea |GWn |1910-08-22 |
#'   |Vietnam (Annam/Cochin China/Tonkin) |GWn |1893-01-01 |
#'
#' The treatment of Palestine is also complicated. Several datasets (e.g.,
#' [vdem], [fh], and [LIED]) contain separate measurements for the West Bank and
#' Gaza; [fh] includes the West Bank, Gaza, and "Israeli-Occupied Territories"
#' (I'm assuming the occupied territories in Lebanon and Syria). I've labeled
#' them as follows:
#'
#' |extended_country_name               |original_country_name                          |dataset       | min_year| max_year|
#' |:-----------------------------------|:----------------------------------------------|:-------------|--------:|--------:|
#' |British Mandate of Palestine        |Palestine                                      |vaporeg       |     1919|     1947|
#' |British Mandate of Palestine        |Palestine/British Mandate                      |LIED          |     1918|     1947|
#' |British Mandate of Palestine        |Palestine/British Mandate                      |vdem          |     1918|     1947|
#' |Israeli-Occupied Territories        |Israeli-Occupied Territories                   |fh            |     1996|     2009|
#' |Palestine, State of                 |Palestine                                      |eiu           |     2006|     2024|
#' |Palestine, State of                 |Palestine                                      |vaporeg       |     1948|     2006|
#' |Palestine, State of                 |Palestinian Authority-Administered Territories |fh            |     1996|     2009|
#' |Palestine, State of                 |West Bank and Gaza                             |wgi_democracy |     1996|     2023|
#' |Palestine, State of                 |West Bank and Gaza Strip                       |fh            |     1977|     1995|
#' |Palestine, State of/Gaza Strip Only |Gaza Strip                                     |fh            |     2010|     2024|
#' |Palestine, State of/Gaza Strip Only |Palestine Gaza Strip                           |vaporeg       |     2007|     2024|
#' |Palestine, State of/Gaza Strip Only |Palestine/Gaza                                 |LIED          |     1948|     2023|
#' |Palestine, State of/Gaza Strip Only |Palestine/Gaza                                 |vdem          |     1948|     2024|
#' |Palestine, State of/West Bank Only  |Palestine West Bank                            |vaporeg       |     2007|     2024|
#' |Palestine, State of/West Bank Only  |Palestine/West Bank                            |LIED          |     1948|     2023|
#' |Palestine, State of/West Bank Only  |Palestine/West Bank                            |vdem          |     1948|     2024|
#' |Palestine, State of/West Bank Only  |West Bank                                      |fh            |     2010|     2024|
#'
#' There are some other oddities, primarily concerning [fh] and the [polity] and
#' Polity-derived datasets such as [pitf]. [fh] includes a measure for the
#' "Russian-occupied territories of Ukraine"; I've left it as is
#' (`extended_country_name = "Russian-occupied territories of Ukraine"`, not
#' allocated to either Ukraine or Russia). And [polity] includes separate
#' observations for both Russia 1922 and USSR 1922; I've excluded the USSR 1922
#' observation since it officially began on 31 December 1922. 
#'
#' Note also that though I've kept Germany 1945 (COW code 255, per the table
#' above, since it ends in 1945 in the Gleditsch-Ward panel), there are
#' observations for the (occupied) territory of both the later German Federal
#' Republic and the later German Democratic Republic in 1945. 
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
#' # You can select only some datasets
#'
#' democracy_data_gwf <- generate_democracy_scores_dataset(
#'  datasets = c("gwf", "pacl", "bmr"), 
#'  output_format = "wide"
#'  )
#'
#' # all PMM datasets
#' democracy_data_pmm <- generate_democracy_scores_dataset(
#'   selection = "pmm", exclude_pmm_duplicates = FALSE
#'  )
#'
#' \dontrun{
#' # This produces scaled scores
#' generate_democracy_scores_dataset(
#'  keep_only_last_in_year = FALSE,
#'  scale_scores = TRUE)
#'
#' # These require downloads:
#'
#' democracy_data_long <- generate_democracy_scores_dataset(
#'  datasets = "pacl",
#'  force_redownload = TRUE
#' ) 
#' 
#' democracy_data_wide <- generate_democracy_scores_dataset(
#'  datasets = "pacl",
#'  force_redownload = TRUE, 
#'  output_format = "wide"
#' ) 
#' }
generate_democracy_scores_dataset <- function(datasets,
                                              selection,
                                              output_format = "long",
                                              use_extended = TRUE,
                                              verbose = TRUE,
                                              force_redownload = FALSE,
                                              scale_scores = FALSE,
                                              keep_only_last_in_year = TRUE,
                                              uds_release_year = c(2014, 2011, 2010),
                                              svmdi_release_year = c(2020, 2016),
                                              exclude_pmm_duplicates = TRUE,
                                              prefer_successor = TRUE,
                                              fix_PIPE = TRUE,
                                              enforce_GW_enddates = FALSE) {

  value <- dataset <- pmm_only <- release_year <- extend <- NULL
  measure <- NULL
  include_in_output <- c("extended_country_name", "GWn", "cown", "in_GW_system")
  output_format <- match.arg(output_format, c("long", "wide"))

  stopifnot(uds_release_year %in% c(2014, 2011, 2010))
  stopifnot(svmdi_release_year %in% c(2020, 2016))

  standardizers <- dplyr::tribble(
    ~dataset,                     ~standardize_fun,                        ~extend, ~pmm_only, ~release_year,
    "anckar",                     standardize_anckar,                      FALSE,   FALSE,     NA,
    "anrr",                       standardize_anrr,                        FALSE,   FALSE,     NA,
    "arat",                       standardize_arat,                        FALSE,   FALSE,     NA,
    "arat_pmm",                   standardize_arat_pmm,                    FALSE,   FALSE,     NA,
    "blm",                        standardize_blm,                         FALSE,   FALSE,     NA,
    "blm_pmm",                    standardize_blm_pmm,                     FALSE,   FALSE,     NA,
    "bmr",                        standardize_bmr,                         FALSE,   FALSE,     NA,
    "bnr",                        standardize_bnr,                         TRUE,    FALSE,     NA,
    "bti",                        standardize_bti,                         FALSE,   FALSE,     NA,
    "bollen_pmm",                 standardize_bollen_pmm,                  FALSE,   TRUE,      NA,
    "doorenspleet",               standardize_doorenspleet,                FALSE,   FALSE,     NA,
    "eiu",                        standardize_eiu,                         FALSE,   FALSE,     NA,
    "fh",                         standardize_fh,                          FALSE,   FALSE,     NA,
    "fh_pmm",                     standardize_fh_pmm,                      FALSE,   FALSE,     NA,
    "fh_electoral",               standardize_fh_electoral,                FALSE,   FALSE,     NA,
    "gwf",                        standardize_gwf,                         TRUE,    FALSE,     NA,
    "hadenius_pmm",               standardize_hadenius_pmm,                FALSE,   TRUE,      NA,
    "kailitz",                    standardize_kailitz,                     FALSE,   FALSE,     NA,
    "LIED",                       standardize_lied,                        FALSE,   FALSE,     NA,
    "magaloni",                   standardize_magaloni,                    TRUE,    FALSE,     NA,
    "mainwaring",                 standardize_mainwaring,                  FALSE,   FALSE,     NA,
    "mainwaring_pmm",             standardize_mainwaring_pmm,              FALSE,   FALSE,     NA,
    "munck_pmm",                  standardize_munck_pmm,                   FALSE,   TRUE,      NA,
    "pacl",                       standardize_pacl,                        FALSE,   FALSE,     NA,
    "pacl_pmm",                   standardize_pacl_pmm,                    FALSE,   FALSE,     NA,
    "pacl_update",                standardize_pacl_update,                 FALSE,   FALSE,     NA,
    "peps",                       standardize_peps,                        FALSE,   FALSE,     NA,
    "pitf",                       standardize_pitf,                        FALSE,   FALSE,     NA,
    "PIPE",                       standardize_PIPE,                        FALSE,   FALSE,     NA,
    "polityIV",                   standardize_polity4,                     FALSE,   FALSE,     NA,
    "polity5",                    standardize_polity5,                     FALSE,   FALSE,     NA,
    "polity_pmm",                 standardize_polity_pmm,                  FALSE,   FALSE,     NA,
    "polyarchy",                  standardize_polyarchy_original,          FALSE,   FALSE,     NA,
    "polyarchy_dimensions",       standardize_polyarchy_dimensions,        FALSE,   FALSE,     NA,
    "polyarchy_pmm",              standardize_polyarchy_pmm,               FALSE,   FALSE,     NA,
    "prc_gasiorowski",            standardize_prc_gasiorowski,             FALSE,   FALSE,     NA,
    "prc_pmm",                    standardize_prc_pmm,                     FALSE,   FALSE,     NA,
    "REIGN",                      standardize_REIGN,                       FALSE,   FALSE,     NA,
    "svmdi",                      standardize_svmdi,                       FALSE,   FALSE,     2020,
    "svmdi_2016",                 standardize_svmdi,                       FALSE,   FALSE,     2016,
    "svolik_regime",              standardize_svolik,                      FALSE,   FALSE,     NA,
    "uds_2010",                   standardize_uds,                         FALSE,   FALSE,     2010,
    "uds_2011",                   standardize_uds,                         FALSE,   FALSE,     2011,
    "uds_2014",                   standardize_uds,                         FALSE,   FALSE,     2014,
    "ulfelder",                   standardize_ulfelder,                    TRUE,    FALSE,     NA,
    "utip",                       standardize_utip,                        FALSE,   FALSE,     NA,
    "vanhanen",                   standardize_vanhanen,                    FALSE,   FALSE,     NA,
    "vanhanen_pmm",               standardize_vanhanen_pmm,                FALSE,   FALSE,     NA,
    "vaporeg",                    standardize_vaporeg,                     FALSE,   FALSE,     NA,
    "vdem",                       standardize_vdem,                        FALSE,   FALSE,     NA,
    "wahman_teorell_hadenius",    standardize_wahman_teorell_hadenius,     FALSE,   FALSE,     NA,
    "wgi_democracy",              standardize_wgi,                         FALSE,   FALSE,     NA
  )


  # Dataset processing logic
  if (!missing(selection)) {
    standardizers <- standardizers |>
      dplyr::filter(stringr::str_detect(dataset, selection))
  }

  # PMM logic
  if(exclude_pmm_duplicates) {
    standardizers <- standardizers |>
      dplyr::filter(!(!pmm_only & stringr::str_detect(dataset, "pmm")))
  }

  # Release year logic
  standardizers <- standardizers |>
    dplyr::filter(is.na(release_year) |
                    (release_year %in% uds_release_year  & str_detect(dataset, "uds")) |
                    (release_year %in% svmdi_release_year & str_detect(dataset, "svmdi")))

  if (missing(datasets)) {
    selected_standardizers <- standardizers
  } else {
    selected_standardizers <- standardizers |>
      dplyr::filter(dataset %in% match.arg(datasets, standardizers$dataset, several.ok = TRUE))
  }

  # Main list of datasets
  datasets <- selected_standardizers$dataset

  # Gather data from each standardizer
  gather_data <- function(row) {
    row$standardize_fun[[1]](
      verbose = verbose,
      force_redownload = force_redownload,
      use_extended = use_extended && row$extend,
      include_in_output = include_in_output,
      keep_only_last_in_year = keep_only_last_in_year,
      release_year = row$release_year
    )
  }

  # Loop over rows of selected_standardizers to gather data
  democracy_data <- purrr::map(
    split(selected_standardizers, selected_standardizers$dataset),
    ~gather_data(.x)
  ) |>
    purrr::list_rbind(names_to = "dataset")

  democracy_data <- democracy_data |>
    dplyr::mutate(measure = dplyr::case_when(dataset == "polityIV" ~ paste0(measure, "IV"),
                                             TRUE ~ measure))

  # Optionally scale scores
  if (scale_scores) {
    democracy_data <- democracy_data |>
      dplyr::group_by(measure) |>
      dplyr::mutate(value = as.numeric(scale(value))) |>
      dplyr::ungroup()
  }

  if(prefer_successor) {
    democracy_data <- select_successor(democracy_data)
  }

  if(fix_PIPE) {
    democracy_data <- fix_PIPE(democracy_data)
  }

  if(enforce_GW_enddates) {
    democracy_data <- enforce_enddates(democracy_data)
  }

  # Output format: wide or long
  if (output_format == "wide") {
    democracy_data <- democracy_data |>
      tidyr::pivot_wider(
        names_from = measure,
        values_from = value,
        id_cols = all_of(c(include_in_output, "year"))
      )
  } else {
    democracy_data <- democracy_data |>
      dplyr::group_by(measure) |>
      dplyr::mutate(
        index_type = dplyr::case_when(
          dplyr::n_distinct(value, na.rm = TRUE) == 2 ~ "dichotomous",
          dplyr::n_distinct(value, na.rm = TRUE) == 3 ~ "trichotomous",
          dplyr::n_distinct(value, na.rm = TRUE) < 25 ~ "ordinal",
          TRUE ~ "continuous"
        )
      ) |>
      dplyr::ungroup()
  }

  democracy_data |>
    dplyr::arrange(across(all_of(c("extended_country_name", "GWn", "cown", "year"))))
}

select_successor <- function(democracy_data) {
  year <- cown <- dataset <- panel <- extended_country_name <- NULL
  original_country_name <- value <- NULL

  # Germany 1990
  democracy_data <- democracy_data |>
    dplyr::filter(!(extended_country_name == "German Federal Republic" & 
                    year == 1990 & cown == 260))

  # Yugoslavia
  democracy_data <- democracy_data |>
    dplyr::filter(!((extended_country_name == "Yugoslavia" & year == 1991 & 
                     original_country_name %in% "YUGOSLAVIA, FED. REP." &
                     dataset == "bmr"))) |>
    dplyr::distinct()

  # Austria
  democracy_data <- democracy_data |>
    dplyr::filter(!((extended_country_name == "Austria" & year == 1918 & 
                     original_country_name %in% c("Austria-Hungary (Austria)") &
                     dataset == "PIPE"))) 

  # Ethiopia
  democracy_data <- democracy_data |>
    dplyr::filter(!((extended_country_name == "Ethiopia" & year == 1993 & 
                     dataset %in% c("polity5", "polityIV") &
                     value == 0))) 

  # Italy
  democracy_data <- democracy_data |>
    dplyr::filter(!((extended_country_name == "Italy/Sardinia" & year == 1861 & 
                     original_country_name == "Sardinia"))) 

  # Russia
  democracy_data <- democracy_data |>
    dplyr::filter(!((extended_country_name == "Russia (Soviet Union)" & 
                     year %in% c(1991, 1922) & 
                     original_country_name == "USSR"))) 
  
  # Sudan
  democracy_data <- democracy_data |>
    dplyr::filter(!((extended_country_name == "Sudan" & 
                     year %in% c(2011) & 
                     original_country_name == "Sudan"))) 
  
  # Vietnam
  democracy_data <- democracy_data |>
    dplyr::filter(!((extended_country_name == "Vietnam (Annam/Cochin China/Tonkin)" & 
                     year %in% c(1945:1953) & 
                     original_country_name == "Vietnam, North"))) 

  democracy_data <- democracy_data |>
    dplyr::filter(!((extended_country_name == "Vietnam, Democratic Republic of" & 
                     year %in% c(1975) & 
                     original_country_name == "Vietnam, Republic of"))) 

  democracy_data <- democracy_data |>
    dplyr::filter(!((extended_country_name == "Vietnam, Democratic Republic of" & 
                     year %in% c(1976) & 
                     dataset %in% c("pitf", "polity5", "polityIV") &
                     original_country_name == "Vietnam"))) 

  democracy_data <- democracy_data |>
    dplyr::filter(!((extended_country_name == "Vietnam, Democratic Republic of" & 
                     year %in% c(1976) & 
                     dataset == "uds_2010" &
                     value < -0.7))) 
  
  democracy_data <- democracy_data |>
    dplyr::filter(!((original_country_name  == "Vietnam" & 
                     year %in% c(1945:1953) & 
                     dataset %in% c("LIED")))) 

 
  # Yemen
  democracy_data <- democracy_data |>
    dplyr::filter(!((extended_country_name == "Yemen (Arab Republic of Yemen)" & 
                     year %in% c(1990) & 
                     dataset %in% c("PIPE", "polity5", "polityIV", "polyarchy_dimensions") &
                     original_country_name %in% c("Yemen North",
                                                  "Yemen, North",
                                                   "Yemennorth")))) 
  
  democracy_data <- democracy_data |>
    dplyr::filter(!((extended_country_name == "Yemen (Arab Republic of Yemen)" & 
                     year %in% c(1990) & 
                     cown != 679))) 
  
  democracy_data <- democracy_data |>
    dplyr::filter(!((extended_country_name == "Yemen (Arab Republic of Yemen)" & 
                     year %in% c(1990) & 
                     dataset == "uds_2010" &
                     value < -0.5))) 
  
  democracy_data
}

fix_PIPE <- function(democracy_data) {
  dataset <- original_country_name <- year <- NULL
  # PIPE
  democracy_data <- democracy_data |>
    dplyr::filter(!(dataset == "PIPE" & original_country_name == "Austria-Hungary (Austria)" & year <= 1918),
                  !(dataset == "PIPE" & original_country_name == "Czech Republic" & year <= 1992),
                  !(dataset == "PIPE" & original_country_name == "Austria-Hungary (Hungary)" & year <= 1918),
                  !(dataset == "PIPE" & original_country_name == "Vietnam, North" & year <= 1870),
                  !(dataset == "PIPE" & original_country_name == "Vietnam" & year %in% c(1954:1975)),
                  !(dataset == "PIPE" & original_country_name == "Turkey" & year < 1922),
                  !(dataset == "PIPE" & original_country_name == "North Korea" & year <= 1870),
                  !(dataset == "PIPE" & original_country_name == "South Korea" & year <= 1870),
                  !(dataset == "PIPE" & original_country_name == "Pakistan" & year %in% c(1950:1970)),
                  !(dataset == "PIPE" & original_country_name == "Serbia" & year %in% c(1990)),
                  !(dataset == "PIPE" & original_country_name == "Serbia And Montenegro" & year %in% c(1990:1991)))
  
  democracy_data
}

enforce_enddates <- function(democracy_data, target_panel = "GW") {
  dataset <- measure <- extended_country_name <- year <- panel <- NULL
  enddate <- closest <- last_year <- NULL
  browser()
  DEBUG <- FALSE
 
  # Check for duplicates
  if(DEBUG) {
    democracy_data |>
      distinct() |>
      count(dataset, measure, extended_country_name, year) |>
      filter(n > 1)
  }
  
  # Fix endddates
  countries_no_longer_existing <- data |>
    dplyr::select(extended_country_name, ends_with("GW_enddate")) |>
    tidyr::pivot_longer(cols = ends_with("GW_enddate"), names_to = "panel", values_to = "enddate") |>
    dplyr::mutate(panel = stringr::str_remove(panel, "_enddate"),
                  panel = ifelse(panel %in% c("GW", "cow"), paste0(panel, "n"), panel)) |>
    dplyr::filter(panel %in% "GWn") |>
    group_by(extended_country_name ) |>
    filter(!any(is.na(enddate))) |>
    distinct() |>
    dplyr::group_by(extended_country_name, panel) |>
    dplyr::distinct() |>
    dplyr::group_by(extended_country_name) |>
    dplyr::filter(enddate == max(enddate),
                  !extended_country_name %in% c("Vietnam (Annam/Cochin China/Tonkin)",
                                                "Korea")) |>
    dplyr::mutate(last_year = lubridate::year(enddate + 1))

  democracy_data <- democracy_data |>
    anti_join(countries_no_longer_existing,
              by = join_by(extended_country_name, closest(year > last_year)))


  if(DEBUG) {
    # Check for other problem cases
    democracy_data <- democracy_data |>
      dplyr::group_by(dataset, measure, extended_country_name, year) |>
      dplyr::mutate(problem_case =
                      dplyr::case_when(dplyr::n_distinct(original_country_name) > 1 ~ TRUE,
                                       TRUE ~ FALSE),
                    more_than_one = n() > 1) |>
      dplyr::ungroup()

  }

  democracy_data
}
