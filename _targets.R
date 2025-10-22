# Created by use_targets().
# Follow the comments below to fill in this target script.
# Then follow the manual to check and run the pipeline:
#   https://books.ropensci.org/targets/walkthrough.html#inspect-the-pipeline # nolint

# Load packages required to define the pipeline:
library(targets)
library(tarchetypes) # Load other packages as needed. # nolint
library(tidyverse)

# Set target options:
tar_option_set(
  packages = c("tidyverse", "rlang", "democracyData"), # packages that your targets need to run
  imports = c("democracyData"),
  format = "rds" # default storage format
  # Set other options as needed.
)

# tar_make_clustermq() configuration (okay to leave alone):
options(clustermq.scheduler = "multiprocess")

# tar_make_future() configuration (okay to leave alone):
future::plan(future.callr::callr)

# Run the R scripts in the R/ folder with your custom functions:
# tar_source()
# source("other_functions.R") # Source other scripts as needed. # nolint
tar_source("data-raw/prepare_internal_country_data.R")
tar_source("R")

devtools::load_all()
# Set up objects

verbose <- TRUE

pmm <- tibble(dataset_name = c("polity_pmm", "munck_pmm", "arat_pmm", "hadenius_pmm",
                               "bollen_pmm", "mainwaring_pmm", "polyarchy_pmm", "prc_pmm",
                               "pacl_pmm", "fh_pmm", "vanhanen_pmm", "blm_pmm"),
              replication_varname = c("pmm_polity", "pmm_munck", "pmm_arat", "pmm_hadenius",
                                      "pmm_bollen", "pmm_mainwaring", "pmm_polyarchy", "pmm_prc",
                                      "pmm_pacl", "pmm_freedomhouse", "pmm_vanhanen", "pmm_blm")) |>
  mutate(obj_name = dataset_name,
         add_obj_name = paste("add", obj_name, sep = "_"),
         data_file_name = paste("data/", dataset_name, ".rda", sep = ""),
         across(any_of(c("replication_varname", "obj_name", "add_obj_name")), rlang::syms))


redownloadable <- tibble(dataset_name = c("blm", "peps", "polityIV", "REIGN", "bti", "bmr", "pacl", "pacl_update", "utip",
                                          "LIED", "polyarchy", "polyarchy_dimensions", "anckar",
                                          "vaporeg", "PIPE")) |>
  mutate(obj_name = dataset_name,
         add_obj_name = paste("add", obj_name, sep = "_"),
         data_file_name = paste("data/", dataset_name, ".rda", sep = ""),
         fun = paste("redownload", dataset_name, sep = "_"),
         fun = case_when(fun == "redownload_polyarchy" ~ "redownload_polyarchy_original",
                         fun == "redownload_LIED" ~ "redownload_lied",
                         fun == "redownload_REIGN" ~ "redownload_reign",
                         fun == "redownload_PIPE" ~ "redownload_pipe",
                         TRUE ~ fun),
         across(any_of(c("replication_varname", "obj_name", "add_obj_name", "fun")), rlang::syms))

gwf_df <- tibble(dataset_name = c("gwf_all", "gwf_autocratic"),
                     dataset_param = c("all", "autocratic")) |>
  expand_grid(extend_param = c(TRUE, FALSE)) |>
  mutate(fun = paste("redownload", dataset_name, sep = "_"),
         dataset_name = case_when(extend_param ~ paste(dataset_name, "extended", sep = "_"),
                                  !extend_param ~ dataset_name),
         obj_name = dataset_name,
         add_obj_name = paste("add", obj_name, sep = "_"),
         data_file_name = paste("data/", dataset_name, ".rda", sep = ""),
         fun = case_when(str_detect(fun, "redownload_gwf") ~ "redownload_gwf",
                         TRUE ~ fun),
         across(any_of(c("replication_varname", "obj_name", "add_obj_name", "fun")), rlang::syms))

other_extendable <- tibble(dataset_name = c("ulfelder", "magaloni")) |>
  expand_grid(extend_param = c(TRUE, FALSE)) |>
  mutate(fun = paste("redownload", dataset_name, sep = "_"),
         dataset_name = case_when(extend_param ~ paste(dataset_name, "extended", sep = "_"),
                                  !extend_param ~ dataset_name),
         obj_name = dataset_name,
         add_obj_name = paste("add", obj_name, sep = "_"),
         data_file_name = paste("data/", dataset_name, ".rda", sep = ""),
         across(any_of(c("replication_varname", "obj_name", "add_obj_name", "fun")), rlang::syms))

