standardize_selection <- function(x, include_in_output) {

  value <- NULL

  x |>
    dplyr::filter(!is.na(value)) |>
    dplyr::select(dplyr::all_of(c(include_in_output, "year", "measure", "value")), dplyr::matches("_country$|ulfelder_scode|vdem_country_name")) |>
    dplyr::select(-dplyr::any_of("governing_country")) |>
    dplyr::mutate(value = as.numeric(value)) |>
    dplyr::rename_with(~"original_country_name", dplyr::matches("_country$|ulfelder_scode|vdem_country_name"))

}

standardize_fh <- function(force_redownload = FALSE,
                           include_in_output = c("extended_country_name",
                                                 "GWn",
                                                 "cown",
                                                 "in_GW_system"),
                           include_territories = FALSE,
                           verbose = FALSE,
                           measure = "fh_total_reversed",
                           ...) {
  if(verbose) {
    message("Adding Freedom House data")
  }
  if(force_redownload) {
    fh <- download_fh(verbose = verbose,
                      include_in_output = include_in_output,
                      include_territories = include_territories)
  } else {
    fh <- democracyData::fh
  }

  res <- fh |>
    tidyr::pivot_longer(dplyr::all_of(measure),
                        names_to = "measure", values_to = "value")  |>
    standardize_selection(include_in_output = include_in_output)

  stopifnot(!any(is.na(res$extended_country_name)))
  res
}

standardize_fh_pmm <- function(include_in_output = c("extended_country_name",
                                                     "GWn",
                                                     "cown",
                                                     "in_GW_system"),
                               verbose = FALSE,
                               measure = "pmm_freedomhouse",
                               ...) {
  if(verbose) {
    message("Adding fh_pmm data")
  }

  res <- democracyData::fh_pmm |>
    tidyr::pivot_longer(dplyr::all_of(measure),
                        names_to = "measure", values_to = "value") |>
    dplyr::mutate(measure = "pmm_fh") |>
    standardize_selection(include_in_output = include_in_output)

  stopifnot(!any(is.na(res$extended_country_name)))
  res
}

standardize_fh_electoral <- function(force_redownload = FALSE,
                                     include_in_output = c("extended_country_name",
                                                           "GWn",
                                                           "cown",
                                                           "in_GW_system"),
                                     include_territories = FALSE,
                                     verbose = FALSE,
                                     measure = "electoral",
                                     ...) {
  if(verbose) {
    message("Adding Freedom House electoral data")
  }
  if(force_redownload) {
    fh_electoral <- download_fh_electoral(verbose = verbose,
                                          include_in_output = include_in_output,
                                          include_territories = include_territories)
  } else {
    fh_electoral <- democracyData::fh_electoral
  }

  res <- fh_electoral |>
    tidyr::pivot_longer(dplyr::all_of(measure),
                        names_to = "measure", values_to = "value")  |>
    dplyr::mutate(measure = paste0("fh_", measure)) |>
    standardize_selection(include_in_output = include_in_output)

  stopifnot(!any(is.na(res$extended_country_name)))
  res
}

standardize_polity5 <- function(force_redownload = FALSE,
                                include_in_output = c("extended_country_name",
                                                      "GWn",
                                                      "cown",
                                                      "in_GW_system"),
                                verbose = FALSE,
                                measure = c("polity", "polity2"),
                                ...) {
  if(verbose) {
    message("Adding Polity V data")
  }
  if(force_redownload) {
    polity5 <- download_polity_annual(verbose = verbose,
                                      include_in_output = include_in_output)
  } else {
    polity5 <- democracyData::polity5
  }

  res <- polity5 |>
    dplyr::mutate(across(measure, \(x) ifelse(x < -10, NA, x))) |>
    tidyr::pivot_longer(dplyr::all_of(measure),
                        names_to = "measure", values_to = "value") |>
    standardize_selection(include_in_output = include_in_output)

  stopifnot(!any(is.na(res$extended_country_name)))
  res
}

standardize_polity4 <- function(force_redownload = FALSE,
                                include_in_output = c("extended_country_name",
                                                      "GWn",
                                                      "cown",
                                                      "in_GW_system"),
                                verbose = FALSE,
                                measure = c("polity", "polity2"),
                                ...) {
  if(verbose) {
    message("Adding Polity IV data")
  }
  if(force_redownload) {
    polity4 <- redownload_polityIV(verbose = verbose,
                                   include_in_output = include_in_output)
  } else {
    polity4 <- democracyData::polityIV
  }

  res <- polity4 |>
    dplyr::mutate(across(measure, \(x) ifelse(x < -10, NA, x))) |>
    tidyr::pivot_longer(dplyr::all_of(measure),
                        names_to = "measure", values_to = "value") |>
    standardize_selection(include_in_output = include_in_output)

  stopifnot(!any(is.na(res$extended_country_name)))
  res
}

standardize_polity_pmm <- function(include_in_output = c("extended_country_name",
                                                         "GWn",
                                                         "cown",
                                                         "in_GW_system"),
                                   verbose = FALSE,
                                   measure = "pmm_polity",
                                   ...) {
  if(verbose) {
    message("Adding polity_pmm data")
  }

  res <- democracyData::polity_pmm |>
    tidyr::pivot_longer(dplyr::all_of(measure),
                        names_to = "measure", values_to = "value") |>
    dplyr::mutate(measure = "pmm_polity") |>
    standardize_selection(include_in_output = include_in_output)

  stopifnot(!any(is.na(res$extended_country_name)))
  res
}

