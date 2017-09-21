#'Download and process various democracy datasets.
#'
#'Download and process various democracy datasets. Note that the datasets
#'returned by the \code{redownload_*} family of functions (\link{blm},
#'\link{bmr}, \link{bnr}, \link{gwf_autocratic}, \link{gwf_autocratic_extended},
#'\link{gwf_all}, \link{gwf_all_extended}, \link{LIED}, \link{magaloni},
#'\link{pacl}, \link{PIPE}, \link{peps}, \link{polyarchy},
#'\link{polyarchy_dimensions}, \link{uds_2014}, \link{uds_2010},
#'\link{uds_2011}, \link{ulfelder}, \link{utip}, \link{wahman_teorell_hadenius})
#'are all available directly from this package and are unlikely to have changed
#'since the package was installed. Access the respective dataset by typing its
#'name, and refer to their documentation for details. You will not normally need
#'to redownload them, unless you want to process the raw data yourself (set
#'\code{return_raw = TRUE}) or suspect they have changed since the package was
#'installed.
#'
#'@param url The URL of the dataset. This defaults to:
#'
#'  \itemize{
#'
#'  \item For \link{blm}: \code{http://www.blmdemocracy.gatech.edu/blm final data.xls}
#'
#'  \item For \link{bmr}:
#'  \url{https://sites.google.com/site/mkmtwo/democracy-v2.0.dta?attredirects=0}
#'
#'  \item For \link{bnr}:
#'  \url{http://users.clas.ufl.edu/bernhard/content/data/meister1305.dta}
#'
#'  \item For \link{gwf_all} and \link{gwf_autocratic}:
#'  \url{http://sites.psu.edu/dictators/wp-content/uploads/sites/12570/2016/05/GWF-Autocratic-Regimes-1.2.zip}
#'
#'
#'
#'
#'  \item For \link{LIED}:
#'  \url{https://dataverse.harvard.edu/api/access/datafile/2863101}
#'
#'  \item For \link{pacl}:
#'  \url{https://uofi.box.com/shared/static/bba3968d7c3397c024ec.dta}
#'
#'  \item For \link{peps}:
#'  \url{http://www.lehigh.edu/~bm05/democracy/PEPS1pub.dta}
#'
#'  \item For \link{utip}: \code{http://utip.lbj.utexas.edu/data/political regime data set RV.xls}
#'
#'  \item For \link{wahman_teorell_hadenius}:
#'  \url{https://sites.google.com/site/authoritarianregimedataset/data/ARD_V6.dta?attredirects=0&d=1}
#'
#'
#'
#'
#'  \item For \link{polyarchy}:
#'  \url{https://www3.nd.edu/~mcoppedg/crd/poly8500.sav}
#'
#'  \item For \link{polyarchy_dimensions}:
#'  \url{http://www3.nd.edu/~mcoppedg/crd/DahlDims.sav}
#'
#'  \item For \link{magaloni}:
#'  \url{http://cddrl.fsi.stanford.edu/sites/default/files/res/Data_Set.xls}
#'
#'  \item For UDS: for the 2014 release, it defaults to
#'  \url{http://www.unified-democracy-scores.org/files/20140312/z/uds_summary.csv.gz};
#'   for the the 2011 release, to
#'  \url{http://www.unified-democracy-scores.org/files/20110104/uds_summary.csv.gz};
#'   and for the 2010 release, to
#'  \url{http://www.unified-democracy-scores.org/files/20100726/uds_summary.csv.gz}
#'
#'
#'
#'
#'  \item For \link{ulfelder}:
#'  \url{https://dataverse.harvard.edu/api/access/datafile/2420018}
#'
#'  \item For \link{PIPE}:
#'  \url{https://sites.google.com/a/nyu.edu/adam-przeworski/home/data} }
#'
#'@param verbose Whether to print a running commentary of what the function is
#'  doing while processing the data.
#'@param return_raw Whether to return the raw data, without any processing.
#'  Default is \code{FALSE}.
#'@param extend (Only for \link{redownload_bnr}, \link{redownload_gwf},
#'  \link{redownload_magaloni}, and \link{redownload_ulfelder}). Whether to
#'  extend the dataset back in time using a full panel of independent countries
#'  (for the \link{redownload_bnr} case) or the appropriate duration variable
#'  (\code{gwf_duration}, \code{duration_nr}, or \code{rgjdura} and
#'  \code{rgjdurd}, respectively, for \link{redownload_gwf},
#'  \link{redownload_magaloni}, and \link{redownload_ulfelder}). For example,
#'  the United States enters the GWF dataset in 1946, where \code{gwf_duration}
#'  is already 75; one can extend the dataset to indicate that the country was
#'  classified as a democracy from 1872. Default is \code{FALSE}.
#'@param ... Other parameters passed to \link{country_year_coder}.
#'
#'@import dplyr
#'
#'@export
#'
#'@return A \link{tibble} with the processed dataset, unless \code{return_raw}
#'  is \code{TRUE}, in which case the function returns the raw data without
#'  processing.
#'
#'@source Bowman, Kirk, Fabrice Lehoucq, and James Mahoney. 2005. Measuring
#'  Political Democracy: Case Expertise, Data Adequacy, and Central America.
#'  Comparative Political Studies 38 (8): 939-970.
#'  \url{http://cps.sagepub.com/content/38/8/939}. Data available at
#'  \url{http://www.blmdemocracy.gatech.edu/}.
#'
#' @examples
#' \dontrun{
#' redownload_blm()
#' }
redownload_blm <- function(url,
                           verbose = TRUE,
                           return_raw = FALSE,
                           ...) {
  country <- blm <-  `costa rica` <- Nicaragua <- year <- NULL

  if(missing(url)) {
    url <-  "http://www.blmdemocracy.gatech.edu/blm%20final%20data.xls"
  }


  data <- read_data(url,
                    verbose = verbose,
                    name = "blm")

  if(return_raw) {
    if(verbose) {
      message("Returning raw data, without processing.")
    }
    return(data)
  }

  if(verbose) {
    message(sprintf("Original dataset has %d rows, but is not in country-year format.",
                    nrow(data)))
    message("Processing the BLM data - converting to country-year format and adding state system info...")
  }

  names(data)[1] <- "year"

  blm <- data %>%
    tidyr::gather(country, blm, `costa rica`:Nicaragua)  %>%
    mutate(country = plyr::mapvalues(country, "costa rica", "Costa Rica")) %>%
    country_year_coder(country,
                       year,
                       match_type = "country",
                       verbose = verbose,
                       ...)

  if(verbose) {
    message("costa rica changed to Costa Rica in country column...")
    message(sprintf("Resulting dataset after processing has %d rows.",
                    nrow(blm)))
    if(nrow(data) != nrow(blm)) {
      message("Note: the number of rows in the processed BLM data is different from the number of rows in the original data.")
      if(5*nrow(data) != nrow(blm)) {
        warning(sprintf("There should be %d rows in the final processed data. Something went wrong.",
                        5*nrow(data)))
      } else {
        message(sprintf("Nevertheless processing resulted in the correct final number of rows (%d)", 5*nrow(data)))
      }
    }
  }

  standardize_columns(blm, country, verbose = verbose)

}


