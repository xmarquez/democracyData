
<!-- README.md is generated from README.Rmd. Please edit that file -->
[![Travis-CI Build Status](https://travis-ci.org/xmarquez/democracyData.svg?branch=master)](https://travis-ci.org/xmarquez/democracyData)

democracyData
=============

This package provides a number of functions to access most datasets measuring democracy in use in the scholarly literature. At its core is a set of functions to download and standardize some widely used datasets, including [Polity IV](http://www.systemicpeace.org/inscrdata.html), [Freedom House](https://freedomhouse.org/), [Geddes, Wright, and Frantz' autocratic regimes dataset](http://sites.psu.edu/dictators/), the [Lexical Index of Electoral Democracy](https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/29106), the [DD/ACLP/PACL/CGV dataset](https://sites.google.com/site/joseantoniocheibub/datasets/democracy-and-dictatorship-revisited), and many others.

Installation
------------

The package is only available on Github for now. Install as follows:

    devtools::install_github("xmarquez/democracyData")

Feedback, pull requests, and contributors welcome.

Downloading democracy data
--------------------------

The package offers two mechanisms for downloading democracy data: the `download_*` family of functions (for large, institutional, or frequently updated democracy datasets, like [Polity IV](http://www.systemicpeace.org/inscrdata.html) and [Freedom House](https://freedomhouse.org/)), and the `redownload_*` family of functions for publicly hosted datasets that are not likely to be regularly updated (like [Geddes, Wright, and Frantz' autocratic regimes dataset](http://sites.psu.edu/dictators/), the [Lexical Index of Electoral Democracy](https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/29106), and the [DD/ACLP/PACL/CGV dataset](https://sites.google.com/site/joseantoniocheibub/datasets/democracy-and-dictatorship-revisited)).

For example, we can download and process the Freedom House "Freedom in the World" dataset as follows:

``` r
library(democracyData)

fh <- download_fh(verbose = FALSE)

fh 
#> # A tibble: 8,080 x 11
#>     fh_country  year    cl    pr status fh_total fh_total_reversed
#>          <chr> <dbl> <dbl> <dbl> <fctr>    <dbl>             <dbl>
#>  1 Afghanistan  1972     5     4     PF        9                 5
#>  2 Afghanistan  1973     6     7     NF       13                 1
#>  3 Afghanistan  1974     6     7     NF       13                 1
#>  4 Afghanistan  1975     6     7     NF       13                 1
#>  5 Afghanistan  1976     6     7     NF       13                 1
#>  6 Afghanistan  1977     6     6     NF       12                 2
#>  7 Afghanistan  1978     7     7     NF       14                 0
#>  8 Afghanistan  1979     7     7     NF       14                 0
#>  9 Afghanistan  1980     7     7     NF       14                 0
#> 10 Afghanistan  1982     7     7     NF       14                 0
#> # ... with 8,070 more rows, and 4 more variables:
#> #   extended_country_name <chr>, GWn <dbl>, cown <int>, in_GW_system <lgl>
```

This downloads the latest update of the "Freedom in the World" dataset (1972-2017), puts it in country-year format (extracting the relevant info from the awful Excel table that Freedom House makes available), calculates the variables `fh_total` and `fh_total_reversed`, and adds state system information, including a standardized country name, the [Gleditsch-Ward](http://privatewww.essex.ac.uk/~ksg/statelist.html) country code and the [Correlates of War](http://www.correlatesofwar.org/data-sets/state-system-membership) country code.

You can also download the Freedom House "Electoral Democracies" list (`download_fh_electoral`, updated to 2016), the latest version of the Polity IV dataset (updated to 2016; check `?download_polity`), the latest version of the [World Governance Indicators' "Voice and Accountability" index](http://info.worldbank.org/governance/wgi/index.aspx#home) (`download_wgi_voice_and_accountability`), and the regime part of the [REIGN dataset](http://oefresearch.org/datasets/reign) by Curtis Bell and OEF research (a regularly-updated variation of the original [Geddes, Wright, and Frantz's autocratic regimes dataset](http://sites.psu.edu/dictators/)).

Many other datasets containing democracy measures are not regularly updated, including the widely used [DD/ACLP/PACL/CGV dataset](https://sites.google.com/site/joseantoniocheibub/datasets/democracy-and-dictatorship-revisited) and the [Geddes, Wright, and Frantz's autocratic regimes dataset](http://sites.psu.edu/dictators/). These are available directly from this package (no download required), but they can also be "re-downloaded" from the websites of their creators or maintainers. For example, one can either access PACL directly by typing

``` r
pacl
#> # A tibble: 9,159 x 82
#>    order pacl_country  year aclpcode pacl_cowcode cowcode2 ccdcodelet
#>    <dbl>        <chr> <dbl>    <dbl>        <dbl>    <dbl>      <chr>
#>  1     1  Afghanistan  1946      142          700      700        AFG
#>  2     2  Afghanistan  1947      142          700      700        AFG
#>  3     3  Afghanistan  1948      142          700      700        AFG
#>  4     4  Afghanistan  1949      142          700      700        AFG
#>  5     5  Afghanistan  1950      142          700      700        AFG
#>  6     6  Afghanistan  1951      142          700      700        AFG
#>  7     7  Afghanistan  1952      142          700      700        AFG
#>  8     8  Afghanistan  1953      142          700      700        AFG
#>  9     9  Afghanistan  1954      142          700      700        AFG
#> 10    10  Afghanistan  1955      142          700      700        AFG
#> # ... with 9,149 more rows, and 75 more variables: ccdcodenum <dbl>,
#> #   aclpyear <dbl>, cowcode2year <dbl>, cowcodeyear <dbl>, chgterr <dbl>,
#> #   ychgterr <dbl>, flagc_cowcode2 <dbl>, flage_cowcode2 <dbl>,
#> #   entryy <dbl>, exity <dbl>, cid <dbl>, wdicode <chr>, imf_code <dbl>,
#> #   politycode <dbl>, bankscode <dbl>, dpicode <chr>, uncode <dbl>,
#> #   un_region <dbl>, un_region_name <chr>, un_continent <dbl>,
#> #   un_continent_name <chr>, aclp_region <dbl>, bornyear <dbl>,
#> #   endyear <dbl>, dupcow <dbl>, dupwdi <dbl>, dupun <dbl>, dupdpi <dbl>,
#> #   dupimf <dbl>, dupbanks <dbl>, exselec <dbl>, legselec <dbl>,
#> #   closed <dbl>, dejure <dbl>, defacto <dbl>, defacto2 <dbl>,
#> #   lparty <dbl>, incumb <dbl>, type2 <dbl>, collect <dbl>, nheads <dbl>,
#> #   nmil <dbl>, nhead <chr>, npost <chr>, ndate <chr>, eheads <dbl>,
#> #   ageeh <dbl>, emil <dbl>, royal <dbl>, headdiff <dbl>, ehead <chr>,
#> #   epost <chr>, edate <chr>, tenure08 <dbl>, comm <dbl>, ecens08 <dbl>,
#> #   edeath <dbl>, flageh <dbl>, democracy <dbl>, assconfid <dbl>,
#> #   poppreselec <dbl>, regime <dbl>, tt <dbl>, ttd <dbl>, tta <dbl>,
#> #   flagc <dbl>, flagdem <dbl>, flagreg <dbl>, agedem <dbl>, agereg <dbl>,
#> #   stra <dbl>, extended_country_name <chr>, GWn <dbl>, cown <int>,
#> #   in_GW_system <lgl>
```

Or re-download the dataset from Jose Antonio Cheibub's website as follows:

``` r

pacl_redownloaded <- redownload_pacl(verbose = FALSE)

pacl_redownloaded
#> # A tibble: 9,159 x 82
#>    order pacl_country  year aclpcode pacl_cowcode cowcode2 ccdcodelet
#>    <dbl>        <chr> <dbl>    <dbl>        <dbl>    <dbl>      <chr>
#>  1     1  Afghanistan  1946      142          700      700        AFG
#>  2     2  Afghanistan  1947      142          700      700        AFG
#>  3     3  Afghanistan  1948      142          700      700        AFG
#>  4     4  Afghanistan  1949      142          700      700        AFG
#>  5     5  Afghanistan  1950      142          700      700        AFG
#>  6     6  Afghanistan  1951      142          700      700        AFG
#>  7     7  Afghanistan  1952      142          700      700        AFG
#>  8     8  Afghanistan  1953      142          700      700        AFG
#>  9     9  Afghanistan  1954      142          700      700        AFG
#> 10    10  Afghanistan  1955      142          700      700        AFG
#> # ... with 9,149 more rows, and 75 more variables: ccdcodenum <dbl>,
#> #   aclpyear <dbl>, cowcode2year <dbl>, cowcodeyear <dbl>, chgterr <dbl>,
#> #   ychgterr <dbl>, flagc_cowcode2 <dbl>, flage_cowcode2 <dbl>,
#> #   entryy <dbl>, exity <dbl>, cid <dbl>, wdicode <chr>, imf_code <dbl>,
#> #   politycode <dbl>, bankscode <dbl>, dpicode <chr>, uncode <dbl>,
#> #   un_region <dbl>, un_region_name <chr>, un_continent <dbl>,
#> #   un_continent_name <chr>, aclp_region <dbl>, bornyear <dbl>,
#> #   endyear <dbl>, dupcow <dbl>, dupwdi <dbl>, dupun <dbl>, dupdpi <dbl>,
#> #   dupimf <dbl>, dupbanks <dbl>, exselec <dbl>, legselec <dbl>,
#> #   closed <dbl>, dejure <dbl>, defacto <dbl>, defacto2 <dbl>,
#> #   lparty <dbl>, incumb <dbl>, type2 <dbl>, collect <dbl>, nheads <dbl>,
#> #   nmil <dbl>, nhead <chr>, npost <chr>, ndate <chr>, eheads <dbl>,
#> #   ageeh <dbl>, emil <dbl>, royal <dbl>, headdiff <dbl>, ehead <chr>,
#> #   epost <chr>, edate <chr>, tenure08 <dbl>, comm <dbl>, ecens08 <dbl>,
#> #   edeath <dbl>, flageh <dbl>, democracy <dbl>, assconfid <dbl>,
#> #   poppreselec <dbl>, regime <dbl>, tt <dbl>, ttd <dbl>, tta <dbl>,
#> #   flagc <dbl>, flagdem <dbl>, flagreg <dbl>, agedem <dbl>, agereg <dbl>,
#> #   stra <dbl>, extended_country_name <chr>, GWn <dbl>, cown <int>,
#> #   in_GW_system <lgl>
```

These two data frames should be identical:

``` r

identical(pacl, pacl_redownloaded)
#> [1] TRUE
```

You should thus normally use the "archived" versions of these datasets, unless you want to manipulate the raw data yourself (using the `redownload_*` functions with the option `return_raw = TRUE`), or think they might have been updated since you installed this package.

Other democracy datasets
------------------------

A number of democracy datasets are not available online, usually because they were only ever described in the tables of scholarly articles now found only on JSTOR or in out of print books. These include Zehra Arat's old democracy measure, the Political Regime Change dataset by Gasiorowski (updated by Reich in 2002), the Vanhanen index of democratization, and many others. I have archived most these in this package; for a list of all the datasets available, type `democracy_info`:

``` r
library(dplyr)
#> Warning: package 'dplyr' was built under R version 3.4.2
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

| dataset                   | long\_name                                                                                                    | main\_democracy\_measure\_col                                                          | measure\_type | based\_on       | in\_pmm\_replication | categorical\_regime\_types | user\_extendable | downloadable | included\_in\_package |  first\_published\_use| notes                                                                                                                                                                                                                                                                                                                               |
|:--------------------------|:--------------------------------------------------------------------------------------------------------------|:---------------------------------------------------------------------------------------|:--------------|:----------------|:---------------------|:---------------------------|:-----------------|:-------------|:----------------------|----------------------:|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| arat\_pmm                 | The Arat measure of democracy                                                                                 | pmm\_arat                                                                              | continuous    | NA              | TRUE                 | FALSE                      | FALSE            | FALSE        | TRUE                  |                   1991| Only available via the Pemstein, Meserve, and Melton (2013) replication data. I have not been able to access the original data.                                                                                                                                                                                                     |
| blm                       | The Bowman, Lehoucq, and Mahoney index of democracy for Central America                                       | blm                                                                                    | trichotomous  | NA              | TRUE                 | FALSE                      | FALSE            | TRUE         | TRUE                  |                   2005| NA                                                                                                                                                                                                                                                                                                                                  |
| bmr                       | The Boix-Miller-Rosato dichotomous coding of democracy, 1800-2010, version 2.0                                | democracy,democracy\_omitteddata                                                       | dichotomous   | PACL            | FALSE                | FALSE                      | FALSE            | TRUE         | TRUE                  |                   2010| NA                                                                                                                                                                                                                                                                                                                                  |
| bnr                       | The Bernhard, Nordstrom & Reenock Event History Coding of Democratic Breakdowns                               | event,bnr                                                                              | dichotomous   | NA              | FALSE                | FALSE                      | TRUE             | TRUE         | TRUE                  |                   2001| Can be extended using a full panel of sovereign countries (COW). Extended version included in this package.                                                                                                                                                                                                                         |
| bollen\_pmm               | The Bollen measure of democracy                                                                               | pmm\_bollen                                                                            | continuous    | NA              | TRUE                 | FALSE                      | FALSE            | FALSE        | TRUE                  |                   1978| The original data was compiled in 1978, for Bollen's dissertation; existing data seems to be from the 2000 update. I do not know how much it changed over time. Only available via the Pemstein, Meserve, and Melton (2013) replication data. I have not been able to access the original data.                                     |
| doorenspleet              | Renske Doorenspleet's Democracy Dataset                                                                       | doorenspleet,regime                                                                    | dichotomous   | Polity          | FALSE                | FALSE                      | FALSE            | FALSE        | TRUE                  |                   2000| NA                                                                                                                                                                                                                                                                                                                                  |
| fh                        | Freedom House "Freedom in the World" data from Pemstein, Meserve, and Melton's replication dataset            | status,fh\_total,fh\_total\_reversed                                                   | ordinal       | FH              | TRUE                 | FALSE                      | FALSE            | TRUE         | FALSE                 |                   1973| NA                                                                                                                                                                                                                                                                                                                                  |
| fh\_electoral             | Freedom House "Electoral Democracies" List                                                                    | electoral                                                                              | dichotomous   | PACL            | FALSE                | FALSE                      | FALSE            | TRUE         | FALSE                 |                   1990| The electoral democracy list seems to have only been compiled since the 1990s, but I have not been able to find an exact date of first compilation.                                                                                                                                                                                 |
| gwf                       | The Geddes Wright and Frantz Autocratic Regimes dataset                                                       | gwf\_regimetype,gwf\_nonautocracy                                                      | dichotomous   | PACL            | FALSE                | TRUE                       | TRUE             | TRUE         | TRUE                  |                   2014| Can be extended using the gwf\_duration variable. Extended version included in this package.                                                                                                                                                                                                                                        |
| hadenius\_pmm             | Axel Hadenius' Index of Democracy                                                                             | pmm\_hadenius                                                                          | continuous    | NA              | TRUE                 | FALSE                      | FALSE            | FALSE        | TRUE                  |                   1992| Only available via the Pemstein, Meserve, and Melton (2013) replication data. I have not been able to access the original data.                                                                                                                                                                                                     |
| kailitz                   | The Steffen Kailitz Dataset of Authoritarian Regime Types                                                     | combined\_regime,kailitz\_binary,kailitz\_tri                                          | dichotomous   | NA              | FALSE                | TRUE                       | FALSE            | FALSE        | TRUE                  |                   2013| NA                                                                                                                                                                                                                                                                                                                                  |
| LIED                      | The Lexical Index of Electoral Democracy, v. 3                                                                | lexical\_index                                                                         | ordinal       | PIPE            | FALSE                | FALSE                      | FALSE            | TRUE         | TRUE                  |                   2015| NA                                                                                                                                                                                                                                                                                                                                  |
| magaloni                  | Autocracies of the World, 1950-2012 (Version 1.0).                                                            | demo\_nr,demo\_r,regime\_r,regime\_nr                                                  | dichotomous   | PACL            | FALSE                | TRUE                       | TRUE             | TRUE         | TRUE                  |                   2013| Can be extended using the duration\_nr variable. Extended version included in this package.                                                                                                                                                                                                                                         |
| mainwaring                | Mainwaring, Brinks, and Perez Linan's democracy measure for Latin America                                     | mainwaring,Regime                                                                      | trichotomous  | NA              | TRUE                 | FALSE                      | FALSE            | FALSE        | TRUE                  |                   2001| NA                                                                                                                                                                                                                                                                                                                                  |
| munck\_pmm                | Munck Index of Democracy                                                                                      | pmm\_munck                                                                             | continuous    | NA              | TRUE                 | FALSE                      | FALSE            | FALSE        | TRUE                  |                   2009| Only available via the Pemstein, Meserve, and Melton (2013) replication data. I have not been able to access the original data.                                                                                                                                                                                                     |
| pacl                      | The Democracy and Dictatorship Dataset (DD/PACL/ACLP/CGV)                                                     | democracy,regime                                                                       | dichotomous   | PACL            | TRUE                 | TRUE                       | FALSE            | TRUE         | TRUE                  |                   1996| The original data was first compiled, as far as I know, in the famous ACLP study "Modernization: Theories and Facts" study of 1996. It has been extended and changed by Cheibub, Gandhi, and Vreeland in the latest iteration (2010).                                                                                               |
| peps                      | Participation-Enhanced Polity Score                                                                           | PEPS1i,PEPS2i,PEPS1q,PEPS2q,PEPS1v,PEPS2v,polity1raw,Polity1,Polity2,Polity3           | continuous    | Polity          | FALSE                | FALSE                      | FALSE            | TRUE         | TRUE                  |                   2006| NA                                                                                                                                                                                                                                                                                                                                  |
| PIPE                      | The Political Institutions and Political Events (PIPE) dataset                                                | democracy,democracy2,regime                                                            | dichotomous   | PIPE            | FALSE                | FALSE                      | FALSE            | TRUE         | TRUE                  |                   2010| Democracy measures in PIPE are calculated in this package on the basis of imperfect instructions in the codebook. Use with care.                                                                                                                                                                                                    |
| pitf                      | Political Instability Task Force democracy indicator                                                          | pitf\_binary                                                                           | dichotomous   | Polity          | FALSE                | FALSE                      | FALSE            | FALSE        | TRUE                  |                   2010| Constructed score on the basis of Polity data.                                                                                                                                                                                                                                                                                      |
| pitf                      | Political Instability Task Force democracy indicator                                                          | pitf                                                                                   | ordinal       | Polity          | FALSE                | FALSE                      | FALSE            | FALSE        | TRUE                  |                   2010| Constructed score on the basis of Polity data.                                                                                                                                                                                                                                                                                      |
| polity\_annual            | The Polity IV dataset                                                                                         | polity,polity2                                                                         | ordinal       | Polity          | TRUE                 | FALSE                      | FALSE            | TRUE         | FALSE                 |                   1975| The first compilation of this dataset (POLITY I) was probably first used in a 1975 study by Eckstein and Gurr, but had been collected by Gurr since the late 1960s. The current form of the data is very different from the original Polity I data. The Polity II codebook survives, but I find no record of the Polity I codebook. |
| polyarchy                 | The Polyarchy Scale and the Contestation Scale                                                                | cont,poly                                                                              | ordinal       | NA              | TRUE                 | FALSE                      | FALSE            | TRUE         | TRUE                  |                   1990| NA                                                                                                                                                                                                                                                                                                                                  |
| polyarchy\_dimensions     | Latent Dimensions of Contestation and Inclusiveness by Michael Coppedge, Angel Alvarez, and Claudia Maldonado | CONTEST,INCLUS                                                                         | continuous    | latent variable | FALSE                | FALSE                      | FALSE            | TRUE         | TRUE                  |                   2008| NA                                                                                                                                                                                                                                                                                                                                  |
| prc\_gasiorowski          | The Political Regime Change (PRC) dataset.                                                                    | regime,prc,prc\_at\_end\_year,prc\_at\_beginning\_year                                 | trichotomous  | NA              | TRUE                 | FALSE                      | FALSE            | FALSE        | TRUE                  |                   1996| NA                                                                                                                                                                                                                                                                                                                                  |
| reign                     | The Rulers, Elections, and Irregular Governance (REIGN) dataset, regime characteristics worksheet.            | Type                                                                                   | dichotomous   | GWF             | FALSE                | TRUE                       | FALSE            | TRUE         | FALSE                 |                   2016| NA                                                                                                                                                                                                                                                                                                                                  |
| svolik\_regime            | Milan Svolik's Regime Dataset                                                                                 | regime,regime\_numeric                                                                 | dichotomous   | PACL            | FALSE                | FALSE                      | FALSE            | FALSE        | TRUE                  |                   2012| NA                                                                                                                                                                                                                                                                                                                                  |
| uds                       | The Unified Democracy Scores                                                                                  | mean,median                                                                            | continuous    | latent variable | FALSE                | FALSE                      | TRUE             | TRUE         | TRUE                  |                   2010| Can be extended using the package QuickUDS. (Use "devtools::install\_github("xmarquez/QuickUDS")"; the package is not on CRAN)                                                                                                                                                                                                      |
| ulfelder                  | The Democracy/Autocracy Dataset by Jay Ulfelder                                                               | rgjtype                                                                                | dichotomous   | Polity          | FALSE                | FALSE                      | TRUE             | TRUE         | TRUE                  |                   2007| Can be extended using the rgjdurd and rgjdura variables. Extended version included in this package.                                                                                                                                                                                                                                 |
| utip                      | The University of Texas Inequality Project Categorical Dataset of Political Regimes                           | utip\_trichotomous                                                                     | trichotomous  | NA              | FALSE                | TRUE                       | FALSE            | TRUE         | TRUE                  |                   2008| Both the dichotomous and trichotomous versions of these measures are calculated by this package. The original dataset distinguishes several different types of democracy.                                                                                                                                                           |
| utip                      | The University of Texas Inequality Project Categorical Dataset of Political Regimes                           | utip\_dichotomous,utip\_dichotomous\_strict                                            | dichotomous   | NA              | FALSE                | TRUE                       | FALSE            | TRUE         | TRUE                  |                   2008| Both the dichotomous and trichotomous versions of these measures are calculated by this package. The original dataset distinguishes several different types of democracy.                                                                                                                                                           |
| vanhanen                  | Vanhanen measures of democracy, 1800-2012                                                                     | vanhanen\_democratization                                                              | continuous    | NA              | TRUE                 | FALSE                      | FALSE            | FALSE        | TRUE                  |                   1968| Vanhanen first collected democracy data on 12 countries for his 1968 dissertation. Current data is different from the original data, though it still uses a similar conceptual scheme.                                                                                                                                              |
| vdem                      | The Varieties of Democracy Dataset, version 7.1                                                               | v2x\_polyarchy,v2x\_api,v2x\_mpi,v2x\_libdem,v2x\_partipdem,v2x\_delibdem,v2x\_egaldem | continuous    | NA              | FALSE                | FALSE                      | FALSE            | FALSE        | FALSE                 |                   2015| Can be accessed using the package vdem. (Use "devtools::install\_github("xmarquez/vdem")"; the package is not on CRAN)                                                                                                                                                                                                              |
| wahman\_teorell\_hadenius | Authoritarian Regimes Data Set, version 5.0, by Axel Hadenius, Jan Teorell, & Michael Wahman                  | regime1ny,regime1nyrobust, regimeny, regimenyrobust                                    | dichotomous   | FH,Polity       | FALSE                | TRUE                       | FALSE            | TRUE         | TRUE                  |                   2007| NA                                                                                                                                                                                                                                                                                                                                  |
| wgi\_democracy            | The World Governance Indicators "Voice and Accountability" Index                                              | Estimate                                                                               | continuous    | FH              | FALSE                | FALSE                      | FALSE            | TRUE         | FALSE                 |                   2010| NA                                                                                                                                                                                                                                                                                                                                  |

For example, typing `vanhanen` gives you access to the Vanhanen dataset.

All datasets in this package are fully documented; type `?pacl` for example to see the documentation for the PACL dataset.

Democracy data not available through this package
-------------------------------------------------

I have not included the [Varieties of Democracy](https://www.v-dem.net/en/data/data-version-7-1/) dataset in this pacakge; you can access version 7.1 of this dataset via my [`vdem`](https://github.com/xmarquez/vdem) package (use `devtools::install_github("xmarquez/vdem")` to install).

Combining all democracy datasets
--------------------------------

You can create one huge data frame including all democracy measures with one call:

``` r

democracy_data <- generate_democracy_scores_dataset(output_format = "wide",
                                                    verbose = FALSE)

democracy_data
#> # A tibble: 24,511 x 72
#>    extended_country_name   GWn  cown in_GW_system  year   blm
#>                    <chr> <dbl> <int>        <lgl> <dbl> <dbl>
#>  1              Abkhazia   396    NA        FALSE  1997    NA
#>  2              Abkhazia   396    NA        FALSE  1998    NA
#>  3              Abkhazia   396    NA        FALSE  1999    NA
#>  4              Abkhazia   396    NA        FALSE  2000    NA
#>  5              Abkhazia   396    NA        FALSE  2001    NA
#>  6              Abkhazia   396    NA        FALSE  2002    NA
#>  7              Abkhazia   396    NA        FALSE  2003    NA
#>  8              Abkhazia   396    NA        FALSE  2004    NA
#>  9              Abkhazia   396    NA        FALSE  2005    NA
#> 10              Abkhazia   396    NA        FALSE  2006    NA
#> # ... with 24,501 more rows, and 66 more variables: bmr_democracy <dbl>,
#> #   bmr_democracy_omitteddata <dbl>, bnr <dbl>, bnr_extended <dbl>,
#> #   doorenspleet <dbl>, fh_electoral <dbl>, fh_total_reversed <dbl>,
#> #   gwf_democracy <dbl>, gwf_democracy_extended <dbl>,
#> #   gwf_democracy_extended_strict <dbl>, gwf_democracy_strict <dbl>,
#> #   kailitz_binary <dbl>, kailitz_tri <dbl>, lexical_index <dbl>,
#> #   magaloni_democracy <dbl>, magaloni_democracy_extended <dbl>,
#> #   mainwaring <dbl>, pacl <dbl>, PEPS1i <dbl>, PEPS1q <dbl>,
#> #   PEPS1v <dbl>, PEPS2i <dbl>, PEPS2q <dbl>, PEPS2v <dbl>,
#> #   PIPE_democracy <dbl>, PIPE_regime <dbl>, pitf <dbl>,
#> #   pitf_binary <dbl>, pmm_arat <dbl>, pmm_blm <dbl>, pmm_bollen <dbl>,
#> #   pmm_fh <dbl>, pmm_hadenius <dbl>, pmm_mainwaring <dbl>,
#> #   pmm_munck <dbl>, pmm_pacl <dbl>, pmm_polity <dbl>,
#> #   pmm_polyarchy <dbl>, pmm_prc <dbl>, pmm_vanhanen <dbl>, polity <dbl>,
#> #   polity2 <dbl>, polyarchy_contestation_dimension <dbl>,
#> #   polyarchy_inclusion_dimension <dbl>,
#> #   polyarchy_original_contestation <dbl>,
#> #   polyarchy_original_polyarchy <dbl>, prc <dbl>, reign_democracy <dbl>,
#> #   svolik_democracy <dbl>, uds_2010_mean <dbl>, uds_2010_median <dbl>,
#> #   uds_2011_mean <dbl>, uds_2011_median <dbl>, uds_2014_mean <dbl>,
#> #   uds_2014_median <dbl>, ulfelder_democracy <dbl>,
#> #   ulfelder_democracy_extended <dbl>, utip_dichotomous <dbl>,
#> #   utip_dichotomous_strict <dbl>, utip_trichotomous <dbl>,
#> #   vanhanen_competition <dbl>, vanhanen_democratization <dbl>,
#> #   vanhanen_participation <dbl>, wgi_democracy <dbl>, wth_democ1 <dbl>,
#> #   wth_democrobust <dbl>
```

This can take some time, since it downloads all downloadable datasets (Freedom House, Polity IV, Reign, and the WGI Voice and Accountability index), processes them (adds state system information, puts them in coutnry-year format, fixes wrong codes, etc.), and matches them to all the other datasets. In any case, you can select exactly which datasets to include in your big data frame. See `?generate_democracy_scores_dataset` for further options to customize the output.

State system functions
----------------------

The package also includes a couple of other convenience functions to work with historical democracy data and determine state system membership. The first is `country_year_coder`, which works like the [`countrycode`](https://cran.r-project.org/web/packages/countrycode/index.html) package, except that it is able to determine state system information for country-year pairs. Suppose you have this dataset:

``` r
my_weird_democracy_data <- data_frame(country = c("Germany", "Germany", "Germany", "Germany", "East Germany",
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
#>                        country  year  my_measure
#>                          <chr> <dbl>       <dbl>
#>  1                     Germany  2015 -0.08466199
#>  2                     Germany  1930  0.90163016
#>  3                     Germany  1970 -0.76310542
#>  4                     Germany  1945 -0.35252534
#>  5                East Germany  1949  0.34746712
#>  6 Federal Republic of Germany  1992  1.02917441
#>  7                  Somaliland  1990 -1.13301061
#>  8                     Somalia  1990 -0.14208428
#>  9                   Palestine  1940 -0.12434076
#> 10                      Russia  1917 -1.06084765
#> 11                      Russia  1912  0.22216578
#> 12                        USSR  1922 -1.18678975
#> 13         Republic of Vietnam  1975 -1.98024277
#> 14                  Yugoslavia  1990 -0.81004612
#> 15                  Yugoslavia  1991  0.72589830
#> 16              Vietnam, South  1954 -1.24778650
```

and you then want to add state system information. `country_year_coder` does that for you!

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

| country                     |  year|  my\_measure| extended\_country\_name      |  GWn|  cown|  polity\_ccode| in\_GW\_system | in\_cow\_system | in\_polity\_system | polity\_startdate | polity\_enddate |
|:----------------------------|-----:|------------:|:-----------------------------|----:|-----:|--------------:|:---------------|:----------------|:-------------------|:------------------|:----------------|
| Germany                     |  2015|   -0.0846620| German Federal Republic      |  260|   255|            255| TRUE           | TRUE            | TRUE               | 1990-10-02        | NA              |
| Germany                     |  1930|    0.9016302| Germany (Prussia)            |  255|   255|            255| TRUE           | TRUE            | TRUE               | 1871-01-19        | 1945-05-07      |
| Germany                     |  1970|   -0.7631054| German Federal Republic      |  260|   260|            260| TRUE           | TRUE            | TRUE               | 1945-05-08        | 1990-10-02      |
| Germany                     |  1945|   -0.3525253| German Federal Republic      |  260|   260|            260| FALSE          | FALSE           | TRUE               | 1945-05-08        | 1990-10-02      |
| East Germany                |  1949|    0.3474671| German Democratic Republic   |  265|   265|            265| TRUE           | FALSE           | TRUE               | 1945-05-08        | 1990-10-02      |
| Federal Republic of Germany |  1992|    1.0291744| German Federal Republic      |  260|   255|            255| TRUE           | TRUE            | TRUE               | 1990-10-02        | NA              |
| Somaliland                  |  1990|   -1.1330106| Somaliland                   |   NA|    NA|             NA| FALSE          | FALSE           | FALSE              | NA                | NA              |
| Somalia                     |  1990|   -0.1420843| Somalia                      |  520|   520|            520| TRUE           | TRUE            | TRUE               | 1960-07-01        | NA              |
| Palestine                   |  1940|   -0.1243408| British Mandate of Palestine |   NA|    NA|             NA| FALSE          | FALSE           | FALSE              | NA                | NA              |
| Russia                      |  1917|   -1.0608476| Russia (Soviet Union)        |  365|   365|            365| TRUE           | TRUE            | TRUE               | 1800-01-01        | 1922-12-29      |
| Russia                      |  1912|    0.2221658| Russia (Soviet Union)        |  365|   365|            365| TRUE           | TRUE            | TRUE               | 1800-01-01        | 1922-12-29      |
| USSR                        |  1922|   -1.1867898| Russia (Soviet Union)        |  365|   365|            364| TRUE           | TRUE            | TRUE               | 1922-12-30        | 1991-12-31      |
| Republic of Vietnam         |  1975|   -1.9802428| Vietnam, Republic of         |  817|   817|            817| FALSE          | FALSE           | TRUE               | 1955-10-26        | 1975-12-31      |
| Yugoslavia                  |  1990|   -0.8100461| Yugoslavia                   |  345|   345|            345| TRUE           | TRUE            | TRUE               | 1921-01-01        | 1991-07-01      |
| Yugoslavia                  |  1991|    0.7258983| Yugoslavia                   |  345|   345|            347| TRUE           | TRUE            | TRUE               | 1991-07-01        | 2003-03-11      |
| Vietnam, South              |  1954|   -1.2477865| Vietnam, Republic of         |  817|   817|            817| TRUE           | TRUE            | FALSE              | 1955-10-26        | 1975-12-31      |

`country_year_coder` tries to match not just the country name or the country code (as `countrycode` does), but also to figure out the appropriate state system code *given* the year. (Above, for example, the function figures out that Germany 1970 should get a COW code of 260, but Germany 1992 should get 255 - though it should retain the 260 code in the Gleditsch and Ward system of states. This is, incidentally, how `download_fh` adds the correct COW and GW country codes to Freedom House's Excel data). It also tries to figure out whether a given country-year is in the specific state system list. (In the example above, Germany in 1945 is not listed as a member of the state system in either COW or Gleditsch and Ward, since it was occupied by the Allies as of 31 December 1945, but is listed as a member of the state system in Polity IV as the Federal Republic, though with a polity score of -66, "interregnum").

One nice thing about `country_year_coder` (in my humble opinion!) is that it can sometimes correct country coding errors; I've run across more than one dataset with the supposed COW code 255 for the Federal Republic of Germany for the period 1955-1990, which would prevent a clean join to a dataset with the correct COW code, but would be caught by `country_year_coder`.

There is also a function that allows you to create a blank state system panel for any of the three main state systems:

``` r
create_panel(system = "cow")
#> # A tibble: 16,256 x 5
#>     cown         cow_country_name cow_startdate cow_enddate  year
#>    <int>                    <chr>        <date>      <date> <dbl>
#>  1     2 United States of America    1816-01-01          NA  1816
#>  2     2 United States of America    1816-01-01          NA  1817
#>  3     2 United States of America    1816-01-01          NA  1818
#>  4     2 United States of America    1816-01-01          NA  1819
#>  5     2 United States of America    1816-01-01          NA  1820
#>  6     2 United States of America    1816-01-01          NA  1821
#>  7     2 United States of America    1816-01-01          NA  1822
#>  8     2 United States of America    1816-01-01          NA  1823
#>  9     2 United States of America    1816-01-01          NA  1824
#> 10     2 United States of America    1816-01-01          NA  1825
#> # ... with 16,246 more rows

create_panel(system = "GW")
#> # A tibble: 19,150 x 5
#>      GWn          GW_country_name GW_startdate GW_enddate  year
#>    <dbl>                    <chr>       <date>     <date> <dbl>
#>  1     2 United States of America   1816-01-01         NA  1816
#>  2     2 United States of America   1816-01-01         NA  1817
#>  3     2 United States of America   1816-01-01         NA  1818
#>  4     2 United States of America   1816-01-01         NA  1819
#>  5     2 United States of America   1816-01-01         NA  1820
#>  6     2 United States of America   1816-01-01         NA  1821
#>  7     2 United States of America   1816-01-01         NA  1822
#>  8     2 United States of America   1816-01-01         NA  1823
#>  9     2 United States of America   1816-01-01         NA  1824
#> 10     2 United States of America   1816-01-01         NA  1825
#> # ... with 19,140 more rows
```

Citation
--------

The standard `citation` function from base `R` will produce a list of citations for all the datasets included in this package:

``` r
citation(package = "democracyData")
```

To cite any of the datasets included in this package use:

Arat ZF (1991). *Democracy and human rights in developing countries*. Lynne Rienner Publishers, Boulder.

Bell C (2016). "The Rulers, Elections, and Irregular Governance Dataset (REIGN)." &lt;URL: <http://oefresearch.org/datasets/reign>&gt;.

Bernhard M, Nordstrom T and Reenock C (2001). "Economic Performance, Institutional Intermediation, and Democratic Survival." *Journal of Politics*, *63*(3), pp. 775-803. doi: 10.1111/0022-3816.00087 (URL: <http://doi.org/10.1111/0022-3816.00087>).

Boix C, Miller M and Rosato S (2012). "A Complete Dataset of Political Regimes, 1800-2007." *Comparative Political Studies*, *46*(12), pp. 1523-1554. doi: 10.1177/0010414012463905 (URL: <http://doi.org/10.1177/0010414012463905>).

Bollen KA (2001). "Cross-National Indicators of Liberal Democracy, 1950-1990."

Bollen K and Paxton P (2000). "Subjective Measures of Liberal Democracy." *Comparative Political Studies*, *33*(1), pp. 58-86. doi: 10.1177/0010414000033001003 (URL: <http://doi.org/10.1177/0010414000033001003>).

Bowman K, Lehoucq F and Mahoney J (2005). "Measuring Political Democracy: Case Expertise, Data Adequacy, and Central America." *Comparative Political Studies*, *38*(8), pp. 939-970. doi: 10.1177/0010414005277083 (URL: <http://doi.org/10.1177/0010414005277083>).

Cheibub J, Gandhi J and Vreeland J (2010). "Democracy and dictatorship revisited." *Public Choice*, *143*(1), pp. 67-101. doi: 10.1007/s11127-009-9491-2 (URL: <http://doi.org/10.1007/s11127-009-9491-2>).

Coppedge M, Alvarez A and Maldonado C (2008). "Two Persistent Dimensions of Democracy: Contestation and Inclusiveness." *The journal of politics*, *70*(03), pp. 632-647. doi: 10.1017/S0022381608080663 (URL: <http://doi.org/10.1017/S0022381608080663>).

Coppedge M, Gerring J, Lindberg SI, Skaaning S, Jan Teorell wDA, Bernhard M, Fish MS, Glynn A, Hicken A, Knutsen CH, Kelly McMann, Paxton P, Pemstein D, Staton J, Zimmerman B, Andersson F, Valeriya Mechkova and Miri F (2016). "V-Dem Codebook v6."

Coppedge M, Gerring J, Lindberg SI, Skaaning S, Teorell J, Altman D, Bernhard M, Fish MS, Glynn A, Hicken A, Knutsen CH, Marquardt K, McMann K, Miri F, Paxton P, Pemstein D, Staton J, Tzelgov E, Wang Y and Zimmerman B (2016). "V-Dem \[Country-Year/Country-Date\] Dataset, version 6.1." &lt;URL: <https://www.v-dem.net/en/data/data-version-6-1/>&gt;.

Coppedge M and Reinicke WH (1990). "Measuring Polyarchy." *Studies in Comparative International Development*, *25*(1), pp. 51-72. doi: 10.1007/Bf02716905 (URL: <http://doi.org/10.1007/Bf02716905>).

Doorenspleet R (2000). "Reassessing the Three Waves of Democratization." *World Politics*, *52*(03), pp. 384-406. doi: 10.1017/S0043887100016580 (URL: <http://doi.org/10.1017/S0043887100016580>).

Freedom House (2018). "Freedom in the World 2018: Democracy in Crisis." Freedom House. &lt;URL: <https://freedomhouse.org/sites/default/files/FH_FITW_Report_2018_Final_SinglePage.pdf>&gt;.

Gasiorowski M (1996). "An Overview of the Political Regime Change Dataset." *Comparative Political Studies*, *29*(4), pp. 469-483. doi: 10.1177/0010414096029004004 (URL: <http://doi.org/10.1177/0010414096029004004>).

Geddes B, Wright J and Frantz E (2014). "Autocratic Breakdown and Regime Transitions: A New Data Set." *Perspectives on Politics*, *12*(1), pp. 313-331. doi: 10.1017/S1537592714000851 (URL: <http://doi.org/10.1017/S1537592714000851>).

Gleditsch K and Ward MD (1999). "Interstate system membership: A revised list of independent states since the congress of Vienna." *International Interactions*, *25*(4), pp. 393-413. doi: 10.1080/03050629908434958 (URL: <http://doi.org/10.1080/03050629908434958>).

Goldstone J, Bates R, Epstein D, Gurr T, Lustik M, Marshall M, Ulfelder J and Woodward M (2010). "A Global Model for Forecasting Political Instability." *American Journal of Political Science*, *54*(1), pp. 190-208. doi: 10.1111/j.1540-5907.2009.00426.x (URL: <http://doi.org/10.1111/j.1540-5907.2009.00426.x>).

Hadenius A (1992). *Democracy and development*. Cambridge University Press, New York.

Hadenius A and Teorell J (2007). "Pathways from Authoritarianism." *Journal of Democracy*, *18*(1), pp. 143-157.

Hsu S (2008). "The Effect of Political Regimes on Inequality, 1963-2002." *UTIP Working Paper*.

Kailitz S (2013). "Classifying political regimes revisited: legitimation and durability." *Democratization*, *20*(1), pp. 39-60. doi: 10.1080/13510347.2013.738861 (URL: <http://doi.org/10.1080/13510347.2013.738861>).

Kaufmann D and Kraay A (2017). "Worldwide Governance Indicators." &lt;URL: <http://www.govindicators.org>&gt;.

Magaloni B, Chu J and Min E (2013). "Autocracies of the World, 1950-2012 (Version 1.0)." &lt;URL: <http://cddrl.fsi.stanford.edu/research/autocracies_of_the_world_dataset>&gt;.

Mainwaring S, Brinks D and Pérez-Liñán A (2001). "Classifying Political Regimes in Latin America." *Studies in Comparative International Development*, *36*(1), pp. 37-65. doi: 10.1007/bf02687584 (URL: <http://doi.org/10.1007/bf02687584>).

Mainwaring S, Pérez-Liñán A and Brinks D (2014). "Political Regimes in Latin America, 1900-2007 (with Daniel Brinks)." In *Democracies and Dictatorships in Latin America: Emergence, Survival, and Fall*, chapter Political Regimes in Latin America, 1900-2007 (with Daniel Brinks). Cambridge University Press, New York.

Márquez X (2017). "democracyData: A package for accessing and manipulating existing measures of democracy." &lt;URL: <http://github.com/xmarquez/democracyData>&gt;.

Marshall MG, Gurr TR and Jaggers K (2015). *Polity IV Project: Political Regime Characteristics and Transitions, 1800-2015. Dataset Users' Manual.*.

Moon BE, Birdsall JH, Ciesluk S, Garlett LM, Hermias JJ, Mendenhall E, Schmid PD and Wong WH (2006). "Voting Counts: Participation in the Measurement of Democracy." *Studies in Comparative International Development*, *41*(2), pp. 3-32. doi: 10.1007/BF02686309 (URL: <http://doi.org/10.1007/BF02686309>).

Munck G (2009). *Measuring Democracy: A Bridge between Scholarship and Politics*. The Johns Hopkins University Press, Baltimore.

Pemstein D, Meserve SA and Melton J (2013). "Replication data for: Democratic Compromise: A Latent Variable Analysis of Ten Measures of Regime Type." &lt;URL: <http://hdl.handle.net/1902.1/PMM>&gt;.

Pemstein D, Meserve S and Melton J (2010). "Democratic Compromise: A Latent Variable Analysis of Ten Measures of Regime Type." *Political Analysis*, *18*(4), pp. 426-449. doi: 10.1093/pan/mpq020 (URL: <http://doi.org/10.1093/pan/mpq020>).

Przeworski A (2013). "Political Institutions and Political Events (PIPE) Data Set." &lt;URL: <https://sites.google.com/a/nyu.edu/adam-przeworski/home/data>&gt;.

Reich G (2002). "Categorizing Political Regimes: New Data for Old Problems." *Democratization*, *9*(4), pp. 1-24. doi: 10.1080/714000289 (URL: <http://doi.org/10.1080/714000289>).

Skaaning S, Gerring J and Bartusevicius H (2015). "A Lexical Index of Electoral Democracy." *Comparative Political Studies*, *48*(12), pp. 1491-1525. doi: 10.1177/0010414015581050 (URL: <http://doi.org/10.1177/0010414015581050>).

Svolik M (2012). *The Politics of Authoritarian Rule*. Cambridge University Press, Cambridge.

Taylor SJ and Ulfelder J (2015). "A Measurement Error Model of Dichotomous Democracy Status." *Available at SSRN*. doi: 10.2139/ssrn.2726962 (URL: <http://doi.org/10.2139/ssrn.2726962>).

Ulfelder J (2012). "Democracy/Autocracy Data Set." &lt;URL: <http://hdl.handle.net/1902.1/18836>&gt;.

Ulfelder J and Lustik M (2007). "Modelling Transitions To and From Democracy." *Democratization*, *14*(3), pp. 351-387. doi: 10.1080/13510340701303196 (URL: <http://doi.org/10.1080/13510340701303196>).

Vanhanen T (2014). "Measures of Democracy 1810-2012." &lt;URL: <http://www.fsd.uta.fi/english/data/catalogue/FSD1289/meF1289e.html>&gt;.

Wahman M, Teorell J and Hadenius A (2013). "Authoritarian Regime Types Revisited: Updated Data in Comparative Perspective." *Contemporary Politics*, *19*(1), pp. 19-34. &lt;URL: <https://sites.google.com/site/authoritarianregimedataset/data>&gt;.

To see these entries in BibTeX format, use 'print(<citation>, bibtex=TRUE)', 'toBibtex(.)', or set 'options(citation.bibtex.max=999)'.

You can also find the citation for a specific dataset using the wrapper `cite_dataset` with the name of the dataset in this package:

``` r
cite_dataset("gwf")
```

\[1\] B. Geddes, J. Wright and E. Frantz. "Autocratic Breakdown and Regime Transitions: A New Data Set". In: *Perspectives on Politics* 12.1 (2014), pp. 313-331. DOI: 10.1017/S1537592714000851.

Feedback and Caveats
====================

Feedback welcome! I am trying to get this package ready for submission to CRAN.

Note that some functions in this package can be quite slow: generating a full democracy dataset (including downloading Freedom House, Polity, WGI, and Reign) or applying `country_year_coder` to a large data frame both can take some time. Suggestions to accelerate the code are welcome.

`country_year_coder` fails to give correct answers in some weird edge cases mostly involving Yugoslavia, Germany, or Vietnam. If you run across any of these cases, let me know.
