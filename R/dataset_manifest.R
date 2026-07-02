# Internal helpers to snapshot the structure of every packaged dataset.
#
# The manifest records, for each object in `data/`, its class, dimensions,
# column names and types, and year range. It is stored as a test fixture
# (tests/testthat/fixtures/dataset_manifest.csv) and compared against the
# packaged data by tests/testthat/test-dataset-manifest.R, so that accidental
# corruption of the packaged data (a stale object written by `use_data()`, a
# dropped column, an unnoticed upstream format change) is caught by fast,
# offline tests. Regenerate the fixture with
# data-raw/capture_dataset_manifest.R after any legitimate data update, and
# review the git diff of the fixture before committing.

#' List the names of all datasets shipped in `data/`
#'
#' @return A sorted character vector of dataset names.
#' @noRd
packaged_dataset_names <- function() {
  results <- utils::data(package = "democracyData")$results
  sort(unname(results[, "Item"]))
}

#' Load a single packaged dataset without polluting the search path
#'
#' @param dataset_name The name of a dataset shipped in `data/`.
#' @return The dataset object.
#' @noRd
get_packaged_dataset <- function(dataset_name) {
  dataset_env <- new.env(parent = emptyenv())
  utils::data(
    list = dataset_name,
    package = "democracyData",
    envir = dataset_env
  )
  dataset_env[[dataset_name]]
}

#' Summarise the structure of one packaged dataset
#'
#' @param dataset_name The name of a dataset shipped in `data/`.
#' @return A one-row [tibble::tibble()] with the dataset's class, dimensions,
#'   year range, and collapsed column name/type signature.
#' @noRd
dataset_manifest_row <- function(dataset_name) {
  dataset <- get_packaged_dataset(dataset_name)

  if (!is.data.frame(dataset)) {
    return(
      dplyr::tibble(
        dataset = dataset_name,
        class = class(dataset)[[1]],
        n_row = length(dataset),
        n_col = NA_integer_,
        min_year = NA_integer_,
        max_year = NA_integer_,
        columns = NA_character_
      )
    )
  }

  column_types <- vapply(
    dataset,
    function(column) class(column)[[1]],
    character(1)
  )

  years <- if ("year" %in% names(dataset)) {
    suppressWarnings(range(dataset$year, na.rm = TRUE))
  } else {
    c(NA_real_, NA_real_)
  }

  dplyr::tibble(
    dataset = dataset_name,
    class = class(dataset)[[1]],
    n_row = nrow(dataset),
    n_col = ncol(dataset),
    min_year = suppressWarnings(as.integer(years[[1]])),
    max_year = suppressWarnings(as.integer(years[[2]])),
    columns = paste(names(dataset), column_types, sep = ":", collapse = "; ")
  )
}

#' Build the structure manifest for all packaged datasets
#'
#' @param dataset_names The datasets to include. Defaults to everything
#'   shipped in `data/`.
#' @return A [tibble::tibble()] with one row per dataset.
#' @noRd
build_dataset_manifest <- function(dataset_names = packaged_dataset_names()) {
  dplyr::bind_rows(lapply(dataset_names, dataset_manifest_row))
}
