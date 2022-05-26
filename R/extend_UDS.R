
#'Prepare democracy data before replicating the UDS model
#'
#'This function is designed to take the democracy data included in this package
#'and put it in a form suitable for use with the [mirt] package to replicate the
#'UDS model. It takes a data frame and tries to determine, from the column
#'names, which variables contain democracy scores.
#'
#'If the column names contain the strings `arat`, `blm`, `bollen`,`wgi`,
#'`hadenius`, `munck`, `pacl`, `peps`, `polyarchy_inclusion_dimension`,
#'`polyarchy_contestation_dimension`, `polity`, `prc`, `v2x`, `vanhanen_pmm`, or
#'`vanhanen_democratization`, the function performs the following
#'transformations by default:
#'
#'`arat`: Following Pemstein, Meserve, and Melton's replication code (Pemstein,
#'Meserve, and Melton 2013), the function cuts Arat (1991)'s 0-109 democracy
#'score ([arat_pmm]) into 7 intervals with the following cutoffs: 50, 60, 70,
#'80, 90, and 100. The resulting score is ordinal from 1 to 8.
#'
#'`bollen`: Following Pemstein, Meserve, and Melton's replication code
#'(Pemstein, Meserve, and Melton 2013), the function cuts Bollen's (2001)'s
#'0-100 democracy score ([bollen_pmm]) into 10 intervals with the following
#'cutoffs: 10,20,30,40,50,60,70,80, and 90. The resulting score is ordinal from
#'1 to 10.
#'
#'`bti`: the function assumes this is the Bertelsmann Transformation Index
#'([bti]), and it will cut it into 20 categories. The resulting score is ordinal
#'from 1 to 20.
#'
#'`wgi`: If the World Governance Indicator's index of voice and accountability
#'([wgi]) is included in the file, the function cuts it into 20 categories. The
#'resulting score is ordinal from 1 to 20.
#'
#'`hadenius_pmm`: Following Pemstein, Meserve, and Melton's replication code
#'(Pemstein, Meserve, and Melton 2013), the function cuts Hadenius (1992)'s 0-10
#'democracy score ([hadenius_pmm]) into 8 intervals with the following cutoffs:
#'1, 2, 3, 4, 7, 8, and 9. The resulting score is ordinal from 1 to 8.
#'
#'`munck`: Following Pemstein, Meserve, and Melton's replication code (Pemstein,
#'Meserve, and Melton 2013), the function cuts Munck's (2009)'s 0-1 democracy
#'score ([munck_pmm]) into 4 intervals with the following cutoffs: 0.5,0.5,0.75,
#'and 0.99. The resulting score is ordinal from 1 to 4.
#'
#'`peps`: If any of the variants of the Participation-Enhanced Polity Score
#'(Moon et al 2006, [peps]) is included in the file, the function rounds its
#'value (eliminates the decimal) and then transforms it into an ordinal measure
#'from 1 to 21.
#'
#'`polity`: Following Pemstein, Meserve, and Melton's replication code
#'(Pemstein, Meserve, and Melton 2013), the function takes the polity scores
#'([polity] or [polityIV])and puts NA for any values below -10, and then
#'transforms it into an ordinal measure from 1 to 21.
#'
#'`polyarchy_inclusion_dimension`, `polyarchy_contestation_dimension`: If any of
#'the polyarchy inclusion or contestation dimensions from Coppedge, Alvarez and
#'Maldonado (2008, [polyarchy]) are included, it cuts them into into 20
#'categories. The resulting score is ordinal from 1 to 20.
#'
#'`csvdmi` or `svdmi_2016`: the function assumes this is one of the continuous
#'indexes of democracy from the SVMDI dataset (Grundler and Krieger 2018,
#'[svmdi]), and it will cut it into 20 categories. The resulting score is
#'ordinal from 1 to 20.
#'
#'`v2x`: If any of the `v2x_` continuous indexes of democracy from the V-Dem
#'dataset (Coppedge et al 2021) are included in the file, the function cuts them
#'into 20 categories. The resulting score is ordinal from 1 to 20.
#'
#'`vanhanen_democratization` or `vanhanen_pmm`: Following Pemstein, Meserve, and
#'Melton's replication code (Pemstein, Meserve, and Melton 2013), the function
#'cuts Vanhanen's (2012)'s index of democratization ([vanhanen]) into 8
#'intervals with the following cutoffs: 5,10,15,20,25,30, and 35. The resulting
#'score is ordinal from 1 to 8.
#'
#'The function also recognizes the following column names (or partial column
#'names - it also recognizes, e.g., `pmm_blm`) as measures of democracy: `anrr`
#'(from Acemoglu, Naidu, Restrepo, and Robinson 2019, [anrr]), `anckar` (from
#'Anckar and Fredriksson 2018 [anckar]), `blm` (from Bowman, Lehoucq, and
#'Mahoney 2005, [blm]), `bmr` (from Boix, Miller, and Rosato 2012, [bmr]),
#'`doorenspleet` (from Doorenspleet 2000, [doorenspleet]), `e_v2x` (the
#'"ordinal" indexes from the V-dem project, Coppedge et al 2021), `freedomhouse`
#'or `fh` (from Freedom House, [fh] - freedom scale must be reversed so that
#'"more freedom" is higher), `gwf` (from Geddes, Wright, and Frantz 2014, [gwf]
#', the dichotomous democracy indicator only), `kailitz` (from Kailitz 2013 -
#'democracy/non-democracy indicator, [kailitz]), `lied` or `lexical_index` (from
#'Skaaning, Gerring, and Bartusevicius 2015, [LIED]), `mainwaring` (from
#'Mainwaring and Perez Linan 2008, [mainwaring]), `magaloni` (from Magaloni,
#'Min, Chu 2013 - democracy/non-democracy indicator, [magaloni]), `pacl` (from
#'Cheibub, Gandhi, and Vreeland 2010, [pacl] or [pacl_update]), `pitf` (from
#'Goldstone et al 2010 or Taylor and Ulfelder 2015, [pitf]), `polyarchy` (from
#'Coppedge and Reinicke 1991, [polyarchy]), `prc` (from Gasiorowski 1996 or
#'Reich 2002, [prc]), `PIPE` (from Przeworski 2010, [PIPE]), `reign` (from Bell
#'2016, [reign]), `svmdi` (from Grundler and Krieger 2018, 2016, [svmdi]),
#'`svolik` (from Svolik 2012, democracy/dictatorship indicator only, [svolik]),
#'`ulfelder` (from Ulfelder 2012, [ulfelder]), `utip` (from Hsu 2008, [utip]),
#'and `wth` or `wahman_teorell_hadenius` (from Wahman, Teorell, and Hadenius
#'2013, [wahman_teorell_hadenius]). In each of these cases the function
#'transforms the values of these scores by running
#'`as.numeric(unclass(factor(x)))`, which transforms them into ordinal variables
#'from 1 to the number of categories.
#'
#'For details of these scores, see the documentation for
#'[generate_democracy_scores_dataset] or the documentation for the individual
#'datasets.
#'
#'It is also possible to change these defaults.
#'
#'@section Note: Warning! The function does not perform any sanity checks. It
#'  will try to transform anything that has the right name. You should always
#'  check that the results make sense.
#'
#'@param data A dataset of democracy scores. For the function to do anything,
#'  the column names must contain at least one of the following strings:
#'  [anckar], [anrr], [arat], [blm], [bmr], [bti], [bollen],
#'  [doorenspleet], [wgi], [gwf], [hadenius], [kailitz], [lied],
#'  [munck], [pacl], [peps], [polyarchy], [polity], [prc], [PIPE],
#'  [svmdi], [svolik], [ulfelder], [utip], `v2x`,
#'  `vanhanen_democratization` (from [vanhanen]), [vanhanen_pmm], or
#'  [wth]. For details of these variables, see
#'  the documentation for [generate_democracy_scores_dataset] or the
#'  documentation for the individual datasets.
#'
#'@param .funs A names list of functions to modify the columns. It defaults to
#'  the following:
#'
#'  \code{funs(arat = cut(., breaks = c(0, 50, 60, 70, 80, 90, 100, 109), labels
#'  = 1:7, include.lowest = TRUE, right = FALSE),
#'
#'  hadenius = cut(., breaks =  c(0, 1, 2, 3, 4, 7, 8, 9, 10), labels = 1:8,
#'  include.lowest = TRUE, right = FALSE),
#'
#'  bollen = cut(., breaks = c(0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100),
#'  labels = 1:10, include.lowest = TRUE, right = FALSE),
#'
#'  bti = ~cut(.x, breaks = 20, include.lowest = TRUE, right = FALSE,
#'  ordered_result = TRUE),
#'
#'  vanhanen = cut(., breaks = c(0, 5, 10, 15, 20, 25, 30, 35, 50), labels =
#'  1:8, include.lowest = TRUE, right = FALSE),
#'
#'  munck = cut(., breaks = c(0, 0.5, 0.75, 0.99, 1), labels = 1:4,
#'  include.lowest = TRUE, right = FALSE),
#'
#'  polyarchy_dimensions = cut(., breaks = 20, include.lowest = TRUE, right =
#'  FALSE, ordered_result = TRUE),
#'
#'  polity = ifelse(. < -10, NA, .), v2x = cut(., breaks = 20, include.lowest =
#'  TRUE, right = FALSE, ordered_result = TRUE),
#'
#'  v2x_* = cut(., breaks = 20, include.lowest = TRUE, right = FALSE,
#'  ordered_result = TRUE),
#'
#'  svmdi = cut(., breaks = 20, include.lowest = TRUE, right = FALSE,
#'  ordered_result = TRUE),
#'
#'  eiu = cut(., breaks = 20, include.lowest = TRUE, right = FALSE,
#'  ordered_result = TRUE),
#'
#'  wgi = cut(., breaks = 20, include.lowest = TRUE, right = FALSE,
#'  ordered_result = TRUE),
#'
#'  peps = round(.),
#'
#'  other = as.numeric(unclass(factor(.))))}
#'
#'@return A data frame with the transformed scores, if any.
#'@import dplyr
#'@export
#'@encoding UTF-8
#'
#' @examples
#' democracy <- generate_democracy_scores_dataset(selection = "pmm", output_format = "wide")
#' summary(democracy)
#' summary(prepare_democracy_data(democracy))
#'
#'@references
#'
#'`r stringr::str_remove(utils::capture.output(print(democracyData::bibliography)), "^\\[.+?\\] ")`
#'
prepare_democracy_data <- function(data,
                         .funs) {

  other_vars <- c("anckar", "anrr", "blm", "bmr",
                  "doorenspleet", "fh|freedomhouse", "gwf",
                  "lied|lexical_index", "mainwaring",
                  "magaloni", "pacl|cgv", "pitf", "polyarchy",
                  "prc", "PIPE|przeworski", "svolik", "svmdi_2016",
                  "ulfelder", "utip", "kailitz", "e_v2x",
                  "wth|wahman_teorell", "reign", "dsvmdi")

  . <- NULL

  if(missing(.funs)) {
    .funs <- list(
      arat = ~cut(.x, breaks = c(0, 50, 60, 70, 80, 90, 100, 109),
            labels = 1:7, include.lowest = TRUE, right = FALSE),
      bti = ~cut(.x, breaks = 20, include.lowest = TRUE,
                 right = FALSE, ordered_result = TRUE),
      hadenius = ~cut(.x, breaks =  c(0, 1, 2, 3, 4, 7, 8, 9, 10),
            labels = 1:8, include.lowest = TRUE, right = FALSE),
      bollen = ~cut(.x, breaks = c(0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100),
            labels = 1:10, include.lowest = TRUE, right = FALSE),
      vanhanen = ~cut(.x, breaks = c(0, 5, 10, 15, 20, 25, 30, 35, 50),
            labels = 1:8, include.lowest = TRUE, right = FALSE),
      munck = ~cut(.x, breaks = c(0, 0.5, 0.75, 0.99, 1),
            labels = 1:4, include.lowest = TRUE, right = FALSE),
      polyarchy_dimensions = ~cut(.x, breaks = 20, include.lowest = TRUE,
                right = FALSE, ordered_result = TRUE),
      polity = ~ifelse(.x < -10, NA, .x),
      v2x = ~cut(.x, breaks = 20, include.lowest = TRUE,
                right = FALSE, ordered_result = TRUE),
      svmdi = ~cut(.x, breaks = 20, include.lowest = TRUE,
                right = FALSE, ordered_result = TRUE),
      wgi = ~cut(.x, breaks = 20, include.lowest = TRUE,
                right = FALSE, ordered_result = TRUE),
      eiu = ~cut(.x, breaks = 20, include.lowest = TRUE,
                right = FALSE, ordered_result = TRUE),
      bti = ~cut(.x, breaks = 20, include.lowest = TRUE,
                right = FALSE, ordered_result = TRUE),
      peps = ~round(.x),
      other = ~as.numeric(unclass(factor(.x))))
  }

  other_pattern <- paste(c(other_vars,
                           "arat",
                           "bti",
                           "hadenius_pmm",
                           "bollen",
                           "munck",
                           "polity",
                           "vanhanen",
                           "v2x",
                           "svmdi",
                           "wgi",
                           "eiu",
                           "peps"),collapse="|")

  data <- data %>%
    mutate(across(matches("arat"), .funs[['arat']])) %>%
    mutate(across(matches("hadenius_pmm"), .funs[['hadenius']])) %>%
    mutate(across(matches("bollen"), .funs[['bollen']])) %>%
    mutate(across(matches("bti"), .funs[['bti']])) %>%
    mutate(across(matches("pmm_vanhanen|vanhanen_"),
              .funs[['vanhanen']])) %>%
    mutate(across(matches("munck"), .funs[['munck']])) %>%
    mutate(across(matches("polyarchy_(inclusion|contestation)_dimension"),
              .funs[['polyarchy_dimensions']])) %>%
    mutate(across(matches("polity"), .funs[['polity']])) %>%
    mutate(across(starts_with("v2x"), .funs[['v2x']])) %>%
    mutate(across(c(starts_with("csvmdi"), starts_with("svmdi_2016")), .funs[['svmdi']])) %>%
    mutate(across(matches("wgi"), .funs[['wgi']])) %>%
    mutate(across(matches("eiu"), .funs[['eiu']])) %>%
    mutate(across(matches("peps"), .funs[['peps']])) %>%
    mutate(across(matches(other_pattern), .funs[['other']]))

  democracy_vars <- names(data)[str_detect(names(data), other_pattern)]

  data %>%
    remove_empty_rows(democracy_vars)

}


