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

describe_target <- function(action, dataset = NULL) {
  if (is.null(dataset)) {
    action
  } else {
    sprintf("%s: %s", action, dataset)
  }
}

pmm <- tibble(
  dataset_name = c(
    "polity_pmm",
    "munck_pmm",
    "arat_pmm",
    "hadenius_pmm",
    "bollen_pmm",
    "mainwaring_pmm",
    "polyarchy_pmm",
    "prc_pmm",
    "pacl_pmm",
    "fh_pmm",
    "vanhanen_pmm",
    "blm_pmm"
  ),
  replication_varname = c(
    "pmm_polity",
    "pmm_munck",
    "pmm_arat",
    "pmm_hadenius",
    "pmm_bollen",
    "pmm_mainwaring",
    "pmm_polyarchy",
    "pmm_prc",
    "pmm_pacl",
    "pmm_freedomhouse",
    "pmm_vanhanen",
    "pmm_blm"
  )
) |>
  mutate(
    obj_name = dataset_name,
    add_obj_name = paste("add", obj_name, sep = "_"),
    data_file_name = paste("data/", dataset_name, ".rda", sep = ""),
    target_description = describe_target(
      "Extract PMM replication scores",
      dataset_name
    ),
    save_description = describe_target("Write packaged dataset", dataset_name),
    across(
      any_of(c("replication_varname", "obj_name", "add_obj_name")),
      rlang::syms
    )
  )


redownloadable <- tibble(
  dataset_name = c(
    "blm",
    "peps",
    "polityIV",
    "REIGN",
    "bti",
    "bmr",
    "pacl",
    "pacl_update",
    "utip",
    "LIED",
    "polyarchy",
    "polyarchy_dimensions",
    "anckar",
    "vaporeg",
    "PIPE"
  )
) |>
  mutate(
    obj_name = dataset_name,
    add_obj_name = paste("add", obj_name, sep = "_"),
    data_file_name = paste("data/", dataset_name, ".rda", sep = ""),
    target_description = describe_target(
      "Download and process archived dataset",
      dataset_name
    ),
    save_description = describe_target("Write packaged dataset", dataset_name),
    fun = paste("redownload", dataset_name, sep = "_"),
    fun = case_when(
      fun == "redownload_polyarchy" ~ "redownload_polyarchy_original",
      fun == "redownload_LIED" ~ "redownload_lied",
      fun == "redownload_REIGN" ~ "redownload_reign",
      fun == "redownload_PIPE" ~ "redownload_pipe",
      TRUE ~ fun
    ),
    across(
      any_of(c("replication_varname", "obj_name", "add_obj_name", "fun")),
      rlang::syms
    )
  )

gwf_df <- tibble(
  dataset_name = c("gwf_all", "gwf_autocratic"),
  dataset_param = c("all", "autocratic")
) |>
  expand_grid(extend_param = c(TRUE, FALSE)) |>
  mutate(
    fun = paste("redownload", dataset_name, sep = "_"),
    dataset_name = case_when(
      extend_param ~ paste(dataset_name, "extended", sep = "_"),
      !extend_param ~ dataset_name
    ),
    obj_name = dataset_name,
    add_obj_name = paste("add", obj_name, sep = "_"),
    data_file_name = paste("data/", dataset_name, ".rda", sep = ""),
    target_description = describe_target(
      "Download and process GWF dataset",
      dataset_name
    ),
    save_description = describe_target("Write packaged dataset", dataset_name),
    fun = case_when(
      str_detect(fun, "redownload_gwf") ~ "redownload_gwf",
      TRUE ~ fun
    ),
    across(
      any_of(c("replication_varname", "obj_name", "add_obj_name", "fun")),
      rlang::syms
    )
  )