#' @rdname redownload_blm
#' @source Boix, Carles, Michael Miller, and Sebastian Rosato. 2012. A Complete
#'   Data Set of Political Regimes, 1800-2007. Comparative Political Studies 46
#'   (12): 1523-1554. Available at \url{https://sites.google.com/site/mkmtwo/data}
#' @export
#' @examples
#' \dontrun{
#' bmr <- redownload_bmr()
#' bmr
#' }
redownload_bmr <- function(url,
                           verbose = TRUE,
                           return_raw = FALSE,
                           ...) {
  ccode <- country <- year <- NULL

  if(missing(url)) {
    url <-  "https://sites.google.com/site/mkmtwo/democracy-v2.0.dta?attredirects=0"
  }


  data <- read_data(url,
                    verbose = verbose,
                    name = "BMR",
                    file_extension = "dta") %>%
    haven::as_factor()

  if(return_raw) {
    if(verbose) {
      message("Returning raw data, without processing.")
    }
    return(data)
  }

  if(verbose) {
    message(sprintf("Original dataset has %d rows.",
                    nrow(data)))
    message("Processing the BMR data - adding state system info...")
  }

  bmr <- country_year_coder(data, country, year,
                            code_col = ccode,
                            code_type = "polity_ccode",
                            match_type = "country",
                            verbose = verbose,
                            ...)

  if(verbose) {
    message(sprintf("Resulting dataset after processing has %d rows.",
                    nrow(bmr)))
    if(nrow(data) != nrow(bmr)) {
      message("Note: the number of rows in the processed BLM data is different from the number of rows in the original data.")
      if(nrow(data) != nrow(bmr)) {
        warning(sprintf("There should be %d rows in the final processed data. Something went wrong.",
                        nrow(data)))
      }
    }
  }

  standardize_columns(bmr, country, ccode, verbose = verbose)
}


#' @rdname redownload_blm
#' @export
#' @source Michael Bernhard, Timothy Nordstrom, and Christopher Reenock,
#'   "Economic Performance, Institutional Intermediation and Democratic
#'   Breakdown," Journal of Politics 63:3 (2001), pp. 775-803. Data and coding
#'   description available at
#'   \url{http://users.clas.ufl.edu/bernhard/content/data/data.htm}
#'
#' @examples
#' \dontrun{
#' redownload_bnr()
#' redownload_bnr(full_panel = FALSE)}
redownload_bnr <- function(url,
                           verbose = TRUE,
                           extend = FALSE,
                           return_raw = FALSE,
                           ...) {

  country <- year <- cowcode <- country.name.en <- cown <- event <- cow_country_name <- NULL

  if(missing(url)) {
    url <- "http://users.clas.ufl.edu/bernhard/content/data/meister1305.dta"
  }



  data <- read_data(url,
                    verbose = verbose,
                    name = "BNR")

  if(return_raw) {
    if(verbose) {
      message("Returning raw data, without processing.")
    }
    return(data)
  }

  if(verbose) {
    message(sprintf("Original dataset has %d rows.",
                    nrow(data)))
    message("Processing the BNR data - fixing cowcode for Germany, adding state system info...")
  }

  data <- data %>%
    mutate(cowcode = ifelse(cowcode == 255 & year > 1945 & year < 1990, 260, cowcode))

  bnr <- data %>%
    mutate(country = plyr::mapvalues(country,
                                     from = c("netherland","phillipines"),
                                     to = c("Netherlands","Philippines"))) %>%
    country_year_coder(country,
                       year,
                       cowcode,
                       code_type = "cown",
                       verbose = verbose,
                       match_type = "country",
                       ...)

  if(verbose) {
    message("netherland and phillipines changed to Netherlands and Philippines in country column...")
    message(sprintf("Resulting dataset after processing has %d rows.",
                    nrow(bnr)))
    if(nrow(data) != nrow(bnr)) {
      message("Note: the number of rows in the processed BLM data is different from the number of rows in the original data.")
      if(nrow(data) != nrow(bnr)) {
        warning(sprintf("There should be %d rows in the final processed data. Something went wrong.",
                        nrow(data)))
      }
    }
  }

  if(extend) {
    if(verbose) {
      message("Creating full panel...")
      message("Creating bnr column from event column...")
    }
    COW_system <- create_panel() %>%
      filter(year >= 1913, year <= 2005) %>%
      select(cow_country_name, cown, year) %>%
      rename(country = cow_country_name,
             cowcode = cown) %>%
      mutate(cowcode = as.numeric(cowcode))

    bnr <- left_join(COW_system,
                     bnr %>%
                       select(cowcode, year, event)) %>%
      mutate(bnr = plyr::mapvalues(event,
                                   from = c(0,1,NA),
                                   to = c(1,0,0))) %>%
      arrange(cowcode, year) %>%
      country_year_coder(country_col = country,
                         date_col = year,
                         code_col = cowcode,
                         code_type = "cown",
                         match_type = "country",
                         verbose = verbose,
                         ...)

    message(sprintf("The resulting extended dataset has %d rows.", nrow(bnr)))


  }

  standardize_columns(bnr, country, cowcode, verbose = verbose)

}