#' Probability that a country-year is more democratic than another
#'
#' @param data A UD dataset with a country_name, year, latent variable mean and
#'   latent variable standard deviation columns at least. Little sanity checking
#'   is performed - careful!
#' @param country1 The first country to compare.
#' @param country2 The second country to compare. Can be the same as
#'   `country1`
#' @param years Either a single year, or a length 2 vector of years.
#' @param mean_col The name of the column that contains the mean of the latent
#'   variable (defaults to `z1`)
#' @param sd_col The name of the column that contains the standard error of the
#'   latent variable (defaults to `se_z1`)
#' @param country_col The name of the column that contains the country name
#'   (defaults to `extended_country_name`)
#' @param year_col The name of the column that contains the years (defaults to
#'   `year`)
#'
#' @return The probability that the first country-year in the comparison is more
#'   democratic than the second.
#'
#' @export
#'
#' @importFrom stats pnorm
#'
#' @examples
#' # Probability that the USA in 2000 was more democratic than Brazil in 2000,
#' # according to 2010 release of UDS
#' prob_more(uds_2010, "United States of America","Brazil",
#'           2000, mean_col="mean", sd_col="sd")
#' # Probability that Brazil in 1980 was more democratic than the USA in 1980,
#' # according to 2010 release of UDS
#' prob_more(uds_2010, "Brazil","United States of America",
#'           1980, mean_col="mean", sd_col="sd")
#' # Probability that the USA in 2000 was more democratic than the USA in 1950,
#' # according to 2010 release of UDS
#' prob_more(uds_2010, "United States of America","United States of America",
#'            years = c(2000,1950), mean_col="mean", sd_col="sd")
prob_more <- function(data, country1, country2, years, mean_col = "z1",
                      sd_col = "se_z1",
                      country_col = "extended_country_name",
                      year_col = "year") {

  if(length(years) == 1) {
    years <- c(years, years)
  }
  mu <- data[[mean_col]][ data[[country_col]] == country1 &
                            data[[year_col]] == years[1]] -
    data[[mean_col]][data[[country_col]] == country2  &
                       data[[year_col]] == years[2] ]

  sigma <- sqrt((data[[sd_col]][data[[country_col]] == country1
                                & data[[year_col]] == years[1]])^2 +
                  (data[[sd_col]][data[[country_col]] == country2 &
                                    data[[year_col]] == years[2] ])^2)

  prob <- 1-pnorm(-mu/sigma)
  prob
}