standardize_wgi <- function(force_redownload = FALSE,
                            include_in_output = c("extended_country_name",
                                                  "GWn",
                                                  "cown",
                                                  "in_GW_system"),
                            verbose = FALSE,
                            measure = "Estimate",
                            ...) {
  if(verbose) {
    message("Adding World Governance Indicators data")
  }
  if(force_redownload) {
    wgi <- download_wgi_voice_and_accountability(verbose = verbose)
  } else {
    wgi <- democracyData::wgi
  }

  res <- wgi |>
    tidyr::pivot_longer(dplyr::all_of(measure),
                        names_to = "measure", values_to = "value") |>
    dplyr::mutate(measure = "wgi_democracy") |>

    standardize_selection(include_in_output = include_in_output)

  stopifnot(!any(is.na(res$extended_country_name)))
  res
}

standardize_anckar <- function(force_redownload = FALSE,
                               include_in_output = c("extended_country_name",
                                                     "GWn",
                                                     "cown",
                                                     "in_GW_system"),
                               verbose = FALSE,
                               measure = "democracy",
                               ...) {
  if(verbose) {
    message("Adding Anckar data")
  }

  if(force_redownload) {
    anckar <- redownload_anckar(verbose = verbose)
  } else {
    anckar <- democracyData::anckar
  }


  res <- anckar |>
    tidyr::pivot_longer(dplyr::all_of(measure),
                        names_to = "measure", values_to = "value") |>
    dplyr::mutate(measure = "anckar_democracy") |>
    standardize_selection(include_in_output = include_in_output)

  stopifnot(!any(is.na(res$extended_country_name)))
  res
}

standardize_anrr <- function(include_in_output = c("extended_country_name",
                                                   "GWn",
                                                   "cown",
                                                   "in_GW_system"),
                             verbose = FALSE,
                             measure = "dem",
                             ...) {
  if(verbose) {
    message("Adding Anrr data")
  }

  res <- democracyData::anrr |>
    tidyr::pivot_longer(dplyr::all_of(measure),
                        names_to = "measure", values_to = "value") |>
    mutate(measure = "anrr_democracy") |>
    standardize_selection(include_in_output = include_in_output)

  stopifnot(!any(is.na(res$extended_country_name)))
  res
}

standardize_arat_pmm <- function(include_in_output = c("extended_country_name",
                                                       "GWn",
                                                       "cown",
                                                       "in_GW_system"),
                                 verbose = FALSE,
                                 measure = "pmm_arat",
                                 ...) {
  if(verbose) {
    message("Adding arat_pmm data")
  }

  res <- democracyData::arat_pmm |>
    tidyr::pivot_longer(dplyr::all_of(measure),
                        names_to = "measure", values_to = "value") |>
    standardize_selection(include_in_output = include_in_output)

  stopifnot(!any(is.na(res$extended_country_name)))
  res
}

standardize_arat <- function(include_in_output = c("extended_country_name",
                                                   "GWn",
                                                   "cown",
                                                   "in_GW_system"),
                             verbose = FALSE,
                             measure = "arat_dem",
                             ...) {
  if(verbose) {
    message("Adding Arat original data")
  }

  res <- democracyData::arat |>
    tidyr::pivot_longer(dplyr::all_of(measure),
                        names_to = "measure", values_to = "value") |>
    mutate(measure = "arat") |>
    standardize_selection(include_in_output = include_in_output)

  stopifnot(!any(is.na(res$extended_country_name)))
  res
}

standardize_blm <- function(force_redownload = FALSE,
                            include_in_output = c("extended_country_name",
                                                  "GWn",
                                                  "cown",
                                                  "in_GW_system"),
                            verbose = FALSE,
                            measure = "blm",
                            ...) {
  if(verbose) {
    message("Adding BLM data")
  }

  if(force_redownload) {
    blm <- redownload_blm(verbose = verbose,
                          include_in_output = include_in_output)
  } else {
    blm <- democracyData::blm
  }

  res <- blm |>
    tidyr::pivot_longer(dplyr::all_of(measure),
                        names_to = "measure", values_to = "value") |>
    standardize_selection(include_in_output = include_in_output)

  stopifnot(!any(is.na(res$extended_country_name)))
  res
}

standardize_blm_pmm <- function(include_in_output = c("extended_country_name",
                                                      "GWn",
                                                      "cown",
                                                      "in_GW_system"),
                                verbose = FALSE,
                                measure = "pmm_blm",
                                ...) {
  if(verbose) {
    message("Adding blm_pmm data")
  }

  res <- democracyData::blm_pmm |>
    tidyr::pivot_longer(dplyr::all_of(measure),
                        names_to = "measure", values_to = "value") |>
    standardize_selection(include_in_output = include_in_output)

  stopifnot(!any(is.na(res$extended_country_name)))
  res
}

standardize_bmr <- function(force_redownload = FALSE,
                            include_in_output = c("extended_country_name",
                                                  "GWn",
                                                  "cown",
                                                  "in_GW_system"),
                            verbose = FALSE,
                            measure = c("democracy", "democracy_femalesuffrage", "democracy_omitteddata"),
                            ...) {
  if(verbose) {
    message("Adding BMR data")
  }

  if(force_redownload) {
    bmr <- redownload_bmr(verbose = verbose,
                          include_in_output = include_in_output)
  } else {
    bmr <- democracyData::bmr
  }

  res <- bmr |>
    dplyr::mutate(dplyr::across(dplyr::all_of("democracy_omitteddata"), \(x) ifelse(x < 0, NA, x))) |>
    tidyr::pivot_longer(dplyr::all_of(measure),
                        names_to = "measure", values_to = "value") |>
    dplyr::mutate(measure = paste0("bmr_", measure)) |>
    standardize_selection(include_in_output = include_in_output)

  stopifnot(!any(is.na(res$extended_country_name)))
  res
}