#' @rdname redownload_blm
#' @param dataset (Only for \link{redownload_gwf}). The dataset to output. Geddes, Wright, and Frantz provide
#'   two country-year files, one with autocratic regimes only ("autocratic only"), and one with both
#'   democratic and non-democratic regimes ("all"). Default is "all".
#'
#' @export
#' @source Barbara Geddes, Joseph Wright, and Erica Frantz.
#' 2014. "Autocratic Breakdown and Regime Transitions: A New Data Set."
#' Perspectives on Politics 12(2): 313-331. The full data and codebook can be
#' downloaded here \url{http://sites.psu.edu/dictators/}.
#'
#' @examples
#' \dontrun{
#' gwf <- redownload_gwf()
#' gwf
#' }
redownload_gwf <- function(url,
                           verbose = TRUE,
                           extend = FALSE,
                           dataset = c("all", "autocratic only"),
                           return_raw = FALSE,
                           ...) {

  gwf_casename <- gwf_duration <- min_year <- max_year <- gwf_spell <- NULL
  gwf_disagree <- gwf_country <- year <- cowcode <- gwf_monarch <- NULL

  dataset <- match.arg(dataset)

  if(missing(url)) {
    url <-  "http://sites.psu.edu/dictators/wp-content/uploads/sites/12570/2016/05/GWF-Autocratic-Regimes-1.2.zip"
  }



  if(dataset == "autocratic only") {
    name <- "GWFtscs.dta"
  } else {
    name <- "GWF_AllPoliticalRegimes.dta"
  }

  data <- read_data(url,
                    verbose = verbose,
                    name = name)

  if(return_raw) {
    if(verbose) {
      message("Returning raw data, without processing.")
    }
    return(data)
  }

  if(verbose) {
    message(sprintf("Original dataset has %d rows",
                    nrow(data)))
    message("Processing the Autocratic Regimes dataset - adding state system info, fixing NA values...")
  }

  if(extend) {
    if(verbose) {
      message("Extending the dataset...")
    }
    gwf_panel <- data %>%
      select(gwf_casename, gwf_country, cowcode, year, gwf_spell, gwf_duration) %>%
      group_by(gwf_casename) %>%
      mutate(min_year = ifelse(gwf_duration != 1, min(year) - min(gwf_duration) + 1, min(year)),
             max_year = max(year)) %>%
      select(-year, -gwf_duration) %>%
      group_by_all() %>%
      summarise(year = list(as.numeric(min(min_year):max(max_year)))) %>%
      tidyr::unnest() %>%
      distinct() %>%
      ungroup() %>%
      select(-min_year, -max_year)

    if(dataset != "all") {
      gwf <- gwf_panel %>%
        left_join(data) %>%
        group_by(gwf_casename, gwf_country, cowcode, gwf_spell) %>%
        arrange(gwf_casename, year) %>%
        tidyr::fill(gwf_country:gwf_monarch, .direction = "up") %>%
        mutate(gwf_duration = as.numeric(seq_along(year))) %>%
        ungroup() %>%
        arrange(gwf_country, year)
    } else {
      gwf <- gwf_panel %>%
        left_join(data) %>%
        group_by(gwf_casename, gwf_country, cowcode, gwf_spell) %>%
        arrange(gwf_casename, year) %>%
        tidyr::fill(gwf_country:gwf_disagree, .direction = "up") %>%
        mutate(gwf_duration = as.numeric(seq_along(year))) %>%
        ungroup() %>%
        arrange(gwf_country, year)
    }



  } else {
    gwf <- data
  }

  gwf <- gwf %>%
    country_year_coder(gwf_country,
                       year,
                       # code_col = cowcode,
                       # code_type = "cown",
                       match_type = "country",
                       verbose = verbose,
                       ...) %>%
    mutate_if(is.character,
              ~ifelse(. %in% c("NA",""),
                      as.character(NA), .))


  if(verbose) {
    message(sprintf("Resulting dataset after processing has %d rows.",
                    nrow(gwf)))
    if(nrow(data) != nrow(gwf)) {
      message("Note: the number of rows in the processed Autocratic Regimes Dataset is different from the number of rows in the original data.")
    }
  }


  standardize_columns(gwf, gwf_country, cowcode, verbose = verbose)

}

