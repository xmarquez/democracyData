library(rvest)
library(dplyr)
library(tidyr)
library(stringr)
library(readr)
library(purrr)

url <- "https://en.wikipedia.org/wiki/The_Economist_Democracy_Index"

page <- read_html(url)
tables <- page |> html_elements("table.wikitable")

# Table 4 is the per-country panel. rvest's html_table misaligns rowspan cells,
# so we walk <tr> elements ourselves.
tr_list <- tables[[4]] |> html_elements("tr")

score_years <- c(
  2025,
  2024,
  2023,
  2022,
  2021,
  2020,
  2019,
  2018,
  2017,
  2016,
  2015,
  2014,
  2013,
  2012,
  2011,
  2010,
  2008,
  2006
)

# Drop the first header row; iterate over the rest in pairs (data row + arrow row).
parse_score <- function(x) {
  # Strip footnote markers like "[a]"
  x <- str_replace_all(x, "\\[[^]]*\\]", "")
  x <- str_trim(x)
  # Ranges like "2.46–2.54": take the midpoint
  if (str_detect(x, "^\\d+\\.\\d+\\s*[\u2013\u2014-]\\s*\\d+\\.\\d+$")) {
    nums <- as.numeric(str_extract_all(x, "\\d+\\.\\d+")[[1]])
    return(mean(nums))
  }
  if (str_detect(x, "^\\d+\\.\\d+$")) {
    return(as.numeric(x))
  }
  NA_real_
}

parse_row <- function(tr) {
  cells <- tr |> html_elements("td, th")
  if (length(cells) == 0L) {
    return(NULL)
  }

  texts <- cells |> html_text2() |> str_trim()

  # Take the last 18 cells as scores (matches score_years length)
  if (length(texts) < length(score_years)) {
    return(NULL)
  }
  score_texts <- tail(texts, length(score_years))
  scores <- vapply(score_texts, parse_score, numeric(1), USE.NAMES = FALSE)
  if (any(is.na(scores))) {
    return(NULL)
  }

  # Country name: the <a title="..."> link tends to be present in the data row.
  title <- tr |> html_elements("a[title]") |> html_attr("title")
  country <- title[nchar(title) > 0 & !title %in% c("Politics of")] |>
    head(1)
  if (length(country) == 0L) {
    country <- NA_character_
  }

  tibble(country = country, year = score_years, eiu = scores)
}

rows <- tr_list |> map(parse_row) |> compact() |> bind_rows()

cat("Rows scraped:", nrow(rows), "\n")
cat("Distinct countries:", n_distinct(rows$country), "\n")
cat("Year range:", min(rows$year), "to", max(rows$year), "\n")
cat("\nSample countries:\n")
print(rows |> distinct(country) |> slice_head(n = 10))

cat("\nPer-year row counts:\n")
print(rows |> count(year) |> arrange(year))

write_csv(rows, "data-raw/eiu_wikipedia_long.csv")
cat("\nWrote data-raw/eiu_wikipedia_long.csv\n")