#' Extract cutpoints from a UD model in a tidy format.
#'
#' This function takes a model of the democracy scores and extracts the
#' discrimination parameters, score cutpoints, and standard errors for all the
#' variables involved, putting these into a tidy data frame.
#'
#' @param model A [mirt::SingleGroupClass-class] model
#'   of the democracy scores.
#' @param type A string specifying the cutpoint type. Can be (an abbreviation
#'   of) "score" (for score cutpoints) or "discrimination" (for discrimination
#'   parameters). Default is "score."
#'
#' @return A [tibble] with either score cutpoints for each variable used to
#'   construct the latent scores in terms of the latent variable (the default), or
#'   discrimination parameters for each variable used to construct the index.
#'   For the score cutpoints (`type = 'score'`), the columns
#'   `estimate`, `pct975`, and `pct025` report the IRT
#'   parametrization of the model estimates, a normalized measure in the same
#'   scale as the latent variable.
#' @export
#'
#' @import dplyr
#' @import mirt
#'
#' @examples
#' \donttest{
#' # Replicate the official UDS 2011 release and calculate its cutpoints
#' library(dplyr)
#' library(mirt)
#' democracy_data <- generate_democracy_scores_dataset(selection = "_pmm",
#' output_format = "wide")
#'
#' democracy_data <- prepare_democracy_data(democracy_data)
#'
#' replication_2011_model <- mirt(democracy_data %>% select(matches("pmm")),
#' model = 1, itemtype = "graded", SE = TRUE, verbose = FALSE)
#'
#' cutpoints(replication_2011_model)}
cutpoints <- function(model, type = "score") {
  stopifnot(class(model) == "SingleGroupClass")

  type <- match.arg(type, c("score", "discrimination"))

  # A hack to get around the "no visible binding for global variable" note

  par <- CI_2.5 <- CI_97.5 <- variable <- se <- NULL

  estimate <- pct025 <- pct975 <- coef_type <- coef <- NULL

  coefs <- as.data.frame(coef(model, as.data.frame = TRUE))

  coefs <- coefs %>%
    mutate(variable = rownames(coefs),
           coef_type = stringr::str_extract(variable,"a([0-9]+)?$|d([0-9]+)?$"),
           variable = stringr::str_replace(variable,"\\.a([0-9]+)?$|\\.d([0-9]+)?$",""))

  coefs <- coefs %>%
    group_by(variable) %>%
    mutate(estimate = (par)/-(par[1]),
           pct975 = (CI_2.5)/-(CI_2.5[1]),
           pct025 = (CI_97.5)/-(CI_97.5[1]),
           se = abs(pct975 - estimate)/1.96) %>%
    filter(!is.na(coef_type))

  num_obs <- model@Data$data %>%
    as_tibble() %>%
    summarise_all(~sum(!is.na(.))) %>%
    tidyr::gather("variable", "num_obs")

  coefs <- coefs %>%
    left_join(num_obs,
              by = "variable")

  if(type == "score") {
    coefs <- coefs %>%
      filter(!grepl("^a",coef_type)) %>%
      select(variable,
             estimate,
             pct025,
             pct975,
             se,
             num_obs)
  } else {
    coefs <- coefs %>%
      filter(grepl("^a",coef_type)) %>%
      mutate(estimate = par,
             pct025 = CI_2.5,
             pct975 = CI_97.5) %>%
      select(variable,
             estimate,
             pct025,
             pct975,
             num_obs)
  }

  coefs %>% ungroup()


}

