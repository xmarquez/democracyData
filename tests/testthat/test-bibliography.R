extract_roxygen_citation_keys <- function() {
  r_files <- list.files(
    testthat::test_path("..", "..", "R"),
    pattern = "\\.R$",
    full.names = TRUE
  )

  matches <- lapply(r_files, function(r_file) {
    file_lines <- readLines(r_file, warn = FALSE, encoding = "UTF-8")
    match_matrix <- stringr::str_match_all(
      paste(file_lines, collapse = "\n"),
      'roxygen_cite\\("([^"]+)"\\)'
    )[[1]]

    match_matrix[, 2]
  })

  sort(unique(unlist(matches, use.names = FALSE)))
}

find_source_bibliography_file <- function() {
  candidates <- c(
    testthat::test_path("..", "..", "data-raw", "bibfile.bib"),
    file.path("data-raw", "bibfile.bib"),
    file.path("..", "..", "..", "data-raw", "bibfile.bib"),
    file.path("..", "..", "..", "..", "data-raw", "bibfile.bib")
  )

  existing_candidates <- candidates[file.exists(candidates)]

  if (length(existing_candidates) == 0L) {
    return(NULL)
  }

  normalizePath(existing_candidates[[1]], winslash = "/", mustWork = TRUE)
}

test_that("prepared bibliography parses cleanly", {
  input_file <- find_source_bibliography_file()
  output_file <- tempfile(fileext = ".bib")

  on.exit(unlink(output_file), add = TRUE)
  testthat::skip_if(
    is.null(input_file),
    "source bibliography file not available in installed check tree"
  )

  prepared_file <- democracyData:::prepare_bibliography_file(
    input_file = input_file,
    output_file = output_file
  )

  expect_no_warning(parsed_bibliography <- RefManageR::ReadBib(prepared_file))
  expect_gt(length(parsed_bibliography), 0)
})

test_that("prepared bibliography strips multiline note-like fields", {
  input_file <- tempfile(fileext = ".bib")
  output_file <- tempfile(fileext = ".bib")

  on.exit(unlink(c(input_file, output_file)), add = TRUE)

  writeLines(
    c(
      "@book{svolik2012,",
      "  title = {The Politics of Authoritarian Rule},",
      "  author = {Svolik, Milan},",
      "  date = {2012},",
      "  note = {Chapter 3 explains personal rule.",
      "  \\\\par",
      "  Chapter 5 explains military intervention.},",
      "  annote = {drop this too},",
      "  abstract = {drop the abstract too},",
      "  publisher = {Cambridge University Press}",
      "}"
    ),
    con = input_file,
    useBytes = TRUE
  )

  prepared_file <- democracyData:::prepare_bibliography_file(
    input_file = input_file,
    output_file = output_file
  )

  prepared_lines <- readLines(prepared_file, warn = FALSE, encoding = "UTF-8")

  expect_false(any(grepl(
    "^\\s*(note|annote|abstract)\\s*=",
    prepared_lines,
    ignore.case = TRUE
  )))
  expect_false(any(grepl(
    "Chapter 3 explains personal rule|drop this too|drop the abstract too",
    prepared_lines
  )))

  expect_no_warning(parsed_bibliography <- RefManageR::ReadBib(prepared_file))
  expect_gt(length(parsed_bibliography), 0)
})

test_that("all roxygen citations resolve to bibliography entries", {
  citation_keys <- extract_roxygen_citation_keys()

  unresolved_keys <- citation_keys[
    vapply(
      citation_keys,
      function(citation_key) {
        tryCatch(
          length(democracyData::bibliography[key = citation_key]) == 0L,
          error = function(...) TRUE
        )
      },
      logical(1)
    )
  ]

  expect_equal(
    length(unresolved_keys),
    0,
    info = paste(
      "Missing bibliography matches for:",
      paste(unresolved_keys, collapse = ", ")
    )
  )
})

test_that("cite_dataset resolves common dataset aliases", {
  dataset_aliases <- c(
    "aclp",
    "aclp_update",
    "arat_pmm",
    "bollen_pmm",
    "cgv",
    "cgv_update",
    "dd",
    "dd_update",
    "fh_electoral",
    "fh_full",
    "hadenius_pmm",
    "munck_pmm",
    "polityIV",
    "polity_annual",
    "svolik_regime",
    "vaporeg",
    "vaporeg_2024",
    "wgi_democracy",
    "wgi_legacy"
  )

  unresolved_aliases <- dataset_aliases[
    vapply(
      dataset_aliases,
      function(dataset_alias) {
        tryCatch(
          length(democracyData::cite_dataset(dataset_alias)) == 0L,
          error = function(...) TRUE
        )
      },
      logical(1)
    )
  ]

  expect_equal(
    length(unresolved_aliases),
    0,
    info = paste(
      "Aliases without bibliography matches:",
      paste(unresolved_aliases, collapse = ", ")
    )
  )
})
