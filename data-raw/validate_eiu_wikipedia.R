suppressMessages(library(dplyr))
suppressMessages(library(readr))
suppressMessages(library(tidyr))
suppressMessages(library(stringr))

# Load existing eiu snapshot
devtools::load_all(quiet = TRUE)

scraped <- read_csv("data-raw/eiu_wikipedia_long.csv", show_col_types = FALSE)

cat("Scraped rows:", nrow(scraped), "\n")
cat("Existing eiu rows:", nrow(eiu), "\n\n")

# Standardise country names for comparison. Use country_year_coder on the scraped
# data to get extended_country_name + GWn, which matches the existing eiu layout.
scraped_std <- scraped |>
  mutate(
    # Wikipedia uses a few names that our coder doesn't recognise out of the box
    country = case_when(
      country == "Georgia (country)" ~ "Georgia",
      country == "Republic of Ireland" ~ "Ireland",
      country == "Saudi Arabia" ~ "Saudi",
      country == "The Gambia" ~ "Gambia",
      country == "Republic of the Congo" ~ "Congo (Brazzaville)",
      country ==
        "Democratic Republic of the Congo" ~ "Democratic Republic of Congo",
      country == "Ivory Coast" ~ "Cote d'Ivoire",
      country == "Cape Verde" ~ "Cabo Verde",
      country == "United States" ~ "United States of America",
      country == "Bosnia and Herzegovina" ~ "Bosnia and Hercegovina",
      country == "Kyrgyzstan" ~ "Kyrgyz Republic",
      TRUE ~ country
    )
  ) |>
  country_year_coder(
    country_col = country,
    date_col = year,
    verbose = FALSE,
    include_in_output = c("extended_country_name", "GWn", "cown")
  )

# Countries without a match
unmatched <- scraped_std |>
  filter(is.na(extended_country_name)) |>
  distinct(country)
cat("Unmatched scraped countries (should be empty):\n")
print(unmatched)

# Compare against existing eiu for years 2006-2024
compare <- scraped_std |>
  select(extended_country_name, year, eiu_scraped = eiu) |>
  filter(year <= 2024, !is.na(extended_country_name)) |>
  left_join(
    eiu |> select(extended_country_name, year, eiu_current = eiu),
    by = c("extended_country_name", "year")
  )

missing_in_current <- compare |> filter(is.na(eiu_current))
cat(
  "\nRows in Wikipedia scrape but not in current eiu:",
  nrow(missing_in_current),
  "\n"
)
if (nrow(missing_in_current) > 0) {
  print(missing_in_current |> count(extended_country_name, sort = TRUE))
}

mismatches <- compare |>
  filter(!is.na(eiu_current)) |>
  mutate(diff = abs(eiu_scraped - eiu_current)) |>
  filter(diff > 0.005)

cat("\nScore mismatches (|diff| > 0.005):", nrow(mismatches), "\n")
if (nrow(mismatches) > 0) {
  cat("Top 30 mismatches:\n")
  print(mismatches |> arrange(desc(diff)) |> head(30))

  cat("\nMismatch counts by year:\n")
  print(mismatches |> count(year))
}

cat(
  "\nScore mismatches (|diff| > 0.05):",
  sum(abs(compare$eiu_scraped - compare$eiu_current) > 0.05, na.rm = TRUE),
  "\n"
)

# Year 2025 preview
cat("\n2025 sample (first 10 rows):\n")
print(
  scraped_std |>
    filter(year == 2025) |>
    arrange(extended_country_name) |>
    head(10)
)
