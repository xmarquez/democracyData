---
output: github_document
encoding: 'UTF-8'
---

<!-- README.md is generated from README.Rmd. Please edit that file -->

  <!-- badges: start -->
  [![R-CMD-check](https://github.com/xmarquez/democracyData/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/xmarquez/democracyData/actions/workflows/R-CMD-check.yaml)
  <!-- badges: end -->



# democracyData

This package archives a large number of datasets measuring democracy in use in the scholarly literature, and it provides functions to access many others. You can use it to access some widely used datasets, including [Polity5](http://www.systemicpeace.org/inscrdata.html), [Freedom House](https://freedomhouse.org/), [Geddes, Wright, and Frantz' autocratic regimes dataset](http://sites.psu.edu/dictators/), the [Lexical Index of Electoral Democracy](https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/29106), the [DD/ACLP/PACL/CGV dataset](https://sites.google.com/site/joseantoniocheibub/datasets/democracy-and-dictatorship-revisited), the main indexes of the [V-Dem dataset](https://www.v-dem.net/vdemds.html), and many others.

## Installation

The package is only available on Github. Install as follows:

```
remotes::install_github("xmarquez/democracyData")

```

## Basic usage

For the vast majority of use cases, you can just type the name of the dataset you require. For example, here's the [DD/ACLP/PACL/CGV](https://sites.google.com/site/joseantoniocheibub/datasets/democracy-and-dictatorship-revisited) dataset:


``` r
library(democracyData)
pacl
#> [38;5;246m# A tibble: 9,159 × 82[39m
#>    order pacl_country  year aclpcode pacl_cowcode cowcode2 ccdcodelet ccdcodenum
#>    [3m[38;5;246m<dbl>[39m[23m [3m[38;5;246m<chr>[39m[23m        [3m[38;5;246m<dbl>[39m[23m    [3m[38;5;246m<dbl>[39m[23m        [3m[38;5;246m<dbl>[39m[23m    [3m[38;5;246m<dbl>[39m[23m [3m[38;5;246m<chr>[39m[23m           [3m[38;5;246m<dbl>[39m[23m
#> [38;5;250m 1[39m     1 Afghanistan   [4m1[24m946      142          700      700 AFG                 1
#> [38;5;250m 2[39m     2 Afghanistan   [4m1[24m947      142          700      700 AFG                 1
#> [38;5;250m 3[39m     3 Afghanistan   [4m1[24m948      142          700      700 AFG                 1
#> [38;5;250m 4[39m     4 Afghanistan   [4m1[24m949      142          700      700 AFG                 1
#> [38;5;250m 5[39m     5 Afghanistan   [4m1[24m950      142          700      700 AFG                 1
#> [38;5;250m 6[39m     6 Afghanistan   [4m1[24m951      142          700      700 AFG                 1
#> [38;5;250m 7[39m     7 Afghanistan   [4m1[24m952      142          700      700 AFG                 1
#> [38;5;250m 8[39m     8 Afghanistan   [4m1[24m953      142          700      700 AFG                 1
#> [38;5;250m 9[39m     9 Afghanistan   [4m1[24m954      142          700      700 AFG                 1
#> [38;5;250m10[39m    10 Afghanistan   [4m1[24m955      142          700      700 AFG                 1
#> [38;5;246m# ℹ 9,149 more rows[39m
#> [38;5;246m# ℹ 74 more variables: aclpyear <dbl>, cowcode2year <dbl>, cowcodeyear <dbl>,[39m
#> [38;5;246m#   chgterr <dbl>, ychgterr <dbl>, flagc_cowcode2 <dbl>, flage_cowcode2 <dbl>,[39m
#> [38;5;246m#   entryy <dbl>, exity <dbl>, cid <dbl>, wdicode <chr>, imf_code <dbl>,[39m
#> [38;5;246m#   politycode <dbl>, bankscode <dbl>, dpicode <chr>, uncode <dbl>,[39m
#> [38;5;246m#   un_region <dbl>, un_region_name <chr>, un_continent <dbl>,[39m
#> [38;5;246m#   un_continent_name <chr>, aclp_region <dbl>, bornyear <dbl>, …[39m
```


``` r
# You can also use an alias:
dd()
#> [38;5;246m# A tibble: 9,159 × 82[39m
#>    order pacl_country  year aclpcode pacl_cowcode cowcode2 ccdcodelet ccdcodenum
#>    [3m[38;5;246m<dbl>[39m[23m [3m[38;5;246m<chr>[39m[23m        [3m[38;5;246m<dbl>[39m[23m    [3m[38;5;246m<dbl>[39m[23m        [3m[38;5;246m<dbl>[39m[23m    [3m[38;5;246m<dbl>[39m[23m [3m[38;5;246m<chr>[39m[23m           [3m[38;5;246m<dbl>[39m[23m
#> [38;5;250m 1[39m     1 Afghanistan   [4m1[24m946      142          700      700 AFG                 1
#> [38;5;250m 2[39m     2 Afghanistan   [4m1[24m947      142          700      700 AFG                 1
#> [38;5;250m 3[39m     3 Afghanistan   [4m1[24m948      142          700      700 AFG                 1
#> [38;5;250m 4[39m     4 Afghanistan   [4m1[24m949      142          700      700 AFG                 1
#> [38;5;250m 5[39m     5 Afghanistan   [4m1[24m950      142          700      700 AFG                 1
#> [38;5;250m 6[39m     6 Afghanistan   [4m1[24m951      142          700      700 AFG                 1
#> [38;5;250m 7[39m     7 Afghanistan   [4m1[24m952      142          700      700 AFG                 1
#> [38;5;250m 8[39m     8 Afghanistan   [4m1[24m953      142          700      700 AFG                 1
#> [38;5;250m 9[39m     9 Afghanistan   [4m1[24m954      142          700      700 AFG                 1
#> [38;5;250m10[39m    10 Afghanistan   [4m1[24m955      142          700      700 AFG                 1
#> [38;5;246m# ℹ 9,149 more rows[39m
#> [38;5;246m# ℹ 74 more variables: aclpyear <dbl>, cowcode2year <dbl>, cowcodeyear <dbl>,[39m
#> [38;5;246m#   chgterr <dbl>, ychgterr <dbl>, flagc_cowcode2 <dbl>, flage_cowcode2 <dbl>,[39m
#> [38;5;246m#   entryy <dbl>, exity <dbl>, cid <dbl>, wdicode <chr>, imf_code <dbl>,[39m
#> [38;5;246m#   politycode <dbl>, bankscode <dbl>, dpicode <chr>, uncode <dbl>,[39m
#> [38;5;246m#   un_region <dbl>, un_region_name <chr>, un_continent <dbl>,[39m
#> [38;5;246m#   un_continent_name <chr>, aclp_region <dbl>, bornyear <dbl>, …[39m
```

Here's [Polity IV](http://www.systemicpeace.org/inscrdata.html):


``` r
polityIV
#> [38;5;246m# A tibble: 17,562 × 40[39m
#>    cyear polityIV_ccode scode polityIV_country  year  flag fragment democ autoc
#>    [3m[38;5;246m<dbl>[39m[23m          [3m[38;5;246m<dbl>[39m[23m [3m[38;5;246m<chr>[39m[23m [3m[38;5;246m<chr>[39m[23m            [3m[38;5;246m<dbl>[39m[23m [3m[38;5;246m<dbl>[39m[23m    [3m[38;5;246m<dbl>[39m[23m [3m[38;5;246m<dbl>[39m[23m [3m[38;5;246m<dbl>[39m[23m
#> [38;5;250m 1[39m [4m2[24m[4m1[24m800              2 USA   United States     [4m1[24m800     0       [31mNA[39m     7     3
#> [38;5;250m 2[39m [4m2[24m[4m1[24m801              2 USA   United States     [4m1[24m801     0       [31mNA[39m     7     3
#> [38;5;250m 3[39m [4m2[24m[4m1[24m802              2 USA   United States     [4m1[24m802     0       [31mNA[39m     7     3
#> [38;5;250m 4[39m [4m2[24m[4m1[24m803              2 USA   United States     [4m1[24m803     0       [31mNA[39m     7     3
#> [38;5;250m 5[39m [4m2[24m[4m1[24m804              2 USA   United States     [4m1[24m804     0       [31mNA[39m     7     3
#> [38;5;250m 6[39m [4m2[24m[4m1[24m805              2 USA   United States     [4m1[24m805     0       [31mNA[39m     7     3
#> [38;5;250m 7[39m [4m2[24m[4m1[24m806              2 USA   United States     [4m1[24m806     0       [31mNA[39m     7     3
#> [38;5;250m 8[39m [4m2[24m[4m1[24m807              2 USA   United States     [4m1[24m807     0       [31mNA[39m     7     3
#> [38;5;250m 9[39m [4m2[24m[4m1[24m808              2 USA   United States     [4m1[24m808     0       [31mNA[39m     7     3
#> [38;5;250m10[39m [4m2[24m[4m1[24m809              2 USA   United States     [4m1[24m809     0       [31mNA[39m     9     0
#> [38;5;246m# ℹ 17,552 more rows[39m
#> [38;5;246m# ℹ 31 more variables: polity <dbl>, polity2 <dbl>, durable <dbl>, xrreg <dbl>,[39m
#> [38;5;246m#   xrcomp <dbl>, xropen <dbl>, xconst <dbl>, parreg <dbl>, parcomp <dbl>,[39m
#> [38;5;246m#   exrec <dbl>, exconst <dbl>, polcomp <dbl>, prior <dbl>, emonth <dbl>,[39m
#> [38;5;246m#   eday <dbl>, eyear <dbl>, eprec <dbl>, interim <dbl>, bmonth <dbl>,[39m
#> [38;5;246m#   bday <dbl>, byear <dbl>, bprec <dbl>, post <dbl>, change <dbl>, d4 <dbl>,[39m
#> [38;5;246m#   sf <dbl>, regtrans <dbl>, extended_country_name <chr>, GWn <dbl>, …[39m
```

And here's a basic version of the V-Dem dataset, including only the 7 main indexes of democracy:


``` r
vdem_simple
#> [38;5;246m# A tibble: 27,913 × 54[39m
#>    vdem_country_name country_text_id country_id  year historical_date project
#>    [3m[38;5;246m<chr>[39m[23m             [3m[38;5;246m<chr>[39m[23m                [3m[38;5;246m<dbl>[39m[23m [3m[38;5;246m<dbl>[39m[23m [3m[38;5;246m<date>[39m[23m            [3m[38;5;246m<dbl>[39m[23m
#> [38;5;250m 1[39m Mexico            MEX                      3  [4m1[24m789 1789-12-31            1
#> [38;5;250m 2[39m Mexico            MEX                      3  [4m1[24m790 1790-12-31            1
#> [38;5;250m 3[39m Mexico            MEX                      3  [4m1[24m791 1791-12-31            1
#> [38;5;250m 4[39m Mexico            MEX                      3  [4m1[24m792 1792-12-31            1
#> [38;5;250m 5[39m Mexico            MEX                      3  [4m1[24m793 1793-12-31            1
#> [38;5;250m 6[39m Mexico            MEX                      3  [4m1[24m794 1794-12-31            1
#> [38;5;250m 7[39m Mexico            MEX                      3  [4m1[24m795 1795-12-31            1
#> [38;5;250m 8[39m Mexico            MEX                      3  [4m1[24m796 1796-12-31            1
#> [38;5;250m 9[39m Mexico            MEX                      3  [4m1[24m797 1797-12-31            1
#> [38;5;250m10[39m Mexico            MEX                      3  [4m1[24m798 1798-12-31            1
#> [38;5;246m# ℹ 27,903 more rows[39m
#> [38;5;246m# ℹ 48 more variables: historical <dbl>, histname <chr>, codingstart <dbl>,[39m
#> [38;5;246m#   codingend <dbl>, codingstart_contemp <dbl>, codingend_contemp <dbl>,[39m
#> [38;5;246m#   codingstart_hist <dbl>, codingend_hist <dbl>, gapstart1 <dbl>,[39m
#> [38;5;246m#   gapstart2 <dbl>, gapstart3 <dbl>, gapend1 <dbl>, gapend2 <dbl>,[39m
#> [38;5;246m#   gapend3 <dbl>, gap_index <dbl>, vdem_cowcode <dbl>, v2x_polyarchy <dbl>,[39m
#> [38;5;246m#   v2x_polyarchy_codelow <dbl>, v2x_polyarchy_codehigh <dbl>, …[39m
```

All datasets in this package are fully documented; type `?pacl` for example to see the documentation for the PACL dataset.

## Downloading democracy data

Though all datasets can be accessed directly from this package, most datasets can also be downloaded directly from the internet, including the family of datasets released by [Freedom House](https://freedomhouse.org/) and the full V-Dem dataset. To download the Freedom House dataset, use the the `download_*` family of functions; to download the full V-Dem dataset, use the [vdemdata](https://github.com/vdeminstitute/vdemdata) package. The package *does* include the main indexes of version 15.0 of V-Dem (see `vdem_simple`), so you don't need to use the [vdemdata](https://github.com/vdeminstitute/vdemdata) package if you are only interested in the higher-level indexes of democracy. You can also download directly the latest versions of the World Bank's Voice and Accountability Index from the [World Governance Indicators](http://info.worldbank.org/governance/wgi/) and [Polity5](http://www.systemicpeace.org/inscrdata.html), though there are also archived versions of these two in the package.

For example, we can download and process the Freedom House "Freedom in the World" dataset as follows:


``` r
fh_downloaded <- download_fh(verbose = FALSE)

fh_downloaded 
#> [38;5;246m# A tibble: 9,435 × 11[39m
#>    fh_country   year    pr    cl status fh_total fh_total_reversed
#>    [3m[38;5;246m<chr>[39m[23m       [3m[38;5;246m<dbl>[39m[23m [3m[38;5;246m<dbl>[39m[23m [3m[38;5;246m<dbl>[39m[23m [3m[38;5;246m<fct>[39m[23m     [3m[38;5;246m<dbl>[39m[23m             [3m[38;5;246m<dbl>[39m[23m
#> [38;5;250m 1[39m Afghanistan  [4m1[24m972     4     5 PF            9                 5
#> [38;5;250m 2[39m Afghanistan  [4m1[24m973     7     6 NF           13                 1
#> [38;5;250m 3[39m Afghanistan  [4m1[24m974     7     6 NF           13                 1
#> [38;5;250m 4[39m Afghanistan  [4m1[24m975     7     6 NF           13                 1
#> [38;5;250m 5[39m Afghanistan  [4m1[24m976     7     6 NF           13                 1
#> [38;5;250m 6[39m Afghanistan  [4m1[24m977     6     6 NF           12                 2
#> [38;5;250m 7[39m Afghanistan  [4m1[24m978     7     7 NF           14                 0
#> [38;5;250m 8[39m Afghanistan  [4m1[24m979     7     7 NF           14                 0
#> [38;5;250m 9[39m Afghanistan  [4m1[24m980     7     7 NF           14                 0
#> [38;5;250m10[39m Afghanistan  [4m1[24m982     7     7 NF           14                 0
#> [38;5;246m# ℹ 9,425 more rows[39m
#> [38;5;246m# ℹ 4 more variables: extended_country_name <chr>, GWn <dbl>, cown <dbl>,[39m
#> [38;5;246m#   in_GW_system <lgl>[39m
```

This downloads the latest update of the "Freedom in the World" dataset (1972-2021, corresponding to the 2022 report), puts it in country-year format (extracting the relevant info from the awful Excel table that Freedom House makes available), calculates the variables `fh_total` and `fh_total_reversed`, and adds state system information, including a standardized country name, the [Gleditsch-Ward](http://privatewww.essex.ac.uk/~ksg/statelist.html) country code and the [Correlates of War](http://www.correlatesofwar.org/data-sets/state-system-membership) country code. You can also, however, use the archived version (`fh`):



``` r
identical(fh_downloaded, fh)
#> [1] FALSE

fh
#> [38;5;246m# A tibble: 9,966 × 11[39m
#>    fh_country   year    pr    cl status fh_total fh_total_reversed
#>    [3m[38;5;246m<chr>[39m[23m       [3m[38;5;246m<dbl>[39m[23m [3m[38;5;246m<dbl>[39m[23m [3m[38;5;246m<dbl>[39m[23m [3m[38;5;246m<fct>[39m[23m     [3m[38;5;246m<dbl>[39m[23m             [3m[38;5;246m<dbl>[39m[23m
#> [38;5;250m 1[39m Afghanistan  [4m1[24m972     4     5 PF            9                 5
#> [38;5;250m 2[39m Afghanistan  [4m1[24m973     7     6 NF           13                 1
#> [38;5;250m 3[39m Afghanistan  [4m1[24m974     7     6 NF           13                 1
#> [38;5;250m 4[39m Afghanistan  [4m1[24m975     7     6 NF           13                 1
#> [38;5;250m 5[39m Afghanistan  [4m1[24m976     7     6 NF           13                 1
#> [38;5;250m 6[39m Afghanistan  [4m1[24m977     6     6 NF           12                 2
#> [38;5;250m 7[39m Afghanistan  [4m1[24m978     7     7 NF           14                 0
#> [38;5;250m 8[39m Afghanistan  [4m1[24m979     7     7 NF           14                 0
#> [38;5;250m 9[39m Afghanistan  [4m1[24m980     7     7 NF           14                 0
#> [38;5;250m10[39m Afghanistan  [4m1[24m982     7     7 NF           14                 0
#> [38;5;246m# ℹ 9,956 more rows[39m
#> [38;5;246m# ℹ 4 more variables: extended_country_name <chr>, GWn <dbl>, cown <dbl>,[39m
#> [38;5;246m#   in_GW_system <lgl>[39m
```

Other democracy datasets can often also be "re-downloaded" from the websites of their creators or maintainers if required. For example, one can either access PACL directly by typing


``` r
pacl
#> [38;5;246m# A tibble: 9,159 × 82[39m
#>    order pacl_country  year aclpcode pacl_cowcode cowcode2 ccdcodelet ccdcodenum
#>    [3m[38;5;246m<dbl>[39m[23m [3m[38;5;246m<chr>[39m[23m        [3m[38;5;246m<dbl>[39m[23m    [3m[38;5;246m<dbl>[39m[23m        [3m[38;5;246m<dbl>[39m[23m    [3m[38;5;246m<dbl>[39m[23m [3m[38;5;246m<chr>[39m[23m           [3m[38;5;246m<dbl>[39m[23m
#> [38;5;250m 1[39m     1 Afghanistan   [4m1[24m946      142          700      700 AFG                 1
#> [38;5;250m 2[39m     2 Afghanistan   [4m1[24m947      142          700      700 AFG                 1
#> [38;5;250m 3[39m     3 Afghanistan   [4m1[24m948      142          700      700 AFG                 1
#> [38;5;250m 4[39m     4 Afghanistan   [4m1[24m949      142          700      700 AFG                 1
#> [38;5;250m 5[39m     5 Afghanistan   [4m1[24m950      142          700      700 AFG                 1
#> [38;5;250m 6[39m     6 Afghanistan   [4m1[24m951      142          700      700 AFG                 1
#> [38;5;250m 7[39m     7 Afghanistan   [4m1[24m952      142          700      700 AFG                 1
#> [38;5;250m 8[39m     8 Afghanistan   [4m1[24m953      142          700      700 AFG                 1
#> [38;5;250m 9[39m     9 Afghanistan   [4m1[24m954      142          700      700 AFG                 1
#> [38;5;250m10[39m    10 Afghanistan   [4m1[24m955      142          700      700 AFG                 1
#> [38;5;246m# ℹ 9,149 more rows[39m
#> [38;5;246m# ℹ 74 more variables: aclpyear <dbl>, cowcode2year <dbl>, cowcodeyear <dbl>,[39m
#> [38;5;246m#   chgterr <dbl>, ychgterr <dbl>, flagc_cowcode2 <dbl>, flage_cowcode2 <dbl>,[39m
#> [38;5;246m#   entryy <dbl>, exity <dbl>, cid <dbl>, wdicode <chr>, imf_code <dbl>,[39m
#> [38;5;246m#   politycode <dbl>, bankscode <dbl>, dpicode <chr>, uncode <dbl>,[39m
#> [38;5;246m#   un_region <dbl>, un_region_name <chr>, un_continent <dbl>,[39m
#> [38;5;246m#   un_continent_name <chr>, aclp_region <dbl>, bornyear <dbl>, …[39m
```

Or re-download the dataset from Jose Antonio Cheibub's website as follows:


``` r

pacl_redownloaded <- redownload_pacl(verbose = FALSE)

pacl_redownloaded
#> [38;5;246m# A tibble: 9,159 × 82[39m
#>    order pacl_country  year aclpcode pacl_cowcode cowcode2 ccdcodelet ccdcodenum
#>    [3m[38;5;246m<dbl>[39m[23m [3m[38;5;246m<chr>[39m[23m        [3m[38;5;246m<dbl>[39m[23m    [3m[38;5;246m<dbl>[39m[23m        [3m[38;5;246m<dbl>[39m[23m    [3m[38;5;246m<dbl>[39m[23m [3m[38;5;246m<chr>[39m[23m           [3m[38;5;246m<dbl>[39m[23m
#> [38;5;250m 1[39m     1 Afghanistan   [4m1[24m946      142          700      700 AFG                 1
#> [38;5;250m 2[39m     2 Afghanistan   [4m1[24m947      142          700      700 AFG                 1
#> [38;5;250m 3[39m     3 Afghanistan   [4m1[24m948      142          700      700 AFG                 1
#> [38;5;250m 4[39m     4 Afghanistan   [4m1[24m949      142          700      700 AFG                 1
#> [38;5;250m 5[39m     5 Afghanistan   [4m1[24m950      142          700      700 AFG                 1
#> [38;5;250m 6[39m     6 Afghanistan   [4m1[24m951      142          700      700 AFG                 1
#> [38;5;250m 7[39m     7 Afghanistan   [4m1[24m952      142          700      700 AFG                 1
#> [38;5;250m 8[39m     8 Afghanistan   [4m1[24m953      142          700      700 AFG                 1
#> [38;5;250m 9[39m     9 Afghanistan   [4m1[24m954      142          700      700 AFG                 1
#> [38;5;250m10[39m    10 Afghanistan   [4m1[24m955      142          700      700 AFG                 1
#> [38;5;246m# ℹ 9,149 more rows[39m
#> [38;5;246m# ℹ 74 more variables: aclpyear <dbl>, cowcode2year <dbl>, cowcodeyear <dbl>,[39m
#> [38;5;246m#   chgterr <dbl>, ychgterr <dbl>, flagc_cowcode2 <dbl>, flage_cowcode2 <dbl>,[39m
#> [38;5;246m#   entryy <dbl>, exity <dbl>, cid <dbl>, wdicode <chr>, imf_code <dbl>,[39m
#> [38;5;246m#   politycode <dbl>, bankscode <dbl>, dpicode <chr>, uncode <dbl>,[39m
#> [38;5;246m#   un_region <dbl>, un_region_name <chr>, un_continent <dbl>,[39m
#> [38;5;246m#   un_continent_name <chr>, aclp_region <dbl>, bornyear <dbl>, …[39m
```

These two data frames should be identical:


``` r

identical(pacl, pacl_redownloaded)
#> [1] TRUE
```

You should thus normally use the "archived" versions of these datasets, unless you want to manipulate the raw data yourself (using the `redownload_*` functions with the option `return_raw = TRUE`), or think they might have been updated since you installed this package. 

## Included democracy datasets

For a list of all the democracy datasets available through this package, type `democracy_info`:


``` r
library(dplyr)

democracy_info %>%
  knitr::kable()
```



|dataset                 |long_name                                                                                                     |main_democracy_measure_col                                                      |measure_type |based_on        |in_pmm_replication |categorical_regime_types |user_extendable |downloadable |included_in_package | first_published_use|source_link                                                                                                                                        |licensing_info           |notes                                                                                                                                                                                                                                                                                                                                   |
|:-----------------------|:-------------------------------------------------------------------------------------------------------------|:-------------------------------------------------------------------------------|:------------|:---------------|:------------------|:------------------------|:---------------|:------------|:-------------------|-------------------:|:--------------------------------------------------------------------------------------------------------------------------------------------------|:------------------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|anckar                  |The Anckar-Fredriksson dataset of political regimes                                                           |democracy                                                                       |dichotomous  |bmr             |FALSE              |TRUE                     |FALSE           |TRUE         |TRUE                |                2018|https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/7SSSAH&version=2.0                                                        |CC0 1.0                  |The democracy measure should be equivalent to democracy_omitteddata from bmr up to 2010; it may have some divergences for the 2011-2016 period.                                                                                                                                                                                         |
|anrr                    |The Acemoglu, Naidu, Restrepo, and Robinson dataset                                                           |dem                                                                             |dichotomous  |FH,Polity       |FALSE              |FALSE                    |TRUE            |FALSE        |TRUE                |                2019|https://www.journals.uchicago.edu/doi/full/10.1086/700936                                                                                          |Unknown. Assumed CC0 1.0 |The measure can be extended by using the latest FH, Polity, and PACL Data, but the rules are not entirely transparent, and some cases in the original dataset have been hand-coded.                                                                                                                                                     |
|arat_pmm                |The Arat measure of democracy                                                                                 |pmm_arat                                                                        |continuous   |NA              |TRUE               |FALSE                    |FALSE           |FALSE        |TRUE                |                1991|NA                                                                                                                                                 |Unknown. Assumed CC0 1.0 |Only available via the Pemstein, Meserve, and Melton (2013) replication data. I have not been able to access the original data.                                                                                                                                                                                                         |
|blm                     |The Bowman, Lehoucq, and Mahoney index of democracy for Central America                                       |blm                                                                             |trichotomous |NA              |TRUE               |FALSE                    |FALSE           |FALSE        |TRUE                |                2005|NA                                                                                                                                                 |Unknown. Assumed CC0 1.0 |This used to be downloadable; the website hosting it is down, however.                                                                                                                                                                                                                                                                  |
|bmr                     |The Boix-Miller-Rosato dichotomous coding of democracy, 1800-2015, version 4.0                                |democracy,democracy_omitteddata,democracy_femalesuffrage                        |dichotomous  |PACL            |FALSE              |FALSE                    |FALSE           |TRUE         |TRUE                |                2010|https://sites.google.com/site/mkmtwo/data                                                                                                          |Unknown. Assumed CC0 1.0 |NA                                                                                                                                                                                                                                                                                                                                      |
|bnr                     |The Bernhard, Nordstrom & Reenock Event History Coding of Democratic Breakdowns                               |event,bnr                                                                       |dichotomous  |NA              |FALSE              |FALSE                    |TRUE            |FALSE        |TRUE                |                2001|NA                                                                                                                                                 |Unknown. Assumed CC0 1.0 |Can be extended using a full panel of sovereign countries  (COW). Extended version included in this package. This used to be downloadable; the website hosting it is down, however.                                                                                                                                                     |
|bti                     |The Berteslmann Index of Political transformation                                                             |SI_Democracy_Status                                                             |continuous   |NA              |FALSE              |FALSE                    |FALSE           |TRUE         |TRUE                |                2006|https://bti-project.org/fileadmin/api/content/en/downloads/data/BTI_2006-2022_Scores.xlsx                                                          |Unknown.                 |NA                                                                                                                                                                                                                                                                                                                                      |
|bollen_pmm              |The Bollen measure of democracy                                                                               |pmm_bollen                                                                      |continuous   |NA              |TRUE               |FALSE                    |FALSE           |FALSE        |TRUE                |                1978|NA                                                                                                                                                 |Unknown. Assumed CC0 1.0 |The original data was compiled in 1978, for Bollen's dissertation; existing data seems to be from the 2000 update. I do not know how much it changed over time. Only available via the Pemstein, Meserve, and Melton (2013) replication data. I have not been able to access the original data.                                         |
|doorenspleet            |Renske Doorenspleet's Democracy Dataset                                                                       |doorenspleet,regime                                                             |dichotomous  |Polity          |FALSE              |FALSE                    |FALSE           |FALSE        |TRUE                |                2000|https://www.cambridge.org/core/journals/world-politics/article/abs/reassessing-the-three-waves-of-democratization/25A6CB38E6746F98D882DFC43A54D211 |Unknown. Assumed CC0 1.0 |NA                                                                                                                                                                                                                                                                                                                                      |
|eiu                     |The Economist Intelligence Unit's Democracy Index                                                             |eiu                                                                             |continuous   |NA              |FALSE              |FALSE                    |FALSE           |FALSE        |TRUE                |                2006|NA                                                                                                                                                 |Unknown.                 |The original data has to be manually extracted from the tables in the EIU's pdf report on the index.                                                                                                                                                                                                                                    |
|fh                      |Freedom House "Freedom in the World" data                                                                     |status,fh_total,fh_total_reversed                                               |ordinal      |FH              |TRUE               |FALSE                    |FALSE           |TRUE         |FALSE               |                1973|https://freedomhouse.org/reports/publication-archives                                                                                              |Unknown.                 |NA                                                                                                                                                                                                                                                                                                                                      |
|fh_full                 |Freedom House "Freedom in the World" data                                                                     |total                                                                           |continuous   |FH              |FALSE              |FALSE                    |FALSE           |TRUE         |FALSE               |                2013|NA                                                                                                                                                 |Unknown.                 |This is the 0-100 score Freedom House uses for its more aggregated ratings. Freedom House changed its methodology in 2013, so the full data is different for this period; full data from 2003-2012 is available in their website, but is not yet included in this package.                                                              |
|fh_electoral            |Freedom House "Electoral Democracies" List                                                                    |electoral                                                                       |dichotomous  |FH              |FALSE              |FALSE                    |FALSE           |TRUE         |FALSE               |                1990|NA                                                                                                                                                 |Unknown.                 |The electoral democracy list seems to have only been compiled since the 1990s, but I have not been able to find an exact date of first compilation.                                                                                                                                                                                     |
|gwf                     |The Geddes Wright and Frantz Autocratic Regimes dataset                                                       |gwf_regimetype,gwf_nonautocracy                                                 |dichotomous  |PACL            |FALSE              |TRUE                     |TRUE            |TRUE         |TRUE                |                2014|http://sites.psu.edu/dictators/                                                                                                                    |Unknown. Assumed CC0 1.0 |Can be extended using the gwf_duration variable. Extended version included in this package.                                                                                                                                                                                                                                             |
|hadenius_pmm            |Axel Hadenius' Index of Democracy                                                                             |pmm_hadenius                                                                    |continuous   |NA              |TRUE               |FALSE                    |FALSE           |FALSE        |TRUE                |                1992|NA                                                                                                                                                 |Unknown. Assumed CC0 1.0 |Only available via the Pemstein, Meserve, and Melton (2013) replication data. I have not been able to access the original data.                                                                                                                                                                                                         |
|kailitz                 |The Steffen Kailitz Dataset of Authoritarian Regime Types                                                     |combined_regime,kailitz_binary,kailitz_tri                                      |dichotomous  |NA              |FALSE              |TRUE                     |FALSE           |FALSE        |TRUE                |                2013|https://journals.sagepub.com/doi/full/10.1177/0192512115616830                                                                                     |Unknown.                 |NA                                                                                                                                                                                                                                                                                                                                      |
|LIED                    |The Lexical Index of Electoral Democracy, v. 3                                                                |lexical_index                                                                   |ordinal      |PIPE            |FALSE              |FALSE                    |FALSE           |TRUE         |TRUE                |                2015|https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/WPKNIT                                                                    |CC0 1.0                  |NA                                                                                                                                                                                                                                                                                                                                      |
|magaloni                |Autocracies of the World, 1950-2012 (Version 1.0).                                                            |demo_nr,demo_r,regime_r,regime_nr                                               |dichotomous  |PACL            |FALSE              |TRUE                     |TRUE            |TRUE         |TRUE                |                2013|http://cddrl.fsi.stanford.edu/research/autocracies_of_the_world_dataset/                                                                           |Unknown. Assumed CC0 1.0 |Can be extended using the duration_nr variable. Extended version included in this package.                                                                                                                                                                                                                                              |
|mainwaring              |Mainwaring, Brinks, and Perez Linan's democracy measure for Latin America                                     |mainwaring,Regime                                                               |trichotomous |NA              |TRUE               |FALSE                    |FALSE           |FALSE        |TRUE                |                2001|NA                                                                                                                                                 |Unknown. Assumed CC0 1.0 |NA                                                                                                                                                                                                                                                                                                                                      |
|munck_pmm               |Munck Index of Democracy                                                                                      |pmm_munck                                                                       |continuous   |NA              |TRUE               |FALSE                    |FALSE           |FALSE        |TRUE                |                2009|NA                                                                                                                                                 |Unknown. Assumed CC0 1.0 |Only available via the Pemstein, Meserve, and Melton (2013) replication data. I have not been able to access the original data.                                                                                                                                                                                                         |
|pacl, pacl_update       |The Democracy and Dictatorship Dataset (DD/PACL/ACLP/CGV)                                                     |democracy,regime,Democracy,DD_regime,DD_category                                |dichotomous  |PACL            |TRUE               |TRUE                     |FALSE           |TRUE         |TRUE                |                1996|http://www.christianbjoernskov.com/bjoernskovrodedata/, https://uofi.box.com/shared/static/bba3968d7c3397c024ec.dta                                |Unknown. Assumed CC0 1.0 |The original data was first compiled, as far as I know, for the famous ACLP study "Modernization: Theories and Facts" study of 1996. It was extended and changed by Cheibub, Gandhi, and Vreeland in 2010 (pacl dataset) and further updated by  Bjornskov and Rode (2020; pacl_update dataset), who added new institutional variables. |
|peps                    |Participation-Enhanced Polity Score                                                                           |PEPS1i,PEPS2i,PEPS1q,PEPS2q,PEPS1v,PEPS2v,polity1raw,Polity1,Polity2,Polity3    |continuous   |Polity          |FALSE              |FALSE                    |FALSE           |TRUE         |TRUE                |                2006|http://www.lehigh.edu/~bm05/democracy/PEPS1pub.dta                                                                                                 |Unknown. Assumed CC0 1.0 |NA                                                                                                                                                                                                                                                                                                                                      |
|PIPE                    |The Political Institutions and Political Events (PIPE) dataset                                                |democracy,democracy2,regime                                                     |dichotomous  |PIPE            |FALSE              |FALSE                    |FALSE           |FALSE        |TRUE                |                2010|https://sites.google.com/a/nyu.edu/adam-przeworski/home/data                                                                                       |Unknown. Assumed CC0 1.0 |Democracy measures in PIPE are calculated in this package on the basis of imperfect instructions in the codebook.  Use with care. This used to be downloadable; the link no longer works, however.                                                                                                                                      |
|pitf                    |Political Instability Task Force democracy indicator                                                          |pitf_binary                                                                     |dichotomous  |Polity          |FALSE              |FALSE                    |FALSE           |FALSE        |TRUE                |                2010|http://www.systemicpeace.org/inscr/                                                                                                                |Unknown. Assumed CC0 1.0 |Constructed score on the basis of Polity data.                                                                                                                                                                                                                                                                                          |
|pitf                    |Political Instability Task Force democracy indicator                                                          |pitf                                                                            |ordinal      |Polity          |FALSE              |FALSE                    |FALSE           |FALSE        |TRUE                |                2010|http://www.systemicpeace.org/inscr/                                                                                                                |Unknown. Assumed CC0 1.0 |Constructed score on the basis of Polity data.                                                                                                                                                                                                                                                                                          |
|polityIV                |The Polity IV dataset                                                                                         |polity,polity2                                                                  |ordinal      |Polity          |TRUE               |FALSE                    |FALSE           |TRUE         |TRUE                |                1975|http://www.systemicpeace.org/inscr/                                                                                                                |Unknown. Assumed CC0 1.0 |The first compilation of this dataset (POLITY I) was probably first used in a 1975 study by Eckstein and Gurr, but had been collected by Gurr since the late 1960s. The current form of the data is very different from the original Polity I data. The Polity II codebook survives, but I find no record of the Polity I codebook.     |
|polity_annual           |The Polity5 dataset                                                                                           |polity,polity2                                                                  |ordinal      |Polity          |TRUE               |FALSE                    |FALSE           |TRUE         |FALSE               |                1975|http://www.systemicpeace.org/inscr/                                                                                                                |Unknown. Assumed CC0 1.0 |The first compilation of this dataset (POLITY I) was probably first used in a 1975 study by Eckstein and Gurr, but had been collected by Gurr since the late 1960s. The current form of the data is very different from the original Polity I data. The Polity II codebook survives, but I find no record of the Polity I codebook.     |
|polyarchy               |The Polyarchy Scale and the Contestation Scale                                                                |cont,poly                                                                       |ordinal      |NA              |TRUE               |FALSE                    |FALSE           |TRUE         |TRUE                |                1990|https://www3.nd.edu/~mcoppedg/crd/poly8500.sav                                                                                                     |Unknown. Assumed CC0 1.0 |NA                                                                                                                                                                                                                                                                                                                                      |
|polyarchy_dimensions    |Latent Dimensions of Contestation and Inclusiveness by Michael Coppedge, Angel Alvarez, and Claudia Maldonado |CONTEST,INCLUS                                                                  |continuous   |latent variable |FALSE              |FALSE                    |FALSE           |TRUE         |TRUE                |                2008|http://www3.nd.edu/~mcoppedg/crd/DahlDims.sav                                                                                                      |Unknown. Assumed CC0 1.0 |NA                                                                                                                                                                                                                                                                                                                                      |
|prc_gasiorowski         |The Political Regime Change (PRC) dataset.                                                                    |regime,prc,prc_at_end_year,prc_at_beginning_year                                |trichotomous |NA              |TRUE               |FALSE                    |FALSE           |FALSE        |TRUE                |                1996|NA                                                                                                                                                 |Unknown. Assumed CC0 1.0 |NA                                                                                                                                                                                                                                                                                                                                      |
|reign                   |The Rulers, Elections, and Irregular Governance (REIGN) dataset, regime characteristics worksheet.            |gwf_regimetype                                                                  |dichotomous  |GWF             |FALSE              |TRUE                     |FALSE           |TRUE         |TRUE                |                2016|https://github.com/OEFDataScience/REIGN.github.io                                                                                                  |Unknown. Assumed CC0 1.0 |Archived here now, since collection has stopped.                                                                                                                                                                                                                                                                                        |
|svmdi                   |Suport Vector Machine Democracy Index by Grundler and Krieger                                                 |svmdi, csvmdi                                                                   |continuous   |latent variable |FALSE              |FALSE                    |FALSE           |TRUE         |TRUE                |                2016|https://ml-democracy-index.net/                                                                                                                    |Unknown. Assumed CC0 1.0 |NA                                                                                                                                                                                                                                                                                                                                      |
|svmdi                   |Suport Vector Machine Democracy Index by Grundler and Krieger                                                 |dsvmdi                                                                          |dichotomous  |latent variable |FALSE              |FALSE                    |FALSE           |TRUE         |TRUE                |                2016|https://ml-democracy-index.net/                                                                                                                    |Unknown. Assumed CC0 1.0 |NA                                                                                                                                                                                                                                                                                                                                      |
|svolik_regime           |Milan Svolik's Regime Dataset                                                                                 |regime,regime_numeric                                                           |dichotomous  |PACL            |FALSE              |FALSE                    |FALSE           |FALSE        |TRUE                |                2012|https://campuspress.yale.edu/svolik/the-politics-of-authoritarian-rule/                                                                            |Unknown. Assumed CC0 1.0 |NA                                                                                                                                                                                                                                                                                                                                      |
|uds                     |The Unified Democracy Scores                                                                                  |mean,median                                                                     |continuous   |latent variable |FALSE              |FALSE                    |TRUE            |FALSE        |TRUE                |                2010|NA                                                                                                                                                 |Unknown. Assumed CC0 1.0 |Can be extended using the methods described in this package's "Replicating and Extending the UD scores of Pemstein, Meserve, and Melton" article (https://xmarquez.github.io/democracyData/articles/articles/Replicating_and_extending_the_UD_scores.html)                                                                              |
|ulfelder                |The Democracy/Autocracy Dataset by Jay Ulfelder                                                               |rgjtype                                                                         |dichotomous  |Polity          |FALSE              |FALSE                    |TRUE            |TRUE         |TRUE                |                2007|https://dataverse.harvard.edu/dataset.xhtml?persistentId=hdl:1902.1/18836                                                                          |CC0 1.0                  |Can be extended using the rgjdurd and rgjdura variables. Extended version included in this package.                                                                                                                                                                                                                                     |
|utip                    |The University of Texas Inequality Project Categorical Dataset of Political Regimes                           |utip_trichotomous                                                               |trichotomous |NA              |FALSE              |TRUE                     |FALSE           |TRUE         |TRUE                |                2008|http://utip.lbj.utexas.edu/datasets.html                                                                                                           |Unknown. Assumed CC0 1.0 |Both the dichotomous and trichotomous versions of these measures are calculated by this package. The original dataset distinguishes several different types of democracy.                                                                                                                                                               |
|utip                    |The University of Texas Inequality Project Categorical Dataset of Political Regimes                           |utip_dichotomous,utip_dichotomous_strict                                        |dichotomous  |NA              |FALSE              |TRUE                     |FALSE           |TRUE         |TRUE                |                2008|http://utip.lbj.utexas.edu/datasets.html                                                                                                           |Unknown. Assumed CC0 1.0 |Both the dichotomous and trichotomous versions of these measures are calculated by this package. The original dataset distinguishes several different types of democracy.                                                                                                                                                               |
|vanhanen                |Vanhanen measures of democracy, 1800-2018                                                                     |vanhanen_democratization                                                        |continuous   |NA              |TRUE               |FALSE                    |FALSE           |FALSE        |TRUE                |                1968|https://services.fsd.tuni.fi/catalogue/FSD1289?lang=en&study_language=en                                                                           |CC-BY 4.0                |Vanhanen first collected democracy data on 12 countries for his 1968 dissertation. Current data is different from the original data, though it still uses a similar conceptual scheme.                                                                                                                                                  |
|vaporeg                 |The Varieties of Political Regimes dataset by Kailitz                                                         |vaporeg_dem                                                                     |dichotomous  |NA              |FALSE              |TRUE                     |FALSE           |FALSE        |TRUE                |                2024|https://www.va-poreg.de/                                                                                                                           |Unknown. Assumed CC0 1.0 |This revises and extends the Kailitz dataset of political regimes.                                                                                                                                                                                                                                                                      |
|vdem                    |The Varieties of Democracy Dataset, version 14                                                                |v2x_polyarchy,v2x_api,v2x_mpi,v2x_libdem,v2x_partipdem,v2x_delibdem,v2x_egaldem |continuous   |NA              |FALSE              |FALSE                    |FALSE           |FALSE        |TRUE                |                2015|https://www.v-dem.net/data/the-v-dem-dataset/                                                                                                      |CC-BY-SA 4.0             |The full dataset be accessed using the package vdemdata. (Use "remotes::install_github("vdeminstitute/vdemdata")"; the package is not on CRAN)                                                                                                                                                                                          |
|wahman_teorell_hadenius |Authoritarian Regimes Data Set, version 5.0, by Axel Hadenius, Jan Teorell, & Michael Wahman                  |regime1ny,regime1nyrobust, regimeny, regimenyrobust                             |dichotomous  |FH,Polity       |FALSE              |TRUE                     |FALSE           |TRUE         |TRUE                |                2007|https://sites.google.com/site/authoritarianregimedataset/data                                                                                      |Unknown. Assumed CC0 1.0 |NA                                                                                                                                                                                                                                                                                                                                      |
|wgi_democracy           |The World Governance Indicators "Voice and Accountability" Index                                              |Estimate                                                                        |continuous   |FH              |FALSE              |FALSE                    |FALSE           |TRUE         |TRUE                |                2010|http://info.worldbank.org/governance/wgi/                                                                                                          |Unknown.                 |NA                                                                                                                                                                                                                                                                                                                                      |



## Combining all democracy datasets

You can create one huge data frame including all democracy measures with one call:


``` r

democracy_data <- generate_democracy_scores_dataset(output_format = "wide",
                                                    verbose = FALSE)
#> [38;5;246m# A tibble: 54 × 5[39m
#> [38;5;246m# Groups:   extended_country_name, original_country_name [8][39m
#>    extended_country_name original_country_name dataset   `min(year)` `max(year)`
#>    [3m[38;5;246m<chr>[39m[23m                 [3m[38;5;246m<chr>[39m[23m                 [3m[38;5;246m<chr>[39m[23m           [3m[38;5;246m<dbl>[39m[23m       [3m[38;5;246m<dbl>[39m[23m
#> [38;5;250m 1[39m Italy/Sardinia        ITA                   ulfelder         [4m1[24m948        [4m2[24m010
#> [38;5;250m 2[39m Italy/Sardinia        ITALY                 anckar           [4m1[24m861        [4m2[24m019
#> [38;5;250m 3[39m Italy/Sardinia        ITALY                 bmr              [4m1[24m861        [4m2[24m020
#> [38;5;250m 4[39m Italy/Sardinia        Italy                 LIED             [4m1[24m861        [4m2[24m023
#> [38;5;250m 5[39m Italy/Sardinia        Italy                 PIPE             [4m1[24m816        [4m2[24m008
#> [38;5;250m 6[39m Italy/Sardinia        Italy                 REIGN            [4m1[24m945        [4m2[24m020
#> [38;5;250m 7[39m Italy/Sardinia        Italy                 anrr             [4m1[24m960        [4m2[24m010
#> [38;5;250m 8[39m Italy/Sardinia        Italy                 arat             [4m1[24m948        [4m1[24m982
#> [38;5;250m 9[39m Italy/Sardinia        Italy                 arat_pmm         [4m1[24m948        [4m1[24m982
#> [38;5;250m10[39m Italy/Sardinia        Italy                 bnr              [4m1[24m913        [4m2[24m005
#> [38;5;250m11[39m Italy/Sardinia        Italy                 bollen_p…        [4m1[24m950        [4m1[24m980
#> [38;5;250m12[39m Italy/Sardinia        Italy                 doorensp…        [4m1[24m861        [4m1[24m994
#> [38;5;250m13[39m Italy/Sardinia        Italy                 eiu              [4m2[24m006        [4m2[24m024
#> [38;5;250m14[39m Italy/Sardinia        Italy                 fh               [4m1[24m972        [4m2[24m024
#> [38;5;250m15[39m Italy/Sardinia        Italy                 fh_elect…        [4m1[24m989        [4m2[24m023
#> [38;5;250m16[39m Italy/Sardinia        Italy                 fh_pmm           [4m1[24m972        [4m2[24m008
#> [38;5;250m17[39m Italy/Sardinia        Italy                 gwf              [4m1[24m947        [4m2[24m010
#> [38;5;250m18[39m Italy/Sardinia        Italy                 magaloni         [4m1[24m946        [4m2[24m012
#> [38;5;250m19[39m Italy/Sardinia        Italy                 pacl             [4m1[24m946        [4m2[24m008
#> [38;5;250m20[39m Italy/Sardinia        Italy                 pacl_pmm         [4m1[24m946        [4m2[24m008
#> [38;5;250m21[39m Italy/Sardinia        Italy                 pacl_upd…        [4m1[24m950        [4m2[24m020
#> [38;5;250m22[39m Italy/Sardinia        Italy                 peps             [4m1[24m861        [4m2[24m003
#> [38;5;250m23[39m Italy/Sardinia        Italy                 pitf             [4m1[24m861        [4m2[24m018
#> [38;5;250m24[39m Italy/Sardinia        Italy                 polity5          [4m1[24m861        [4m2[24m018
#> [38;5;250m25[39m Italy/Sardinia        Italy                 polityIV         [4m1[24m861        [4m2[24m018
#> [38;5;250m26[39m Italy/Sardinia        Italy                 polity_p…        [4m1[24m946        [4m2[24m008
#> [38;5;250m27[39m Italy/Sardinia        Italy                 polyarchy        [4m1[24m985        [4m2[24m000
#> [38;5;250m28[39m Italy/Sardinia        Italy                 polyarch…        [4m1[24m950        [4m2[24m000
#> [38;5;250m29[39m Italy/Sardinia        Italy                 polyarch…        [4m1[24m985        [4m2[24m000
#> [38;5;250m30[39m Italy/Sardinia        Italy                 prc_gasi…        [4m1[24m870        [4m1[24m998
#> [38;5;250m31[39m Italy/Sardinia        Italy                 prc_pmm          [4m1[24m946        [4m1[24m998
#> [38;5;250m32[39m Italy/Sardinia        Italy                 svmdi            [4m1[24m919        [4m2[24m019
#> [38;5;250m33[39m Italy/Sardinia        Italy                 svmdi_20…        [4m1[24m981        [4m2[24m011
#> [38;5;250m34[39m Italy/Sardinia        Italy                 svolik_r…        [4m1[24m946        [4m2[24m008
#> [38;5;250m35[39m Italy/Sardinia        Italy                 uds_2010         [4m1[24m946        [4m2[24m000
#> [38;5;250m36[39m Italy/Sardinia        Italy                 uds_2011         [4m1[24m946        [4m2[24m008
#> [38;5;250m37[39m Italy/Sardinia        Italy                 uds_2014         [4m1[24m946        [4m2[24m012
#> [38;5;250m38[39m Italy/Sardinia        Italy                 utip             [4m1[24m963        [4m2[24m005
#> [38;5;250m39[39m Italy/Sardinia        Italy                 vanhanen         [4m1[24m861        [4m2[24m018
#> [38;5;250m40[39m Italy/Sardinia        Italy                 vanhanen…        [4m1[24m946        [4m2[24m008
#> [38;5;250m41[39m Italy/Sardinia        Italy                 vaporeg          [4m1[24m900        [4m2[24m024
#> [38;5;250m42[39m Italy/Sardinia        Italy                 vdem             [4m1[24m862        [4m2[24m024
#> [38;5;250m43[39m Italy/Sardinia        Italy                 wahman_t…        [4m1[24m972        [4m2[24m014
#> [38;5;250m44[39m Italy/Sardinia        Italy                 wgi_demo…        [4m1[24m996        [4m2[24m023
#> [38;5;250m45[39m Italy/Sardinia        Italy/Sardinia        kailitz          [4m1[24m946        [4m2[24m010
#> [38;5;250m46[39m Italy/Sardinia        Piedmont-Sardinia     vdem             [4m1[24m816        [4m1[24m860
#> [38;5;250m47[39m Italy/Sardinia        SARDINIA              bmr              [4m1[24m815        [4m1[24m860
#> [38;5;250m48[39m Italy/Sardinia        Sardinia              LIED             [4m1[24m790        [4m1[24m860
#> [38;5;250m49[39m Italy/Sardinia        Sardinia              doorensp…        [4m1[24m815        [4m1[24m860
#> [38;5;250m50[39m Italy/Sardinia        Sardinia              peps             [4m1[24m815        [4m1[24m860
#> [38;5;250m51[39m Italy/Sardinia        Sardinia              pitf             [4m1[24m815        [4m1[24m860
#> [38;5;250m52[39m Italy/Sardinia        Sardinia              polity5          [4m1[24m815        [4m1[24m860
#> [38;5;250m53[39m Italy/Sardinia        Sardinia              polityIV         [4m1[24m815        [4m1[24m860
#> [38;5;250m54[39m Piedmont-Sardinia     Piedmont-Sardinia     vdem             [4m1[24m789        [4m1[24m815

democracy_data
#> [38;5;246m# A tibble: 40,422 × 90[39m
#>    extended_country_name   GWn  cown in_GW_system  year anckar_democracy
#>    [3m[38;5;246m<chr>[39m[23m                 [3m[38;5;246m<dbl>[39m[23m [3m[38;5;246m<dbl>[39m[23m [3m[38;5;246m<lgl>[39m[23m        [3m[38;5;246m<dbl>[39m[23m            [3m[38;5;246m<dbl>[39m[23m
#> [38;5;250m 1[39m Abkhazia                396    [31mNA[39m FALSE         [4m1[24m997               [31mNA[39m
#> [38;5;250m 2[39m Abkhazia                396    [31mNA[39m FALSE         [4m1[24m998               [31mNA[39m
#> [38;5;250m 3[39m Abkhazia                396    [31mNA[39m FALSE         [4m1[24m999               [31mNA[39m
#> [38;5;250m 4[39m Abkhazia                396    [31mNA[39m FALSE         [4m2[24m000               [31mNA[39m
#> [38;5;250m 5[39m Abkhazia                396    [31mNA[39m FALSE         [4m2[24m001               [31mNA[39m
#> [38;5;250m 6[39m Abkhazia                396    [31mNA[39m FALSE         [4m2[24m002               [31mNA[39m
#> [38;5;250m 7[39m Abkhazia                396    [31mNA[39m FALSE         [4m2[24m003               [31mNA[39m
#> [38;5;250m 8[39m Abkhazia                396    [31mNA[39m FALSE         [4m2[24m004               [31mNA[39m
#> [38;5;250m 9[39m Abkhazia                396    [31mNA[39m FALSE         [4m2[24m005               [31mNA[39m
#> [38;5;250m10[39m Abkhazia                396    [31mNA[39m FALSE         [4m2[24m006               [31mNA[39m
#> [38;5;246m# ℹ 40,412 more rows[39m
#> [38;5;246m# ℹ 84 more variables: anrr_democracy <dbl>, arat <dbl>, pmm_arat <dbl>,[39m
#> [38;5;246m#   blm <dbl>, pmm_blm <dbl>, bmr_democracy <dbl>,[39m
#> [38;5;246m#   bmr_democracy_femalesuffrage <dbl>, bmr_democracy_omitteddata <dbl>,[39m
#> [38;5;246m#   bnr_extended <dbl>, pmm_bollen <dbl>, bti <dbl>, doorenspleet <dbl>,[39m
#> [38;5;246m#   eiu <dbl>, fh_total_reversed <dbl>, fh_electoral <dbl>, pmm_fh <dbl>,[39m
#> [38;5;246m#   gwf_democracy_extended <dbl>, gwf_democracy_extended_strict <dbl>, …[39m
```

This can take some time, since it downloads all downloadable datasets (Freedom House, Polity 5, and the WGI Voice and Accountability index), processes them (adds state system information, puts them in country-year format, fixes wrong codes, etc.), and matches them to all the other datasets. In any case, you can select exactly which datasets to include in your big data frame. See `?generate_democracy_scores_dataset` for further options to customize the output.


## Latent Variable Indexes of Democracy

The package also offers a series of convenience functions to calculate latent variable indexes of democracy (following Pemstein, Meserve, and Melton's [2010 article](https://www.jstor.org/stable/25792023?seq=1) "Democratic Compromise: A Latent Variable Analysis of Ten Measures of Regime Type"); see the vignette on [Replicating and Extending the UD scores of Pemstein, Meserve, and Melton](https://xmarquez.github.io/democracyData/articles/Replicating_and_extending_the_UD_scores.html). It also contains a pre-calculated extended version of these scores, available as `extended_uds`:


``` r
extended_uds
#> [38;5;246m# A tibble: 37,213 × 20[39m
#>    extended_country_name   GWn  cown in_GW_system  year     z1 se_z1 z1_pct975
#>    [3m[38;5;246m<chr>[39m[23m                 [3m[38;5;246m<dbl>[39m[23m [3m[38;5;246m<dbl>[39m[23m [3m[38;5;246m<lgl>[39m[23m        [3m[38;5;246m<dbl>[39m[23m  [3m[38;5;246m<dbl>[39m[23m [3m[38;5;246m<dbl>[39m[23m     [3m[38;5;246m<dbl>[39m[23m
#> [38;5;250m 1[39m Abkhazia                396    [31mNA[39m FALSE         [4m1[24m997 0.033[4m1[24m 0.326     0.673
#> [38;5;250m 2[39m Abkhazia                396    [31mNA[39m FALSE         [4m1[24m998 0.033[4m1[24m 0.326     0.673
#> [38;5;250m 3[39m Abkhazia                396    [31mNA[39m FALSE         [4m1[24m999 0.033[4m1[24m 0.326     0.673
#> [38;5;250m 4[39m Abkhazia                396    [31mNA[39m FALSE         [4m2[24m000 0.033[4m1[24m 0.326     0.673
#> [38;5;250m 5[39m Abkhazia                396    [31mNA[39m FALSE         [4m2[24m001 0.033[4m1[24m 0.326     0.673
#> [38;5;250m 6[39m Abkhazia                396    [31mNA[39m FALSE         [4m2[24m002 0.033[4m1[24m 0.326     0.673
#> [38;5;250m 7[39m Abkhazia                396    [31mNA[39m FALSE         [4m2[24m003 0.033[4m1[24m 0.326     0.673
#> [38;5;250m 8[39m Abkhazia                396    [31mNA[39m FALSE         [4m2[24m004 0.033[4m1[24m 0.326     0.673
#> [38;5;250m 9[39m Abkhazia                396    [31mNA[39m FALSE         [4m2[24m005 0.236  0.325     0.872
#> [38;5;250m10[39m Abkhazia                396    [31mNA[39m FALSE         [4m2[24m006 0.236  0.325     0.872
#> [38;5;246m# ℹ 37,203 more rows[39m
#> [38;5;246m# ℹ 12 more variables: z1_pct025 <dbl>, z1_adj <dbl>, z1_pct975_adj <dbl>,[39m
#> [38;5;246m#   z1_pct025_adj <dbl>, z1_as_prob <dbl>, z1_pct975_as_prob <dbl>,[39m
#> [38;5;246m#   z1_pct025_as_prob <dbl>, z1_adj_as_prob <dbl>, z1_pct975_adj_as_prob <dbl>,[39m
#> [38;5;246m#   z1_pct025_adj_as_prob <dbl>, num_measures <int>, measures <list>[39m
```


## State system functions

The package also includes a couple of other convenience functions to work with historical democracy data and determine state system membership. The first is `country_year_coder`, which works like the [`countrycode`](https://CRAN.R-project.org/package=countrycode) package, except that it is able to determine state system information for country-year pairs. Suppose you have this dataset:


``` r
my_weird_democracy_data <- tibble(
  country = c("Germany", "Germany", "Germany",
              "Germany", "East Germany",
              "Federal Republic of Germany",
              "Somaliland", "Somalia",
              "Palestine", "Russia",
              "Russia", "USSR",
              "Republic of Vietnam",
              "Yugoslavia", 'Yugoslavia',
              "Vietnam, South"),
  year = c( 2015, 1930, 1970, 1945, 1949,
            1992, 1990, 1990, 1940, 1917, 
            1912, 1922, 1975, 1990, 1991, 1954),
  my_measure = rnorm(16))


my_weird_democracy_data
#> [38;5;246m# A tibble: 16 × 3[39m
#>    country                      year my_measure
#>    [3m[38;5;246m<chr>[39m[23m                       [3m[38;5;246m<dbl>[39m[23m      [3m[38;5;246m<dbl>[39m[23m
#> [38;5;250m 1[39m Germany                      [4m2[24m015     -[31m0[39m[31m.[39m[31m619[39m
#> [38;5;250m 2[39m Germany                      [4m1[24m930      1.09 
#> [38;5;250m 3[39m Germany                      [4m1[24m970      0.122
#> [38;5;250m 4[39m Germany                      [4m1[24m945     -[31m0[39m[31m.[39m[31m675[39m
#> [38;5;250m 5[39m East Germany                 [4m1[24m949      0.738
#> [38;5;250m 6[39m Federal Republic of Germany  [4m1[24m992      1.27 
#> [38;5;250m 7[39m Somaliland                   [4m1[24m990      0.269
#> [38;5;250m 8[39m Somalia                      [4m1[24m990     -[31m0[39m[31m.[39m[31m903[39m
#> [38;5;250m 9[39m Palestine                    [4m1[24m940     -[31m1[39m[31m.[39m[31m56[39m 
#> [38;5;250m10[39m Russia                       [4m1[24m917      1.07 
#> [38;5;250m11[39m Russia                       [4m1[24m912      0.672
#> [38;5;250m12[39m USSR                         [4m1[24m922      0.520
#> [38;5;250m13[39m Republic of Vietnam          [4m1[24m975     -[31m0[39m[31m.[39m[31m839[39m
#> [38;5;250m14[39m Yugoslavia                   [4m1[24m990      1.05 
#> [38;5;250m15[39m Yugoslavia                   [4m1[24m991      0.930
#> [38;5;250m16[39m Vietnam, South               [4m1[24m954      0.821
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



|country                     | year| my_measure|extended_country_name        | GWn| cown| polity_ccode|in_GW_system |in_cow_system |in_polity_system |polity_startdate |polity_enddate |
|:---------------------------|----:|----------:|:----------------------------|---:|----:|------------:|:------------|:-------------|:----------------|:----------------|:--------------|
|Germany                     | 2015| -0.6192199|German Federal Republic      | 260|  255|          255|TRUE         |TRUE          |TRUE             |1990-10-02       |NA             |
|Germany                     | 1930|  1.0851215|Germany (Prussia)            | 255|  255|          255|TRUE         |TRUE          |TRUE             |1871-01-19       |1945-05-07     |
|Germany                     | 1970|  0.1218000|German Federal Republic      | 260|  260|          260|TRUE         |TRUE          |TRUE             |1945-05-08       |1990-10-02     |
|Germany                     | 1945| -0.6754851|German Federal Republic      | 260|  260|          260|FALSE        |FALSE         |TRUE             |1945-05-08       |1990-10-02     |
|East Germany                | 1949|  0.7381801|German Democratic Republic   | 265|  265|          265|TRUE         |FALSE         |TRUE             |1945-05-08       |1990-10-02     |
|Federal Republic of Germany | 1992|  1.2725994|German Federal Republic      | 260|  255|          255|TRUE         |TRUE          |TRUE             |1990-10-02       |NA             |
|Somaliland                  | 1990|  0.2686498|Somaliland                   |  NA|   NA|           NA|FALSE        |FALSE         |FALSE            |NA               |NA             |
|Somalia                     | 1990| -0.9029828|Somalia                      | 520|  520|          520|TRUE         |TRUE          |TRUE             |1960-07-01       |NA             |
|Palestine                   | 1940| -1.5598790|British Mandate of Palestine |  NA|   NA|           NA|FALSE        |FALSE         |FALSE            |NA               |NA             |
|Russia                      | 1917|  1.0681591|Russia (Soviet Union)        | 365|  365|          365|TRUE         |TRUE          |TRUE             |1800-01-01       |1922-12-29     |
|Russia                      | 1912|  0.6722994|Russia (Soviet Union)        | 365|  365|          365|TRUE         |TRUE          |TRUE             |1800-01-01       |1922-12-29     |
|USSR                        | 1922|  0.5196266|Russia (Soviet Union)        | 365|  365|          364|TRUE         |TRUE          |TRUE             |1922-12-30       |1991-12-31     |
|Republic of Vietnam         | 1975| -0.8392874|Vietnam, Republic of         | 817|  817|          817|FALSE        |FALSE         |TRUE             |1955-10-26       |1975-12-31     |
|Yugoslavia                  | 1990|  1.0511973|Yugoslavia                   | 345|  345|          345|TRUE         |TRUE          |TRUE             |1921-01-01       |1991-07-01     |
|Yugoslavia                  | 1991|  0.9295251|Yugoslavia                   | 345|  345|          347|TRUE         |TRUE          |TRUE             |1991-07-01       |2003-03-11     |
|Vietnam, South              | 1954|  0.8213013|Vietnam, Republic of         | 817|  817|          817|TRUE         |TRUE          |FALSE            |1955-10-26       |1975-12-31     |



`country_year_coder` tries to match not just the country name or the country code (as `countrycode` does), but also to figure out the appropriate state system code *given* the year. (Above, for example, the function figures out that Germany 1970 should get a COW code of 260, but Germany 1992 should get 255 - though it should retain the 260 code in the Gleditsch and Ward system of states. This is, incidentally, how `download_fh` adds the correct COW and GW country codes to Freedom House's Excel data). It also tries to figure out whether a given country-year is in the specific state system list. (In the example above, Germany in 1945 is not listed as a member of the state system in either COW or Gleditsch and Ward, since it was occupied by the Allies as of 31 December 1945, but is listed as a member of the state system in Polity IV as the Federal Republic, though with a polity score of -66, "interregnum").

One nice thing about `country_year_coder` (in my humble opinion!) is that it can sometimes correct country coding errors; I've run across more than one dataset with the supposed COW code 255 for the Federal Republic of Germany for the period 1955-1990, which would prevent a clean join to a dataset with the correct COW code, but would be caught by `country_year_coder`. 

There is also a function that allows you to create a blank state system panel for any of the three main state systems:


``` r
create_panel(system = "cow")
#> [38;5;246m# A tibble: 17,621 × 5[39m
#>     cown cow_country_name cow_startdate cow_enddate  year
#>    [3m[38;5;246m<dbl>[39m[23m [3m[38;5;246m<chr>[39m[23m            [3m[38;5;246m<date>[39m[23m        [3m[38;5;246m<date>[39m[23m      [3m[38;5;246m<dbl>[39m[23m
#> [38;5;250m 1[39m   700 Afghanistan      1919-08-08    [31mNA[39m           [4m1[24m919
#> [38;5;250m 2[39m   700 Afghanistan      1919-08-08    [31mNA[39m           [4m1[24m920
#> [38;5;250m 3[39m   700 Afghanistan      1919-08-08    [31mNA[39m           [4m1[24m921
#> [38;5;250m 4[39m   700 Afghanistan      1919-08-08    [31mNA[39m           [4m1[24m922
#> [38;5;250m 5[39m   700 Afghanistan      1919-08-08    [31mNA[39m           [4m1[24m923
#> [38;5;250m 6[39m   700 Afghanistan      1919-08-08    [31mNA[39m           [4m1[24m924
#> [38;5;250m 7[39m   700 Afghanistan      1919-08-08    [31mNA[39m           [4m1[24m925
#> [38;5;250m 8[39m   700 Afghanistan      1919-08-08    [31mNA[39m           [4m1[24m926
#> [38;5;250m 9[39m   700 Afghanistan      1919-08-08    [31mNA[39m           [4m1[24m927
#> [38;5;250m10[39m   700 Afghanistan      1919-08-08    [31mNA[39m           [4m1[24m928
#> [38;5;246m# ℹ 17,611 more rows[39m

create_panel(system = "GW")
#> [38;5;246m# A tibble: 20,529 × 5[39m
#>      GWn GW_country_name GW_startdate GW_enddate  year
#>    [3m[38;5;246m<dbl>[39m[23m [3m[38;5;246m<chr>[39m[23m           [3m[38;5;246m<date>[39m[23m       [3m[38;5;246m<date>[39m[23m     [3m[38;5;246m<dbl>[39m[23m
#> [38;5;250m 1[39m   700 Afghanistan     1919-05-01   [31mNA[39m          [4m1[24m919
#> [38;5;250m 2[39m   700 Afghanistan     1919-05-01   [31mNA[39m          [4m1[24m920
#> [38;5;250m 3[39m   700 Afghanistan     1919-05-01   [31mNA[39m          [4m1[24m921
#> [38;5;250m 4[39m   700 Afghanistan     1919-05-01   [31mNA[39m          [4m1[24m922
#> [38;5;250m 5[39m   700 Afghanistan     1919-05-01   [31mNA[39m          [4m1[24m923
#> [38;5;250m 6[39m   700 Afghanistan     1919-05-01   [31mNA[39m          [4m1[24m924
#> [38;5;250m 7[39m   700 Afghanistan     1919-05-01   [31mNA[39m          [4m1[24m925
#> [38;5;250m 8[39m   700 Afghanistan     1919-05-01   [31mNA[39m          [4m1[24m926
#> [38;5;250m 9[39m   700 Afghanistan     1919-05-01   [31mNA[39m          [4m1[24m927
#> [38;5;250m10[39m   700 Afghanistan     1919-05-01   [31mNA[39m          [4m1[24m928
#> [38;5;246m# ℹ 20,519 more rows[39m
```

## Citation

The standard `citation` function from base `R` will produce a list of citations for all the datasets included in this package:


``` r
citation(package = "democracyData")
```

To cite any of the datasets included in this package use:

  Acemoglu D, Naidu S, Restrepo P, Robinson JA (2019). "Democracy Does
  Cause Growth." _Journal of Political Economy_, *127*(1), 47-100.
  doi:10.1086/700936 <https://doi.org/10.1086/700936>.

  Anckar C, Fredriksson C (2018). "Classifying Political Regimes
  1800–2016: A Typology and a New Dataset." _European Political
  Science_, *18*(1), 84-96. doi:10.1057/s41304-018-0149-8
  <https://doi.org/10.1057/s41304-018-0149-8>.

  Arat ZF (1991). _Democracy and Human Rights in Developing Countries_.
  Lynne Rienner Publishers, Boulder.

  Bell C (2016). "The Rulers, Elections, and Irregular Governance
  Dataset (REIGN)."

  Bernhard M, Nordstrom T, Reenock C (2001). "Economic Performance,
  Institutional Intermediation, and Democratic Survival." _Journal of
  Politics_, *63*(3), 775-803. doi:10.1111/0022-3816.00087
  <https://doi.org/10.1111/0022-3816.00087>.

  Bertelsmann Stiftung (2024). "Transformation Index of the Bertelsmann
  Stiftung 2024." Bertelsmann Stiftung.

  Bjørnskov C, Rode M (2020). "Regime Types and Regime Change: A New
  Dataset on Democracy, Coups, and Political Institutions." _The Review
  of International Organizations_, *15*(2), 531-551.
  doi:10.1007/s11558-019-09345-1
  <https://doi.org/10.1007/s11558-019-09345-1>.

  Boix C, Miller M, Rosato S (2012). "A Complete Data Set of Political
  Regimes, 1800–2007." _Comparative Political Studies_, *46*(12),
  1523-1554. doi:10.1177/0010414012463905
  <https://doi.org/10.1177/0010414012463905>.

  Bollen KA (2001). "Cross-National Indicators of Liberal Democracy,
  1950-1990." doi:10.3886/ICPSR02532.v2
  <https://doi.org/10.3886/ICPSR02532.v2>.

  Bollen K, Paxton P (2000). "Subjective Measures of Liberal
  Democracy." _Comparative Political Studies_, *33*(1), 58-86.
  doi:10.1177/0010414000033001003
  <https://doi.org/10.1177/0010414000033001003>.

  Bowman K, Lehoucq F, Mahoney J (2005). "Measuring Political
  Democracy: Case Expertise, Data Adequacy, and Central America."
  _Comparative Political Studies_, *38*(8), 939-970.
  doi:10.1177/0010414005277083
  <https://doi.org/10.1177/0010414005277083>.

  Cheibub JA, Gandhi J, Vreeland JR (2009). "Democracy and Dictatorship
  Revisited." _Public Choice_, *143*(1-2), 67-101.
  doi:10.1007/s11127-009-9491-2
  <https://doi.org/10.1007/s11127-009-9491-2>.

  Coppedge M, Alvarez A, Maldonado C (2008). "Two Persistent Dimensions
  of Democracy: Contestation and Inclusiveness." _The journal of
  politics_, *70*(03), 632-647. doi:10.1017/S0022381608080663
  <https://doi.org/10.1017/S0022381608080663>.

  Coppedge M, Gerring J, Knutsen CH, Lindberg SI, Teorell J, Altman D,
  Angiolillo F, Bernhard M, Borella C, Cornell A, Fish MS, Fox L,
  Gastaldi L, Gjerløw H, Glynn A, Good God A, Grahn S, Hicken A,
  Kinzelbach K, Marquardt KL, McMann K, Mechkova V, Neundorf A, Paxton
  P, Pemstein D, Rydén O, von Römer J, Seim B, Sigman R, Skaaning S,
  Staton J, Sundström A, Tzelgov E, Uberti L, Wang Y, Wig T, Ziblatt D
  (2024). "V-Dem Codebook V14." Varieties of Democracy (V-Dem) Project.

  Coppedge M, Gerring J, Knutsen CH, Lindberg SI, Teorell J, Altman D,
  Angiolillo F, Bernhard M, Cornell A, Fish MS, Fox L, Gastaldi L,
  Gjerløw H, Glynn A, God AG, Grahn S, Hicken A, Kinzelbach K,
  Marquardt KL, McMann K, Mechkova V, Neundorf A, Paxton P, Pemstein D,
  von Römer J, Seim B, Sigman R, Skaaning S, Staton J, Sundström A,
  Tannenberg M, Tzelgov E, Wang Y, Wiebrecht F, Wig T, Ziblatt D
  (2025). "V-Dem Codebook V15." Varieties of Democracy (V-Dem) Project.

  Coppedge M, Gerring J, Knutsen CH, Lindberg SI, Teorell J, Altman D,
  Bernhard M, Cornell A, Fish MS, Gastaldi L, Gjerløw H, Glynn A, Grahn
  S, Hicken A, Kinzelbach K, Marquardt KL, McMann K, Mechkova V,
  Neundorf A, Paxton P, Pemstein D, Rydén O, von Römer J, Seim B,
  Sigman R, Skaaning S, Staton J, Sundström A, Tzelgov E, Uberti L,
  Wang Y, Wig T, Ziblatt D (????). "V-Dem Codebook V13."

  Coppedge M, Reinicke WH (1990). "Measuring Polyarchy." _Studies in
  Comparative International Development_, *25*(1), 51-72.

  Doorenspleet R (2000). "Reassessing the Three Waves of
  Democratization." _World Politics_, *52*(03), 384-406.
  doi:10.1017/S0043887100016580
  <https://doi.org/10.1017/S0043887100016580>.

  Freedom House (2024). "Freedom in the World 2024: The Mounting Damage
  of Flawed Elections and Armed Conflict." Freedom House.

  Gasiorowski M (1996). "An Overview of the Political Regime Change
  Dataset." _Comparative Political Studies_, *29*(4), 469-483.
  doi:10.1177/0010414096029004004
  <https://doi.org/10.1177/0010414096029004004>.

  Geddes B, Wright J, Frantz E (2014). "Autocratic Breakdown and Regime
  Transitions: A New Data Set." _Perspectives on Politics_, *12*(1),
  313-331. doi:10.1017/S1537592714000851
  <https://doi.org/10.1017/S1537592714000851>.

  Gleditsch KS, Ward MD (1999). "Interstate System Membership: A
  Revised List of Independent States since the Congress of Vienna."
  _International Interactions_, *25*(4), 393-413.
  doi:10.1080/03050629908434958
  <https://doi.org/10.1080/03050629908434958>.

  Goldstone J, Bates R, Epstein D, Gurr T, Lustik M, Marshall M,
  Ulfelder J, Woodward M (2010). "A Global Model for Forecasting
  Political Instability." _American Journal of Political Science_,
  *54*(1), 190-208. doi:10.1111/j.1540-5907.2009.00426.x
  <https://doi.org/10.1111/j.1540-5907.2009.00426.x>.

  Gründler K, Krieger T (2016). "Democracy and Growth: Evidence from a
  Machine Learning Indicator." _European Journal of Political Economy_,
  *45*, 85-107. doi:10.1016/j.ejpoleco.2016.05.005
  <https://doi.org/10.1016/j.ejpoleco.2016.05.005>.

  Gründler K, Krieger T (2018). "Machine Learning Indices, Political
  Institutions, and Economic Development." CESifo Group Munich.

  Gründler K, Krieger T (2021/05/17/). "Using Machine Learning for
  Measuring Democracy: A Practitioners Guide and a New Updated Dataset
  for 186 Countries from 1919 to 2019." _European Journal of Political
  Economy_, 102047. doi:10.1016/j.ejpoleco.2021.102047
  <https://doi.org/10.1016/j.ejpoleco.2021.102047>.

  Hadenius A (1992). _Democracy and Development_. Cambridge University
  Press, New York.

  Hadenius A, Teorell J (2007). "Pathways from Authoritarianism."
  _Journal of Democracy_, *18*(1), 143-157. doi:10.1353/jod.2007.0009
  <https://doi.org/10.1353/jod.2007.0009>.

  House F (2025). "Freedom in the World 2025: The Uphill Battle to
  Safeguard Rights." Freedom House.

  Hsu S (2008). "The Effect of Political Regimes on Inequality,
  1963-2002." _UTIP Working Paper_.

  Kailitz S (2013). "Classifying Political Regimes Revisited:
  Legitimation and Durability." _Democratization_, *20*(1), 39-60.

  Kailitz S (2024). "Varieties of Political Regimes (va-PoReg).
  Codebook. Version 1.7." Hannah Arendt Institute for Totalitarianism
  Studies, Dresden.

  Kailitz S (2024). "Varieties of Political Regimes (va-PoReg).
  Dataset."

  Kaufmann D, Kraay A (2020). "Worldwide Governance Indicators."

  Magaloni B, Chu J, Min E (2013). "Autocracies of the World, 1950-2012
  (Version 1.0)."

  Mainwaring S, Brinks D, Pérez-Liñán A (2001). "Classifying Political
  Regimes in Latin America." _Studies in Comparative International
  Development_, *36*(1), 37-65. doi:10.1007/bf02687584
  <https://doi.org/10.1007/bf02687584>.

  Mainwaring S, Pérez-Liñán A, Brinks D (2014). "Political Regimes in
  Latin America, 1900-2007 (with Daniel Brinks)." In _Democracies and
  Dictatorships in Latin America: Emergence, Survival, and Fall_.
  Cambridge University Press, New York.

  Márquez X (2020). "democracyData: A Package for Accessing and
  Manipulating Existing Measures of Democracy."

  Márquez X (2016). "A Quick Method for Extending the Unified Democracy
  Scores." _Available at SSRN 2753830_. doi:10.2139/ssrn.2753830
  <https://doi.org/10.2139/ssrn.2753830>.

  Marshall MG, Gurr TR (2020). _Polity 5: Political Regime
  Characteristics and Transitions, 1800-2018. Dataset Users' Manual._.

  Marshall MG, Gurr TR, Jaggers K (2019). _Polity IV Project: Political
  Regime Characteristics and Transitions, 1800-2018. Dataset Users'
  Manual._.

  Moon BE, Birdsall JH, Ciesluk S, Garlett LM, Hermias JJ, Mendenhall
  E, Schmid PD, Wong WH (2006). "Voting Counts: Participation in the
  Measurement of Democracy." _Studies in Comparative International
  Development_, *41*(2), 3-32. doi:10.1007/BF02686309
  <https://doi.org/10.1007/BF02686309>.

  Munck G (2009). _Measuring Democracy: A Bridge between Scholarship
  and Politics_. The Johns Hopkins University Press, Baltimore.

  Pemstein D, Marquardt KL, Tzelgov E, Wang Y, Medzihorsky J, Krusell
  J, Miri F, von Römer J (2022). "The V-dem Measurement Model: Latent
  Variable Analysis for Cross-national and Cross-temporal Expert-coded
  Data." Technical Report 21, Varieties of Democracy Institute,
  University of Gothenburg.

  Pemstein D, Meserve SA, Melton J (2013). "Replication Data for:
  Democratic Compromise: A Latent Variable Analysis of Ten Measures of
  Regime Type." doi:10.7910/DVN/WWYOHU
  <https://doi.org/10.7910/DVN/WWYOHU>.

  Pemstein D, Meserve S, Melton J (2010). "Democratic Compromise: A
  Latent Variable Analysis of Ten Measures of Regime Type." _Political
  Analysis_, *18*(4), 426-449. doi:10.1093/pan/mpq020
  <https://doi.org/10.1093/pan/mpq020>.

  Przeworski A (2013). "Political Institutions and Political Events
  (PIPE) Data Set."

  Reich G (2002). "Categorizing Political Regimes: New Data for Old
  Problems." _Democratization_, *9*(4), 1-24. doi:10.1080/714000289
  <https://doi.org/10.1080/714000289>.

  Skaaning S, Gerring J, Bartusevičius H (2015). "A Lexical Index of
  Electoral Democracy." _Comparative Political Studies_, *48*(12),
  1491-1525. doi:10.1177/0010414015581050
  <https://doi.org/10.1177/0010414015581050>.

  Svolik M (2012). _The Politics of Authoritarian Rule_. Cambridge
  University Press, Cambridge and New York.

  Taylor SJ, Ulfelder J (2015). "A Measurement Error Model of
  Dichotomous Democracy Status." _Available at SSRN_.
  doi:10.2139/ssrn.2726962 <https://doi.org/10.2139/ssrn.2726962>.

  The Economist Intelligence Unit (2025). "Democracy Index 2024: What's
  Wrong with Representative Democracy?" The Economist Intelligence Unit
  Limited, London, UK.

  The Economist Intelligence Unit (2023). "Democracy Index 2022:
  Frontline Democracy and the Battle for Ukraine." The Economist
  Intelligence Unit.

  Ulfelder J (2012). "Democracy/Autocracy Data Set."
  doi:10.7910/DVN/M11WFC <https://doi.org/10.7910/DVN/M11WFC>.

  Ulfelder J, Lustik M (2007). "Modelling Transitions to and from
  Democracy." _Democratization_, *14*(3), 351-387.
  doi:10.1080/13510340701303196
  <https://doi.org/10.1080/13510340701303196>.

  Unit TEI (2024). "Democracy Index 2023: Age of Conflict." Economist
  Intelligence Unit, London, United Kingdom.

  Vanhanen T (2019). "Measures of Democracy 1810-2018 (Dataset).
  Version 8.0 (2019-06-17)."

  Wahman M, Teorell J, Hadenius A (2013). "Authoritarian Regime Types
  Revisited: Updated Data in Comparative Perspective." _Contemporary
  Politics_, *19*(1), 19-34. doi:10.1080/13569775.2013.773200
  <https://doi.org/10.1080/13569775.2013.773200>.

To see these entries in BibTeX format, use 'print(<citation>,
bibtex=TRUE)', 'toBibtex(.)', or set
'options(citation.bibtex.max=999)'.

You can also find the citation for a specific dataset using the wrapper `cite_dataset` with the name of the dataset in this package:


``` r
cite_dataset("gwf")
```

[1] B. Geddes, J. Wright, and E. Frantz. "Autocratic Breakdown and
Regime Transitions: A New Data Set". In: _Perspectives on Politics_
12.1 (2014), pp. 313-331. DOI: 10.1017/S1537592714000851.

# Feedback and Caveats

Feedback welcome! 

Note that some functions in this package can be quite slow: generating a full democracy dataset (including downloading Freedom House, Polity, and WGI) or applying `country_year_coder` to a large data frame both can take some time. Suggestions to accelerate the code are welcome. 

`country_year_coder` fails to give correct answers in some weird edge cases mostly involving Yugoslavia, Germany, or Vietnam. If you run across any of these cases, let me know.