#' @rdname redownload_blm
#'
#' @source Skaaning, Svend-Erik; John
#' Gerring; and Henrikas Bartusevicius (2015). "A Lexical Index of Electoral
#' Democracy." Comparative Political Studies, Vol. 48, No. 12, pp. 1491-1525.
#' Original data and variable descriptions available at
#' \url{https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/29106}
#'
#' @export
#' @examples
#' \dontrun{
#' redownload_lied()}
redownload_lied <- function(url,
                            verbose = TRUE,
                            return_raw = FALSE,
                            ...) {

  `executive elections` <- `legislative elections` <- `multi-party_legislative_elections` <- NULL
  competitive_elections <- countryn <- year <- cow <- NULL

  if(missing(url)) {
    url <- "https://dataverse.harvard.edu/api/access/datafile/2863101"
  }


  data <- read_data(url,
                    verbose = verbose,
                    name = "LIED",
                    file_extension = "xls")

  if(return_raw) {
    if(verbose) {
      message("Returning raw data, without processing.")
    }
    return(data)
  }

  if(verbose) {
    message("Changing column names, adding state system information")
  }

  lied <- data %>%
    rename(exselec = `executive elections`,
           legselec = `legislative elections`,
           opposition = `multi-party_legislative_elections`,
           competition = competitive_elections) %>%
    country_year_coder(countryn,
                       year, code_col = cow,
                       code_type = "cown",
                       match_type = "country",
                       verbose = verbose,
                       ...)

  if(verbose) {
    message("Column `executive elections` has been renamed exselec")
    message("Column `legislative elections` has been renamed legselec")
    message("Column `multi-party_legislative_elections` has been renamed opposition")
    message("Column `competitive_elections` has been renamed competition")
    message(sprintf("Resulting dataset after processing has %d rows.",
                    nrow(lied)))
    if(nrow(data) != nrow(lied)) {
      message("Note: the number of rows in the processed LIED data is different from the number of rows in the original data.")
    }
  }


  standardize_columns(lied, countryn, cow, verbose = verbose)

}

#' @rdname redownload_blm
#'
#' @source Cheibub, Jose Antonio, Jennifer Gandhi, and James
#' Raymond Vreeland. 2010. "Democracy and Dictatorship Revisited." Public
#' Choice, vol. 143, no. 2-1, pp. 67-101. DOI: 10.1007/s11127-009-9491-2. The
#' full data and codebook can be downloaded here
#' \url{https://sites.google.com/site/joseantoniocheibub/datasets/democracy-and-dictatorship-revisited}
#'
#' @export
#' @examples
#' \dontrun{
#' redownload_pacl()}
redownload_pacl <- function(url,
                            verbose = TRUE,
                            return_raw = FALSE,
                            ...) {

  ctryname <- year <- cowcode <- NULL

  if(missing(url)) {
    url <- "https://uofi.box.com/shared/static/bba3968d7c3397c024ec.dta"
  }


  data <- read_data(url,
                    verbose = verbose,
                    name = "PACL/ACLP")


  if(return_raw) {
    if(verbose) {
      message("Returning raw data, without processing.")
    }
    return(data)
  }

  if(verbose) {
    message(sprintf("Original dataset has %d rows",
                    nrow(data)))
    message("Processing the PACL/ACLP data - adding state system info...")
  }

  pacl <- data %>%
    country_year_coder(ctryname,
                       year,
                       code_col = cowcode,
                       code_type = "cown",
                       match_type = "country",
                       verbose = verbose,
                       ...)

  if(verbose) {
    message(sprintf("Resulting dataset after processing has %d rows.",
                    nrow(pacl)))
    if(nrow(data) != nrow(pacl)) {
      message("Note: the number of rows in the processed PACL data is different from the number of rows in the original data.")
    }
  }

  standardize_columns(pacl, ctryname, cowcode, verbose = verbose)

}


#' @rdname redownload_blm
#'
#' @source Bruce E. Moon, Jennifer Harvey Birdsall, Sylvia Ceisluk, Lauren M. Garlett,
#' Joshua J. Hermias, Elizabeth Mendenhall, Patrick D. Schmid, and Wai Hong Wong
#' (2006) "Voting Counts: Participation in the Measurement of Democracy" Studies
#' in Comparative International Development 42, 2 (Summer, 2006). The complete
#' dataset is available here:
#' \url{http://www.lehigh.edu/~bm05/democracy/Obtain_data.htm}.
#'
#' @export
#' @examples
#' \dontrun{
#' redownload_peps()}
redownload_peps <- function(url,
                          verbose = TRUE,
                          return_raw = FALSE,
                          ...) {

  Iname <- Pname <- FHname <- country <- year <- ccode <- NULL

  if(missing(url)) {
    url <- "http://www.lehigh.edu/~bm05/democracy/PEPS1pub.dta"
  }


  data <- read_data(url,
                    verbose = verbose,
                    name = "PEPS")


  if(return_raw) {
    if(verbose) {
      message("Returning raw data, without processing.")
    }
    return(data)
  }

  if(verbose) {
    message(sprintf("Original dataset has %d rows",
                    nrow(data)))
    message("Processing the PEPS data - fixing country names, adding state system info...")
    message("New country column combines country names from Pname, Iname, and FHname to fill in blanks...")
  }

  peps <- data %>%
    mutate(country = ifelse(Pname == "", Iname, Pname),
           country = ifelse(country == "", FHname, country),
           country = plyr::mapvalues(country, c("Cameron", "N. Korea"),
                                     c("Cameroon", "North Korea"))) %>%
    filter(Pname != "") %>%
    country_year_coder(country,
                       year,
                       code_col = ccode,
                       code_type = "polity_ccode",
                       match_type = "country",
                       verbose = verbose,
                       ...)

  if(verbose) {
    message(sprintf("Resulting dataset after processing has %d rows.",
                    nrow(peps)))
    if(nrow(data) != nrow(peps)) {
      message("Note: the number of rows in the processed PEPS data is different from the number of rows in the original data.")
      message("This is due to the exclusion of rows where Pname is blank and no data is available in other columns.")
      message("Dropping Pname, Iname, and FHname columns...")
    }
  }

  standardize_columns(peps, country, ccode, verbose = verbose) %>%
    select(-Pname, -Iname, -FHname)

}

