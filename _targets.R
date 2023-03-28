# Created by use_targets().
# Follow the comments below to fill in this target script.
# Then follow the manual to check and run the pipeline:
#   https://books.ropensci.org/targets/walkthrough.html#inspect-the-pipeline # nolint

# Load packages required to define the pipeline:
library(targets)
library(tarchetypes) # Load other packages as needed. # nolint

# Set target options:
tar_option_set(
  packages = c("tidyverse", "rlang"), # packages that your targets need to run
  format = "rds" # default storage format
  # Set other options as needed.
)

# tar_make_clustermq() configuration (okay to leave alone):
options(clustermq.scheduler = "multiprocess")

# tar_make_future() configuration (okay to leave alone):
future::plan(future.callr::callr)

# Run the R scripts in the R/ folder with your custom functions:
tar_source()
load("R/sysdata.rda")
# source("other_functions.R") # Source other scripts as needed. # nolint

verbose <- TRUE

# Replace the target list below with your own:
list(

  ## Democracy Info dataset -----

  tar_target(
    name = democracy_info_filename,
    command = "data-raw/democracy_info.csv",
    format = "file"
  ),

  tar_target(
    name = democracy_info,
    command = read_csv(democracy_info_filename)
  ),

  tar_target(
    name = add_democracy_info,
    command = usethis::use_data(democracy_info, overwrite = TRUE) |>
      c("data/democracy_info.rda"),
    format = "file"
  ),

  ## Basic params vars -----

  tar_target(
    name = include_in_output,
    command = c("extended_country_name", "GWn", "cown", "in_GW_system")
  ),

  ## PMM replication data -----

  tar_target(
    name = pmm_replication_filename,
    command = "data-raw/democracy1946.2008.rda",
    format = "file"
  ),

  tar_target(
    name = pmm_replication,
    command = prepare_pmm_replication_data(pmm_replication_filename,
                                           verbose = verbose,
                                           include_in_output = include_in_output)
  ),

  ## Anckar -----

  tar_target(
    name = anckar,
    command = redownload_anckar(verbose = verbose,
                                include_in_output = include_in_output)
  ),

  tar_target(
    name = add_anckar,
    command = usethis::use_data(anckar, overwrite = TRUE) |>
      c("data/anckar.rda"),
    format = "file"
  ),

  ## ANRR -----

  tar_target(
    name = anrr_filename,
    command = "data-raw/DDCGdata_final.dta",
    format = "file"
  ),

  tar_target(
    name = anrr,
    command = prepare_anrr(path = anrr_filename,
                           verbose = verbose,
                           include_in_output = include_in_output)
  ),

  tar_target(
    name = add_anrr,
    command = usethis::use_data(anrr, overwrite = TRUE) |>
      c("data/anrr.rda"),
    format = "file"
  ),

  ## Arat -----

  tar_target(
    name = arat_pmm,
    command = extract_pmm_var(pmm_replication,
                              pmm_arat,
                              include_in_output = include_in_output)
  ),

  tar_target(
    name = add_arat_pmm,
    command = usethis::use_data(arat_pmm, overwrite = TRUE) |>
      c("data/arat_pmm.rda"),
    format = "file"
  ),

  ## BLM -----

  # Should normally be like this, but redownload no longer works
  # tar_target(
  #   name = blm,
  #   command = redownload_blm(verbose = verbose,
  #                               include_in_output = include_in_output)
  # ),

  # tar_target(
  #   name = add_blm,
  #   command = usethis::use_data(blm, overwrite = TRUE) |>
  #     c("data/blm.rda"),
  #   format = "file"
  # ),

  tar_target(
    name = add_blm,
    command = c("data/blm.rda"),
    format = "file"
  ),

  tar_target(
    name = blm_pmm,
    command = extract_pmm_var(pmm_replication,
                              pmm_blm,
                              include_in_output = include_in_output)
  ),

  tar_target(
    name = add_blm_pmm,
    command = usethis::use_data(blm_pmm, overwrite = TRUE) |>
      c("data/blm_pmm.rda"),
    format = "file"
  ),

  ## BMR -----

  tar_target(
    name = bmr,
    command = redownload_bmr(verbose = verbose,
                             include_in_output = include_in_output)
  ),

  tar_target(
    name = add_bmr,
    command = usethis::use_data(bmr, overwrite = TRUE) |>
      c("data/bmr.rda"),
    format = "file"
  ),

  ## BNR -----

  # Should normally be like this, but redownload no longer works
  # tar_target(
  #   name = bnr,
  #   command = redownload_bnr(verbose = verbose,
  #                               include_in_output = include_in_output)
  # ),

  # tar_target(
  #   name = add_bnr,
  #   command = usethis::use_data(bnr, overwrite = TRUE) |>
  #     c("data/bnr.rda"),
  #   format = "file"
  # ),

  # tar_target(
  #   name = bnr_extended,
  #   command = redownload_bnr(extend = TRUE, verbose = verbose,
  #                            include_in_output = include_in_output)
  # ),

  # tar_target(
  #   name = add_bnr_extended,
  #   command = usethis::use_data(bnr_extended, overwrite = TRUE) |>
  #     c("data/bnr_extended.rda"),
  #   format = "file"
  # ),

  tar_target(
    name = add_bnr,
    command = c("data/bnr.rda"),
    format = "file"
  ),

  tar_target(
    name = add_bnr_extended,
    command = c("data/bnr_extended.rda"),
    format = "file"
  ),

  ## BTI -----

  tar_target(
    name = bti,
    command = redownload_bti(verbose = verbose,
                             include_in_output = include_in_output)
  ),

  tar_target(
    name = add_bti,
    command = usethis::use_data(bti, overwrite = TRUE) |>
      c("data/bti.rda"),
    format = "file"
  ),

  ## Bollen -----

  tar_target(
    name = bollen_pmm,
    command = extract_pmm_var(pmm_replication,
                              pmm_bollen,
                              include_in_output = include_in_output)
  ),

  tar_target(
    name = add_bollen_pmm,
    command = usethis::use_data(bollen_pmm, overwrite = TRUE) |>
      c("data/bollen_pmm.rda"),
    format = "file"
  ),

  ## Doorenspleet -----

  tar_target(
    name = doorenspleet_filename,
    command = "data-raw/Doorenspleet data.csv",
    format = "file"
  ),

  tar_target(
    name = doorenspleet,
    command = prepare_doorenspleet(path = doorenspleet_filename,
                                   verbose = verbose,
                                   include_in_output = include_in_output)
  ),

  tar_target(
    name = add_doorenspleet,
    command = usethis::use_data(doorenspleet, overwrite = TRUE) |>
      c("data/doorenspleet.rda"),
    format = "file"
  ),

  ## WGI -----

  tar_target(
    name = wgi,
    command = download_wgi_voice_and_accountability(verbose = verbose,
                                                    include_in_output = include_in_output)
  ),

  tar_target(
    name = add_wgi,
    command = usethis::use_data(wgi, overwrite = TRUE) |>
      c("data/wgi.rda"),
    format = "file"
  ),

  ## EIU -----

  tar_target(
    name = eiu_filename,
    command = "data-raw/DI-final-version-report-2022.pdf",
    format = "file"
  ),

  tar_target(
    name = eiu,
    command = prepare_eiu(eiu_filename, verbose = verbose,
                          include_in_output = include_in_output)
  ),

  tar_target(
    name = add_eiu,
    command = usethis::use_data(eiu, overwrite = TRUE) |>
      c("data/eiu.rda"),
    format = "file"
  ),

  ## FH -----

  tar_target(
    name = fh,
    command = download_fh(verbose = verbose,
                          include_in_output = include_in_output)
  ),

  tar_target(
    name = fh_with_territories,
    command = download_fh(include_territories = TRUE,
                          verbose = verbose,
                          include_in_output = include_in_output)
  ),

  tar_target(
    name = fh_electoral,
    command = download_fh_electoral(verbose = verbose,
                                    include_in_output = include_in_output)
  ),

  tar_target(
    name = fh_full,
    command = download_fh_full(verbose = verbose,
                               include_in_output = include_in_output)
  ),

  tar_target(
    name = fh_pmm,
    command = extract_pmm_var(pmm_replication,
                              pmm_freedomhouse,
                              include_in_output = include_in_output)
  ),

  tar_target(
    name = add_fh_pmm,
    command = usethis::use_data(fh_pmm, overwrite = TRUE) |>
      c("data/fh_pmm.rda"),
    format = "file"
  ),

  ## GWF -----

  tar_target(
    name = gwf_autocratic,
    command = redownload_gwf(verbose = verbose,
                             dataset = "autocratic",
                             include_in_output = include_in_output)
  ),

  tar_target(
    name = add_gwf_autocratic,
    command = usethis::use_data(gwf_autocratic, overwrite = TRUE) |>
      c("data/gwf_autocratic.rda"),
    format = "file"
  ),

  tar_target(
    name = gwf_autocratic_extended,
    command = redownload_gwf(extend = TRUE, verbose = verbose,
                             dataset = "autocratic",
                             include_in_output = include_in_output)
  ),

  tar_target(
    name = add_gwf_autocratic_extended,
    command = usethis::use_data(gwf_autocratic_extended, overwrite = TRUE) |>
      c("data/gwf_autocratic_extended.rda"),
    format = "file"
  ),

  tar_target(
    name = gwf_all,
    command = redownload_gwf(verbose = verbose,
                             dataset = "all",
                             include_in_output = include_in_output)
  ),

  tar_target(
    name = add_gwf_all,
    command = usethis::use_data(gwf_all, overwrite = TRUE) |>
      c("data/gwf_all.rda"),
    format = "file"
  ),

  tar_target(
    name = gwf_all_extended,
    command = redownload_gwf(extend = TRUE, verbose = verbose,
                             dataset = "all",
                             include_in_output = include_in_output)
  ),

  tar_target(
    name = add_gwf_all_extended,
    command = usethis::use_data(gwf_all_extended, overwrite = TRUE) |>
      c("data/gwf_all_extended.rda"),
    format = "file"
  ),

  ## Hadenius -----

  tar_target(
    name = hadenius_pmm,
    command = extract_pmm_var(pmm_replication,
                              pmm_hadenius,
                              include_in_output = include_in_output)
  ),

  tar_target(
    name = add_hadenius_pmm,
    command = usethis::use_data(hadenius_pmm, overwrite = TRUE) |>
      c("data/hadenius_pmm.rda"),
    format = "file"
  ),

  ## Kailitz -----

  tar_target(
    name = kailitz_filename,
    command = "data-raw/kailitz.yearly.rds",
    format = "file"
  ),

  tar_target(
    name = kailitz,
    command = prepare_kailitz(kailitz_filename, verbose = verbose,
                              include_in_output = include_in_output)
  ),

  tar_target(
    name = add_kailitz,
    command = usethis::use_data(kailitz, overwrite = TRUE) |>
      c("data/kailitz.rda"),
    format = "file"
  ),

  ## LIED -----

  tar_target(
    name = LIED,
    command = redownload_lied(verbose = verbose,
                              include_in_output = include_in_output)
  ),

  tar_target(
    name = add_lied,
    command = usethis::use_data(LIED, overwrite = TRUE) |>
      c("data/LIED.rda"),
    format = "file"
  ),

  ## Magaloni -----

  tar_target(
    name = magaloni,
    command = redownload_magaloni(verbose = verbose,
                                  include_in_output = include_in_output)
  ),

  tar_target(
    name = add_magaloni,
    command = usethis::use_data(magaloni, overwrite = TRUE) |>
      c("data/magaloni.rda"),
    format = "file"
  ),

  tar_target(
    name = magaloni_extended,
    command = redownload_magaloni(extend = TRUE, verbose = verbose,
                                  include_in_output = include_in_output)
  ),

  tar_target(
    name = add_magaloni_extended,
    command = usethis::use_data(magaloni_extended, overwrite = TRUE) |>
      c("data/magaloni_extended.rda"),
    format = "file"
  ),

  ## Mainwaring -----

  tar_target(
    name = mainwaring_filename,
    command = "data-raw/Mainwaring Linan.txt",
    format = "file"
  ),

  tar_target(
    name = mainwaring,
    command = prepare_mainwaring(mainwaring_filename, verbose = verbose,
                                 include_in_output = include_in_output)
  ),

  tar_target(
    name = add_mainwaring,
    command = usethis::use_data(mainwaring, overwrite = TRUE) |>
      c("data/mainwaring.rda"),
    format = "file"
  ),

  tar_target(
    name = mainwaring_pmm,
    command = extract_pmm_var(pmm_replication,
                              pmm_mainwaring,
                              include_in_output = include_in_output)
  ),

  tar_target(
    name = add_mainwaring_pmm,
    command = usethis::use_data(mainwaring_pmm, overwrite = TRUE) |>
      c("data/mainwaring_pmm.rda"),
    format = "file"
  ),

  ## Munck -----

  tar_target(
    name = munck_pmm,
    command = extract_pmm_var(pmm_replication,
                              pmm_munck,
                              include_in_output = include_in_output)
  ),

  tar_target(
    name = add_munck_pmm,
    command = usethis::use_data(munck_pmm, overwrite = TRUE) |>
      c("data/munck_pmm.rda"),
    format = "file"
  ),

  ## PACL

  tar_target(
    name = pacl_pmm,
    command = extract_pmm_var(pmm_replication,
                              pmm_pacl,
                              include_in_output = include_in_output)
  ),

  tar_target(
    name = add_pacl_pmm,
    command = usethis::use_data(pacl_pmm, overwrite = TRUE) |>
      c("data/pacl_pmm.rda"),
    format = "file"
  ),

  tar_target(
    name = pacl,
    command = redownload_pacl(verbose = verbose,
                              include_in_output = include_in_output)
  ),

  tar_target(
    name = add_pacl,
    command = usethis::use_data(pacl, overwrite = TRUE) |>
      c("data/pacl.rda"),
    format = "file"
  ),

  tar_target(
    name = pacl_update,
    command = redownload_pacl_update(verbose = verbose,
                                     include_in_output = include_in_output)
  ),

  tar_target(
    name = add_pacl_update,
    command = usethis::use_data(pacl_update, overwrite = TRUE) |>
      c("data/pacl_update.rda"),
    format = "file"
  ),

  ## PEPS

  tar_target(
    name = peps,
    command = redownload_peps(verbose = verbose,
                              include_in_output = include_in_output)
  ),

  tar_target(
    name = add_peps,
    command = usethis::use_data(peps, overwrite = TRUE) |>
      c("data/peps.rda"),
    format = "file"
  ),

  ## Polity

  tar_target(
    name = polity_pmm,
    command = extract_pmm_var(pmm_replication,
                              pmm_polity,
                              include_in_output = include_in_output)
  ),

  tar_target(
    name = add_polity_pmm,
    command = usethis::use_data(polity_pmm, overwrite = TRUE) |>
      c("data/polity_pmm.rda"),
    format = "file"
  ),

  tar_target(
    name = polityIV,
    command = redownload_polityIV(verbose = verbose,
                                  include_in_output = include_in_output)
  ),

  tar_target(
    name = add_polityIV,
    command = usethis::use_data(polityIV, overwrite = TRUE) |>
      c("data/polityIV.rda"),
    format = "file"
  ),

  tar_target(
    name = polity5,
    command = download_polity_annual(verbose = verbose,
                                     include_in_output = include_in_output)
  ),

  tar_target(
    name = add_polity5,
    command = usethis::use_data(polity5, overwrite = TRUE) |>
      c("data/polity5.rda"),
    format = "file"
  ),

  ## PITF -----

  tar_target(
    name = pitf_p4,
    command = create_pitf_scores(polityIV,
                                 verbose = verbose,
                                 include_in_output = include_in_output)
  ),

  tar_target(
    name = add_pitf_p4,
    command = usethis::use_data(pitf_p4, overwrite = TRUE) |>
      c("data/pitf_p4.rda"),
    format = "file"
  ),

  tar_target(
    name = pitf,
    command = create_pitf_scores(polity5,
                                 verbose = verbose,
                                 include_in_output = include_in_output)
  ),

  tar_target(
    name = add_pitf,
    command = usethis::use_data(pitf, overwrite = TRUE) |>
      c("data/pitf.rda"),
    format = "file"
  ),

  ## Polyarchy -----

  tar_target(
    name = polyarchy_pmm,
    command = extract_pmm_var(pmm_replication,
                              pmm_polyarchy,
                              include_in_output = include_in_output)
  ),

  tar_target(
    name = add_polyarchy_pmm,
    command = usethis::use_data(polyarchy_pmm, overwrite = TRUE) |>
      c("data/polyarchy_pmm.rda"),
    format = "file"
  ),

  tar_target(
    name = polyarchy,
    command = redownload_polyarchy_original(verbose = verbose,
                                            include_in_output = include_in_output)
  ),

  tar_target(
    name = add_polyarchy,
    command = usethis::use_data(polyarchy, overwrite = TRUE) |>
      c("data/polyarchy.rda"),
    format = "file"
  ),

  tar_target(
    name = polyarchy_dimensions,
    command = redownload_polyarchy_dimensions(verbose = verbose,
                                              include_in_output = include_in_output)
  ),

  tar_target(
    name = add_polyarchy_dimensions,
    command = usethis::use_data(polyarchy_dimensions, overwrite = TRUE) |>
      c("data/polyarchy_dimensions.rda"),
    format = "file"
  ),

  ## PRC/Gasiorowski -----

  tar_target(
    name = prc_pmm,
    command = extract_pmm_var(pmm_replication,
                              pmm_prc,
                              include_in_output = include_in_output)
  ),

  tar_target(
    name = add_prc_pmm,
    command = usethis::use_data(prc_pmm, overwrite = TRUE) |>
      c("data/prc_pmm.rda"),
    format = "file"
  ),

  tar_target(
    name = prc_gasiorowski_filename,
    command = "data-raw/Gasiorowski.csv",
    format = "file"
  ),

  tar_target(
    name = prc_gasiorowski,
    command = prepare_prc(prc_gasiorowski_filename,
                          verbose = verbose,
                          include_in_output = include_in_output)
  ),

  tar_target(
    name = add_prc_gasiorowski,
    command = usethis::use_data(prc_gasiorowski, overwrite = TRUE) |>
      c("data/prc_gasiorowski.rda"),
    format = "file"
  ),

  ## PIPE -----

  # Should normally be like this, but redownload no longer works
  # tar_target(
  #   name = PIPE,
  #   command = redownload_PIPE(verbose = verbose,
  #                             include_in_output = include_in_output)
  # ),

  # tar_target(
  #   name = add_PIPE,
  #   command = usethis::use_data(PIPE, overwrite = TRUE) |>
  #     c("data/PIPE.rda"),
  #   format = "file"
  # ),

  tar_target(
    name = add_PIPE,
    command = c("data/PIPE.rda"),
    format = "file"
  ),

  ## REIGN -----

  tar_target(
    name = REIGN,
    command = redownload_reign(verbose = verbose,
                               include_in_output = include_in_output)
  ),

  tar_target(
    name = add_REIGN,
    command = usethis::use_data(REIGN, overwrite = TRUE) |>
      c("data/REIGN.rda"),
    format = "file"
  ),

  ## SVDMI -----

  tar_target(
    name = svmdi,
    command = redownload_svmdi(verbose = verbose,
                               include_in_output = include_in_output)
  ),

  tar_target(
    name = add_svmdi,
    command = usethis::use_data(svmdi, overwrite = TRUE) |>
      c("data/svmdi.rda"),
    format = "file"
  ),

  tar_target(
    name = svmdi_2016,
    command = redownload_svmdi(release_year = 2016,
                               verbose = verbose,
                               include_in_output = include_in_output)
  ),

  tar_target(
    name = add_svmdi_2016,
    command = usethis::use_data(svmdi_2016, overwrite = TRUE) |>
      c("data/svmdi_2016.rda"),
    format = "file"
  ),

  ## Svolik -----

  tar_target(
    name = svolik_regime_filename,
    command = "data-raw/regime and no authority spells, country-year, 1946-2008.dta",
    format = "file"
  ),

  tar_target(
    name = svolik_regime,
    command = prepare_svolik_regime(svolik_regime_filename,
                                    verbose = verbose,
                                    include_in_output = include_in_output)
  ),

  tar_target(
    name = add_svolik_regime,
    command = usethis::use_data(svolik_regime, overwrite = TRUE) |>
      c("data/svolik_regime.rda"),
    format = "file"
  ),

  ## UDS -----

  # The original website no longer works, so the only versions of the data are archived here

  tar_target(
    name = uds_2014,
    command = "data/uds_2014.rda",
    format = "file"
  ),

  tar_target(
    name = uds_2011,
    command = "data/uds_2011.rda",
    format = "file"
  ),

  tar_target(
    name = uds_2010,
    command = "data/uds_2010.rda",
    format = "file"
  ),

  # This target needs manual invalidation for large overhauls; it currently does
  # not detect that it depends on every dataset in the package

  tar_target(
    name = extended_uds,
    command = generate_extended_uds(verbose = verbose)
  ),

  tar_target(
    name = add_extended_uds,
    command = usethis::use_data(extended_uds, overwrite = TRUE) |>
      c("data/extended_uds.rda"),
    format = "file"
  ),

  ## Ulfelder -----

  tar_target(
    name = ulfelder,
    command = redownload_ulfelder(verbose = verbose,
                                  include_in_output = include_in_output)
  ),

  tar_target(
    name = add_ulfelder,
    command = usethis::use_data(ulfelder, overwrite = TRUE) |>
      c("data/ulfelder.rda"),
    format = "file"
  ),

  tar_target(
    name = ulfelder_extended,
    command = redownload_ulfelder(extend = TRUE, verbose = verbose,
                                  include_in_output = include_in_output)
  ),

  tar_target(
    name = add_ulfelder_extended,
    command = usethis::use_data(ulfelder_extended, overwrite = TRUE) |>
      c("data/ulfelder_extended.rda"),
    format = "file"
  ),

  ## UTIP

  tar_target(
    name = utip,
    command = redownload_utip(verbose = verbose,
                              include_in_output = include_in_output)
  ),

  tar_target(
    name = add_utip,
    command = usethis::use_data(utip, overwrite = TRUE) |>
      c("data/utip.rda"),
    format = "file"
  ),

  ## Vanhanen -----

  tar_target(
    name = vanhanen_filename,
    command = "data-raw/FSD1289/FSD1289/Study/data/daF1289e.csv",
    format = "file"
  ),

  tar_target(
    name = vanhanen,
    command = prepare_vanhanen(vanhanen_filename, verbose = verbose,
                               include_in_output = include_in_output)
  ),

  tar_target(
    name = add_vanhanen,
    command = usethis::use_data(vanhanen, overwrite = TRUE) |>
      c("data/vanhanen.rda"),
    format = "file"
  ),

  tar_target(
    name = vanhanen_pmm,
    command = extract_pmm_var(pmm_replication,
                              pmm_vanhanen,
                              include_in_output = include_in_output)
  ),

  tar_target(
    name = add_vanhanen_pmm,
    command = usethis::use_data(prc_pmm, overwrite = TRUE) |>
      c("data/vanhanen_pmm.rda"),
    format = "file"
  ),

  ## VDEM (simplified) -----

  tar_target(
    name = vdem_simple,
    command = prepare_vdem_simple(version = "13.0", verbose = verbose,
                                  include_in_output = include_in_output)
  ),

  tar_target(
    name = add_vdem_simple,
    command = usethis::use_data(vdem_simple, overwrite = TRUE) |>
      c("data/vdem_simple.rda"),
    format = "file"
  ),

  ## Wahman Teorell and Hadenius -----

  tar_target(
    name = wahman_teorell_hadenius,
    command = redownload_wahman_teorell_hadenius(verbose = verbose,
                                                 include_in_output = include_in_output)
  ),

  tar_target(
    name = add_wahman_teorell_hadenius,
    command = usethis::use_data(wahman_teorell_hadenius, overwrite = TRUE) |>
      c("data/wahman_teorell_hadenius.rda"),
    format = "file"
  ),

  ## Bibliography file

  tar_target(
    name = bibliography_file,
    command = "data-raw/bibfile.bib",
    format = "file"
  ),

  tar_target(
    name = bibliography,
    command = RefManageR::ReadBib(bibliography_file)
  ),

  tar_target(
    name = add_bibliography,
    command = usethis::use_data(bibliography, overwrite = TRUE) |>
      c("data/bibliography.rda"),
    format = "file"
  ),

  ## File testing that all datasets work and are correctly added to the package

  tar_knit(
    name = add_and_test_all_scores,
    path = "data-raw/Adding and testing all democracy datasets.Rmd",
    output = "data-raw/Adding and testing all democracy datasets.md"
  )
)