standardize_bnr <- function(include_in_output = c("extended_country_name",
                                                  "GWn",
                                                  "cown",
                                                  "in_GW_system"),
                            verbose = FALSE,
                            use_extended = TRUE,
                            ...) {

  event <- NULL

  if(verbose) {
    message("Adding BNR data")
  }

  bnr <- NULL
  if(use_extended) {
    bnr <- democracyData::bnr_extended |>
      dplyr::rename(bnr_extended = bnr)
    measure <- "bnr_extended"
  } else {
    bnr <- democracyData::bnr
    bnr <- bnr |>
      dplyr::mutate(bnr = 1 - event)
    measure <- "bnr"

  }

  res <- bnr |>
    tidyr::pivot_longer(dplyr::any_of(measure),
                        names_to = "measure", values_to = "value") |>
    standardize_selection(include_in_output = include_in_output)

  stopifnot(!any(is.na(res$extended_country_name)))
  res
}

standardize_bti <- function(force_redownload = FALSE,
                            include_in_output = c("extended_country_name",
                                                  "GWn",
                                                  "cown",
                                                  "in_GW_system"),
                            verbose = FALSE,
                            measure = "SI_Democracy_Status",
                            ...) {
  if(verbose) {
    message("Adding BTI data")
  }

  if(force_redownload) {
    bti <- redownload_bti(verbose = verbose,
                          include_in_output = include_in_output)
  } else {
    bti <- democracyData::bti
  }

  res <- bti |>
    tidyr::pivot_longer(dplyr::all_of(measure),
                        names_to = "measure", values_to = "value") |>
    dplyr::mutate(measure = "bti") |>
    standardize_selection(include_in_output = include_in_output)

  stopifnot(!any(is.na(res$extended_country_name)))
  res
}

standardize_bollen_pmm <- function(include_in_output = c("extended_country_name",
                                                         "GWn",
                                                         "cown",
                                                         "in_GW_system"),
                                   verbose = FALSE,
                                   measure = "pmm_bollen",
                                   ...) {
  if(verbose) {
    message("Adding bollen_pmm data")
  }

  res <- democracyData::bollen_pmm |>
    tidyr::pivot_longer(dplyr::all_of(measure),
                        names_to = "measure", values_to = "value") |>
    standardize_selection(include_in_output = include_in_output)

  stopifnot(!any(is.na(res$extended_country_name)))
  res
}

standardize_doorenspleet <- function(include_in_output = c("extended_country_name",
                                                           "GWn",
                                                           "cown",
                                                           "in_GW_system"),
                                     verbose = FALSE,
                                     measure = "doorenspleet",
                                     ...) {
  if(verbose) {
    message("Adding Doorenspleet data")
  }

  res <- democracyData::doorenspleet |>
    tidyr::pivot_longer(dplyr::all_of(measure),
                        names_to = "measure", values_to = "value") |>
    standardize_selection(include_in_output = include_in_output)

  stopifnot(!any(is.na(res$extended_country_name)))
  res
}

standardize_eiu <- function(include_in_output = c("extended_country_name",
                                                  "GWn",
                                                  "cown",
                                                  "in_GW_system"),
                            verbose = FALSE,
                            measure = "eiu",
                            ...) {
  if(verbose) {
    message("Adding EIU data")
  }

  eiu <- democracyData::eiu

  res <- eiu |>
    tidyr::pivot_longer(dplyr::all_of(measure),
                        names_to = "measure", values_to = "value") |>
    standardize_selection(include_in_output = include_in_output)

  stopifnot(!any(is.na(res$extended_country_name)))
  res
}

standardize_gwf <- function(force_redownload = FALSE,
                            include_in_output = c("extended_country_name",
                                                  "GWn",
                                                  "cown",
                                                  "in_GW_system"),
                            verbose = FALSE,
                            measure = c("gwf_democracy_extended",
                                        "gwf_democracy_extended_strict",
                                        "gwf_democracy_strict",
                                        "gwf_democracy"),
                            use_extended = TRUE,
                            ...) {
  if(verbose) {
    message("Adding GWF data")
  }

  if(force_redownload) {
    gwf <- redownload_gwf(verbose = verbose,
                          include_in_output = include_in_output,
                          extend = use_extended)
    if(use_extended) {
      gwf <- gwf |>
        dplyr::mutate(gwf_democracy_extended = dplyr::case_when(gwf_nonautocracy == "democracy" ~ 1, TRUE ~ 0),
                      gwf_democracy_extended_strict = dplyr::case_when(gwf_nonautocracy == "democracy" ~ 1,
                                                                       !is.na(gwf_nonautocracy) ~ NA_real_,
                                                                       TRUE ~ 0))
    } else {
      gwf <- gwf |>
        dplyr::mutate(gwf_democracy = dplyr::case_when(gwf_nonautocracy == "democracy" ~ 1, TRUE ~ 0),
                      gwf_democracy_strict = dplyr::case_when(gwf_nonautocracy == "democracy" ~ 1,
                                                              !is.na(gwf_nonautocracy) ~ NA_real_,
                                                              TRUE ~ 0))    }
  } else {
    if(use_extended) {
      gwf <- democracyData::gwf_all_extended |>
        dplyr::mutate(gwf_democracy_extended = dplyr::case_when(gwf_nonautocracy == "democracy" ~ 1, TRUE ~ 0),
                      gwf_democracy_extended_strict = dplyr::case_when(gwf_nonautocracy == "democracy" ~ 1,
                                                                       !is.na(gwf_nonautocracy) ~ NA_real_,
                                                                       TRUE ~ 0))
    } else {
      gwf <- democracyData::gwf_all |>
        dplyr::mutate(gwf_democracy = dplyr::case_when(gwf_nonautocracy == "democracy" ~ 1, TRUE ~ 0),
                      gwf_democracy_strict = dplyr::case_when(gwf_nonautocracy == "democracy" ~ 1,
                                                                       !is.na(gwf_nonautocracy) ~ NA_real_,
                                                                       TRUE ~ 0))
    }
  }

  res <- gwf |>
    tidyr::pivot_longer(dplyr::any_of(measure),
                        names_to = "measure", values_to = "value") |>
    standardize_selection(include_in_output = include_in_output)

  stopifnot(!any(is.na(res$extended_country_name)))
  res
}