#' @rdname redownload_blm
#'
#' @source The University of Texas Inequality Project Categorical Dataset of Political
#' Regimes. Described in Sara Hsu, "The Effect of Political Regimes on
#' Inequality, 1963-2002," UTIP Working Paper No. 53 (2008),
#' \url{http://utip.gov.utexas.edu/papers/utip_53.pdf}. Data available for
#' download at
#' \url{http://utip.gov.utexas.edu/data/}
#'
#' @export
#' @examples
#' \dontrun{
#' redownload_utip()}
redownload_utip <- function(url,
                          verbose = TRUE,
                          return_raw = FALSE,
                          ...) {

  DI <- MD <- W <- OD <- C <- IR <- SD <- EC <- CO <- NULL
  conservative_democracy <- social_democracy <- one_party_democracy <- NULL

  if(missing(url)) {
    url <- "http://utip.lbj.utexas.edu/data/political%20regime%20data%20set%20RV.xls"
  }

  cname <- year <- DI <- NULL


  data <- read_data(url,
                    name = "UTIP",
                    verbose = verbose)

  if(return_raw) {
    if(verbose) {
      message("Returning raw data, without processing.")
    }
    return(data)
  }

  utip <- data %>%
    country_year_coder(cname,
                       year,
                       match_type = "country",
                       verbose = verbose,
                       ...) %>%
    filter(!is.na(DI)) %>%
    rename(other_dictatorship = DI,
           military_dictatorship = MD,
           civil_war = W,
           one_party_democracy = OD,
           communist = C,
           islamic_republic = IR,
           social_democracy = SD,
           european_colony = EC,
           conservative_democracy = CO) %>%
    mutate(utip_dichotomous = as.numeric(one_party_democracy == 1 | social_democracy == 1 | conservative_democracy == 1),
           utip_dichotomous_strict =  as.numeric(social_democracy == 1 | conservative_democracy == 1),
           utip_trichotomous = ifelse(social_democracy == 1 | conservative_democracy == 1, 2,
                                      ifelse(one_party_democracy == 1, 1, 0)))

  if(verbose) {
    message("Column DI has been renamed other_dictatorship")
    message("Column MD has been renamed military_dictatorship")
    message("Column W has been renamed civil_war")
    message("Column OD has been renamed one_party_democracy")
    message("Column C has been renamed communist")
    message("Column IR has been renamed islamic_republic")
    message("Column SD has been renamed social_democracy")
    message("Column CO has been renamed conservative_democracy")
    message("Columns utip_dichotomous, utip_dichotomous_strict, and utip_trichotomous have been created")
    message(sprintf("Resulting dataset after processing has %d rows.",
                    nrow(utip)))
    if(nrow(data) != nrow(utip)) {
      message("Note: the number of rows in the processed UTIP data is different from the number of rows in the original data.")
      message("This is due to the exclusion of rows where DI was na and other columns contain no data.")
    }
  }

  standardize_columns(utip, cname, verbose = verbose)

}

#' @rdname redownload_blm
#'
#' @source Wahman, Michael, Jan Teorell, and Axel Hadenius. 2013. Authoritarian
#'   regime types revisited: updated data in comparative perspective.
#'   Contemporary Politics 19 (1): 19-34. The dataset and codebook can be
#'   downloaded from
#'   \url{https://sites.google.com/site/authoritarianregimedataset/data}
#'
#' @export
#' @examples
#' \dontrun{
#' redownload_wahman_teorell_hadenius()}
redownload_wahman_teorell_hadenius <- function(url,
                                               verbose = TRUE,
                                               return_raw = FALSE,
                                               ...) {

  if(missing(url)) {
    url <-"https://sites.google.com/site/authoritarianregimedataset/data/ARD_V6.dta?attredirects=0&d=1"
  }

  country <- year <- cowcode <- NULL



  data <- read_data(url,
                    name = "Wahman, Teorell, and Hadenius",
                    verbose = verbose,
                    file_extension = "dta")

  if(return_raw) {
    if(verbose) {
      message("Returning raw data, without processing.")
    }
    return(data)
  }

  wahman_teorell_hadenius <- data %>%
    country_year_coder(country,
                       year,
                       cowcode,
                       match_type = "country",
                       verbose = verbose,
                       ...)

  if(verbose) {
    message(sprintf("Resulting dataset after processing has %d rows.",
                    nrow(wahman_teorell_hadenius)))
    if(nrow(data) != nrow(wahman_teorell_hadenius)) {
      message("Note: the number of rows in the processed WTH data is different from the number of rows in the original data.")
    }
  }

  standardize_columns(wahman_teorell_hadenius, country, cowcode, verbose = verbose)
}