other_extendable <- tibble(dataset_name = c("ulfelder", "magaloni")) |>
  expand_grid(extend_param = c(TRUE, FALSE)) |>
  mutate(
    fun = paste("redownload", dataset_name, sep = "_"),
    dataset_name = case_when(
      extend_param ~ paste(dataset_name, "extended", sep = "_"),
      !extend_param ~ dataset_name
    ),
    obj_name = dataset_name,
    add_obj_name = paste("add", obj_name, sep = "_"),
    data_file_name = paste("data/", dataset_name, ".rda", sep = ""),
    target_description = describe_target(
      "Download and extend dataset",
      dataset_name
    ),
    save_description = describe_target("Write packaged dataset", dataset_name),
    across(
      any_of(c("replication_varname", "obj_name", "add_obj_name", "fun")),
      rlang::syms
    )
  )

multi_release <- tibble(
  dataset_name = c("svmdi", "svmdi", "uds", "uds", "uds"),
  release_year_param = c(2020, 2016, 2014, 2011, 2010)
) |>
  mutate(
    fun = paste("redownload", dataset_name, sep = "_"),
    dataset_name = paste(dataset_name, release_year_param, sep = "_"),
    dataset_name = case_when(
      dataset_name == "svmdi_2020" ~ "svmdi",
      TRUE ~ dataset_name
    ),
    obj_name = dataset_name,
    add_obj_name = paste("add", obj_name, sep = "_"),
    data_file_name = paste("data/", dataset_name, ".rda", sep = ""),
    target_description = describe_target(
      "Download and process release snapshot",
      dataset_name
    ),
    save_description = describe_target("Write packaged dataset", dataset_name),
    across(
      any_of(c("replication_varname", "obj_name", "add_obj_name", "fun")),
      rlang::syms
    )
  )

preparable <- tibble(
  dataset_name = c(
    "eiu",
    "vanhanen",
    "kailitz",
    "anrr",
    "doorenspleet",
    "mainwaring",
    "prc_gasiorowski",
    "svolik_regime",
    "arat"
  ),
  data_raw_filename = c(
    "data-raw/eiu_wikipedia_snapshot.csv",
    "data-raw/FSD1289/FSD1289/Study/data/daF1289e.csv",
    "data-raw/kailitz.yearly.rds",
    "data-raw/DDCGdata_final.dta",
    "data-raw/Doorenspleet data.csv",
    "data-raw/Mainwaring Linan.txt",
    "data-raw/Gasiorowski.csv",
    "data-raw/regime and no authority spells, country-year, 1946-2008.dta",
    "data-raw/arat-democracy-scores.csv"
  ),
  dataset_name_filename = paste(dataset_name, "filename", sep = "_")
) |>
  mutate(
    obj_name = dataset_name,
    add_obj_name = paste("add", obj_name, sep = "_"),
    data_file_name = paste("data/", dataset_name, ".rda", sep = ""),
    file_description = describe_target("Track raw input file", dataset_name),
    target_description = describe_target("Prepare dataset", dataset_name),
    save_description = describe_target("Write packaged dataset", dataset_name),
    fun = paste("prepare", dataset_name, sep = "_"),
    fun = case_when(
      fun == "prepare_prc_gasiorowski" ~ "prepare_prc",
      TRUE ~ fun
    ),
    across(
      any_of(c("replication_varname", "obj_name", "add_obj_name", "fun")),
      rlang::syms
    )
  )

track_only <- tibble(
  dataset_name = c("bnr", "bnr_extended", "wahman_teorell_hadenius")
) |>
  mutate(
    obj_name = dataset_name,
    add_obj_name = paste("add", obj_name, sep = "_"),
    data_file_name = paste("data/", dataset_name, ".rda", sep = ""),
    save_description = describe_target(
      "Track packaged dataset file",
      dataset_name
    ),
    across(
      any_of(c("replication_varname", "obj_name", "add_obj_name", "fun")),
      rlang::syms
    )
  )

