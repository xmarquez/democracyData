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