#' @rdname redownload_blm
#'
#' @source Michael Coppedge and Wolfgang Reinicke, "Measuring Polyarchy," Studies in
#' Comparative International Development 25:1 (Spring 1990): 51-72. Data
#' available at \url{http://www3.nd.edu/~mcoppedg/crd/datacrd.htm}
#'
#' @export
#'
#' @examples
#' \dontrun{
#' redownload_polyarchy_original()}
redownload_polyarchy_original <- function(url,
                                        verbose = TRUE,
                                        return_raw = FALSE,
                                        ...) {

  if(missing(url)) {
    url <-"https://www3.nd.edu/~mcoppedg/crd/poly8500.sav"
  }

  variable <- value <- suff85 <- cont2000 <- year <- Country <- NULL



  data <- read_data(url,
                    name = "Polyarchy original",
                    verbose = verbose)

  if(return_raw) {
    if(verbose) {
      message("Returning raw data, without processing.")
    }
    return(data)
  }

  if(verbose) {
    message("Putting the dataset in country-year format and adding state system information.")
  }

  polyarchy <- data %>%
    tidyr::gather(variable, value, suff85:cont2000) %>%
    mutate(year = stringr::str_extract(variable, "[0-9]+"),
           year = plyr::mapvalues(year,
                                  from = c("85", "00"),
                                  to = c("1985", "2000")) %>%
             as.numeric(),
           variable = stringr::str_replace_all(variable, "[0-9]+", ""),
           Country = plyr::mapvalues(Country, "DomRep", "Dominican Republic")) %>%
    filter(!is.na(value)) %>%
    tidyr::spread(variable, value) %>%
    country_year_coder(Country,
                       year,
                       match_type = "country",
                       verbose = verbose,
                       ...)

  if(verbose) {
    message(sprintf("Resulting dataset after processing has %d rows.",
                    nrow(polyarchy)))
    if(nrow(data) != nrow(polyarchy)) {
      message("Note: the number of rows in the processed PEPS data is different from the number of rows in the original data.")
      message("This is due to putting the dataset in country-year format.")
    }
  }

  standardize_columns(polyarchy, Country, verbose = verbose)

}

#' @rdname redownload_blm
#'
#' @source Michael Coppedge, Angel Alvarez, and Claudia
#' Maldonado, "Two Persistent Dimensions of Democracy: Contestation and
#' Inclusiveness," Journal of Politics 70:3 (July 2008): 632-647.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' redownload_polyarchy_dimensions()}
redownload_polyarchy_dimensions <- function(url,
                                          verbose = TRUE,
                                          return_raw = FALSE,
                                          ...) {

  if(missing(url)) {
    url <-"http://www3.nd.edu/~mcoppedg/crd/DahlDims.sav"
  }

  cname <- year <- ccodecow <- NULL

  data <- read_data(url,
                    name = "Polyarchy dimensions",
                    verbose = verbose)

  if(return_raw) {
    if(verbose) {
      message("Returning raw data, without processing.")
    }
    return(data)
  }

  polyarchy_dimensions <- data %>%
    country_year_coder(cname,
                       year,
                       ccodecow,
                       code_type = "cown",
                       verbose = verbose,
                       ...)

  if(verbose) {
    message(sprintf("Resulting dataset after processing has %d rows.",
                    nrow(polyarchy_dimensions)))
    if(nrow(data) != nrow(polyarchy_dimensions)) {
      message("Note: the number of rows in the processed Polyarchy Dimensions Dataset is different from the number of rows in the original data.")
    }
  }

  standardize_columns(polyarchy_dimensions, cname, ccodecow, verbose = verbose)

}

#' @rdname redownload_blm
#'
#' @source Magaloni, Beatriz, Jonathan Chu, and Eric Min.
#' 2013. Autocracies of the World, 1950-2012 (Version 1.0). Dataset, Stanford
#' University. Original data and codebook available at
#' \url{http://cddrl.fsi.stanford.edu/research/autocracies_of_the_world_dataset/}.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' redownload_magaloni()}
redownload_magaloni <- function(url,
                              verbose = TRUE,
                              extend = FALSE,
                              return_raw = FALSE,
                              ...) {

  if(missing(url)) {
    url <- "http://cddrl.fsi.stanford.edu/sites/default/files/res/Data_Set.xls"
  }

  country <- year <- ccode <- NULL
  demo_r <- duration_r <- lindex <- tdate <- NULL
  demo_nr <- regime_nr <- duration_nr <- reg_id <- NULL
  min_year <- max_year <- NULL


  data <- read_data(url,
                    name = "Magaloni, Chu, and Min",
                    verbose = verbose,
                    na = c("","NA", ".")) %>%
    mutate_at(vars(demo_r, duration_r:lindex), as.numeric) %>%
    mutate(tdate = lubridate::mdy(tdate))

  if(return_raw) {
    if(verbose) {
      message("Returning raw data, without processing.")
    }
    return(data)
  }

  if(extend) {
    if(verbose) {
      message("Extending the dataset using the duration_nr variable")
    }

    magaloni_panel <- data %>%
      filter(!is.na(reg_id)) %>%
      select(country, year, ccode, demo_nr, regime_nr, duration_nr, reg_id) %>%
      group_by(country, ccode, reg_id) %>%
      mutate(min_year = ifelse(min(year) > 1950, min(year), min(year, min(max(year) - duration_nr + 1))),
             max_year = max(year)) %>%
      select(-year, -duration_nr) %>%
      group_by_all() %>%
      summarise(year = list(as.numeric(min(min_year):max(max_year)))) %>%
      tidyr::unnest() %>%
      distinct() %>%
      ungroup() %>%
      arrange(country, year) %>%
      select(-min_year, -max_year)


  } else {
    magaloni_panel <- data
  }

  magaloni <- magaloni_panel %>%
    country_year_coder(country,
                       year,
                       # ccode,
                       # code_type = "polity_ccode",
                       match_type = "country",
                       verbose = verbose,
                       ...)

  if(verbose) {
    message(sprintf("Resulting dataset after processing has %d rows.",
                    nrow(magaloni)))
    if(nrow(data) != nrow(magaloni)) {
      message("Note: the number of rows in the processed Magaloni, Min, and Chu Dataset is different from the number of rows in the original data.")
    }
  }


  standardize_columns(magaloni, country, ccode, verbose = verbose)
}