#' Extract rater info from a UD model in a tidy format.
#'
#' @param model A [mirt::SingleGroupClass-class] model
#'   of the democracy scores.
#'
#' @return A data frame with rater information for each democracy index over the
#'   range of the latent variable `theta`.
#' @export
#'
#' @import dplyr
#'
#' @examples
#' \donttest{
#' # Replicate the official UDS scores (2011 release)
#' library(dplyr)
#' library(mirt)
#' democracy_data <- generate_democracy_scores_dataset(selection = "_pmm", output_format = "wide")
#'
#' democracy_data <- prepare_democracy_data(democracy_data)
#'
#' replication_2011_model <- mirt(democracy_data %>% select(matches("pmm")),
#' model = 1,
#' itemtype = "graded",
#' SE = TRUE, verbose = FALSE)
#'
#' raterinfo(replication_2011_model)}
raterinfo <- function(model) {
    raters <- dimnames(model@Data$data)[[2]]
    Theta <- model@Model$Theta
    rater.info <- data.frame()

    for (i in raters) {
        rater.info <- suppressWarnings(bind_rows(rater.info,
                                data.frame(rater = i,
                                           theta = as.numeric(Theta),
                                           info = iteminfo(extract.item(model, i),
                                                           Theta = Theta))))
    }
    rater.info %>%
      as_tibble()
}