standardize_hadenius_pmm <- function(include_in_output = c("extended_country_name",
                                                           "GWn",
                                                           "cown",
                                                           "in_GW_system"),
                                     verbose = FALSE,
                                     measure = "pmm_hadenius",
                                     ...) {
  if(verbose) {
    message("Adding hadenius_pmm data")
  }

  res <- democracyData::hadenius_pmm |>
    tidyr::pivot_longer(dplyr::all_of(measure),
                        names_to = "measure", values_to = "value") |>
    standardize_selection(include_in_output = include_in_output)

  stopifnot(!any(is.na(res$extended_country_name)))
  res
}

standardize_kailitz <- function(include_in_output = c("extended_country_name",
                                                      "GWn",
                                                      "cown",
                                                      "in_GW_system"),
                                verbose = FALSE,
                                measure = c("kailitz_binary", "kailitz_tri"),
                                ...) {
  if(verbose) {
    message("Adding Kailitz data")
  }

  kailitz <- democracyData::kailitz

  res <- kailitz |>
    tidyr::pivot_longer(dplyr::all_of(measure),
                        names_to = "measure", values_to = "value") |>
    standardize_selection(include_in_output = include_in_output)

  stopifnot(!any(is.na(res$extended_country_name)))
  res
}

standardize_vaporeg <- function(force_redownload = FALSE,
                                include_in_output = c("extended_country_name",
                                                      "GWn",
                                                      "cown",
                                                      "in_GW_system"),
                                verbose = FALSE,
                                measure = c("vaporeg_binary_strict",
                                            "vaporeg_binary_non_strict",
                                            "vaporeg_trichotomous"),
                                ...) {
  if(verbose) {
    message("Adding VaPoReg data")
  }

  if(force_redownload) {
    vaporeg <- redownload_vaporeg(verbose = verbose,
                                  include_in_output = include_in_output)
  } else {
    vaporeg <- democracyData::vaporeg
  }

  res <- vaporeg |>
    tidyr::pivot_longer(dplyr::all_of(measure),
                        names_to = "measure", values_to = "value") |>
    standardize_selection(include_in_output = include_in_output)
  stopifnot(!any(is.na(res$extended_country_name)))
  res
}

standardize_lied <- function(force_redownload = FALSE,
                             include_in_output = c("extended_country_name",
                                                   "GWn",
                                                   "cown",
                                                   "in_GW_system"),
                             verbose = FALSE,
                             measure = c("lexical_index", "lexical_index_plus"),
                             ...) {
  if(verbose) {
    message("Adding Lied data")
  }


  if(force_redownload) {
    LIED <- redownload_lied(verbose = verbose,
                            include_in_output = include_in_output)
  } else {
    LIED <- democracyData::LIED
  }

  res <- LIED |>
    tidyr::pivot_longer(dplyr::all_of(measure),
                        names_to = "measure", values_to = "value") |>
    standardize_selection(include_in_output = include_in_output)

  stopifnot(!any(is.na(res$extended_country_name)))
  res
}

standardize_magaloni <- function(force_redownload = FALSE,
                                 include_in_output = c("extended_country_name",
                                                       "GWn",
                                                       "cown",
                                                       "in_GW_system"),
                                 verbose = FALSE,
                                 measure = "regime_nr",
                                 use_extended = TRUE,
                                 ...) {
  if(verbose) {
    message("Adding Magaloni data")
  }

  if(force_redownload) {
    magaloni <- redownload_magaloni(verbose = verbose,
                                    include_in_output = include_in_output,
                                    extend = use_extended)
  } else {
    if(use_extended) {
      magaloni <- democracyData::magaloni_extended
    } else {
      magaloni <- democracyData::magaloni
    }
  }

  res <- magaloni |>
    dplyr::mutate(dplyr::across(dplyr::all_of(measure), \(x) dplyr::case_when(x == "Democracy" ~ 1,
                                                                             is.na(x) ~ NA,
                                                                             TRUE ~ 0))) |>
    tidyr::pivot_longer(dplyr::all_of(measure),
                        names_to = "measure", values_to = "value") |>
    standardize_selection(include_in_output = include_in_output)

  if(use_extended) {
    res <- res |>
      dplyr::mutate(measure = "magaloni_democracy_extended")
  } else {
    res <- res |>
      dplyr::mutate(measure = "magaloni_democracy")
  }

  stopifnot(!any(is.na(res$extended_country_name)))
  res
}

