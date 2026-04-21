trim_bibliography_entry <- function(entry_lines) {
  non_empty_lines <- which(nzchar(entry_lines))

  if (length(non_empty_lines) == 0L) {
    return(character())
  }

  entry_lines[seq.int(non_empty_lines[1], utils::tail(non_empty_lines, 1))]
}

find_bibliography_field_end <- function(entry_lines, start_index) {
  brace_balance <- 0L
  value_start <- trimws(sub("^[^=]*=\\s*", "", entry_lines[[start_index]]))
  field_delimiter <- substr(value_start, 1L, 1L)

  for (line_index in seq.int(start_index, length(entry_lines))) {
    entry_line <- entry_lines[[line_index]]

    if (line_index == start_index) {
      entry_line <- sub("^[^=]*=\\s*", "", entry_line)
    }

    brace_balance <- brace_balance +
      stringr::str_count(entry_line, stringr::fixed("{")) -
      stringr::str_count(entry_line, stringr::fixed("}"))

    if (
      (field_delimiter == "{" && brace_balance <= 0L) ||
        (field_delimiter == "\"" &&
          grepl('(?<!\\\\)"\\s*,?\\s*$', trimws(entry_line), perl = TRUE))
    ) {
      return(line_index)
    }
  }

  length(entry_lines)
}

drop_unneeded_bibliography_fields <- function(entry_lines) {
  drop_field_pattern <- paste(
    c(
      "abstract",
      "annotation",
      "annote",
      "file",
      "keywords",
      "language",
      "note",
      "shorttitle",
      "urldate"
    ),
    collapse = "|"
  )

  keep_lines <- rep(TRUE, length(entry_lines))
  i <- 1L

  while (i <= length(entry_lines)) {
    if (
      grepl(
        paste0("^\\s*(", drop_field_pattern, ")\\s*="),
        entry_lines[[i]],
        ignore.case = TRUE
      )
    ) {
      field_end <- find_bibliography_field_end(entry_lines, i)
      keep_lines[seq.int(i, field_end)] <- FALSE
      i <- field_end + 1L
      next
    }

    i <- i + 1L
  }

  entry_lines[keep_lines]
}

normalize_bibliography_field_names <- function(entry_lines) {
  has_year <- any(grepl("^\\s*year\\s*=", entry_lines, ignore.case = TRUE))

  if (!has_year) {
    date_index <- grep("^\\s*date\\s*=", entry_lines, ignore.case = TRUE)

    if (length(date_index) > 0L) {
      date_line <- entry_lines[date_index[1]]
      indentation <- sub("^(\\s*).*$", "\\1", date_line)
      year_value <- sub(
        "^\\s*date\\s*=\\s*\\{?([0-9]{4}).*$",
        "\\1",
        date_line,
        perl = TRUE
      )

      if (grepl("^[0-9]{4}$", year_value)) {
        entry_lines[date_index[1]] <- paste0(
          indentation,
          "year = {",
          year_value,
          "},"
        )
      } else {
        entry_lines[date_index[1]] <- sub(
          "^(\\s*)date(\\s*=)",
          "\\1year\\2",
          date_line,
          ignore.case = TRUE,
          perl = TRUE
        )
      }
    }
  }

  has_journal <- any(grepl(
    "^\\s*journal\\s*=",
    entry_lines,
    ignore.case = TRUE
  ))

  if (!has_journal) {
    journaltitle_index <- grep(
      "^\\s*journaltitle\\s*=",
      entry_lines,
      ignore.case = TRUE
    )

    if (length(journaltitle_index) > 0L) {
      entry_lines[journaltitle_index] <- sub(
        "^(\\s*)journaltitle(\\s*=)",
        "\\1journal\\2",
        entry_lines[journaltitle_index],
        ignore.case = TRUE,
        perl = TRUE
      )
    }
  }

  entry_lines
}

normalize_bibliography_author_fields <- function(entry_lines) {
  gsub(
    "family=([^,}]+), given=([^,}]+), prefix=([^,}]+), useprefix=(?:true|false)",
    "\\3 \\1, \\2",
    entry_lines,
    perl = TRUE
  )
}

normalize_bibliography_markup <- function(entry_lines) {
  entry_lines <- gsub("\\\\par\\s*", " ", entry_lines, perl = TRUE)
  entry_lines <- gsub("\\\\textbraceleft\\s*", "", entry_lines, perl = TRUE)
  entry_lines <- gsub("\\\\textbraceright\\s*", "", entry_lines, perl = TRUE)

  if (any(grepl("^\\s*url\\s*=", entry_lines))) {
    entry_lines <- vapply(
      entry_lines,
      function(entry_line) {
        if (grepl("^\\s*url\\s*=", entry_line)) {
          paste(strsplit(entry_line, "%", fixed = TRUE)[[1]], collapse = "\\%")
        } else {
          entry_line
        }
      },
      character(1)
    )
  }

  entry_lines
}

