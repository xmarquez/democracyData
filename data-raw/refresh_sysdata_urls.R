load("R/sysdata.rda")
url_list_new <- readr::read_csv("data-raw/url-list.csv", show_col_types = FALSE)
url_list <- url_list_new
usethis::use_data(data, url_list, overwrite = TRUE, internal = TRUE)