standardize_mainwaring <- function(include_in_output = c("extended_country_name",
                                                         "GWn",
                                                         "cown",
                                                         "in_GW_system"),
                                   verbose = FALSE,
                                   measure = "mainwaring",
                                   ...) {
  if(verbose) {
    message("Adding Mainwaring data")
  }

  res <- democracyData::mainwaring |>
    tidyr::pivot_longer(dplyr::all_of(measure),
                        names_to = "measure", values_to = "value") |>
    standardize_selection(include_in_output = include_in_output)

  stopifnot(!any(is.na(res$extended_country_name)))
  res
}

standardize_mainwaring_pmm <- function(include_in_output = c("extended_country_name",
                                                             "GWn",
                                                             "cown",
                                                             "in_GW_system"),
                                     verbose = FALSE,
                                     measure = "pmm_mainwaring",
                                     ...) {
  if(verbose) {
    message("Adding mainwaring_pmm data")
  }

  res <- democracyData::mainwaring_pmm |>
    tidyr::pivot_longer(dplyr::all_of(measure),
                        names_to = "measure", values_to = "value") |>
    standardize_selection(include_in_output = include_in_output)

  stopifnot(!any(is.na(res$extended_country_name)))
  res
}

standardize_munck_pmm <- function(include_in_output = c("extended_country_name",
                                                    "GWn",
                                                    "cown",
                                                    "in_GW_system"),
                              verbose = FALSE,
                              measure = "pmm_munck",
                              ...) {
  if(verbose) {
    message("Adding Munck data")
  }

  res <- democracyData::munck_pmm |>
    tidyr::pivot_longer(dplyr::all_of(measure),
                        names_to = "measure", values_to = "value") |>
    standardize_selection(include_in_output = include_in_output)

  stopifnot(!any(is.na(res$extended_country_name)))
  res
}

standardize_pacl <- function(force_redownload = FALSE,
                             include_in_output = c("extended_country_name",
                                                   "GWn",
                                                   "cown",
                                                   "in_GW_system"),
                             verbose = FALSE,
                             measure = "democracy",
                             ...) {
  if(verbose) {
    message("Adding PACL/DD data")
  }

  if(force_redownload) {
    pacl <- redownload_pacl(verbose = verbose,
                            include_in_output = include_in_output)
  } else {
    pacl <- democracyData::pacl
  }

  res <- pacl |>
    tidyr::pivot_longer(dplyr::all_of(measure),
                        names_to = "measure", values_to = "value") |>
    dplyr::mutate(measure = "pacl") |>
    standardize_selection(include_in_output = include_in_output)

  stopifnot(!any(is.na(res$extended_country_name)))
  res
}

standardize_pacl_pmm <- function(include_in_output = c("extended_country_name",
                                                       "GWn",
                                                       "cown",
                                                       "in_GW_system"),
                                 verbose = FALSE,
                                 measure = "pmm_pacl",
                                 ...) {
  if(verbose) {
    message("Adding pacl_pmm data")
  }

  res <- democracyData::pacl_pmm |>
    tidyr::pivot_longer(dplyr::all_of(measure),
                        names_to = "measure", values_to = "value") |>
    standardize_selection(include_in_output = include_in_output)

  stopifnot(!any(is.na(res$extended_country_name)))
  res
}

standardize_pacl_update <- function(force_redownload = FALSE,
                                    include_in_output = c("extended_country_name",
                                                          "GWn",
                                                          "cown",
                                                          "in_GW_system"),
                                    verbose = FALSE,
                                    measure = "Democracy",
                                    ...) {
  if(verbose) {
    message("Adding PACL/DD update data")
  }

  if(force_redownload) {
    pacl_update <- redownload_pacl_update(verbose = verbose,
                                          include_in_output = include_in_output)
  } else {
    pacl_update <- democracyData::pacl_update
  }

  res <- pacl_update |>
    tidyr::pivot_longer(dplyr::all_of(measure),
                        names_to = "measure", values_to = "value") |>
    dplyr::mutate(measure = "pacl_update") |>
    standardize_selection(include_in_output = include_in_output)

  stopifnot(!any(is.na(res$extended_country_name)))
  res
}

standardize_peps <- function(force_redownload = FALSE,
                             include_in_output = c("extended_country_name",
                                                   "GWn",
                                                   "cown",
                                                   "in_GW_system"),
                             verbose = FALSE,
                             measure = "PEPS[0-9]",
                             ...) {
  if(verbose) {
    message("Adding PEPS data")
  }

  if(force_redownload) {
    peps <- redownload_peps(verbose = verbose,
                            include_in_output = include_in_output)
  } else {
    peps <- democracyData::peps
  }

  res <- peps |>
    tidyr::pivot_longer(dplyr::matches("PEPS[0-9]"),
                        names_to = "measure", values_to = "value") |>
    standardize_selection(include_in_output = include_in_output)

  stopifnot(!any(is.na(res$extended_country_name)))
  res
}

