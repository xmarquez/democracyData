# Targets for the internal country-year coder data stored in `R/sysdata.rda`

internal_country_data <- list(
  tar_target(
    missing_data,
    tibble(
      extended_country_name = c(
        "Brunswick",
        "Hamburg",
        "Nassau",
        "Oldenburg",
        "Palestine/Gaza",
        "Palestine/West Bank",
        "Saxe-Weimar-Eisenach",
        "Bukhara",
        "Cape Colony",
        "Hejaz",
        "Khiva",
        "Natal",
        "Newfoundland",
        "Saint Martin",
        "Sikkim",
        "Tanganyika",
        "Leeward Islands Federation",
        "West Indies Federation",
        "Kashmir",
        "Russian-occupied territories of Ukraine",
        "Vichy France"
      ),
      GW_membership = FALSE,
      cow_membership = FALSE,
      polity_membership = FALSE,
      extended_continent = c(
        "Europe",
        "Europe",
        "Europe",
        "Europe",
        "Asia",
        "Asia",
        "Europe",
        "Asia",
        "Africa",
        "Asia",
        "Asia",
        "Africa",
        "Americas",
        "Americas",
        "Asia",
        "Africa",
        "Americas",
        "Americas",
        "Asia",
        "Europe",
        "Europe"
      ),
      extended_region = c(
        "Western Europe",
        "Western Europe",
        "Western Europe",
        "Western Europe",
        "Western Asia",
        "Western Asia",
        "Western Europe",
        "Central Asia",
        "Southern Africa",
        "Western Asia",
        "Central Asia",
        "Southern Africa",
        "Northern America",
        "Caribbean",
        "South Asia",
        "Eastern Africa",
        "Caribbean",
        "Caribbean",
        "South Asia",
        "Eastern Europe",
        "Western Europe"
      ),
      lat = c(
        52.2659,
        53.5511,
        50.0878,
        53.1439,
        31.5017,
        31.9522,
        50.9794,
        39.7670,
        -33.9249,
        21.5000,
        41.3880,
        -29.8587,
        47.5615,
        18.0708,
        27.3389,
        -6.1630,
        17.05,
        10.65,
        34.0837,
        47.3333,
        46.13
      ),
      lon = c(
        10.5226,
        9.9937,
        8.2400,
        8.2147,
        34.4668,
        35.2332,
        11.3297,
        64.4220,
        18.4241,
        39.5000,
        60.3590,
        31.0218,
        -52.7126,
        -63.0501,
        88.6065,
        35.7516,
        -61.80,
        -61.50,
        74.7973,
        37.9833,
        3.43
      ),
      regex = c(
        "brunswick",
        "hamburg",
        "nassau",
        "oldenburg",
        "gaza",
        "west.?bank",
        "saxe.?weimar.?eisenach",
        "bukhara",
        "cape.?colony",
        "hejaz",
        "khiva",
        "natal",
        "newfoundland",
        "saint.?martin",
        "sikkim",
        "tanganyika",
        "leeward.?island(s)?.?f?",
        "west.?indies.?f",
        "^kashmir$",
        "^russian-occupied territories of ukraine$",
        "vichy.*france|france.*vichy"
      )
    )
  ),

  tar_file(
    country_regex_overrides_file,
    here::here("data-raw/country_regex_overrides.csv")
  ),

  tar_target(
    country_regex_overrides,
    read_csv(country_regex_overrides_file, show_col_types = FALSE) |>
      select(extended_country_name, regex)
  ),

  tar_target(
    data,
    bind_rows(democracyData:::data, missing_data) |>
      distinct() |>
      left_join(
        country_regex_overrides |>
          rename(regex_override = regex),
        by = "extended_country_name"
      ) |>
      mutate(regex = coalesce(regex_override, regex)) |>
      select(-regex_override) |>
      filter(
        extended_country_name != "^kashmir$",
        extended_country_name != "Piedmont-Sardinia"
      )
  ),

  tar_file(
    url_list_file,
    here::here("data-raw/url-list.csv")
  ),

  tar_target(
    url_list,
    read_csv(url_list_file)
  ),

  tar_target(
    save_data,
    usethis::use_data(data, url_list, overwrite = TRUE, internal = TRUE) |>
      c("R/sysdata.rda"),
    format = "file"
  )
)