list(
  ## Country-year coder data

  internal_country_data,

  ## Legacy packaged snapshots -----

  tar_target(
    name = vaporeg_2024_filename,
    command = "data-raw/vaporeg_2024.rda",
    format = "file",
    description = "Track raw legacy VaPoReg 2024 snapshot"
  ),

  tar_target(
    name = vaporeg_2024,
    command = {
      legacy_env <- new.env(parent = emptyenv())
      load(vaporeg_2024_filename, envir = legacy_env)
      legacy_env$vaporeg_2024
    },
    description = "Load legacy VaPoReg 2024 snapshot"
  ),

  tar_target(
    name = add_vaporeg_2024,
    command = usethis::use_data(vaporeg_2024, overwrite = TRUE) |>
      c("data/vaporeg_2024.rda"),
    format = "file",
    description = "Write packaged legacy VaPoReg 2024 snapshot"
  ),

  tar_target(
    name = wgi_legacy_filename,
    command = "data-raw/wgi_legacy.rda",
    format = "file",
    description = "Track raw legacy WGI snapshot"
  ),

  tar_target(
    name = wgi_legacy,
    command = {
      legacy_env <- new.env(parent = emptyenv())
      load(wgi_legacy_filename, envir = legacy_env)
      legacy_env$wgi_legacy
    },
    description = "Load legacy WGI snapshot"
  ),

  tar_target(
    name = add_wgi_legacy,
    command = usethis::use_data(wgi_legacy, overwrite = TRUE) |>
      c("data/wgi_legacy.rda"),
    format = "file",
    description = "Write packaged legacy WGI snapshot"
  ),

  ## Democracy Info dataset -----

  tar_target(
    name = democracy_info_filename,
    command = "data-raw/democracy_info.csv",
    format = "file",
    description = "Track democracy_info CSV input"
  ),

  tar_target(
    name = democracy_info,
    command = read_csv(democracy_info_filename),
    description = "Read democracy_info metadata"
  ),

  tar_target(
    name = add_democracy_info,
    command = usethis::use_data(democracy_info, overwrite = TRUE) |>
      c("data/democracy_info.rda"),
    format = "file",
    description = "Write packaged democracy_info metadata"
  ),

  ## Basic params vars -----

  tar_target(
    name = include_in_output,
    command = {
      data
      c("extended_country_name", "GWn", "cown", "in_GW_system")
    },
    description = "Define common identifier columns for prepared datasets"
  ),

  ## PMM replication data -----

  tar_target(
    name = pmm_replication_filename,
    command = "data-raw/democracy1946.2008.rda",
    format = "file",
    description = "Track PMM replication input file"
  ),

  tar_target(
    name = pmm_replication,
    command = {
      data
      prepare_pmm_replication_data(
        pmm_replication_filename,
        verbose = verbose,
        include_in_output = include_in_output
      )
    },
    description = "Prepare PMM replication source data"
  ),

  ## PMM datasets -----

  tar_eval(
    values = pmm,
    tar_target(
      name = obj_name,
      command = {
        data
        extract_pmm_var(
          pmm_replication,
          replication_varname,
          include_in_output = include_in_output
        )
      },
      description = target_description
    )
  ),

  tar_eval(
    values = pmm,
    tar_target(
      name = add_obj_name,
      command = usethis::use_data(obj_name, overwrite = TRUE) |>
        c(data_file_name),
      format = "file",
      description = save_description
    )
  ),

  ## Redownloadable datasets -----

  tar_eval(
    values = redownloadable,
    tar_target(
      name = obj_name,
      command = {
        data
        fun(verbose = verbose, include_in_output = include_in_output)
      },
      description = target_description
    )
  ),

  tar_eval(
    values = redownloadable,
    tar_target(
      name = add_obj_name,
      command = usethis::use_data(obj_name, overwrite = TRUE) |>
        c(data_file_name),
      format = "file",
      description = save_description
    )
  ),

  ## Extendable datasets -----

  tar_eval(
    values = gwf_df,
    tar_target(
      name = obj_name,
      command = {
        data
        fun(
          extend = extend_param,
          verbose = verbose,
          include_in_output = include_in_output,
          dataset = dataset_param
        )
      },
      description = target_description
    )
  ),

  tar_eval(
    values = gwf_df,
    tar_target(
      name = add_obj_name,
      command = usethis::use_data(obj_name, overwrite = TRUE) |>
        c(data_file_name),
      format = "file",
      description = save_description
    )
  ),

  tar_eval(
    values = other_extendable,
    tar_target(
      name = obj_name,
      command = {
        data
        fun(
          extend = extend_param,
          verbose = verbose,
          include_in_output = include_in_output
        )
      },
      description = target_description
    )
  ),

  tar_eval(
    values = other_extendable,
    tar_target(
      name = add_obj_name,
      command = usethis::use_data(obj_name, overwrite = TRUE) |>
        c(data_file_name),
      format = "file",
      description = save_description
    )
  ),

  ## Multi Release -----

  tar_eval(
    values = multi_release,
    tar_target(
      name = obj_name,
      command = {
        data
        fun(
          release_year = release_year_param,
          verbose = verbose,
          include_in_output = include_in_output
        )
      },
      description = target_description
    )
  ),

  tar_eval(
    values = multi_release,
    tar_target(
      name = add_obj_name,
      command = usethis::use_data(obj_name, overwrite = TRUE) |>
        c(data_file_name),
      format = "file",
      description = save_description
    )
  ),

  ## Preparable datasets

  tar_eval(
    values = preparable,
    tar_target(
      name = dataset_name_filename,
      command = data_raw_filename,
      format = "file",
      description = file_description
    )
  ),

  tar_eval(
    values = preparable,
    tar_target(
      name = obj_name,
      command = {
        data
        fun(
          data_raw_filename,
          verbose = verbose,
          include_in_output = include_in_output
        )
      },
      description = target_description
    )
  ),

  tar_eval(
    values = preparable,
    tar_target(
      name = add_obj_name,
      command = usethis::use_data(obj_name, overwrite = TRUE) |>
        c(data_file_name),
      format = "file",
      description = save_description
    )
  ),

  ## Track only - no longer redownloadable

  tar_eval(
    values = track_only,
    tar_target(
      name = add_obj_name,
      command = c(data_file_name),
      format = "file",
      description = save_description
    )
  ),

  ## WGI -----

  tar_target(
    name = wgi,
    command = {
      data
      download_wgi_voice_and_accountability(
        verbose = verbose,
        include_in_output = include_in_output
      )
    },
    description = "Download and process current WGI voice and accountability"
  ),

  tar_target(
    name = add_wgi,
    command = usethis::use_data(wgi, overwrite = TRUE) |>
      c("data/wgi.rda"),
    format = "file",
    description = "Write packaged current WGI dataset"
  ),

  ## FH -----

  tar_target(
    name = fh,
    command = {
      data
      download_fh(
        verbose = verbose,
        include_in_output = include_in_output,
        include_territories = TRUE
      )
    },
    description = "Download and process archived Freedom House scores"
  ),

  tar_target(
    name = add_fh,
    command = usethis::use_data(fh, overwrite = TRUE) |>
      c("data/fh.rda"),
    description = "Write packaged Freedom House dataset"
  ),

  tar_target(
    name = fh_electoral,
    command = {
      data
      download_fh_electoral(
        verbose = verbose,
        include_in_output = include_in_output
      )
    },
    description = "Download and process Freedom House electoral scores"
  ),

  tar_target(
    name = add_fh_electoral,
    command = usethis::use_data(fh_electoral, overwrite = TRUE) |>
      c("data/fh_electoral.rda"),
    description = "Write packaged Freedom House electoral dataset"
  ),

  tar_target(
    name = fh_full,
    command = {
      data
      download_fh_full(verbose = verbose, include_in_output = include_in_output)
    },
    description = "Download and process full archived Freedom House dataset"
  ),

  tar_target(
    name = add_fh_full,
    command = usethis::use_data(fh_full, overwrite = TRUE) |>
      c("data/fh_full.rda"),
    description = "Write packaged full Freedom House dataset"
  ),

  ## Polity 5 -----

  tar_target(
    name = polity5,
    command = {
      data
      download_polity_annual(
        verbose = verbose,
        include_in_output = include_in_output
      )
    },
    description = "Download and process current annual Polity scores"
  ),

  tar_target(
    name = add_polity5,
    command = usethis::use_data(polity5, overwrite = TRUE) |>
      c("data/polity5.rda"),
    format = "file",
    description = "Write packaged annual Polity dataset"
  ),

  ## PITF -----

  tar_target(
    name = pitf_p4,
    command = {
      data
      create_pitf_scores(
        polityIV,
        verbose = verbose,
        include_in_output = include_in_output
      )
    },
    description = "Create PITF scores using archived Polity IV"
  ),

  tar_target(
    name = add_pitf_p4,
    command = usethis::use_data(pitf_p4, overwrite = TRUE) |>
      c("data/pitf_p4.rda"),
    format = "file",
    description = "Write packaged PITF scores from Polity IV"
  ),

  tar_target(
    name = pitf,
    command = {
      data
      create_pitf_scores(
        polity5,
        verbose = verbose,
        include_in_output = include_in_output
      )
    },
    description = "Create PITF scores using annual Polity data"
  ),

  tar_target(
    name = add_pitf,
    command = usethis::use_data(pitf, overwrite = TRUE) |>
      c("data/pitf.rda"),
    format = "file",
    description = "Write packaged PITF scores"
  ),

  ## Extended UDS ----

  tar_target(
    name = extended_uds,
    command = {
      list(
        data,
        anckar,
        anrr,
        arat,
        blm,
        bmr,
        add_bnr_extended,
        bti,
        svmdi,
        doorenspleet,
        eiu,
        fh,
        fh_electoral,
        gwf_all_extended,
        LIED,
        magaloni_extended,
        mainwaring,
        pacl,
        pacl_update,
        peps,
        pitf,
        bollen_pmm,
        hadenius_pmm,
        munck_pmm,
        polityIV,
        polyarchy,
        polyarchy_dimensions,
        prc_gasiorowski,
        REIGN,
        svolik_regime,
        ulfelder_extended,
        utip,
        vdem_simple,
        vaporeg,
        vanhanen,
        wgi,
        add_wahman_teorell_hadenius
      )
      generate_extended_uds(verbose = verbose)
    },
    error = "continue",
    description = "Fit extended UDS scores from current downstream datasets"
  ),

  tar_target(
    name = add_extended_uds,
    command = usethis::use_data(extended_uds, overwrite = TRUE) |>
      c("data/extended_uds.rda"),
    format = "file",
    description = "Write packaged extended UDS scores"
  ),

  ## VDEM (simplified) -----

  tar_target(
    name = vdem_simple,
    command = {
      data
      prepare_vdem_simple(
        version = "16.0",
        verbose = verbose,
        include_in_output = include_in_output
      )
    },
    description = "Prepare simplified current V-Dem dataset"
  ),

  tar_target(
    name = add_vdem_simple,
    command = usethis::use_data(vdem_simple, overwrite = TRUE) |>
      c("data/vdem_simple.rda"),
    format = "file",
    description = "Write packaged simplified V-Dem dataset"
  ),

  ## Bibliography file

  tar_target(
    name = bibliography_file,
    command = "data-raw/bibfile.bib",
    format = "file",
    description = "Track raw bibliography export"
  ),

  tar_target(
    name = prep_bibliography,
    command = prepare_bibliography_file(bibliography_file),
    format = "file",
    description = "Sanitize bibliography export for package outputs"
  ),

  tar_target(
    name = vignette_bibliography_file,
    command = {
      file.copy(
        from = prep_bibliography,
        to = "vignettes/articles/bibfile.bib",
        overwrite = TRUE
      )
      "vignettes/articles/bibfile.bib"
    },
    format = "file",
    description = "Copy cleaned bibliography into article sources"
  ),

  tar_target(
    name = bibliography,
    command = RefManageR::ReadBib(prep_bibliography),
    description = "Read cleaned bibliography into package object"
  ),

  tar_target(
    name = add_bibliography,
    command = usethis::use_data(bibliography, overwrite = TRUE) |>
      c("data/bibliography.rda"),
    format = "file",
    description = "Write packaged bibliography object"
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

  tar_target(
    name = README_source,
    command = "README.Rmd",
    format = "file",
    description = "Track README source file"
  ),

  tar_target(
    name = README,
    command = {
      README_source
      devtools::build_readme()
      "README.md"
    },
    format = "file",
    description = "Render README from README.Rmd"
  )
)