standardize_pitf <- function(force_redownload = FALSE,
                             include_in_output = c("extended_country_name",
                                                   "GWn",
                                                   "cown",
                                                   "in_GW_system"),
                             verbose = FALSE,
                             measure = c("pitf", "pitf_binary"),
                             ...) {
  if(verbose) {
    message("Adding PITF data")
  }

  if(force_redownload) {
    pitf <- create_pitf_scores(verbose = verbose,
                               include_in_output = include_in_output)
  } else {
    pitf <- democracyData::pitf
  }

  res <- pitf |>
    tidyr::pivot_longer(dplyr::all_of(measure),
                        names_to = "measure", values_to = "value") |>
    standardize_selection(include_in_output = include_in_output)

  stopifnot(!any(is.na(res$extended_country_name)))
  res
}

standardize_polyarchy_original <- function(force_redownload = FALSE,
                                           include_in_output= c("extended_country_name",
                                                                "GWn",
                                                                "cown",
                                                                "in_GW_system"),
                                           verbose = FALSE,
                                           measure = c("polyarchy_original_contestation",
                                                       "polyarchy_original_polyarchy"),
                                           ...) {
  if(verbose) {
    message("Adding Polyarchy Original data")
  }

  if(force_redownload) {
    polyarchy <- redownload_polyarchy_original(verbose = verbose,
                                               include_in_output = include_in_output)
  } else {
    polyarchy <- democracyData::polyarchy
  }

  res <- polyarchy |>
    dplyr::rename_with(~"polyarchy_original_contestation", "cont") |>
    dplyr::mutate(across("poly", list("polyarchy_original_polyarchy" = ~(10 - .)),
                         .names = "{.fn}")) |>
    tidyr::pivot_longer(dplyr::all_of(measure),
                        names_to = "measure", values_to = "value") |>
    standardize_selection(include_in_output = include_in_output)

  stopifnot(!any(is.na(res$extended_country_name)))
  res
}

standardize_polyarchy_pmm <- function(include_in_output = c("extended_country_name",
                                                            "GWn",
                                                            "cown",
                                                            "in_GW_system"),
                                      verbose = FALSE,
                                      measure = "pmm_polyarchy",
                                      ...) {
  if(verbose) {
    message("Adding polyarchy_pmm data")
  }

  res <- democracyData::polyarchy_pmm |>
    tidyr::pivot_longer(dplyr::all_of(measure),
                        names_to = "measure", values_to = "value") |>
    standardize_selection(include_in_output = include_in_output)

  stopifnot(!any(is.na(res$extended_country_name)))
  res
}

standardize_polyarchy_dimensions <- function(force_redownload = FALSE,
                                             include_in_output= c("extended_country_name",
                                                                "GWn",
                                                                "cown",
                                                                "in_GW_system"),
                                             verbose = FALSE,
                                             measure = c("polyarchy_contestation_dimension",
                                                         "polyarchy_inclusion_dimension"),
                                             ...) {
  if(verbose) {
    message("Adding Polyarchy Dimensions data")
  }

  if(force_redownload) {
    polyarchy_dimensions <- redownload_polyarchy_dimensions(verbose = verbose,
                                                 include_in_output = include_in_output)
  } else {
    polyarchy_dimensions <- democracyData::polyarchy_dimensions
  }

  res <- polyarchy_dimensions |>
    dplyr::rename_with(~"polyarchy_contestation_dimension", "CONTEST") |>
    dplyr::rename_with(~"polyarchy_inclusion_dimension", "INCLUS") |>
    tidyr::pivot_longer(dplyr::all_of(measure),
                        names_to = "measure", values_to = "value") |>
    standardize_selection(include_in_output = include_in_output)

  stopifnot(!any(is.na(res$extended_country_name)))
  res
}

standardize_prc_gasiorowski <- function(include_in_output = c("extended_country_name",
                                                              "GWn",
                                                              "cown",
                                                              "in_GW_system"),
                                        verbose = FALSE,
                                        keep_only_last_in_year = TRUE,
                                        measure = "regime",
                                        ...) {

  end <- prc_at_end_year <- NULL

  if (verbose) {
    message("Adding PRC/Gasiorowski data")
  }

  prc <- democracyData::prc_gasiorowski

  if (keep_only_last_in_year) {
    prc <- prc |>
      dplyr::group_by(dplyr::across(all_of(c(include_in_output, "year")))) |>
      dplyr::filter(end == max(end, na.rm = TRUE)) |>
      dplyr::filter(prc_at_end_year == last(prc_at_end_year)) |>
      dplyr::ungroup() |>
      dplyr::distinct()
  }

  res <- prc |>
    dplyr::mutate(prc = dplyr::case_when(
      .data[[measure]] == "A" ~ 1,
      .data[[measure]] == "S" ~ 3,
      .data[[measure]] == "D" ~ 4,
      .data[[measure]] == "T" ~ NA_real_)
    ) |>
    tidyr::pivot_longer(cols = "prc",
                        names_to = "measure", values_to = "value") |>
    standardize_selection(include_in_output = include_in_output)

  stopifnot(!any(is.na(res$extended_country_name)))
  res
}

standardize_prc_pmm <- function(include_in_output = c("extended_country_name",
                                                      "GWn",
                                                      "cown",
                                                      "in_GW_system"),
                                verbose = FALSE,
                                measure = "pmm_prc",
                                ...) {
  if (verbose) {
    message("Adding prc_pmm data")
  }

  res <- democracyData::prc_pmm |>
    tidyr::pivot_longer(dplyr::all_of(measure),
                        names_to = "measure", values_to = "value") |>
    dplyr::mutate(measure = "pmm_prc") |>
    standardize_selection(include_in_output = include_in_output)

  stopifnot(!any(is.na(res$extended_country_name)))
  res
}