#' Extract UD scores from a UD model
#'
#' This function is a simple wrapper for \code{fscores(model, full.scores =
#' TRUE, full.scores.SE = TRUE, ...)} that returns scores in a tidy data frame
#' instead of a matrix. More fine-grained control can be achieved by using
#' [mirt::fscores] directly.
#'
#' @param model a [mirt::SingleGroupClass-class] model.
#' @param adjust_to_dichotomous Whether to calculate an adjusted score where the
#'   midpoint represents the average cutpoint for dichotomous scores. See the
#'   vignette for more details. Default is `TRUE`.
#' @param as_prob Whether to output scores as 0-1 probability scales. See the
#'   vignette for more details. Default is `TRUE`.
#'
#' @return A data frame with latent variable democracy scores (the equivalent of
#'   the UDS posterior means) for all country-years in the data, with standard
#'   errors and 95% confidence intervals.
#'
#' @template standard-variables
#' @export
#'
#' @import dplyr
#' @import mirt
#' @importFrom rlang .data
#' @importFrom stats pnorm
#'
#' @examples
#' \donttest{
#' # Replicate the official UDS scores (2011 release)
#' library(dplyr)
#' library(mirt)
#' democracy_data <- generate_democracy_scores_dataset(selection = "_pmm", output_format = "wide")
#'
#' democracy_data <- prepare_democracy_data(democracy_data)
#'
#' replication_2011_model <- mirt(democracy_data %>% select(matches("pmm")),
#' model = 1, itemtype = "graded", SE = TRUE, verbose = FALSE)
#'
#' replication_2011_scores <- democracy_scores(model = replication_2011_model)
#'
#' }
democracy_scores <- function(model,
                             adjust_to_dichotomous = TRUE,
                             as_prob = TRUE) {

  identifiers <- c("extended_country_name",
                  "year",
                  "GWn",
                  "cown",
                  "polity_ccode",
                  "in_GW_system",
                  "uds_2010_mean",
                  "uds_2011_mean",
                  "uds_2014_mean")

  . <- NULL

  stopifnot("SingleGroupClass" %in% class(model))

  scores <- mirt::fscores(model, full.scores = TRUE, full.scores.SE = TRUE) %>%
    dplyr::as_tibble() %>%
    dplyr::rename_with(~tolower(.) %>%
                         stringr::str_replace("f1", "z1"),
                       dplyr::matches("F1"))  %>%
    dplyr::mutate(dplyr::across(dplyr::all_of("z1"),
                         list(pct975 = ~. + 1.96 * .data$se_z1,
                              pct025 = ~. - 1.96 * .data$se_z1)))

  if(adjust_to_dichotomous) {
    avg_dichotomous <- cutpoints(model) %>%
      dplyr::group_by(dplyr::across(dplyr::all_of("variable"))) %>%
      dplyr::filter(n() == 1)

    avg_dichotomous <- mean(avg_dichotomous$estimate)

    scores <- scores %>%
      dplyr::mutate(dplyr::across(dplyr::starts_with("z1"),
                    list(adj = ~. - avg_dichotomous)))
  }

  if(as_prob) {
    scores <- scores %>%
      dplyr::mutate(dplyr::across(dplyr::starts_with("z1"),
                list(as_prob = ~stats::pnorm(.))))
  }

  scores %>% dplyr::ungroup()
}