#' @rdname redownload_blm
#' @param release_year (Only in \link{redownload_uds}). The year of the UDS release
#'   to be downloaded. Can be 2014, 2011, or 2010. Default is 2014.
#'
#' @source Pemstein, Daniel, Stephen Meserve, and James Melton. 2010. Democratic
#'   Compromise: A Latent Variable Analysis of Ten Measures of Regime Type.
#'   Political Analysis 18 (4): 426-449. Original data and codebook available at
#'   \url{http://www.unified-democracy-scores.org/}.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' redownload_uds()
#' redownload_uds(2011)}
redownload_uds <- function(release_year = 2014,
                         verbose = TRUE,
                         return_raw = FALSE,
                         ...) {

  if(!release_year %in% c(2014, 2011, 2010)) {
    release_year <- 2014
    message("release_year can only be 2014, 2011, or 2010. Defaulting to 2014.")
  }

  url <- ifelse(release_year == 2014,
                "http://www.unified-democracy-scores.org/files/20140312/z/uds_summary.csv.gz",
                ifelse(release_year == 2011,
                       "http://www.unified-democracy-scores.org/files/20110104/uds_summary.csv.gz",
                       "http://www.unified-democracy-scores.org/files/20100726/uds_summary.csv.gz"))


  country <- year <- cowcode <- NULL

  data <- read_data(url,
                    verbose = verbose,
                    name = "UDS",
                    file_extension = "csv")

  if(return_raw) {
    if(verbose) {
      message("Returning raw data, without processing.")
    }
    return(data)
  }

  uds <- data %>%
    country_year_coder(country,
                       year,
                       cowcode,
                       code_type = "cown",
                       match_type = "country",
                       verbose = verbose,
                       ...)

  if(verbose) {
    message(sprintf("Resulting dataset after processing has %d rows.",
                    nrow(uds)))
    if(nrow(data) != nrow(uds)) {
      message("Note: the number of rows in the processed UDS Dataset is different from the number of rows in the original data.")
    }
  }

  standardize_columns(uds, country, cowcode, verbose = verbose)

}

#' @rdname redownload_blm
#'
#' @source Jay Ulfelder. 2012. Democracy/Autocracy Data Set. \url{http://hdl.handle.net/1902.1/18836}.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' redownload_ulfelder()}
redownload_ulfelder <- function(url,
                              verbose = TRUE,
                              return_raw = FALSE,
                              extend = FALSE,
                              ...) {

  pitfcode <- rgjtype <- ulfelder_scode <- year <- NULL
  duration <- prev_regime <- rgjdura <- rgjdurd <- NULL

  if(missing(url)) {
    url <- "https://dataverse.harvard.edu/api/access/datafile/2420018"
  }

  data <- read_data(url,
                    verbose = verbose,
                    file_extension = "csv")

  if(return_raw) {
    if(verbose) {
      message("Returning raw data, without processing.")
    }
    return(data)
  }

  data <- data %>%
    mutate(ulfelder_scode =
             plyr::mapvalues(pitfcode,
                             from = c("GER","MNE","SRB","UK","USS"),
                             to = c("GMY","MNT","SER","UKG","USR"))) %>%
    filter(!is.na(rgjtype))

  if(verbose) {
    message("Column ulfelder_scodes has been created by changing pitfcodes GER, MNE, SRB, UK, USS to polity character codes GMY, MNT, SER, UKG, USR")
    message("Excluding all rows where rgjtype is NA")
  }

  if(extend) {
    if(verbose) {
      message("Extending the data back in time using the duration variable")
    }

    ulfelder_panel <- data %>%
      select(ulfelder_scode, year, rgjtype, rgjdurd, rgjdura) %>%
      group_by(ulfelder_scode) %>%
      filter(year == min(year), year <= 1956) %>%
      mutate(duration = ifelse(is.na(rgjdurd), rgjdura,
                               ifelse(is.na(rgjdura), rgjdurd, max(rgjdura, rgjdurd))),
             prev_regime = ifelse(is.na(rgjdurd), "A",
                                  ifelse(is.na(rgjdura), "D",
                                         ifelse(rgjdura > rgjdurd, "A", "D"))),
             year = list(year:(year-duration + 1))) %>%
      unnest() %>%
      filter(year != max(year)) %>%
      arrange(ulfelder_scode, year) %>%
      mutate(rgjtype = prev_regime,
             rgjdurd = ifelse(rgjtype == "D", seq_along(ulfelder_scode), NA),
             rgjdura = ifelse(rgjtype == "A", seq_along(ulfelder_scode), NA))  %>%
      select(-duration, -prev_regime)

    data <- bind_rows(ulfelder_panel, data) %>%
      arrange(ulfelder_scode, year) %>%
      ungroup()

  }


  ulfelder <- data  %>%
    country_year_coder(date_col = year,
                       code_col = ulfelder_scode,
                       code_type = "polity_scode",
                       match_type = "code",
                       verbose = verbose, ...) %>%
    mutate(year = as.numeric(year))

  if(verbose) {
    message(sprintf("Resulting dataset after processing has %d rows.",
                    nrow(ulfelder)))
    if(nrow(data) != nrow(ulfelder)) {
      message("Note: the number of rows in the processed Ulfelder Dataset is different from the number of rows in the original data.")
    }
  }


  ulfelder

}