multi_release <- tibble(dataset_name = c("svmdi", "svmdi", "uds", "uds", "uds"),
                        release_year_param = c(2020, 2016, 2014, 2011, 2010)) |>
  mutate(fun = paste("redownload", dataset_name, sep = "_"),
         dataset_name = paste(dataset_name, release_year_param, sep = "_"),
         dataset_name = case_when(dataset_name == "svmdi_2020" ~ "svmdi",
                                  TRUE ~ dataset_name),
         obj_name = dataset_name,
         add_obj_name = paste("add", obj_name, sep = "_"),
         data_file_name = paste("data/", dataset_name, ".rda", sep = ""),
         across(any_of(c("replication_varname", "obj_name", "add_obj_name", "fun")), rlang::syms))

preparable <- tibble(dataset_name = c("eiu", "vanhanen", "kailitz", "anrr", "doorenspleet", "mainwaring",
                                      "prc_gasiorowski", "svolik_regime", "arat"),
                     data_raw_filename =c("data-raw/EIU-democracy-index-2024.pdf",
                                          "data-raw/FSD1289/FSD1289/Study/data/daF1289e.csv",
                                          "data-raw/kailitz.yearly.rds",
                                          "data-raw/DDCGdata_final.dta",
                                          "data-raw/Doorenspleet data.csv",
                                          "data-raw/Mainwaring Linan.txt",
                                          "data-raw/Gasiorowski.csv",
                                          "data-raw/regime and no authority spells, country-year, 1946-2008.dta",
                                          "data-raw/arat-democracy-scores.csv"),
                     dataset_name_filename = paste(dataset_name, "filename", sep = "_")) |>
  mutate(obj_name = dataset_name,
         add_obj_name = paste("add", obj_name, sep = "_"),
         data_file_name = paste("data/", dataset_name, ".rda", sep = ""),
         fun = paste("prepare", dataset_name, sep = "_"),
         fun = case_when(fun == "prepare_prc_gasiorowski" ~ "prepare_prc",
                         TRUE ~ fun),
         across(any_of(c("replication_varname", "obj_name", "add_obj_name", "fun")), rlang::syms))

track_only <- tibble(dataset_name = c("bnr", "bnr_extended",
                                      "wahman_teorell_hadenius")) |>
  mutate(obj_name = dataset_name,
         add_obj_name = paste("add", obj_name, sep = "_"),
         data_file_name = paste("data/", dataset_name, ".rda", sep = ""),
         across(any_of(c("replication_varname", "obj_name", "add_obj_name", "fun")), rlang::syms))