standardize_PIPE <- function(force_redownload = FALSE,
                             include_in_output = c("extended_country_name",
                                                   "GWn",
                                                   "cown",
                                                   "in_GW_system"),
                             verbose = FALSE,
                             measure = c("democracy2", "regime"),
                             ...) {
  if (verbose) {
    message("Adding PIPE data")
  }

  if (force_redownload) {
    PIPE <- redownload_pipe(verbose = verbose,
                            include_in_output = include_in_output)
  } else {
    PIPE <- democracyData::PIPE
  }

  res <- PIPE |>
    dplyr::rename_with(~"PIPE_democracy", "democracy2") |>
    dplyr::rename_with(~"PIPE_regime", "regime") |>
    tidyr::pivot_longer(dplyr::all_of(c("PIPE_democracy", "PIPE_regime")),
                        names_to = "measure", values_to = "value") |>
    standardize_selection(include_in_output = include_in_output)

  stopifnot(!any(is.na(res$extended_country_name)))
  res
}

standardize_REIGN <- function(force_redownload = FALSE,
                              include_in_output = c("extended_country_name",
                                                    "GWn",
                                                    "cown",
                                                    "in_GW_system"),
                              verbose = FALSE,
                              keep_only_last_in_year = TRUE,
                              measure = "gwf_regimetype",
                              ...) {

  End <- NULL

  if (verbose) {
    message("Adding REIGN data")
  }

  if (force_redownload) {
    reign <- redownload_reign(verbose = verbose,
                              include_in_output = include_in_output)
  } else {
    reign <- democracyData::REIGN
  }

  if (keep_only_last_in_year) {
    reign <- reign |>
      dplyr::group_by(dplyr::across(all_of(c(include_in_output, "year")))) |>
      dplyr::filter(End == max(End, na.rm = TRUE)) |>
      dplyr::ungroup()
  }

  res <- reign |>
    dplyr::mutate(reign_democracy = dplyr::case_when(
      .data[[measure]] %in% c("presidential", "parliamentary") ~ 1,
      TRUE ~ 0
    )) |>
    tidyr::pivot_longer(cols = "reign_democracy",
                        names_to = "measure", values_to = "value") |>
    standardize_selection(include_in_output = include_in_output)

  stopifnot(!any(is.na(res$extended_country_name)))
  res
}

standardize_svmdi <- function(force_redownload = FALSE,
                              release_year = 2020,
                              include_in_output = c("extended_country_name",
                                                    "GWn",
                                                    "cown",
                                                    "in_GW_system"),
                              verbose = FALSE,
                              ...) {
  if (verbose) {
    message(sprintf("Adding SVMDI data (%s release)", release_year))
  }

  # Load appropriate dataset
  svmdi <- if (force_redownload) {
    redownload_svmdi(release_year = release_year,
                     verbose = verbose,
                     include_in_output = include_in_output)
  } else {
    if (release_year == 2020) {
      democracyData::svmdi
    } else if (release_year == 2016) {
      democracyData::svmdi_2016
    } else {
      stop("Only release_year = 2020 or 2016 is supported.")
    }
  }

  # Determine measures based on release
  if (release_year == 2020) {
    measure_vars <- c("csvmdi", "dsvmdi")
  } else if (release_year == 2016) {
    svmdi <- dplyr::rename_with(svmdi, ~"svmdi_2016", "svmdi")
    measure_vars <- "svmdi_2016"
  }

  res <- svmdi |>
    tidyr::pivot_longer(dplyr::all_of(measure_vars),
                        names_to = "measure", values_to = "value") |>
    standardize_selection(include_in_output = include_in_output)

  stopifnot(!any(is.na(res$extended_country_name)))
  res
}

standardize_svolik <- function(include_in_output = c("extended_country_name",
                                                     "GWn",
                                                     "cown",
                                                     "in_GW_system"),
                               verbose = FALSE,
                               measure = "regime_numeric",
                               ...) {
  if (verbose) {
    message("Adding Svolik data")
  }

  svolik <- democracyData::svolik_regime

  res <- svolik |>
    dplyr::rename_with(~"svolik_democracy", measure) |>
    tidyr::pivot_longer(cols = "svolik_democracy",
                        names_to = "measure", values_to = "value") |>
    standardize_selection(include_in_output = include_in_output)

  stopifnot(!any(is.na(res$extended_country_name)))
  res
}

standardize_uds <- function(force_redownload = FALSE,
                            release_year = 2014,
                            include_in_output = c("extended_country_name",
                                                  "GWn",
                                                  "cown",
                                                  "in_GW_system"),
                            verbose = FALSE,
                            measure = c("mean", "median"),
                            ...) {
  if (verbose) {
    message(sprintf("Adding UDS data (%s release)", release_year))
  }

  # Load appropriate dataset
  uds <- if (force_redownload) {
    redownload_uds(release_year = release_year,
                   verbose = verbose,
                   include_in_output = include_in_output)
  } else {
    if (release_year == 2014) {
      democracyData::uds_2014
    } else if (release_year == 2011) {
      democracyData::uds_2011
    } else if (release_year == 2010) {
      democracyData::uds_2010
    } else {
      stop("Only release_year = 2010, 2011, or 2014 is supported.")
    }
  }

  # Rename measures
  new_names <- paste0("uds_", release_year, "_", measure)
  uds <- uds |>
    dplyr::rename_with(~new_names, .cols = measure)

  res <- uds |>
    tidyr::pivot_longer(cols = dplyr::all_of(new_names),
                        names_to = "measure", values_to = "value") |>
    standardize_selection(include_in_output = include_in_output)

  stopifnot(!any(is.na(res$extended_country_name)))
  res
}