#' @rdname redownload_blm
#'
#' @source Adam Przeworski. 2013 _Political Institutions and Political Events
#'   (PIPE) Data Set_. Data set.
#'   \url{https://sites.google.com/a/nyu.edu/adam-przeworski/home/data}.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' redownload_pipe()}
redownload_pipe <- function(url,
                          verbose = TRUE,
                          return_raw = FALSE,
                          ...) {

  if(missing(url)) {
    url <- "https://sites.google.com/a/nyu.edu/adam-przeworski/home/data/PIPE_081813.dta?attredirects=0&d=1"
  }

  countryn <- year <- cowcodes <- NULL
  country_number <- cum_salterel <- cum_term <- NULL
  democracy2 <- democracy_age <- democratic_period <- NULL
  electoral_age <- opposition <- NULL
  regime_numeric <- regime_period <- republic <- republic_age <- NULL
  republican_period <-  salterel <-  term <- country <- regime <- NULL
  polstatus <- NULL

  data <- read_data(url,
                    file_extension = "dta",
                    name = "PIPE",
                    verbose = verbose)

  if(return_raw) {
    if(verbose) {
      message("Returning raw data, without processing.")
    }
    return(data)
  }

  if(verbose) {
    message("Eliminating blank rows (country identifier is NA), fixing country names, filling in the correct cowcodes, adding state system info...")
  }

  PIPE <- data %>%
    filter(!is.na(country)) %>% # First we eliminate rows which are all NA
    rename(country_number = country) %>%
    group_by(country_number) %>%
    mutate(countryn = ifelse(countryn == "", NA, countryn)) %>%
    arrange(countryn, desc(year)) %>%
    tidyr::fill(countryn) %>%
    ungroup() %>%
    mutate(countryn = str_to_title(countryn))

  no.cowcodes <- PIPE %>%
    group_by(country_number) %>%
    filter(all(is.na(cowcodes)))
  with.cowcodes <- PIPE %>%
    group_by(country_number) %>%
    filter(any(!is.na(cowcodes)))

  with.cowcodes <- with.cowcodes %>%
    group_by(country_number) %>%
    arrange(desc(cowcodes),desc(year)) %>%
    tidyr::fill(cowcodes) %>%
    ungroup() %>%
    arrange(countryn, desc(year))

  PIPE <- bind_rows(with.cowcodes,no.cowcodes) %>%
    arrange(countryn, desc(year))

  if(verbose) {
    message("Changing countryn 'Serbia/Montenegro/Kosovo' to Serbia")
    message("Changing countryn 'Hungary Empire' to Austria-Hungary (Hungary)")
    message("Changing countryn 'Austria Empire' to Austria-Hungary (Austria)")
    message("Changing cowcode 'Hungary Empire' to 300")
    message("Changing cowcode for 'Serbia/Montenegro/Kosovo' to 342")
    message("Fixing country names for Leeward Islands and West Indies Federation")
  }


  PIPE$cowcodes[ PIPE$countryn == "Serbia/Montenegro/Kosovo" ] <- 342
  PIPE$cowcodes[ PIPE$countryn == "Hungary Empire" ] <- 300
  PIPE$countryn[ PIPE$countryn == "Serbia/Montenegro/Kosovo" ] <- "Serbia"
  PIPE$countryn[ PIPE$countryn == "Hungary Empire" ] <- "Austria-Hungary (Hungary)"
  PIPE$countryn[ PIPE$countryn == "Austria Empire" ] <- "Austria-Hungary (Austria)"

  PIPE <- PIPE %>%
    country_year_coder(countryn,
                       year,
                       code_col = cowcodes,
                       code_type = "cown",
                       match_type = "country",
                       verbose = verbose,
                       ...) %>%
    mutate(countryn = plyr::mapvalues(countryn,
                                      from=c("West Indies F",
                                             "Leeward Island F",
                                             "Leeward Islands"),
                                      to=c("West Indies Federation",
                                           "Leeward Islands Federation",
                                           "Leeward Islands Federation")))

  if(verbose) {
    message("Adding calculated variables")
    message("(republic, republican_period, cum_salterel, cum_term, democracy, democracy2, democracy_age, regime, regime_period)...")
  }

  PIPE <- PIPE %>%
    group_by(country_number) %>%
    arrange(country_number, year) %>%
    mutate(republic = ifelse(is.na(republic_age), 0, 1),
           republican_period = count_sequence_breaks(republic, seq_step=0)) %>%
    group_by(country_number, republican_period) %>%
    mutate(cum_salterel = plyr::mapvalues(salterel, from=c(NA),to=c(0),
                                          warn_missing = FALSE),
           cum_salterel = cumsum(cum_salterel),
           cum_term = cumsum(term),
           democracy = (!is.na(republic_age) & cum_salterel > 0 & cum_term > 0),
           democracy2 = (!is.na(republic_age) & cum_salterel > 0 & cum_term > 0 & polstatus > 0)) %>%
    group_by(country_number) %>%
    arrange(country_number, year) %>%
    mutate(democratic_period = count_sequence_breaks(democracy2, seq_step=0)) %>%
    group_by(country_number,democratic_period) %>%
    mutate(democracy_age = count_sequence_breaks(democratic_period),
           democracy_age = as.numeric(ifelse(democracy2, democracy_age, NA)),
           regime = ifelse(is.na(electoral_age), 0,
                           ifelse(((!is.na(electoral_age) & opposition == 0) |
                                     is.na(republic_age)), 1,
                                  ifelse(!is.na(democracy_age),3,ifelse(!is.na(republic_age),2,NA))))) %>%
    group_by(country_number) %>%
    arrange(country_number, year) %>%
    mutate(regime_period = plyr::mapvalues(regime, from=NA, to=-1, warn_missing = FALSE),
           regime_period = count_sequence_breaks(regime_period, seq_step=0)) %>%
    ungroup() %>%
    arrange(countryn, year)

  if(verbose) {
    message(sprintf("After processing, the resulting dataset has %d rows", nrow(PIPE)))
    message("Due to the exclusion of rows with no data, this number should be lower than the number of rows in the raw dataset.")
  }

  standardize_columns(PIPE, countryn, cowcodes, verbose = verbose)
}

