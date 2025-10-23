# democracyData 0.6.0

* Converted pkgdown articles to Quarto for consistent rendering; site now builds with Bootstrap 5.

* Updated Freedom House downloads to latest year (2024).

* Updated EIU to latest year (2024)

* Updated VDem simple data to latest year (2024, version 15.0)

* Added new VaPoReg data on political regimes by Kailitz (2025) and ensured `redownload_vaporeg` works properly.

* Incorporated corrected Arat data from Zehra Arat's original book.

* Added newest version of LIED (6.8).

* Fixed problem with FH Electoral Democracies list download that was wrongly 
coding later democracies and missing one year.

* Update to {targets} pipeline to ensure consistent updating of data.

* Other updates to documentation and tests.

* Minor updates to ensure `verbose=FALSE` really results in quiet downloads (no messages/warnings).

* Now uses `testthat` 3rd edition. Updated tests to use snapshots.

# democracyData 0.5.1

* Fixed broken WGI URL, now data available to 2022

# democracyData 0.5.0

* Removed dependence on `plyr`

* Updated Freedom House download functions to use the latest data (2023 Freedom in the World Report)

* Updated EIU to 2023 release (2023 EIU report).

* Updated simplified Vdem (`vdem_simple`) data to latest version (13.0).

* Deprecated `redownload_pipe()` (data no longer available for download)

* Deprecated `redownload_blm()` (data no longer available for download)

* Deprecated `redownload_bnr()` (data no longer available for download)

* Added licensing info where available

* Updated documentation for consistency and fixed various problems with citations.

* Updated `anckar` data to V2 (with values to 2019). 

* Fixed Türkiye bug in `country_year_coder()`

* Moved to a new build system using [targets](https://books.ropensci.org/targets/) to ensure consistency

# democracyData 0.4.0

* Updated BMR to version 4.0.

* Updated BTI to 2022 release.

* Updated EIU to 2022 release (2022 EIU report).

* Updated LIED dataset to version 6.4.

* Updated Freedom House download functions to use the latest data (2022 Freedom in the World Report).

* Updated Vanhanen dataset to version 8.0

* Added simplified basic version of V-Dem dataset (with just the 7 main democracy indexes) to the package.

* Archived REIGN dataset (since it is no longer being maintained)

* Re-wrote README for clarity

* Minor big fixes and documentation updates

# democracyData 0.3.0

* Added two new datasets, Bjørnskov and Rode (2021), which updates PACL/DD to 2020, and ANRR (Acemoglu, Naidu, Restrepo, and Robinson 2019), used in their article "Democracy does Cause Growth".

* Migrated some of the functions from [QuickUDS](https://xmarquez.github.io/QuickUDS/) to this package to facilitate the construction of latent variable indexes of democracy

* Created three new articles: one on understanding the temporal and spatial coverage of the datasets included in the passage; one on understanding the correlations between different democracy measures; and one on creating latent variable indexes of democracy from the data in this package (including extending the Unified Democracy Scores) 

* Lots of minor improvements to the documentation and the website, including a better organized index of functions and articles.

# democracyData 0.2.6

* Updated the Freedom House data (2021 with data up to 2020), updating `download_fh` and `download_fh_full`, and updated the documentation of these functions and the citation info for the FH data. (The List of Electoral Democracies downloaded via `download_fh_electoral` does not appear to have been updated by Freedom House yet).

* Updated `download_wgi_voice_and_accountability` to download data up to the latest year (2019), and fixed the documentation of the function.

* Updated the REIGN dataset documentation.

* Updated `eiu`, the EIU democracy index (2021 edition, data up to 2020), and updated its citation info.

* Minor code improvements.

* Fixed README references.

* Added tests of redownload_* family of functions.

* Added Github Actions badge.

* Minor changes to `generate_democracy_scores_dataset` to avoid deprecated `dplyr::rename_at`.

# democracyData 0.2.5

* Added the Bertelsmann transformation Index of democracy (`bti`) and made improvements to `generate_democracy_scores_dataset`.

* Minor fixes to documentation.

# democracyData 0.2.4

* Fixed diagnostic printing issue when moving to dplyr 1.0.0.

* Updated `download_fh` and `download_fh_electoral` to download the latest version (2020, with data up to 2019) of Freedom House.

* Added a new function, `download_fh_full` to download the full Freedom House data (2012-2019) with all subcategory scores.

* Archived the PolityIV dataset (annual version), since Polity is now moving to version 5 and revising all its scores.

* Changed `download_polity_annual` to download version 5 of Polity (Polity5).

* Fixed `download_wgi_voice_and_accountability` - now downloads correctly update to 2018.

* `eiu` now updated to the latest release (2020, with data to 2019).

* `LIED` now updated to the latest release (2020, version 5.2, with data to 2019).

* Fixed `redownload_magaloni` download link, which had changed.

* `pitf` now has two versions: `pitf_p4` based on Polity IV data, and `pitf`, calculated from Polity5. Both now include data to 2018.

* Eliminated `redownload_uds` function since the [UDS website](http://www.unified-democracy-scores.org/) is no longer online.

* Updated bibliography and documentation for many datasets.

# democracyData 0.2.3

* Fixed download link for the SVMDI dataset, minor typo fixes.

# democracyData 0.2.2

* Updated `download_fh` and `download_fh_electoral` to download the latest version (2019, with data up to 2018) of Freedom House.

* Updated `download_polity_annual` to download the 2018 update of Polity IV.

* Updated `download_reign` to download the latest data from REIGN.

* `eiu` now updated to the latest release (2019, with data to 2018).

* Updated `download_wgi_voice_and_accountability` to use the  latest version of the data.

# democracyData 0.2.2

* Now includes Anckar and Fredriksson's (2018) dataset of authoritarian regimes (`anckar`) and the Support Vector Machine index of democracy (two versions, Grundler and Krieger 2018 and 2016)

* Fixed bugs in the `download_reign` function due to a change of schema in their google sheet.

# democracyData 0.2.1

* Now includes the Economist Intelligence Index's democracy index (`eiu`).

* Updated the `bmr` dataset to the latest version (3.0), which includes a new variable, `democracy_femalesuffrage`.

* Fixed bugs with the `download_reign` function not picking up the right google spreadsheet.

* Fixed bugs in `country_year_coder` not picking up on "Sudan, South" as a country.

# democracyData 0.2.0

* Added a `NEWS.md` file to track changes to the package.

* `donwload_fh` now downloads the latest versions of the Freedom House "Freedom in the World" dataset (updated to 2017, report date January 2018)

* `download_wgi_voice_and_accountability` now downloads the latest version of the World Bank's voice and accountability index (updated to 2016)



