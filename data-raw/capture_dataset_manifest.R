# Regenerate the dataset structure manifest used by
# tests/testthat/test-dataset-manifest.R.
#
# Run this after any pipeline run that legitimately changes packaged data,
# then review the git diff of the fixture before committing: the diff is a
# concise summary of what changed in the packaged data (new rows, new
# columns, extended year coverage) and doubles as raw material for NEWS.md.

devtools::load_all()

manifest <- build_dataset_manifest()

readr::write_csv(
  manifest,
  file.path("tests", "testthat", "fixtures", "dataset_manifest.csv")
)

message(sprintf(
  "[manifest] recorded structure of %d packaged datasets",
  nrow(manifest)
))