standardize_ulfelder <- function(force_redownload = FALSE,
                                 use_extended = TRUE,
                                 include_in_output = c("extended_country_name",
                                                       "GWn",
                                                       "cown",
                                                       "in_GW_system"),
                                 verbose = FALSE,
                                 measure = "rgjtype",
                                 ...) {
  if (verbose) {
    message(sprintf("Adding Ulfelder data (%s version)",
                    ifelse(use_extended, "extended", "standard")))
  }

  ulfelder <- if (force_redownload) {
    redownload_ulfelder(verbose = verbose,
                        include_in_output = include_in_output,
                        extend = use_extended)
  } else {
    if (use_extended) {
      democracyData::ulfelder_extended
    } else {
      democracyData::ulfelder
    }
  }

  var_name <- if (use_extended) "ulfelder_democracy_extended" else "ulfelder_democracy"

  res <- ulfelder |>
    dplyr::mutate(!!var_name := dplyr::case_when(
      .data[[measure]] %in% c("-99", "NS") ~ NA_real_,
      .data[[measure]] == "A" ~ 0,
      .data[[measure]] == "D" ~ 1,
      TRUE ~ NA_real_
    )) |>
    tidyr::pivot_longer(cols = dplyr::all_of(var_name),
                        names_to = "measure", values_to = "value") |>
    standardize_selection(include_in_output = include_in_output)

  stopifnot(!any(is.na(res$extended_country_name)))
  res
}

standardize_utip <- function(force_redownload = FALSE,
                             include_in_output = c("extended_country_name",
                                                   "GWn",
                                                   "cown",
                                                   "in_GW_system"),
                             verbose = FALSE,
                             measure = c("utip_dichotomous",
                                         "utip_dichotomous_strict",
                                         "utip_trichotomous"),
                             ...) {
  if (verbose) {
    message("Adding UTIP data")
  }

  utip <- if (force_redownload) {
    redownload_utip(verbose = verbose,
                    include_in_output = include_in_output)
  } else {
    democracyData::utip
  }

  res <- utip |>
    tidyr::pivot_longer(cols = dplyr::all_of(measure),
                        names_to = "measure", values_to = "value") |>
    standardize_selection(include_in_output = include_in_output)

  stopifnot(!any(is.na(res$extended_country_name)))
  res
}

standardize_vanhanen <- function(include_in_output = c("extended_country_name",
                                                       "GWn",
                                                       "cown",
                                                       "in_GW_system"),
                                 verbose = FALSE,
                                 measure = c("vanhanen_competition",
                                             "vanhanen_participation",
                                             "vanhanen_democratization"),
                                 ...) {
  if (verbose) {
    message("Adding Vanhanen data")
  }

  vanhanen <- democracyData::vanhanen

  res <- vanhanen |>
    tidyr::pivot_longer(cols = dplyr::all_of(measure),
                        names_to = "measure", values_to = "value") |>
    standardize_selection(include_in_output = include_in_output)

  stopifnot(!any(is.na(res$extended_country_name)))
  res
}

standardize_vanhanen_pmm <- function(include_in_output = c("extended_country_name",
                                           "GWn",
                                           "cown",
                                           "in_GW_system"),
                                         verbose = FALSE,
                                         measure = "pmm_vanhanen",
                                         ...) {
  if (verbose) {
    message("Adding vanhanen_pmm data")
  }

  res <- democracyData::vanhanen_pmm |>
    tidyr::pivot_longer(dplyr::all_of(measure),
                        names_to = "measure", values_to = "value") |>
    standardize_selection(include_in_output = include_in_output)

  stopifnot(!any(is.na(res$extended_country_name)))
  res
}

standardize_vdem <- function(include_in_output = c("extended_country_name",
                                                   "GWn",
                                                   "cown",
                                                   "in_GW_system"),
                             verbose = FALSE,
                             measure_pattern = "^v2x_[a-z]+$",
                             ...) {
  if (verbose) {
    message("Adding V-Dem data")
  }

  vdem <- democracyData::vdem_simple

  res <- vdem |>
    tidyr::pivot_longer(cols = dplyr::matches(measure_pattern),
                        names_to = "measure", values_to = "value") |>
    standardize_selection(include_in_output = include_in_output)

  stopifnot(!any(is.na(res$extended_country_name)))
  res
}

standardize_wahman_teorell_hadenius <- function(include_in_output = c("extended_country_name",
                                                                      "GWn",
                                                                      "cown",
                                                                      "in_GW_system"),
                                                verbose = FALSE,
                                                ...) {
  regime1ny <- regimenyrobust <- NULL

  if (verbose) {
    message("Adding Wahman, Teorell, and Hadenius data")
  }

  wth <- democracyData::wahman_teorell_hadenius

  res <- wth |>
    dplyr::mutate(
      wth_democ1 = haven::zap_label(regime1ny) == 100,
      wth_democrobust = haven::zap_label(regimenyrobust) == 100
    ) |>
    tidyr::pivot_longer(cols = c("wth_democ1", "wth_democrobust"),
                        names_to = "measure", values_to = "value") |>
    standardize_selection(include_in_output = include_in_output)

  stopifnot(!any(is.na(res$extended_country_name)))
  res
}
