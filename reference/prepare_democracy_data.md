# Prepare democracy data before replicating the UDS model

This function is designed to take the democracy data included in this
package and put it in a form suitable for use with the
[mirt::mirt](https://philchalmers.github.io/mirt/reference/mirt.html)
package to replicate the UDS model. It takes a data frame and tries to
determine, from the column names, which variables contain democracy
scores.

## Usage

``` r
prepare_democracy_data(data, .funs)
```

## Arguments

- data:

  A dataset of democracy scores. For the function to do anything, the
  column names must contain at least one of the following strings:
  [anckar](https://xmarquez.github.io/democracyData/reference/anckar.md),
  [anrr](https://xmarquez.github.io/democracyData/reference/anrr.md),
  [arat](https://xmarquez.github.io/democracyData/reference/arat_pmm.md),
  [blm](https://xmarquez.github.io/democracyData/reference/blm.md),
  [bmr](https://xmarquez.github.io/democracyData/reference/bmr.md),
  [bti](https://xmarquez.github.io/democracyData/reference/bti.md),
  [bollen](https://xmarquez.github.io/democracyData/reference/bollen_pmm.md),
  [doorenspleet](https://xmarquez.github.io/democracyData/reference/doorenspleet.md),
  [wgi](https://xmarquez.github.io/democracyData/reference/download_wgi_voice_and_accountability.md),
  [gwf](https://xmarquez.github.io/democracyData/reference/gwf_all.md),
  [hadenius](https://xmarquez.github.io/democracyData/reference/hadenius_pmm.md),
  [kailitz](https://xmarquez.github.io/democracyData/reference/kailitz.md),
  [lied](https://xmarquez.github.io/democracyData/reference/LIED.md),
  [munck](https://xmarquez.github.io/democracyData/reference/munck_pmm.md),
  [pacl](https://xmarquez.github.io/democracyData/reference/pacl.md),
  [peps](https://xmarquez.github.io/democracyData/reference/peps.md),
  [polyarchy](https://xmarquez.github.io/democracyData/reference/polyarchy.md),
  [polity](https://xmarquez.github.io/democracyData/reference/download_polity_annual.md),
  [prc](https://xmarquez.github.io/democracyData/reference/prc_gasiorowski.md),
  [PIPE](https://xmarquez.github.io/democracyData/reference/PIPE.md),
  [svmdi](https://xmarquez.github.io/democracyData/reference/svmdi.md),
  [svolik](https://xmarquez.github.io/democracyData/reference/svolik_regime.md),
  [ulfelder](https://xmarquez.github.io/democracyData/reference/ulfelder.md),
  [utip](https://xmarquez.github.io/democracyData/reference/utip.md),
  `v2x`, `vanhanen_democratization` (from
  [vanhanen](https://xmarquez.github.io/democracyData/reference/vanhanen.md)),
  [vanhanen_pmm](https://xmarquez.github.io/democracyData/reference/vanhanen.md),
  or
  [wth](https://xmarquez.github.io/democracyData/reference/wahman_teorell_hadenius.md).
  For details of these variables, see the documentation for
  [generate_democracy_scores_dataset](https://xmarquez.github.io/democracyData/reference/generate_democracy_scores_dataset.md)
  or the documentation for the individual datasets.

- .funs:

  A named list of functions to modify the columns. It defaults to the
  following:

  `funs(arat = cut(., breaks = c(0, 50, 60, 70, 80, 90, 100, 109), labels = 1:7, include.lowest = TRUE, right = FALSE), hadenius = cut(., breaks = c(0, 1, 2, 3, 4, 7, 8, 9, 10), labels = 1:8, include.lowest = TRUE, right = FALSE), bollen = cut(., breaks = c(0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100), labels = 1:10, include.lowest = TRUE, right = FALSE), bti = ~cut(.x, breaks = 20, include.lowest = TRUE, right = FALSE, ordered_result = TRUE), vanhanen = cut(., breaks = c(0, 5, 10, 15, 20, 25, 30, 35, 50), labels = 1:8, include.lowest = TRUE, right = FALSE), munck = cut(., breaks = c(0, 0.5, 0.75, 0.99, 1), labels = 1:4, include.lowest = TRUE, right = FALSE), polyarchy_dimensions = cut(., breaks = 20, include.lowest = TRUE, right = FALSE, ordered_result = TRUE), polity = ifelse(. < -10, NA, .), v2x = cut(., breaks = 20, include.lowest = TRUE, right = FALSE, ordered_result = TRUE), v2x_* = cut(., breaks = 20, include.lowest = TRUE, right = FALSE, ordered_result = TRUE), svmdi = cut(., breaks = 20, include.lowest = TRUE, right = FALSE, ordered_result = TRUE), eiu = cut(., breaks = 20, include.lowest = TRUE, right = FALSE, ordered_result = TRUE), wgi = cut(., breaks = 20, include.lowest = TRUE, right = FALSE, ordered_result = TRUE), peps = round(.), other = as.numeric(unclass(factor(.))))`

## Value

A data frame with the transformed scores, if any.

## Details

If the column names contain the strings `arat`, `blm`, `bollen`,`wgi`,
`hadenius`, `munck`, `pacl`, `peps`, `polyarchy_inclusion_dimension`,
`polyarchy_contestation_dimension`, `polity`, `prc`, `v2x`,
`vanhanen_pmm`, or `vanhanen_democratization`, the function performs the
following transformations by default:

`arat`: Following Pemstein, Meserve, and Melton's replication code
(Pemstein, Meserve, and Melton 2013), the function cuts Arat (1991)'s
0-109 democracy score
([arat_pmm](https://xmarquez.github.io/democracyData/reference/arat_pmm.md))
into 7 intervals with the following cutoffs: 50, 60, 70, 80, 90, and
100. The resulting score is ordinal from 1 to 8.

`bollen`: Following Pemstein, Meserve, and Melton's replication code
(Pemstein, Meserve, and Melton 2013), the function cuts Bollen's
(2001)'s 0-100 democracy score
([bollen_pmm](https://xmarquez.github.io/democracyData/reference/bollen_pmm.md))
into 10 intervals with the following cutoffs: 10,20,30,40,50,60,70,80,
and 90. The resulting score is ordinal from 1 to 10.

`bti`: the function assumes this is the Bertelsmann Transformation Index
([bti](https://xmarquez.github.io/democracyData/reference/bti.md)), and
it will cut it into 20 categories. The resulting score is ordinal from 1
to 20.

`wgi`: If the World Governance Indicator's index of voice and
accountability
([wgi](https://xmarquez.github.io/democracyData/reference/download_wgi_voice_and_accountability.md))
is included in the file, the function cuts it into 20 categories. The
resulting score is ordinal from 1 to 20.

`hadenius_pmm`: Following Pemstein, Meserve, and Melton's replication
code (Pemstein, Meserve, and Melton 2013), the function cuts Hadenius
(1992)'s 0-10 democracy score
([hadenius_pmm](https://xmarquez.github.io/democracyData/reference/hadenius_pmm.md))
into 8 intervals with the following cutoffs: 1, 2, 3, 4, 7, 8, and 9.
The resulting score is ordinal from 1 to 8.

`munck`: Following Pemstein, Meserve, and Melton's replication code
(Pemstein, Meserve, and Melton 2013), the function cuts Munck's (2009)'s
0-1 democracy score
([munck_pmm](https://xmarquez.github.io/democracyData/reference/munck_pmm.md))
into 4 intervals with the following cutoffs: 0.5,0.5,0.75, and 0.99. The
resulting score is ordinal from 1 to 4.

`peps`: If any of the variants of the Participation-Enhanced Polity
Score (Moon et al 2006,
[peps](https://xmarquez.github.io/democracyData/reference/peps.md)) is
included in the file, the function rounds its value (eliminates the
decimal) and then transforms it into an ordinal measure from 1 to 21.

`polity`: Following Pemstein, Meserve, and Melton's replication code
(Pemstein, Meserve, and Melton 2013), the function takes the polity
scores
([polity](https://xmarquez.github.io/democracyData/reference/download_polity_annual.md)
or
[polityIV](https://xmarquez.github.io/democracyData/reference/polityIV.md))and
puts NA for any values below -10, and then transforms it into an ordinal
measure from 1 to 21.

`polyarchy_inclusion_dimension`, `polyarchy_contestation_dimension`: If
any of the polyarchy inclusion or contestation dimensions from Coppedge,
Alvarez and Maldonado (2008,
[polyarchy](https://xmarquez.github.io/democracyData/reference/polyarchy.md))
are included, it cuts them into into 20 categories. The resulting score
is ordinal from 1 to 20.

`csvdmi` or `svdmi_2016`: the function assumes this is one of the
continuous indexes of democracy from the SVMDI dataset (Grundler and
Krieger 2018,
[svmdi](https://xmarquez.github.io/democracyData/reference/svmdi.md)),
and it will cut it into 20 categories. The resulting score is ordinal
from 1 to 20.

`v2x`: If any of the `v2x_` continuous indexes of democracy from the
V-Dem dataset (Coppedge et al 2021) are included in the file, the
function cuts them into 20 categories. The resulting score is ordinal
from 1 to 20.

`vanhanen_democratization` or `vanhanen_pmm`: Following Pemstein,
Meserve, and Melton's replication code (Pemstein, Meserve, and Melton
2013), the function cuts Vanhanen's (2012)'s index of democratization
([vanhanen](https://xmarquez.github.io/democracyData/reference/vanhanen.md))
into 8 intervals with the following cutoffs: 5,10,15,20,25,30, and 35.
The resulting score is ordinal from 1 to 8.

The function also recognizes the following column names (or partial
column names - it also recognizes, e.g., `pmm_blm`) as measures of
democracy: `anrr` (from Acemoglu, Naidu, Restrepo, and Robinson 2019,
[anrr](https://xmarquez.github.io/democracyData/reference/anrr.md)),
`anckar` (from Anckar and Fredriksson 2018
[anckar](https://xmarquez.github.io/democracyData/reference/anckar.md)),
`blm` (from Bowman, Lehoucq, and Mahoney 2005,
[blm](https://xmarquez.github.io/democracyData/reference/blm.md)), `bmr`
(from Boix, Miller, and Rosato 2012,
[bmr](https://xmarquez.github.io/democracyData/reference/bmr.md)),
`doorenspleet` (from Doorenspleet 2000,
[doorenspleet](https://xmarquez.github.io/democracyData/reference/doorenspleet.md)),
`e_v2x` (the "ordinal" indexes from the V-dem project, Coppedge et al
2021), `freedomhouse` or `fh` (from Freedom House,
[fh](https://xmarquez.github.io/democracyData/reference/fh_pmm.md) -
freedom scale must be reversed so that "more freedom" is higher), `gwf`
(from Geddes, Wright, and Frantz 2014,
[gwf](https://xmarquez.github.io/democracyData/reference/gwf_all.md) ,
the dichotomous democracy indicator only), `kailitz` (from Kailitz
2013 - democracy/non-democracy indicator,
[kailitz](https://xmarquez.github.io/democracyData/reference/kailitz.md)),
`lied` or `lexical_index` (from Skaaning, Gerring, and Bartusevicius
2015,
[LIED](https://xmarquez.github.io/democracyData/reference/LIED.md)),
`mainwaring` (from Mainwaring and Perez Linan 2008,
[mainwaring](https://xmarquez.github.io/democracyData/reference/mainwaring.md)),
`magaloni` (from Magaloni, Min, Chu 2013 - democracy/non-democracy
indicator,
[magaloni](https://xmarquez.github.io/democracyData/reference/magaloni.md)),
`pacl` (from Cheibub, Gandhi, and Vreeland 2010,
[pacl](https://xmarquez.github.io/democracyData/reference/pacl.md) or
[pacl_update](https://xmarquez.github.io/democracyData/reference/pacl_update.md)),
`pitf` (from Goldstone et al 2010 or Taylor and Ulfelder 2015,
[pitf](https://xmarquez.github.io/democracyData/reference/pitf.md)),
`polyarchy` (from Coppedge and Reinicke 1991,
[polyarchy](https://xmarquez.github.io/democracyData/reference/polyarchy.md)),
`prc` (from Gasiorowski 1996 or Reich 2002,
[prc](https://xmarquez.github.io/democracyData/reference/prc_gasiorowski.md)),
`PIPE` (from Przeworski 2010,
[PIPE](https://xmarquez.github.io/democracyData/reference/PIPE.md)),
`reign` (from Bell 2016,
[reign](https://xmarquez.github.io/democracyData/reference/REIGN.md)),
`svmdi` (from Grundler and Krieger 2018, 2016,
[svmdi](https://xmarquez.github.io/democracyData/reference/svmdi.md)),
`svolik` (from Svolik 2012, democracy/dictatorship indicator only,
[svolik](https://xmarquez.github.io/democracyData/reference/svolik_regime.md)),
`ulfelder` (from Ulfelder 2012,
[ulfelder](https://xmarquez.github.io/democracyData/reference/ulfelder.md)),
`utip` (from Hsu 2008,
[utip](https://xmarquez.github.io/democracyData/reference/utip.md)), and
`wth` or `wahman_teorell_hadenius` (from Wahman, Teorell, and Hadenius
2013,
[wahman_teorell_hadenius](https://xmarquez.github.io/democracyData/reference/wahman_teorell_hadenius.md)).
In each of these cases the function transforms the values of these
scores by running `as.numeric(unclass(factor(x)))`, which transforms
them into ordinal variables from 1 to the number of categories.

For details of these scores, see the documentation for
[generate_democracy_scores_dataset](https://xmarquez.github.io/democracyData/reference/generate_democracy_scores_dataset.md)
or the documentation for the individual datasets.

It is also possible to change these defaults.

## Note

Warning! The function does not perform any sanity checks. It will try to
transform anything that has the right name. You should always check that
the results make sense.

## References

D. Acemoglu, S. Naidu, P. Restrepo, et al. "Democracy Does CauseGrowth".
In: *Journal of Political Economy* 127.1 (2019), pp. 47-100.DOI:
10.1086/700936.

C. Anckar and C. Fredriksson. "Classifying Political Regimes1800–2016: A
Typology and a New Dataset". In: *European PoliticalScience* 18.1 (Mar.
2018), pp. 84-96. DOI: 10.1057/s41304-018-0149-8.

Z. F. Arat. *Democracy and Human Rights in Developing
Countries*.Boulder: Lynne Rienner Publishers, 1991.

C. Bell. *The Rulers, Elections, and Irregular Governance
Dataset(REIGN)*. 2016.

M. Bernhard, T. Nordstrom, and C. Reenock. "Economic
Performance,Institutional Intermediation, and Democratic Survival". In:
*Journal ofPolitics* 63.3 (2001), pp. 775-803. DOI:
10.1111/0022-3816.00087.

Bertelsmann Stiftung. *Transformation Index of the BertelsmannStiftung
2024*. Tech. rep. Bertelsmann Stiftung, 2024.

C. Bjørnskov and M. Rode. "Regime Types and Regime Change: A NewDataset
on Democracy, Coups, and Political Institutions". In: *TheReview of
International Organizations* 15.2 (2020), pp. 531-551.
DOI:10.1007/s11558-019-09345-1.

C. Boix, M. Miller, and S. Rosato. "A Complete Data Set ofPolitical
Regimes, 1800–2007". In: \_Comparative Political Studies_46.12 (2012),
pp. 1523-1554. DOI: 10.1177/0010414012463905.

K. A. Bollen. *Cross-National Indicators of Liberal
Democracy,1950-1990*. 2001. DOI: 10.3886/ICPSR02532.v2.

K. Bollen and P. Paxton. "Subjective Measures of LiberalDemocracy". In:
*Comparative Political Studies* 33.1 (2000), pp. 58-86.DOI:
10.1177/0010414000033001003.

K. Bowman, F. Lehoucq, and J. Mahoney. "Measuring PoliticalDemocracy:
Case Expertise, Data Adequacy, and Central America". In:*Comparative
Political Studies* 38.8 (2005), pp. 939-970.
DOI:10.1177/0010414005277083.

J. A. Cheibub, J. Gandhi, and J. R. Vreeland. "Democracy andDictatorship
Revisited". In: *Public Choice* 143.1-2 (2009), pp.67-101. DOI:
10.1007/s11127-009-9491-2.

M. Coppedge, A. Alvarez, and C. Maldonado. "Two PersistentDimensions of
Democracy: Contestation and Inclusiveness". In: *Thejournal of politics*
70.03 (2008), pp. 632-647. DOI:10.1017/S0022381608080663.

M. Coppedge, J. Gerring, C. H. Knutsen, et al. *V-Dem CodebookV14*.
Tech. rep. Varieties of Democracy (V-Dem) Project, 2024.

M. Coppedge, J. Gerring, C. H. Knutsen, et al. *V-Dem CodebookV15*.
Report. Varieties of Democracy (V-Dem) Project, 2025.

M. Coppedge, J. Gerring, C. H. Knutsen, et al. *V-Dem CodebookV13*.

M. Coppedge and W. H. Reinicke. "Measuring Polyarchy". In:*Studies in
Comparative International Development* 25.1 (1990), pp.51-72.

R. Doorenspleet. "Reassessing the Three Waves of Democratization".In:
*World Politics* 52.03 (2000), pp. 384-406.
DOI:10.1017/S0043887100016580.

Freedom House. *Freedom in the World 2024: The Mounting Damage ofFlawed
Elections and Armed Conflict*. Tech. rep. Freedom House, 2024.

M. Gasiorowski. "An Overview of the Political Regime ChangeDataset". In:
*Comparative Political Studies* 29.4 (1996), pp. 469-483.DOI:
10.1177/0010414096029004004.

B. Geddes, J. Wright, and E. Frantz. "Autocratic Breakdown andRegime
Transitions: A New Data Set". In: \_Perspectives on Politics_12.1
(2014), pp. 313-331. DOI: 10.1017/S1537592714000851.

K. S. Gleditsch and M. D. Ward. "Interstate System Membership: ARevised
List of Independent States since the Congress of Vienna".
In:*International Interactions* 25.4 (1999), pp. 393-413.
DOI:10.1080/03050629908434958.

J. Goldstone, R. Bates, D. Epstein, et al. "A Global Model
forForecasting Political Instability". In: *American Journal of
PoliticalScience* 54.1 (2010), pp. 190-208.
DOI:10.1111/j.1540-5907.2009.00426.x.

K. Gründler and T. Krieger. "Democracy and Growth: Evidence from
aMachine Learning Indicator". In: *European Journal of PoliticalEconomy*
45 (2016), pp. 85-107. DOI: 10.1016/j.ejpoleco.2016.05.005.

K. Gründler and T. Krieger. *Machine Learning Indices,
PoliticalInstitutions, and Economic Development*. Report. CESifo Group
Munich,2018.

K. Gründler and T. Krieger. "Using Machine Learning for
MeasuringDemocracy: A Practitioners Guide and a New Updated Dataset for
186Countries from 1919 to 2019". In: *European Journal of
PoliticalEconomy* (), p. 102047. DOI: 10.1016/j.ejpoleco.2021.102047.

A. Hadenius. *Democracy and Development*. New York: CambridgeUniversity
Press, 1992.

A. Hadenius and J. Teorell. "Pathways from Authoritarianism".
In:*Journal of Democracy* 18.1 (2007), pp. 143-157.
DOI:10.1353/jod.2007.0009.

F. House. *Freedom in the World 2025: The Uphill Battle toSafeguard
Rights*. Tech. rep. Freedom House, Feb. 2025.

S. Hsu. "The Effect of Political Regimes on Inequality,1963-2002". In:
*UTIP Working Paper* (2008).

S. Kailitz. "Classifying Political Regimes Revisited: Legitimationand
Durability". In: *Democratization* 20.1 (2013), pp. 39-60.

S. Kailitz. *Varieties of Political Regimes (va-PoReg). Codebook.Version
1.7*. Tech. rep. Dresden: Hannah Arendt Institute forTotalitarianism
Studies, 2024.

S. Kailitz. *Varieties of Political Regimes (va-PoReg).
Dataset*.Dresden, 2024.

D. Kaufmann and A. Kraay. *Worldwide Governance Indicators*. 2020.

B. Magaloni, J. Chu, and E. Min. *Autocracies of the World,1950-2012
(Version 1.0)*. Dataset. 2013.

S. Mainwaring, D. Brinks, and A. Pérez-Liñán. "ClassifyingPolitical
Regimes in Latin America". In: *Studies in ComparativeInternational
Development* 36.1 (2001), pp. 37-65. DOI:10.1007/bf02687584.

S. Mainwaring, A. Pérez-Liñán, and D. Brinks. "Political Regimesin Latin
America, 1900-2007 (with Daniel Brinks)". In: *Democracies
andDictatorships in Latin America: Emergence, Survival, and Fall*.
NewYork: Cambridge University Press, 2014.

M. G. Marshall and T. R. Gurr. \_Polity 5: Political
RegimeCharacteristics and Transitions, 1800-2018. Dataset Users'
Manual.\_Manual. 2020.

M. G. Marshall, T. R. Gurr, and K. Jaggers. *Polity IV Project:Political
Regime Characteristics and Transitions, 1800-2018. DatasetUsers'
Manual.* Manual. 2019.

B. E. Moon, J. H. Birdsall, S. Ciesluk, et al. "Voting
Counts:Participation in the Measurement of Democracy". In: *Studies
inComparative International Development* 41.2 (2006), pp. 3-32.
DOI:10.1007/BF02686309.

G. Munck. *Measuring Democracy: A Bridge between Scholarship
andPolitics*. Baltimore: The Johns Hopkins University Press, 2009.

X. Márquez. "A Quick Method for Extending the Unified DemocracyScores".
In: *Available at SSRN 2753830* (2016). DOI:10.2139/ssrn.2753830.

X. Márquez. *democracyData: A Package for Accessing andManipulating
Existing Measures of Democracy.* 2020.

D. Pemstein, K. L. Marquardt, E. Tzelgov, et al. *The V-demMeasurement
Model: Latent Variable Analysis for Cross-national andCross-temporal
Expert-coded Data*. Tech. rep. 21. Varieties ofDemocracy Institute,
University of Gothenburg, 2022.

D. Pemstein, S. A. Meserve, and J. Melton. *Replication Data
for:Democratic Compromise: A Latent Variable Analysis of Ten Measures
ofRegime Type*. 2013. DOI: 10.7910/DVN/WWYOHU.

D. Pemstein, S. Meserve, and J. Melton. "Democratic Compromise: ALatent
Variable Analysis of Ten Measures of Regime Type". In:*Political
Analysis* 18.4 (2010), pp. 426-449. DOI: 10.1093/pan/mpq020.

A. Przeworski. *Political Institutions and Political Events (PIPE)Data
Set*. Data Set. 2013.

G. Reich. "Categorizing Political Regimes: New Data for OldProblems".
In: *Democratization* 9.4 (2002), pp. 1-24. DOI:10.1080/714000289.

S. Skaaning, J. Gerring, and H. Bartusevičius. "A Lexical Index
ofElectoral Democracy". In: *Comparative Political Studies* 48.12
(2015),pp. 1491-1525. DOI: 10.1177/0010414015581050.

M. Svolik. *The Politics of Authoritarian Rule*. Cambridge and NewYork:
Cambridge University Press, 2012.

S. J. Taylor and J. Ulfelder. "A Measurement Error Model ofDichotomous
Democracy Status". In: *Available at SSRN* (2015).
DOI:10.2139/ssrn.2726962.

The Economist Intelligence Unit. *Democracy Index 2022:
FrontlineDemocracy and the Battle for Ukraine*. Tech. rep. The
EconomistIntelligence Unit, 2023.

The Economist Intelligence Unit. *Democracy Index 2024: What'sWrong with
Representative Democracy?* Tech. rep. London, UK: TheEconomist
Intelligence Unit Limited, 2025.

J. Ulfelder. *Democracy/Autocracy Data Set*. 2012.
DOI:10.7910/DVN/M11WFC.

J. Ulfelder and M. Lustik. "Modelling Transitions to and fromDemocracy".
In: *Democratization* 14.3 (2007), pp. 351-387.
DOI:10.1080/13510340701303196.

T. E. I. Unit. *Democracy Index 2023: Age of Conflict*. Tech.
rep.London, United Kingdom: Economist Intelligence Unit, 2024.

T. Vanhanen. *Measures of Democracy 1810-2018 (Dataset). Version8.0
(2019-06-17).* Tampere, 2019.

M. Wahman, J. Teorell, and A. Hadenius. "Authoritarian RegimeTypes
Revisited: Updated Data in Comparative Perspective". In:*Contemporary
Politics* 19.1 (2013), pp. 19-34. DOI:10.1080/13569775.2013.773200.

## Examples

``` r
democracy <- generate_democracy_scores_dataset(
  selection = "pmm", output_format = "wide", exclude_pmm_duplicates = FALSE
  )
#> Adding arat_pmm data
#> Adding blm_pmm data
#> Adding bollen_pmm data
#> Adding fh_pmm data
#> Adding hadenius_pmm data
#> Adding mainwaring_pmm data
#> Adding Munck data
#> Adding pacl_pmm data
#> Adding polity_pmm data
#> Adding polyarchy_pmm data
#> Adding prc_pmm data
#> Adding vanhanen_pmm data

summary(democracy)
#>  extended_country_name      GWn             cown       in_GW_system   
#>  Length:9137           Min.   :  2.0   Min.   :  2.0   Mode :logical  
#>  Class :character      1st Qu.:225.0   1st Qu.:225.0   FALSE:12       
#>  Mode  :character      Median :450.0   Median :450.0   TRUE :9125     
#>                        Mean   :458.8   Mean   :458.5                  
#>                        3rd Qu.:678.0   3rd Qu.:678.0                  
#>                        Max.   :990.0   Max.   :990.0                  
#>                                                                       
#>       year         pmm_arat        pmm_blm       pmm_bollen         pmm_fh    
#>  Min.   :1946   Min.   : 29.0   Min.   :0.00   Min.   :  0.00   Min.   :1.00  
#>  1st Qu.:1969   1st Qu.: 58.0   1st Qu.:0.00   1st Qu.: 22.84   1st Qu.:2.50  
#>  Median :1984   Median : 69.0   Median :0.00   Median : 53.59   Median :4.00  
#>  Mean   :1982   Mean   : 73.2   Mean   :0.36   Mean   : 55.46   Mean   :4.15  
#>  3rd Qu.:1997   3rd Qu.: 92.0   3rd Qu.:0.50   3rd Qu.: 90.95   3rd Qu.:6.00  
#>  Max.   :2008   Max.   :109.0   Max.   :1.00   Max.   :100.00   Max.   :7.00  
#>                 NA's   :5264    NA's   :8862   NA's   :8627     NA's   :2699  
#>   pmm_hadenius    pmm_mainwaring      pmm_munck         pmm_pacl     
#>  Min.   : 0.000   Min.   :-1.0000   Min.   :0.0000   Min.   :0.0000  
#>  1st Qu.: 1.500   1st Qu.:-1.0000   1st Qu.:0.7500   1st Qu.:0.0000  
#>  Median : 3.100   Median : 0.0000   Median :1.0000   Median :0.0000  
#>  Mean   : 4.508   Mean   : 0.1222   Mean   :0.8382   Mean   :0.4355  
#>  3rd Qu.: 8.300   3rd Qu.: 1.0000   3rd Qu.:1.0000   3rd Qu.:1.0000  
#>  Max.   :10.000   Max.   : 1.0000   Max.   :1.0000   Max.   :1.0000  
#>  NA's   :9008     NA's   :8302      NA's   :8795     NA's   :70      
#>    pmm_polity       pmm_polyarchy       pmm_prc       pmm_vanhanen  
#>  Min.   :-10.0000   Min.   : 0.000   Min.   :1.000   Min.   : 0.00  
#>  1st Qu.: -7.0000   1st Qu.: 3.000   1st Qu.:1.000   1st Qu.: 0.00  
#>  Median : -1.0000   Median : 7.000   Median :1.000   Median : 5.90  
#>  Mean   :  0.1286   Mean   : 6.329   Mean   :2.147   Mean   :11.31  
#>  3rd Qu.:  8.0000   3rd Qu.:10.000   3rd Qu.:4.000   3rd Qu.:20.70  
#>  Max.   : 10.0000   Max.   :10.000   Max.   :4.000   Max.   :49.00  
#>  NA's   :1087       NA's   :8784     NA's   :3135    NA's   :172    
summary(prepare_democracy_data(democracy))
#>  extended_country_name      GWn             cown       in_GW_system   
#>  Length:9137           Min.   :  2.0   Min.   :  2.0   Mode :logical  
#>  Class :character      1st Qu.:225.0   1st Qu.:225.0   FALSE:12       
#>  Mode  :character      Median :450.0   Median :450.0   TRUE :9125     
#>                        Mean   :458.8   Mean   :458.5                  
#>                        3rd Qu.:678.0   3rd Qu.:678.0                  
#>                        Max.   :990.0   Max.   :990.0                  
#>                                                                       
#>       year         pmm_arat        pmm_blm       pmm_bollen    
#>  Min.   :1946   Min.   :1.000   Min.   :1.00   Min.   : 1.000  
#>  1st Qu.:1969   1st Qu.:2.000   1st Qu.:1.00   1st Qu.: 3.000  
#>  Median :1984   Median :3.000   Median :1.00   Median : 6.000  
#>  Mean   :1982   Mean   :3.878   Mean   :1.72   Mean   : 6.006  
#>  3rd Qu.:1997   3rd Qu.:6.000   3rd Qu.:2.00   3rd Qu.:10.000  
#>  Max.   :2008   Max.   :7.000   Max.   :3.00   Max.   :10.000  
#>                 NA's   :5264    NA's   :8862   NA's   :8627    
#>      pmm_fh        pmm_hadenius    pmm_mainwaring    pmm_munck    
#>  Min.   : 1.000   Min.   : 0.000   Min.   :1.000   Min.   :1.000  
#>  1st Qu.: 4.000   1st Qu.: 1.500   1st Qu.:1.000   1st Qu.:3.000  
#>  Median : 7.000   Median : 3.100   Median :2.000   Median :4.000  
#>  Mean   : 7.301   Mean   : 4.508   Mean   :2.122   Mean   :3.333  
#>  3rd Qu.:11.000   3rd Qu.: 8.300   3rd Qu.:3.000   3rd Qu.:4.000  
#>  Max.   :13.000   Max.   :10.000   Max.   :3.000   Max.   :4.000  
#>  NA's   :2699     NA's   :9008     NA's   :8302    NA's   :8795   
#>     pmm_pacl       pmm_polity    pmm_polyarchy       pmm_prc     
#>  Min.   :1.000   Min.   : 1.00   Min.   : 1.000   Min.   :1.000  
#>  1st Qu.:1.000   1st Qu.: 4.00   1st Qu.: 4.000   1st Qu.:1.000  
#>  Median :1.000   Median :10.00   Median : 8.000   Median :1.000  
#>  Mean   :1.436   Mean   :11.13   Mean   : 7.329   Mean   :2.147  
#>  3rd Qu.:2.000   3rd Qu.:19.00   3rd Qu.:11.000   3rd Qu.:4.000  
#>  Max.   :2.000   Max.   :21.00   Max.   :11.000   Max.   :4.000  
#>  NA's   :70      NA's   :1087    NA's   :8784     NA's   :3135   
#>   pmm_vanhanen  
#>  Min.   :1.000  
#>  1st Qu.:1.000  
#>  Median :2.000  
#>  Mean   :2.939  
#>  3rd Qu.:5.000  
#>  Max.   :8.000  
#>  NA's   :172    
```