#' Removes empty rows (rows with all NAs) from a data frame
#'
#' @param df A data frame
#' @param vars The variables to select
#'
#' @return The original data frame, with the empty rows for the variables
#'   selected removed
#' @export
#'
#' @examples
#'
#' df <- data.frame(a = c(1,2,3,NA, 5), b = c(NA,1,2,NA, 3), c = 1:5)
#' remove_empty_rows(df, a:b)
#'
#' # Different from
#' na.omit(df)
remove_empty_rows <- function(df, vars) {
  empty_rows <- df %>%
    dplyr::select({{vars}})

  num_cols <- ncol(empty_rows)

  empty_rows <- empty_rows %>%
    is.na() %>%
    rowSums()

  empty_rows <- empty_rows == num_cols

  df %>%
    dplyr::filter(!empty_rows)
}


#' Generates the extended UDS scores from the latest democracy data in this
#' package
#'
#' @param verbose Whether to print diagnostic information about what the
#'   function is doing, including information from [mirt::mirt] about the model
#'   being fit. Default is `FALSE`.
#'
#' @return A [tibble] described in [extended_uds]. Right now there's no
#'   flexibility at all to choose the variables to generate this data, though
#'   this might change in the future. See
#'   `vignette("Replicating_and_extending_the_UD_scores")` for more info on how
#'   to generate these scores for arbitrary measures.
#' @export
#' @import dplyr
#'
#' @examples
#' \dontrun{
#' extended_uds <- generate_extended_uds()
#' }
generate_extended_uds <- function(verbose = FALSE) {

  extended_country_name <- vdem_country_name <- name <- NULL

  identifiers <- c("extended_country_name", "GWn", "cown", "in_GW_system", "year")

  vars <- c("anckar_democracy", "anrr_democracy", "blm", "bmr_democracy_femalesuffrage",
            "bnr_extended", "bti_democracy", "csvmdi", "doorenspleet", "eiu",
            "fh_electoral", "fh_total_reversed", "gwf_democracy_extended_strict",
            "kailitz_tri", "lexical_index", "magaloni_democracy_extended",
            "mainwaring", "pacl", "pacl_update", "PEPS1v", "pitf", "pmm_arat",
            "pmm_bollen", "pmm_hadenius", "pmm_munck", "polity2",
            "polyarchy_contestation_dimension", "polyarchy_inclusion_dimension",
            "polyarchy_original_contestation", "polyarchy_original_polyarchy",
            "prc", "reign_democracy", "svolik_democracy", "ulfelder_democracy_extended",
            "utip_trichotomous", "v2x_polyarchy", "vanhanen_democratization",
            "wgi_democracy", "wth_democrobust")

  extended_data <- generate_democracy_scores_dataset(output_format = "wide",
                                                     verbose = verbose)

  extended_data <- extended_data %>%
    dplyr::select(dplyr::any_of(c(identifiers, vars)))

  if(verbose) {
    message(stringr::str_glue("Using {vars} to generate extended uds..."))
    message("Now preparing data for use with mirt...")
  }

  extended_data <- prepare_democracy_data(extended_data)

  if(verbose) {
    message("Now fitting mirt model...")
  }

  extended_uds_model <- mirt::mirt(extended_data %>%
                                     select(-dplyr::any_of(identifiers)),
                                   model = 1, itemtype = "graded", SE = TRUE,
                                   verbose = verbose,
                                   technical = list(NCYCLES = 1000))

  if(verbose) {
    print(extended_uds_model)
    print(summary(extended_uds_model))
    print(extended_uds_model@time)

  }

  if(verbose) {
    message("Extracting scores and binding to identifiers...")
  }

  extended_uds <- democracy_scores(extended_uds_model)

  extended_uds <- bind_cols(extended_data %>%
                              dplyr::select(any_of(identifiers)),
                            extended_uds)

  if(verbose) {
    message("Adding number of measures and finalizing...")
  }

  extended_data_vars <- extended_data  %>%
    tidyr::pivot_longer(-dplyr::any_of(identifiers),
                        values_drop_na = TRUE) %>%
    dplyr::group_by(dplyr::across(dplyr::any_of(identifiers))) %>%
    dplyr::summarise(num_measures = dplyr::n_distinct(name),
                     measures = list(unique(name)))

  extended_uds <- extended_uds %>%
    dplyr::left_join(extended_data_vars)

  extended_uds

}