list(
  ## Country-year coder data

  internal_country_data,


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
    command = {
      data
      c("extended_country_name", "GWn", "cown", "in_GW_system")
    }
  ),

  ## PMM replication data -----

  tar_target(
    name = pmm_replication_filename,
    command = "data-raw/democracy1946.2008.rda",
    format = "file"
  ),

  tar_target(
    name = pmm_replication,
    command = {
      data
      prepare_pmm_replication_data(pmm_replication_filename,
                                           verbose = verbose,
                                           include_in_output = include_in_output)}
  ),

  ## PMM datasets -----

  tar_eval(
    values = pmm,
    tar_target(
      name = obj_name,
      command = {
        data
        extract_pmm_var(pmm_replication,
                                replication_varname,
                                include_in_output = include_in_output)}
    )
  ),

  tar_eval(
    values = pmm,
    tar_target(
      name = add_obj_name,
      command = usethis::use_data(obj_name, overwrite = TRUE) |>
        c(data_file_name),
      format = "file"
    )
  ),

  ## Redownloadable datasets -----

  tar_eval(
    values = redownloadable,
    tar_target(
      name = obj_name,
      command = {
        data
        fun(verbose = verbose,
                    include_in_output = include_in_output)},
    )
  ),

  tar_eval(
    values = redownloadable,
    tar_target(
      name = add_obj_name,
      command = usethis::use_data(obj_name, overwrite = TRUE) |>
        c(data_file_name),
      format = "file"
    )
  ),

  ## Extendable datasets -----

  tar_eval(
    values = gwf_df,
    tar_target(
      name = obj_name,
      command = {
        data
        fun(extend = extend_param,
                    verbose = verbose,
                    include_in_output = include_in_output,
                    dataset = dataset_param)
      }
    )
  ),

  tar_eval(
    values = gwf_df,
    tar_target(
      name = add_obj_name,
      command = usethis::use_data(obj_name, overwrite = TRUE) |>
        c(data_file_name),
      format = "file"
    )
  ),

  tar_eval(
    values = other_extendable,
    tar_target(
      name = obj_name,
      command = {
        data
        fun(extend = extend_param,
                    verbose = verbose,
                    include_in_output = include_in_output)}
    )
  ),

  tar_eval(
    values = other_extendable,
    tar_target(
      name = add_obj_name,
      command = usethis::use_data(obj_name, overwrite = TRUE) |>
        c(data_file_name),
      format = "file"
    )
  ),

  ## Multi Release -----

  tar_eval(
    values = multi_release,
    tar_target(
      name = obj_name,
      command = {
        data
        fun(release_year = release_year_param,
                    verbose = verbose,
                    include_in_output = include_in_output)}
    )
  ),

  tar_eval(
    values = multi_release,
    tar_target(
      name = add_obj_name,
      command = usethis::use_data(obj_name, overwrite = TRUE) |>
        c(data_file_name),
      format = "file"
    )
  ),


  ## Preparable datasets

  tar_eval(
    values = preparable,
    tar_target(
      name = dataset_name_filename,
      command = data_raw_filename,
      format = "file"
    )
  ),

  tar_eval(
    values = preparable,
    tar_target(
      name = obj_name,
      command = {
        data
        fun(data_raw_filename,
                    verbose = verbose,
                    include_in_output = include_in_output)
      }
    )
  ),

  tar_eval(
    values = preparable,
    tar_target(
      name = add_obj_name,
      command = usethis::use_data(obj_name, overwrite = TRUE) |>
        c(data_file_name),
      format = "file"
    )
  ),

  ## Track only - no longer redownloadable

  tar_eval(
    values = track_only,
    tar_target(
      name = add_obj_name,
      command = c(data_file_name),
      format = "file"
    )
  ),

  ## WGI -----

  tar_target(
    name = wgi,
    command = {
      data
      download_wgi_voice_and_accountability(verbose = verbose,
                                                    include_in_output = include_in_output)
    }
  ),

  tar_target(
    name = add_wgi,
    command = usethis::use_data(wgi, overwrite = TRUE) |>
      c("data/wgi.rda"),
    format = "file"
  ),


  ## FH -----

  tar_target(
    name = fh,
    command = {
      data
      download_fh(verbose = verbose,
                          include_in_output = include_in_output,
                          include_territories = TRUE)
    }
  ),

  tar_target(
    name = add_fh,
    command = usethis::use_data(fh, overwrite = TRUE) |>
      c("data/fh.rda")
  ),

  tar_target(
    name = fh_electoral,
    command = {
      data
      download_fh_electoral(verbose = verbose,
                                    include_in_output = include_in_output)}
  ),

  tar_target(
    name = add_fh_electoral,
    command = usethis::use_data(fh_electoral, overwrite = TRUE) |>
      c("data/fh_electoral.rda")
  ),

  tar_target(
    name = fh_full,
    command = {
      data
      download_fh_full(verbose = verbose,
                               include_in_output = include_in_output)}
  ),

  tar_target(
    name = add_fh_full,
    command = usethis::use_data(fh_full, overwrite = TRUE) |>
      c("data/fh_full.rda")
  ),

  ## Polity 5 -----

  tar_target(
    name = polity5,
    command = {
      data
      download_polity_annual(verbose = verbose,
                                     include_in_output = include_in_output)}
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
    command = {
      data
      create_pitf_scores(polityIV,
                                 verbose = verbose,
                                 include_in_output = include_in_output)}
  ),

  tar_target(
    name = add_pitf_p4,
    command = usethis::use_data(pitf_p4, overwrite = TRUE) |>
      c("data/pitf_p4.rda"),
    format = "file"
  ),

  tar_target(
    name = pitf,
    command = {
      data
      create_pitf_scores(polity5,
                                 verbose = verbose,
                                 include_in_output = include_in_output)}
  ),

  tar_target(
    name = add_pitf,
    command = usethis::use_data(pitf, overwrite = TRUE) |>
      c("data/pitf.rda"),
    format = "file"
  ),


  ## Extended UDS ----

  tar_target(
    name = extended_uds,
    command = {
      data
      generate_extended_uds(verbose = verbose)
    },
    error = "continue"
  ),

  tar_target(
    name = add_extended_uds,
    command = usethis::use_data(extended_uds, overwrite = TRUE) |>
      c("data/extended_uds.rda"),
    format = "file"
  ),

  ## VDEM (simplified) -----

  tar_target(
    name = vdem_simple,
    command = {
      data
      prepare_vdem_simple(version = "15.0", verbose = verbose,
                                  include_in_output = include_in_output)}
  ),

  tar_target(
    name = add_vdem_simple,
    command = usethis::use_data(vdem_simple, overwrite = TRUE) |>
      c("data/vdem_simple.rda"),
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

  ## State system data for country_year_coder -----

  # tar_target(
  #   name = data,
  #   command = read_csv(here::here("data-raw/country_year_panel.csv"))
  # ),
  #
  # tar_target(
  #   name = add_country_dates_panel,
  #   command = usethis::use_data(data, internal = TRUE, overwrite = TRUE) |>
  #     c("R/sysdata.rda"),
  #   format = "file"
  # ),

  ## File testing that all datasets work and are correctly added to the package -----

  # tar_knit(
  #   name = add_and_test_all_scores,
  #   path = "data-raw/Adding and testing all democracy datasets.Rmd",
  #   output = "data-raw/Adding and testing all democracy datasets.md"
  # ),

  ## README -----

  tar_knit(
    name = README,
    path = "README.Rmd"
  )

)
