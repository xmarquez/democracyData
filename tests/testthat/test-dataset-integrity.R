library(dplyr)

identifier_columns <- c("extended_country_name", "GWn", "cown", "in_GW_system")

all_packaged <- democracyData:::packaged_dataset_names()
substantive_datasets <- setdiff(all_packaged, infrastructure_objects)
registry_covered <- setdiff(all_packaged, registry_exempt_datasets)

test_that("every packaged dataset has a row in democracy_info", {
  known_keys <- registry_with_keys()$key
  mapped_keys <- vapply(
    registry_covered,
    registry_key_for_dataset,
    character(1),
    known_keys = known_keys
  )

  unregistered <- registry_covered[!mapped_keys %in% known_keys]

  expect_equal(
    unregistered,
    character(0),
    info = paste(
      "Packaged datasets without a democracy_info row",
      "(add one to data-raw/democracy_info.csv):",
      paste(unregistered, collapse = ", ")
    )
  )
})

test_that("every democracy_info entry corresponds to a packaged dataset", {
  known_keys <- registry_with_keys()$key
  mapped_keys <- vapply(
    registry_covered,
    registry_key_for_dataset,
    character(1),
    known_keys = known_keys
  )

  orphaned <- setdiff(unique(known_keys), mapped_keys)

  expect_equal(
    orphaned,
    character(0),
    info = paste(
      "democracy_info rows without a packaged dataset:",
      paste(orphaned, collapse = ", ")
    )
  )
})

test_that("all packaged datasets have the standard identifier columns", {
  for (dataset_name in substantive_datasets) {
    dataset <- democracyData:::get_packaged_dataset(dataset_name)

    expect_s3_class(dataset, "data.frame")

    missing_columns <- setdiff(
      c(identifier_columns, "year"),
      names(dataset)
    )
    expect(
      length(missing_columns) == 0,
      sprintf(
        "`%s` is missing standard columns: %s",
        dataset_name,
        paste(missing_columns, collapse = ", ")
      )
    )
  }
})

test_that("no packaged dataset has missing extended_country_name values", {
  for (dataset_name in substantive_datasets) {
    dataset <- democracyData:::get_packaged_dataset(dataset_name)

    if (!"extended_country_name" %in% names(dataset)) {
      next # reported by the identifier-column test
    }

    n_missing <- sum(is.na(dataset$extended_country_name))
    expect(
      n_missing == 0,
      sprintf(
        "`%s` has %d rows with missing extended_country_name",
        dataset_name,
        n_missing
      )
    )
  }
})

test_that("all packaged datasets have sane year ranges", {
  current_year <- as.integer(format(Sys.Date(), "%Y"))

  for (dataset_name in substantive_datasets) {
    dataset <- democracyData:::get_packaged_dataset(dataset_name)

    if (!"year" %in% names(dataset)) {
      next # reported by the identifier-column test
    }

    year_range <- suppressWarnings(range(dataset$year, na.rm = TRUE))
    expect(
      is.finite(year_range[[1]]) &&
        year_range[[1]] >= 1500 &&
        year_range[[2]] <= current_year,
      sprintf(
        "`%s` has an implausible year range: %s-%s",
        dataset_name,
        year_range[[1]],
        year_range[[2]]
      )
    )
  }
})

test_that("extended_uds has no duplicate country-years within the GW system", {
  # Regression test for #20: inconsistent identifier tuples in a source
  # dataset (LIED's GWn was overwritten with COW codes) created phantom
  # duplicate units in the extended UDS panel
  extended <- democracyData:::get_packaged_dataset("extended_uds")

  gw_duplicates <- extended |>
    filter(in_GW_system, !is.na(GWn)) |>
    filter(n() > 1, .by = c(GWn, year))

  expect_equal(
    nrow(gw_duplicates),
    0,
    info = paste(
      "Duplicate GW country-years in extended_uds:",
      paste(
        unique(gw_duplicates$extended_country_name),
        collapse = ", "
      )
    )
  )
})

test_that("declared measure columns exist and contain data", {
  registry <- registry_with_keys()
  known_keys <- registry$key

  for (dataset_name in registry_covered) {
    dataset <- democracyData:::get_packaged_dataset(dataset_name)

    # PMM extracts carry their measure in a pmm_-prefixed column, whose name
    # is recorded in the registry row of the source dataset (if any) or in a
    # dedicated *_pmm row.
    if (grepl("_pmm$", dataset_name)) {
      expect(
        any(grepl("^pmm_", names(dataset))),
        sprintf("`%s` has no pmm_-prefixed measure column", dataset_name)
      )
      next
    }

    registry_key <- registry_key_for_dataset(
      dataset_name,
      known_keys = known_keys
    )
    registry_rows <- registry |> filter(key == registry_key)

    if (nrow(registry_rows) == 0) {
      next # reported by the registry-coverage test
    }

    measure_columns <- unique(unlist(strsplit(
      registry_rows$main_democracy_measure_col,
      ",\\s*"
    )))
    present_columns <- intersect(measure_columns, names(dataset))

    expect(
      length(present_columns) > 0,
      sprintf(
        "`%s`: none of the declared measure columns (%s) are in the data",
        dataset_name,
        paste(measure_columns, collapse = ", ")
      )
    )

    if (length(present_columns) > 0) {
      all_na <- vapply(
        present_columns,
        function(column) all(is.na(dataset[[column]])),
        logical(1)
      )
      expect(
        !all(all_na),
        sprintf(
          "`%s`: all declared measure columns (%s) are entirely NA",
          dataset_name,
          paste(present_columns, collapse = ", ")
        )
      )
    }
  }
})