normalize_bibliography_urls <- function(entry_lines) {
  old_urls <- c(
    paste0("https://www.eiu.com/", "topic/democracy-index"),
    paste0(
      "http://kellogg.nd.edu/",
      "scottmainwaring/Political_Regimes.pdf"
    ),
    paste0("http://github.com/", "xmarquez/democracyData"),
    paste0(
      "https://oneearthfuture.org/en/one-earth-future/",
      "reign-dataset-international-elections-and-leaders"
    ),
    paste0("http://urn.fi/", "urn:nbn:fi:fsd:T-FSD1289"),
    paste0(
      "https://www.v-dem.net/media/filer_public/25/cb/",
      "25cb3f3f-290d-46e1-8eaf-ff2d2c13f4a9/v-dem_working_paper_21.pdf"
    ),
    paste0("https://www.v-dem.net/en/", "data/data/v-dem-dataset/")
  )

  url_replacements <- stats::setNames(
    c(
      "https://www.eiu.com/n/global-themes/democracy-index/",
      "https://web.archive.org/web/20120119050029/http://kellogg.nd.edu/scottmainwaring/Political_Regimes.pdf",
      "https://github.com/xmarquez/democracyData",
      "https://oefdatascience.github.io/REIGN.github.io/",
      "https://urn.fi/urn:nbn:fi:fsd:T-FSD1289",
      "https://www.v-dem.net/media/publications/Working_Paper_21.pdf",
      "https://www.v-dem.net/data/the-v-dem-dataset/"
    ),
    old_urls
  )

  for (old_url in names(url_replacements)) {
    entry_lines <- gsub(
      old_url,
      url_replacements[[old_url]],
      entry_lines,
      fixed = TRUE
    )
  }

  entry_lines <- gsub(
    paste0(
      "https://web.archive.org/web/20120119050029/",
      "https://web.archive.org/web/20120119050029/",
      "http://kellogg.nd.edu/scottmainwaring/Political_Regimes.pdf"
    ),
    "https://web.archive.org/web/20120119050029/http://kellogg.nd.edu/scottmainwaring/Political_Regimes.pdf",
    entry_lines,
    fixed = TRUE
  )

  entry_lines
}

normalize_bibliography_identifiers <- function(entry_lines) {
  unresolved_vdem_doi <- grep(
    "^\\s*doi\\s*=\\s*\\{10\\.23696/vdemds26\\}\\s*,?\\s*$",
    entry_lines,
    ignore.case = TRUE
  )

  if (length(unresolved_vdem_doi) > 0L) {
    entry_lines <- entry_lines[-unresolved_vdem_doi]

    if (!any(grepl("^\\s*url\\s*=", entry_lines, ignore.case = TRUE))) {
      last_field_index <- max(grep("^\\s*[A-Za-z]", entry_lines))
      entry_lines[last_field_index] <- sub(
        ",?\\s*$",
        ",",
        entry_lines[last_field_index]
      )

      entry_lines <- append(
        entry_lines,
        "  url = {https://www.v-dem.net/data/the-v-dem-dataset/},",
        after = length(entry_lines) - 1L
      )
    }
  }

  entry_lines
}

normalize_bibliography_entry <- function(entry_lines) {
  entry_lines <- trim_bibliography_entry(entry_lines)

  if (length(entry_lines) == 0L) {
    return(character())
  }

  opening_line <- entry_lines[1]

  if (grepl("^@(dataset|software)\\{", opening_line, ignore.case = TRUE)) {
    entry_lines[1] <- sub(
      "^@(dataset|software)\\{",
      "@misc{",
      opening_line,
      ignore.case = TRUE,
      perl = TRUE
    )
  }

  if (
    grepl("^@report\\{", entry_lines[1], ignore.case = TRUE) &&
      !any(grepl("^\\s*type\\s*=", entry_lines))
  ) {
    entry_lines <- append(entry_lines, "  type = {Report},", after = 1)
  }

  entry_lines |>
    drop_unneeded_bibliography_fields() |>
    normalize_bibliography_field_names() |>
    normalize_bibliography_author_fields() |>
    normalize_bibliography_markup() |>
    normalize_bibliography_urls() |>
    normalize_bibliography_identifiers()
}

prepare_bibliography_file <- function(
  input_file,
  output_file = file.path("_targets", "files", "bibliography_prepped.bib")
) {
  bibliography_lines <- readLines(
    input_file,
    warn = FALSE,
    encoding = "UTF-8"
  ) |>
    enc2utf8()

  entry_starts <- grep("^@", bibliography_lines)

  if (length(entry_starts) == 0L) {
    stop("No BibTeX entries found in bibliography file.")
  }

  entry_ends <- c(entry_starts[-1] - 1L, length(bibliography_lines))
  header_lines <- bibliography_lines[seq_len(entry_starts[1] - 1L)]

  normalized_entries <- Map(
    f = function(entry_start, entry_end) {
      normalize_bibliography_entry(
        bibliography_lines[seq.int(entry_start, entry_end)]
      )
    },
    entry_start = entry_starts,
    entry_end = entry_ends
  )

  dir.create(dirname(output_file), recursive = TRUE, showWarnings = FALSE)

  writeLines(
    c(
      header_lines,
      unlist(
        Map(
          f = function(entry_lines) c(entry_lines, ""),
          entry_lines = normalized_entries
        ),
        use.names = FALSE
      )
    ),
    con = output_file,
    useBytes = TRUE
  )

  output_file
}
