# Download and process various democracy datasets.

Download and process various democracy datasets. Note that the datasets
returned by the `redownload_*` family of functions
([blm](https://xmarquez.github.io/democracyData/reference/blm.md),
[bmr](https://xmarquez.github.io/democracyData/reference/bmr.md),
[bti](https://xmarquez.github.io/democracyData/reference/bti.md),
[gwf_autocratic](https://xmarquez.github.io/democracyData/reference/gwf_all.md),
[gwf_autocratic_extended](https://xmarquez.github.io/democracyData/reference/gwf_all.md),
[gwf_all](https://xmarquez.github.io/democracyData/reference/gwf_all.md),
[gwf_all_extended](https://xmarquez.github.io/democracyData/reference/gwf_all.md),
[LIED](https://xmarquez.github.io/democracyData/reference/LIED.md),
[magaloni](https://xmarquez.github.io/democracyData/reference/magaloni.md),
[pacl](https://xmarquez.github.io/democracyData/reference/pacl.md),
[pacl_update](https://xmarquez.github.io/democracyData/reference/pacl_update.md),
[PIPE](https://xmarquez.github.io/democracyData/reference/PIPE.md),
[peps](https://xmarquez.github.io/democracyData/reference/peps.md),
[polityIV](https://xmarquez.github.io/democracyData/reference/polityIV.md),
[polyarchy](https://xmarquez.github.io/democracyData/reference/polyarchy.md),
[polyarchy_dimensions](https://xmarquez.github.io/democracyData/reference/polyarchy_dimensions.md),
[REIGN](https://xmarquez.github.io/democracyData/reference/REIGN.md),
[uds_2014](https://xmarquez.github.io/democracyData/reference/uds_2014.md),
[uds_2010](https://xmarquez.github.io/democracyData/reference/uds_2014.md),
[uds_2011](https://xmarquez.github.io/democracyData/reference/uds_2014.md),
[ulfelder](https://xmarquez.github.io/democracyData/reference/ulfelder.md),
[utip](https://xmarquez.github.io/democracyData/reference/utip.md),
[wahman_teorell_hadenius](https://xmarquez.github.io/democracyData/reference/wahman_teorell_hadenius.md),
[anckar](https://xmarquez.github.io/democracyData/reference/anckar.md),
[svmdi](https://xmarquez.github.io/democracyData/reference/svmdi.md))
are all available directly from this package and are unlikely to have
changed since the package was installed. Access the respective dataset
by typing its name, and refer to their documentation for details. You
will not normally need to redownload them, unless you want to process
the raw data yourself (set `return_raw = TRUE`) or suspect they have
changed since the package was installed.

## Usage

``` r
redownload_blm(url, verbose = TRUE, return_raw = FALSE, ...)

redownload_anckar(url, verbose = TRUE, return_raw = FALSE, ...)

redownload_bmr(url, verbose = TRUE, return_raw = FALSE, ...)

redownload_gwf(
  url,
  verbose = TRUE,
  extend = FALSE,
  dataset = c("all", "autocratic only"),
  return_raw = FALSE,
  ...
)

redownload_lied(url, verbose = TRUE, return_raw = FALSE, ...)

redownload_vaporeg(url, verbose = TRUE, return_raw = FALSE, ...)

redownload_pacl(url, verbose = TRUE, return_raw = FALSE, ...)

redownload_peps(url, verbose = TRUE, return_raw = FALSE, ...)

redownload_utip(url, verbose = TRUE, return_raw = FALSE, ...)

redownload_wahman_teorell_hadenius(
  url,
  verbose = TRUE,
  return_raw = FALSE,
  ...
)

redownload_polyarchy_original(url, verbose = TRUE, return_raw = FALSE, ...)

redownload_polyarchy_dimensions(url, verbose = TRUE, return_raw = FALSE, ...)

redownload_magaloni(
  url,
  verbose = TRUE,
  extend = FALSE,
  return_raw = FALSE,
  ...
)

redownload_svmdi(
  url,
  release_year = 2020,
  verbose = TRUE,
  return_raw = FALSE,
  ...
)

redownload_uds(
  url,
  release_year = 2014,
  verbose = TRUE,
  return_raw = FALSE,
  ...
)

redownload_ulfelder(
  url,
  verbose = TRUE,
  return_raw = FALSE,
  extend = FALSE,
  ...
)

redownload_pipe(url, verbose = TRUE, return_raw = FALSE, ...)

redownload_polityIV(url, verbose = TRUE, return_raw = FALSE, ...)

redownload_bti(url, verbose = TRUE, return_raw = FALSE, ...)

redownload_pacl_update(url, verbose = TRUE, return_raw = FALSE, ...)

redownload_reign(url, verbose = TRUE, return_raw = FALSE, ...)
```

## Source

K. Bowman, F. Lehoucq, and J. Mahoney. "Measuring Political Democracy:
Case Expertise, Data Adequacy, and Central America". In: *Comparative
Political Studies* 38.8 (2005), pp. 939-970. DOI:
[10.1177/0010414005277083](https://dx.doi.org/10.1177/0010414005277083)..
Data and documentation archived at
<https://web.archive.org/web/20221128114909/http://blmdemocracy.gatech.edu/>.

C. Anckar and C. Fredriksson. "Classifying Political Regimes 1800–2016:
A Typology and a New Dataset". In: *European Political Science* 18.1
(Mar. 2018), pp. 84-96. DOI:
[10.1057/s41304-018-0149-8](https://dx.doi.org/10.1057/s41304-018-0149-8).
Updated data (V2) available at
<https://dataverse.harvard.edu/file.xhtml?persistentId=doi:10.7910/DVN/7SSSAH/DIZXSI&version=2.0>

C. Boix, M. Miller, and S. Rosato. "A Complete Data Set of Political
Regimes, 1800–2007". In: *Comparative Political Studies* 46.12 (2012),
pp. 1523-1554. DOI:
[10.1177/0010414012463905](https://dx.doi.org/10.1177/0010414012463905).
Available at <https://sites.google.com/site/mkmtwo/data>.

B. Geddes, J. Wright, and E. Frantz. "Autocratic Breakdown and Regime
Transitions: A New Data Set". In: *Perspectives on Politics* 12.1
(2014), pp. 313-331. DOI:
[10.1017/S1537592714000851](https://dx.doi.org/10.1017/S1537592714000851).
The full data and codebook can be downloaded here:
<http://sites.psu.edu/dictators/>.

S. Skaaning, J. Gerring, and H. Bartusevičius. "A Lexical Index of
Electoral Democracy". In: *Comparative Political Studies* 48.12 (2015),
pp. 1491-1525. DOI:
[10.1177/0010414015581050](https://dx.doi.org/10.1177/0010414015581050)..
Original data and variable descriptions available at
<https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/WPKNIT>.
This is for version 6.6 (2023 update).

S. Kailitz. *Varieties of Political Regimes (va-PoReg). Dataset*.
Dresden, 2024. Original data and variable descriptions available at
<https://www.va-poreg.de/home>.

J. A. Cheibub, J. Gandhi, and J. R. Vreeland. "Democracy and
Dictatorship Revisited". In: *Public Choice* 143.1-2 (2009), pp. 67-101.
DOI:
[10.1007/s11127-009-9491-2](https://dx.doi.org/10.1007/s11127-009-9491-2).
The full data and codebook can be downloaded here:
<https://sites.google.com/site/joseantoniocheibub/datasets/dd>.

B. E. Moon, J. H. Birdsall, S. Ciesluk, et al. "Voting Counts:
Participation in the Measurement of Democracy". In: *Studies in
Comparative International Development* 41.2 (2006), pp. 3-32. DOI:
[10.1007/BF02686309](https://dx.doi.org/10.1007/BF02686309). The
complete dataset is available here:
<http://www.lehigh.edu/~bm05/democracy/Obtain_data.htm>.

S. Hsu. "The Effect of Political Regimes on Inequality, 1963-2002". In:
*UTIP Working Paper* (2008). Data available for download at
<http://utip.gov.utexas.edu/data/>.

M. Wahman, J. Teorell, and A. Hadenius. "Authoritarian Regime Types
Revisited: Updated Data in Comparative Perspective". In: *Contemporary
Politics* 19.1 (2013), pp. 19-34. DOI:
[10.1080/13569775.2013.773200](https://dx.doi.org/10.1080/13569775.2013.773200).
The dataset and codebook can be downloaded from
<https://sites.google.com/site/authoritarianregimedataset/data>.

M. Coppedge and W. H. Reinicke. "Measuring Polyarchy". In: *Studies in
Comparative International Development* 25.1 (1990), pp. 51-72. Data
available at
<https://web.archive.org/web/20160309180905/http://www3.nd.edu/~mcoppedg/crd/datacrd.htm>.

M. Coppedge, A. Alvarez, and C. Maldonado. "Two Persistent Dimensions of
Democracy: Contestation and Inclusiveness". In: *The journal of
politics* 70.03 (2008), pp. 632-647. DOI:
[10.1017/S0022381608080663](https://dx.doi.org/10.1017/S0022381608080663).
Data available at
<https://web.archive.org/web/20160309180905/http://www3.nd.edu/~mcoppedg/crd/datacrd.htm>.

B. Magaloni, J. Chu, and E. Min. *Autocracies of the World, 1950-2012
(Version 1.0)*. Dataset. 2013. Original data and codebook used to be
available at
<https://cddrl.fsi.stanford.edu/research/autocracies_of_the_world_dataset>.

K. Gründler and T. Krieger. *Machine Learning Indices, Political
Institutions, and Economic Development*. Report. CESifo Group Munich,
2018. Original data available at <https://ml-democracy-index.net/>.

D. Pemstein, S. Meserve, and J. Melton. "Democratic Compromise: A Latent
Variable Analysis of Ten Measures of Regime Type". In: *Political
Analysis* 18.4 (2010), pp. 426-449. DOI:
[10.1093/pan/mpq020](https://dx.doi.org/10.1093/pan/mpq020). Original
data and codebook archived at
<https://web.archive.org/web/20191224160254/http://www.unified-democracy-scores.org/>.

J. Ulfelder. *Democracy/Autocracy Data Set*. 2012. DOI:
[10.7910/DVN/M11WFC](https://dx.doi.org/10.7910/DVN/M11WFC). Original
data available at <https://doi.org/10.7910/DVN/M11WFC>.

A. Przeworski. *Political Institutions and Political Events (PIPE) Data
Set*. Data Set. 2013. Original data available at
<https://sites.google.com/a/nyu.edu/adam-przeworski/home/data>.

M. G. Marshall, T. R. Gurr, and K. Jaggers. *Polity IV Project:
Political Regime Characteristics and Transitions, 1800-2018. Dataset
Users' Manual.* Manual. 2019. Data and codebook available at
[http://www.systemicpeace.org/inscrdata.html](http://www.systemicpeace.org/inscrdata.md).

Bertelsmann Stiftung. *Transformation Index of the Bertelsmann Stiftung
2024*. Tech. rep. Bertelsmann Stiftung, 2024. Available at
<https://bti-project.org/en/index/political-transformation>.

C. Bjørnskov and M. Rode. "Regime Types and Regime Change: A New Dataset
on Democracy, Coups, and Political Institutions". In: *The Review of
International Organizations* 15.2 (2020), pp. 531-551. DOI:
[10.1007/s11558-019-09345-1](https://dx.doi.org/10.1007/s11558-019-09345-1).
Available at <http://www.christianbjoernskov.com/bjoernskovrodedata/>.

C. Bell. *The Rulers, Elections, and Irregular Governance Dataset
(REIGN)*. 2016. Data available at
<https://oefdatascience.github.io/REIGN.github.io/>.

## Arguments

- url:

  The URL of the dataset. This defaults to:

  - For
    [anckar](https://xmarquez.github.io/democracyData/reference/anckar.md):
    <https://dataverse.harvard.edu/api/access/datafile/3868064?format=original&gbrecs=true>.

  - For
    [blm](https://xmarquez.github.io/democracyData/reference/blm.md):
    <https://web.archive.org/web/20220418025439/https://blmdemocracy.gatech.edu/blm%20final%20data.xls>.

  - For
    [bmr](https://xmarquez.github.io/democracyData/reference/bmr.md):
    <https://drive.google.com/uc?export=download&id=1T5Kzs7iu8w26UrTJuyskugcD6Z3uR_tX>.

  - For
    [bti](https://xmarquez.github.io/democracyData/reference/bti.md):
    <https://bti-project.org/fileadmin/api/content/en/downloads/data/BTI_2006-2024_Scores.xlsx>.

  - For
    [gwf_all](https://xmarquez.github.io/democracyData/reference/gwf_all.md)
    and
    [gwf_autocratic](https://xmarquez.github.io/democracyData/reference/gwf_all.md):
    <http://sites.psu.edu/dictators/wp-content/uploads/sites/12570/2016/05/GWF-Autocratic-Regimes-1.2.zip>.

  - For
    [LIED](https://xmarquez.github.io/democracyData/reference/LIED.md):
    <https://dataverse.harvard.edu/api/access/datafile/11068563>.

  - For
    [pacl](https://xmarquez.github.io/democracyData/reference/pacl.md):
    <https://www.dropbox.com/scl/fi/c7q60zhkj5sqsidjunath/ddrevisited_data_v1.dta?rlkey=xdptpr1wniu2zlm8xi9ny9q1x&e=1&dl=1>.

  - For
    [pacl_update](https://xmarquez.github.io/democracyData/reference/pacl_update.md):
    <http://www.christianbjoernskov.com/wp-content/uploads/2020/09/Bj%C3%B8rnskov-Rode-integrated-dataset-v3.2.xlsx>.

  - For
    [peps](https://xmarquez.github.io/democracyData/reference/peps.md):
    <http://www.lehigh.edu/~bm05/democracy/PEPS1pub.dta>.

  - For
    [polityIV](https://xmarquez.github.io/democracyData/reference/polityIV.md):
    <http://www.systemicpeace.org/inscr/p4v2018.xls>.

  - For
    [svmdi](https://xmarquez.github.io/democracyData/reference/svmdi.md):
    <https://ml-democracy-index.net/downloadfiles/ML%20indices.xlsx> or
    <http://www.wiwi.uni-wuerzburg.de/fileadmin/12010400/Data.dta>,
    depending on `release_year` (2020 or 2016).

  - For
    [REIGN](https://xmarquez.github.io/democracyData/reference/REIGN.md):
    <https://github.com/OEFDataScience/REIGN.github.io/blob/gh-pages/data_sets/regime_list.csv?raw=true>.

  - For
    [utip](https://xmarquez.github.io/democracyData/reference/utip.md):
    <http://utip.lbj.utexas.edu/data/political%20regime%20data%20set%20RV.xls>.

  - For
    [uds](https://xmarquez.github.io/democracyData/reference/uds_2014.md):
    <https://web.archive.org/web/20191224154817/http://www.unified-democracy-scores.org/files/20140312/z/uds_summary.csv.gz>,
    <https://web.archive.org/web/20191224154817/http://www.unified-democracy-scores.org/files/20110104/uds_summary.csv.gz>
    or
    <https://web.archive.org/web/20191224154817/http://www.unified-democracy-scores.org/files/20100726/uds_summary.csv.gz>,
    depending on `release_year` (2014, 2011, or 2010).

  - For
    [vaporeg](https://xmarquez.github.io/democracyData/reference/vaporeg.md):
    <https://www.va-poreg.de/download/Kailitz,%20Varieties%20of%20Political%20Regimes%20April%202025.rds>.

  - For
    [wahman_teorell_hadenius](https://xmarquez.github.io/democracyData/reference/wahman_teorell_hadenius.md):
    <https://sites.google.com/site/authoritarianregimedataset/data/ARD_V6.dta?attredirects=0&d=1>.

  - For
    [polyarchy](https://xmarquez.github.io/democracyData/reference/polyarchy.md):
    <https://web.archive.org/web/20161001221658/https://www3.nd.edu/~mcoppedg/crd/poly8500.sav>.

  - For
    [polyarchy_dimensions](https://xmarquez.github.io/democracyData/reference/polyarchy_dimensions.md):
    <https://web.archive.org/web/20161004080450/http://www3.nd.edu/~mcoppedg/crd/DahlDims.sav>.

  - For
    [magaloni](https://xmarquez.github.io/democracyData/reference/magaloni.md):
    <https://fsi-live.s3.us-west-1.amazonaws.com/s3fs-public/res/Data_Set.xls>.

  - For
    [ulfelder](https://xmarquez.github.io/democracyData/reference/ulfelder.md):
    <https://dataverse.harvard.edu/api/access/datafile/2420018>.

  - For
    [PIPE](https://xmarquez.github.io/democracyData/reference/PIPE.md):
    <https://drive.google.com/uc?export=download&id=1_64WVUa1UIYd5dhY0DoxLwa35cU9yKTm>.

- verbose:

  Whether to print a running commentary of what the function is doing
  while processing the data.

- return_raw:

  Whether to return the raw data, with minimal processing. Default is
  `FALSE`.

- ...:

  Other parameters passed to
  [country_year_coder](https://xmarquez.github.io/democracyData/reference/country_year_coder.md).

- extend:

  (Only for redownload_gwf, redownload_magaloni, and
  redownload_ulfelder). Whether to extend the dataset back in time using
  the appropriate duration variable (`gwf_duration`, `duration_nr`, or
  `rgjdura` and `rgjdurd`, respectively, for redownload_gwf,
  redownload_magaloni, and redownload_ulfelder). For example, the United
  States enters the GWF dataset in 1946, where `gwf_duration` is already
  75; one can extend the dataset to indicate that the country was
  classified as a democracy from 1872. Default is `FALSE`.

- dataset:

  (Only for redownload_gwf). The dataset to output. Geddes, Wright, and
  Frantz provide two country-year files, one with autocratic regimes
  only ("autocratic only"), and one with both democratic and
  non-democratic regimes ("all"). Default is "all".

- release_year:

  (Only in redownload_svmdi and redownload_uds). The year of the release
  to be downloaded. For
  [svmdi](https://xmarquez.github.io/democracyData/reference/svmdi.md),
  it can be 2016 or 2020.

## Value

A
[`tibble::tibble()`](https://tibble.tidyverse.org/reference/tibble.html)
with the processed dataset, unless `return_raw` is `TRUE`, in which case
the function returns the raw data without processing.

## Details

`redownload_polityIV` downloads the 2019 update of the Polity IV dataset
(annual time series, to 2018) and processes it using
[country_year_coder](https://xmarquez.github.io/democracyData/reference/country_year_coder.md).
The original data is available at
[http://www.systemicpeace.org/inscrdata.html](http://www.systemicpeace.org/inscrdata.md).
Polity is now in version 5, which incorporates substantial changes; this
redownloads the archived version of
[polityIV](https://xmarquez.github.io/democracyData/reference/polityIV.md)
data. Use
[download_polity_annual](https://xmarquez.github.io/democracyData/reference/download_polity_annual.md)
to download version 5 of Polity.

## See also

[polity_pmm](https://xmarquez.github.io/democracyData/reference/polity_pmm.md)

[polityIV](https://xmarquez.github.io/democracyData/reference/polityIV.md)

## Examples

``` r
if (FALSE) { # \dontrun{
blm <- redownload_blm()
blm
} # }
if (FALSE) { # \dontrun{
redownload_anckar()
} # }
if (FALSE) { # \dontrun{
bmr <- redownload_bmr()
bmr
} # }
if (FALSE) { # \dontrun{
gwf <- redownload_gwf()
gwf
} # }
if (FALSE) { # \dontrun{
redownload_lied()
} # }
if (FALSE) { # \dontrun{
redownload_vaporeg()
} # }
if (FALSE) { # \dontrun{
redownload_pacl()} # }
if (FALSE) { # \dontrun{
redownload_peps()
} # }
if (FALSE) { # \dontrun{
redownload_utip()
} # }
if (FALSE) { # \dontrun{
redownload_wahman_teorell_hadenius()
} # }
if (FALSE) { # \dontrun{
redownload_polyarchy_original()
} # }
if (FALSE) { # \dontrun{
redownload_polyarchy_dimensions()
} # }
if (FALSE) { # \dontrun{
redownload_magaloni()
} # }
if (FALSE) { # \dontrun{
redownload_svmdi(release_year = 2016)
redownload_svmdi() # For release year 2020

} # }
if (FALSE) { # \dontrun{
redownload_uds()
redownload_uds(2011)
} # }
if (FALSE) { # \dontrun{
redownload_ulfelder()
} # }
if (FALSE) { # \dontrun{
redownload_pipe()
} # }
if (FALSE) { # \dontrun{
polityIV <- redownload_polityIV()
polityIV
} # }
if (FALSE) { # \dontrun{
bti <- redownload_bti()
bti
} # }
if (FALSE) { # \dontrun{
redownload_pacl_update()
} # }
if (FALSE) { # \dontrun{
reign <- redownload_reign()
} # }
```
