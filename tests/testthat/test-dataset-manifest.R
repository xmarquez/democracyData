# Compares every packaged dataset against the recorded structure manifest
# (class, dimensions, column names and types, year range). This catches
# accidental corruption of packaged data without any network access. When
# packaged data changes legitimately, regenerate the fixture with
# data-raw/capture_dataset_manifest.R and review its git diff.

manifest_col_types <- readr::cols(
  dataset = readr::col_character(),
  class = readr::col_character(),
  n_row = readr::col_integer(),
  n_col = readr::col_integer(),
  min_year = readr::col_integer(),
  max_year = readr::col_integer(),
  columns = readr::col_character()
)

test_that("packaged datasets match the recorded structure manifest", {
  manifest_path <- test_path("fixtures", "dataset_manifest.csv")
  expect_true(file.exists(manifest_path))

  recorded <- readr::read_csv(manifest_path, col_types = manifest_col_types)
  current <- democracyData:::build_dataset_manifest()

  removed <- setdiff(recorded$dataset, current$dataset)
  expect_equal(
    removed,
    character(0),
    info = paste(
      "Datasets in the manifest but no longer packaged:",
      paste(removed, collapse = ", ")
    )
  )

  added <- setdiff(current$dataset, recorded$dataset)
  expect_equal(
    added,
    character(0),
    info = paste(
      "Packaged datasets missing from the manifest",
      "(rerun data-raw/capture_dataset_manifest.R):",
      paste(added, collapse = ", ")
    )
  )

  shared <- intersect(current$dataset, recorded$dataset)
  current_rows <- current[match(shared, current$dataset), ]
  recorded_rows <- recorded[match(shared, recorded$dataset), ]

  for (field in setdiff(names(recorded), "dataset")) {
    expect_equal(
      rlang::set_names(current_rows[[field]], shared),
      rlang::set_names(recorded_rows[[field]], shared),
      label = sprintf("packaged `%s`", field),
      expected.label = sprintf("recorded `%s`", field)
    )
  }
})
