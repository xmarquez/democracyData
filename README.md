
<!-- README.md is generated from README.Rmd. Please edit that file -->

<!-- badges: start -->
[![R-CMD-check](https://github.com/xmarquez/democracyData/workflows/R-CMD-check/badge.svg)](https://github.com/xmarquez/democracyData/actions)
<!-- badges: end -->

# democracyData

This package archives a large number of datasets measuring democracy in
use in the scholarly literature, and it provides functions to access
many others. You can use it to access some widely used datasets,
including [Polity5](http://www.systemicpeace.org/inscrdata.html),
[Freedom House](https://freedomhouse.org/), [Geddes, Wright, and Frantz’
autocratic regimes dataset](http://sites.psu.edu/dictators/), the
[Lexical Index of Electoral
Democracy](https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/29106),
the [DD/ACLP/PACL/CGV
dataset](https://sites.google.com/site/joseantoniocheibub/datasets/democracy-and-dictatorship-revisited),
the main indexes of the [V-Dem
dataset](https://www.v-dem.net/vdemds.html), and many others.

## Installation

The package is only available on Github. Install as follows:

    remotes::install_github("xmarquez/democracyData")

## Basic usage

For the vast majority of use cases, you can just type the name of the
dataset you require. For example, here’s the
[DD/ACLP/PACL/CGV](https://sites.google.com/site/joseantoniocheibub/datasets/democracy-and-dictatorship-revisited)
dataset:

``` r
library(democracyData)
pacl
#> # A tibble: 9,159 x 82
#>    order pacl_country  year aclpcode pacl_cowcode cowcode2 ccdcodelet ccdcodenum
#>    <dbl> <chr>        <dbl>    <dbl>        <dbl>    <dbl> <chr>           <dbl>
#>  1     1 Afghanistan   1946      142          700      700 AFG                 1
#>  2     2 Afghanistan   1947      142          700      700 AFG                 1
#>  3     3 Afghanistan   1948      142          700      700 AFG                 1
#>  4     4 Afghanistan   1949      142          700      700 AFG                 1
#>  5     5 Afghanistan   1950      142          700      700 AFG                 1
#>  6     6 Afghanistan   1951      142          700      700 AFG                 1
#>  7     7 Afghanistan   1952      142          700      700 AFG                 1
#>  8     8 Afghanistan   1953      142          700      700 AFG                 1
#>  9     9 Afghanistan   1954      142          700      700 AFG                 1
#> 10    10 Afghanistan   1955      142          700      700 AFG                 1
#> # ... with 9,149 more rows, and 74 more variables: aclpyear <dbl>,
#> #   cowcode2year <dbl>, cowcodeyear <dbl>, chgterr <dbl>, ychgterr <dbl>,
#> #   flagc_cowcode2 <dbl>, flage_cowcode2 <dbl>, entryy <dbl>, exity <dbl>,
#> #   cid <dbl>, wdicode <chr>, imf_code <dbl>, politycode <dbl>,
#> #   bankscode <dbl>, dpicode <chr>, uncode <dbl>, un_region <dbl>,
#> #   un_region_name <chr>, un_continent <dbl>, un_continent_name <chr>,
#> #   aclp_region <dbl>, bornyear <dbl>, endyear <dbl>, dupcow <dbl>, ...
```

Here’s [Polity IV](http://www.systemicpeace.org/inscrdata.html):

``` r
polityIV
#> # A tibble: 17,562 x 40
#>    cyear polityIV_ccode scode polityIV_country  year  flag fragment democ autoc
#>    <dbl>          <dbl> <chr> <chr>            <dbl> <dbl>    <dbl> <dbl> <dbl>
#>  1 21800              2 USA   United States     1800     0       NA     7     3
#>  2 21801              2 USA   United States     1801     0       NA     7     3
#>  3 21802              2 USA   United States     1802     0       NA     7     3
#>  4 21803              2 USA   United States     1803     0       NA     7     3
#>  5 21804              2 USA   United States     1804     0       NA     7     3
#>  6 21805              2 USA   United States     1805     0       NA     7     3
#>  7 21806              2 USA   United States     1806     0       NA     7     3
#>  8 21807              2 USA   United States     1807     0       NA     7     3
#>  9 21808              2 USA   United States     1808     0       NA     7     3
#> 10 21809              2 USA   United States     1809     0       NA     9     0
#> # ... with 17,552 more rows, and 31 more variables: polity <dbl>,
#> #   polity2 <dbl>, durable <dbl>, xrreg <dbl>, xrcomp <dbl>, xropen <dbl>,
#> #   xconst <dbl>, parreg <dbl>, parcomp <dbl>, exrec <dbl>, exconst <dbl>,
#> #   polcomp <dbl>, prior <dbl>, emonth <dbl>, eday <dbl>, eyear <dbl>,
#> #   eprec <dbl>, interim <dbl>, bmonth <dbl>, bday <dbl>, byear <dbl>,
#> #   bprec <dbl>, post <dbl>, change <dbl>, d4 <dbl>, sf <dbl>, regtrans <dbl>,
#> #   extended_country_name <chr>, GWn <dbl>, cown <int>, in_GW_system <lgl>
```

And here’s a basic version of the V-Dem dataset, including only the 7
main indexes of democracy:

``` r
vdem_simple
#> # A tibble: 27,380 x 54
#>    vdem_country_name country_text_id country_id  year historical_date project
#>    <chr>             <chr>                <dbl> <dbl> <date>            <dbl>
#>  1 Mexico            MEX                      3  1789 1789-12-31            1
#>  2 Mexico            MEX                      3  1790 1790-12-31            1
#>  3 Mexico            MEX                      3  1791 1791-12-31            1
#>  4 Mexico            MEX                      3  1792 1792-12-31            1
#>  5 Mexico            MEX                      3  1793 1793-12-31            1
#>  6 Mexico            MEX                      3  1794 1794-12-31            1
#>  7 Mexico            MEX                      3  1795 1795-12-31            1
#>  8 Mexico            MEX                      3  1796 1796-12-31            1
#>  9 Mexico            MEX                      3  1797 1797-12-31            1
#> 10 Mexico            MEX                      3  1798 1798-12-31            1
#> # ... with 27,370 more rows, and 48 more variables: historical <dbl>,
#> #   histname <chr>, codingstart <dbl>, codingend <dbl>,
#> #   codingstart_contemp <dbl>, codingend_contemp <dbl>, codingstart_hist <dbl>,
#> #   codingend_hist <dbl>, gapstart1 <dbl>, gapstart2 <dbl>, gapstart3 <dbl>,
#> #   gapend1 <dbl>, gapend2 <dbl>, gapend3 <dbl>, gap_index <dbl>,
#> #   vdem_cowcode <dbl>, v2x_polyarchy <dbl>, v2x_polyarchy_codelow <dbl>,
#> #   v2x_polyarchy_codehigh <dbl>, v2x_polyarchy_sd <dbl>, v2x_libdem <dbl>, ...
```

All datasets in this package are fully documented; type `?pacl` for
example to see the documentation for the PACL dataset.

## Downloading democracy data

Three democracy datasets are not currently archived in this package: the
family of datasets released by [Freedom
House](https://freedomhouse.org/); the
[Polity5](http://www.systemicpeace.org/inscrdata.html) dataset (which
superceded [Polity IV](http://www.systemicpeace.org/inscrdata.html));
and the Voice and Accountability indexes of the [World Governance
Indicators](http://info.worldbank.org/governance/wgi/). (The full V-Dem
dataset is also not archived here; you can access it via the
[vdemdata](https://github.com/vdeminstitute/vdemdata) package). To
download these datasets, use the the `download_*` family of functions.

For example, we can download and process the Freedom House “Freedom in
the World” dataset as follows:

``` r
fh <- download_fh(verbose = FALSE)
#> Warning in download_fh(verbose = FALSE): NAs introduced by coercion

#> Warning in download_fh(verbose = FALSE): NAs introduced by coercion

fh 
#> # A tibble: 8,850 x 11
#>    fh_country   year    pr    cl status fh_total fh_total_reversed
#>    <chr>       <dbl> <dbl> <dbl> <fct>     <dbl>             <dbl>
#>  1 Afghanistan  1972     4     5 PF            9                 5
#>  2 Afghanistan  1973     7     6 NF           13                 1
#>  3 Afghanistan  1974     7     6 NF           13                 1
#>  4 Afghanistan  1975     7     6 NF           13                 1
#>  5 Afghanistan  1976     7     6 NF           13                 1
#>  6 Afghanistan  1977     6     6 NF           12                 2
#>  7 Afghanistan  1978     7     7 NF           14                 0
#>  8 Afghanistan  1979     7     7 NF           14                 0
#>  9 Afghanistan  1980     7     7 NF           14                 0
#> 10 Afghanistan  1982     7     7 NF           14                 0
#> # ... with 8,840 more rows, and 4 more variables: extended_country_name <chr>,
#> #   GWn <dbl>, cown <int>, in_GW_system <lgl>
```

This downloads the latest update of the “Freedom in the World” dataset
(1972-2021, corresponding to the 2022 report), puts it in country-year
format (extracting the relevant info from the awful Excel table that
Freedom House makes available), calculates the variables `fh_total` and
`fh_total_reversed`, and adds state system information, including a
standardized country name, the
[Gleditsch-Ward](http://privatewww.essex.ac.uk/~ksg/statelist.html)
country code and the [Correlates of
War](http://www.correlatesofwar.org/data-sets/state-system-membership)
country code.

Other democracy datasets included in this package do not need to be
downloaded, but they can often also be “re-downloaded” from the websites
of their creators or maintainers if required. For example, one can
either access PACL directly by typing

``` r
pacl
#> # A tibble: 9,159 x 82
#>    order pacl_country  year aclpcode pacl_cowcode cowcode2 ccdcodelet ccdcodenum
#>    <dbl> <chr>        <dbl>    <dbl>        <dbl>    <dbl> <chr>           <dbl>
#>  1     1 Afghanistan   1946      142          700      700 AFG                 1
#>  2     2 Afghanistan   1947      142          700      700 AFG                 1
#>  3     3 Afghanistan   1948      142          700      700 AFG                 1
#>  4     4 Afghanistan   1949      142          700      700 AFG                 1
#>  5     5 Afghanistan   1950      142          700      700 AFG                 1
#>  6     6 Afghanistan   1951      142          700      700 AFG                 1
#>  7     7 Afghanistan   1952      142          700      700 AFG                 1
#>  8     8 Afghanistan   1953      142          700      700 AFG                 1
#>  9     9 Afghanistan   1954      142          700      700 AFG                 1
#> 10    10 Afghanistan   1955      142          700      700 AFG                 1
#> # ... with 9,149 more rows, and 74 more variables: aclpyear <dbl>,
#> #   cowcode2year <dbl>, cowcodeyear <dbl>, chgterr <dbl>, ychgterr <dbl>,
#> #   flagc_cowcode2 <dbl>, flage_cowcode2 <dbl>, entryy <dbl>, exity <dbl>,
#> #   cid <dbl>, wdicode <chr>, imf_code <dbl>, politycode <dbl>,
#> #   bankscode <dbl>, dpicode <chr>, uncode <dbl>, un_region <dbl>,
#> #   un_region_name <chr>, un_continent <dbl>, un_continent_name <chr>,
#> #   aclp_region <dbl>, bornyear <dbl>, endyear <dbl>, dupcow <dbl>, ...
```

Or re-download the dataset from Jose Antonio Cheibub’s website as
follows:

``` r
pacl_redownloaded <- redownload_pacl(verbose = FALSE)

pacl_redownloaded
#> # A tibble: 9,159 x 82
#>    order pacl_country  year aclpcode pacl_cowcode cowcode2 ccdcodelet ccdcodenum
#>    <dbl> <chr>        <dbl>    <dbl>        <dbl>    <dbl> <chr>           <dbl>
#>  1     1 Afghanistan   1946      142          700      700 AFG                 1
#>  2     2 Afghanistan   1947      142          700      700 AFG                 1
#>  3     3 Afghanistan   1948      142          700      700 AFG                 1
#>  4     4 Afghanistan   1949      142          700      700 AFG                 1
#>  5     5 Afghanistan   1950      142          700      700 AFG                 1
#>  6     6 Afghanistan   1951      142          700      700 AFG                 1
#>  7     7 Afghanistan   1952      142          700      700 AFG                 1
#>  8     8 Afghanistan   1953      142          700      700 AFG                 1
#>  9     9 Afghanistan   1954      142          700      700 AFG                 1
#> 10    10 Afghanistan   1955      142          700      700 AFG                 1
#> # ... with 9,149 more rows, and 74 more variables: aclpyear <dbl>,
#> #   cowcode2year <dbl>, cowcodeyear <dbl>, chgterr <dbl>, ychgterr <dbl>,
#> #   flagc_cowcode2 <dbl>, flage_cowcode2 <dbl>, entryy <dbl>, exity <dbl>,
#> #   cid <dbl>, wdicode <chr>, imf_code <dbl>, politycode <dbl>,
#> #   bankscode <dbl>, dpicode <chr>, uncode <dbl>, un_region <dbl>,
#> #   un_region_name <chr>, un_continent <dbl>, un_continent_name <chr>,
#> #   aclp_region <dbl>, bornyear <dbl>, endyear <dbl>, dupcow <dbl>, ...
```

These two data frames should be identical:

``` r
identical(pacl, pacl_redownloaded)
#> [1] TRUE
```

You should thus normally use the “archived” versions of these datasets,
unless you want to manipulate the raw data yourself (using the
`redownload_*` functions with the option `return_raw = TRUE`), or think
they might have been updated since you installed this package.

## Included democracy datasets

For a list of all the democracy datasets available through this package,
type `democracy_info`:

``` r
library(dplyr)
#> Warning: package 'dplyr' was built under R version 4.1.2
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union

democracy_info %>%
  knitr::kable()
```

| dataset                 | long_name                                                                                                     | main_democracy_measure_col                                                      | measure_type | based_on        | in_pmm_replication | categorical_regime_types | user_extendable | downloadable | included_in_package | first_published_use | notes                                                                                                                                                                                                                                                                                                                                     |
|:------------------------|:--------------------------------------------------------------------------------------------------------------|:--------------------------------------------------------------------------------|:-------------|:----------------|:-------------------|:-------------------------|:----------------|:-------------|:--------------------|--------------------:|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| anckar                  | The Anckar-Fredriksson dataset of political regimes                                                           | democracy                                                                       | dichotomous  | bmr             | FALSE              | TRUE                     | FALSE           | TRUE         | TRUE                |                2018 | The democracy measure should be equivalent to democracy_omitteddata from bmr up to 2010; it may have some divergences for the 2011-2016 period.                                                                                                                                                                                           |
| anrr                    | The Acemoglu, Naidu, Restrepo, and Robinson dataset                                                           | dem                                                                             | dichotomous  | FH,Polity       | FALSE              | FALSE                    | TRUE            | FALSE        | TRUE                |                2019 | The measure can be extended by using the latest FH, Polity, and PACL Data, but the rules are not entirely transparent, and some cases in the original dataset have been hand-coded.                                                                                                                                                       |
| arat_pmm                | The Arat measure of democracy                                                                                 | pmm_arat                                                                        | continuous   | NA              | TRUE               | FALSE                    | FALSE           | FALSE        | TRUE                |                1991 | Only available via the Pemstein, Meserve, and Melton (2013) replication data. I have not been able to access the original data.                                                                                                                                                                                                           |
| blm                     | The Bowman, Lehoucq, and Mahoney index of democracy for Central America                                       | blm                                                                             | trichotomous | NA              | TRUE               | FALSE                    | FALSE           | TRUE         | TRUE                |                2005 | NA                                                                                                                                                                                                                                                                                                                                        |
| bmr                     | The Boix-Miller-Rosato dichotomous coding of democracy, 1800-2015, version 3.0                                | democracy,democracy_omitteddata,democracy_femalesuffrage                        | dichotomous  | PACL            | FALSE              | FALSE                    | FALSE           | TRUE         | TRUE                |                2010 | NA                                                                                                                                                                                                                                                                                                                                        |
| bnr                     | The Bernhard, Nordstrom & Reenock Event History Coding of Democratic Breakdowns                               | event,bnr                                                                       | dichotomous  | NA              | FALSE              | FALSE                    | TRUE            | TRUE         | TRUE                |                2001 | Can be extended using a full panel of sovereign countries (COW). Extended version included in this package.                                                                                                                                                                                                                               |
| bti                     | The Berteslmann Index of Political transformation                                                             | SI_Democracy_Status                                                             | continuous   | NA              | FALSE              | FALSE                    | FALSE           | TRUE         | TRUE                |                2006 | NA                                                                                                                                                                                                                                                                                                                                        |
| bollen_pmm              | The Bollen measure of democracy                                                                               | pmm_bollen                                                                      | continuous   | NA              | TRUE               | FALSE                    | FALSE           | FALSE        | TRUE                |                1978 | The original data was compiled in 1978, for Bollen’s dissertation; existing data seems to be from the 2000 update. I do not know how much it changed over time. Only available via the Pemstein, Meserve, and Melton (2013) replication data. I have not been able to access the original data.                                           |
| doorenspleet            | Renske Doorenspleet’s Democracy Dataset                                                                       | doorenspleet,regime                                                             | dichotomous  | Polity          | FALSE              | FALSE                    | FALSE           | FALSE        | TRUE                |                2000 | NA                                                                                                                                                                                                                                                                                                                                        |
| eiu                     | The Economist Intelligence Unit’s Democracy Index                                                             | eiu                                                                             | continuous   | NA              | FALSE              | FALSE                    | FALSE           | FALSE        | TRUE                |                2006 | The original data has to be manually extracted from the tables in the EIU’s pdf report on the index.                                                                                                                                                                                                                                      |
| fh                      | Freedom House “Freedom in the World” data                                                                     | status,fh_total,fh_total_reversed                                               | ordinal      | FH              | TRUE               | FALSE                    | FALSE           | TRUE         | FALSE               |                1973 | NA                                                                                                                                                                                                                                                                                                                                        |
| fh_full                 | Freedom House “Freedom in the World” data                                                                     | total                                                                           | continuous   | FH              | FALSE              | FALSE                    | FALSE           | TRUE         | FALSE               |                2013 | This is the 0-100 score Freedom House uses for its more aggregated ratings. Freedom House changed its methodology in 2013, so the full data is different for this period; full data from 2003-2012 is available in their website, but is not yet included in this package.                                                                |
| fh_electoral            | Freedom House “Electoral Democracies” List                                                                    | electoral                                                                       | dichotomous  | FH              | FALSE              | FALSE                    | FALSE           | TRUE         | FALSE               |                1990 | The electoral democracy list seems to have only been compiled since the 1990s, but I have not been able to find an exact date of first compilation.                                                                                                                                                                                       |
| gwf                     | The Geddes Wright and Frantz Autocratic Regimes dataset                                                       | gwf_regimetype,gwf_nonautocracy                                                 | dichotomous  | PACL            | FALSE              | TRUE                     | TRUE            | TRUE         | TRUE                |                2014 | Can be extended using the gwf_duration variable. Extended version included in this package.                                                                                                                                                                                                                                               |
| hadenius_pmm            | Axel Hadenius’ Index of Democracy                                                                             | pmm_hadenius                                                                    | continuous   | NA              | TRUE               | FALSE                    | FALSE           | FALSE        | TRUE                |                1992 | Only available via the Pemstein, Meserve, and Melton (2013) replication data. I have not been able to access the original data.                                                                                                                                                                                                           |
| kailitz                 | The Steffen Kailitz Dataset of Authoritarian Regime Types                                                     | combined_regime,kailitz_binary,kailitz_tri                                      | dichotomous  | NA              | FALSE              | TRUE                     | FALSE           | FALSE        | TRUE                |                2013 | NA                                                                                                                                                                                                                                                                                                                                        |
| LIED                    | The Lexical Index of Electoral Democracy, v. 3                                                                | lexical_index                                                                   | ordinal      | PIPE            | FALSE              | FALSE                    | FALSE           | TRUE         | TRUE                |                2015 | NA                                                                                                                                                                                                                                                                                                                                        |
| magaloni                | Autocracies of the World, 1950-2012 (Version 1.0).                                                            | demo_nr,demo_r,regime_r,regime_nr                                               | dichotomous  | PACL            | FALSE              | TRUE                     | TRUE            | TRUE         | TRUE                |                2013 | Can be extended using the duration_nr variable. Extended version included in this package.                                                                                                                                                                                                                                                |
| mainwaring              | Mainwaring, Brinks, and Perez Linan’s democracy measure for Latin America                                     | mainwaring,Regime                                                               | trichotomous | NA              | TRUE               | FALSE                    | FALSE           | FALSE        | TRUE                |                2001 | NA                                                                                                                                                                                                                                                                                                                                        |
| munck_pmm               | Munck Index of Democracy                                                                                      | pmm_munck                                                                       | continuous   | NA              | TRUE               | FALSE                    | FALSE           | FALSE        | TRUE                |                2009 | Only available via the Pemstein, Meserve, and Melton (2013) replication data. I have not been able to access the original data.                                                                                                                                                                                                           |
| pacl, pacl_update       | The Democracy and Dictatorship Dataset (DD/PACL/ACLP/CGV)                                                     | democracy,regime,Democracy,DD_regime,DD_category                                | dichotomous  | PACL            | TRUE               | TRUE                     | FALSE           | TRUE         | TRUE                |                1996 | The original data was first compiled, as far as I know, for the famous ACLP study “Modernization: Theories and Facts” study of 1996. It was extended and changed by Cheibub, Gandhi, and Vreeland in 2010 (pacl dataset) and further updated by Bj<f8>rnskov and Rode (2020; pacl_update dataset), who added new institutional variables. |
| peps                    | Participation-Enhanced Polity Score                                                                           | PEPS1i,PEPS2i,PEPS1q,PEPS2q,PEPS1v,PEPS2v,polity1raw,Polity1,Polity2,Polity3    | continuous   | Polity          | FALSE              | FALSE                    | FALSE           | TRUE         | TRUE                |                2006 | NA                                                                                                                                                                                                                                                                                                                                        |
| PIPE                    | The Political Institutions and Political Events (PIPE) dataset                                                | democracy,democracy2,regime                                                     | dichotomous  | PIPE            | FALSE              | FALSE                    | FALSE           | TRUE         | TRUE                |                2010 | Democracy measures in PIPE are calculated in this package on the basis of imperfect instructions in the codebook. Use with care.                                                                                                                                                                                                          |
| pitf                    | Political Instability Task Force democracy indicator                                                          | pitf_binary                                                                     | dichotomous  | Polity          | FALSE              | FALSE                    | FALSE           | FALSE        | TRUE                |                2010 | Constructed score on the basis of Polity data.                                                                                                                                                                                                                                                                                            |
| pitf                    | Political Instability Task Force democracy indicator                                                          | pitf                                                                            | ordinal      | Polity          | FALSE              | FALSE                    | FALSE           | FALSE        | TRUE                |                2010 | Constructed score on the basis of Polity data.                                                                                                                                                                                                                                                                                            |
| polityIV                | The Polity IV dataset                                                                                         | polity,polity2                                                                  | ordinal      | Polity          | TRUE               | FALSE                    | FALSE           | TRUE         | TRUE                |                1975 | The first compilation of this dataset (POLITY I) was probably first used in a 1975 study by Eckstein and Gurr, but had been collected by Gurr since the late 1960s. The current form of the data is very different from the original Polity I data. The Polity II codebook survives, but I find no record of the Polity I codebook.       |
| polity_annual           | The Polity5 dataset                                                                                           | polity,polity2                                                                  | ordinal      | Polity          | TRUE               | FALSE                    | FALSE           | TRUE         | FALSE               |                1975 | The first compilation of this dataset (POLITY I) was probably first used in a 1975 study by Eckstein and Gurr, but had been collected by Gurr since the late 1960s. The current form of the data is very different from the original Polity I data. The Polity II codebook survives, but I find no record of the Polity I codebook.       |
| polyarchy               | The Polyarchy Scale and the Contestation Scale                                                                | cont,poly                                                                       | ordinal      | NA              | TRUE               | FALSE                    | FALSE           | TRUE         | TRUE                |                1990 | NA                                                                                                                                                                                                                                                                                                                                        |
| polyarchy_dimensions    | Latent Dimensions of Contestation and Inclusiveness by Michael Coppedge, Angel Alvarez, and Claudia Maldonado | CONTEST,INCLUS                                                                  | continuous   | latent variable | FALSE              | FALSE                    | FALSE           | TRUE         | TRUE                |                2008 | NA                                                                                                                                                                                                                                                                                                                                        |
| prc_gasiorowski         | The Political Regime Change (PRC) dataset.                                                                    | regime,prc,prc_at_end_year,prc_at_beginning_year                                | trichotomous | NA              | TRUE               | FALSE                    | FALSE           | FALSE        | TRUE                |                1996 | NA                                                                                                                                                                                                                                                                                                                                        |
| reign                   | The Rulers, Elections, and Irregular Governance (REIGN) dataset, regime characteristics worksheet.            | gwf_regimetype                                                                  | dichotomous  | GWF             | FALSE              | TRUE                     | FALSE           | TRUE         | FALSE               |                2016 | NA                                                                                                                                                                                                                                                                                                                                        |
| svmdi                   | Suport Vector Machine Democracy Index by Grundler and Krieger                                                 | svmdi, csvmdi                                                                   | continuous   | latent variable | FALSE              | FALSE                    | FALSE           | TRUE         | TRUE                |                2016 | NA                                                                                                                                                                                                                                                                                                                                        |
| svmdi                   | Suport Vector Machine Democracy Index by Grundler and Krieger                                                 | dsvmdi                                                                          | dichotomous  | latent variable | FALSE              | FALSE                    | FALSE           | TRUE         | TRUE                |                2016 | NA                                                                                                                                                                                                                                                                                                                                        |
| svolik_regime           | Milan Svolik’s Regime Dataset                                                                                 | regime,regime_numeric                                                           | dichotomous  | PACL            | FALSE              | FALSE                    | FALSE           | FALSE        | TRUE                |                2012 | NA                                                                                                                                                                                                                                                                                                                                        |
| uds                     | The Unified Democracy Scores                                                                                  | mean,median                                                                     | continuous   | latent variable | FALSE              | FALSE                    | TRUE            | TRUE         | TRUE                |                2010 | Can be extended using the package QuickUDS. (Use “remotes::install_github(”xmarquez/QuickUDS”)“; the package is not on CRAN)                                                                                                                                                                                                              |
| ulfelder                | The Democracy/Autocracy Dataset by Jay Ulfelder                                                               | rgjtype                                                                         | dichotomous  | Polity          | FALSE              | FALSE                    | TRUE            | TRUE         | TRUE                |                2007 | Can be extended using the rgjdurd and rgjdura variables. Extended version included in this package.                                                                                                                                                                                                                                       |
| utip                    | The University of Texas Inequality Project Categorical Dataset of Political Regimes                           | utip_trichotomous                                                               | trichotomous | NA              | FALSE              | TRUE                     | FALSE           | TRUE         | TRUE                |                2008 | Both the dichotomous and trichotomous versions of these measures are calculated by this package. The original dataset distinguishes several different types of democracy.                                                                                                                                                                 |
| utip                    | The University of Texas Inequality Project Categorical Dataset of Political Regimes                           | utip_dichotomous,utip_dichotomous_strict                                        | dichotomous  | NA              | FALSE              | TRUE                     | FALSE           | TRUE         | TRUE                |                2008 | Both the dichotomous and trichotomous versions of these measures are calculated by this package. The original dataset distinguishes several different types of democracy.                                                                                                                                                                 |
| vanhanen                | Vanhanen measures of democracy, 1800-2012                                                                     | vanhanen_democratization                                                        | continuous   | NA              | TRUE               | FALSE                    | FALSE           | FALSE        | TRUE                |                1968 | Vanhanen first collected democracy data on 12 countries for his 1968 dissertation. Current data is different from the original data, though it still uses a similar conceptual scheme.                                                                                                                                                    |
| vdem                    | The Varieties of Democracy Dataset, version 11                                                                | v2x_polyarchy,v2x_api,v2x_mpi,v2x_libdem,v2x_partipdem,v2x_delibdem,v2x_egaldem | continuous   | NA              | FALSE              | FALSE                    | FALSE           | FALSE        | FALSE               |                2015 | Can be accessed using the package vdem. (Use “remotes::install_github(”xmarquez/vdem”)“; the package is not on CRAN)                                                                                                                                                                                                                      |
| wahman_teorell_hadenius | Authoritarian Regimes Data Set, version 5.0, by Axel Hadenius, Jan Teorell, & Michael Wahman                  | regime1ny,regime1nyrobust, regimeny, regimenyrobust                             | dichotomous  | FH,Polity       | FALSE              | TRUE                     | FALSE           | TRUE         | TRUE                |                2007 | NA                                                                                                                                                                                                                                                                                                                                        |
| wgi_democracy           | The World Governance Indicators “Voice and Accountability” Index                                              | Estimate                                                                        | continuous   | FH              | FALSE              | FALSE                    | FALSE           | TRUE         | FALSE               |                2010 | NA                                                                                                                                                                                                                                                                                                                                        |

## Combining all democracy datasets

You can create one huge data frame including all democracy measures with
one call:

``` r
democracy_data <- generate_democracy_scores_dataset(output_format = "wide",
                                                    verbose = FALSE)
#> Warning in download_fh(verbose = verbose, include_territories = TRUE): NAs
#> introduced by coercion

#> Warning in download_fh(verbose = verbose, include_territories = TRUE): NAs
#> introduced by coercion

democracy_data
#> # A tibble: 36,894 x 89
#>    extended_country_name   GWn  cown in_GW_system  year anckar_democracy
#>    <chr>                 <dbl> <int> <lgl>        <dbl>            <dbl>
#>  1 Abkhazia                396    NA FALSE         1997               NA
#>  2 Abkhazia                396    NA FALSE         1998               NA
#>  3 Abkhazia                396    NA FALSE         1999               NA
#>  4 Abkhazia                396    NA FALSE         2000               NA
#>  5 Abkhazia                396    NA FALSE         2001               NA
#>  6 Abkhazia                396    NA FALSE         2002               NA
#>  7 Abkhazia                396    NA FALSE         2003               NA
#>  8 Abkhazia                396    NA FALSE         2004               NA
#>  9 Abkhazia                396    NA FALSE         2005               NA
#> 10 Abkhazia                396    NA FALSE         2006               NA
#> # ... with 36,884 more rows, and 83 more variables: anrr_democracy <dbl>,
#> #   blm <dbl>, bmr_democracy <dbl>, bmr_democracy_femalesuffrage <dbl>,
#> #   bmr_democracy_omitteddata <dbl>, bnr <dbl>, bnr_extended <dbl>,
#> #   bti_democracy <dbl>, csvmdi <dbl>, doorenspleet <dbl>, dsvmdi <dbl>,
#> #   eiu <dbl>, fh_electoral <dbl>, fh_total_reversed <dbl>,
#> #   gwf_democracy_extended <dbl>, gwf_democracy_extended_strict <dbl>,
#> #   kailitz_binary <dbl>, kailitz_tri <dbl>, lexical_index <dbl>, ...
```

This can take some time, since it downloads all downloadable datasets
(Freedom House, Polity 5, and the WGI Voice and Accountability index),
processes them (adds state system information, puts them in country-year
format, fixes wrong codes, etc.), and matches them to all the other
datasets. In any case, you can select exactly which datasets to include
in your big data frame. See `?generate_democracy_scores_dataset` for
further options to customize the output.

## Latent Variable Indexes of Democracy

The package also offers a series of convenience functions to calculate
latent variable indexes of democracy (following Pemstein, Meserve, and
Melton’s [2010 article](https://www.jstor.org/stable/25792023?seq=1)
“Democratic Compromise: A Latent Variable Analysis of Ten Measures of
Regime Type”); see the vignette on [Replicating and Extending the UD
scores of Pemstein, Meserve, and
Melton](/articles/articles/Replicating_and_extending_the_UD_scores.html).
It also contains a pre-calculated extended version of these scores,
available as `extended_uds`:

``` r
extended_uds
#> # A tibble: 36,544 x 20
#>    extended_country_name   GWn  cown in_GW_system  year     z1 se_z1 z1_pct975
#>    <chr>                 <dbl> <int> <lgl>        <dbl>  <dbl> <dbl>     <dbl>
#>  1 Abkhazia                396    NA FALSE         1997 0.0335 0.329     0.678
#>  2 Abkhazia                396    NA FALSE         1998 0.0335 0.329     0.678
#>  3 Abkhazia                396    NA FALSE         1999 0.0335 0.329     0.678
#>  4 Abkhazia                396    NA FALSE         2000 0.0335 0.329     0.678
#>  5 Abkhazia                396    NA FALSE         2001 0.0335 0.329     0.678
#>  6 Abkhazia                396    NA FALSE         2002 0.0335 0.329     0.678
#>  7 Abkhazia                396    NA FALSE         2003 0.0335 0.329     0.678
#>  8 Abkhazia                396    NA FALSE         2004 0.0335 0.329     0.678
#>  9 Abkhazia                396    NA FALSE         2005 0.238  0.327     0.880
#> 10 Abkhazia                396    NA FALSE         2006 0.238  0.327     0.880
#> # ... with 36,534 more rows, and 12 more variables: z1_pct025 <dbl>,
#> #   z1_adj <dbl>, z1_pct975_adj <dbl>, z1_pct025_adj <dbl>, z1_as_prob <dbl>,
#> #   z1_pct975_as_prob <dbl>, z1_pct025_as_prob <dbl>, z1_adj_as_prob <dbl>,
#> #   z1_pct975_adj_as_prob <dbl>, z1_pct025_adj_as_prob <dbl>,
#> #   num_measures <int>, measures <list>
```

## State system functions

The package also includes a couple of other convenience functions to
work with historical democracy data and determine state system
membership. The first is `country_year_coder`, which works like the
[`countrycode`](https://CRAN.R-project.org/package=countrycode) package,
except that it is able to determine state system information for
country-year pairs. Suppose you have this dataset:

``` r
my_weird_democracy_data <- tibble(country = c("Germany", "Germany", "Germany", "Germany", "East Germany",
                                    "Federal Republic of Germany",
                                    "Somaliland", "Somalia",
                                    "Palestine", "Russia",
                                    "Russia", "USSR",
                                    "Republic of Vietnam",
                                    "Yugoslavia", 'Yugoslavia',
                                    "Vietnam, South"),
                        year = c( 2015, 1930, 1970, 1945, 1949,
                                 1992, 1990,
                                 1990, 1940,
                                 1917, 1912,
                                 1922, 1975,
                                 1990, 1991, 1954),
                        my_measure = rnorm(16))


my_weird_democracy_data
#> # A tibble: 16 x 3
#>    country                      year my_measure
#>    <chr>                       <dbl>      <dbl>
#>  1 Germany                      2015     -0.750
#>  2 Germany                      1930     -0.799
#>  3 Germany                      1970      1.35 
#>  4 Germany                      1945     -0.416
#>  5 East Germany                 1949      0.808
#>  6 Federal Republic of Germany  1992     -0.467
#>  7 Somaliland                   1990     -0.666
#>  8 Somalia                      1990      0.455
#>  9 Palestine                    1940     -0.296
#> 10 Russia                       1917     -0.701
#> 11 Russia                       1912     -0.435
#> 12 USSR                         1922      0.262
#> 13 Republic of Vietnam          1975      0.151
#> 14 Yugoslavia                   1990      1.05 
#> 15 Yugoslavia                   1991      0.433
#> 16 Vietnam, South               1954     -0.588
```

and you then want to add state system information. `country_year_coder`
does that for you!

``` r
my_weird_democracy_data <- my_weird_democracy_data %>%
  country_year_coder(country,
                     year,
                     match_type = "country",
                     verbose = FALSE,
                     include_in_output = c("extended_country_name", 
                                           "GWn", "cown", 
                                           "polity_ccode", 
                                           "in_GW_system", 
                                           "in_cow_system", 
                                           "in_polity_system",
                                           "polity_startdate",
                                           "polity_enddate"))

my_weird_democracy_data %>%
  knitr::kable()
```

| country                     | year | my_measure | extended_country_name        | GWn | cown | polity_ccode | in_GW_system | in_cow_system | in_polity_system | polity_startdate | polity_enddate |
|:----------------------------|-----:|-----------:|:-----------------------------|----:|-----:|-------------:|:-------------|:--------------|:-----------------|:-----------------|:---------------|
| Germany                     | 2015 | -0.7497209 | German Federal Republic      | 260 |  255 |          255 | TRUE         | TRUE          | TRUE             | 1990-10-02       | NA             |
| Germany                     | 1930 | -0.7993911 | Germany (Prussia)            | 255 |  255 |          255 | TRUE         | TRUE          | TRUE             | 1871-01-19       | 1945-05-07     |
| Germany                     | 1970 |  1.3525895 | German Federal Republic      | 260 |  260 |          260 | TRUE         | TRUE          | TRUE             | 1945-05-08       | 1990-10-02     |
| Germany                     | 1945 | -0.4160493 | German Federal Republic      | 260 |  260 |          260 | FALSE        | FALSE         | TRUE             | 1945-05-08       | 1990-10-02     |
| East Germany                | 1949 |  0.8083571 | German Democratic Republic   | 265 |  265 |          265 | TRUE         | FALSE         | TRUE             | 1945-05-08       | 1990-10-02     |
| Federal Republic of Germany | 1992 | -0.4667874 | German Federal Republic      | 260 |  255 |          255 | TRUE         | TRUE          | TRUE             | 1990-10-02       | NA             |
| Somaliland                  | 1990 | -0.6657607 | Somaliland                   |  NA |   NA |           NA | FALSE        | FALSE         | FALSE            | NA               | NA             |
| Somalia                     | 1990 |  0.4545968 | Somalia                      | 520 |  520 |          520 | TRUE         | TRUE          | TRUE             | 1960-07-01       | NA             |
| Palestine                   | 1940 | -0.2955224 | British Mandate of Palestine |  NA |   NA |           NA | FALSE        | FALSE         | FALSE            | NA               | NA             |
| Russia                      | 1917 | -0.7007693 | Russia (Soviet Union)        | 365 |  365 |          365 | TRUE         | TRUE          | TRUE             | 1800-01-01       | 1922-12-29     |
| Russia                      | 1912 | -0.4350950 | Russia (Soviet Union)        | 365 |  365 |          365 | TRUE         | TRUE          | TRUE             | 1800-01-01       | 1922-12-29     |
| USSR                        | 1922 |  0.2616003 | Russia (Soviet Union)        | 365 |  365 |          364 | TRUE         | TRUE          | TRUE             | 1922-12-30       | 1991-12-31     |
| Republic of Vietnam         | 1975 |  0.1510076 | Vietnam, Republic of         | 817 |  817 |          817 | FALSE        | FALSE         | TRUE             | 1955-10-26       | 1975-12-31     |
| Yugoslavia                  | 1990 |  1.0474404 | Yugoslavia                   | 345 |  345 |          345 | TRUE         | TRUE          | TRUE             | 1921-01-01       | 1991-07-01     |
| Yugoslavia                  | 1991 |  0.4325583 | Yugoslavia                   | 345 |  345 |          347 | TRUE         | TRUE          | TRUE             | 1991-07-01       | 2003-03-11     |
| Vietnam, South              | 1954 | -0.5879309 | Vietnam, Republic of         | 817 |  817 |          817 | TRUE         | TRUE          | FALSE            | 1955-10-26       | 1975-12-31     |

`country_year_coder` tries to match not just the country name or the
country code (as `countrycode` does), but also to figure out the
appropriate state system code *given* the year. (Above, for example, the
function figures out that Germany 1970 should get a COW code of 260, but
Germany 1992 should get 255 - though it should retain the 260 code in
the Gleditsch and Ward system of states. This is, incidentally, how
`download_fh` adds the correct COW and GW country codes to Freedom
House’s Excel data). It also tries to figure out whether a given
country-year is in the specific state system list. (In the example
above, Germany in 1945 is not listed as a member of the state system in
either COW or Gleditsch and Ward, since it was occupied by the Allies as
of 31 December 1945, but is listed as a member of the state system in
Polity IV as the Federal Republic, though with a polity score of -66,
“interregnum”).

One nice thing about `country_year_coder` (in my humble opinion!) is
that it can sometimes correct country coding errors; I’ve run across
more than one dataset with the supposed COW code 255 for the Federal
Republic of Germany for the period 1955-1990, which would prevent a
clean join to a dataset with the correct COW code, but would be caught
by `country_year_coder`.

There is also a function that allows you to create a blank state system
panel for any of the three main state systems:

``` r
create_panel(system = "cow")
#> # A tibble: 17,036 x 5
#>     cown cow_country_name         cow_startdate cow_enddate  year
#>    <int> <chr>                    <date>        <date>      <dbl>
#>  1     2 United States of America 1816-01-01    NA           1816
#>  2     2 United States of America 1816-01-01    NA           1817
#>  3     2 United States of America 1816-01-01    NA           1818
#>  4     2 United States of America 1816-01-01    NA           1819
#>  5     2 United States of America 1816-01-01    NA           1820
#>  6     2 United States of America 1816-01-01    NA           1821
#>  7     2 United States of America 1816-01-01    NA           1822
#>  8     2 United States of America 1816-01-01    NA           1823
#>  9     2 United States of America 1816-01-01    NA           1824
#> 10     2 United States of America 1816-01-01    NA           1825
#> # ... with 17,026 more rows

create_panel(system = "GW")
#> # A tibble: 19,938 x 5
#>      GWn GW_country_name          GW_startdate GW_enddate  year
#>    <dbl> <chr>                    <date>       <date>     <dbl>
#>  1     2 United States of America 1816-01-01   NA          1816
#>  2     2 United States of America 1816-01-01   NA          1817
#>  3     2 United States of America 1816-01-01   NA          1818
#>  4     2 United States of America 1816-01-01   NA          1819
#>  5     2 United States of America 1816-01-01   NA          1820
#>  6     2 United States of America 1816-01-01   NA          1821
#>  7     2 United States of America 1816-01-01   NA          1822
#>  8     2 United States of America 1816-01-01   NA          1823
#>  9     2 United States of America 1816-01-01   NA          1824
#> 10     2 United States of America 1816-01-01   NA          1825
#> # ... with 19,928 more rows
```

## Citation

The standard `citation` function from base `R` will produce a list of
citations for all the datasets included in this package:

``` r
citation(package = "democracyData")
```

To cite any of the datasets included in this package use:

Acemoglu D, Naidu S, Restrepo P, Robinson JA (2019). “Democracy Does
Cause Growth.” *Journal of Political Economy*, *127*(1), 47-100. doi:
10.1086/700936 (URL: <https://doi.org/10.1086/700936>).

Anckar C, Fredriksson C (2018). “Classifying political regimes
1800-2016: a typology and a new dataset.” *European Political Science*.
doi: 10.1057/s41304-018-0149-8 (URL:
<https://doi.org/10.1057/s41304-018-0149-8>), \<URL:
<https://doi.org/10.1057/s41304-018-0149-8>\>.

Arat ZF (1991). *Democracy and human rights in developing countries*.
Lynne Rienner Publishers, Boulder.

Bell C (2016). “The Rulers, Elections, and Irregular Governance Dataset
(REIGN).” \<URL: <http://oefresearch.org/datasets/reign>\>.

Bernhard M, Nordstrom T, Reenock C (2001). “Economic Performance,
Institutional Intermediation, and Democratic Survival.” *Journal of
Politics*, *63*(3), 775-803. doi: 10.1111/0022-3816.00087 (URL:
<https://doi.org/10.1111/0022-3816.00087>).

Bertelsmann Stiftung (2022). “Transformation Index of the Bertelsmann
Stiftung 2022.” Bertelsmann Stiftung.

Bjørnskov C, Rode M (2020). “Regime types and regime change: A new
dataset on democracy, coups, and political institutions.” *The Review of
International Organizations*, *15*(2), 531-551. doi:
10.1007/s11558-019-09345-1 (URL:
<https://doi.org/10.1007/s11558-019-09345-1>).

Boix C, Miller M, Rosato S (2012). “A Complete Dataset of Political
Regimes, 1800-2007.” *Comparative Political Studies*, *46*(12),
1523-1554. doi: 10.1177/0010414012463905 (URL:
<https://doi.org/10.1177/0010414012463905>).

Bollen KA (2001). “Cross-National Indicators of Liberal Democracy,
1950-1990.”

Bollen K, Paxton P (2000). “Subjective Measures of Liberal Democracy.”
*Comparative Political Studies*, *33*(1), 58-86. doi:
10.1177/0010414000033001003 (URL:
<https://doi.org/10.1177/0010414000033001003>).

Bowman K, Lehoucq F, Mahoney J (2005). “Measuring Political Democracy:
Case Expertise, Data Adequacy, and Central America.” *Comparative
Political Studies*, *38*(8), 939-970. doi: 10.1177/0010414005277083
(URL: <https://doi.org/10.1177/0010414005277083>).

Cheibub J, Gandhi J, Vreeland J (2010). “Democracy and dictatorship
revisited.” *Public Choice*, *143*(1), 67-101. doi:
10.1007/s11127-009-9491-2 (URL:
<https://doi.org/10.1007/s11127-009-9491-2>).

Coppedge M, Alvarez A, Maldonado C (2008). “Two Persistent Dimensions of
Democracy: Contestation and Inclusiveness.” *The journal of politics*,
*70*(03), 632-647. doi: 10.1017/S0022381608080663 (URL:
<https://doi.org/10.1017/S0022381608080663>).

Coppedge M, Gerring J, Knutsen CH, Lindberg SI, Teorell J, Alizada N,
Altman D, Bernhard M, Cornell A, Fish MS, Gastaldi L, Gjerlow H, Glynn
A, Hicken A, Hindle G, Ilchenko N, Krusell J, uhrmann AL, Maerz SF,
Marquardt KL, McMann K, Mechkova V, Medzihorsky J, Paxton P, Pemstein D,
Pernes J, von RÃ¶mer J, Seim B, Sigman R, Skaaning S, Staton J,
SundstrÃ¶m A, Tzelgov E, Wang Y, Wig T, Wilson S, Ziblatt. D (2021).
“V-Dem Country-Year/Country-Date Dataset v11.” \<URL:
<https://www.v-dem.net/en/data/data-version-11/>\>.

Coppedge M, Gerring J, Knutsen CH, Lindberg SI, Teorell J, Altman D,
Bernhard M, Cornell A, Fish MS, Gastaldi L, Gjerlow H, Glynn A, Hicken
A, LÃ¼hrmann A, Maerz SF, Marquardt KL, McMann K, Mechkova V, Paxton P,
Pemstein D, von RÃ¶mer J, Seim B, Sigman R, Skaaning S, Staton J,
SundtrÃ¶m A, Tzelgov E, Uberti L, Wang Y, Wig T, Ziblatt D (2021).
“V-Dem Codebook v11.” \<URL:
<https://www.v-dem.net/en/data/data-version-11/>\>.

Coppedge M, Reinicke WH (1990). “Measuring Polyarchy.” *Studies in
Comparative International Development*, *25*(1), 51-72. doi:
10.1007/Bf02716905 (URL: <https://doi.org/10.1007/Bf02716905>).

Doorenspleet R (2000). “Reassessing the Three Waves of Democratization.”
*World Politics*, *52*(03), 384-406. doi: 10.1017/S0043887100016580
(URL: <https://doi.org/10.1017/S0043887100016580>).

Freedom House (2022). “Freedom in the World 2022: The Global Expansion
of Authoritarian Rule.” Freedom House. \<URL:
<https://freedomhouse.org/report/freedom-world/2022/global-expansion-authoritarian-rule>\>.

Gasiorowski M (1996). “An Overview of the Political Regime Change
Dataset.” *Comparative Political Studies*, *29*(4), 469-483. doi:
10.1177/0010414096029004004 (URL:
<https://doi.org/10.1177/0010414096029004004>).

Geddes B, Wright J, Frantz E (2014). “Autocratic Breakdown and Regime
Transitions: A New Data Set.” *Perspectives on Politics*, *12*(1),
313-331. doi: 10.1017/S1537592714000851 (URL:
<https://doi.org/10.1017/S1537592714000851>).

Gleditsch K, Ward MD (1999). “Interstate system membership: A revised
list of independent states since the congress of Vienna.” *International
Interactions*, *25*(4), 393-413. doi: 10.1080/03050629908434958 (URL:
<https://doi.org/10.1080/03050629908434958>).

Goldstone J, Bates R, Epstein D, Gurr T, Lustik M, Marshall M, Ulfelder
J, Woodward M (2010). “A Global Model for Forecasting Political
Instability.” *American Journal of Political Science*, *54*(1), 190-208.
doi: 10.1111/j.1540-5907.2009.00426.x (URL:
<https://doi.org/10.1111/j.1540-5907.2009.00426.x>).

Gründler K, Krieger T (2016). “Democracy and growth: Evidence from a
machine learning indicator.” *European Journal of Political Economy*,
*45*, 85-107. doi: 10.1016/j.ejpoleco.2016.05.005 (URL:
<https://doi.org/10.1016/j.ejpoleco.2016.05.005>), \<URL:
<http://www.sciencedirect.com/science/article/pii/S0176268016300222>\>.

Gründler K, Krieger T (2018). “Machine Learning Indices, Political
Institutions, and Economic Development.” CESifo Group Munich. \<URL:
<https://www.cesifo-group.de/DocDL/cesifo1_wp6930.pdf>\>.

Gründler K, Krieger T (2021). “Using Machine Learning for measuring
democracy: A practitioners guide and a new updated dataset for 186
countries from 1919 to 2019.” *European Journal of Political Economy*,
102-47. doi: 10.1016/j.ejpoleco.2021.102047 (URL:
<https://doi.org/10.1016/j.ejpoleco.2021.102047>).

Hadenius A (1992). *Democracy and development*. Cambridge University
Press, New York.

Hadenius A, Teorell J (2007). “Pathways from Authoritarianism.” *Journal
of Democracy*, *18*(1), 143-157.

Hsu S (2008). “The Effect of Political Regimes on Inequality,
1963-2002.” *UTIP Working Paper*.

Kailitz S (2013). “Classifying political regimes revisited: legitimation
and durability.” *Democratization*, *20*(1), 39-60. doi:
10.1080/13510347.2013.738861 (URL:
<https://doi.org/10.1080/13510347.2013.738861>).

Kaufmann D, Kraay A (2020). “Worldwide Governance Indicators.” \<URL:
<http://www.govindicators.org>\>.

Magaloni B, Chu J, Min E (2013). “Autocracies of the World, 1950-2012
(Version 1.0).” \<URL:
<http://cddrl.fsi.stanford.edu/research/autocracies_of_the_world_dataset>\>.

Mainwaring S, Brinks D, Pérez-Liñán A (2001). “Classifying Political
Regimes in Latin America.” *Studies in Comparative International
Development*, *36*(1), 37-65. doi: 10.1007/bf02687584 (URL:
<https://doi.org/10.1007/bf02687584>).

Mainwaring S, Pérez-Liñán A, Brinks D (2014). “Political Regimes in
Latin America, 1900-2007 (with Daniel Brinks).” In *Democracies and
Dictatorships in Latin America: Emergence, Survival, and Fall*, chapter
Political Regimes in Latin America, 1900-2007 (with Daniel Brinks).
Cambridge University Press, New York.

Marquez X (2016). “A Quick Method for Extending the Unified Democracy
Scores.” *Available at SSRN 2753830*. \<URL:
<https://papers.ssrn.com/sol3/papers.cfm?abstract_id=2753830>\>.

Márquez X (2020). “democracyData: A package for accessing and
manipulating existing measures of democracy.” \<URL:
<http://github.com/xmarquez/democracyData>\>.

Marshall MG, Gurr TR (2020). *Polity 5: Political Regime Characteristics
and Transitions, 1800-2018. Dataset Users’ Manual.*.

Marshall MG, Gurr TR, Jaggers K (2019). *Polity IV Project: Political
Regime Characteristics and Transitions, 1800-2018. Dataset Users’
Manual.*.

Moon BE, Birdsall JH, Ciesluk S, Garlett LM, Hermias JJ, Mendenhall E,
Schmid PD, Wong WH (2006). “Voting Counts: Participation in the
Measurement of Democracy.” *Studies in Comparative International
Development*, *41*(2), 3-32. doi: 10.1007/BF02686309 (URL:
<https://doi.org/10.1007/BF02686309>).

Munck G (2009). *Measuring Democracy: A Bridge between Scholarship and
Politics*. The Johns Hopkins University Press, Baltimore.

Pemstein D, Meserve SA, Melton J (2013). “Replication data for:
Democratic Compromise: A Latent Variable Analysis of Ten Measures of
Regime Type.” \<URL: <http://hdl.handle.net/1902.1/PMM>\>.

Pemstein D, Meserve S, Melton J (2010). “Democratic Compromise: A Latent
Variable Analysis of Ten Measures of Regime Type.” *Political Analysis*,
*18*(4), 426-449. doi: 10.1093/pan/mpq020 (URL:
<https://doi.org/10.1093/pan/mpq020>).

Przeworski A (2013). “Political Institutions and Political Events (PIPE)
Data Set.” \<URL:
<https://sites.google.com/a/nyu.edu/adam-przeworski/home/data>\>.

Reich G (2002). “Categorizing Political Regimes: New Data for Old
Problems.” *Democratization*, *9*(4), 1-24. doi: 10.1080/714000289 (URL:
<https://doi.org/10.1080/714000289>).

Skaaning S, Gerring J, Bartusevicius H (2015). “A Lexical Index of
Electoral Democracy.” *Comparative Political Studies*, *48*(12),
1491-1525. doi: 10.1177/0010414015581050 (URL:
<https://doi.org/10.1177/0010414015581050>).

Svolik M (2012). *The Politics of Authoritarian Rule*. Cambridge
University Press, Cambridge.

Taylor SJ, Ulfelder J (2015). “A Measurement Error Model of Dichotomous
Democracy Status.” *Available at SSRN*. doi: 10.2139/ssrn.2726962 (URL:
<https://doi.org/10.2139/ssrn.2726962>).

The Economist Intelligence Unit (2022). “Democracy Index 2021: The China
Challenge.” The Economist Intelligence Unit.

Ulfelder J (2012). “Democracy/Autocracy Data Set.” \<URL:
<http://hdl.handle.net/1902.1/18836>\>.

Ulfelder J, Lustik M (2007). “Modelling Transitions To and From
Democracy.” *Democratization*, *14*(3), 351-387. doi:
10.1080/13510340701303196 (URL:
<https://doi.org/10.1080/13510340701303196>).

Vanhanen T (2019). “Measures of Democracy 1810-2018 \[dataset\]. Version
8.0 (2019-06-17).” \<URL: <http://urn.fi/urn:nbn:fi:fsd:T-FSD1289>\>.

Wahman M, Teorell J, Hadenius A (2013). “Authoritarian Regime Types
Revisited: Updated Data in Comparative Perspective.” *Contemporary
Politics*, *19*(1), 19-34. \<URL:
<https://sites.google.com/site/authoritarianregimedataset/data>\>.

To see these entries in BibTeX format, use ‘print(<citation>,
bibtex=TRUE)’, ‘toBibtex(.)’, or set ‘options(citation.bibtex.max=999)’.

You can also find the citation for a specific dataset using the wrapper
`cite_dataset` with the name of the dataset in this package:

``` r
cite_dataset("gwf")
```

\[1\] B. Geddes, J. Wright, and E. Frantz. “Autocratic Breakdown and
Regime Transitions: A New Data Set”. In: *Perspectives on Politics* 12.1
(2014), pp. 313-331. DOI: 10.1017/S1537592714000851.

# Feedback and Caveats

Feedback welcome!

Note that some functions in this package can be quite slow: generating a
full democracy dataset (including downloading Freedom House, Polity, and
WGI) or applying `country_year_coder` to a large data frame both can
take some time. Suggestions to accelerate the code are welcome.

`country_year_coder` fails to give correct answers in some weird edge
cases mostly involving Yugoslavia, Germany, or Vietnam. If you run
across any of these cases, let me know.
