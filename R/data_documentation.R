
# Anckar ------------------------------------------------------------------

#' The Anckar-Fredriksson dataset of political regimes
#'
#' Dataset described in `r roxygen_cite("anckar")` Data and codebook at the
#' link. This is version 2 of the data, available at
#' \url{https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/7SSSAH&version=2.0}.
#'
#' @section Variables:
#'
#'   \describe{
#'
#'   \item{anckar_country}{The country name, as in the original dataset, with
#'   minimal modification. Use \code{extended_country_name} instead if you want
#'   a consistent name.}
#'
#'   \item{anckar_ccode}{The codebook says this is the COW code; it looks like a
#'   modified version of the Polity code (with the USSR = 364, for example). Use
#'   \code{cown} or \code{GWn} instead.}
#'
#'   \item{abbreviation}{World Bank country abbreviation.}
#'
#'   \item{year}{The calendar year.}
#'
#'   \item{democracy}{This should be identical to version 2 of Boix, Miller and
#'   Rosato's Dichotomous democracy measure (\code{democracy_omitteddata}; see
#'   [bmr]). Supplemented for all countries for the period
#'   2011-2016, as well as for Liechtenstein 1866-1990, Monaco 1862-2016, and
#'   San Marino 1800-1992, by Anckar and Fredriksson. 1 = democracy, 0 =
#'   non-democracy.}
#'
#'   \item{monarchy}{Distinguishes between monarchies and republics in
#'   democratic countries. It is \code{NA} for non-democracies. Vales: 0
#'   Republic, 1 Monarchy, 7 Hybrid.}
#'
#'   \item{regimebroadcat}{Regime type. Classification with broad categories:
#'   Parliamentarism, Semi-presidentialism, Presidentialism, Semi-monarchy,
#'   Party-based rule, Personalist rule, Military rule, Absolute monarchy,
#'   Oligarchy}
#'
#'   \item{regimenarrowcat}{Regime type. Classification with narrow categories:
#'   Parliamentarism, Semi-presidentialism, Presidentialism, Semi-monarchy,
#'   Single-party rule, Multi-party authoritarian rule, Personalist rule,
#'   Military rule, Absolute monarchy, Monarchic oligarchy, Other oligarchy.}
#'
#'   \item{popelection}{Indicates if the head of state is popularly elected or
#'   not in democratic republics. Values 0 Head of state not popularly elected;
#'   1 Head of state popularly elected. In a few cases this variable is not
#'   \code{NA} for non-democracies; it is unclear why.}
#'
#'   }
#'
#' @template standard-variables
#' @family democracy
#' @family authoritarianism
#' @family dichotomous democracy indexes
#' @source `r roxygen_cite("anckar")` Version 2 available at
#'   \url{https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/7SSSAH&version=2.0}.
"anckar"

# ANRR ------------------------------------------------------------------

#' The Acemoglu, Naidu, Restrepo and Robinson democracy dataset
#'
#' Dataset described in `r roxygen_cite("anrr")` Data at the link.
#'
#' @section Variables:
#'
#'   \describe{
#'
#'   \item{anrr_country}{The country name, as in the original dataset, with
#'   minimal modification (Sao Tome and Principe). Use
#'   \code{extended_country_name} instead if you want a consistent name.}
#'
#'   \item{anrr_wbcode}{The World Bank Code as in the original dataset.}
#'
#'   \item{dem}{The democracy variable (1 = democratic, 0 = non-democratic). The
#'   supplementary material describes the construction of the variable as
#'   follows (I copy, paste, and lightly edit from pp. A1-A2):
#'
#'   We construct our consolidated measure of democracy using [Freedom
#'   House](download_fh.html) and [Polity IV](polityIV.html) as our main
#'   sources. We also use secondary sources to resolve ambiguous cases (those in
#'   which Polity and Freedom house report contrary assessments) or those
#'   without data coverage in Freedom House or Polity IV. For instance, Freedom
#'   House only covers the period since 1972, so we use secondary sources and
#'   the Polity IV index to code our measure of democracy prior to this period.
#'   Likewise, Polity IV does not cover some small countries that are in the
#'   Freedom House sample and in other secondary sources. The secondary sources
#'   are the dichotomous measures introduced by Cheibub, Gandhi, and Vreeland
#'   (2010) - henceforth [CGV](pacl.html) - and Boix, Miller, and Rosato (2012)
#'   - henceforth [BMR](bmr.html). Both measures extend and refine Przeworski et
#'   al.'s (2000) measure of democracy. Finally, we use Papaioannou and
#'   Siourounis's (2008) data--henceforth PS--which contains the exact year of a
#'   permanent transition to democracy for many of the countries in our sample,
#'   but that does not include temporary transitions in and out of democracy.
#'
#'   1. We code a country c as democratic in year t if Freedom House regards it
#'   as "Free" or "Partially Free" and Polity IV gives it a positive democracy
#'   score (The Polity IV index is between -10 and 10). This procedure generates
#'   the bulk of the variation in our democracy measure.
#'
#'   2. For small countries that only appear in the [Freedom
#'   House](download_fh.html) sample, we code them as democratic if their
#'   Freedom House status is "Free" or "Partially Free," and either
#'   [CGV](pacl.html) or [BMR](bmr.html) consider them to be democratic. There
#'   is overwhelming agreement between Freedom House, [CGV](pacl.html) and
#'   [BMR](bmr.html) in all such cases, making the coding straightforward. The
#'   only ambiguous case is Samoa, which is coded as "Free" since 1989 by
#'   [Freedom House](download_fh.html), while [CGV](pacl.html) and
#'   [BMR](bmr.html) both code it as nondemocratic. We follow the latter coding
#'   since rulers in Samoa have a long tenure and are appointed to office for
#'   life. Besides this particular case, there are some countries for which only
#'   Freedom House provides information for the years 2009 and 2010 (the
#'   [CGV](pacl.html) and [BMR](bmr.html) sample ends in 2008 and 2009
#'   respectively). These include Afghanistan, Bahamas, Barbados, Belize, Bosnia
#'   & Herzegovina, Brunei Darussalam, Dominica, Grenada, Iceland, Iraq,
#'   Kiribati, Luxembourg, Maldives, Malta, Nauru, Palau, Samoa, Seychelles, St.
#'   Kitts and Nevis, St. Lucia, St. Vincent & Grens., Suriname, Sao Tome and
#'   Prıncipe, Tonga and Vanuatu. In all of these cases the Freedom House
#'   indicator remains the same since 2008, so we assume these countries remain
#'   in the same political regime that was in place in 2008.
#'
#'   3. Freedom House does not provide any data before 1972. For these early
#'   years, we code a country as democractic if it has a positive Polity score
#'   and either [CGV](pacl.html) or [BMR](bmr.html) code it as democratic. There
#'   are a few cases coded as nondemocracies by [CGV](pacl.html) and
#'   [BMR](bmr.html) with a positive [Polity](polity) score. In these cases, the
#'   [Polity](polityIV.html) score is always near zero and we code the
#'   observation as a nondemocracy.
#'
#'   4. Ex-Soviet and Ex-Yugoslav countries are coded as nondemocracies before
#'   1990, based on the USSR and Yugoslavia scores before their dissolution.
#'
#'   5. When both Freedom House and Polity are missing (174 observations for 16
#'   countries), we rely on our secondary sources and code our measure of
#'   democracy manually. The first country is Antigua and Barbuda, which is
#'   coded as democratic following its independence in 1981. Barbados is set as
#'   democratic from its independence in 1966 until it enters the Freedom House
#'   sample in 1972, after which Freedom House codes it as democratic. Germany,
#'   Iceland, and Luxembourg are coded as always democratic. This matches the
#'   Freedom House coding once they enter into its sample. Kuwait is set to
#'   nondemocratic in 1961 and 1962, until it enters the Polity sample in 1963
#'   and is also coded as nondemocratic. The Maldives are set as nondemocratic
#'   from its independence in 1965, until they enter the Freedom House sample in
#'   1972 and is also coded as nondemocratic. Malta is set as democratic from
#'   its independence in 1964, until it enters the Freedom House sample in 1972
#'   and is also coded as democratic. Nauru is set as democratic from its
#'   independence in 1968 until it enters the Freedom House sample in 1972,
#'   remaining democratic. Syria is coded as nondemocratic in 1960 when it was
#'   not in the Polity sample. It remains nondemocratic in the Polity sample.
#'   Tonga is coded as nondemocratic since its independence. This matches the
#'   Freedom House coding when it enters the sample. Vietnam and Yemen are coded
#'   as always nondemocratic, but they are not in Polity and Freedom House prior
#'   to their unification. However, they were nondemocratic according to all
#'   secondary sources. Samoa is nondemocratic since its independence based on
#'   [CGV](pacl.html) and [BMR](bmr.html) for years in which Polity and Freedom
#'   House are missing. Finally, Zimbabwe is also nondemocratic in 1965-1969,
#'   according to our secondary sources.
#'
#'   6. We remove spurious transitions created when countries enter or leave the
#'   Freedom House, Polity, or our secondary sources' samples. For instance,
#'   these spurious transitions arise when a country appears in (or leaves) the
#'   sample for one of our sources that gives it a more (or less) favorable
#'   assessment than the others. This is the case for Cyprus, Malaysia, Gambia,
#'   and Guyana, which we handled manually. The particular coding of these
#'   countries does not affect our results. We follow most sources and code
#'   Cyprus as democratic after 1974. Malaysia is coded as nondemocratic
#'   throughout. Guyana is coded as nondemocratic between 1966 and 1990 and
#'   democratic in all other years. Finally, Gambia is coded as democratic
#'   between 1965 and 1993 only.
#'
#'   7. Finally, we perform an additional refinements of our measure and adjust
#'   it to match the dates for permanent democratizations that PS coded. These
#'   dates are available for 68 transitions in our sample (recall PS only code
#'   permanent transitions), and are based on historical sources. Some special
#'   cases, for which PS transition dates and our coding are not close in time,
#'   include Guatemala, El Salvador, Iran, Tanzania, and South Africa. For
#'   Guatemala, our coding described above dates a democratization in 1986,
#'   while PS code a permanent transition at the end of the civil war in 1996.
#'   For El Salvador, we code the democratization episode in 1982 based on
#'   Freedom House and Polity, while PS code it in 1994. We do not detect any
#'   transition to democracy for Iran and Tanzania. In all of these cases we
#'   keep our original coding. Our coding produces a transition to democracy in
#'   South Africa during the early 80s based solely on Freedom House and Polity.
#'   However, PS and all secondary sources agree that the official
#'   democratization was in 1994, so we use this date.
#'
#'   Our dichotomous measure of democracy is available for 183 countries and
#'   covers their postindependence period since 1960 and until 2010. Out of the
#'   8,733 country/year observations, we code 3,777 instances of democracy and
#'   4,956 instances of nondemocracy. Out of the 183 countries, 45 are always
#'   democratic, 45 are always nondemocratic, and the rest transition in and out
#'   of democracy. A total of 122 democratizations and 71 reversals suggest
#'   significant within-country variation in our democracy measure.
#'
#'   }
#'
#'   }
#'
#' @template standard-variables
#' @family democracy
#' @family dichotomous democracy indexes
#' @source `r roxygen_cite("anrr")`
"anrr"

# Arat --------------------------------------------------------------------

#' The Arat measure of democracy
#'
#' Democracy score from `r roxygen_cite("arat")` Taken from `r roxygen_cite("pmm2013")`
#'
#' @section Variables:
#'
#'   \describe{
#'
#'   \item{original_country}{The country name, as in the PMM dataset. Use
#'   \code{extended_country_name} instead if you want a consistent name.}
#'
#'   \item{year}{The calendar year.}
#'
#'   \item{arat_pmm}{Democracy index. Ranges from a minumum of 29 to a maximum of 109.} }
#'
#' @template standard-variables
#' @source `r roxygen_cite("arat")` Taken from `r roxygen_cite("pmm2013")`
#' @family democracy
#' @family PMM replication data
#' @family continuous democracy indexes
#' @aliases arat
"arat_pmm"


# BLM ---------------------------------------------------------------------


#' The Bowman, Lehoucq, and Mahoney index of democracy for Central America
#'
#' Contains the trichotomous measure of regime type from `r roxygen_cite("blm")`
#' \url{http://cps.sagepub.com/content/38/8/939}. Data used to be available at
#' \url{http://www.blmdemocracy.gatech.edu/}.
#'
#' @section Variables:
#'
#'   \describe{
#'
#'   \item{year}{The calendar year.}
#'
#'   \item{blm_country}{The country name, as in the original dataset. Use
#'   \code{country_name} instead. Available only for five Latin American
#'   countries (Costa Rica, El Salvador, Guatemala, Honduras and Nicaragua) from
#'   1900 to 2000.}
#'
#'   \item{blm}{Trichotomous index of democracy. 0 = authoritarian, 0.5 =
#'   semidemocratic, 1 = democratic. Available only for five Latin American
#'   countries (Costa Rica, El Salvador, Guatemala, Honduras and Nicaragua) from
#'   1900 to 2000.} }
#' @template standard-variables
#' @source `r roxygen_cite("blm")` Data used to be available at
#'   \url{http://www.blmdemocracy.gatech.edu/}.
#' @family democracy
#' @family PMM replication data
#' @family regional democracy indexes
#' @family trichotomous democracy indexes
"blm"

#' @rdname blm
#' @section Note:
#'
#'   The \code{blm_pmm} version of this data is taken from `r roxygen_cite("pmm2013")` The
#'   original dataset is found in [blm]. The \code{blm_pmm} data only goes back to
#'   1946, but is otherwise identical to the [blm] data. It is included here for
#'   completeness.
"blm_pmm"


# BMR ---------------------------------------------------------------------


#' Boix-Miller-Rosato dichotomous coding of democracy, 1800-2020, version 4.0
#'
#' A dataset containing the Boix-Miller-Rosato (BMR) dichotomous coding of
#' democracy, first used in the paper `r roxygen_cite("bmr")` The complete dataset can be
#' downloaded here: \url{https://sites.google.com/site/mkmtwo/data}. The
#' complete codebook is available there as well.
#'
#' \describe{ \item{bmr_country}{The country name in BMR.}
#'
#' \item{bmr_ccode}{Numeric polity code code in BMR. }
#'
#' \item{abbreviation}{World Bank 3-letter code.}
#'
#' \item{abbreviation_undp}{UNDP 3-letter code.}
#'
#' \item{year}{Year}
#'
#' \item{democracy}{Dichotomous democracy measure. 1 = Democracy.}
#'
#' \item{sovereign}{Dichotomous indicator of sovereignty/independence (if 0,
#' democracy is NA).}
#'
#' \item{democracy_trans}{-1 if democratic breakdown, 0 if no change, 1 if
#' democratic transition.}
#'
#' \item{democracy_breakdowns}{Previous number of democratic breakdowns.}
#'
#' \item{democracy_duration}{Consecutive years of current regime type.}
#'
#' \item{democracy_omitteddata}{This is the same measure as democracy, except it
#' records an NA for countries occupied during an international war (e.g., the
#' Netherlands 1940-44) or experiencing state collapse during a civil war (e.g.,
#' Lebanon 1976-89). The democracy variable instead fills in these years as
#' continuations of the same regime type.}
#'
#' \item{democracy_femalesuffrage}{This adjusts democracy by also requiring that
#' at least half of adult women have the right to vote. 30 countries change
#' values.} }
#' @template standard-variables
#' @source `r roxygen_cite("bmr")` Available at
#'   \url{https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/FJLMKT}
#'   (versions 1-3) and \url{https://sites.google.com/site/mkmtwo/data} (version
#'   4.0)
#' @family democracy
#' @family events data
#' @family dichotomous democracy indexes
"bmr"


# BNR ---------------------------------------------------------------------


#' The Bernhard, Nordstrom & Reenock Event History Coding of Democratic
#' Breakdowns
#'
#' The Bernhard, Nordstrom & Reenock Event History Coding of Democratic
#' Breakdowns. From `r roxygen_cite("bnr")` Data and coding
#' description used to be available at
#' \url{http://users.clas.ufl.edu/bernhard/content/data/data.htm}, but no longer.
#'
#' @section Description:
#'
#'   Taken from the BNR dataset description on the website:
#'
#'   (Time Series:  1913-2005, n: 3654, N: 126, Mean number of countries per
#'   year: 39.28 , Mean number of years per country: 29.46).
#'
#'   The \code{event} variable is a binary coding of all democracies from 1913 until
#'   2005 prepared for use in event history analysis.  Countries that meet the
#'   minimum conditions for democracy (see below) enter the dataset and are
#'   coded "0."  When countries cease to meet those minimum criteria they are
#'   coded "1" and exit from the dataset.  The time frame onset in 1913 is a
#'   function of when the first country (Norway) meets the minimum conditions.
#'   All series terminate in either in a breakdown in various years or right
#'   censorship in 2005.
#'
#'   The minimal conditions are based on Dahl's notion of polyarchy
#'   (competitiveness, inclusiveness) combined with Linz and Stepan's stateness
#'   criteria.
#'
#'   Competitiveness: We include countries that have competitive elections
#'   without gross distortions of fairness.  We excluded cases from our set of
#'   democracies in which we detected outcome changing vote fraud, in which
#'   there was either extensive or extreme violence that inhibited voters from
#'   expressing themselves, or in which political parties representing a
#'   substantial portion of the population were banned.
#'
#'   Inclusivness:  We only include competitive polities in which at least fifty
#'   percent of all adult citizens are enfranchised to vote in our set of
#'   democracies.
#'
#'   Stateness:  We also paid careful attention to questions of sovereignty, not
#'   including in our set of democracies many cases, where despite competitive
#'   elections, full sovereignty was not formally achieved.  We also excluded in
#'   which internal wars in which twenty percent of the population or territory
#'   was out of control of the state were in progress.
#'
#'   \describe{
#'
#'   \item{bnr_country}{The original country name in the dataset.}
#'
#'   \item{bnr_cowcode}{The original COW country code in the dataset.}
#'
#'   \item{year}{Calendar year}.
#'
#'   \item{event}{The event coding. 0 = democracy, 1 = termination.}
#'
#'   \item{bnr}{Only in the \code{bnr_extended} dataset. 0 = non-democracy, 1 =
#'   democracy. Years with a termination event are coded 0. Note that this is
#'   the reverse of the \code{event} variable, where 0 indicates democracy; this is
#'   because the \code{bnr} dataset was originally created for survival analysis.}
#'
#'   }
#' @template standard-variables
#' @source `r roxygen_cite("bnr")` Data and coding
#' description used to be available at
#' \url{http://users.clas.ufl.edu/bernhard/content/data/data.htm}, but no longer.
#' @family democracy
#' @family events data
#' @family dichotomous democracy indexes
"bnr"

#' @rdname bnr
#' @section Note about the "extended" version of the dataset:
#'
#'   The \code{bnr_extended} version of this data is the same as the \code{bnr} data, but
#'   it uses the COW system of states to impute a value of "non-democracy" to
#'   years where the state was in the state system but does not appear in the
#'   original \code{bnr} dataset. For example, Albania first appears in the \code{bnr}
#'   dataset in 1992 as a democracy; but it was in the state system since much
#'   earlier. Since the \code{bnr} dataset claims to record all democratization
#'   events in the COW system of states since 1913, we assume Albania was
#'   non-democratic between 1913 and 1992. This procedure generates a large
#'   number of additional country-years with information about democracy.
"bnr_extended"


# BTI ---------------------------------------------------------------------


#' The Bertelsmann Transformation Index
#'
#' The Bertelsmann Transformation Index of the Bertelsmann Stiftung (2022
#' edition). Data and coding description available at
#' \url{https://www.bti-project.org/en/index/political-transformation.html}
#'
#' @section Description:
#'
#'   The BTI is calculated at Biennial Intervals for approximately 137 countries
#'   since 2006.
#'
#'   \describe{
#'
#'   \item{bti_country}{The original country name in the dataset.}
#'
#'   \item{year}{Calendar year. This is two years earlier than the report date.
#'   For example, the codebook indicates that the BTI report for 2020 assesses
#'   the situation as of January 2019, so I've assigned it a calendar year of
#'   2018.}
#'
#'   \item{bti_region}{Region.}
#'
#'   \item{Ranking_Status_Index}{Country rank in the status index, which "ranks
#'   the countries according to the state of their democracy and market
#'   economy".}
#'
#'   \item{S_Status_Index}{Status index, which combines the democracy and
#'   economy index.}
#'
#'   \item{Ranking_Democracy_Status}{Ranking in democracy status index.}
#'
#'   \item{SI_Democracy_Status}{Democracy status index.}
#'
#'   \item{Q1_Stateness (Q1.1-1.4)}{Scores on questions on stateness (1-10),
#'   from monopoly on the use of force to basic administration. The BTI codebook
#'   says that this concept measures whether "there is clarity about the
#'   nation's existence as a state with adequately established and
#'   differentiated power structures." See codebook at
#'   https://www.bti-project.org/content/en/downloads/codebooks/BTI_2020_Codebook.pdf
#'    for details.}
#'
#'   \item{Q2_Political_Participation (Q2.1-2.4)}{Scores on questions on
#'   political participation (1-10), from free and fair elections to freedom of
#'   expression. The BTI codebook says this concept indicates whether "The
#'   populace decides who rules, and it has other political freedoms". See
#'   codebook at
#'   https://www.bti-project.org/content/en/downloads/codebooks/BTI_2020_Codebook.pdf
#'    for details.}
#'
#'   \item{Q3_Rule_of_Law (Q3.1-3.4)}{Scores on questions on rule of law (1-10),
#'   from checks and balances to civil rights. The BTI codebook says that this
#'   concept measures whether "state powers check and balance one another and
#'   ensure civil rights." See codebook at
#'   https://www.bti-project.org/content/en/downloads/codebooks/BTI_2020_Codebook.pdf
#'    for details.}
#'
#'   \item{Q4_Stability_of_Democratic_Institutions (Q4.1-4.2)}{Scores on
#'   questions on stability of democratic institutions (1-10), from performance
#'   of democratic institutions to commitment to democratic institutions. The
#'   BTI codebook says that this concept measures whether "democratic
#'   institutions are capable of performing, and they are adequately accepted."
#'   See codebook at
#'   https://www.bti-project.org/content/en/downloads/codebooks/BTI_2020_Codebook.pdf
#'    for details.}
#'
#'   \item{Q5_Political_and_Social_Integration (Q5.1-5.4)}{Scores on questions
#'   on political and social integration (1-10), from rootedness of party system
#'   to social capital. The BTI codebook says that this concept measures whether
#'   "Stable patterns of representation exist for mediating between society and
#'   the state; there is also a consolidated civic culture." See codebook at
#'   https://www.bti-project.org/content/en/downloads/codebooks/BTI_2020_Codebook.pdf
#'    for details.}
#'
#'   \item{Ranking_Economy_Status}{Ranking in economy status index.}
#'
#'   \item{SII_Economy_Status}{Economy status index.}
#'
#'   \item{Q6_Level_of_Socioeconomic_Development (Q6.1)}{Score on question on
#'   the level of socioeconomic development (1-10). The BTI codebook says that
#'   this concept measures whether "In principle, the country's level of
#'   development permits adequate freedom of choice for all citizens." See
#'   codebook at
#'   https://www.bti-project.org/content/en/downloads/codebooks/BTI_2020_Codebook.pdf
#'    for details.}
#'
#'   \item{Q7_Organization_of_the_Market_and_Competition (Q7.1-7.4)}{Scores on
#'   questions on market organization and competition (1-10), from market
#'   organization to banking system. The BTI codebook says that this concept
#'   measures whether "There are clear rules for stable, market-based
#'   competition." See codebook at
#'   https://www.bti-project.org/content/en/downloads/codebooks/BTI_2020_Codebook.pdf
#'    for details.}
#'
#'   \item{Q8_Monetary_and_Fiscal_Stability (Q8.1-8.2)}{Scores on questions on
#'   monetary and fiscal stability (1-10). The BTI codebook says that this
#'   concept measures whether "There are institutional and political precautions
#'   to achieve monetary and fiscal stability." See codebook at
#'   https://www.bti-project.org/content/en/downloads/codebooks/BTI_2020_Codebook.pdf
#'    for details.}
#'
#'   \item{Q9_Private_Property (Q9.1-9.2)}{Scores on questions on private
#'   property and property rights (1-10). The BTI codebook says that this
#'   concept measures whether "There are adequate conditions to support a
#'   functional private sector." See codebook at
#'   https://www.bti-project.org/content/en/downloads/codebooks/BTI_2020_Codebook.pdf
#'    for details.}
#'
#'   \item{Q10_Welfare_Regime (Q10.1-10.2)}{Scores on questions on welfare
#'   policy and safety nets (1-10). The BTI codebook says that this concept
#'   measures whether "There are viable arrangements to compensate for social
#'   risks." See codebook at
#'   https://www.bti-project.org/content/en/downloads/codebooks/BTI_2020_Codebook.pdf
#'    for details.}
#'
#'   \item{Q11_Economic_Performance (Q11.1)}{Score on question on economic
#'   performance (1-10). The BTI codebook says that this concept measures
#'   whether "The economy's performance points to solid development." See
#'   codebook at
#'   https://www.bti-project.org/content/en/downloads/codebooks/BTI_2020_Codebook.pdf
#'    for details.}
#'
#'   \item{Q12_Sustainability (Q12.1-12.2)}{Scores on questions on
#'   sustainability, from environmental policy to R&D policy (1-10). The BTI
#'   codebook says that this concept measures whether "Economic growth is
#'   balanced, environmentally sustainable and future-oriented." See codebook at
#'   https://www.bti-project.org/content/en/downloads/codebooks/BTI_2020_Codebook.pdf
#'    for details.}
#'
#'   \item{Ranking_Governance_Index}{Ranking in governance status index.}
#'
#'   \item{G_Governance_Index}{Governance status index.}
#'
#'   \item{Q13_Level_of_Difficulty (Q13.1-13.5)}{Scores on questions on level of
#'   difficulty in governance (1-10), plus some rescaled measures of objective
#'   difficulty (education, stateness, GNI per capita). See codebook at
#'   https://www.bti-project.org/content/en/downloads/codebooks/BTI_2020_Codebook.pdf
#'    for details.}
#'
#'   \item{Q14_Steering_Capability (Q14.1-14.3)}{Scores on questions on the
#'   government's steering capability, from prioritization to policy learning
#'   (1-10). The BTI codebook says that this concept measures whether "The
#'   government manages reforms effectively and can achieve its policy
#'   priorities." See codebook at
#'   https://www.bti-project.org/content/en/downloads/codebooks/BTI_2020_Codebook.pdf
#'    for details.}
#'
#'   \item{Q15_Resource_Efficiency (Q15.1-15.3)}{Scores on questions on the
#'   government's efficiency, from efficient use of assets to anti-corruption
#'   capability (1-10). The BTI codebook says that this concept measures whether
#'   "The government makes optimum use of available resources." See codebook at
#'   https://www.bti-project.org/content/en/downloads/codebooks/BTI_2020_Codebook.pdf
#'    for details.}
#'
#'   \item{Q16_Consensus-Building (Q16.1-16.6)}{Scores on questions on the
#'   government's ability to build consensus, from consensus on goals to civil
#'   society participation to reconciliation (1-10). The BTI codebook says that
#'   this concept measures whether "The political leadership establishes a broad
#'   consensus on reform with other actors in society without sacrificing its
#'   reform goals." See codebook at
#'   https://www.bti-project.org/content/en/downloads/codebooks/BTI_2020_Codebook.pdf
#'    for details.}
#'
#'   \item{Q17_Consensus-Building (Q17.1-17.3)}{Scores on questions on the
#'   government's international cooperation, from effective use of support to
#'   credibility to regional cooperation (1-10). The BTI codebook says that this
#'   concept measures whether "The political leadership is willing and able to
#'   cooperate with external supporters and organizations." See codebook at
#'   https://www.bti-project.org/content/en/downloads/codebooks/BTI_2020_Codebook.pdf
#'    for details.}
#'
#'   }
#' @template standard-variables
#' @source `r roxygen_cite("bti")` Available at
#'   \url{https://www.bti-project.org/en/index/political-transformation.html}
#' @family democracy
#' @family continuous democracy indexes
"bti"

# Bollen ------------------------------------------------------------------


#' The Bollen measure of democracy
#'
#' 0-100 index of democracy from Bollen, Kenneth A. 2001. "Cross-National
#' Indicators of Liberal Democracy, 1950-1990." 2nd ICPSR version. Chapel Hill,
#' NC: University of North Carolina, 1998. Ann Arbor, MI: Inter-university
#' Consortium for Political and Social Research, 2001. Original data available
#' at \url{https://www.icpsr.umich.edu/web/ICPSR/studies/2532/publications}.
#' Taken from `r roxygen_cite("pmm2013")`
#'
#' @section Variables:
#'
#'   \describe{
#'
#'   \item{original_country}{The country name, as in the PMM dataset. Use
#'   \code{extended_country_name} instead if you want a consistent name.}
#'
#'   \item{year}{The calendar year.}
#'
#'   \item{bollen_pmm}{Democracy index. Ranges from 0 to 100.} }
#' @template standard-variables
#' @source `r roxygen_cite("bollenPaxton")`
#' @source `r roxygen_cite("bollen2001")` Original data available
#' at \url{http://webapp.icpsr.umich.edu/cocoon/ICPSR-STUDY/02532.xml}. Taken from
#' `r roxygen_cite("pmm2013")`
#' @family democracy
#' @family PMM replication data
#' @family continuous democracy indexes
#' @aliases bollen
"bollen_pmm"

# EIU ------------------------------------------------------------


#' The Economist Intelligence Unit's Democracy Index
#'
#' A dataset containing the country-year version of the democracy index compiled
#' by the Economist Intelligence Unit, 2006-2022. From the report "Democracy
#' Index 2022: Frontline democracy and the battle for Ukraine", available at
#' \url{https://www.eiu.com/topic/democracy-index}.
#'
#' \describe{
#'
#' \item{eiu_country}{Country name as in the original tables.}
#'
#' \item{eiu}{Democracy index, ranging from 0 (least democratic) to to 10 (most
#' democratic). The report says that the index "is based on five categories:
#' electoral process and pluralism; civil liberties; the functioning of
#' government; political participation; and political culture" which form "one
#' interrelated whole".}
#'
#' }
#' @template standard-variables
#' @family democracy
#' @family continuous democracy indexes
#' @source `r roxygen_cite("eiu")` \url{https://www.eiu.com/topic/democracy-index}.
"eiu"

# Doorenspleet ------------------------------------------------------------


#' Renske Doorenspleet's Democracy Dataset
#'
#' A dataset containing the country-year version of the democracy classification
#' described in `r roxygen_cite("doorenspleet")`
#'
#' \describe{
#'
#' \item{doorenspleet_country}{Country name as in Doorenspleet.}
#'
#' \item{doorenspleet_regime}{Regime type: A = Authoritarian, D = Democracy, I =
#' interruption.
#'
#' Doorenspleet notes that the classification of democracy depends on two things
#' (pp. 391-392 of the article):
#'
#' The first requirement of minimal democracies, the presence of competition,
#' can be seen to be met if there exist institutions and procedures through
#' which citizens can express effective preferences about alternative policies
#' at the national level and if there are institutionalized constraints on the
#' exercise of power by the executive. Indicators of these phenomena have
#' already been collated in Gurr's well-known Polity III data set, which covers
#' most independent countries on an annual basis from 1800 to 1994; it is
#' therefore an ideal source to measure the presence of competition.21 Moreover,
#' these data are also easily adapted to the definition of competition employed
#' in this analysis. In operational terms, I will consider a national political
#' system to be competitive if there is at least one executive chosen by
#' competitive popular elections (if Gurr's indicator "competitiveness of
#' executive recruitment" is coded 3 or 4); if all the politically active
#' population has an opportunity, in principle, to attain an executive position
#' through a regularized process (if Gurr's indicator "openness of executive
#' recruitment" is coded 3 or 4); if alternative preferences for policy and
#' leadership can be pursued in the political arena, such that oppositional
#' activity is not restricted or suppressed (if Gurr's indicator
#' "competitiveness of participation" is coded 0, 3, 4, 5); and if there are at
#' least substantial limitations on the exercise of executive power (if Gurr's
#' indicator "constraints on the power of the chief executive" is coded 4, 5, 6,
#' or 7).
#'
#' The second requirement of minimal democracies is that there be inclusive,
#' universal suffrage at the national level. The norm of universality requires
#' that all citizens of the state--without regard to sex, race, language,
#' descent, income, land holdings, education, or religious beliefs--formally
#' enjoy the right to vote and to be elected to public office. The fact that
#' certain prerequisites are demanded, such as a minimum age, a sound mind, or
#' the absence of criminal record, does not negate this principle. Only
#' countries that at some stage meet the first requirement of competition from
#' 1800 to 1994 are considered when measuring the inclusiveness of the system.
#' Levels of inclusiveness of the political system may be broken down into one
#' of the following four categories: (1) no popular suffrage; (2) suffrage
#' denied to large segments of the population (more than 20 percent is
#' excluded); (3) suffrage with partial restrictions (less than 20 percent of
#' the population is excluded);(4) universal suffrage or minor restrictions. For
#' the purposes of this analysis, countries are considered "sufficiently"
#' inclusive to meet the criterion of a minimal democracy if they fall into the
#' third or fourth category. Should they fall within either of the first two
#' categories or should they not meet the competition criterion, they are
#' classified as authoritarian regimes. Reliable data on inclusiveness are of
#' course difficult to obtain and to standardize, and I have had to rely on
#' historical sources and various monographs for each country, as well as on
#' Keesing's *Record of World Events* and many of the standard handbooks and
#' almanacs. The appendix gives an overview of the years in which political
#' systems can be considered as both competitive and inclusive and hence are
#' classified in this study as "minimal democracies."
#'
#' (This description suggests one could replicate Doorenspleet's measure using
#' data from [PIPE] or [LIED] as well as the newest version of [polity];
#' Doorenspleet uses Polity III data)}
#'
#' \item{doorenspleet}{Regime type: 1 = Authoritarian, 2 = Democracy,
#' interruption codes as NA.}
#'
#' \item{year}{Year. Regimes are coded as of the 31 Dec of the year.}
#'
#' \item{start_year}{First year of the regime.}
#'
#' \item{end_year}{Last year of the regime.} }
#' @template standard-variables
#' @family democracy
#' @family dichotomous democracy indexes
#' @source `r roxygen_cite("doorenspleet")`
"doorenspleet"


# Freedom House -----------------------------------------------------------


#' Freedom House "Freedom in the World" data from Pemstein, Meserve, and
#' Melton's replication dataset
#'
#' This is the Freedom House data included in `r roxygen_cite("pmm2013")` It differs for
#' some country-years from the current version of the Freedom House data, which
#' can be accessed using \link{download_fh}; hence its inclusion here.
#'
#' @section Variables:
#'
#'   \describe{
#'
#'   \item{pmm_country}{The original country name in the PMM replication data.}
#'
#'   \item{year}{The calendar year. This is approximate. The surveys cover
#'   specific periods in the original data that do not always overlap with a
#'   single year. In particular, the year 1981 is "skipped" -- a single survey
#'   covers Jan.1981 - Aug. 1982 and its value is assigned to 1982 here.}
#'
#'   \item{fh_pmm}{A reversed measure of political rights and civil liberties,
#'   from 1 to 7, with higher values being more democratic (the opposite of the
#'   actual FH data).} }
#'
#' @template standard-variables
#'
#' @source `r roxygen_cite("pmm2013")`
#' @family democracy
#' @family Freedom House
#' @family PMM replication data
#' @family ordinal democracy indexes
#' @seealso \link{download_fh} and \link{download_fh_electoral}
#' @aliases fh
"fh_pmm"


# Hadenius ----------------------------------------------------------------

#' Axel Hadenius' Index of Democracy
#'
#' 0-10 index of democracy from `r roxygen_cite("hadenius1992")`
#' Taken from `r roxygen_cite("pmm2013")` Higher values are more democratic.
#'
#' @section Variables:
#'
#'   \describe{
#'
#'   \item{pmm_country}{The original country name in the PMM replication data.}
#'
#'   \item{year}{The calendar year. This is approximate. The surveys cover
#'   specific periods in the original data that do not always overlap with a
#'   single year. In particular, the year 1981 is "skipped" -- a single survey
#'   covers Jan.1981 - Aug. 1982 and its value is assigned to 1982 here.}
#'
#'   \item{hadenius_pmm}{0-10 index of democracy from `r roxygen_cite("hadenius")`
#'   Only available for 129 countries in 1988.} }
#'
#' @template standard-variables
#'
#' @source `r roxygen_cite("pmm2013")`
#' @family democracy
#' @family PMM replication data
#' @family continuous democracy indexes
#' @aliases hadenius
"hadenius_pmm"

# LIED --------------------------------------------------------------------


#' The Lexical Index of Democracy, v. 6.4
#'
#' The Lexical Index of Democracy first described in `r roxygen_cite("LIED")`
#' Original data and variable descriptions available at
#' \url{https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/WPKNIT}.
#' The dataset is now on version 6.4, and contains new variables. The
#' documentation below is copied from their codebook, with some small additions
#' for clarification purposes.
#'
#' @section Description of the Construction of LIED:
#'
#'   To code the lexical index we make use of five variables developed initially
#'   in the Political Institutions and Events ([PIPE]) dataset (Przeworski et
#'   al. 2013): LEGSELEC, EXSELEC, OPPOSITION, MALE SUFFRAGE, and FEMALE
#'   SUFFRAGE. Since [PIPE] does not attempt to measure the quality of
#'   elections, we generate a sixth variable: COMPETITION. All variables are
#'   binary, coded 1 if the following circumstances obtain, and 0 otherwise.
#'
#'   \describe{
#'
#'   \item{lied_country}{The country name used in the original dataset. 2
#'   country-years were repeated in the original data and have been dropped.}
#'
#'   \item{lied_cow}{The COW country code used in the original dataset.}
#'
#'   \item{vdem}{The V-Dem country code.}
#'
#'   \item{year}{Calendar year.}
#'
#'   \item{legselec}{A legislative body issues at least some laws and does not
#'   perform executive functions. The lower house (or unicameral chamber) of the
#'   legislature is at least partly elected. The legislature has not been
#'   closed.}
#'
#'   \item{exselec}{The chief executive is either directly or indirectly elected
#'   (i.e., chosen by people who have been elected)}
#'
#'   \item{opposition}{The lower house (or unicameral chamber) of the
#'   legislature is (at least in part) elected by voters facing more than one
#'   choice. Specifically, parties are not banned and (a) more than one party is
#'   allowed to compete or (b) elections are nonpartisan (i.e., all candidates
#'   run without party labels)}
#'
#'   \item{male_suffrage}{Virtually all male citizens are allowed to vote in
#'   national elections. Legal restrictions pertaining to age, criminal
#'   conviction, incompetence, and local residency are not considered. Informal
#'   restrictions such as those obtaining in the American South prior to 1965
#'   are also not considered.}
#'
#'   \item{female_suffrage}{Virtually all female citizens are allowed to vote in
#'   national elections. Similar coding rules apply.}
#'
#'   \item{competition}{The chief executive offices and seats in the effective
#'   legislative body are filled by elections characterized by uncertainty (see
#'   Przeworski 2000: 16- 17), meaning that the elections are, in principle,
#'   sufficiently free to enable the opposition to gain power if they were to
#'   attract sufficient support from the electorate. This presumes that control
#'   over key executive and legislative offices is determined by elections, the
#'   executive and members of the legislature have not been unconstitutionally
#'   removed, and the legislature has not been dissolved. With respect to the
#'   electoral process, this presumes that the constitutional timing of
#'   elections has not been violated (in a more than marginal fashion),
#'   non-extremist parties are not banned, opposition candidates are generally
#'   free to participate, voters experience little systematic coercion in
#'   exercising their electoral choice, and electoral fraud does not determine
#'   who wins. With respect to the outcome, this presumes that the declared
#'   winner of executive and legislative elections reflects the votes cast by
#'   the electorate, as near as can be determined from extant sources. Incumbent
#'   turnover (as a result of multi-party elections) is regarded as a strong
#'   indicator of competition, but is neither necessary nor sufficient. In
#'   addition, we rely on reports from outside observers (as reported in books,
#'   articles, and country reports) about whether the foregoing conditions have
#'   been met in a given election (see Svolik 2012: 24). Coding for this
#'   variable does not take into account whether there is a level playing field,
#'   whether all contestants gain access to funding and media, whether media
#'   coverage is unbiased, whether civil liberties are respected, or other
#'   features associated with fully free and fair elections. COMPETITION thus
#'   sets a modest threshold.}
#'
#'   \item{lexical_index}{To generate the lexical index from these six binary
#'   variables, a country-year is assigned the highest score (L0-6) for which it
#'   fulfills all requisite criteria, as follows:
#'
#'   L0: LEGSELEC=0 & EXSELEC=0.
#'
#'   L1: LEGSELEC=1 or EXSELEC=1.
#'
#'   L2: LEGSELEC=1 & OPPOSITION=1.
#'
#'   L3: LEGSELEC=1 & OPPOSITION=1 & EXSELEC=1.
#'
#'   L4: LEGSELEC=1 & OPPOSITION=1 & EXSELEC=1 & COMPETITION=1.
#'
#'   L5: LEGSELEC=1 & OPPOSITION=1 & EXSELEC=1 & COMPETITION=1 & (MALE
#'   SUFFRAGE=1 or FEMALE SUFFRAGE=1).
#'
#'   L6: LEGSELEC=1 & OPPOSITION=1 & EXSELEC=1 & COMPETITION=1 & MALE SUFFRAGE=1
#'   & FEMALE SUFFRAGE=1.
#'
#'   In a small number of cases, the resulting index appears to have been
#'   incorrectly constructed:
#'
#'   ```{r, echo = FALSE}
#'
#'   LIED %>% filter(lexical_index !=
#'   lexical_index_original) %>% select(lied_country, year, lexical_index,
#'   lexical_index_original)
#'
#'   ```
#'
#'   I've recalculated the index for these cases and put the original value in
#'   the `lexical_index_original` variable.}
#'
#'   \item{political_liberties}{Freedom of expression, freedom of assembly, and
#'   freedom of association are respected. All groups, which are not openly
#'   anti-democratic, are allowed to organize freely and to assemble peacefully,
#'   and free speech, including critique of government and state-authorities, is
#'   tolerated and practiced freely by individuals and groups, including private
#'   as well as public media outlets. 1=present, 0=absent.}
#'
#'   \item{lexical_index_plus}{This index, LIED+, adds an extra layer to the
#'   upper-end of LIED in the form of political liberties. This is done to
#'   distinguish between electoral democracies and polyarchies. The meaning of
#'   the scores from 0 to 5 are identical to LIED, whereas 6 and 7 refer to the
#'   following configurations of indicator values:
#'
#'   L6: legislative_elections=1 & multi-party_legislative_elections=1 &
#'   executive_elections=1 & competitive_elections=1 & male_suffrage=1 &
#'   female_suffrage=1 & political_liberties=0 (regime type: electoral
#'   democracies)
#'
#'   L7: legislative_elections=1 & multi-party_legislative_elections=1 &
#'   executive_elections=1 &  competitive_elections=1 & male_suffrage=1 &
#'   female_suffrage=1 & political_liberties=1 (regime type: polyarchies)}
#'
#'   \item{democratic_transition}{Indicates whether a democratic transition took
#'   place in a given year as signified by a change in the competitive_elections
#'   indicator from 0 in the previous year to 1 in the current year. 1=present,
#'   0=absent.}
#'
#'   \item{transition_type}{For all country-years with democratic transitions,
#'   we have coded the mode of transition based on a distinction between:
#'   1=conversion (incumbent-led), 2=cooperative (pact between incumbents and
#'   opposition/balanced influence), 3=collapse (opposition-led), 4=foreign
#'   supervision (imposition by foreign power based on intervention or highly
#'   asymmetrical – partial or full – decolonization), 5=foreign liberalization
#'   (democracy reemerges after occupational power has lost war to foreign
#'   powers). Country-years without democratic transitions are scored 0.}
#'
#'   \item{democratic_breakdown}{Indicates whether a democratic breakdown took
#'   place in a given year as signified by a change in competitive_elections
#'   indicator from 1 in the previous year to 0 in the current year. 1=present,
#'   0=absent.}
#'
#'   \item{breakdown_type}{For all country-years with democratic transitions, we
#'   have coded the mode of transition based on a distinction between:
#'   1=implicit regression induced by incumbents, 2=military coup, 3=foreign
#'   occupation, 4=self-coup (incumbents close down parliament unduly and take
#'   full political control), 5=coup or civil conflict headed by opposition
#'   party/movement, 6=coup headed by monarch. Country-years without democratic
#'   breakdowns are scored 0.}
#'
#'   \item{turnover_period}{Indicates whether a particular country-year is part
#'   of a period between an initial electoral government alternation (as
#'   indicated by a turnover event, see below) in a multi-party electoral regime
#'   and an interruption of the same multi-party electoral regime (as indicated
#'   by a score of 0 on executive elections or
#'   multi-party_legislative_elections, see above). If another turnover event
#'   happens later in the same polity, a new turnover period begins. 1=present,
#'   0=absent.}
#'
#'   \item{turnover_event}{Indicates whether partisan control over government
#'   power alternated from an elected chief executive to another
#'   party/coalition/candidate representing the opposition as a consequence of a
#'   multi-party election in a particular country-year. Multi-party legislative
#'   and (direct or indirect) executive elections are considered necessary
#'   conditions for a genuine turnover. 1=present, 0=absent.}
#'
#'   \item{two_turnover_period}{Indicates whether a particular country-year is
#'   part of a period between a second electoral government alternation (as
#'   indicated by a turnover event, see below) in a multi-party electoral regime
#'   and an interruption of the same multi-party electoral regime (as indicated
#'   by a score of 0 on executive elections or
#'   multi-party_legislative_elections, see above). If two turnover events
#'   happens later in the same polity under a new multi_party electoral regime,
#'   a new two-turnover period begins. 1=present, 0=absent.}
#'
#'   \item{sovereign}{Indicates whether a polity/country is a separate unit in
#'   the international system of states (1) or subjected to foreign colonization
#'   or occupation with formal loss of autonomy (0).}
#'
#'   }
#' @template standard-variables
#'
#' @section Deviations from [PIPE]:
#'
#'   The LIED compilers state that:
#'
#'   Although we employ [PIPE] as an initial source for coding LEGSELEC,
#'   EXSELEC, OPPOSITION, MALE SUFFRAGE, and FEMALE SUFFRAGE, we deviate from
#'   PIPE--based on our reading of country specific sources--in several ways.
#'   First, with respect to executive elections, in the [PIPE] dataset "Prime
#'   ministers are always coded as elected if the legislature is open." However,
#'   for our purposes we need an indicator that also takes into account whether
#'   the government is responsible to an elected parliament if the executive is
#'   not directly elected--a situation generated by a number of European
#'   monarchies prior to World War I, by episodes of international supervision
#'   such as Bosnia-Herzegovina in the first years following the civil war, and
#'   by some monarchies in the Middle East and elsewhere (e.g., Liechtenstein,
#'   Monaco, and Tonga) in the contemporary era. To illustrate, [PIPE] codes
#'   Denmark as having executive elections from 1849 to 1900 although the
#'   parliamentary principle was not established until 1901. Before then, the
#'   government was accountable to the king. Among the current cases with
#'   elected multiparty legislatures not fulfilling this condition, we find
#'   Jordan and Morocco. In order to achieve a higher level of concept-measure
#'   consistency, we have thus recoded all country-years (based on
#'   country-specific accounts) for this variable where our sources suggested
#'   doing so.
#'
#'   We also conduct original coding for countries whose coding is incomplete in
#'   PIPE and for additional countries such as the German principalities that
#'   are not covered in PIPE. In this fashion, we generate a complete dataset
#'   for all six variables covering all independent countries of the world in
#'   the period under study (1800-2013 or 1789-2019 for v. 5.2). Whereas the
#'   numbers of observations for the PIPE variables range between 14,465 and
#'   15,302, our dataset provides 18,142 observations for all variables. Except
#'   for minor adjustments regarding executive elections (mentioned above), this
#'   additional coding follows the rules laid out in the PIPE codebook. Coding
#'   decisions are based on country-specific sources that are too numerous to
#'   specify. In rare instances we stumbled upon information that required a
#'   re-coding of PIPE variables, so the two datasets do not correspond exactly.
#'
#'   Countries are coded across these conditions for the length of their
#'   sovereign existence within the 1800-2013 (1789-2019 for v. 5.2) timespan,
#'   generating a dataset with 221 countries. To identify independent countries
#'   we rely on Gleditsch (2013) and Correlates of War (2011), supplemented from
#'   1800 to 1815 by various country-specific sources. Importantly, electoral
#'   democracy does not presume complete sovereignty. A polity may be
#'   constrained in its actions by other states, by imperial control (as over a
#'   colony), by international treaties, or by world markets. Thus, to say that
#'   a polity is an electoral democracy is to say that it functions as such for
#'   policies over which it enjoys decisionmaking power. Scores for each
#'   indicator reflect the status of a country on the last day of the calendar
#'   year (31 December) and are not intended to reflect the mean value of an
#'   indicator across the previous 364 days.
#' @family democracy
#' @family institutions
#' @aliases lied
#' @encoding UTF-8
#' @source `r roxygen_cite("LIED")` Original data and variable
#'   descriptions available at
#'   \url{https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/WPKNIT}
#'
#'
"LIED"


# Mainwaring --------------------------------------------------------------

#' Mainwaring, Brinks, and Perez Liñán's democracy measure for Latin America
#'
#' Trichotomous democracy indicator from `r roxygen_cite("mainwaring2001")`
#' Extended in `r roxygen_cite("mainwaring2014")` Original data used to be available
#' from
#' \url{http://kellogg.nd.edu/scottmainwaring/Political_Regimes.pdf}, though no
#' longer.
#'
#' @section Variables:
#'
#'   \describe{
#'
#'   \item{mainwaring_country}{The original country name.}
#'
#'   \item{year}{The calendar year. }
#'
#'   \item{mainwaring}{Trichotomous numerical democracy indicator from `r roxygen_cite("mainwaring")`
#'   0 = non-democracy, 0.5 = hybrid, 1 = democracy.}
#'
#'   \item{Regime}{Trichotomous democracy indicator. From the published
#'   article:
#'
#'   When governments commit no violation of any of the four criteria
#'   (elections, franchise, civil liberties, and civilian power), they are coded
#'   as democratic. They rank as authoritarian if they present one or more major
#'   violations or as semi-democratic if they display only partial failures in
#'   one or more categories.}
#'
#'   \item{Elections}{Measure of whether the principle of free and fair
#'   elections is violated. MV = major violation, NV = No violation, PV =
#'   partial violation. From the published article:
#'
#'   A major violation of this democratic principle occurs if:
#'
#'   * the head of government or the legislature is not elected.
#'
#'   * the government uses its resources (patronage, repression, or a
#'   combination of both) to ensure electoral victory--i.e., there are
#'   systematic complaints about fraud or repression, and there is virtual
#'   certainty about the outcome of presidential elections (e.g., Mexico
#'   1945-88, Argentina 1952-55, E1 Salvador 1952-63, Paraguay 1960-89).
#'
#'   * through fraud, manipulation, or outright repression, the government makes
#'   it impossible for a wide gamut of parties to compete (or if they do
#'   compete, to take office).
#'
#'   A partial violation occurs if:
#'
#'   * there are systematic complaints of rigged elections and/or harassment of
#'   the opposition but there is still uncertainty about electoral outcomes and
#'   the government fails to capture large majorities in the legislature; or the
#'   military vetoed a few "unacceptable" but important presidential candidates
#'   (e.g., Argentina 1958-66); fraud affected but did not thoroughly skew
#'   electoral results; or the elections were conducted under substantially
#'   unequal playing rules (e.g., Nicaragua in 1984 because the Sandinistas
#'   dominated the media and pressured opposition groups, E1 Salvador in the
#'   1980s because the left faced massive repression). }
#'
#'   \item{Franchise}{Measure of whether the principle of inclusive franchise is
#'   violated. MV = major violation, NV = No violation, PV = partial violation.
#'   NA if the electoral principle is coded MV. From the published article:
#'
#'   A major violation of this democratic principle occurs if a large part of
#'   the adult population is disenfranchised on ethnic, class, gender, or
#'   educational grounds in ways that:
#'
#'   * likely prevent very different electoral outcomes (or so is widely
#'   believed); or
#'
#'   * are unusually exclusionary for that historical period; or
#'
#'   * trigger mass social protests.
#'
#'   A partial violation occurs if disenfranchisement of some social groups
#'   occurs in ways that are not likely to significantly shape electoral
#'   outcomes. }
#'
#'   \item{Civil.Liberties}{Measure of whether the civil liberties are violated.
#'   MV = major violation, NV = No violation, PV = partial violation. NA if the
#'   electoral principle is coded MV. From the published article;
#'
#'   A major violation of democratic principles occurs if:
#'
#'   * gross human rights violations or censorship against opposition media
#'   occur systematically; or
#'
#'   * political parties are not free to organize--i.e., most major parties are
#'   banned, just a single party is allowed to exist, or a few parties are
#'   tightly controlled by the government (e.g., Panama 1968-1980, Paraguay
#'   1947-59, Brazil 1965-79).
#'
#'   A partial violation occurs if:
#'
#'   * violations of human rights are less widespread but still affect the
#'   opposition's capacity to organize in some geographic areas or some social
#'   sectors; or
#'
#'   * there is intermittent censorship of the media or regular prohibition of
#'   one major party or candidate. }
#'
#'   \item{Civilian.Power}{Measure of whether the elected rulers enjoy real
#'   governing capacity (e.g., are not overruled by the military). MV = major
#'   violation, NV = No violation, PV = partial violation. NA if the electoral
#'   principle is coded MV. From the published article:
#'
#'   A major violation of this democratic principle occurs if:
#'
#'   * military leaders or the military as an institution openly dominate major
#'   policy areas not strictly related to the armed forces; or
#'
#'   * if the elected head of government is a puppet, such that the electoral
#'   process does not really determine who governs.
#'
#'   A partial violation occurs if military leaders or the military as an
#'   institution are able to veto important policies in a few areas not related
#'   to the armed forces (e.g., Ecuador 1961-62).
#' }
#'
#' \item{From}{First year of the regime.}
#'
#' \item{To}{Last year of the regime.}
#'
#' }
#'
#' @template standard-variables
#'
#' @source `r roxygen_cite("mainwaring2014")`
#' @source `r roxygen_cite("pmm2013")`
#' @family democracy
#' @family PMM replication data
#' @family regional democracy indexes
#' @family trichotomous democracy indexes
"mainwaring"


#' @rdname mainwaring
#' @section Note:
#'
#'   The \link{mainwaring_pmm} version of this data is taken from `r roxygen_cite("pmm2013")`
#'   It only contains a numeric version of the
#'   Mainwaring Regime indicator, ranging from -1 (Authoritarian) to 0
#'   (Semidemocracy) to 1 (Democracy). The original dataset is found in
#'   \link{mainwaring}. PMM's replication data is actually missing a fair number
#'   of the data points in the original dataset, but the original dataset is not
#'   missing any of their data points, and there are no differences between the
#'   data points wherever both the original and the replication data have values.
#'   It is included here for completeness.
"mainwaring_pmm"


# Magaloni, Min, Chu ------------------------------------------------------

#' Autocracies of the World, 1950-2012 (Version 1.0).
#'
#' The "Autocracies of the World" dataset by `r roxygen_cite("magaloni")`
#' Original data and codebook used to be available at the link.
#' The documentation here is directly derived from this codebook.
#'
#' @section Overview:
#'
#'   This dataset classifies the world's political regimes, primarily focusing
#'   on distinctions among different types of autocracies, between 1950 and
#'   2012. Over the last decade, academic work on political institutions has
#'   placed more focus on differences within autocracies-a group of polities
#'   that were long treated as a homogenous pool defined by "lack of democracy."
#'   Advancing the literature, contributions such as Geddes (2003) have observed
#'   and delineated differences in the governing institutions, power holders,
#'   and nature of governance among various autocratic governments. Such studies
#'   have given rise to a wealth of insightful research.
#'
#'   Attempts to study autocracies in a larger-scale, quantitative manner have
#'   resulted in the creation of datasets that classify countries over time
#'   using varying taxonomies. The field of extant datasets is relatively new
#'   and still developing. (For examples, see Wahman et al. 2013; Geddes et al.
#'   2011; and Cheibub et al. 2010.) We seek to contribute to this research
#'   agenda with this first edition of a new dataset.
#'
#'   Our dataset includes several features that we believe are quite useful.
#'   These include:
#'
#'   * Avoiding "missing," "transitional," and hybrid classifications. Many
#'   countries have tumultuous years of instability, transition, and flux.
#'   However, this does not eliminate the fact that a government of some sort
#'   exists during these years. Substantial efforts were made to figure out the
#'   institutions underlying transitional regimes. For example, a military
#'   government can oversee a transition to democracy. Thus, rather than leave
#'   certain observations blank, we create a separate variable for transitional
#'   years to allow researcher the flexibility of deciding whether or not those
#'   observations are relevant to their analysis. (The only exception is Somalia
#'   from 1991 to 2006, where the polity seems truly "stateless.") Similarly, we
#'   sought to eliminate hybrid regime classifications. There are high quality
#'   datasets available for scholars who are interested analyzing hybrid
#'   authoritarian regimes (such as Geddes et al. 2011). We have found, however,
#'   that hybrid classifications often (1) hinder useful quantitative analysis
#'   or (2) are actually essentially one type of regime, but only appear hybrid
#'   due to certain window-dressing institutional features. Finding the
#'   "essential" regime type seems to be a valuable contribution.
#'
#'   * Providing two novel and objective measures of personalism. Currently
#'   available datasets recognize that certain autocratic regimes are highly
#'   "personalistic" and have created a personalist regime type. We agree that
#'   personalism is an important feature of many autocracies, but we depart from
#'   previous work in our belief that personalism is a quality distinct from the
#'   regime's institutions and is a concept that should be operationalized as
#'   its own variable. In other words, all autocracies have some degree of
#'   personalism: a military regime, for example, could have a very
#'   non-personalistic, corporate leadership or it can have a highly
#'   personalistic general as the head of state. In addition to treating
#'   personalism as a distinct concept, we have observed that measures of
#'   personalism lack objective and clear criteria for measurement. Most
#'   existing datasets rely on general consensus of the qualitative literature
#'   to identify a personalistic regime. Given these two concerns, we provide
#'   two measures of personalism (detailed below) in this dataset.
#'
#'   * Classifying through 2012. In covering up to 2012, the dataset will
#'   hopefully retain some longevity as other complementary datasets, many of
#'   which end in the mid-2000s, are extended into more recent years. We also
#'   hope to update this dataset periodically with more years and useful
#'   covariates.
#'
#' @section Summary of Variables:
#'
#'   Several sets of variables come in pairs: \code{variable_r} and
#'   \code{variable_nr}. These correspond with rounded and non-rounded values.
#'   The rationale and methodology behind these pairs of data is provided in the
#'   section entitled "Transition Years and Rounding." (See online codebook).
#'
#'   Two datasets are provided. The original dataset (\code{magaloni}) and an
#'   "extended" but simplified dataset (\code{magaloni_extended}) that extends
#'   the duration of the first regime (\code{regime_nr} and \code{demo_nr}) for
#'   each country backwards in time before 1950 (using the variable
#'   \code{duration_nr}). The \code{magaloni_extended} dataset omits all the
#'   indicators of personalism or head of government.
#'
#'   \describe{
#'
#'   \item{cyear}{Numeric expression of country-year, made by concatenating
#'   ccode and year.}
#'
#'   \item{cntyr}{Alphanumeric expression of country-year, made by concatenating
#'   scode and year.}
#'
#'   \item{magaloni_ccode}{Numeric country codes, based on the Correlates of War
#'   dataset, as in the original dataset. Use \code{cown} instead.}
#'
#'   \item{scode}{Three-letter country codes, based on the Correlates of War
#'   dataset.}
#'
#'   \item{magaloni_country}{String version of country, as in original dataset.
#'   Use \code{country_name} instead.}
#'
#'   \item{year}{Four-digit calendar year. In the \code{magaloni_extended} the
#'   year is extended to back before 1950 using \code{duration_nr}, which adds
#'   1662 observations to \code{regime_nr} and \code{demo_nr}.}
#'
#'   \item{un_region}{Region, based on classifications by the United Nations, as
#'   in the original dataset. Use \code{region} instead, which is based on the
#'   same classifications but is more comprehensive - no missing values.}
#'
#'   \item{un_continent}{Continent, based on classifications by the United
#'   Nations, as in the original dataset. Use \code{continent} instead, which is
#'   based on the same classifications but is more comprehensive - no missing
#'   values.}
#'
#'   \item{reg_id}{A unique number identifying a specific regime in a specific
#'   country. The number is created by combining the country code (ccode) with a
#'   basic regime count in the country in the following manner: 100*(ccode) +
#'   running total. For example, the first country-year in the data for Haiti
#'   (country code is 41) is 4101, and changes to 4102 the year that regime type
#'   changes in the country. Note that this ID is created using the non-rounded
#'   regime classifications.}
#'
#'   \item{demo_r}{A dummy variable for whether a given country-year has a
#'   democratic regime, using the rounding rule. (Note that these
#'   classifications do not necessarily align with a strict threshold based on
#'   Polity scores.)}
#'
#'   \item{demo_nr}{A dummy variable for whether a given country-year has a
#'   democratic regime, without rounding. (Note that these classifications do
#'   not necessarily align with a strict threshold based on Polity scores.)}
#'
#'   \item{regime_r}{The regime type of a given country-year, using the rounding
#'   rule so that the regime type that constituted the majority (or plurality)
#'   of the year is used. The list of potential regimes includes:
#'
#'   * Democracy
#'
#'   * Multiparty
#'
#'   * Single party
#'
#'   * Military
#'
#'   * Monarchy
#'
#'   Definitions of each are provided in the "Classifying Autocracies" section.
#'   Note that these classifications are mutually exclusive for any given
#'   country-year.}
#'
#'   \item{regime_nr}{The regime type of a given country-year, in which the
#'   classification is based on the regime type that exists at the end of the
#'   year. This is the more "conventional" approach of other regime datasets.}
#'
#'   \item{duration_r}{The age of a regime up to the given country-year, using
#'   the rounding rule. The count begins at 1.}
#'
#'   \item{duration_nr}{The age of a regime up to the given country-year,
#'   without rounding. The first year in which a new regime takes hold is
#'   recorded as 1, regardless of when in the year this new regime appears.}
#'
#'   \item{personal1}{A three-point measure of the country-year's regime's
#'   degree of personalism. This is based on the seven-point \code{xconst}
#'   (executive constraints) scale of the Polity IV dataset. The following
#'   conversion was used:
#'
#'   xconst 1 Highly personal 2
#'
#'   xconst 2-4 Moderately personal 1
#'
#'   xconst 5-7 Weakly/not personal 0
#'
#'   In contrast to \code{personal2}, whenever Polity IV does not provide an
#'   \code{xconst} measure (periods of transition, interregnum, or occupation),
#'   this measure is left blank.}
#'
#'   \item{personal2}{Identical to \code{personal1}, except missing values are
#'   filled in. Whenever possible, missing values are imputed using the xconst
#'   measures that do exist for a given regime. When a regime has the same
#'   recorded \code{xconst} throughout, this value is used for missing values.
#'   When xconst is not the same throughout a given regime, values are prorated
#'   to fill middle years and based on the closest xconst measure to fill years
#'   that are on either end of the regime's lifespan.}
#'
#'   \item{lindex}{A newly constructed measure of personalism within each
#'   regime. (See the "Personalism" subsection for a substantive explanation of
#'   this metric.) The variable is essentially a Herfendahl index (sum of
#'   squared shares) using the column exname. For a given country-year in a
#'   unique regime (see \code{reg_id}), the following calculation is made:
#'   $sum_{i=1}^{m} (exec_i/n)^2$ where n is the age of the regime up to that
#'   year, and exec is the number of years that a unique executive i (out of a
#'   total m executives up to that year) has led the regime. As such, a regime
#'   led by only one person up through that year yields a personalism index of
#'   1. A theoretical scenario where leadership changes every single year would
#'   yield 1/n. These calculations are made using the non-rounded values. We
#'   note that this is a relatively sensitive measure in the early/formative
#'   years of an individual regime, but we propose this is a useful way of
#'   considering personalism as an evolving attribute of a regime over time.
#'   More discussion on the relative merits of this measure can be found below.}
#'
#'   \item{exname}{The name of the executive head of state in the country-year.
#'   Country years from 1950 to 2008 are based on Cheibub, Gandhi, and Vreeland
#'   (2010).}
#'
#'   \item{change}{A dummy for whether a regime change occurred in this
#'   country-year. (Note that in cases such as coups and counter-coups, such
#'   changes can occur without the overarching regime type changing.)}
#'
#'   \item{tdate}{The date a country underwent transition to a new regime type.
#'   The format is MM.DD.YYYY, and this date is used in the rounding rule (see
#'   the section entitled "Transitional Years and Rounding"). When a specific
#'   month or date cannot be identified, "00" is used.}
#'
#'   \item{trans}{A dummy variable indicating whether the country was in the
#'   midst of transition, as noted by the Polity IV dataset.}
#'
#'   \item{occup}{A dummy variable indicating whether the country was occupied
#'   by a foreign power in the given year, as noted by the Polity IV dataset.}
#'
#'   \item{interreg}{A dummy variable indicating whether the country was in the
#'   midst of interregnum in the given year, as noted by the Polity IV dataset.}
#'   }
#' @template standard-variables
#' @family democracy
#' @family authoritarianism
#' @family dichotomous indexes of democracy
#' @source `r roxygen_cite("magaloni")`
"magaloni"

#' @rdname magaloni
"magaloni_extended"

# Munck -------------------------------------------------------------------


#' Munck Index of Democracy
#'
#' 0-1 index of democracy from `r roxygen_cite("munck")` Taken from
#' `r roxygen_cite("pmm2013")` Higher values are more democratic.
#'
#' @section Variables:
#'
#'   \describe{
#'
#'   \item{pmm_country}{The original country name in the PMM replication data.}
#'
#'   \item{year}{The calendar year. This is approximate. The surveys cover
#'   specific periods in the original data that do not always overlap with a
#'   single year. In particular, the year 1981 is "skipped" -- a single survey
#'   covers Jan.1981 - Aug. 1982 and its value is assigned to 1982 here.}
#'
#'   \item{munck_pmm}{0-1 index of democracy from Munck. Only available for 18
#'   Latin American countries for 19 years.} }
#'
#' @template standard-variables
#'
#' @source `r roxygen_cite("pmm2013")`
#' @source `r roxygen_cite("munck")`
#' @family democracy
#' @family PMM replication data
#' @family continuous democracy indexes
#' @aliases munck
"munck_pmm"

# Geddes, Wright, and Frantz ----------------------------------------------


#' The Geddes Wright and Frantz Autocratic Regimes dataset
#'
#' The dataset described in `r roxygen_cite("gwf")` The full data and codebook can be
#' downloaded here: \url{http://sites.psu.edu/dictators/}. The documentation
#' below is derived from the codebook. Some variables apply to the country-year
#' version, some to the case version and some to the "extended" version
#' (extended back before 1945 with info from the case descriptions).
#'
#' \describe{
#'
#' \item{gwf_cowcode}{Correlates of War (CoW) country code}
#'
#' \item{year}{Calendar year. In the "extended_yearly" version of
#' the dataset, these have been calculated back before 1945 from the information
#' available in the casenames.}
#'
#' \item{gwf_country}{Country name}
#'
#' \item{gwf_casename}{Autocratic regime case name (country name and years);
#' these are the units of observation for duration analysis}
#'
#' \item{gwf_regimetype}{Regime type: not independent, foreign-occupied,
#' warlord, democracy, provisional, monarchy, personalist, military, party,
#' party-personalist, party-military, military-personalist,
#' party-military-personalist. Only includes non-democratic regime types.}
#'
#' \item{gwf_duration}{Duration of regime up to
#' time t. In the "extended" datasets this always starts at 1.}
#'
#' \item{gwf_fail}{Binary indicator for regime failure}
#'
#' \item{gwf_disagree}{Binary indicator for country-year observations where GWF
#' coding of democracy differs from [CGV](pacl.html) (here \link{pacl}) coding of democracy}
#'
#' \item{gwf_startdate}{Day-Month-Year for the calendar date of the autocratic
#' regime start event. Only in \code{gwf_autocratic} datasets.}
#'
#' \item{gwf_enddate}{Day-Month-Year for the calendar date
#' of the autocratic regime failure event (31-12-2010 for right-censored
#' autocratic regimes). Only in \code{gwf_autocratic} datasets.}
#'
#' \item{gwf_spell}{Time-invariant duration of autocratic
#' regime}
#'
#' \item{gwf_fail_subs}{Categorical variable marking the subsequent
#' regime type. 1: subsequent regime is democracy 2: subsequent regime is
#' autocratic 3: subsequent regime is warlord, foreign-occupied or ceases to
#' exist 0: no regime failure at duration time t ; and regime still in power
#' December 31, 2010}
#'
#' \item{gwf_fail_type}{Categorical variable marking how the
#' autocratic regime ends. 1: regime insiders change rules of regime 2:
#' incumbent loses elections 3: no incumbent runs in competitive election won by
#' opponent 4: popular uprising 5: military coup 6: insurgents, revolutionaries,
#' or combatants fighting a civil war 7: foreign imposition or invasion 8: new
#' autocratic leader selected, changes rules, and remains in power 9: state
#' ceases to exist ends or government fails to control most of the country's
#' territory 0: regime still in power on December 31, 2010}
#'
#' \item{gwf_fail_violent}{Categorical variable marking the level of violence
#' during the autocratic regime failure event. 1: no deaths 2: 1-25 deaths 3:
#' 26-1000 deaths 4: >1000 0: regime still in power on December 31, 2010}
#'
#' \item{gwf_party}{Binary indicator of party regime type (groups party-based,
#' party-personal, party-military, party-personal-military, oligarchy, and Iran
#' 1979-2010)}
#'
#' \item{gwf_personal}{Binary indicator of personalist regime type}
#'
#'
#' \item{gwf_military}{Binary indicator of military regime type (groups
#' military, military-personal, indirect military)}
#'
#' \item{gwf_monarchy}{Binary
#' indicator of monarchy regime type} }
#'
#' @template standard-variables
#' @family democracy
#' @family authoritarianism
#' @source `r roxygen_cite("gwf")` The full data and codebook can be
#' downloaded here: \url{http://sites.psu.edu/dictators/}.
"gwf_all"

#' @rdname gwf_all
#' @section Note: The "extended" datasets `*_extended` are extended back in time
#'   using the \code{gwf_duration} variable, so they include years before 1946.The
#'   original country-year datasets did not include the period before 1946
#'   explicitly.
#' @aliases gwf
"gwf_all_extended"

#' @rdname gwf_all
"gwf_autocratic"

#' @rdname gwf_all
"gwf_autocratic_extended"


# Kailitz -----------------------------------------------------------------

#' The Steffen Kailitz Dataset of Authoritarian Regime Types
#'
#' Contains the authoritarian regime types dataset from `r roxygen_cite("kailitz")`
#'
#' @section Variables:
#'
#'   \describe{
#'
#'   \item{year}{The calendar year. Note that more than one regime type may
#'   obtain in a single year for a given country.}
#'
#'   \item{kailitz_country}{The country name.}
#'
#'   \item{combined_regime}{The "combined regime" for the country year. This is
#'   just the concatenation of all regimes for that year if the country has more
#'   than one regime type. For example, Spain has a "combined regime" of
#'   "Military Autocracy-One party Autocracy-Personalist Autocracy" for the each
#'   of the years 1946-1974.}
#'
#'   \item{kailitz_binary}{ Dichotomous
#'   democracy indicator. 1 if \code{combined_regime} is "Liberal democracy", 0
#'   otherwise.}
#'
#'   \item{kailitz_tri}{ Trichotomous
#'   democracy indicator. 2 if \code{combined_regime} is "Liberal Democracy", 1
#'   if it is "Electoral Autocracy" or "Electoral Autocracy-Liberal Democracy",
#'   0 otherwise.}
#'
#'   \item{personal}{ Binary indicator of
#'   personalism. \code{TRUE} if \code{combined_regime} contains "Personal
#'   Autocracy", \code{FALSE} otherwise.}
#'
#'   \item{communist}{ Binary indicator
#'   of communism. \code{TRUE} if \code{combined_regime} contains "Communist
#'   Ideocracy", \code{FALSE} otherwise.}
#'
#'   \item{military}{ Binary indicator of
#'   military autocracy. \code{TRUE} if \code{combined_regime} contains
#'   "Military Autocracy", \code{FALSE} otherwise.}
#'
#'   \item{party}{ Binary indicator of
#'   one party autocracy \code{TRUE} if \code{combined_regime} contains "One
#'   party Autocracy", \code{FALSE} otherwise.}
#'
#'   \item{monarchy}{ Binary indicator of
#'   monarchy. \code{TRUE} if \code{combined_regime} contains "Monarchy",
#'   \code{FALSE} otherwise.}
#'
#'   \item{electoral}{ Binary indicator
#'   of electoral autocracy. \code{TRUE} if \code{combined_regime} contains
#'   "Electoral autocracy", \code{FALSE} otherwise.}
#'
#'   \item{failure}{ Binary indicator of
#'   state failure or occupation. \code{TRUE} if \code{combined_regime} contains
#'   "State Failure or Occupation", \code{FALSE} otherwise.}
#'
#'   \item{transition}{ Binary indicator
#'   of transition. \code{TRUE} if \code{combined_regime} contains "Transition",
#'   \code{FALSE} otherwise.}
#'
#'   }
#' @template standard-variables
#' @source `r roxygen_cite("kailitz")`
#' @family democracy
#' @family authoritarianism
#' @family dichotomous democracy indexes
#' @family trichotomous democracy indexes
"kailitz"

# DD/PACL/ACLP/CGV --------------------------------------------------------


#' The Democracy and Dictatorship Dataset (DD/PACL/ACLP/CGV)
#'
#' This dataset (aka PACL, ACLP or CGV) is described in `r roxygen_cite("pacl2010")`
#' The full data and codebook can be downloaded here
#' \url{https://sites.google.com/site/joseantoniocheibub/datasets/democracy-and-dictatorship-revisited}.
#' The documentation below is directly copied from the codebook.
#'
#' \describe{
#'
#' \item{order}{Sequential numbering of rows (1 through 9159)}
#'
#' \item{pacl_country}{String country identifier.}
#'
#' \item{year}{Calendar year}
#'
#' \item{aclpcode}{Country identifier (numeric) used in previous versions of the
#' regime classification contained in this dataset (the so-called ACLP, PPD,
#' etc., databases). See Alvarez,Cheibub, Limongi, Przeworski 1996, Przeworski,
#' Alvarez, Cheibub and Limongi 2000, andCheibub 2007.}
#'
#' \item{pacl_cowcode}{Correlates of war (numeric) country identifier.}
#'
#' \item{cowcode2}{Modified correlates of war (numeric) country identifier. See
#' explanation under "Organizing the World."}
#'
#' \item{ccdcodelet}{Three letter country code used by the Cline Center for
#' Democracy, University of Illinois at Urbana-Champaign.}
#'
#' \item{ccdcodenum}{Numeric country code used by the Cline Center for
#' Democracy, University of Illinois at Urbana-Champaign.}
#'
#' \item{aclpyear}{Concatenation of aclpcode and year.}
#'
#' \item{cowcode2year}{Concatenation of cowcode2 and year.}
#'
#' \item{cowcodeyear}{Concatenation of cowcode and year.}
#'
#' \item{chgterr}{Dummy variable coded 1 for all the years of a country that
#' experienced significant gains or losses of territory, 0 otherwise.}
#'
#' \item{ychgterr}{Dummy variable coded 1 for the year in which a country gained
#' or lost significant parts of its territory, 0 otherwise.}
#'
#' \item{flagc_cowcode2}{Dummy variable coded 1 for the first year a country
#' (defined by cowcode2) is observed in the dataset, 0 otherwise.}
#'
#' \item{flage_cowcode2}{Dummy variable coded 1 for the last year a country
#' (defined by cowcode2) is observed in the dataset, 0 otherwise.}
#'
#' \item{entry}{Year the country is first observed in the dataset (repeated for
#' all years a country is in the dataset).}
#'
#' \item{exity}{Year the country is last observed in the dataset (repeated for
#' all years a country is in the dataset).}
#'
#' \item{cid}{From the introduction to the codebook: We do not assign new
#' country codes to countries that experienced changes in their territories but
#' which remained in existence after the change. These include, for instance,
#' Pakistan (with the creation of Bangladesh in 1971), Cyprus (with the
#' "creation" of Turkish Cyprus in 1983, a country not recognized as independent
#' - and hence not in this dataset - but over which the "remaining" Cyprus does
#' not govern), or Ethiopia (with the creation of Eritrea in 1993). The variable
#' cid provides a country coding that treats these cases as separate countries.}
#'
#' \item{wdicode}{World Development Indicators (string) country identifier.}
#'
#' \item{imf_code}{International Monetary Fund (numeric) country identifier.}
#'
#' \item{politycode}{POLITY IV (numeric) country identifier.}
#'
#' \item{bankscode}{Banks (numeric) country identifier.}
#'
#' \item{dpicode}{DPI (string) country identifier.}
#'
#' \item{uncode}{United Nations (numeric) country identifier.}
#'
#' \item{un_region}{United Nations (numeric) geographic region identifier.}
#'
#' \item{un_region_name}{United Nations (string) geographic region identifier.}
#'
#' \item{un_continent}{United Nations (string) continent identifier.}
#'
#' \item{un_continent_name}{United Nations (numeric) continent identifier.}
#'
#' \item{aclp_region}{Alvarez, Cheibub, Limongi and Przeworski (1996, 2000)
#' (numeric) region identifier.}
#'
#' \item{bornyear}{Year the country is first identified as such.}
#'
#' \item{endyear}{Year the country stops being identified as such}
#'
#' \item{exselec}{Mode of effective executive selection (from Banks to 2002,
#' painted yellow in the excel file when modified; own coding from 2003 on): 1.
#' Direct election (election of the effective executive by popular vote or the
#' election of committed delegates for the purpose of executive selection) 2.
#' Indirect election (selection of the effective executive by an elected
#' assembly or by an elected but uncommitted electoral college) 3. Nonelective
#' (any means of executive selection not involving a direct or indirect mandate
#' from an electorate)}
#'
#' \item{legselec}{Mode of legislative selection (from Banks to 2002, painted
#' yellow in the excel file when modified; own coding from 2003 on): 0. No
#' legislature exists (includes cases in which there is a constituent assembly
#' without ordinary legislative powers). 1. Non-elective legislature (examples
#' include the selection of legislators by the effective executive, or on the
#' basis of heredity or ascription) 2. Elective (legislators, or members of the
#' lower house in a bicameral system, are selected by means of either direct or
#' indirect popular election)}
#'
#' \item{closed}{Status of legislature. 0. Legislature is closed. 1. Legislature
#' is appointed. 2. Legislature is elected}
#'
#' \item{dejure}{Legal status of parties0. All parties legally banned1. Legally
#' single party state2. Multiple parties legally allowed}
#'
#' \item{defacto}{Existence of parties. 0 = No parties. 1 = One party. 2 =
#' Multiple parties. N.B. We collected separate variables for dejure and defacto
#' status of parties because legal status alone is not always a good reflection
#' of empirical reality. Both dejure and defacto refer to existence of parties
#' in general, not whether they have seats in the legislature. For this
#' information see lparty.}
#'
#' \item{defacto2}{Existence of parties outside of regime front. 0. No parties1.
#' One party or multiple parties, but they belong to regime front. 2. Multiple
#' parties}
#'
#' \item{lparty}{Parties within the legislature. 0. Either no legislature or all
#' members of the legislature are nonpartisan 1. Legislature with only members
#' from the regime party2. Legislature with multiple parties}
#'
#' \item{incumb}{Consolidation of incumbent advantage. Dummy variable coded 1
#' if: (1) the regime year qualifies as a democratic regime and (2) sometime
#' during its current tenure in office the incumbents (person, party, military
#' hierarchy) unconstitutionally closed the lower houseof the national
#' legislature and rewrote the rules in their favor. The rationale for this
#' variable is discussed in Przeworski et al. (2000:20-22). We expand the action
#' that characterizes consolidation of incumbent advantage to include cases in
#' which the incumbent was first elected in multiparty elections but, for
#' whatever reasons, the incumbent's term was extended and subsequent elections
#' were postponed (e.g., Angola as of December 31, 2008).}
#'
#' \item{type2}{Dummy variable coded 1 for the cases excluded from the set of
#' democracies uniquely because they violate the "alternation" rule; 0
#' otherwise. These are the cases that would be classified as democratic if the
#' only criteria for democracy were multiparty (direct orindirect) executive and
#' legislative elections. This, however, as discussed in Przeworski etal
#' (2000:23-29) and in Cheibub, Vreeland and Gandhi (2009), is not sufficient to
#' identify democracies. In the set of regimes that hold multiparty elections,
#' some do it only because they know the opposition cannot win and others
#' because the opposition would not be allowed to assume office if it won. The
#' difficulty is that in many cases there is no historical evidence to allow the
#' observer to distinguish these cases. Thus, it is possible that we might
#' identify as a democracy a case that is a real dictatorship, or as a
#' dictatorship a case that is a real democracy. The alternation rule, as well
#' as the present variable, identifies the cases for which we do not have
#' sufficient information to decide,according to our rules, whether the country
#' is a democracy or not. Note on the type2 name: A type I error is a false
#' positive and a type II error is a false negative. In the original project for
#' which this variable was created,dictatorships were coded 1 (positive) and
#' democracies 0 (negative). The variable was named to indicate that we had made
#' a decision to avoid type II errors by coding as dictatorships cases that
#' might have been a democracy (thus committing type I errors). In the current
#' context, we think of democracy as the positive outcome and dictatorship as
#' the negative outcome. We should, therefore, rename the variable type1 error
#' since we decided to coded possible democracies (real 1s) as dictatorships
#' (real 0s). In the end, it does not matter. What is important is that this
#' variable can be used to easily reclassify regimes by either considering all
#' cases coded as 1 in type2 as democracies or attempting to discriminate which
#' ones are democracies and which ones are dictatorships.}
#'
#' \item{collect}{Dummy variable coded 1 when the effective head is
#' characterized by collective leadership, 0 otherwise.}
#'
#'
#' \item{nheads}{Number of changes in the nominal head of government in each
#' year.}
#'
#' \item{nmil}{Dummy variable coded 1 if the nominal head is or ever was a
#' member of the military by profession, 0 if civilian. Note that we code
#' retired members of the military as NMIL=1since the shedding of a uniform is
#' not necessarily enough to indicate the civilian character of a leader. Also
#' note that we do not consider rulers who come to power as head of guerilla
#' movements as military. Source: Compiled from Beinen and Van deWalle (1991),
#' Beck et al. (2000), Banks (various years), Zarate (2001), Lentz (1994), and
#' various internet sources as marked.}
#'
#' \item{nhead}{Name of the nominal head of government. Source: Compiled from
#' Banks (various years), Beinen and Van de Walle (1991), Rulers website, Zarate
#' (2001), and Lentz (1994).}
#'
#' \item{npost}{Political title of the nominal head of government. Source:
#' Compiled from Banks (various years), Beinen and Van de Walle (1991), Rulers
#' website, Zarate (2001), and Lentz (1994).}
#'
#' \item{ndate}{Date of entrance into power of nominal head of government.
#' Source: Compiled fromBanks (various years), Beinen and Van de Walle (1991),
#' Rulers website, Zarate (2001),and Lentz (1994).}
#'
#' \item{eheads}{Number of changes in the effective head of government in each
#' year}
#'
#' \item{ageeh}{Age of the effective head's spell in office. There is no left
#' censoring.}
#'
#' \item{emil}{Dummy variable coded 1 if the effective head is or ever was a
#' member of the military by profession, 0 if civilian. Note that we code
#' retired members of the military as EMIL=1since the shedding of a uniform is
#' not necessarily enough to indicate the civilian character of a leader. Also
#' note that we do not consider rulers who come to power as head of guerilla
#' movements as military. Source: Compiled from Beinen and Van deWalle (1991),
#' Beck et al. (2000), Banks (various years), Zarate (2001), Lentz (1994), and
#' various internet sources as marked.}
#'
#' \item{royal}{Dummy variable coded 1 if the effective head is of hereditary
#' royalty, 0 otherwise. To qualify as royal, the effective head must meet 2
#' qualifications: 1) rule under a title such as kings, emirs, sultans, and 2)
#' have been preceded or succeeded by a relative. Part 1) means that Khama in
#' Botswana, Mutesa in Uganda, Souvanna Phouma in Laos, Mohammed Daud in
#' Afghanistan, and Sihanouk in Cambodia do not qualify as monarchs because they
#' abdicated their places in the royal line to rule as heads of republics. Part
#' 2) means that self-proclaimed royalty such as Bokassa in the Central African
#' Republic are not monarchs. Source: Banks (various years), Lentz (1994).}
#'
#' \item{headdiff}{Dummy variable coded 1 if the effective and nominal heads are
#' different people, 0 otherwise. Source: Created from NHEAD and EHEAD.}
#'
#' \item{ehead}{Name of the effective head of government.Effective heads are: 1)
#' presidents in presidential democracies; 2) prime ministers in parliamentary
#' and mixed democracies, except in the cases of Djohar in Comoros andPreval in
#' Haiti; 3) general-secretaries of the communist party in communist
#' dictatorships, except in the case of Deng Xiaoping in China; 4) kings,
#' presidents, and defacto rulers in non-communist dictatorships, except in the
#' cases of Singapore, Malaysia,Cambodia, Laos, and Myanmar where the effective
#' head is sometimes the prime minister; and 5) military or other figure when
#' sources indicate nominal head is puppet figure. Included are acting or
#' provisional governments, on the assumption that one cannot distinguish
#' between cases in which heads attempted to consolidate power and failed from
#' cases in which heads did not try to do so. Note that this variable, as all
#' other variables with names beginning with "E," codes effective rulers as
#' opposed to nominal ones. Source: Compiled from Banks (various years), Beinen
#' and Van de Walle (1991),Rulers website, Zarate (2001), and Lentz (1994).}
#'
#'
#' \item{epost}{Title of the effective head of government.Source: Compiled from
#' Banks (various years), Beinen and Van de Walle (1991), da Graca(1985), Rulers
#' website, Zarate (2001), and Lentz (1994).}
#'
#' \item{edate}{Date of entrance into power of effective head of
#' government.Source: Compiled from Banks (various years), Beinen and Van de
#' Walle (1991), da Graca(1985), Rulers website, Zarate (2001), and Lentz
#' (1994).}
#'
#' \item{tenure08}{Total number of years (up to and including the year 2002) the
#' effective head of government is in power. Tenure is invariant during the
#' spell of each head.}
#'
#' \item{comm}{Dummy variable coded 1 if the ruler is the Communist Party
#' leader, 0 otherwise.Source: Banks (various years), Lentz (1994).}
#'
#' \item{ecens08}{Dummy variable coded 0 for the last year of an effective
#' head's tenure due to death or for the last year of effective heads that
#' lasted beyond the time of the last observation,usually 1996, and 1 otherwise.
#' ecens08 = 0 for rulers who entered as dictators and then legitimately won an
#' election and became democrats. Source: Compiled from Banks (various years),
#' Beinen and Van de Walle (1991), da Graca (1985), Rulers website,
#' Zarate(2001), and Lentz (1994).}
#'
#' \item{edeath}{Dummy variable coded 0 for the last year of the effective
#' head's spell due to the head's death and 1 otherwise. We do not distinguish
#' between natural death, assassination,suicide, and accidents. Source: Banks'
#' Political Handbook, Bienen and Van de Walle(1991), Rulers website, and Zarate
#' (2001).}
#'
#' \item{flagh}{Dummy variable coded 1 for the first year an effective head of
#' government is first observed, 0 otherwise.}
#'
#' \item{democracy}{Dummy variable coded 1 if the regime qualifies as
#' democratic. The conditions for this variable are the following: democracy=1
#' ifexselec <2 (and)legselec=2 (and) closed=2 (and) dejure=2 (and) defacto=2
#' (and) defacto2=2 (and) lparty=2 (and) type2=0 (and) incumb=0.}
#'
#'
#' \item{assconfid}{Dummy variable coded 1 if the regime is a democracy and the
#' government is subject to assembly confidence, 0 otherwise. Assembly
#' confidence refers to collective cabinet responsibility and must include the
#' head of government. All cases in which assembly confidence is explicitly
#' stated in the constitution are coded 1. Cases in which assembly confidence is
#' not explicitly stated in the constitution (i.e., Iceland) or there is no
#' constitution (i.e., England) are included when we observed at least one
#' instance of successful government removal via a parliamentary vote of no
#' confidence since 1946.}
#'
#' \item{poppreselec}{Dummy variable coded 1 if the regime is a democracy and
#' the head of state is chosen via popular election. Note that it is possible
#' that a country will have no direct presidential elections, poppreselec=0, and
#' still be presidential. These are the cases in which presidents are indirectly
#' elected (exselec=2)}
#'
#' \item{regime}{Six-fold regime classification. 0. Parliamentary democracy 1.
#' Mixed (semi-presidential) democracy 2. Presidential democracy 3. Civilian
#' dictatorship 4. Military dictatorship 5. Royal dictatorship}
#'
#' \item{tt}{Dummy variable coded 1 when there is a transition to or from
#' democracy, 0 otherwise.}
#'
#' \item{ttd}{Dummy variable coded 1 when there is a transition to democracy, 0
#' otherwise.}
#'
#' \item{tta}{Dummy variable coded 1 when there is a transition to dictatorship,
#' 0 otherwise.}
#'
#' \item{flagdem}{Dummy variable coded 1 for the first year a country is
#' observed or a new regime (as defined by democracy) emerges, 0 otherwise.}
#'
#' \item{flagreg}{Dummy variable coded 1 for the first year a country is
#' observed or a new regime (as defined by regime) emerges, 0 otherwise.}
#'
#' \item{agedem}{Age in years of the current regime as classified by democracy.
#' The year in which the regime comes into existence is coded as 1. When
#' applicable, ages were extended back as far as 1870.}
#'
#' \item{agereg}{Age in years of the current regime as classified by regime. The
#' year in which the regime comes into existence is coded as 1. When applicable,
#' ages were extended back as far as 1870.}
#'
#' \item{stra}{Sum of past transitions to authoritarianism in a country. If a
#' country experienced more than one transition to authoritarianism before 1946,
#' STRA is coded 1 in 1946.} }
#'
#' @section Organizing the world:
#'
#'   As simple as it may be, there is no one system of numbering the countries
#'   of the world that would allow scholars to easily merge all the varied
#'   datasets into one overall dataset. The difficulty, of course, comes from
#'   the fact that countries come and go and countries sometimes change
#'   significantly their territorial basis while retaining their old names. For
#'   some analyses (e.g., for economic or demographic time series), we want to
#'   mark the fact that Pakistan lost the territory that became Bangladesh in
#'   1971, or that Ethiopia lost the territory that became Eritrea in 1993, or
#'   that Indonesia lost the territory that became East Timor in 2002. At the
#'   same time, for some other analyses (e.g., those related to the occurrence
#'   of elections and the changes of heads of state and government), the fact
#'   that some territory was lost is irrelevant. For the first type of analyses,
#'   Pakistan before 1971 should be treated as a different country as Pakistan
#'   after  1971. For the second type of analyses, Pakistan between 1947 and
#'   2008 should be treated as one country. The solution we found to be the most
#'   flexible is the following:
#'
#'   1. We follow the Correlates of War country code, since this seems to be the
#'   most complete and widely used country identifier available. We create four
#'   additional country codes (which do not match any COW country code):
#'
#'   2. COW assigns one code to Yugoslavia from 1946 through 2008. We consider
#'   that Yugoslavia (COW = 345) stopped existing in 1991 and assign a new
#'   country code to Serbia and Montenegro (1991-2006) and to Serbia (2006-)
#'
#'   3. COW assigns one code to the USSR/Russia from 1946 through 2008. We
#'   consider that the USSR (COW=365) stopped existing in 1991 and assign a new
#'   code to Russia (1991-).
#'
#'   4. COW assigns one number to Vietnam between 1954 and 2008 and another to
#'   South Vietnam between 1954 and 1975. We assign different codes for South
#'   Vietnam (1954-1976), North Vietnam (1954-1976) and Vietnam (1976- present).
#'
#'   We do not assign new country codes to countries that experienced changes in
#'   their territories but which remained in existence after the change. These
#'   include, for instance, Pakistan (with the creation of Bangladesh in 1971),
#'   Cyprus (with the "creation" of Turkish Cyprus in 1983, a country not
#'   recognized as independent - and hence not in this dataset - but over which
#'   the "remaining" Cyprus does not govern), or Ethiopia (with the creation of
#'   Eritrea in 1993). The variable cid provides a country coding that treats
#'   these cases as separate countries.
#'
#' @template standard-variables
#'
#' @family democracy
#' @family PMM replication data
#' @family dichotomous democracy indexes
#'
#' @source `r roxygen_cite("pacl2010")` The full data and codebook
#'   can be downloaded here
#'   \url{https://sites.google.com/site/joseantoniocheibub/datasets/democracy-and-dictatorship-revisited}
"pacl"

#' @rdname pacl
#' @section Note:
#'
#'   The \code{pacl_pmm} version of this data is taken from `r roxygen_cite("pmm2013")`
#'   It only contains the numeric version of the
#'   variable \code{democracy} in the original dataset. The
#'   original dataset is found in \code{pacl}. \code{pacl_pmm} is missing a few
#'   country-years when compared with \code{pacl}.
"pacl_pmm"

#'Update of the Democracy and Dictatorship Dataset by Bjørnskov and Rode
#'
#'This dataset updates [pacl] with more countries and coverage from 1950 to
#'2020, as described in `r roxygen_cite("pacl_update")` The full data and codebook
#'can be downloaded here: \url{http://www.christianbjoernskov.com/bjoernskovrodedata/}. The
#'documentation below is directly copied from the codebook.
#'
#'\describe{
#'
#'\item{pacl_update_country}{Country name in the original dataset.}
#'
#'\item{pacl_update_country_isocode}{Three letter ISO country code.}
#'
#'\item{year}{Year.}
#'
#'\item{DD_regime}{Numeric regime category, following Cheibub, Ghandi and
#'Vreeland (2010) (Parliamentary democracies = 0, Mixed democracies (with weak
#'presidents) = 1, Presidential democracies = 2, Civilian autocracies = 3,
#'Military dictatorships = 4, and Royal dictatorships = 5)}
#'
#'\item{DD_category}{Regime category label, following Cheibub, Ghandi and
#'Vreeland (2010) (Parliamentary democracies = 0, Mixed democracies (with weak
#'presidents) = 1, Presidential democracies = 2, Civilian autocracies = 3,
#'Military dictatorships = 4, and Royal dictatorships = 5)}
#'
#'\item{Monarchy}{Is the country a hereditary monarchy? (Monarchy = 1, Republic
#'= 0)}
#'
#'\item{Commonwealth}{Is the country a member of the British Commonwealth?
#'(Commonwealth = 1, Other = 0)}
#'
#'\item{Monarch_name}{Name of the monarch.}
#'
#'\item{Monarch_accession}{Year of accession of the monarch.}
#'
#'\item{Monarch_birthyear}{Year of birth of the monarch.}
#'
#'\item{Female_monarch}{Is the monarch female? (No=0, Yes=1)}
#'
#'\item{Democracy}{Is the country democratic or not? following Cheibub, Ghandi
#'and Vreeland (2010) (Democracy = 1, Autocracy = 0) Dichotomous indicator of
#'democracy based on a minimalist definition. A country is defined as
#'democratic, if elections were conducted, these were free and fair, and if
#'there was a peaceful turnover of legislative and executive offices following
#'those elections.}
#'
#'\item{Presidential}{Is the political system presidential? (No=0, Yes=1)}
#'
#'\item{President_name}{Name of the president.}
#'
#'\item{President_accesion}{Accession year of the president.}
#'
#'\item{President_birthyear}{Year of birth of the president.}
#'
#'\item{Interim_phase}{Is the president interim / preliminary? (more than 2
#'Presidents/year=1, Otherwise=0)}
#'
#'\item{Female_president}{Is the president female? (No=0, Yes=1)}
#'
#'\item{Colony}{Is the country a colony? (No=0, Yes=1)}
#'
#'\item{Colony_of}{If colony, which country is the colonial power? Country name
#'of the colonial power.}
#'
#'\item{Colony_administrated_by}{If colony, which country is the colonial
#'administrator?}
#'
#'\item{Communist}{Is the country's regime communist / socialist? (No=0, Yes=1)}
#'
#'\item{Regime_change_lag}{Regime Change lag (No=0, Yes=1) If a coded event,
#'such as a change in the Presidency, took place after 01.07 it is assigned to
#'the following calendar year in the data. In this case, the lag variable will
#'be equal to one. For all change events before that date, the lag dummy is
#'equal to zero.}
#'
#'\item{spatial_democracy}{Average of geographical neighbors' Democracy score}
#'
#'\item{countrycode}{Numeric country ID. Undocumented in original codebook.}
#'
#'\item{No_of_chambers_in_parliament}{Total number of chambers in parliament.}
#'
#'\item{proportional_voting}{Is the electoral system characterized by including
#'proportional representation? (No=0, Yes=1)}
#'
#'\item{Election_system}{Electoral system. Can be FPTP, List PR (large
#'multi-member), List PR, Parallel SMD/PR, List PR (small multi-member), PR,
#'Mixed member SMD/PR, FPTP and appointed, List PR(small multi-member), Some
#'form of FPTP, SNTV, National list, STV, Single-member constituency, Party list
#'PR, Bloc voting, Multiple vote, FPTP and bloc voting, FPTP and Hare quota,
#'Hagenbasch-Bischoff, Appointed, List PR(large multi-member), IRV, Multi-seat
#'PR, Plurality-at-large / d'Hondt, d'Hondt and Saint algue, List PR (small
#'multi-party), Mix, Some form of PR, Proportional representation, Multi-member
#'constituencies, Block Vote, Mix of appointment and local election, d'Hondt,
#'FPTP / PR, Borda count, Single-member plurality, FPTP and reserved, PR /
#'Sainte-Laguë, Mixed member majoritarian, Two-round FPTP, Endorsement, Most
#'multi-seat constituencies by simple majority vote, PR and nomination, Two
#'round  single-member constituencies, Ethnic FPTP, FPTP / Bloc voting, FPTP /
#'Party list, Half single constituency, half PR, Indirectly elected by the
#'provincial people's congresses, Multi- and single-seat constituency,
#'Closed-list proportional representation, Lists, FPTP, party list  multi member
#'constituency, Two round absolute majority, All appointed, Closed list PR,
#'Single list, Appointed by Basic Peoples Congresses, Mix PR and functional
#'constituencies, MMP / FPTP, FPTP in two colleges, PR and appointed, Multiple
#'non-transferable vote system, Single-member constituencies majority, One
#'constituency, d'Hondt, Partially-open list proportional representation,
#'majority bonus, Party list and FPTP, PR and Droop quota, PR Hare quota, FPTP
#'and proportional, Simple majority constituency, Closed list proportional
#'representation, List PR and appointment, Simple majority, one constituency,
#'Sainte-Laguë, Single constituency, Party-list proportional representation,
#'Party list, Two-round, Elected and single-member constituency, FPTP /
#'appointed, Mixed Member SDM/PR, Party list majority, PR / FPTP, Single-seat
#'constituencies, FPTP and reserved seats, Indirect through eight regional
#'colleges, Largest remainder, Party list proportional representation, Two round
#'single seat constituency, Appointed by clans, Open party-list proportional
#'representation, Plurality party-list system, Elected by people's  district
#'assemblies, FPTP and nomination, Mixed, Most appointed, FPTP and party list,
#'Most in open list multi member constituencies, Multi-seat constituency
#'majority, Mainly appointed, Nominated by parties, FPTP after some appointed,
#'Mixed PR / FPTP, Single seat constituency, Elected by provincial assemblies,
#'FPTP and d'Hondt, Mixed appointment and unknown, FPTP and appointment,
#'Single-seat constituency, Som form of FPTP, Elected by colleges, Half elected
#'by local councils and half by corporations, Majority party list, Panchayat
#'system, PR and FPTP, Seven-stage process, FPTP and PR, FPTP within two
#'colleges, Appointed by governor, FPTP, multi member constituency, Multi-seat
#'constituency, Party nominees, Mix nominated and unknown, Mixed member SMD/PR
#'with large bonus, Single list of candidates, Parallel SMP/PR, Party Block
#'vote, Single constituency majority, Unknown, FPTP and nominated, Limited Vote,
#'Mixed-member SMD/PR, Multi-member constituencies. Single Transferable Vote, PR
#'in 15 of 26 constituencies; Bloc voting, Two-round single-member constituency,
#'346 elected by municipal citizens, 181 chosen by 'social sectors', Election in
#'two colleges, Party-list proportional representation., Single electoral
#'college, SNTV and appointed, ?, Coopted, List P (large multi-member), Selected
#'by committee, Single district.}
#'
#'\item{No_of_members_in_lower_house}{If bicameral parliament, total number of
#'members in lower house.}
#'
#'\item{No_of_members_in_upper_house}{If bicameral parliament, total number of
#'members in upper house.}
#'
#'\item{No_of_members_in_third_house}{If tricameral parliament, total number of
#'members in third house.}
#'
#'\item{New_constitution}{Whether a new constitution was implemented (No=0,
#'Yes=1)}
#'
#'\item{fullsuffrage}{Whether electoral system attributes full suffrage. (No=0,
#'Yes=1)}
#'
#'\item{Suffrage_restriction}{If no full suffrage, kind of suffrage restriction}
#'
#'\item{electoral}{Alternative democracy indicator capturing degree of
#'multi-party competition (No elections=0, Single-party elections=1,
#'non-democratic multi-party elections=2, democratic elections= 3)}
#'
#'\item{spatial_electoral}{Average of geographical neighbors' electoral.}
#'
#'\item{alternation}{Whether there's an alternation in power after election.
#'Undocumented in original codebook.}
#'
#'\item{multiparty}{Whether the elections are multiparty. Undocumented in
#'original codebook.}
#'
#'\item{free_and_fair_election}{Whether the elections are free and fair.
#'Undocumented in original codebook.}
#'
#'\item{parliamentary_election_year}{Year of parliamentary election.
#'Undocumented in original codebook.}
#'
#'\item{election_month_year}{Month and year of parliamentary election.
#'Undocumented in original codebook.}
#'
#'\item{postponed_election}{Whether the election was postponed. Undocumented in
#'original codebook.} }
#'
#'@template standard-variables
#'
#'@family democracy
#'@family dichotomous democracy indexes
#'
#'@source `r roxygen_cite("pacl_update")` The full data and codebook can be downloaded
#'  here \url{http://www.christianbjoernskov.com/bjoernskovrodedata/}
"pacl_update"


# PEPS --------------------------------------------------------------------


#' Participation-Enhanced Polity Score
#'
#' A dataset containing the Participation-Enhanced Polity score described in
#' `r roxygen_cite("peps")` The complete
#' dataset is available here:
#' \url{http://www.lehigh.edu/~bm05/democracy/Obtain_data.htm}. The
#' documentation below is based on the iformation in that website.
#'
#' \describe{
#'
#' \item{peps_ccode}{COW code, as used by the PEPS dataset.}
#'
#'
#' \item{year}{Year.}
#'
#' \item{polity1raw}{Raw Polity1 score with missing data
#' included, directly from Polity.}
#'
#' \item{Polity1}{Clean Polity1, irregular
#' codes defined as missing data.}
#'
#' \item{Polity2}{Clean Polity2, irregular codes
#' defined as missing data.}
#'
#' \item{Polity3}{Clean Preferred Polity score.}
#'
#' \item{Pdemocracy}{Clean Polity democracy, irregular codes defined as missing
#' data.}
#'
#' \item{Pautocracy}{Clean Polity autocracy, irregular codes defined as
#' missing data.}
#'
#' \item{FHfree}{Sum of Freedom House polrights & civliberties,
#' perfect score is 12.}
#'
#' \item{toI}{IDEA Votes/Voting age population. n = 4966,
#' missing = 11437.}
#'
#' \item{toV}{Vanhanen votes/two-thirds of Vanhanen
#' population. n = 14441, missing = 1962.}
#'
#' \item{toQ}{(mostly)IDEA votes/Voting
#' age population, with participation coded zero for noncompetitive elections. n
#' =  8010, missing = 8393.}
#'
#' \item{PEPS1i}{PEPS1, using toI. n = 9163, missing =
#' 7240.}
#'
#' \item{PEPS2i}{PEPS2, using toI. n = 4125, missing = 12278.}
#'
#' \item{PEPS1q}{PEPS1, using toQ. n = 9439, missing = 6964.}
#'
#' \item{PEPS2q}{PEPS2, using toQ. n = 6890, missing = 9513.}
#'
#' \item{PEPS1v}{PEPS1, using toV. n = 14090, missing = 2313.}
#'
#' \item{PEPS2v}{PEPS2, using toV. n = 13241, missing = 3162.}
#'
#' \item{pop}{Population in thousands, Penn World Tables.}
#'
#' \item{rgdpch}{Real
#' per capita GDP, chain method, Penn World Tables.}
#'
#' \item{suffrage}{Legal
#' suffrage as percent of Voting age population, from Paxton and Bollen.}
#'
#' \item{cv}{Compulsory voting. Coded as 4=strongly enforced,3=weakly
#' enforced,2=NA,1=not enforced,0=none. Source: IDEA.}
#'
#' \item{peps_country}{The
#' country names found in the original data. these had to be fixed - lots of
#' them were blank.} }
#' @template standard-variables
#' @family democracy
#' @family continuous indexes of democracy
#' @family polity
#' @source `r roxygen_cite("peps")`
"peps"


# Polity ------------------------------------------------------------------

#' Polity 2 from PMM
#'
#' Polity 2 Index from Polity IV. 2013. Taken from `r roxygen_cite("pmm2013")`
#' Higher values are more democratic. Use [polityIV] for the latest
#' version of the Polity IV data or [download_polity_annual] to download the
#' Polity 5 revision.
#'
#'
#' @section Variables:
#'
#'   \describe{
#'
#'   \item{pmm_country}{The original country name in the PMM replication data.}
#'
#'   \item{year}{The calendar year.}
#'
#'   \item{polity_pmm}{Annual polity2 index, interpolating values for
#'   interruption, interregnum, and transition periods. Higher values are more
#'   democratic. Taken from Pemstein, Daniel, Stephen A. Meserve, and James
#'   Melton. 2013. "Replication data for: Democratic Compromise: A Latent
#'   Variable Analysis of Ten Measures of Regime Type." In: Harvard Dataverse.
#'   [http://hdl.handle.net/1902.1/PMM](http://hdl.handle.net/1902.1/PMM). In
#'   this version the indicator only goes to 1945, and it differs from polity2
#'   in a few cases:
#'
#'   ```{r, echo = FALSE}
#'   polity_pmm %>%
#'   dplyr::left_join(polityIV) %>%
#'   dplyr::filter(pmm_polity != polity2) %>%
#'   dplyr::select(pmm_country, year, pmm_polity, polity2) %>%
#'   dplyr::group_by(pmm_country, pmm_polity, polity2) %>%
#'   dplyr::summarise(min_year = min(year), max_year = max(year), n_years = dplyr::n())
#'   ```
#'   }
#'
#'   }
#'
#' @template standard-variables
#'
#' @source `r roxygen_cite("pmm2013")`
#'
#' @source `r roxygen_cite("polity2019")`
#'
#' @family democracy
#' @family PMM replication data
#' @family ordinal democracy indexes
#' @seealso \link{download_polity_annual}
#' @seealso \link{redownload_polityIV}
#' @seealso [polityIV]
"polity_pmm"

#'Polity IV
#'
#'Polity IV dataset, 2019. Use \link{download_polity_annual} to download the
#'latest version of the Polity V data. This is the archived version of the last
#'update of Polity IV.
#'
#'@section Variables:
#'
#'  \describe{
#'
#'  \item{cyear}{Unique country code-year identifier.}
#'
#'  \item{polityIV_ccode}{Numeric Country Code. Derived from the Correlates of
#'  War country codes, but with some small differences. These are:
#'
#'  ```{r echo = FALSE}
#'  polityIV %>% filter(polityIV_ccode != cown) %>%
#'  group_by(polityIV_country, polityIV_ccode, cown) %>% summarise(min_year =
#'  min(year), max_year = max(year))
#'  ```
#'
#'  }
#'
#'  \item{scode}{Alphabetical Country Code. Derived from the Correlates of War
#'  country codes, but with some small differences. (See above table).}
#'
#'  \item{polityIV_country}{The original country name in the Polity IV data.}
#'
#'  \item{year}{The calendar year.}
#'
#'  \item{flag}{From the PolityIV manual, 2018 edition:
#'
#'  Each case (country-year) is flagged with this trichotomous indicator
#'  denoting the coders' general confidence in the component variable scores
#'  assigned during a Polity annual update. A "0" code indicates reasonable
#'  confidence in the codings listed and is assigned to all historical cases. A
#'  "1" code indicates that codings covering a period of up to five years since
#'  a recent polity change are considered tentative as new authority patterns
#'  emerge and coalesce; these cases are subject to review and possible revision
#'  or "smoothing" ... A "2" code indicates that information is limited and, so,
#'  there are reservations concerning the code assigned, often because a polity
#'  change has occurred very recently and insufficient time has elapsed to
#'  render a confident judgement of the nature of authority changes; the codes
#'  assigned are considered a "best assessment" that require further review and
#'  possible revision (p. 12).}
#'
#'  \item{fragment}{From the PolityIV manual, 2018 edition, pp. 12-13:
#'
#'  Polity Fragmentation: This variable codes the operational existence of a
#'  separate polity, or polities, comprising substantial territory and
#'  population within the recognized borders of the state and over which the
#'  coded polity exercises no effective authority (effective authority may be
#'  participatory or coercive). Local autonomy arrangements voluntarily
#'  established and accepted by both central and local authorities are not
#'  considered fragmentation. A polity that can not exercise relatively
#'  effective authority over at least 50 percent of its established territory is
#'  necessarily considered to be in a condition of "state failure" (i.e.,
#'  interruption or interregnum, see below, that may or may not coincide with
#'  active civil war). Polity fragmentation may result from open warfare (active
#'  or latent) or foreign occupation and may continue in the absence of open
#'  warfare as a situation of de facto separation remains unresolved and
#'  unchallenged by the state. Examples of de facto separation are northern
#'  Cyprus since 1975 (with Turkish occupation), NagornoKarabakh in Azerbaijan
#'  since 1994 (with Armenian occupation), Republika Srpska in Bosnia since 1995
#'  (with NATO occupation), Abkhazia and South Ossetia in Georgia from 1994,
#'  Chechnya in Russia from 1996 to 1999, and Kosovo in Serbia from 1999 to 2008
#'  (Kosovo became a contested, independent state in 2008). This variable is
#'  coded beginning only in the year 2000; it is blank for all prior years
#'  (i.e., it has not yet been coded historically).
#'
#'  (0) No overt fragmentation
#'
#'  (1) Slight fragmentation: Less than ten percent of the country's territory
#'  is effectively under local authority and actively separated from the central
#'  authority of the regime.
#'
#'  (2) Moderate fragmentation: Ten to twenty-five percent of the country's
#'  territory is effectively ruled by local authority and actively separated
#'  from the central authority of the regime.
#'
#'  (3) Serious fragmentation: Over twenty-five percent (and up to fifty
#'  percent) of the country's territory is effectively ruled by local authority
#'  and actively separated from the central authority of the regime.}
#'
#'  \item{democ}{Institutionalized democracy indicator, 0-10 scale. See PolityIV
#'  users' manual at [http://www.systemicpeace.org/inscr/p4manualv2018.pdf](http://www.systemicpeace.org/inscr/p4manualv2018.pdf)}
#'
#'  \item{autoc}{Institutionalized autocracy indicator, 0-10 scale. See PolityIV
#'  users' manual at [http://www.systemicpeace.org/inscr/p4manualv2018.pdf](http://www.systemicpeace.org/inscr/p4manualv2018.pdf)}
#'
#'  \item{polity}{Annual polity index (`autoc` - `democ`), including values for
#'  interruption (-66), interregnum (-77), and transition periods (-88). Higher
#'  values are more democratic. Note that the Polity users' manual (pp. 16-17)
#'  says that "The POLITY score was added to the Polity IV data series in
#'  recognition of its common usage by users in quantitative research and in the
#'  overriding interest of maintaining uniformity among users in this
#'  application. The simple combination of the original DEMOC and AUTOC index
#'  values in a unitary POLITY scale, in many ways, runs contrary to the
#'  original theory stated by Eckstein and Gurr in Patterns of Authority (1975)
#'  and, so, should be treated and interpreted with due caution. Its primary
#'  utility is in investigative research which should be augmented by more
#'  detailed analysis. The original theory posits that autocratic and democratic
#'  authority are distinct patterns of authority, elements of which may co-exist
#'  in any particular regime context. The inclusion of this variable in the data
#'  series should not be seen as an acceptance of the counter-proposal that
#'  autocracy and democracy are alternatives or opposites in a unified authority
#'  spectrum, even though elements of this perspective may be implied in the
#'  original theory. The POLITY variable provides a convenient avenue for
#'  examining general regime effects in analyses but researchers should note
#'  that the middle of the implied Polity "spectrum" is somewhat muddled in
#'  terms of the original theory, masking various combinations of DEMOC and
#'  AUTOC scores with the same POLITY score. Investigations involving hypotheses
#'  of varying effects of democracy and/or autocracy should employ the original
#'  Polity scheme and test DEMOC and AUTOC separately.}
#'
#'  \item{polity2}{Annual polity2 index, interpolating values for interruption
#'  (-66 is treated as `NA`), interregnum *-77 is treated as 0), and transition
#'  periods (prorated across the transition). Higher values are more
#'  democratic.}
#'
#'  \item{durable}{Regime durability. See PolityIV users' manual at
#'  [http://www.systemicpeace.org/inscr/p4manualv2018.pdf](http://www.systemicpeace.org/inscr/p4manualv2018.pdf) for details.}
#'
#'  \item{xrreg}{Regulation of Chief Executive Recruitment. 1 = unregulated, 2 =
#'  designational/transitional, 3 = regulated. See PolityIV users' manual at
#'  [http://www.systemicpeace.org/inscr/p4manualv2018.pdf](http://www.systemicpeace.org/inscr/p4manualv2018.pdf) for details.}
#'
#'  \item{xrcomp}{Competitiveness of Chief Executive Recruitment. 1 = selection,
#'  2 = dual/transitional, 3 = election. See PolityIV users' manual at
#'  [http://www.systemicpeace.org/inscr/p4manualv2018.pdf](http://www.systemicpeace.org/inscr/p4manualv2018.pdf) for details.}
#'
#'  \item{xropen}{Openness of Chief Executive Recruitment. 1 = unlimited, 2 =
#'  dual/transitional, 3 = election. See PolityIV users' manual at
#'  [http://www.systemicpeace.org/inscr/p4manualv2018.pdf](http://www.systemicpeace.org/inscr/p4manualv2018.pdf) for details.}
#'
#'  \item{xconst}{Executive constraints. 1 = closed, 2 = intermediate, 3 =
#'  slight to moderate limitation, 4 = intermediate, 5 = substantial
#'  limitations, 6 = intermediate, 7 = executive parity or subordination. See
#'  PolityIV users' manual at
#'  [http://www.systemicpeace.org/inscr/p4manualv2018.pdf](http://www.systemicpeace.org/inscr/p4manualv2018.pdf) for details.}
#'
#'  \item{parcomp}{Regulation of participation. 0 = Not applicable, 1 =
#'  repressed, 2 = suppressed, 3 = factional, 4 = transitional, 5 = competitive.
#'  See PolityIV users' manual at
#'  [http://www.systemicpeace.org/inscr/p4manualv2018.pdf](http://www.systemicpeace.org/inscr/p4manualv2018.pdf) for details.}
#'
#'  \item{exrec}{Executive recruitment (concept). 1 = ascription, 2 = dual
#'  (ascription + designation), 3 = designation, 4 = Self selection, 5 = gradual
#'  transition from self selection, 6 = dual (ascription + election), 7 =
#'  transitional or restricted election, 8 = competitive election. See PolityIV
#'  users' manual at [http://www.systemicpeace.org/inscr/p4manualv2018.pdf](http://www.systemicpeace.org/inscr/p4manualv2018.pdf) for
#'  details.}
#'
#'  \item{exconst}{Executive constraints (concept). Identical to `xconst`. 1 =
#'  closed, 2 = intermediate, 3 = slight to moderate limitation, 4 =
#'  intermediate, 5 = substantial limitations, 6 = intermediate, 7 = executive
#'  parity or subordination. See PolityIV users' manual at
#'  [http://www.systemicpeace.org/inscr/p4manualv2018.pdf](http://www.systemicpeace.org/inscr/p4manualv2018.pdf) for details.}
#'
#'  \item{polcomp}{Political competition (concept). 1 = suppressed, 2 =
#'  restricted 3 = Imposed transition, 4 = Uninstitutionalized, 5 = gradual
#'  transition from uninstitutionalized, 6 = factional/restricted, 7 =
#'  factional, 8 = electoral transition: persistent conflict/coercion, 9 =
#'  electoral transition: limited conflict/coercion, 10 = institutionalized
#'  electoral. See PolityIV users' manual at
#'  [http://www.systemicpeace.org/inscr/p4manualv2018.pdf](http://www.systemicpeace.org/inscr/p4manualv2018.pdf) for details.}
#'
#'  \item{prior}{Regime Polity code immediately prior to regime end date. The
#'  polity users' manual (p. 31) says "The PRIOR code may be a number from -10
#'  to 10 or it may be a "begin state" code (88 or 99); it may not be a
#'  standardized authority code (i.e., -66, -77, or -88) as those are
#'  necessarily transitory conditions, not polities. The PRIOR code and the
#'  corresponding EYEAR and EDATE of the initial polity change (i.e., the first
#'  year record) in a multi-year regime change is repeated in the record of the
#'  final year of the multi-year change. This has been done to facilitate
#'  retrieval of information concerning the beginning and ending polities in
#'  multi-year regime changes, particularly when the D3 "flag" variable is used
#'  to select regime transition cases out of the larger dataset."}
#'
#'  \item{emonth}{Polity end month. End month of previous polity, start of
#'  current.}
#'
#'  \item{eday}{Polity end day. End day of previous polity, start of current.}
#'
#'  \item{eyear}{Polity end year. End year of previous polity, start of
#'  current.}
#'
#'  \item{eprec}{End date precision. 1 = exact date, 2 = assigned date (where
#'  more than one event could be used, or event persisted for more than one
#'  day), 3 = approximate date (month could be identified, but not the day), 4 =
#'  missing (year could be identified, but not month or day), 5 = unknown (not
#'  recorded 1995-98).}
#'
#'  \item{interim}{The Polity users' manual says (p. 32) "Interim Polity Code:
#'  Interim Polity coding is used to denote (1) the short-lived nature of a
#'  distinct change in regime authority that spans only a portion of the coded
#'  year (i.e., a POLITY code) that would not otherwise be recorded due to the
#'  annualized structure of the Polity data, (2) a "transition" period of three
#'  years or less while a new Polity is being established (i.e., -88 code), (3)
#'  an "interruption" period of any length while a Polity remains under foreign
#'  authority (i.e., -66 code), or (4) an "interregnal" period denoting a
#'  collapse of central authority (i.e., -77 code). INTERIM is coded for each
#'  year between the end date (EDATE) of the previous Polity and the begin date
#'  (BDATE) of the subsequent Polity whenever standardized authority codes are
#'  used or when a series of incremental changes over a period of three years
#'  orless combine for a consistent POLITY change of three points or more
#'  ("consistent" here means that the incremental changes are all in the same
#'  general direction, positive or negative)."}
#'
#'  \item{bmonth}{Polity beginning month. Beginning month of next polity, end of
#'  current.}
#'
#'  \item{bday}{Polity beginning day. Beginning day of next polity, end of
#'  current.}
#'
#'  \item{eyear}{Polity beginning year. Beginning year of previous polity, end
#'  of current.}
#'
#'  \item{bprec}{Beginning date precision. 1 = exact date, 2 = assigned date
#'  (where more than one event could be used, or event persisted for more than
#'  one day), 3 = approximate date (month could be identified, but not the day),
#'  4 = missing (year could be identified, but not month or day), 5 = unknown
#'  (not recorded 1995-98).}
#'
#'  \item{post}{Regime `polity` code immediately after the current regime.}
#'
#'  \item{change}{Net difference between `prior` and `post`. See PolityIV users'
#'  manual at [http://www.systemicpeace.org/inscr/p4manualv2018.pdf](http://www.systemicpeace.org/inscr/p4manualv2018.pdf) for details.
#'  Note the code 88 denotes a "pre-existing polity" (for polities that existed
#'  before 1800), 96 indicates state disintegration, 0 a state in transition, 97
#'  state transformation, 98 state demise, and 99 state creation.}
#'
#'  \item{d4}{Regime Transition Completed. Variable D4 is a flag variable that
#'  designates (by code "1") the year of a regime change or the final year of a
#'  multi-year regime transition.}
#'
#'  \item{sf}{State failure. Variable SF is a flag variable that designates (by
#'  code "1") every year during which a Polity is considered to be in a
#'  condition of "complete collapse of central authority" or "state failure"
#'  (i.e., -77). The variable SF is also coded "1" for years when a state
#'  disintegrates (variable CHANGE code "96") and when a profound revolutionary
#'  change in political authority occurs (during which the authority of the
#'  previous Polity is assumed to have collapsed completely prior to the
#'  revolutionary seizure of power and subsequent restructuring of authority).}
#'
#'  \item{regtrans}{Regime transition. 3 = major democratic transition, 2 =
#'  minor democratic transition, 1 = positive regime change, 0 = little or no
#'  change, -1 = negative regime change, -2 adverse regime change, -77 state
#'  failure, -66 interruption, 96 = state disintegration, 97 = state
#'  transformation, 98 = state demise, 99 = state creation.}
#'
#'  }
#'
#'@template standard-variables
#'
#'@source `r roxygen_cite("polity2019")` Available at
#'  \url{http://www.systemicpeace.org/inscr/p4manualv2018.pdf}
#'
#'
#'
#'@family democracy
#'@family ordinal democracy indexes
#'@seealso \link{download_polity_annual}
#'@seealso \link{redownload_polityIV}
#'@seealso [polity]
"polityIV"

# PRC/Gasiorowski ---------------------------------------------------------

#' The Political Regime Change (PRC) dataset.
#'
#' The Political Regime Change dataset. First described in `r roxygen_cite("gasiorowski1996")`
#' Available in updated form in `r roxygen_cite("prc_gasiorowski2002")`
#' \url{http://www.tandfonline.com/doi/pdf/10.1080/714000289}.
#'
#' \describe{
#'
#' \item{prc_gasiorowski_country}{The original country name in the dataset.}
#'
#' \item{year}{Calendar year. In the \code{prc_gasiorowski} dataset, more than
#' one regime may be coded for a country-year. For example, Bulgaria in 1990 is
#' coded as an authoritarian regime (to mid 1990), then a transitional regime,
#' and then as a democracy, so there are three different values for Bulgaria
#' 1990. In the \code{prc_pmm}, only the last regime (democracy, in the Bulgaria
#' case for 1990) is coded for the year, so there is only one value for each
#' country-year. }.
#'
#' \item{regime}{The regime type for the year. Can be A (authoritarian), T
#' (transition), S (semidemocratic), and D (democratic).}
#'
#' \item{start}{The start year of the regime.}
#'
#' \item{end}{The end year of the regime.}
#'
#' \item{prc}{Numeric version of \code{regime}. 1 = authoritarian, 2 =
#' transition, 3 = semidemocratic, 4 = democratic.}
#'
#' \item{prc_at_end_year}{Value of \code{prc} at the end of the year. (May
#' differ from value at the beginning of the year when a transition occurs).
#' Only in the \code{pmm_gasiorowski} dataset.}
#'
#' \item{prc_at_beginning_year}{Value of \code{prc} at the beginning of the
#' year. (May differ from value at the end of the year when a transition
#' occurs). Only in the \code{pmm_gasiorowski} dataset.}
#'
#' \item{prc_notrans}{Same as \code{prc} but with transition values set to NA.
#' Only in \code{prc} dataset.}
#'
#' }
#' @template standard-variables
#' @source `r roxygen_cite("prc_gasiorowski1996")`
#'
#' @source `r roxygen_cite("prc_gasiorowski2002")`
#'   \url{http://www.tandfonline.com/doi/pdf/10.1080/714000289}.
#' @family democracy
#' @family trichotomous democracy indexes
#' @family PMM replication data
#' @family events data
#' @aliases prc gasiorowski
"prc_gasiorowski"

#' @rdname prc_gasiorowski
#' @section Note:
#'
#'   The \code{prc_pmm} version of this data is taken from `r roxygen_cite("pmm2013")`
#'   The original dataset is found in
#'   [prc_gasiorowski]. The [prc_pmm] data only goes back to 1945. It
#'   also differs from the original data in 245 country-years, because it only
#'   includes one year per country - whereas [prc_gasiorowski] can include
#'   more than one regime classification for a given year. It is included here
#'   for completeness (and to enable one to replicate the [uds] index).
"prc_pmm"


# svmdi -------------------------------------------------------------------

#' Suport Vector Machine Democracy Index by Grundler and Krieger
#'
#' This is the index described in `r roxygen_cite("svmdi2018")` An earlier
#' version of this index (used in `r roxygen_cite("svmdi2016")`) is available as
#' [svmdi_2016]; there are some important differences between the values of the
#' earlier and later versions of the index.
#'
#' @section Variables:
#'
#'   \describe{
#'
#'   \item{svmdi_country}{The country name, as in the original dataset, with
#'   minimal modification. Use \code{extended_country_name} instead if you want
#'   a consistent name.}
#'
#'   \item{svmdi_iso}{Three letter ISO country code. In the original dataset.}
#'
#'   \item{year}{The calendar year.}
#'
#'   \item{region1}{Geographical region. (In the 2016 release only).}
#'
#'   \item{region2}{Geographical region. (In the 2016 release only).}
#'
#'   \item{csvmdi}{Continuous version of the support vector machine democracy
#'   index (In the 2020 release only). Ranges from 0 = least demcratic to 1 =
#'   most democratic. }
#'
#'   \item{dsvmdi}{Discrete version of the support vector machine democracy
#'   index (In the 2020 release only). 0 = Not demcratic, 1 =
#'   democratic. }
#'
#'   \item{svmdi}{Continuous version of the support vector machine democracy
#'   index (In the 2016 release only). Ranges from 0 = least demcratic to 1 =
#'   most democratic. }
#'
#'   \item{svmdi_sd}{Standard deviation of the continuous version of the support
#'   vector machine democracy index (In the 2016 release only). }
#'
#'   \item{svmdi_q5}{Lower confidence bound of the continuous version of the
#'   support vector machine democracy index (In the 2016 release only). }
#'
#'   \item{svmdi_q95}{Upper confidence bound of the continuous version of the
#'   support vector machine democracy index (In the 2016 release only). }
#'
#'   }
#'
#' @template standard-variables
#' @family democracy
#' @family continuous democracy indexes
#' @source `r roxygen_cite("svmdi2016")`
#'
#' @source `r roxygen_cite("svmdi2016")`
"svmdi"

#' @rdname svmdi
#'
#' @aliases svmdi
"svmdi_2016"


# Svolik ------------------------------------------------------------------

#' Milan Svolik's Regime Dataset
#'
#' The data used to classify democracies and dictatorships for Milan Svolik's
#' *The Politics of Authoritarian Rule*. The full data and codebook can be
#' downloaded here: \url{https://campuspress.yale.edu/svolik/}
#'
#' @section Variables:
#'
#'   \describe{
#'
#'   \item{svolik_regime_country}{The original country name.}
#'
#'   \item{svolik_regime_ccode}{The original country code (COW).}
#'
#'   \item{year}{The calendar year.}
#'
#'   \item{regime}{Regime type: democracy, dictatorship, independence or no
#'   authority. From Svolik's codebook:
#'
#'   A dictatorship as an independent country that fails to satisfy at least one
#'   of the following two criteria for democracy: (1) free and competitive
#'   legislative elections and (2) an executive that is elected either directly
#'   in free and competitive presidential elections or indirectly by a
#'   legislature in parliamentary systems. By identifying the allocation of
#'   executive and legislative powers by competitive elections as the principal
#'   difference between dictatorships and democracies, I am following
#'   Schumpeter's (1950) and Dahl's (1971) procedural approach to the
#'   classification of regime types and build on its operationalization by
#'   Alvarez et al. (1996), Boix (2003), and Cheibub et al. (2010).
#'
#'   I nonetheless do depart from Alvarez et al. (1996), Boix (2003), and
#'   Cheibub et al. (2010) in two ways. First, I exclude from the data any "no
#'   authority" periods (as I just discussed above.) Second, I do not require
#'   that the incumbent and the opposition alternate in power before a country
#'   is considered democratic. Instead, in order to determine when elections are
#'   sufficiently free and competitive for a country to be considered a
#'   democracy, I build on the fact that the measurement problem involved in
#'   such endeavor systematically differs between transitions from dictatorship
#'   to democracy and transitions from democracy to dictatorship.
#'
#'   In the case of transitions from dictatorship to democracy, the measurement
#'   problem in ascertaining whether elections are genuinely competitive is most
#'   severe when the authoritarian incumbent allows for multi-party elections
#'   but gets himself or a candidate he supports elected. The measurement
#'   problem is less severe when an opposition candidate wins - in these cases
#'   we can be confident that the election was genuinely competitive.
#'
#'   In the case of transitions from democracy to dictatorship, the measurement
#'   problem in ascertaining whether elections are genuinely competitive is most
#'   severe when an incumbent gets re-elected by significantly manipulating
#'   competition in his favor without abolishing multi-party elections. The
#'   measurement problem is less severe when an unelected actor (typically the
#'   military) replaces or abolishes multi-party elections, the legislature, or
#'   the executive - in these cases we can be confident that the country seized
#'   to be a democracy.
#'
#'   I therefore employ two sets of coding rules:
#'
#'   The emergence of democracy (transitions from dictatorship to democracy):
#'   The country establishes multi-party legislative and multi-candidate
#'   executive elections (where applicable) and at least one of the following
#'   two conditions is satisfied:
#'
#'   i. A former or current opposition candidate becomes chief executive; or
#'
#'   ii. The authoritarian incumbent (or a candidate supported by the former
#'   authoritarian incumbent) gets elected as chief executive but there is a
#'   consensus among outside observers that the elections were free and fair.
#'
#'   The breakdown of democracy (transitions from democracy to dictatorship): At
#'   least one of the following two conditions is satisfied:
#'
#'   i. An unelected actor replaces or abolishes an election, the legislature,
#'   or the executive; or
#'
#'   ii. An incumbent (or a candidate supported by the incumbent) gets elected as chief
#'   executive but there is a consensus among outside observers that the elections were
#'   not free and fair.
#'   }
#'
#'   \item{regime_numeric}{A numeric version of \code{regime}. 1 = democracy, 0 = non-democracy, everything else is \code{NA}.}
#'
#'   \item{start_year}{First year of the regime.}
#'
#'   \item{end_year}{Last year of the regime.}
#'
#'   }
#'
#' @template standard-variables
#'
#' @aliases svolik
#' @family democracy
#' @family dichotomous democracy indexes
#'
#' @source `r roxygen_cite("svolik")` The full data and codebook can be
#'   downloaded here:
#'   \url{https://campuspress.yale.edu/svolik/}
#'
#'
"svolik_regime"

# UTIP --------------------------------------------------------------------


#' The University of Texas Inequality Project Categorical Dataset of Political
#' Regimes
#'
#' The University of Texas Inequality Project Categorical Dataset of Political
#' Regimes. Described in `r roxygen_cite("utip")`
#' \url{http://utip.gov.utexas.edu/papers/utip_53.pdf}. Data available for
#' download at
#' \url{http://utip.gov.utexas.edu/data/}
#'
#' @section Description:
#'
#'   This is a categorical dataset of regime types, used in papers on inequality
#'   by the UTIP group. The coding rules are not well documented. The category
#'   "one party democracy" is particularly difficult to understand. The
#'   categories are nevertheless mutually exclusive.
#'
#'   \describe{
#'
#'   \item{utip_country}{The original country name in the dataset.}
#'
#'   \item{year}{Calendar year}.
#'
#'   \item{other_dictatorship}{Whether the regime is a non-military
#'   dictatorship. 0 = no, 1 = yes.}
#'
#'   \item{military_dictatorship}{Whether the regime is a military dictatorship.
#'   0 = no, 1 = yes.}
#'
#'   \item{civil_war}{Whether the regime is in a civil war. 0 = no, 1 = yes.}
#'
#'   \item{one_party_democracy}{Whether the regime is a "one party democracy",
#'   where "fair" elections are held but only one party competes. 0 = no, 1 =
#'   yes.}
#'
#'   \item{communist}{Whether the regime is communist. 0 = no, 1 = yes.}
#'
#'   \item{islamic_republic}{Whether the regime is an Islamic republic. 0 = no,
#'   1 = yes. In practice, only Libya and Iran qualify.}
#'
#'   \item{social_democracy}{Whether the regime is social democracy, using the
#'   Esping-Andersen (1990) classification of welfare states. 0 = no, 1 = yes.}
#'
#'   \item{conservative_democracy}{Whether the regime is a democracy with a
#'   conservative or liberal welfare state, using the Esping-Andersen (1990)
#'   classification of welfare states. 0 = no, 1 = yes.}
#'
#'   \item{utip_dichotomous}{Calculated, not in original dataset. Dichotomous
#'   index of whether the regime is a social democracy, conservative democracy,
#'   or one party democracy. 0 = no, 1 = yes.}
#'
#'   \item{utip_dichotomous_strict}{Calculated, not in original dataset.
#'   Dichotomous index of whether the regime is a social democracy or a
#'   conservative democracy (excludes one party democracy). 0 = no, 1 = yes.}
#'
#'   \item{utip_trichotomous}{Calculated, not in original dataset. Trichotomous
#'   index of democracy: 2= regime is a social democracy or a conservative
#'   democracy (excludes one party democracy), 1 = regime is a one party
#'   democracy, 0 = other.}
#'
#'   }
#' @template standard-variables
#' @family democracy
#' @family authoritarianism
#' @family dichotomous democracy indexes
#' @family trichotomous democracy indexes
#' @source `r roxygen_cite("utip")`
"utip"


# PITF --------------------------------------------------------------------


#' PITF democracy indicator
#'
#' The democracy indicator used by the political instability task force and
#' described in `r roxygen_cite("pitf2010")` and in `r roxygen_cite("pitf2015")`
#' This is derived from the Polity dataset (pitf uses version 5; pitf_p4 uses
#' PolityIV updated to 2018).
#'
#' @section Variables:
#'
#'   \describe{
#'
#'   \item{pitf_country}{The original country name in the Polity dataset.}
#'
#'   \item{pitf_ccode}{The \code{ccode} variable in the polity dataset. Should
#'   be identical to \code{cown}.}
#'
#'   \item{year}{The calendar year.}
#'
#'   \item{exrec}{The polity "executive recruitment" variable. Can be: 1 =
#'   Ascription
#'
#'   2 = Dual Executive (Designation)
#'
#'   3 = Designation
#'
#'   4 = Self-Selection
#'
#'   5 = Gradual Transition from Self-Selection Dual Executive (Election)
#'
#'   6 = Transitional or Restricted Election
#'
#'   7 = Competitive Election.
#'
#'   See the polity codebook for more details.}
#'
#'   \item{parcomp}{The polity "competitiveness of participation" variable. See the
#'   polity codebook for more details. Here's what the codebook says:
#'
#'   The Competitiveness of Participation: The competitiveness of participation
#'   refers to the extent to which alternative preferences for policy and
#'   leadership can be pursued in the political arena. Political competition
#'   implies a significant degree of civil interaction, so polities which are
#'   coded Unregulated (1) on Regulation of Participation (PARREG, variable 2.5)
#'   are not coded for competitiveness. Polities in transition between
#'   Unregulated and any of the regulated forms on variable 2.5 also are not
#'   coded on variable 2.6. Competitiveness is coded on a five category scale:
#'
#'   (0) Not Applicable: This is used for polities that are coded as
#'   Unregulated, or moving to/from that position, in Regulation of Political
#'   Participation (variable 2.6).
#'
#'   (1) Repressed: No significant oppositional activity is permitted outside
#'   the ranks of the regime and ruling party. Totalitarian party systems,
#'   authoritarian military dictatorships, and despotic monarchies are typically
#'   coded here. However, the mere existence of these structures is not
#'   sufficient for a Repressed coding. The regime's institutional structure
#'   must also be matched by its demonstrated ability to repress oppositional
#'   competition.
#'
#'   (2) Suppressed: Some organized, political competition occurs outside
#'   government, without serious factionalism; but the regime systematically and
#'   sharply limits its form, extent, or both in ways that exclude substantial
#'   groups (20 percent or more of the adult population) from participation. Suppressed
#'   competition is distinguished from Factional competition (below) by the
#'   systematic, persisting nature of the restrictions: large classes of people,
#'   groups, or types of peaceful political competition are continuously
#'   excluded from the political process. As an operational rule, the banning of
#'   a political party which received more than 10 percent of the vote in a recent
#'   national election is sufficient evidence that competition is "suppressed."
#'   However, other information is required to determine whether the appropriate
#'   coding is (2) Suppressed or (3) Factional competition. This category is
#'   also used to characterize transitions between Factional and Repressed
#'   competition. Examples of "suppression" are:
#'
#'   i. Prohibiting some kinds of political organizations, either by type or
#'   group of people involved (e.g., no national political parties or no ethnic
#'   political organizations).
#'
#'   ii. Prohibiting some kinds of political action (e.g., Communist parties may
#'   organize but are prohibited from competing in elections).
#'
#'   iii. Systematic harassment of political opposition (leaders killed, jailed,
#'   or sent into exile; candidates regularly ruled off ballots; opposition
#'   media banned, etc.). This is evidence for either Factional, Suppressed, or
#'   Repressed, depending on the nature of the regime, the opposition, and the
#'   persistence of political groups. Note 3.6: A newly enacted right to engage
#'   in political activities is most likely a change from category 1 to 2.
#'
#'   (3) Factional: Polities with parochial or ethnic-based political factions
#'   that regularly compete for political influence in order to promote
#'   particularist agendas and favor group members to the detriment of common,
#'   secular, or cross-cutting agendas.
#'
#'   (4) Transitional: Any transitional arrangement from Restricted, Suppressed,
#'   or Factional patterns to fully Competitive patterns, or vice versa.
#'   Transitional arrangements are accommodative of competing, parochial
#'   interests but have not fully linked parochial with broader, general
#'   interests. Sectarian and secular interest groups coexist.
#'
#'   (5) Competitive: There are relatively stable and enduring, secular
#'   political groups which regularly compete for political influence at the
#'   national level; ruling groups and coalitions regularly, voluntarily
#'   transfer central power to competing groups. Competition among groups seldom
#'   involves coercion or disruption. Small parties or political groups may be
#'   restricted in the Competitive pattern.
#'
#'   By combining scores on Regulation of Political Participation (variable 3.5)
#'   and the Competitiveness of Participation (variable 3.6), a relatively
#'   detailed picture of the extent of political competition and opposition
#'   emerges.}
#'
#'   \item{pitf}{A five category indicator of democracy described in Goldstone
#'   et al 2010. Can be:
#'
#'   0-Full autocracy (exrec < 7, parcomp !=0 and parcomp < 3)
#'
#'   1-Partial autocracy (exrec < 7, parcomp = 0 or parcomp > 2)
#'
#'   2-Partial democracy with factionalism (exrec > 6, parcomp = 3)
#'
#'   3-Partial democracy (exrec > 6, parcomp = 0 or parcomp = 4 or parcomp = 5
#'   but exrec != 8)
#'
#'   4-Full democracy (exrec = 8, parcomp = 5). See Goldstone et al. 2010 for
#'   full details.}
#'
#'   \item{pitf_binary}{A simplification of the pitf indicator of democracy.
#'   A country is a democracy (1)
#'   "if its chief executive is chosen in competitive elections (EXREC equal to
#'   7 or 8) and political competition is not suppressed (PARCOMP equal to 0 or
#'   PARCOMP greater than 2)" Otherwise it is a non-democracy (0).} }
#'
#' @template standard-variables
#' @references
#'
#' `r roxygen_cite("pitf2010")`
#'
#' `r roxygen_cite("pitf2015")`
#'
#' @family democracy
#' @family polity
"pitf"

#' @rdname pitf
"pitf_p4"

# Polyarchy ---------------------------------------------------------------


#' The Polyarchy Scale and the Contestation Scale
#'
#' `r roxygen_cite("polyarchy1990")` Data
#' available at \url{http://www3.nd.edu/~mcoppedg/crd/datacrd.htm}. The codebook
#' below is copied from that website.
#'
#' @section About the Coding and the Scales:
#'
#'   The Polyarchy Scale and the Contestation Scale are quasi-Guttman scales
#'   using polytomous items.
#'
#'   The Contestation Scale is a less precise but more reliable version of the
#'   Polyarchy Scale.
#'
#'   For that scale, there were two coders--Coppedge and Reinicke. A reliability
#'   check was later performed by Anna Papavlachopoulou. Beginning in 2003,
#'   Coppedge had the undergraduate students in his quantitative methods course
#'   replicate the coding for all countries as of July 1, 2000.
#'
#'   In 2003, 11 students coded 60 randomly-selected countries. In 2004, 15
#'   students coded 85 countries. In 2005, 15 students coded the remaining 47
#'   countries (and 3 countries repeated from 2003). Each year, five countries
#'   were coded by every student and these initial codes discussed, and
#'   sometimes revised, before coding the rest.
#'
#'   In 2003 and 2004, the rest of the countries were each coded by 3 students
#'   each. In 2005, the rest of the countries were coded by 5 students each.
#'   Because some of the ratings were based on weak agreement, in 2006 nine
#'   graduate students were asked to code them, and others from 2000,
#'   independently. Their ratings have been pooled with those of the
#'   undergraduate coders and the scalogram analysis repeated. This resulted in
#'   modified ratings for 21 countries (11 percent): 5 becoming less polyarchic,
#'   16 more polyarchic.
#'
#'   The data posted here are the revised data. The earlier ratings are
#'   available on request. For the 1985 data, multiple sources of information
#'   were used. For the 2000 data, all coders consulted only the State
#'   Department's Country Reports on Human Rights Practices for 2001 as their
#'   source of information. This information is available on line at
#'   \url{http://www.state.gov/g/drl/rls/hrrpt/2001/}.
#'
#'   Every year, 82-86 percent of their ratings were in agreement. This is about
#'   the same level of reliability that Reinicke and Coppedge reported in 1990.
#'   For the data presented here, however, Coppedge selected the modal rating
#'   for each country on each variable and repeated the scalogram analysis.
#'
#'   Because some different scale types were found in 1985 and 2000, Coppedge
#'   decided to combine categories 4 and 5, and 8 and 9, in order to produce a
#'   more reliable scale, the Contestation scale. This scale ranges from 9
#'   (greatest contestation) to 1 (least contestation). To convert the old scale
#'   into the new one, if old<=5, new=9-old; if 5<old<9, new=10-old; if old>=9,
#'   new=11-old.
#'
#'   Note that the new coding corrects the confusing convention of the Polyarchy
#'   Scale of having the lowest score represent the most democratic level.
#'   Categories are combined in the aggregated scale only, not in the component
#'   variables. This increases reliability while minimizing the loss of
#'   information. There is still a one-to-one correspondence between scale
#'   scores and the brief descriptions of the scale types, although types 2 and
#'   5 build in a greater variety of ways to attain those scores.The coefficient
#'   of reproducibility for the 2000 Contestation scale (allowing for combined
#'   ranks) is .950. Coefficient alpha for its four variables is .927.
#'
#' @section Variables:
#'
#'   Ratings are based on actual practice rather than formal constitutional
#'   provisions.
#'
#'   When there is regional diversity in the regime, pay attention only to the
#'   largest, most populous, and most politically important region(s) of the
#'   country.
#'
#'   Read the coding criteria carefully and refer to them often to make sure you
#'   are applying them faithfully.
#'
#'   \describe{
#'
#'   \item{polyarchy_country}{The country name in the original dataset. Note
#'   "Western Sahara" has been changed to "Morocco (Western Sahara)"}
#'
#'   \item{polyarchy_code}{The alphanumeric country code in the original
#'   dataset.}
#'
#'   \item{altinf}{Media pluralism.
#'
#'   1	Alternative sources of information exist and are protected by law. If
#'   there is significant government ownership of the media, they are
#'   effectively controlled by truly independent or multi-party bodies.
#'
#'   2	Alternative sources of information are widely available but government
#'   versions are presented in preferential fashion. This may be the result of
#'   partiality in and greater availability of government-controlled media;
#'   selective closure, punishment, harassment, or censorship of dissident
#'   reporters, publishers, or broadcasters; or mild self-censorship resulting
#'   from any of these.
#'
#'   3	The government or ruling party dominates the diffusion of information to
#'   such a degree that alternative sources exist only for nonpolitical issues,
#'   for short periods of time, or for small segments of the population. The
#'   media are either mostly controlled directly by the government or party or
#'   restricted by routine prior censorship, near-certain punishment of
#'   dissident reporters, publishers, and broadcasters, or pervasive
#'   self-censorship. Foreign media or the Internet may be available to a small
#'   segment of the population without restrictions.
#'
#'   4	There is no public alternative to official information. All sources of
#'   information are official organs or completely subservient private sources.
#'   The media are considered instruments of indoctrination. Foreign
#'   publications and the Internet are usually unavailable or censored, and
#'   foreign broadcasts may be jammed.}
#'
#'
#'   \item{fairelt}{Fair elections.
#'
#'   1	The most important effective heads of the government are elected, and
#'   national elections take place without significant or routine fraud or
#'   coercion, or with incidents of fraud or coercion that are likely to be
#'   punished.
#'
#'   2	The most important effective heads of the government are elected, but
#'   national elections have significant fraud or coercion that goes unpunished,
#'   such as widespread voter intimidation or assassination of candidates,
#'   whether it changes the winner of the election or merely alters the margin
#'   of victory.
#'
#'   3	No meaningful elections: i.e., elections without choice of candidates or
#'   parties, or no elections at all.}
#'
#'   \item{freorg}{Freedom of organization.
#'
#'   1	Some trade union or interest groups may be harassed or banned but there
#'   are no restrictions on purely political organization for parties that have
#'   not previously committed mass murder. Permits may be required but are not
#'   used to limit opposition activities.
#'
#'   2	Some political parties that have not committed mass murder are banned and
#'   trade unions or interest groups are harassed or banned, but membership in
#'   some alternatives to official organizations is permitted. Permits may be
#'   required and are used to limit opposition activities.
#'
#'   3	The only relatively independent organizations that are allowed to exist
#'   are nonpolitical.
#'
#'   4	No independent organizations are allowed. All organizations are banned or
#'   controlled by the government or the party. }
#'
#'   \item{frexp}{Freedom of expression.
#'
#'   1	Citizens express their views on all topics without fear of punishment.
#'
#'   2	Dissent is discouraged, whether by informal pressure or by systematic
#'   censorship, but control is incomplete. The extent of control may range from
#'   selective punishment of dissidents on a limited number of issues to a
#'   situation in which only determined critics manage to make themselves heard,
#'   yet they sometimes can sway public opinion. There is some freedom of
#'   private discussion.
#'
#'   3	All open dissent is forbidden and effectively suppressed, though a few
#'   citizens may express dissent publicly in covert ways. Citizens are wary of
#'   criticizing the government even privately.}
#'
#'   \item{poly}{Polyarchy scale. Superceded by Contestation scale.}
#'
#'   \item{cont}{Contestation scale.
#'
#'   9	pattern = 1111 Meaningful fair elections are held, there is full freedom
#'   for political organization and expression, and there is no preferential
#'   presentation of official views in the media.
#'
#'   8	pattern = 1112 Meaningful fair elections are held and there is full
#'   freedom for political organization and expression, but there is
#'   preferential presentation of official views in the media.
#'
#'   7	pattern = 1122 Meaningful fair elections are held and there is full
#'   freedom for political organization, but some public dissent is suppressed
#'   and there is preferential presentation of official views in the media.
#'
#'   6	pattern = 1222 Meaningful fair elections are held, but some independent
#'   political organizations are banned, some public dissent is suppressed, and
#'   there is preferential presentation of official views in the media.
#'
#'   5	pattern = 2222 Elections are marred by fraud or coercion, some
#'   independent political organizations are banned, some public dissent is
#'   suppressed, and there is preferential presentation of official views in the
#'   media.
#'
#'   4	patterns = 3222, 2223, 3223, or 3322	Like score 5 except that there is
#'   less contestation in one or two of the following respects: no meaningful
#'   elections are held, only nonpolitical organizations are allowed to be
#'   independent, or alternatives to the official media are very limited.
#'
#'   3	pattern = 3323	No meaningful elections are held, only nonpolitical
#'   organizations are allowed to be independent, some public dissent is
#'   suppressed, and alternatives to the official media are very limited.
#'
#'   2	patterns = 3423, 3333, 3424, 3433, or 3334	Like score 3 except that there
#'   is less contestation in one or two of the following respects: all
#'   organizations are banned or controlled by the government or official party,
#'   all public dissent is suppressed, or there is no public alternative to
#'   official information.
#'
#'   1	pattern= 3434	No meaningful elections are held, all organizations are
#'   banned or controlled by the government or official party, all public
#'   dissent is suppressed, and there is no public alternative to official
#'   information. }
#'
#'   \item{suff}{Extent of suffrage (1985 only).}
#'
#'   }
#' @template standard-variables
#' @family democracy
#' @family polyarchy
#' @source `r roxygen_cite("polyarchy1990")`
"polyarchy"

#' @rdname polyarchy
#' @section Note:
#'
#'   The \code{polyarchy_pmm} version of this data is taken from `r roxygen_cite("pmm2013")` The
#'   original dataset is found in [polyarchy]. It only contains a reversed
#'   version of the \code{poly} variable in the original [polyarchy] dataset (higher
#'   values being more democratic). 22 country-years differ between PMM's
#'   replication data and the original Polyarchy dataset (Coppedge and Reinicke
#'   1990), and four are missing. These seem to be due to simple transcription
#'   errors. See the vignette for more details.
"polyarchy_pmm"

#' Indicators of Contestation and Inclusiveness by Michael Coppedge, Angel
#' Alvarez, and Claudia Maldonado
#'
#' From the codebook at [https://www3.nd.edu/~mcoppedg/crd/datacrd.htm](https://www3.nd.edu/~mcoppedg/crd/datacrd.htm): This
#' dataset contains several versions of two indicators that measure Robert
#' Dahl's two dimensions of polyarchy: contestation and inclusiveness. For
#' complete documentation of the analysis that identifies these two dimensions,
#' see the published article: `r roxygen_cite("polyarchy_dimensions")`
#'
#' @section Introduction:
#'
#'   These variables are the first (and usually, only) two principal component
#'   scores obtained when analyzing a dozen or more of the most commonly used
#'   indicators of democracy. A principal components analysis (PCA) was done
#'   separately for each year, 1950-2000. The mix of variables changed over
#'   time, but the mix was fixed in three partially overlapping intervals:
#'   1950-1971, 1972-1988, and 1982-2000.
#'
#'   In order to make these scores comparable over time, they were standardized.
#'   Because these estimates are constrained to have a mean of zero and a
#'   standard deviation of one, they do not reflect the changes in the mean
#'   levels of contestation or inclusiveness, or their dispersion, that occur
#'   during waves of democratization or authoritarianism. We therefore
#'   calculated versions of our component scores that do reflect these trends.
#'   First we repeated the PCA using each of the samples (1950-1971, 1972-1988,
#'   and 1981-2000) with all the years in each sample pooled together. We then
#'   generated the component scores for each year within each of the three
#'   samples, based on these pooled estimates. Then we calculated the mean and
#'   standard deviation of these pooled-sample contestation and inclusiveness
#'   components for each year. Finally, we adjusted the original component
#'   scores so that their annual means and standard deviations would be the same
#'   as those of the pooled-sample estimates. Therefore, the new "standardized"
#'   component scores are defined as
#'
#'   CONTEST' = sigma(CONTEST)t * CONTEST + mu(CONTEST)t
#'
#'   INCLUS' = sigma(INCLUS)t * INCLUS + mu(INCLUS)t
#'
#'   where CONTEST and INCLUS are the component scores estimated with annual
#'   samples, and sigma(CONTEST)t  and  mu(CONTEST)t are the standard
#'   deviation and mean in year t of the contestation component scores estimated
#'   with the pooled sample; the same goes for INCLUS'. The 1972-1988 pooled
#'   sample is used as a baseline. Standardized scores for 1989-2000 are chained
#'   forward from 1988 based on changes in the later sample, or the average of
#'   changes in both samples, where they overlap.
#'
#'   This adjustment yields mean scores that reflect the wave of
#'   authoritarianism of the 1960s and 1970s and the third wave of
#'   democratization:
#'
#'   It also shows homogenization of levels of inclusiveness after 1970. This
#'   procedure for adjusting the component scores yields data with greater face
#'   validity. Nevertheless, the adjustments are not very large: the
#'   correlations between the original and standardized component scores are .97
#'   for Contestation and .96 for Inclusiveness.
#'
#' @section Variables:
#'
#'   polyarchy_dimensions_cname: Country Name.
#'
#'   abbr: country abbreviation.
#'
#'   year: Year.
#'
#'   yr: abbreviated year.
#'
#'   CONTEST: Contestation (pooled years). This series combines the component
#'   scores from all three samples. For the years of overlap (1982-1988), the
#'   1972-1988 estimates are used.
#'
#'   INCLUS: Inclusiveness (pooled years). This series combines the component
#'   scores from all three samples. For the years of overlap (1982-1988), the
#'   1972-1988 estimates are used.
#'
#'   CONTESTstd: Contestation standardized to be comparable across years. See
#'   explanation on introduction.
#'
#'   INCLUSstd: Inclusiveness standardized to be comparable across years. See
#'   explanation on introduction.
#'
#'   ContestationA: Contestation (1950-71 estimate). These are estimates from
#'   each annual cross-section, pooled.
#'
#'   INCLUSA: Inclusiveness (1950-71 estimate). These are estimates from each
#'   annual cross-section, pooled.
#'
#'   CONTESTB: Contestation (1972-88 estimates). These are estimates from each
#'   annual cross-section, pooled.
#'
#'   INCLUSB: Inclusiveness (1972-88 estimates). These are estimates from each
#'   annual cross-section, pooled.
#'
#'   CONTESTC: Contestation (1990-2000 estimates). These are estimates from each
#'   annual cross-section, pooled.
#'
#'   INCLUSC: Inclusiveness (1990-2000 estimates). These are estimates from each
#'   annual cross-section, pooled.
#'
#'   CRSUFF: Coppedge-Reinicke (1990) suffrage. 1	Full suffrage 2	Suffrage with
#'   minor restrictions 3	Suffrage with major restrictions 4	No suffrage
#'
#'   FAIRELT: Coppedge-Reinicke (1990) Fair elections. 1 	Elections without
#'   significant or routine fraud or coercion. 2	Elections with significant
#'   fraud or coercion whether or not it changes the outcome of the election.
#'   3	No meaningful elections: i.e., elections without choice of candidates or
#'   parties, or no elections at all.
#'
#'   FREEORG: Coppedge-Reinicke (1990) Freedom of Organization. 1	Some trade
#'   union or interest groups may be harassed or banned but there are no
#'   restrictions on purely political organization. Permits may be required but
#'   are not used to limit opposition activities. 2	Some political parties are
#'   banned and trade unions or interest groups are harassed or banned, but
#'   membership in some alternatives to official organizations is permitted.
#'   Permits may be required and are used to limit opposition activities.3	The
#'   only relatively independent organizations that are allowed to exist are
#'   nonpolitical. 4	No independent organizations are allowed. All organizations
#'   are banned or controlled by the government or the party.
#'
#'   FREXP: Coppedge-Reinicke (1990) Freedom of Expression 1	Citizens express
#'   their views on all topics without fear of punishment. 2	Dissent is
#'   discouraged, whether by informal pressure or by systematic censorship, but
#'   control is incomplete. The extent of control may range from selective
#'   punishment of dissidents on a limited number of issues to a situation in
#'   which only determined critics manage to make themselves heard, yet they
#'   sometimes can sway public opinion. There is some freedom of private
#'   discussion. 3	All open dissent is forbidden and effectively suppressed,
#'   though a few citizens may express dissent publicly in covert ways. Citizens
#'   are wary of criticizing the government even privately.
#'
#'   ALTINF: Coppedge-Reinicke (1990) Alternative Sources of Information
#'   1	Alternative sources of information exist and are protected by law. If
#'   there is significant government ownership of the media, they are
#'   effectively controlled by truly independent or multi-party bodies.
#'   2	Alternative sources of information are widely available but government
#'   versions are presented in preferential fashion. This may be the result of
#'   partiality in and greater availability of government-controlled media;
#'   selective closure, punishment, harassment, or censorship of dissident
#'   reporters, publishers, or broadcasters; or mild self-censorship resulting
#'   from any of these. 3	The government or ruling party dominates the diffusion
#'   of information to such a degree that alternative sources exist only for
#'   nonpolitical issues, for short periods of time, or for small segments of
#'   the population. The media are either mostly controlled directly by the
#'   government or party or restricted by routine prior censorship, near-certain
#'   punishment of dissident reporters, publishers, and broadcasters, or
#'   pervasive self-censorship. Foreign media or the Internet may be available
#'   to a small segment of the population without restrictions. 4	There is no
#'   public alternative to official information. All sources of information are
#'   official organs or completely subservient private sources. The media are
#'   considered instruments of indoctrination. Foreign publications and the
#'   Internet are usually unavailable or censored, and foreign broadcasts may be
#'   jammed.
#'
#'   POLY: Coppedge-Reinicke (1990) Polyarchy Scale. The sum of FAIRELT, FREORG,
#'   FREXP, and ALTINF minus 4.
#'
#'   ccode: Country Code Numeric
#'
#'   ccodecow: Country Code (from Correlates of War)
#'
#'   ccodealp: 3-letter Country Code (from Alvarez, Limongi, and Przeworski)
#'
#'   ccodewb: Country Code (from World Bank)
#'
#'   f1mean: mean contestation score for this year in pooled analysis
#'
#'   f2mean: mean inclusiveness score for this year in pooled analysis
#'
#'   f1sd: mean std dev of contestation for this year in pooled analysis
#'
#'   f2sd: mean std dev of inclusiveness for this year in pooled analysis
#'
#' @template standard-variables
#'
#' @family democracy
#' @family polyarchy
#' @family latent variable indexes of democracy
#' @family continuous indexes of democracy
#' @source `r roxygen_cite("polyarchy_dimensions")`
"polyarchy_dimensions"


# REIGN -------------------------------------------------------------------

#' The Rulers, Elections, and Irregular Governance Dataset (Regime data)
#'
#' `r roxygen_cite("REIGN")` The dataset, variable descriptions,
#' and technical notes, are available at the link. The variable descriptions below
#' are taken from
#' \url{http://oefresearch.org/sites/default/files/REIGN_descriptions.pdf}.
#' Collection stopped in 2021; this dataset is now archived in this package.
#'
#' @section Overview:
#'
#'   The REIGN regime characteristics dataset is based on the regime
#'   classifications of Geddes, Wright, and Frantz ([gwf_autocratic]), but it is
#'   updated monthly, and it has some differences with [gwf_autocratic]. These
#'   are described as follows in the online technical notes:
#'
#'   REIGN data is updated to the present month (up to August 2021). We also
#'   added the following countries to the  dataset: The Bahamas, Jamaica,
#'   Trinidad and Tobago, Barbados, Dominica, Grenada, St. Lucia, St. Vincent
#'   and the Grenadines, Antigua and Barbuda, St. Kitts and Nevis, Belize,
#'   Guyana, Surinam, Andorra, San Marino, Malta, Cyprus, Cape Verde, Sao Tome
#'   and Principe, Equatorial Guinea, Djibouti, Comoros, Mauritius, Seychelles,
#'   South Sudan, Bhutan, Maldives, South Vietnam, Brunei, East Timor, Papua New
#'   Guinea, Vanuatu, Solomon Islands, Kiribati, Tuvalu, Fiji, Tonga, Nauru,
#'   Marshall Islands, Palau, Micronesia, and Samoa.
#'
#'   We also added political systems that lasted for less than a year and
#'   specified start and end months. This allows for a more granular look at
#'   transitional periods and interim governments. These new short-lived regimes
#'   appear in countries including Haiti, the Dominican Republic, Guatemala,
#'   Peru, Benin, Niger, Ghana, and Nigeria.
#'
#'   Finally, GWF generally does not allow for yearly changes in institutions
#'   over the course of a regime. If a government begins as personalist, it
#'   stays personalist until that leader leaves power. In several cases we code
#'   a change in regime type following reforms during the tenure of a single
#'   leader, including Lanzana in Burkina Faso, Rawlings in Ghana, etc.
#'
#'   Further discussion of the differences between REIGN and GWF
#'   ([gwf_autocratic]) is available here:
#'   \url{http://oefresearch.org/sites/default/files/REIGN%20Data%202016.10.05.pdf}
#'
#' @section Variables:
#'
#'  \describe{
#'   \item{reign_cowcode}{The COW code of the country in REIGN.}
#'
#'   \item{reign_country}{The country name in REIGN.}
#'
#'   \item{gwf_casename}{The case name in the [gwf] dataset.}
#'
#'   \item{gwf_startdate}{The startdate of the case in the [gwf] dataset.}
#'
#'   \item{gwf_enddate}{The enddate of the case in the [gwf] dataset.}
#'
#'   \item{Start}{The start date of the regime.}
#'
#'   \item{End}{The end date of the regime, or 31 December of the current year.}
#'
#'   \item{gwf_regimetype}{The regime type. This is what the codebook says about the
#'   regime types:
#'
#'   DEMOCRACIES
#'
#'   We use a procedural definition of democracy, meaning we are interested in
#'   the institutional rules that dictate how leaders gain power and not in
#'   other correlates of democracy, including strong traditions of freedom of
#'   speech and assembly. Non-competitive single-party systems are classified as
#'   such, even if some are somewhat more liberal than others (see Botswana and
#'   Namibia). Democracies have reasonably free-and-fair competitions for
#'   political power.
#'
#'   1. Presidential Democracy: Democracy in which the executive is distinct
#'   from the legislative branch and considerable decision-making authority is
#'   granted to the executive. Presidential systems have presidents who serve as
#'   chief executives rather than figureheads.
#'
#'   2. Parliamentary Democracy: Democracy in which legislatures are more
#'   powerful and executives are less autonomous. Generally speaking, countries
#'   with powerful prime ministers and general elections are parliamentary
#'   democracies. Hybrid semi-presidential systems are classified case-by-case,
#'   but are usually grouped with parliamentary democracies.
#'
#'   NON-DEMOCRACIES
#'
#'   The Autocratic Regimes dataset by Professors Barbara Geddes, Joseph Wright,
#'   and Erica Frantz classifies all non-democratic governments into one of ten
#'   categories. Though our data differs from this dataset in important ways, it
#'   uses the same typology. We document major differences in the extended
#'   technical notes.
#'
#'   1.  Personalist Systems: Power is highly concentrated in the hands of a
#'   non-monarch dictator who is relatively unconstrained by a military or
#'   political party. Contemporary examples include Russia, Sudan, and Chad.
#'
#'   2.  Monarchies: Power is highly concentrated in the hands of a monarch who
#'   is much more than just a figurehead. Contemporary examples include
#'   Swaziland, Kuwait, and Morocco.
#'
#'   3. Single-Party Systems: Power is held by the head of a party. Executive
#'   power is effectively checked by the party or ruling committee. Contemporary
#'   examples include China, Angola, and Ethiopia.
#'
#'   4. Oligarchies: Power is held by the head of party, but unlike other
#'   single-party systems this party explicitly represents the interests of one
#'   elite segment of society. Past examples include apartheid-era South Africa
#'   and Rhodesia under Ian Smith.
#'
#'   5. Party-Personalist Hybrids: An intermediate hybrid where a party
#'   apparatus supports a dictator, yet the party's identity is concentrated
#'   around the person in power and it has few meaningful checks on executive
#'   power. Examples include Eritrea, and North Korea.
#'
#'   6. Military Juntas: A military committee runs the country. One officer
#'   typically serves as head, but this head serves the interests of the
#'   committee and his power is checked by other members of the military. Recent
#'   examples include Thailand and Algeria.
#'
#'   7. Indirect Military Juntas: The military has de facto power, but rules
#'   behind a civilian puppet. See pre-Mobutu Zaire and Suriname under Bouterse
#'   (1980-1988).
#'
#'   8. Personalist-Military Hybrids: A hybrid of military and personalist
#'   institutions in which a dictator holds most power and is relatively
#'   unchecked, yet the dictator's authority is rooted in military support.
#'   These systems often evolve from juntas when power is consolidated around a
#'   single individual. Examples include Chile under Pinochet, Pakistan under
#'   Zia and Musharraf, and Fiji under Bainimarama.
#'
#'   9. Party-Military Hybrids: Militarized single-party states in which most or
#'   all members of the ruling party are military elites. Examples include
#'   Algeria from 1962-1992, El Salvador before 1982, and Congo-Brazzaville
#'   between the 1968 coup and 1991.
#'
#'   10. Party-Personalist-Military Hybrids: A dictator rules with the support
#'   of a militarized single-party state, but is relatively unchecked by these
#'   institutions. Examples include Egypt after 1952, Indonesia under Suharto,
#'   and Syria under the Assads.
#'
#'   INTERIM PERIODS
#'
#'   Finally, we include four forms of government that are explicitly
#'   provisional or transitional:
#'
#'   1. Warlordism: occurs only in countries that are torn apart by conflict to
#'   the extent that they do not have a functional government. As of 2016, only
#'   Libya and Yemen meet this definition. War-torn countries like Syria are not
#'   included because a strong government continues to hold power in the capital
#'   and a significant part of the country.
#'
#'   2. Foreign-Occupied governments occur where foreign politicians or
#'   militaries hold de facto power over a government.
#'
#'   3. Civilian Provisional and Military Provisional governments are explicitly
#'   temporary arrangementsthat usually proceed completed transitions to
#'   democracy or follow coups and constitutional crises. Interim regimes are
#'   only called "military provisional" if the military is holding power until
#'   an election or some other formalized legitimizing event can occur.}
#'
#'   }
#'
#' @template standard-variables
#' @aliases reign
#'
#' @source `r roxygen_cite("REIGN")`
#' @family democracy
#' @family authoritarianism
"REIGN"

# UDS ---------------------------------------------------------------------

#' The Unified Democracy Scores
#'
#' The 2014, 2011, and 2010 releases of the Unified Democracy Scores by
#' Pemstein, Meserve, and Melton (2010).
#'
#' \describe{
#'
#' \item{uds_country}{The name of the country in the UDS release}
#'
#' \item{year}{Calendar year.}
#'
#' \item{uds_ccode}{The correlates of war numeric code, as in the original UDS
#' release. This is different for Yugoslavia/Serbia from the actual COW code
#' after 2006. Use the \code{cown} variable instead for merging with COW-indexed
#' data.}
#'
#' \item{mean}{The posterior mean of the latent variable in the UD release.}
#'
#' \item{sd}{The posterior standard deviation of the latent variable in the UD
#' release.}
#'
#' \item{median}{The posterior median of the latent variable in the UD release.}
#'
#' \item{pct025}{Unified democracy score posterior 2.5 percentile.}
#'
#' \item{pct975}{Unified democracy score posterior 97.5 percentile.}
#'
#' }
#'
#' @template standard-variables
#' @source `r roxygen_cite("pmm2010")`
#'
#' @source `r roxygen_cite("pmm2013")`
#' @family democracy
#' @family latent variable indexes of democracy
#' @aliases uds
#' @seealso The [generate_extended_uds] function to extend these scores, as well as vignette("Replicating_and_extending_the_UD_scores").
"uds_2014"

#' @rdname uds_2014
"uds_2011"

#' @rdname uds_2014
"uds_2010"


# Ulfelder ----------------------------------------------------------------

#' The Democracy/Autocracy Dataset by Jay Ulfelder
#'
#' This is the dataset documented in `r roxygen_cite("ulfelder2012")` It comes in two
#' versions: \link{ulfelder}, which only goes back to 1955, and
#' \link{ulfelder_extended}, which extends the regime classifications back in
#' time using the \code{rgjdura} and \code{rgjdurd} variables, adding 3861
#' country-years to the original data, mostly authoritarian regimes.
#'
#' @section Variables with values for all years:
#'
#'   pitfcode: PITF Country Code. Three-character country code matching those
#'   used by the Political Instability Task Force. Some of these seem off - GER
#'   for Germany instead of GMY, UK instead of UKG. I've created
#'   \code{ulfelder_scode} on the basis of this by converting
#'   "GER","MNE","SRB","UK", and "USS" to"GMY","MNT","SER","UKG", and "USR"
#'   respectively.
#'
#'   ulfelder_scode: Modified version of \code{pitfcode}, matching the Polity IV
#'   character codes that appear to be the basis of the PITF codes.
#'
#'   cowcode: Correlates of War (COW) Country Code. Numeric country code
#'   matching those used by the Correlates of War project. Missing some. Use
#'   \code{cown} instead.
#'
#'   year: The year.
#'
#'   rgjtype: Regime Type. Categorical variable indicating the nature of a
#'   country's political regime, understood as the institutions regulating
#'   access to control over national policy in a sovereign state, at the end of
#'   the calendar year.
#'
#'   D = Democracy
#'
#'   A = Non-democracy
#'
#'   NS = Not sovereign. A foreign government or international organization
#'   either sets national policy or wields formal veto power
#'
#'   -99 = Country termination (censoring event)
#'
#'   The codebook indicates that democracy is defined as follows (I quote from
#'   p. 4):
#'
#'   For purposes of this data set, democracy is understood to be a form of
#'   government in which a free citizenry fairly chooses and routinely holds
#'   accountable its rulers. In practice, this occurs when four general
#'   conditions hold:
#'
#'   * Elected officials rule. Representatives chosen by citizens actually make
#'   policy, and unelected individuals, bodies, and organizations cannot veto
#'   those representatives' decisions.
#'
#'   * Elections are fair and competitive. The process by which citizens elect
#'   their rulers provides voters with meaningful choice and is free from
#'   deliberate fraud or abuse.
#'
#'   * Politics is inclusive. Adult citizens have equal rights to vote and
#'   participate in government and fair opportunity to exercise those rights.
#'
#'   * Civil liberties are protected. Freedoms of speech, association, and
#'   assembly give citizens the chance to deliberate on their interests, to
#'   organize in pursuit of those interests, and to monitor the performance of
#'   their elected representatives and the bureaucracies on which those
#'   officials depend.
#'
#'   To identify whether these conditions obtain in a particular country at a
#'   particular time, I reviewed a variety of secondary sources to try to
#'   determine whether or not all of the criteria listed below were satisfied.
#'   According to my definition, only a country that meets all of these criteria
#'   is considered a democracy. In other words, I see each one of them as a
#'   necessary condition for democratic government. The moment a country fails
#'   to satisfy one of the criteria, it is considered a non-democracy.
#'
#'   rgjdurd: Consecutive Years of Democracy. Count in years since beginning of
#'   an episode of democracy. Coded as missing for countries currently coded as
#'   autocracies, interruptions, or interregna, with the exception of the year
#'   in which a transition to any of those conditions from democracy occurs.
#'
#'   rgjdura: Time since Democracy. Count in years since last episode of
#'   democracy or birth of country, whichever is more recent. Coded as missing
#'   for democracies, with the exception of the year in which a transition from
#'   autocracy to democracy occurs.
#'
#' @section Variables with values only for years greater than 1955:
#'
#'   The following variables are all \code{NA} for years before 1955 (by construction;
#'    I do not impute their values for these years in the \link{ulfelder_extended}
#'   dataset).
#'
#'   rgjdem: Undocumented.
#'
#'   rgjtrans: Regime Change. Categorical variable indicating the occurrence (or
#'   not) of a regime change at some point during the indicated calendar year.
#'
#'   = 1 Transition from non-democracy to democracy
#'
#'   = 0 No change
#'
#'   = -1 Transition from democracy to non-democracy
#'
#'   = -9 Country termination or onset of non-sovereignty
#'
#'   rgjtaut: Transition from Democracy to Autocracy. Dummy variable indicating
#'   occurrence of a transition from democracy to autocracy during the calendar
#'   year.
#'
#'   = 1 if a transition from democracy to autocracy occurred at any time during
#'   the calendar year
#'
#'   = 0 if the country ended the calendar year as a democracy
#'
#'   = -6 if an episode of democracy was ended during the calendar year by the
#'   onset of a period of non-sovereignty
#'
#'   = -9 if an episode of democracy ended during the calendar year when the
#'   country ceased to exist
#'
#'   = NA if the country was not a democracy at any time during the calendar
#'   year
#'
#'   rgjatype: Mode of Transition from Democracy to Autocracy. A categorical
#'   variable indicating the nature of the event or process that led in an
#'   immediate way to the end of an episode of democracy during that calendar
#'   year.
#'
#'   = 1 Military coup: leaders of the state's armed forces claim power
#'
#'   = 2 Self-coup: incumbent officials claim dictatorial powers, cancel or rig
#'   elections, or substantially diminish civil liberties
#'
#'   = 3 Rebellion: opposition forces seize power by means other than largely
#'   free, fair, and competitive elections
#'
#'   = 4 Other: some other domestic actor--nearly always a monarch--usurps power
#'   from an elected government
#'
#'   = -6 Foreign intervention: a foreign government or international
#'   organization becomes the ruling authority or a formal veto player
#'
#'   = -9 State termination
#'
#'   = 0 No change (democracy persists)
#'
#'   = NA if the country was not a democracy at any time during the calendar
#'   year
#'
#'   rgjaltl: Alternation in Leadership (Democracy Only). Dummy variable
#'   indicating whether or not there has been a change in the individual
#'   occupying the office of head of government since the start of the current
#'   episode of democracy, as of the end of the indicated calendar year. Coded
#'   as missing for country-years that ended with any non-democracy.
#'
#'   = 1 No change in chief executive so far
#'
#'   = 0 At least one change in chief executive
#'
#'   rgjaltlt: Alternation in Leadership "Clock" (Democracy Only). Numeric
#'   variable counting time until the first change in the head of government.
#'
#'   rgjaltp: Alternation in Party in Power (Democracy Only). Dummy variable
#'   indicating whether or not there has been a change in the party holding the
#'   office of chief executive since the start of the current episode of
#'   democracy, as of the end of the indicated calendar year. In presidential
#'   and mixed systems, the president is the reference point. In parliamentary,
#'   the premier is tracked. For democracies that start out with coalition
#'   governments, any change in the composition of the coalition is treated as a
#'   change in the party in power. Coded as missing for country-years that ended
#'   with any non-democracy.
#'
#'   = 1 No change in party in power so far
#'
#'   = 0 At least one change in the party in power
#'
#'   rgjaltpt: Alternation in Party in Power "Clock" (Democracy Only). Numeric
#'   variable counting time until the first change in party holding the office
#'   of chief executive.
#'
#'   rgjtdem: Transition from Autocracy to Democracy. Dummy variable indicating
#'   occurrence of a transition from autocracy to democracy during the calendar
#'   year
#'
#'   = 1 if a transition from autocracy to democracy occurred at any time during
#'   the calendar year
#'
#'   = 0 if the country ended the calendar year as an autocracy
#'
#'   = -6 if an episode of autocracy was ended during the calendar year by the
#'   onset of a period of non-sovereignty
#'
#'   = -9 if an episode of democracy ended during the calendar year when the
#'   country ceased to exist
#'
#'   = NA if the country was not an autocracy at any time during the calendar
#'   year.
#'
#'   rgjepdt: Total Episodes of Democracy. Cumulative count of all episodes of
#'   democracy for a given country, including current episode. An episode begins
#'   with any onset of democracy (REGDURD = 1); an episode ends with a
#'   transition from democracy to autocracy (REGTAUT = 1), an interruption
#'   (REGTAUT = -6), an interregnum (REGTAUT = -7), or the end of a country
#'   (REGTAUT = -9).
#'
#'   rgjhd: History of Democracy. Dummy variable indicating any occurrence of
#'   any episodes of democracy in the country.
#'
#'   = 1 at least one episode of democracy (including current year)
#'
#'   = 0 otherwise
#'
#'   rgjhd2: History of Democracy (Restrictive). Dummy variable indicating that
#'   at least one episode of democracy in this country has spanned five or more
#'   consecutive calendar years.
#'
#'   = 1 yes (i.e., country has sustained democracy for at least five
#'   consecutive years at some point in its history)
#'
#'   = 0 no (i.e., country has never sustained democracy for at least five
#'   consecutive years)
#'
#'   rgjhd3: History of Democracy (Broad). Dummy variable indicating at least
#'   one episode of democracy in history of current country or parent country.
#'
#'   = 1 if at least one country-year is coded as democracy for the current
#'   country or, if current country is the result of a state break-up or
#'   partition or was itself sovereign at some previous time, for the "parent"
#'   country
#'
#'   = 0 otherwise (i.e., no prior country-years of democracy in current or
#'   parent country)
#'
#'   In most instances, this variable will match RGJHD Exceptions will arise for
#'   countries that have split, combined, or changed status in the international
#'   system in the modern era. For example, East Germany receives a coding of
#'   '1' on this variable due to the history of democracy in Germany prior to
#'   World War II; Bangladesh is coded '1' on this variable from its inception
#'   due to the democratic experience of Pakistan; and Latvia, Lithuania, and
#'   Estonia are coded '1' on this variable due to the episodes of democracy
#'   that occurred there after they first gained independence after World War I.
#'
#'   rgjyrdt: Total Years of Democracy. Cumulative count of calendar years in
#'   which a country was a democracy for at least a portion of the year.
#'
#'   rgjepdl: Longest Previous Episode of Democracy. Three-digit numeric
#'   variable indicating length in years of single longest episode of democracy
#'   since birth of country. Equal to 0 for countries with no democratic
#'   experience or in their first episode of democracy.
#'
#'   rgjepd1: Year of Onset of First Episode of Democracy. Four-digit numeric
#'   variable indicating calendar year in which first episode of democracy began
#'   (e.g., 1962), including ongoing episode, if it is the first.
#'
#'   rgjepd1a: Age at Onset of First Episode of Democracy. Three-digit numeric
#'   variable indicating age of country at time of onset of first democratic
#'   episode, including ongoing episode if it is the first. Equal to \code{rgjepd1}
#'   minus birth-year of country, so equal to 0 for countries that were "born"
#'   with a democratic regime.
#'
#'   rgjtadt: Prior Transitions from Autocracy to Democracy. Cumulative count of
#'   all prior transitions from autocracy to democracy in the country in
#'   question, including transitions that occurred in the current year.
#'
#'   rgjtdat:Prior Transitions from Democracy to Autocracy. Cumulative count of
#'   all transitions from democracy to autocracy in the country in question,
#'   including any transitions that occurred in the current year.
#'
#'   rgjtdamc: Undocumented.
#'
#'   rgjtdaac: Undocumented.
#'
#'   rgjeu: Membership in the European Union. Categorical variable indicating
#'   membership status in the European Economic Community (EEC), European
#'   Community (EC), and European Union (EU), as of 31 December of the listed
#'   year. The EEC was formally established in 1957 as the successor to the
#'   European Coal and Steel Community, which was formed in 1951. The EU was
#'   established in 1992 by the Maastricht Treaty.
#'
#'   = 2 Member
#'
#'   = 1 Formal applicant but not a member
#'
#'   = 0 Neither a member nor a formal applicant
#'
#'   rgjnato: Membership in North Atlantic Treaty Organization (NATO).
#'   Categorical variable indicating membership status in NATO, as of 31
#'   December of the listed year. NATO was established in 1949.
#'
#'   = 2 Member
#'
#'   = 1 Formally invited to join but not a member
#'
#'   = 0 Neither a member nor formally invited to join
#'
#'   rgjnatop: Participant in NATO Partnership for Peace. Binary variable
#'   indicating participation in NATO's Partnership for Peace program, as of 31
#'   December of the listed year.
#'
#'   = 1 Participant
#'
#'   = 0 Non-participant
#'
#'   rgjosce: Participant in Conference/Organization for Security and
#'   Cooperation in Europe (CSCE/OSCE). Categorical variable indicating
#'   participation/membership in CSCE/OSCE, as of 31 December of the listed
#'   year. The CSCE was formed in 1973; it became the OSCE in 1995.
#'
#'   = 2 Full member/participant
#'
#'   = 1 Partner for Cooperation
#'
#'   = 0 Non-participant
#'
#'   rgjoecd: Membership in Organization for Economic Cooperation and
#'   Development (OECD). Binary variable indicating membership in the OECD, as
#'   of 31 December of the listed year. The OECD was founded in 1948 as the
#'   Organization for European Economic Cooperation; it was reorganized as the
#'   OECD in 1961.
#'
#'   = 1 Member
#'
#'   = 0 Non-member
#'
#'   rgjcoe: Membership in Council of Europe (COE). Binary variable indicating
#'   membership in the COE, as of 31 December of the listed year. The Council
#'   was founded in 1949.
#'
#'   = 1 Member
#'
#'   = 0 Non-member
#'
#'   rgjcomnw: Membership in the Commonwealth of Nations. Binary variable
#'   indicating membership in the COE, as of 31 December of the listed year.
#'   Suspended members are still identified as members; expelled members are
#'   identified as nonmembers. The Commonwealth was founded in 1931.
#'
#'   = 1 Member
#'
#'   = 0 Non-member
#'
#'   rgjfranc: Member of the International Organization of the French-Speaking
#'   World (OIF), or Francophonie. Categorical variable indicating membership
#'   status in Francophonie, as of 31 December of the listed year. OIS was
#'   formed in 1970.
#'
#'   = 2 Member
#'
#'   = 1 Observer
#'
#'   = 0 Non-member
#'
#'   rgjgenev: Signatory to the Geneva Conventions. Binary variable identifying
#'   countries that are signatories to the Geneva Conventions, as of 31 December
#'   of the listed year.
#'
#'   = 1 Signatory
#'
#'   = 0 Non-signatory
#'
#'   rgjgattw: Signatory to the General Agreement on Tariffs and Trade (GATT) or
#'   Member of the World Trade Organization (WTO). Binary variable identifying
#'   countries that were signatories to GATT or are members of the WTO, as of 31
#'   December of the listed year. Countries that were signatories to GATT but
#'   did not become members of the WTO in 1995, the year of its establishment,
#'   are continuously identified as members by virtue of their continued
#'   participation in GATT.
#'
#'   = 1 Signatory/member
#'
#'   = 0 Non-signatory/non-member
#'
#'   rgjapec: Member of the Asia-Pacific Economic Cooperation (APEC). Binary
#'   variable indicating membership in APEC, as of 31 December of the listed
#'   year. APEC was founded in 1989.
#'
#'   = 1 Member
#'
#'   = 0 Non-member
#'
#'   rgjasean: Member of the Association of Southeast Asian Nations (ASEAN).
#'   Binary variable indicating membership in ASEAN, as of 31 December of the
#'   listed year. ASEAN was founded in 1967.
#'
#'   = 1 Member
#'
#'   = 0 Non-member
#'
#'   rgjseato: Member of the Southeast Asian Treaty Organization (SEATO). Binary
#'   variable indicating membership in SEATO, as of 31 December of the listed
#'   year. SEATO was formed in 1954 and was dissolved in 1977.
#'
#'   = 1 Member
#'
#'   = 0 Non-member
#'
#'   rgjoas: Member of the Organization of American States (OAS). Binary
#'   variable indicating membership in the OAS, as of 31 December of the listed
#'   year. The OAS came into being in 1948, but it originated in 1890 as the
#'   International Union of American Republics.
#'
#'   = 1 Member
#'
#'   = 0 Non-member
#'
#'   rgjmerc: Member of the Southern Common Market (Mercado Comun del Sur, or
#'   Mercosur). Categorical variable indicating status of membership in
#'   Mercosur, as of 31 December of the listed year. Mercosur was founded in
#'   1991 under the Treaty of Asuncion. Observer countries are coded as
#'   non-members.
#'
#'   = 2 Member
#'
#'   = 1 Associate member
#'
#'   = 0 Non-member
#'
#'   rgjopec: Member of the Organization of Petroleum Exporting Countries
#'   (OPEC). Binary variable indicating membership in OPEC, as of 31 December of
#'   the listed year. OPEC was formed in 1960.
#'
#'   = 1 Member
#'
#'   = 0 Non-member
#'
#'   rgjarabl: Member of the Arab League. Binary variable indicating membership
#'   in the Arab League, as of 31 December of the listed year. The Arab League
#'   was established in 1945.
#'
#'   = 1 Member
#'
#'   = 0 Non-member
#'
#'   rgjoau: Member of the Organization for African Unity (OAU) or African
#'   Union. Binary variable indicating membership in the OAU or AU, as of 31
#'   December of the listed year. The OAU was established in 1963; it became the
#'   AU in 2001.
#'
#'   = 1 Member
#'
#'   = 0 Non-member
#'
#'   rgjecow: Member of the Economic Community of West African States (ECOWAS).
#'   Binary variable indicating membership in ECOWAS, as of 31 December of the
#'   listed year. ECOWAS was established in 1975.
#'
#'   = 1 Member
#'
#'   = 0 Non-member
#'
#'   rgjiccpr: Signatory to the International Covenant on Civil and Political
#'   Rights. Categorical variable indicating status as signatory to this treaty,
#'   as of 31 December of the listed year. The covenant was opened for signature
#'   in 1996 and came into force in 1976.
#'
#'   = 2 Ratified, acceded, or succeeded
#'
#'   = 1 Signed only
#'
#'   = 0 No status
#'
#'   rgjiccp1: Signatory to the First Optional Protocol to the ICCPR. Binary
#'   variable indicating status as a signatory to the First Optional Protocol,
#'   which establishes the right of individuals to petition the Human Rights
#'   Committee, as of 31 December of the listed year. The Protocol came into
#'   force in 1976.
#'
#'   = 1 Signatory
#'
#'   = 0 Not a signatory
#'
#'   rgjachr: Signatory to the American Convention on Human Rights (a.k.a. the
#'   Pact of San Jose, Costa Rica). Categorical variable indicating status as
#'   signatory to this treaty, as of 31 December of the listed year. The treaty
#'   was adopted in 1969 and entered into force in 1978.
#'
#'   = 2 Ratified, acceded, or succeeded
#'
#'   = 1 Signed only
#'
#'   = 0 No status
#'
#'   rgjachpr: Signatory to the African Charter on Human and People's Rights.
#'   Categorical variable indicating status as signatory to this treaty, as of
#'   31 December of the listed year. The treaty was adopted in 1981 and entered
#'   into force in 1986.
#'
#'   = 2 Ratified, acceded, or succeeded
#'
#'   = 1 Signed only
#'
#'   = 0 No status
#'
#'   rgjicj: Declared Recognition as Compulsory the Jurisdiction of the
#'   International Court of Justice (ICJ). Binary variable indicating whether
#'   the country has declared its recognition of the jurisdiction of the ICJ as
#'   compulsory, as of 31 December of the listed year.
#'
#'   = 1 Declared
#'
#'   = 0 No declaration
#'
#'   rgjoic: Member of the Organization of the Islamic Conference (OIC). Binary
#'   variable identifying countries that are members of the OIC, which describes
#'   itself as "the collective voice of the Muslim world and ensuring to
#'   safeguard and protect the interests of the Muslim world in the spirit of
#'   promoting international peace and harmony among various people of the
#'   world." The OIC was founded in 1969.
#'
#'   = 1 Member state
#'
#'   = 0 Non-member (including observer states)
#'
#'   rgjfdem: Freedom House electoral democracy. Binary variable identifying
#'   countries listed by Freedom House as electoral democracies.
#'
#'   = 1 Electoral democracy
#'
#'   = 0 Not an electoral democracy
#'
#'   sftgreg1: Undocumented. Region?
#'
#'   sftgreg2: Undocumented. Region?
#'
#'   sfrgregc: Undocumented. Region?
#'
#'   sftgreg: Undocumented. Region?
#'
#' @template standard-variables
#' @source `r roxygen_cite("ulfelder2012")`
#'
#' @source `r roxygen_cite("ulfelder2007")`
#'
#' @family democracy
#' @family events data
#' @family dichotomous democracy indexes
#' @family polity family
"ulfelder"

#' @rdname ulfelder
"ulfelder_extended"

# Vanhanen ----------------------------------------------------------------

#' Vanhanen measures of democracy, 1800-2018
#'
#' A dataset containing Tatu Vanhanen's measures of democracy, `r roxygen_cite("vanhanen")`
#' Data available at \url{https://services.fsd.tuni.fi/catalogue/FSD1289?tab=summary&lang=en&study_language=en}.
#'
#' @section Variables:
#'
#'   \describe{
#'
#'   \item{vanhanen_country}{The country name in the original dataset.}
#'
#'   \item{year}{Year.}
#'
#'   \item{vanhanen_competition}{From Vanhanen's introduction to the dataset:
#'   The smaller parties' share of the votes cast in parliamentary or
#'   presidential elections, or both, is used to indicate the degree of
#'   competition. It is calculated by subtracting the percentage of votes won by
#'   the largest party from 100. If the largest party gets, for example, 40
#'   percent of the votes, the share of the smaller parties is 60 percent. If
#'   data on the distribution of votes are not available, the value of this
#'   variable is calculated on the basis of the distribution of seats in
#'   parliament. The distribution of seats is used also in cases in which it
#'   seems to indicate power relations more realistically than the distribution
#'   of votes.}
#'
#'   \item{vanhanen_participation}{From Vanhanen's introduction to the dataset:
#'   The percentage of the population which actually voted in the same elections
#'   is used to measure the degree of participation (= Participation). This
#'   percentage is calculated from the total population, not from the adult or
#'   enfranchized population. I use the total population as the basis of
#'   calculation because more statistical data are available on total
#'   populations than on age structures of electorates. In principle, these two
#'   empirical variables are very simple and easy to use. In practice, however,
#'   there are several points where more detailed rules of interpretation are
#'   needed.
#'
#'   Definition of a party
#'
#'   First, it is necessary to define what is meant by 'a party' and 'the
#'   largest party' in these calculations. My basic assumption is that the
#'   relative strength of the largest political party provides the most
#'   realistic indicator of the distribution of political power in modern
#'   states. Competing groups have formed more or less permanent political
#'   parties since the nineteenth century, but it is not always obvious which
#'   groups should be regarded as 'parties.' Historically, factions, political
#'   cliques and groups of notables preceded parties. Parties as we understand
#'   them have emerged since the first half of the nineteenth century (see
#'   Duverger 1954; LaPalombara and Weiner 1966; Sartori 1976; von Beyme 1984;
#'   Blondel 1995). Many definitions of political parties emphasize that a party
#'   is an organized group and that its principal aim is to win political power
#'   (Michels 1962; LaPalombara and Weiner 1966). According to Giovanni Sartori
#'   (1976: 63-64): 'A party is any political group identified by an official
#'   label that presents at elections, and is capable of placing through
#'   elections (free or non-free), candidates for public office.' I think that
#'   this definition provides sufficient criteria to distinguish 'parties' and
#'   'the largest party' from other political groups. It is plausible to regard
#'   as 'parties' all political groups which take part in elections and are
#'   identified by an official label. Usually, but not always, it is easy to
#'   distinguish between parties taking part in elections. Party alliances are
#'   problematic. It is not always clear whether the alliance or its individual
#'   member parties should be regarded as 'parties.' In such cases, a party's
#'   behaviour in elections is used as the decisive criterion. If a party
#'   belongs to a larger alliance permanently, we are not justified in regarding
#'   it as a separate party. The alliance should then be treated as a separate
#'   'party,' because the purpose is to measure the relative strength of
#'   competing and independent groups.
#'
#'   In parliamentary elections 'the largest party' refers to the party which
#'   received the largest single share of the votes or of the seats in
#'   parliament. Sometimes, depending on the type of electoral system, the
#'   proportion of seats may be considerably higher than the proportion of
#'   votes, whereas the reverse situation is hardly possible.
#'
#'   In presidential elections, the term 'largest party' refers to the votes
#'   received by the presidential candidate who won the election. A problem is,
#'   however, whether we should take into account the first or the second round
#'   votes, if there are two rounds of voting. The percentage of votes obtained
#'   by the winning candidate may be significantly higher in the second round
#'   than in the first. The round of voting, if it is not the first round, is
#'   indicated in country tables. The purpose has been to take into account the
#'   round that reflects the strength of parties and political groups most
#'   reliably.
#'
#'   Indirect elections and elections without parties
#'
#'   Interpretation is needed in indirect elections, too. How should we
#'   calculate the degree of participation in such elections? My basic rule has
#'   been that only votes cast in final election are counted. When president is
#'   elected by indirect elections, usually by parliament, only the number of
#'   actual electors is taken into account, which means that the degree of
#'   participation drops to zero. The same interpretation is applied to indirect
#'   parliamentary elections (in China, for example). However, if the real
#'   election takes place at the election of electors, as in the presidential
#'   elections of the United States, the number of votes and the distribution of
#'   votes in that election are taken into account.
#'
#'   Another problem of interpretation concerns countries where members of
#'   parliament are elected but political parties are not allowed to take part
#'   in elections, or to form party groups in parliament after elections. Such
#'   election results are usually interpreted to mean that one party has taken
#'   all the votes or the seats. This interpretation is based on the assumption
#'   that the ruling group does not allow political competition for power in
#'   elections. Parties are absent from elections because they are banned. In
#'   such cases the "largest party's" share is assumed to be 100 percent.
#'
#'   The situation is different in countries in which only independent
#'   candidates participate in elections, although parties are not banned and
#'   although it would be legally possible to establish parties (Micronesia, for
#'   example). In such cases it is plausible to assume that elections are
#'   competitive and that elected members of parliament are not controlled by
#'   any particular political group or by the government. Independent members of
#'   parliament may form at least temporary political groups in the parliament
#'   freely. Therefore, it is assumed in such cases that the "largest party's"
#'   share is not higher than 30 percent.
#'
#'   Non-elected governmental institutions
#'
#'   A different question of interpretation arises in cases where the
#'   composition of a governmental institution using the highest executive or
#'   legislative power is not based on popular election. How should the degree
#'   of competition and the degree of participation be measured in such cases?
#'   According to my interpretation, the share of the smaller parties and the
#'   degree of electoral participation are zero in such cases. Power is
#'   concentrated in the hands of the ruling group. This interpretation applies
#'   to military and revolutionary regimes, to other non-elected autocratic
#'   governments, provisional governments, and to monarchies in which the ruler
#'   and the government responsible to the ruler dominate and exercise executive
#'   and usually also legislative power. There are many such historical as well
#'   as contemporary cases. In all these cases the "largest party's" share is
#'   assumed to be 100 percent and the degree of participation zero.
#'
#'   Dominant governmental institutions
#'
#'   The calculation of the values of competition and participation can be based
#'   on parliamentary or presidential/executive elections, or both. In each case
#'   it is necessary to decide which governmental institution and election
#'   should be taken into account. This depends on the assumed importance of the
#'   two governmental institutions. The relative importance of parliaments and
#'   presidents (or other heads of state) varies greatly, but usually these two
#'   governmental institutions are, at least formally, the most important
#'   institutions wielding political power. Depending on how power is divided
#'   between them, we can speak of parliamentary and presidential forms of
#'   government. In the former, the legislature is dominant. The executive
#'   branch is dependent on and responsible to the legislative branch. In the
#'   latter, the executive branch is dominant and is not responsible to the
#'   legislature. But it is also possible for their powers to be so well
#'   balanced that neither has clear dominance. Thus we can distinguish three
#'   institutional power arrangements at the national level: (a) parliamentary
#'   dominance, (b) executive dominance, and (c) concurrent powers. In the first
#'   case the values of competition and participation are calculated on the
#'   basis of parliamentary elections, in the second they are calculated on the
#'   basis of presidential or other executive elections (or the lack of
#'   elections), and in the third case both possible elections are taken into
#'   account.
#'
#'   If the support of competing parties is about the same in both elections (as
#'   in the United States, for example), it does not make much difference how
#'   the governmental system is classified in order to calculate the values of
#'   competition and participation, but if the electoral systems are
#'   significantly different in parliamentary and presidential elections, an
#'   incorrect classification of the country's governmental system might distort
#'   the results of the measurement. The same is true if the powers of the two
#'   institutions differ crucially. I have attempted to classify each country's
#'   governmental institutions as realistically as possible. All classifications
#'   of governmental systems are indicated in country tables.
#'
#'   Interpretation in the classification of governmental systems has been
#'   needed especially in the cases in which the results of presidential
#'   elections are based on the second round of voting. Because in such cases
#'   the share of the elected president tends to be 50.0 percent or higher, it
#'   is useful to check the relative strength of parties by taking parliamentary
#'   elections into account, too.
#'
#'   When both elections are taken into account (concurrent powers), it is
#'   necessary to weight the relative importance of parliamentary and
#'   presidential elections. Usually it is reasonable to give equal weight (50
#'   percent) to both elections, but in some cases it may be more realistic to
#'   give a weight of 75 or 25 percent to parliamentary elections and 25 or 75
#'   percent to presidential (executive) elections. In most cases it is
#'   relatively easy to decide which of the two branches of government is
#'   dominant and which elections should be taken into account, but some cases
#'   are open to different interpretations. The same applies to the weighting of
#'   the two branches in the cases of concurrent powers. The classifications of
#'   the governmental systems and changes of the governmental systems are
#'   indicated in each country table. In the cases of "concurrent powers," the
#'   estimated relative importance of the two branches of government is also
#'   indicated (50-50 percent, 25-75 percent, or 75-25 percent).}
#'
#'   \item{vanhanen_democratization}{From Vanhanen's introduction to the
#'   dataset: The two basic indicators of democratization can be used separately
#'   to measure the level of democracy, but, because they are assumed to
#'   indicate two different dimensions of democratization, it is reasonable to
#'   argue that a combination of them would be a more realistic indicator of
#'   democracy than either of them alone. They can be combined in many ways,
#'   depending on how we weight the importance of Competition and Participation.
#'   Some researchers (see, for example, Bollen 1979, 1980; Coppedge and
#'   Reinicke 1988) have excluded the degree of electoral participation from
#'   their measures of democracy because they think that it does not represent a
#'   significant differentiating aspect of democracy. My argument is that
#'   participation is probably as important dimension of democracy as
#'   competition. If only a small minority of the adult population takes part in
#'   elections, the electoral struggle for power is restricted to the upper
#'   stratum of the population, and the bulk of the population remains outside
#'   national politics. Power sharing is then certainly more superficial than in
#'   societies where the majority of the adult population takes part in
#'   elections (of course, presupposing that elections are competitive). Because
#'   I am not sure which of these two dimensions of democratization is more
#'   important and how much more important, I have weighted them equally in the
#'   Index of Democratization (ID). This is an arbitrary choice, but it is based
#'   on the assumption that both dimensions are equally important and necessary
#'   for democratization.
#'
#'   However, the decision to weight them equally does not solve the problem of
#'   how to combine them. One way would be to calculate their arithmetic mean.
#'   Another way is to multiply them. We could also use a mixture of adding and
#'   multiplying, for example, by first multiplying them and then adding 25
#'   percent (or some other percentage) of the values of both indicators to the
#'   index. The first combination would be based on the assumption that both
#'   dimensions indicate the degree of democracy independently and that a high
#'   level of competition can partly compensate for the lack of participation,
#'   or vice versa. The second combination is based on the assumption that both
#'   dimensions are necessary for democracy and that a high level of competition
#'   cannot compensate the lack of participation, or vice versa. I have come to
#'   the conclusion that the latter assumption is theoretically better than the
#'   former one because it is plausible to assume that both dimensions are
#'   important for democracy. So the two indicators - Competition and
#'   Participation - are combined into an Index of Democratization (ID) by
#'   multiplying them and dividing the outcome by 100.
#'
#'   The decision to weight indicators equally and to multiply them means that a
#'   low value for either of the two variables is enough to keep the index value
#'   low. A high level of participation cannot compensate for the lack of
#'   competition, or vice versa. The Index of Democratization gets high values
#'   only if the values of both basic variables are high. Multiplication of the
#'   two percentages corrects one fault in Participation variable mentioned
#'   above, namely, that this indicator thus not differentiate between important
#'   and formal elections. There have been and still are countries where the
#'   level of electoral participation is high but the level of democracy low,
#'   because elections are not free and competitive. Multiplication of the two
#'   percentages cancels the misleading information provided by Participation in
#'   such cases and produces a low ID value. The same correction takes place in
#'   opposite cases, when the level of competition is high but the degree of
#'   electoral participation low.
#'
#'   Referendums do not affect the value of Competition variable. They affect
#'   only the Participation variable and through it the Index of
#'   Democratization, but the effect of referendums (Participation) on the Index
#'   of Democratization depends crucially on the degree of Competition. If
#'   Competition is in zero, the Index of Democratization cannot rise from zero,
#'   although the value of Participation variable were high. In other words, the
#'   higher the value of Competition, the more the same number of referendums
#'   increases the value of ID.
#'
#'   This index of democracy is simpler than any of the alternative measures of
#'   democracy (cf. Munck and Verkuilen 2002; Munck 2009). It differs from other
#'   measures in two important ways: (1) it uses only two indicators, and (2)
#'   both of them are based, in principle, on quantitative data. Most other
#'   measures of democracy include more indicators, and most are based on more
#'   or less qualitative data. I think that it is scientifically more justified
#'   to use simple quantitative indicators than more complicated indicators
#'   loaded with weights and estimates based on subjective judgements if those
#'   simple quantitative indicators are as valid measures of the phenomeon as
#'   the more complicated and less quantitative indicators. However, some
#'   subjective judgments are needed also in the use of my measures of
#'   democracy, but it is possible for other researchers to see from the dataset
#'   what those subjective interpretations have been. One advantage of this
#'   Index of Democratization is that empirical data on the two basic variables
#'   are available from different sources, that statistical data on elections
#'   are in most cases exact and reliable, and that the role of subjective
#'   judgements in the use of electoral data is relatively limited. Further, I
#'   would like to emphasize that because the two basic variables do not take
#'   into account all important aspects of democracy, they are better adapted to
#'   indicate significant differences between political systems from the
#'   perspective of democracy than more detailed differences among democracies
#'   or nondemocracies (cf. Vanhanen 2000a, 2000b; 2003).} }
#' @template standard-variables
#' @source `r roxygen_cite("vanhanen")` Data available at
#'   \url{https://services.fsd.tuni.fi/catalogue/FSD1289?tab=summary&lang=en&study_language=en}
#' @family democracy
#' @family continuous democracy indexes
"vanhanen"

#' @rdname vanhanen
#' @section Note:
#'
#'   The \code{vanhanen_pmm} version of this data is taken from `r roxygen_cite("pmm2013")` The
#'   original dataset is found in [vanhanen]. The \code{vanhanen_pmm} data only goes
#'   back to 1945. There are some missing values in PMM's data compared to the
#'   original Vanhanen dataset. For more detail on the differences, see the
#'   vignette. The `vanhanen_pmm` data is included here for completeness.
"vanhanen_pmm"

# vdem_simple --------------------------------------------------------------

#' Simplified version of the V-Dem version 13 dataset
#'
#' This data frame contains a very reduced version of version 13 of the V-Dem
#' dataset, including only the 7 main indexes that measure democracy directly
#' (v2x_polyarchy, v2x_libdem, v2x_partipdem, v2x_delibdem, v2x_egaldem,
#' v2x_api, and v2x_mpi) and their associated uncertainty measures. The full
#' VDem dataset is available via the
#' [vdemdata](https://github.com/vdeminstitute/vdemdata) package. To cite VDem,
#' use `r roxygen_cite("vdem13codebook")`
#'
#' Variable descriptions taken from the V-Dem codebook directly.
#'
#' @section V-Dem Identifiers:
#'
#'   \describe{
#'
#'   \item{vdem_country_name}{Country name. Name of coded country. A V-Dem
#'   country is a political unit enjoying at least some degree of functional
#'   and/or formal sovereignty.}
#'
#'   \item{country_text_id}{Country name abbreviation. Abbreviated country
#'   names.}
#'
#'   \item{country_id}{V-Dem country ID. Unique country ID designated for each
#'   country.}
#'
#'   \item{year}{Year. Four-digit designation of the year for which an
#'   observation is given that ranges from the start to the end of the coding
#'   period.}
#'
#'   \item{historical_date}{Historical Date. Variable designating the date for
#'   which observation is given. The date is coded in YYYY-MM-DD format.
#'   December 31 observation always refers to the situation at the end of the
#'   year. There can be observations on other dates signifying other events,
#'   i.e. elections or executive appointments.}
#'
#'   \item{project}{V-Dem Project. Indication what project team has coded
#'   country in respective year.}
#'
#'   \item{historical}{Historical V-Dem Coding. Binary indication whether the
#'   country in question has been coded by the team of Historical V-Dem
#'   project.}
#'
#'   \item{histname}{Time-specific name of coded country. Many countries go by
#'   different names in different time-periods, for example due to name changes,
#'   changes in territory, colonization, occupation, or independence. This
#'   variable contains a brief description of the identity of each polity that
#'   comprises a country's history. This variable is based on the V-Dem Country
#'   Coding Units document.}
#'
#'   \item{codingstart}{Start of coding period. Year in which coding of the
#'   country in question starts. V-Dem country coding starts in 1789, or from
#'   when a country first enjoyed at least some degree of functional and/or
#'   formal sovereignty.}
#'
#'   \item{codingend}{End of coding period. Either a maximum year of country
#'   coding period or the year when the country ceased to exist because it lost
#'   functional or formal sovereignty.}
#'
#'   \item{codingstart_contemporary}{Contemporary start of coding period. Year
#'   in which the coding of Contemporary V-Dem project starts. Variables from
#'   "Contemporary" project can have different question formulation, variable
#'   type, or number of coders as opposed to the "Historical" one.}
#'
#'   \item{codingend_contemp}{Historical End of Coding Period. Year in which the
#'   coding of Contemporary V-Dem project ends. Variables from the
#'   "Contemporary" project can have different question formulation, variable
#'   type, or number of coders as opposed to the "Historical" one.}
#'
#'   \item{codingstart_hist}{Historical start of coding period. Year in which
#'   the coding of Historical V-Dem project starts. Variables from
#'   ``Historical'' project can have different question formulation, variable
#'   type, or number of coders as opposed to the "Contemporary" one.}
#'
#'   \item{codingend_hist}{Historical End of Coding Period. Year in which the
#'   coding of Historical V-Dem project ends. Variables from "Historical"
#'   project can have different question formulation, variable type, or number
#'   of coders as opposed to the "Contemporary" one.}
#'
#'   \item{gapstart1, gapstart2, gapstart3}{Time periods when a country does not
#'   fulfill V-Dem's coding period criteria are not coded. The date that
#'   indicates the gap start is the last date coded before the gap. For more
#'   details about V-Dem country coding periods, please see the V-Dem Country
#'   Coding Units document.}
#'
#'   \item{gapend1, gapend2, gapend3}{The periods of when a country does not
#'   fulfill V-Dem's coding period criteria are not coded. The date that
#'   indicates the gap end is the first date coded after the gap. For more
#'   details about V-Demcountry coding periods, please see the V-Dem Country
#'   Coding Units document.}
#'
#'   \item{gap_index}{An index for each country and continuous non-gap, i.e. it
#'   is reasonable for interpolation to interpolate only within the same gap
#'   index. For more details about V-Dem country coding periods, please see the
#'   V-Dem Country Coding Units document.}
#'
#'   \item{vdem_cowcode}{COW Country Code. Correlates of War (COW) project country
#'   codes.}
#'
#'   }
#'
#' @section V-Dem Main Indexes:
#'
#'   Each of the indexes described below comes with associated uncertainty
#'   measures: `_codehigh` and `_codelow` (the interval where the V-Dem Bayesian
#'   measurement model places 68% of the probability mass, or approximately one
#'   standard deviation upper and lower bounds, possibly asymmetric) and `_sd`
#'   (frequentist standard deviation).
#'
#'   \describe{
#'
#'   \item{v2x_polyarchy}{Electoral democracy index. To what extent is the ideal
#'   of electoral democracy in its fullest sense achieved? The electoral
#'   principle of democracy seeks to embody the core value of making rulers
#'   responsive to citizens, achieved through electoral competition for the
#'   electorate's approval under circumstances when suffrage is extensive;
#'   political and civil society organizations can operate freely; elections are
#'   clean and not marred by fraud or systematic irregularities; and elections
#'   affect the composition of the chief executive of the country. In between
#'   elections, there is freedom of expression and an independent media capable
#'   of presenting alternative views on matters of political relevance. In the
#'   V-Dem conceptual scheme, electoral democracy is understood as an essential
#'   element of any other conception of representative democracy --- liberal,
#'   participatory, deliberative, egalitarian, or some other.}
#'
#'   \item{v2x_libdem}{Liberal democracy index. To what extent is the ideal of
#'   liberal democracy achieved?
#'
#'   The liberal principle of democracy emphasizes the importance of protecting
#'   individual and minority rights against the tyranny of the state and the
#'   tyranny of the majority. The liberal model takes a ~negative~ view of
#'   political power insofar as it judges the quality of democracy by the limits
#'   placed on government. This is achieved by constitutionally protected civil
#'   liberties, strong rule of law, an independent judiciary, and effective
#'   checks and balances that, together, limit the exercise of executive power.
#'   To make this a measure of liberal democracy, the index also takes the level
#'   of electoral democracy into account.}
#'
#'   \item{v2x_delibdem}{Deliberative democracy index. To what extent is the
#'   ideal of deliberative democracy achieved?
#'
#'   The deliberative principle of democracy focuses on the process by which
#'   decisions are reached in a polity. A deliberative process is one in which
#'   public reasoning focused on the common good motivates political
#'   decisions—as contrasted with emotional appeals, solidary attachments,
#'   parochial interests, or coercion. According to this principle, democracy
#'   requires more than an aggregation of existing preferences. There should
#'   also be respectful dialogue at all levels—from preference formation to
#'   final decision—among informed and competent participants who are open to
#'   persuasion. To make it a measure of not only the deliberative principle but
#'   also of democracy, the index also takes the level of electoral democracy
#'   into account.}
#'
#'   \item{v2x_partipdem}{Participatory democracy index. To what extent is the
#'   ideal of participatory democracy achieved?
#'
#'   The participatory principle of democracy emphasizes active participation by
#'   citizens in all political processes, electoral and non-electoral. It is
#'   motivated by uneasiness about a bedrock practice of electoral democracy:
#'   delegating authority to representatives. Thus, direct rule by citizens is
#'   preferred, wherever practicable. This model of democracy thus takes
#'   suffrage for granted, emphasizing engagement in civil society
#'   organizations, direct democracy, and subnational elected bodies. To make it
#'   a measure of participatory democracy, the index also takes the level of
#'   electoral democracy into account.}
#'
#'   \item{v2x_mpi}{Multiplicative polyarchy index. To what extent is the
#'   electoral principle of democracy achieved?
#'
#'   The electoral principle of democracy seeks to achieve responsiveness and
#'   accountability between leaders and citizens through the mechanism of
#'   competitive elections. This is presumed to be achieved when suffrage is
#'   extensive; political and civil society organizations can operate freely;
#'   elections are clean and not marred by fraud or systematic irregularities;
#'   and the chief executive of a country is selected directly or indirectly
#'   through elections.}
#'
#'   \item{v2x_egaldem}{Egalitarian democracy index. To what extent is the ideal
#'   of egalitarian democracy achieved?
#'
#'   The egalitarian principle of democracy holds that material and immaterial
#'   inequalities inhibit the exercise of formal rights and liberties, and
#'   diminish the ability of citizens from all social groups to participate.
#'   Egalitarian democracy is achieved when 1) rights and freedoms of
#'   individuals are protected equally across all social groups; and 2)
#'   resources are distributed equally across all social groups; 3) groups and
#'   individuals enjoy equal access to power. To make it a measure of
#'   egalitarian democracy, the index also takes the level of electoral
#'   democracy into account.}
#'
#'   \item{v2x_api}{Additive polyarchy index. To what extent is the electoral
#'   principle of democracy achieved?
#'
#'   electoral principle of democracy seeks to achieve responsiveness and
#'   accountability between leaders and citizens through the mechanism of
#'   competitive elections. This is presumed to be achieved when suffrage is
#'   extensive; political and civil society organizations can operate freely;
#'   elections are clean and not marred by fraud or systematic irregularities;
#'   and the chief executive of a country is selected directly or indirectly
#'   through elections.}
#'
#'   }
#' @template standard-variables
#' @aliases vdem
#' @family democracy
#' @family continuous democracy indexes
#' @encoding UTF-8
#' @references
#'
#' `r roxygen_cite("vdem13codebook")`
#'
#' `r roxygen_cite("vdem13measurement")`
"vdem_simple"

# Wahman Teorell and Hadenius ---------------------------------------------

#' Authoritarian Regimes Data Set, version 5.0, by Axel Hadenius, Jan Teorell, &
#' Michael Wahman
#'
#' The Authoritarian Regimes Data set by Axel Hadenius, Jan Teorell, & Michael
#' Wahman, described in `r roxygen_cite("wahman_teorell_hadenius2007")` and
#' `r roxygen_cite("wahman_teorell_hadenius2013")`
#' The dataset and codebook can be downloaded from
#' \url{https://sites.google.com/site/authoritarianregimedataset/data}. I simply
#' copy the codebook below.
#'
#' @section NOTE ON VERSION 4: In this update between version 2.0 and 3.0
#'   (October 10, 2007) version of the data, we have corrected some erroneous
#'   codings in the regime type variables for Czechoslovakia (1992), Djibouti
#'   (1992-2005), Kyrgyz Republic (1991-1994), Lesotho (1993-1997), Singapore
#'   (1972-1980), Tajikistan (1991-1994 and 2005), and Uzbekistan (1991-1993).
#'   We also updated the Polity 4 data for the year of 2005 (instead of using
#'   imputed scores), which affected the regime classification of the
#'   Philippines for that year. Between version 3.0 and 4.0 codings were
#'   adjusted for Fiji in the period 2007-2008.
#'
#'   For each variable in the database n refers to the number of observed
#'   country years, N to the number of countries covered.
#'
#' @section Country and time coverage: This data set covers the time period
#'   1972-2010 and includes all 192 nations recognized as members of the UN
#'   except the four "micro states" of Europe (Andorra, Liechtenstein, Monaco
#'   and San Marino) and two "micro states" in the Pacific that are not members
#'   of the World Bank (Nauru and Tuvalu). In addition, we have included Taiwan
#'   and seven states that have dissolved or merged with other states: the USSR,
#'   Czechoslovakia, the Federal People's Republic of Yugoslavia, East Germany,
#'   North and South Yemen, and South Vietnam. This makes a tally of 195 states.
#'   We have treated Germany as a continuation of West Germany, Vietnam as a
#'   continuation of North Vietnam, and Ethiopia as a continuation of itself
#'   before the secession of Eritrea. By contrast, we treat the Republic of
#'   Yemen, the Federal Republic of Yugoslavia (Serbia and Montenegro) and the
#'   Russian Federation as new states. In the case of Yugoslavia (Serbia and
#'   Montenegro) Serbia is seen as the continuation of this state following the
#'   independence of Montenegro. Cyprus refers to the Greek part of Cyprus.
#'   Albania is treated as the same case after the independence of Kosovo.
#'   Kosovo is treated as a new case from 2009.
#'
#' @section Identification variables:
#'
#' \describe{
#'
#' \item{wahman_teorell_hadenius_country}{(n: 7991, N:
#'   195) Country name. Lists the full country name.}
#'
#'   \item{siffra}{(n: 7991, N:
#'   195) Country code. Numeric country code.}
#'
#'   \item{wahman_teorell_hadenius_cow}{(n:7150, N: 192)
#'   Corralates of war country code. Source: Corralates of war 2 project
#'   \url{http://www.correlatesofwar.org/.}}
#'
#'   \item{ccode}{(n:5867, N: 168)
#'   Polity country code (polity IV) Example: 85- Kenya 200- United Kingdom
#'   Changes made in the country codes when incorporating them into our
#'   database: Germany West (original code: 260) = Germany (ccode 255) Ethiopia
#'   (original code: 530) = Ethiopia (ccode 529) North Vietnam (original code:
#'   816) = Vietnam (ccode 818) Russia (original code: 365) before 1992 = USSR
#'   (ccode 364) Source: Marshall, Monty G & Jaggers, Keith: Polity IV project,
#'   Integrated Network for societal Conflict research (INSCR) Program Center
#'   for International Development and Conflict Management (CIDCM) University of
#'   Maryland, Collage Park 20742, \url{http://www.cidcm.umd.edu/inscr/polity.}}
#'
#'
#'   \item{ccode_qog}{(n:7527, N:193) ISO country code. In the following cases
#'   the ISO country numbers has been changed to match the countrycoding
#'   principles of our database: Germany West before 1991 (original code: 280) =
#'   Germany (ccode 276) Ethiopia before 1993 (original code: 230) = Ethiopia
#'   (ccode 231) North Vietnam before 1976 (original code: 998) = Vietnam (ccode
#'   704) Source:
#'   \url{http://www.iso.org/en/prods-services/iso3166ma/02iso-3166-code-lists/index.html},
#'    \url{http://en.wikipedia.org/wiki/ISO3166-1}} \item{year}{(n: 7991, N:
#'   195) Year of observation.}}
#'
#' @section Indices of democracy: \describe{
#'
#' \item{fhadd}{(n: 6712, N: 195)
#'   Average Freedom House political rights and civil liberty scores scaled
#'   0-10, where 10 indicate the highest degree of political rights and civil
#'   liberties and 0 the lowest degree. Source: The Freedom House surveys
#'   (Freedom in the world). www.freedomhouse.org.}
#'
#'   \item{revpol2}{ (n: 5794,
#'   N:170) Revised combined polity score (polity2), scaled 0-10, where 10
#'   indicates strongly democratic and 0 strongly autocratic. Source: Marshall,
#'   Monty G & Jaggers, Keith: Polity IV project, Integrated Network for
#'   societal Conflict research (INSCR) Program Center for International
#'   Development and Conflict Management (CIDCM) University of Maryland, Collage
#'   Park 20742, \url{http://www.systemicpeace.org/polity/polity4.htm}.}
#'
#'
#'   \item{fhpol}{(n: 5789, N: 170) Average Polity (revpol2) & Freedom House
#'   (fhadd) scores, scaled 0-10.1 Source: See fhadd and revpol2.}
#'
#'
#'   \item{ifhpol}{(n: 6712, N: 195) Imputed average Polity (revpol2) & Freedom
#'   House (fhadd) scores (scaled 0-10), where missing values have been imputed
#'   by regressing the fhpol index on the Freedom House scores (fhadd), which
#'   have better country coverage than Polity.2 Countries with an ifhpol score
#'   larger than 7.0 are coded as democracies. 1 As we have shown in a recent
#'   paper, this combined FH/Polity index outperforms all rival indices of
#'   democracy in an independent assessment (Hadenius and Teorell 2005). 2
#'   Imputed scores larger than 10 are set equal to 10. This imputation in
#'   effect also affects the time-series information on ifhpol for countries
#'   with some Polity data (although with less coverage than FH). In rare
#'   instances, this means that ifhpol in these countries changes although the
#'   underlying FH scores do not change. Source: See fhadd and revpol2.}}
#'
#' @section Regime classification variables:
#'
#' \describe{
#'
#' \item{regime1ny}{(n:
#'   6693, N:195) Collapsed regime type 1 Monarchy 2 Military 3 One party 4
#'   Multi-party 9 No-party 99 Other 100 Democracy Using the mean of the Freedom
#'   House and Polity scales (ifhpol), we draw the line between democracies and
#'   autocracies at 7.0. We chose his threshold value by estimating the mean
#'   cutoff point separating democracy from autocracy in five well-known
#'   categorical measures of democracy: Cheibub et al. (2010), Boix et al
#'   (Forthcoming) and Bernhard et al. (2001)3, together with Polity's own
#'   categorical threshold for "democracy" and Freedom House's threshold for
#'   "Electoral Democracy." At the core of our typology of authoritarian regime
#'   types is a distinction between three different modes of political power
#'   maintenance (probably the three most widely used throughout history): 1.
#'   Hereditary succession, or lineage, corresponding to Monarchies; we define
#'   monarchies as those regimes in which a person of royal descent has
#'   inherited the position of head of state in accordance with accepted
#'   practice and/or the constitution (one cannot proclaim oneself a monarch).
#'   It bears stressing that we only apply this classification to countries
#'   where the sovereign exercises real political power; ceremonial monarchies
#'   are thus excluded. This occurs in Afghanistan 1979 and 2001,
#'   Bosnia-Herzegovina 1995, Cambodia 1979, Lebanon 1990, and Solomon Islands
#'   2003. Users particularly interested in the time-series information on
#'   democracy for these countries should consider more case-specific imputation
#'   techniques. 2. The actual or threatened use of military force, referring to
#'   Military regimes, where the armed forces may exercise political power
#'   either directly or indirectly (i.e., by controlling civilian leaders behind
#'   the scenes). Regimes where persons of military background are chosen in
#'   open elections (which have not been controlled by the military) thus should
#'   not count as military. "Rebel regimes" form a special subcategory. They
#'   include cases where a rebel movement (one not formed out of the regular
#'   armed forces) has taken power by military means, and the regime has not as
#'   yet been reconstituted as another kind of regime. 3. Popular elections,
#'   designating the various electoral regimes. We distinguish among three basic
#'   types of electoral regimes. The first is the No-Party Regime, where
#'   elections are held but all political parties (or at least any candidate
#'   representing a party) are prohibited. Elections in no-party regimes may
#'   display an element of competition, but thus only among individual
#'   candidates. Second, in One-Party Regimes, all parties but one is forbidden
#'   (formally or de facto) from taking part in elections. A small number of
#'   non-party candidates may also be allowed to take part and get elected;
#'   there may be satellite parties which are autonomous in name, but which
#'   cannot take an independent position; and competition between candidates
#'   from the same (ruling) party may also obtain; we still code the regime
#'   one-party. It is not enough, moreover, that a regime calls itself a
#'   one-party state; elections in such a structure must also be held. Third,
#'   and finally, we define Limited Multiparty regimes as regimes that hold
#'   parliamentary or presidential elections in which (at least some) candidates
#'   are able to participate who are independent of the ruling regime. This
#'   classification holds even when opposition parties refrain voluntarily from
#'   taking part in elections. It also embraces cases where parties are absent,
#'   but where this is not the result of any prohibition against party
#'   activities: the candidates in question have simply chosen to stand for
#'   election as individuals. These latter we classify as Party-Less limited
#'   multiparty systems. Finally, we have a residual category called others,
#'   including a few cases that do not fit under any other regime type, given
#'   the definitions applied. The categories in regime1ny are not mutually
#'   exclusive. All monarchical regimes with amalgams (regimeny=16, 17, 23 or
#'   24) are treated as monarchies, all military regimes with sub-types and
#'   amalgams (regimeny=4, 5, 6, 7 or 18) are treated as military regimes, and
#'   multiparty regimes with sub-types are treated as multiparty regimes
#'   (regimeny =1 or 2). Only pure no-party (regimeny=3) and one-party
#'   (regimeny=8) regimes are treated as no-party and one-party regimes,
#'   respectively. The minor types (regimeny=9, 19, 20, 21, 22) are treated as
#'   other. Our regime classification pertains to December 31 as of each year.
#'   Sources: Banks and Wilson (2012), supplemented with: Elections in the world
#'   \url{http://www.electionworld.org}, IFES Election guide
#'   \url{http://209.50.195.230}, Journal of democracy: Election watch
#'   \url{http://muse.jhu.edu/journals/journal_of_democracy/election_watch/},
#'   Parties and elections in Europe
#'   \url{http://www.parties-and-elections.de/index.html}, Freedom House
#'   "Freedom in the World Reports" \url{http://www.freedomhouse.org}, The
#'   interparliamentary Union \url{http://www.ipu.org/english/home.htm},
#'   Political Database of the Americas \url{http://www.georgetown.edu/pdba/},
#'   Rulers \url{http://www.rulers.org}, Keesing's Record of World Events
#'   \url{http://keesings.gvpi.net/keesings/lpext.dll?f=templates&fn=main-h.htm},
#'    The Swedish Institute of International affairs, Country guides
#'   \url{http://www.landguiden.se}, The US Library of congress Country Studies
#'   (Federal Research Division of Library of Congress)
#'   \url{http://memory.loc.gov/frd/cs/cshome.html#toc}, Banks and Mueller:
#'   Political handbook of the world 1979, The Europe world tear book, various
#'   years, The Economist Intelligence Unit: Quaterly Economic Reviews, Country
#'   profiles and Country Reports, various years, The CIA World Fact book
#'   \url{http://www.cia.gov/cia/publications/factbook}, Country Reports on
#'   Human Rights practices (Reports submitted to Congress by US Department of
#'   State), various years, later editions on
#'   \url{http://www.state.gov/g/drl/hr/c1470.htm}, Encycopledia Britannica
#'   online \url{http://search.eb.com.}}
#'
#'   \item{regime1nyrobust}{Same as
#'   regime1ny, but with 7.5 democracy threshold.}
#'
#'   \item{regimeny}{(n: 6693,
#'   N:195) Regime type 1 Limited Multiparty 2 Partyless 3 No-Party 4 Military 5
#'   Military No-Party 6 Military Multiparty 7 Military One-party 8 One-Party 9
#'   Other 16 One-Party Monarchy 17 Monarchy 18 Rebel Regime 19 Civil War 20
#'   Occupation 21 Theocracy 22 Transitional Regime 23 No-Party Monarchy 24
#'   Multiparty Monarchy 100 Democracy Based on the classifications in regime1ny
#'   we also code hybrids (or amalgams) combining elements from more than one
#'   regime type. Monarchies may carry out elections in various forms:
#'   multiparty elections, no-party elections, and also one-party elections. The
#'   same goes for military regimes. In addition to the main types and their
#'   amalgams, we have identified several minor types of authoritarian regime.
#'   In a theocracy, decisive political power lies in the hands of a religious
#'   elite. Temporary regimes, the purpose of which is to carry out a
#'   transition, are classified as transitional regimes.7 There are furthermore
#'   countries in which the official government does not in reality control the
#'   territory. This may be due to civil war or occupation by foreign troops.
#'   Source: See regime1ny}
#'
#'   \item{regimenyrobust}{Same as regimeny, but with 7.5
#'   democracy threshold.}
#'
#'   \item{mon}{(n: 6693, N:195) Monarchy main type dummy
#'   0- Not a monarchy 1- Monarchy Coded as 1 for all monarchies, regardless of
#'   whether they are amalgams or sub-types (regimeny=16, 17, 23 or 24), 0
#'   otherwise. Source: See regime1ny.}
#'
#'   \item{monrobust}{Same as mon, but with
#'   7.5 democracy threshold.}
#'
#'   \item{mil}{(n: 6693, N:195) Military main type
#'   dummy 0- civilian rule 1- military rule Coded as 1 for all military
#'   regimes, regardless of whether they are amalgams or sub-types (regimeny=4,
#'   5, 6, 7 or 18), 0 otherwise. Source: See regime1ny.}
#'
#'   \item{milrobust}{Same
#'   as mil, but with 7.5 democracy threshold.}
#'
#'   \item{mul}{(n: 6693, N:195)
#'   multiparty main type dummy 0- Not multiparty 7 A transitional regime can
#'   only last in our schema for up to three years; after that, it is given a
#'   different and more fitting classification. 1- Limited Multiparty Coded as 1
#'   for all limited multiparty regimes, regardless of whether they are amalgams
#'   or sub-types (regimeny=1, 2, 6, 24 or 25), 0 otherwise. Source: See
#'   regime1ny.}
#'
#'   \item{mulrobust}{Same as mul, but with 7.5 democracy
#'   threshold.}
#'
#'   \item{onep}{(n: 6693, N:195) one-party main type dummy 0- Not a
#'   one party regime 1- One-party regime Coded as 1 for all one-party regimes,
#'   regardless of whether they are amalgams or sub-types (regimeny=7, 8 or 16),
#'   0 otherwise. Source: See regime1ny.}
#'
#'   \item{oneprobust}{Same as onep, but
#'   with 7.5 democracy threshold.}
#'
#'   \item{nop}{(n: 6693, N:195) noparty main
#'   type dummy 0- Not a no-party system 1- No-party system Coded as 1 for all
#'   no-party regimes, regardless of whether they are amalgams or sub-types
#'   (regimeny=3, 5 or 23), 0 otherwise. Source: See regime1ny.}
#'
#'
#'   \item{noprobust}{Same as nop, but with 7.5 democracy threshold.}
#'
#'
#'   \item{partsz}{(n:6504, N:194) size of the largest party in legislature (in
#'   fractions) Counts the largest parties' number of seats divided with the
#'   legislative assembles' total number of seats expressed in fractions. In
#'   countries with a two-chamber parliament the lower house is counted. Source:
#'   Banks and Wilson (2012), Elections in the world
#'   \url{http://www.electionworld.org}, Beck et al (2001), IFES Election guide
#'   http:// 209.50.195.230, Journal of democracy: Election watch
#'   \url{http://muse.jhu.edu/journals/journal_of_democracy/election_watch/},
#'   Parties and elections in Europe
#'   \url{http://www.parties-and-elections.de/index.html}, The
#'   interparliamentary Union \url{http://www.ipu.org/english/home.htm},
#'   Political Database of the Americas \url{http://www.georgetown.edu/pdba/},
#'   Rulers \url{http://www.rulers.org}, Keesing's Record of World Events
#'   \url{http://keesings.gvpi.net/keesings/lpext.dll?f=templates&fn=main-h.htm},
#'    The CIA World Fact book
#'   \url{http://www.cia.gov/cia/publications/factbook}}
#'
#'   \item{partsz1}{(n:6504,
#'   N:193) size of largest party (in fraction), zero for one party regime Codes
#'   all one-party regimes as 0 instead of 1 as is done in partsz, otherwise
#'   this variable corresponds to the former variable partsz. When the degree of
#'   "dominance" of the largest party within multiparty regimes is to be
#'   controlled for, this variable should be used. Source: See partsz.}}
#'
#' @section Historical variables and regime duration indicators: \describe{
#'   \item{yrindep}{(n:7605, N:195) Year of independence (1700=1700 or before)
#'   We have generally used the data when a state became independent or unified
#'   within the (more or less) current borders. This pertains for instance to
#'   Hungary, which is coded as independent in 1918 and not in 1001 when it was
#'   first unified. Cases of occupation when the occupant power never
#'   established any civilian rule has not been counted as cases of
#'   colonisation. All countries that became independent in 1700 or prior to
#'   this year is coded as yrindep=1700. Source: CIA World Fact Book and
#'   Encyclopedia Britannica Online.}
#'
#'   \item{yrterm}{(n:7605, N:195) Year of
#'   termination of the country (2005= still existing at the end of our
#'   observation period) The following cases has a noted year of
#'   termination<2005: East Germany (1990), Czechoslovakia (1993), USSR (1991),
#'   South Yemen (1990), North Yemen (1990), Yugoslavia FPR (1992), South
#'   Vietnam (1976). Source: CIA World Fact Book and Encyclopedia Britannica
#'   Online.}
#'
#'   \item{regstart}{(n: 2673, N: 194) Starting year of regime
#'   (backdated to 1960) Indicates the starting year of the current regime type,
#'   backdated until 1960 for the regime that was in place in 1972, that is, at
#'   the start of our observation period. The variable is only coded for the
#'   first regime period of each country.}
#'
#'   \item{lagregime1ny}{(n: 6693, N:194)
#'   Previous regime type (collapsed regime type) 1 Monarchy 2 Military 3 One
#'   party 4 Multi-party 9 No-party 99 Other 100 Democracy Indicates the current
#'   regimes' previous regime type according to the classification of regime1ny.
#'   At the first year of the time-series each country has its current regime
#'   type as lagregime1ny. For definitions of regime types, see regime1ny..
#'   Source: See regime1ny.}
#'
#'   \item{lagregime1nyrobust}{Same as lagregime1ny, but
#'   with 7.5 democracy threshold.}
#'
#'   \item{lagregimeny}{(n: 6693, N:194) Previous
#'   regime type 1 Limited Multiparty 2 Partyless 3 No-Party 4 Military 5
#'   Military No-Party 6 Military Multiparty 7 Military One-party 8 One-Party 9
#'   Other 16 One-Party Monarchy 17 Monarchy 18 Rebel Regime 19 Civil War 20
#'   Occupation 21 Theocracy 22 Transitional Regime 23 No-Party Monarchy 24
#'   Multiparty Monarchy 25 Multiparty Occupied 100 Democracy Indicates the
#'   current regimes' previous regime type according to the classification of
#'   regimeny. At the first year of the time-series each country has its current
#'   regime type as lagregimeny. For definitions of regime types, see regimeny.
#'   Source: See regime1ny.}
#'
#'   \item{lagregimenyrobust}{Same as lagregimeny, but
#'   with 7.5 democracy threshold.}
#'
#'   \item{regnumb1ny}{(n: 6693, N:195) Number of
#'   consecutive regime periods (collapsed regime type) Indicates the
#'   consecutive number of the current regime period for a country according to
#'   the classification of regime1ny. Source: See regime1ny}
#'
#'
#'   \item{regnumb1nyrobust}{Same as regnumb1ny, but with 7.5 democracy
#'   threshold.}
#'
#'   \item{regnumbny2}{ (n: 6693, N:195) Number of consecutive
#'   regime periods Indicates the consecutive number of the current regime
#'   period for a country according to the classification of regimeny. Source:
#'   See regime1ny}
#'
#'   \item{regnumbny2robust}{ Same as regnumbny2, but with 7.5
#'   democracy threshold.}
#'
#'   \item{totdur1ny}{(n: 6693, N:195) Duration of current
#'   regime period (collapsed regime type) Indicates the number of years that
#'   the current regime, according to the classification of regime1ny, has been
#'   in place in a country (up until 2003, the end of the observation period).
#'   Regime durations are backdated to 1960 according to regstart. Source: See
#'   regime1ny}
#'
#'   \item{totdur1nyrobust}{Same as totdur1ny, but with 7.5 democracy
#'   threshold.}
#'
#'   \item{totdurny2}{ (n: 6693, N:195) Duration of current regime
#'   period (in years) Indicates the number of years that the current regime,
#'   according to the classification of regimeny, has been in place in a country
#'   (up until 2003, the end of the observation period). Regime durations are
#'   backdated to 1960 according to regstart. Source: See regime1ny}
#'
#'   \item{totdurny2robust}{ Same as regnumbny2, but with 7.5 democracy
#'   threshold.}}
#'
#' @section Indicators of personalism:
#'
#' \describe{
#'
#' \item{persagg1ny}{(n: 6693,
#'   N:195) Mean executive turnover (collapsed regime type) Measures the total
#'   number of changes of the chief executive during the regime spell divided by
#'   the years of regime spell duration, according to the classification of
#'   regime1ny. The effective executive may be the president, prime minister,
#'   leader of the ruling party, the monarch or the ruling military junta, or
#'   someone else, working behind political figure heads. Source: Banks and
#'   Wilson (2012), Elections in the world \url{http://www.electionworld.org},
#'   Rulers \url{http://www.rulers.org}, Keesing's Record of World Events
#'   \url{http://keesings.gvpi.net/keesings/lpext.dll?f=templates&fn=main-h.htm},
#'    The Swedish Institute of International affairs: Country guides
#'   \url{http://www.landguiden.se}, Country Reports on Human Rights practices
#'   (Reports submitted to Congress by US Department of State), Encyclopedia
#'   Britannica \url{http://search.eb.com} }
#'
#'   \item{persagg1nyrobust}{Same as
#'   persagg1ny, but with 7.5 democracy threshold.}
#'
#'   \item{persaggny2}{ (n: 6693, N:195) Mean executive turnover (within regime
#'   spells) Same as persagg1ny, but according to the classification of
#'   regimeny.}
#'
#'   \item{persaggny2robust}{ Same as persaggny2, but with 7.5
#'   democracy threshold. Source: See persagg1ny.}
#'
#'   \item{tenure1ny}{(n: 6693,
#'   N:195) Mean years of executive tenure (collapsed regime type) Measures the
#'   years of regime spell duration divided by the total number of changes of
#'   the executive during the regime spell, according to the classification of
#'   regime1ny. In case no change of executive occurred during a regime spell,
#'   tenure1ny is set equal to the regime spell duration. Source: See
#'   persaggny2.}
#'
#'   \item{tenure1nyrobust}{Same as tenure1ny, but with 7.5
#'   democracy threshold.}
#'
#'   \item{tenureny2}{ (n: 6693, N:195) Mean years of
#'   executive tenure (within regime spells) Same as tenure1ny, but according to
#'   the classification of regimeny. Source: See persagg1ny.}
#'
#'   \item{tenureny2robust}{ Same as tenureny2, but with 7.5 democracy
#'   threshold.}
#'
#'   }
#' @template standard-variables
#' @source `r roxygen_cite("wahman_teorell_hadenius2007")`
#' @source `r roxygen_cite("wahman_teorell_hadenius2013")`
#'
#' @aliases wth
#'
#' @family democracy
#' @family dichotomous democracy indexes
#' @family authoritarianism
"wahman_teorell_hadenius"


# Bibliography ------------------------------------------------------------

#' References to all the datasets included in this package.
#'
#' This is a \link{BibEntry} object that can be manipulated using the \link{RefManageR}
#' package functions or the standard citation functions in R.
#'
#' @encoding UTF-8
"bibliography"


# PIPE --------------------------------------------------------------------

#'The Political Institutions and Political Events (PIPE) dataset
#'
#'
#'`r roxygen_cite("PIPE")` The original
#'data and codebook can be downloaded from
#'\url{https://sites.google.com/a/nyu.edu/adam-przeworski/home/data}. The
#'documentation below is directly derived from the codebook, with some
#'modifications.
#'
#'@section Credits: The data were originally collected by Tamar Asadurian,
#'  Anjali Thomas Bohlken, Carolina Curvale, and Sunny Kuniyathu. They went
#'  through several rounds of revisions and additions with the participation of
#'  Jenny Guardado, Jean Hong, Sebastian Lavezzolo, Kristin Michelitch, Yingying
#'  Na, Lindsay Schorr Newman, S.K. Park, Didac Queralt, Gonzalo Rivero, Kong
#'  Joo Shin, Tolga Sinmazdemir, and Tianyang Xi. Pablo Barbera, Jeff Carnegie,
#'  Sonke Ehret, Omar Garcia-Ponce, Jaeyoun Jung, Yu Jeon Park, and Pedro Silva
#'  additionally checked some countries. To catch discrepancies, some variables
#'  were checked against other data compilations. No other data source, however,
#'  was used in its original form. The discrepancies that remain are due either
#'  to deffinitional differences or to a different assessment of facts.
#'
#'@section Introduction:
#'
#'  The data set is intended to cover all countries that were or would become
#'  independent at any time after 1917, each from the inception of the first
#'  representative institutions or from the date of independence, whichever
#'  comes first, through 2008. The rows of the data matrix contain information
#'  for countries during years.
#'
#'  In general, whenever the relevant situation may change during the year,
#'  recorded is the status as of December 31. For example, if a country had a
#'  legislature during some parts of a particular year but the legislature was
#'  closed at the end of the year, it is coded as closed for this year. Other
#'  variables, however, either count the frequency of particular events during a
#'  particular year (for example, the number of chief executives) or are country
#'  invariant. The code -1 generically refers to situations in which a
#'  particular variable is not applicable. This coding is not always consistent:
#'  sometimes in such situations data are recorded as missing, for example,
#'  presidential elections in countries where there are no presidents.
#'
#'@section Shell:
#'
#'  Note: Some countries had convoluted histories: (1) They became independent,
#'  lost independence by being annexed by another country or by joining a
#'  federation, and then became independent again. (2) They split and became
#'  unified again. (3) They emerged from collapse of empires or from splits from
#'  another country. (4) They resulted from unification of previously
#'  independent or separate units. Our general rule is to keep as the same over
#'  time countries under (1) and (2) but to treat as new countries those under
#'  (3) and (4). The Baltic republics are an example of (1), Germany is a case
#'  of (2), Serbia, which split from Yugoslavia together with Macedonia and then
#'  from Macedonia illustrates (3), while post-1975 Vietnam is a case of (4).
#'
#'  Some countries belonged at some times to other countries. For example, the
#'  Czech Republic, which became independent as of 1993, was a part of the
#'  Austrio-Hungarian Empire before 1918 and of Czechoslovakia between 1918 and
#'  1992. We refer as "supra-units" to those units that contained at least one
#'  territory that would become independent at any time after 1917 and as
#'  "parts" to those units that composed them. The supra-units need not be
#'  independent: British India is an example. Colonial empires are not
#'  considered as supra-units and they are coded as such separately.
#'
#'  \describe{
#'
#'  \item{PIPE_countryn}{The name of the country at the time. This has been
#'  partially reconstructed. The original data was missing many names, and did
#'  not use a consistent scheme for naming countries. Use \code{extended_country_name}
#'  instead.}
#'
#'  \item{country_number}{The number of the country. Note: For historical
#'  reasons the numbering of countries is haphazard. Countries with numbers less
#'  than 142 are arranged alphabetically within regions but the remaining
#'  countries are not. This will be corrected in a future version.}
#'
#'  \item{PIPE_cowcodes}{The number of the country in the Correlates of War (COW)
#'  data set. This has been reconstructed. The original data was missing several
#'  cowcodes.}
#'
#'  \item{year}{The calendar year.}
#'
#'  \item{id}{A unique observation identifier, concatenation of
#'  \code{country}+\code{year}. For example, Turkey is country 125 and in 1900
#'  its \code{id} is 1251900.}
#'
#'  \item{id2}{Identifies a particular observation by the number of a supra-unit
#'  of which it is a part and year. For example, in 1900 Turkey was part of the
#'  Ottoman Empire, the \code{id} of which is 540, so that \code{id2} for Turkey
#'  in this year is 5401900. This \code{id} is shared among all constituent
#'  parts of the Ottoman Empire in 1900. If a territory is not part of a
#'  supra-unit, then \code{id2}=\code{id}.}
#'
#'  \item{id3}{Identifies a particular observation by the number of the country
#'  of which the territory is a dependency. For example, in 1900 Kenya was a
#'  dependency of the United Kingdom, which is country 126, so ID3 for Kenya for
#'  the year 1900 is 1261900 If a territory is not a dependency, then
#'  ID3=\code{id2}.}
#'
#'  \item{supra}{Identifies the supra-unit of which a particular unit is a part
#'  during a particular year. Thus, \code{supra}=540 for all parts of the
#'  Ottoman Empire. \code{supra} is coded only if \code{id} != \code{id2};
#'  otherwise, it is coded as missing. Note that this implies that \code{supra}
#'  is coded as missing for the supra-units themselves.}
#'
#'  \item{yrindep}{is the year during which a country became independent. For
#'  countries that were independent before year 1000 the date is set arbitrarily
#'  at 1000. In case of entities that became unified, coded is the year of
#'  unification. For countries that temporarily lost independence having been
#'  annexed to other countries, the most recent date of independence is given.
#'  For units that never became independent as such (West African Federation,
#'  Leeward Islands Federation), the code is -1.}
#'
#'  \item{polstatus}{Current political status of the country. Coded as: -1 Does
#'  not exist as a separate country 0 Dependency 1 Independent, not colonizer 2
#'  Colonizer Note: The code -1 is used to keep rows of countries that were
#'  independent, lost independence or split, and then reappeared, in fact some
#'  of the Soviet Republics and Germany. Only occupations of territories lasting
#'  longer than ten years are considered as constituting colonial rule. For
#'  example, the Italian occupation of Ethiopia is not considered as colonial.}
#'
#'  \item{occupied}{Dummy for country years during which a territory was
#'  occupied by a foreign power, as long as this power controlled central
#'  government (until the first election of the national government) or occupied
#'  the capital. The variable does not apply to metropolitan rule in
#'  dependencies. Countries that are annexed to another country (for example,
#'  Baltic republics in 1940) are not occupied. Note: A country can be a colony
#'  and occupied only if the occupier is distinct from the colonial power, for
#'  example, Japan in the Dutch colony of Indonesia. Coded as of December 31, so
#'  that occupations that begin and end within the same year are ignored.} }
#'
#'@section Constitutional Framework:
#'
#'  \describe{
#'
#'  \item{const_onpaper}{The year in which the most recent constitution was
#'  promulgated, whether or not it was implemented. Even if a constitution is
#'  extensively modified by amendments, it remains the same unless a new
#'  constitution is formally adopted or the old constitution is formally
#'  abrogated without being replaced. This variable is coded as 0 if there is no
#'  constitution, it is coded as -1 if there is more than one constitution.
#'
#'  Note: Constitutions are defined nominally, that is, a document is a
#'  constitution if it is called that. Sometimes there are several acts that
#'  together constitute a constitution: if they have different dates, we use the
#'  one that regulates the selection of the chief executive. Documents called
#'  "Instructions of government" or the like are included if they regulate the
#'  selection of the chief executive.
#'
#'  The frequency with which constitutions change differs greatly across
#'  countries. For example, Dominican Republic had thirty-three constitutions
#'  between 1844 and 1995, in part because every time a constitution was in any
#'  way amended, the modified document was called a new constitution. In
#'  contrast, Sweden changed basic provisions concerning the composition of the
#'  legislature, franchise, and parliamentary responsibility without formally
#'  recognizing any of these changes as a new constitution until 1975. Hence,
#'  the constitutions coded here are not equivalent units. The "English
#'  Constitution" was a combination of written rules (collected for the first
#'  time between 1769 and 1777 at the instigation of the House of Lords), legal
#'  precedents, informal norms, and unstated habits, but ever before its first
#'  description by De Lolme in 1771, it was recognized as a stable for of
#'  organization of government. We date it, somewhat arbitrarily, to 1688. We
#'  also attribute this date to pre-1964 Barbados. In the case of Israel, we use
#'  the year of first basic law, 1958.}
#'
#'  \item{const_inforce}{ The year in which the constitution in force by the end
#'  of a year was promulgated. A constitution is in force whenever its
#'  provisions concerning the selection of the chief executive or of the
#'  legislature (if any) are implemented. This variable equals
#'  \code{const_onpaper} except that it is coded as 0 if: (1) If a constitution
#'  was never implemented (the French Constitution of 1793, the 1976
#'  Constitution of the Central African Republic), (2) If a constitution
#'  provides for an elected chief executive and/or the legislature and all such
#'  provisions are violated.
#'
#'  Note: The reason to use such de facto rules is that the legal status of the
#'  constitution is sometimes difficult to determine. For example, the Junta
#'  headed by General Ongania in Argentina in 1966 deposed the president and the
#'  vicepresident, dissolved the Congress, and banished political parties, while
#'  adopting Statutes of the Argentine Revolution as an organic document
#'  regulating the operation of the government, all seemingly without any
#'  reference to the Constitution of 1853 (Floria and Belsunce 1988: 193). Even
#'  more nuanced were the years 1973-76 in Chile, where views as to whether the
#'  Constitution of 1925 remained in force were divided even among advisors of
#'  the military Junta. Only by 1976, the Junta passed Constitutional Acts, thus
#'  effectively abrogating the previous constitution and only in 1980 a new
#'  constitution was adopted (Barros 2002). Some constitutions do not provide
#'  for any kind of elections. In such cases the constitution is considered to
#'  be in force as long as its other provisions are observed. There are also
#'  frequent cases in which a constitution is implemented only several years
#'  after it is adopted: for example, the first elections under the 1974
#'  Constitution of Mali took place only in 1979. In such cases, the
#'  constitution is considered to be in effect even before it is implemented.
#'  This rule applies anew each time a constitution is reinstated. The coding of
#'  constitutions in force is conservative, in the sense that a constitution is
#'  considered to be in force if it provides for an election for both the chief
#'  executive and a legislature and only one of them is elected. A more
#'  stringent coding can be constructed by recoding constitutions as not being
#'  in force if either the chief executive or the legislature is not elected.
#'  Note, however, that even if one of these actors is not currently elected, it
#'  may be elected during subsequent years still under the same constitutions.
#'
#'  Here is a list of constitutions that did not provide for an elected chief
#'  executive or legislature:
#'
#'  1975 Angola: the legislative organ (council of the revolution) performed
#'  both executive and legislative functions; hence, it was not counted as a
#'  legislature. The head of the MPLA was the chief executive; he was not
#'  elected.
#'
#'  1969 Congo (Brazaville): did not provide for a legislature.
#'
#'  1951 Nepal: chief executive is the monarch and there is no elected
#'  legislature.
#'
#'  1865 Mexico: sovereignty vested in emperor, no elected legislature.
#'
#'  1884 British Honduras: crown colony, no elected legislature.
#'
#'  1865 Jamaica: crown colony, no elected legislature.
#'
#'  1939 Albania: executive power vested in the King and exercised by the King's
#'  viceroy. Legislative power was vested in the King, and a Superior Fascist
#'  Corporative Council appointed to assist the Crown.} }
#'
#'@section Organization of Government:
#'
#'  Note: Constitutional provisions are coded as provided for in the
#'  constitutions, that is, according to \code{const_onpaper}, even if the
#'  constitution is not observed (\code{const_inforce}=0) or if it has fallen
#'  into disuse or was never used. For example, the last royal veto occurred in
#'  England in 1706 and the last unilateral dissolution in 1834 but because no
#'  legal acts were passed to curtail these royal prerogatives they are coded as
#'  present.
#'
#'  \describe{
#'
#'  \item{title_ce}{ Title of the nominal head of government (chief executive,
#'  as distinct from the head of state), according to the constitution.
#'  Nominating and dismissing powers are not executive powers. Presiding over
#'  meetings of the council of ministers or promulgating laws are also not
#'  considered executive powers. These rules apply even if these powers are
#'  specified in a section of constitution that deals with executive powers.
#'
#'  -1 if there is no constitution or more than one
#'
#'  0 if monarch or governor general (if the constitution states that the
#'  monarch is the chief executive)
#'
#'  1 if prime minister (president of the government or equivalent)
#'
#'  2 if president who cannot be removed in good behavior during a fixed term,
#'  whether directly or indirectly elected,
#'
#'  3 if the constitution gives executive powers both to president, who cannot
#'  be removed during a fixed term, and to a prime minister. Typically, such
#'  constitutions enumerate specific powers of the president and reserve the
#'  remaining powers for the government.
#'
#'  4 if collective,
#'
#'  5 if other.
#'
#'  Note: Coded mechanically as 0 for the British colonies. Chief executive is
#'  coded as collective even if one person bears the title of the president of
#'  the collective body, say military junta, but not of the country.}
#'
#'  \item{dissolution_power}{ Dummy for the power of the head of state to
#'  dissolve the legislature (at least the lower house) unilaterally. 0 if never
#'  unilaterally. 1 if a unilateral (that is, not at the request of someone
#'  else) decision of the dissolver.
#'
#'  Note: Dissolution power is unilateral if the head of state can dissolve the
#'  parliament without the consent of the government or leaders of political
#'  parties in the legislature. It is still unilateral if dissolution requires
#'  the consultation or consent of non-elected bodies or if there are
#'  restrictions concerning the frequency or the period during which it can
#'  occur.}
#'
#'  \item{leg_composition}{Captures legal provisions regulating the mode of
#'  selection of the lower house of the legislature. Whenever there are no such
#'  provisions but a legislature exists, the actual mode of selection is coded.
#'  These provisions are coded whether or not the legislature in fact exists, as
#'  long as they have not been formally abrogated or suspended.
#'
#'  Rows distinguish elected vs. appointed legislatures. Ex-officio members are
#'  considered as appointed. Columns specify whether or not there are distinct
#'  electorates (whether people living next to each other vote for the same
#'  seats) and/or whether the appointed seats are distributed among some
#'  categories.
#'
#'  The coding entails two levels. At the first level, as represented by
#'  integers, we indicate whether the legislature was fully appointed, partially
#'  appointed and partially elected, or fully elected, and whether either those
#'  appointed or the voters were distinguished according to some criteria. In
#'  cases of partly elected and partly appointed legislatures, the first decimal
#'  indicates whether distinctions apply to the electorate or to the appointed
#'  position. In cases where at least some members are appointed, the second
#'  decimal provides information whether appointments resulted from delegation
#'  from below or nomination from above. Thus, for example, in Austria between
#'  1848 and 1877, voters were divided into curiae according to property
#'  criteria: we code this case as 10. In Jordan, the legislature was elected
#'  except for two seats reserved for Bedouins, who were appointed: the code is
#'  7.01 since the legislature was partially appointed (7) and the
#'  representatives were nominated from above (0.01). Finally, in Fiji in 1929,
#'  Europeans and Indo-Fijians were elected by separate electorates, while
#'  Fijians were appointed by the chiefs: we code is as 7.12 since the
#'  legislature was partially appointed (7), the distinction by race/ethnicity
#'  applied to voters (0.1), and the appointed representatives were delegates
#'  (0.02). We ignore functional bodies such as in Yugoslavia 1974 and therefore
#'  code them as missing. If there is a functional body along with territorial
#'  body, we focus on the latter. Quotas, such as that some proportion of the
#'  legislature must be female, are not considered unless there are separate
#'  electorates for male and female seats. The codes for particular categories
#'  are represented by cell entries in the table (table cannot be reporduced
#'  properly here - consult online codebook at
#'  \url{https://sites.google.com/a/nyu.edu/adam-przeworski/home/data}):
#'
#'  None Income, Race Both Property, Ethnicity Profession Religion Estate Gender
#'  None 0 0 0 0 Fully appointed& 1 2 3 4 Partly appointed 5& 6& 7& 8& Fully
#'  elected 9 10 11 12
#'
#'  None means that there are no constitutional provisions for a legislature and
#'  no legislature in fact.
#'
#'  * Accompanied by a decimal as follows: 0.1 if distinctions apply to the
#'  electorate 0.2 if distinctions apply to the appointed positions 0.3 if
#'  distinctions apply both to the electorate and the appointed positions
#'
#'  & Accompanied by a centecimal as follows: 0.01 appointed from above 0.02
#'  appointed from below 0.03 some are appointed from above and some are
#'  appointed from below
#'
#'  In addition to these codes, assemblies based on estate representation are
#'  coded as 13. Estate assemblies were bodies divided into three of more
#'  chambers, each of which contained representatives (or indeed all members
#'  appearing personally) of one, and only one, legally privileged status group
#'  or estate such as the nobility, the clergy, and the burghers of the
#'  self-governing towns. (Ertman 1997: 21) An estate, in turn, may be defined
#'  as a group of people having the same status in the sense in which that word
#'  is used by lawyers. A status in this sense is a position to which is
#'  attached a bundle of rights and duties, privileges and obligations, legal
#'  capacities and incapacities, which are publicly recognized and which can be
#'  defined and enforced by public authority and in many cases by courts of law.
#'  (Marshall 1965: 193). For a discussion of the Estate system, see Poggi
#'  (1978: Chapter 3).}
#'
#'  \item{bicam}{ Number of houses of the legislature: 0 if none, 1, 2, 3. A
#'  legislature that is elected in one election and then divides itself into
#'  chambers that differ in some prerogatives and at least at times vote
#'  separately is coded as multicameral. An example is Norway as of 1814.}
#'
#'  \item{upper_house}{Composition of the legislature. 0 if unicameral, 1 if
#'  second (upper) house is fully elected (directly or not), 2 if second (upper)
#'  house is partially appointed, 3 if second (upper) house is fully appointed
#'  or hereditary.}
#'
#'  \item{upper_block}{Indicates whether the second (upper) house can delay or
#'  veto the decisions of the first (lower) house. -1 if the legislature is
#'  unicameral, 0 if the second (upper) house cannot block or delay legislation
#'  passed by the lower (first) house, 1 if the second (upper) house can only
#'  put a suspensive veto or can send for reconsideration (a "suspensive veto"
#'  is any veto that can be overridden by someone), 2 if the second (upper)
#'  house must approve must legislation or can put a final veto. Note: Blocking
#'  applies to any issue area. Note that if \code{upper_house}= 1 AND
#'  \code{upper_block} =1, then non-elective legislative power can block.}
#'
#'  \item{outside_block}{Indicates whether anyone outside the legislature, other
#'  than courts, can block legislation. 0 if no one cannot suspend or block
#'  legislation, 1 if someone can put a suspensive veto, that is, a veto subject
#'  to override, 2 if someone can put derogative veto.}
#'
#'  \item{blocker}{ Indicates whether the blocker is elected. -1 if no blocker 0
#'  if not elected (including partially elected blockers) 1 if elected
#'  (individuals or bodies appointed by an elected body are considered to be
#'  elected)} }
#'
#'@section Organization of elections:
#'
#'  \describe{ \item{f}{Franchise. Qualifications for the right to vote in
#'  national elections. Preliminary notes: To account for exclusions not
#'  captured under \code{f}, we use the variable \code{oth_exclusions} (see
#'  below).
#'
#'  There are cases of coexisting qualifications. We handle them as follows:
#'
#'  (1) If the qualifications differ by ethnicity or religion (common in
#'  colonies), we code the least restrictive qualification for non-colonizers.
#'
#'  (2) If the qualifications are set at a sub-national level, we code the
#'  variable as missing. (Unified countries in which franchise is regulated by
#'  sub-units include the United States, Mexico, or South Africa before 1968,
#'  while cases of countries that were not yet politically unified include
#'  Argentina before 1853, South Africa before 1910, and Australia before 1901).
#'  Regulations concerning immigrants and foreign residents are not considered.
#'
#'  Coding of franchise:
#'
#'  missing before suffrage was instituted for the first time.
#'
#'  The codes 0 to 7 are for males only:
#'
#'  0 No legal provisions for suffrage. This code is applied (a) whenever
#'  constitutions or other legal acts providing for suffrage were either
#'  abrogated without being replaced or formally suspended, (b) if (a) is
#'  unclear, whenever the legislature was closed and neither legislative nor
#'  presidential elections were held.
#'
#'  1 Estate representation. Example: Sweden until 1866.
#'
#'  2 Property only.
#'
#'  3 (Property OR income OR taxes OR exercise of profession OR educational
#'  titles) AND literacy.
#'
#'  4 Property OR income OR taxes OR exercise of profession OR educational
#'  titles. This code applies whenever the law specifies a minimum threshold,
#'  even if this threshold is very low (for example, tax contribution of three
#'  days of local wages in France in 1789, as long as this requirement is
#'  observed. If it is not observed, as in post-1917 Mexico, the code is 6.
#'
#'  5 Literacy only OR (Literacy OR property OR income OR taxes OR exercise of
#'  profession OR educational titles). 6 All the economically independent (not
#'  personal servants, not debtors, only residence requirement). Includes: (a)
#'  phrases that explicitly refer to economic independence. Example: "Tener una
#'  propiedad, o ejercer cualquiera profesión, o arte con título público, u
#'  ocuparse en alguna industria útil, sin sujeción a otro en clase de sirviente
#'  o jornalero." (Peru in 1823) (b) phrases such as known means of subsistence,
#'  "honest livelihood." Example: "Son ciudadanos todos los habitantes de la
#'  Republica naturales de pais o naturalizados en el que fueren casados, o
#'  mayores de diez y ocho anos, siempre que exerzan alguna profesion util o
#'  tengan medios conocidos de subsistencia." (Costa Rica 1824) (c) phrases that
#'  suggest clearly broad qualifications. Example: "Son ciudadanos todos los
#'  salvadoreños mayores de veintiún años que sean padres de familia, o cabezas
#'  de casa, o que sepan leer y escribir, o que tengan la propiedad que designa
#'  la ley." (El Salvador 1841) (d) cases where suffrage is universal but only
#'  for free men (i.e., not slaves) (e) cases that fall under 4 without explicit
#'  thresholds. Examples: Romania 1866, Peru 1860. The French constitutions of
#'  1795 and 1799 required "une contribution quelquonque." The 1860 Peruvian
#'  constitution qualified anyone who could read and write OR paid any taxes OR
#'  owned a workshop OR owned some land. The last provision was intended to
#'  allow the indigenous population to vote. (f) cases in which franchise is
#'  declared to be universal but excludes those who have failed to pay taxes or
#'  those permanently receiving public assistance or those under legal
#'  bankruptcy.
#'
#'  7 All ("Manhood"). The only exclusions admitted in this category are: (1)
#'  having been convicted of a crime (2) being legally incompetent (3) short,
#'  less than two-year local residence requirement. There are some cases,
#'  however, where the law contains restrictive phrases, such as the requirement
#'  of appearing on the tax rolls or having fulfilled military obligation, these
#'  restrictions were not enforced. In such cases franchise was coded as 7. An
#'  example is the Ottoman Constitution of 1876 (in force after 1908) or the
#'  Swedish law until 1975.
#'
#'  For females, we use the second digit, distinguishing only situations in
#'  which
#'
#'  0 if no women can vote
#'
#'  1 women are qualified on narrower basis than males Examples: (a) in England
#'  between 1918 and 1927 males were qualified at the age of 20, females at 25.
#'  (b) in Canada between 1917 and 1920 the vote was given only to relatives of
#'  military. (c) in some countries women voted only in some regions. Note that
#'  if females vote in municipal elections, we do not include it since the codes
#'  refer only to national elections.
#'
#'  2 women are qualified on the same basis as males.
#'
#'  Auxiliary codes: -1 More than one constitution, any other kind of political
#'  chaos that makes the electoral rules inoperative. For years of foreign
#'  occupation we either set as missing or extend the restriction in effect
#'  before the occupation. -2 Family representation (Bhutan).}
#'
#'  \item{first_digit}{The first digit of \code{f}.}
#'
#'  \item{second_digit}{The second digit of \code{f}.}
#'
#'  \item{ext_type}{Type of franchise extension during a particular year. Coded
#'  as: -1 if contraction 0 if no extension 1 if suffrage was extended by class
#'  (that is, the first digit of \code{f} increased) 2 if suffrage was extended
#'  by gender (that is, the second digit of \code{f} increased) 3 if suffrage
#'  was extended both by class and gender (that is, both digits increased).
#'
#'  Notes: Cases in which franchise changed from f>0 to f=0, whether because
#'  there was no constitution or the new constitution did not provide for
#'  elections are not coded as contractions. There are cases in which new
#'  franchise provisions are adopted but do not enter in force in the subsequent
#'  election. An example is Sweden, which adopted universal suffrage in 1919 but
#'  did not apply it in the election of 1920, only in 1921. In such cases
#'  \code{ext_type} is coded for the year of election when the new provision was
#'  applied. *** How is it coded if (1) The country/dependency existed but had
#'  no franchise, (2) The country is new but had franchise as a dependency or a
#'  part?}
#'
#'  \item{oth_exclusions}{Captures exclusions not accounted for under \code{f}.
#'  Coded as follows: 0 None other (all restrictions are accounted for under
#'  \code{f}).
#'
#'  1 By ethnicity (some ethnic groups are excluded).
#'
#'  2 By territory (people living in some regions cannot vote).
#'
#'  3 By religion (only adherents of a particular religion(s) can vote).
#'
#'  4 By politics (Individuals sympathizing with some political parties or
#'  ideologies are excluded. This code refers only to persons, hence it does not
#'  cover cases when political parties are banned.). Includes the language in
#'  which suffrage is determined by moral character.
#'
#'  5 Slaves are excluded.
#'
#'  6 Military personnel or police is excluded.
#'
#'  7 Priests or nuns are excluded.
#'
#'  8 Propertied are excluded (as in Mongolia, USSR 1918).
#'
#'  Note: When more than one exclusion applies, all are listed as consecutive
#'  digits. For example, if 5, 6, and 7 applies, we code exclusions as 567.}
#'
#'  \item{franchise_age}{Age at which those otherwise qualified to vote can
#'  exercise this right. Whenever age thresholds are different for different
#'  groups, lowest age is coded, unless the group which can vote at an earlier
#'  age is very small, say holders of Legion d'Honneur in post-1946 France.}
#'
#'  \item{secret}{Secrecy of the vote in legislative elections. 0 Open, public 1
#'  Secret 2 Secret optional 3 Public for some, secret for others. Note: There
#'  were few observation coded as 2 or 3 and they have been collapsed with 1 in
#'  the data file. The original data do exist.}
#'
#'  \item{compulsory}{Refers to voting any national level elections. 0 Optional
#'  1 Compulsory}
#'
#'  \item{presdirect}{Mode of election of the president in popular elections. 0
#'  Indirect. The president is chosen by electors, elected specifically for the
#'  purpose of selecting the president (not by the parliament). 1 Direct 2 Some
#'  voters vote directly, some indirectly, depending on individual
#'  characteristics 3 Some voters vote directly, some indirectly, depending on
#'  collective characteristics (i.e. territory)
#'
#'  Note: Cases in which the constitution provides that the president is elected
#'  by the legislature, including those in which the legislature elects only if
#'  none of the candidates obtains some minimum threshold of votes, are coded
#'  according to the provisions concerning popular elections, that is, such
#'  provisions do not make the mode of election indirect. There were few
#'  observation coded as 2 or 3 and they have been collapsed as 2 in the data
#'  file. The original data do exist.}
#'
#'  \item{legdirect}{Mode of election of the legislature. Refers only to the
#'  lower house. 0 Indirect 1 Direct 2 Some voters vote directly, some
#'  indirectly, depending on individual characteristics 3 Some voters vote
#'  directly, some indirectly, depending on collective characteristics (i.e.
#'  territory)
#'
#'  Note: There were few observation coded as 2 or 3 and they have been
#'  collapsed with 1 in the data file. The original data do exist.}
#'
#'  \item{presterm}{Constitutionally prescribed duration of the chief
#'  executive's tenure (in years). -1 if no term is specified 0 if life term
#'
#'  Note: If the term of the president is extended while an incumbent is in
#'  office, it changes in the year it was extended.}
#'
#'  \item{legterm}{Constitutionally prescribed duration of the legislative term
#'  in the lower house (in years). -1 if no term is specified 0 if life term
#'  Note: If the term of the legislature is extended while incumbents are in
#'  office, it changes the year it was extended.}
#'
#'  \item{presterm_limit}{Term limits for presidents. -1 if no term is specified
#'  0 unlimited number of consecutive terms 1 out after 1 term, can never come
#'  back 2 out after 1 term, can come back 3 out after more than one term, can
#'  come back 4 out after more than one term, can never come back.}}
#'
#'@section Regime:
#'
#'  \describe{
#'
#'  \item{exselec}{Dummy for the chief executive having been elected (whether
#'  directly or indirectly; indirectly means elected by people who have been
#'  elected; if indirectly elected, election by a partly elected body counts as
#'  being elected). In cases of death, constitutional successors of elected
#'  chief executives are coded as elected. Coded is each year of the current
#'  chief executive. Prime ministers are always coded as elected as long as the
#'  legislature is open (\code{openl}=1). If there is a president and a prime
#'  minister, \code{exselec}=1 only if both have been elected. If a chief
#'  executive is elected, overthrown by force, and then reinstated, coded as of
#'  the year of reinstatement.}
#'
#'  \item{legselec}{Dummy for the lower house of the legislature having been at
#'  least partly elected. (Coded as 1 if \code{openl}=1 and
#'  \code{leg_composition}= 5)}
#'
#'  \item{openl}{A dummy variable for the existence of a legislature. A
#'  legislature is a body that (1) issues at least some laws and (2) does not
#'  perform executive functions. Legislative Councils which advise the ruler but
#'  have no authority to proclaim laws are not considered legislatures. Military
#'  Juntas that issue legal acts but also perform executive functions are
#'  disqualified by the second criterion.}
#'
#'  \item{legparty}{Number of parties in the legislature. By "party" we take
#'  here any recognizable, named grouping, regardless whether and how they
#'  appeared in elections. This variable is coded regardless whether the
#'  legislature was elected or appointed. -1 if no legislature, 0 if none
#'  (including cases where parties are officially banned), 1 if one (including
#'  cases where other parties are officially banned), 2 if more.
#'
#'  Note: During the early period candidates typically competed in elections on
#'  an individual basis, without any kind of centralized party organizations or
#'  shared programs. Within legislatures, however, they often coalesced into
#'  groups, currents, factions, "sentiments," etc. Hence, subjective judgments
#'  are inevitable in coding this variable. Our rule of thumb was to code as
#'  parties any kind of groups that bore a label that survived over two
#'  consecutive legislatures. This was true in several countries of "Liberals"
#'  and "Conservatives." In other countries, notably France between 1815 and
#'  1848, however, the divisive issues, the parliamentary groups, and their
#'  labels changed frequently, and such cases are coded as "none." A legislature
#'  consisting of one party and independents is coded as one party.}
#'
#'  \item{opposition}{This variable is intended to indicate whether the
#'  institutional system allows at least some political pluralism. 1 if as of
#'  December 31 there is a legislature that was at least in part elected by
#'  voters facing more than one choice.
#'
#'  Note: Even if the legislature consisted of multiple parties but in the
#'  election all the candidates were presented to voters on the same, single
#'  list, we consider that voters had no choice. If there was only one party
#'  while some candidates ran as independents, we also regard it as a situation
#'  in which there was no partisan pluralism. If parties were banned and
#'  everyone ran as independent, there is no opposition (see Swaziland). If,
#'  however, parties were not banned and everyone ran without party labels, then
#'  we regard this situation as pluralistic. The idea is that situations in
#'  which elections are non-partisan, frequent during the early period, and
#'  situations in which more than one party competes in elections represent
#'  political pluralism, while monopoly of one party is a political monopoly.
#'
#'  In rare cases it is possible for opposition to exist even if the legislative
#'  election was not competitive. This occurs if a competitive presidential
#'  election occurred during the term of a non-competitively elected legislature
#'  (for example, El Salvador in 1977).
#'
#'  0 if the above is not true OR, only in presidential systems, if it is true
#'  BUT either the chief executive is not elected OR was elected unopposed
#'  (unless there was consensus among all parties; as in Chile 1891, 1910).
#'
#'  -1 if the legislature was closed at some point during the year and the state
#'  as of December 31 is unclear.
#'
#'  Note: If all we know is that the elected president run unopposed, the code
#'  is 0.} }
#'
#'@section Elections:
#'
#'  \describe{
#'
#'  \item{legelec}{Number of legislative elections that took place during the
#'  year. It includes general elections, regular elections in which only a part
#'  of the legislature is renewed, and annulled elections, but not by-elections
#'  to replace representatives who did not continue in office. Elections to the
#'  upper house only and elections to constitutional assemblies that do not have
#'  ordinary legislative powers are excluded. Only first rounds are counted.
#'  Note: In several cases constituent assemblies usurped ordinary legislative
#'  powers. In such cases elections are counted.}
#'
#'  \item{preselec}{Number of presidential elections that took place during the
#'  year. In pure presidential systems (in which there is no prime minister),
#'  counted are any kind of elections, direct and indirect, in the latter case
#'  regardless of the constitutional status of the electing assembly. Second
#'  rounds are not counted, while annulled elections are counted. Presidential
#'  plebiscites are included.
#'
#'  Note: The information about presidential elections in systems in which the
#'  president is elected by the parliament is unsystematic and fragmentary.
#'  Elections in systems in which the president is the head of the government,
#'  not only of state, can be identified by setting \code{head_title}=2 (see
#'  below for the definition of \code{head_title}). Presidential elections in
#'  systems in which the head of the government is the prime minister but
#'  presidents are elected by popular vote can be identified by setting
#'  \code{head_title}=1 and \code{presdirect}=1.}
#'
#'  \item{eligible_pr}{(For details, see Appendix 2.) Ratio of the number of
#'  people eligible to vote to the total population. Coded only for years of
#'  legislative or presidential elections. For an explanation of how this
#'  variable was constructed and the sources, see Appendix 2. Note: In some
#'  cases, registration is automatic, so that the number of registered voters is
#'  equal to the number of eligible voters. Whenever they differ and a series
#'  for registered is available, this is the series used. If it is not
#'  available, numbers of eligible voters are used. Finally, in several
#'  instances we do not know whether the numbers refer to registered or eligible
#'  voters. When elections were indirect, this is the proportion of last-stage
#'  electors to the population.}
#'
#'  \item{legpart_pr}{(For details, see Appendix 2.) Ratio of voters in
#'  legislative elections to the total population. Coded only for years of
#'  legislative elections. If elections are indirect, only the number of primary
#'  voters is used.}
#'
#'  \item{prespart_pr}{ (For details, see Appendix 2.) Ratio of voters in
#'  presidential elections to the total population. Coded only for years of
#'  presidential elections. If elections are indirect, only the number of
#'  primary voters is used. From this information, one can also make turnout =
#'  *part/eligible.
#'
#'  Note: This seems to be a more consistent way of getting turnout that the
#'  numbers offered in the sources.}
#'
#'  \item{turnout_leg}{Turnout in legislative elections, according to formula
#'  above. Only available for years with legislative elections.}
#'
#'  \item{turnout_pres}{Turnout in presidential elections, according to formula
#'  above. Only available for years with presidential elections. There are some
#'  obvious problems here - some turnouts exceed 100 of eligible voters.}
#'
#'  \item{participation_f}{Eligible voters (by franchise) as percentage of the
#'  population. (Undocumented in original codebook. There are some obvious
#'  problems here - the variable exceeds 100 for some cases).}
#'
#'  \item{elecparty_leg}{Number of lists presented to voters in legislative
#'  elections. -1 if no legislature or estate parliament or fully appointed
#'  legislature 0 if none, 1 of one, 2 if more.
#'
#'  Note: Several parties offering a joint single list to the voters, "fronts,"
#'  are counted as 1. The coding is based on the number of lists in an election,
#'  not on the number of parties in the legislature. If there is more than one
#'  election during a year, the last one is coded. If all candidates run as
#'  independents coded as 0.}
#'
#'  \item{elecparty_pres}{Number of candidates presented to voters in
#'  presidential elections. 0 if one, 1 if more. Note: Applies whether the
#'  president is directly or indirectly elected. If there are two rounds, the
#'  first one is coded. If there is more than one election during a year, the
#'  last one is coded.}
#'
#'  \item{leg_scheduled}{The year in which a legislative election should occur
#'  if the legislature serves a complete term. Obtained by adding \code{legterm}
#'  to the year in the which the previous legislative election took place.
#'  Because we code the state at the end of a year, \code{leg_scheduled} for a
#'  year in which in election occurred specifies the date of the next scheduled
#'  election.}
#'
#'  \item{pres_scheduled}{The year in which a presidential election should
#'  occur. Obtained by adding \code{presterm} to the year in the which the
#'  previous presidential election took place. Because we code the state at the
#'  end of a year, \code{pres_scheduled} for a year in which in election
#'  occurred specifies the date of the next scheduled election.}
#'
#'  \item{salt_elections}{Number of elections in which the office of the chief
#'  executive was at stake during a year. Counted here are legislative elections
#'  if the chief executive is a prime minister or presidential elections if the
#'  chief executive is the president. Coded according to \code{head_title} (see
#'  below).
#'
#'  Note: There are cases in which there is a prime minister (or equivalent) and
#'  legislative elections but the prime minister is appointed by a monarch
#'  independently of the result of the election, that is, the government can
#'  exist even if it is opposed by a majority of the parliament. One could think
#'  that in cases of such elections the office of the chief executive is not at
#'  stake. It turns out, however, that constitutions do not predict what happens
#'  in the aftermath of elections (Przeworski, Asadurian, Bolhken Thomas, 2011):
#'  sometimes the monarchs ignore the electoral results but at times they
#'  respect the results. Hence, it is not possible to decide ex ante whether the
#'  office of the chief executive was or was not at stake in a particular
#'  election. Except for one flagrant case, that of ???, all legislative
#'  elections in monarchies are coded as \code{salt_elections}.}
#'
#'  \item{result}{(For details, see Appendix 1.) An alphabetic string that
#'  describes how the current incumbent assumed office, indicates whether the
#'  incumbent run for office, and whether the incumbent won or lost, where the
#'  incumbent can be a person, a party, or a hand-picked successor.}
#'
#'  \item{sequence}{(For details, see Appendix 1.) An alphabetic string that
#'  describes the sequence of events in the election and its aftermath. The
#'  first field is the \code{result}, followed by a code indicating the
#'  institutional status of each subsequent chief executive, until someone holds
#'  office for at least one year or until the next election, whichever comes
#'  first.}
#'
#'  \item{lost}{Dummy indicating that the incumbent party or non-partisan
#'  incumbent person ran and lost an election. Coded as -1 if
#'  \code{did_not_run}=1. (\code{did_not_run} is not available in this
#'  dataset.)}
#'
#'  \item{salterel}{(Mnemonic for Strong ALTErnation resulting from an ELection)
#'  Indicates whether partisan control over the chief executive office changed
#'  as a consequence of an election. \code{salterel} is dated in the year in
#'  which the relevant election occurred, not the year new government assumed
#'  office. Hence, the first alternation in history, in the United States, is
#'  coded as of 1800, even though the inauguration occurred in 1801. It is left
#'  as missing in years without the relevant elections. Coded as follows:
#'
#'  1 If the party and the person of the chief executive changes as a result of
#'  an election or, where the chief executive is a monarch, the head of
#'  government changes along partisan lines as a result on an election or the
#'  entire cabinet changes when there is no prime minister. Also applies if
#'  there are no parties but a manifest government candidate, who loses and
#'  yields office. Coded as 1 only if the outgoing chief executive was elected.
#'  Hence, alternation can occur only if the current election did not follow a
#'  coup.
#'
#'  0 If (1) The party or the person of the chief executive wins the election.
#'  (2) There are two elections during the same year, such that the incumbent
#'  party loses the first but wins the second (Iceland in 1959). (3) The
#'  incumbent or its successor (party or person), who is not a caretaker chief
#'  executive, does not run. (4) The incumbent and rival parties form a
#'  coalition. (5) The incumbent loses and remains in office. (6) Neither the
#'  winner nor the loser holds office after an election.
#'
#'  -1 If there are elections but no discernible parties or two successive
#'  independents or the change is between a non-partisan (caretaker, technical,
#'  expert) government and a partisan one, unless the only role of a
#'  non-partisan government was to ensure impartial administration of an
#'  election,
#'
#'  -2 If an election resulted in the defeat of an incumbent (party or person,
#'  previously elected or not) and the winner assumed office but only after
#'  someone other than the winner occupied it (except for a few cases in which
#'  the constitution provides that an interim non-partisan caretaker should
#'  occupy it between the election and the inauguration).
#'
#'  Note: Alternations that result from a previous agreement between parties
#'  count as alternations. Information about the partisan composition of
#'  coalition governments is frequently not available. Hence, \code{salterel} is
#'  coded as 1 even if the new chief executive was a member of an outgoing
#'  coalition government, as long as he is a member of a different party. The
#'  result is a bias in favor of counting alternations.} }
#'
#'@section Other Events:
#'
#'  \describe{
#'
#'  \item{dissolution}{Counts the number of times the lower house of the
#'  legislature was dissolved in a particular year. Included as dissolutions are
#'  (1) unconstitutional closures of the legislature and (2) early
#'  constitutional closures. Dissolutions that occur as a formality at the end
#'  of the term of legislature are not coded but early dissolutions are. Coded
#'  -1 if there was no legislature to dissolve.
#'
#'  Note: Dissolutions are early if they occur at least one full year before the
#'  next regularly scheduled election. If an election occurred in year t and the
#'  legislative term is k years, then a dissolution is counted if it occurred in
#'  $t <= year <= t+k_2$: For the 22 OECD countries during the post-1945 period,
#'  dissolutions are coded as early if they occurred more than 12 months before
#'  the end of the legislative term (based on Maravall 2007). Note that this
#'  variable can assume a value of 1 even if \code{dissolution_power}=0, because
#'  dissolutions occur when they are not unilateral and sometimes simply
#'  illegal.}
#'
#'  \item{coups}{Number of successful coups d'etat during a given year.
#'
#'  Note: A coup is any event resulting in an irregular removal or resignation
#'  of the chief executive that involves a violent action or an explicit threat
#'  of resorting to it, by an armed organization. Assassinations of the chief
#'  executive are not considered coups unless the group responsible for the
#'  action takes over the office. Whenever the rules about the replacement of
#'  the chief executive are either not codified or unclear, the force criterion
#'  prevails. The definition excludes resignations under pressure of popular
#'  mobilization if no armed group (legal or not) is involved (resignation of
#'  Carlos Mesa in Bolivia). Similarly, irregular transfers of power among
#'  civilians that do not entail force (such as changes of communist leaders)
#'  are not considered coups. We place no restriction on whether the armed group
#'  causing the replacement is domestic or foreign, nor on the identity of the
#'  incoming ruler. In particular, any military intervention of foreign powers
#'  producing a replacement of the chief executive is coded as a coup, even if
#'  they restore a previously elected ruler (French troops overthrowing Bokassa
#'  in Central African Republic). As a general rule, any replacement of a
#'  military chief executive by another military man is considered a coup,
#'  unless the succession occurred according to pre-established rules
#'  (Figueirido replacing Geisel in Brazil). Specifically, resignations of the
#'  military chief executive caused by votes of non-confidence of irregular
#'  military bodies are considered coups (Galtieri replacing Viola in
#'  Argentina). The variable is compatible to other conventional sources such as
#'  Powell and Thyne (2010), Marshall and Marshall (2009), and Svolik and
#'  Akcinaroglu (2010) for the period 1950-2008, with some difference in the
#'  interpretation of specific events. Information for the pre-1950 era is more
#'  scarce and therefore the coding may be less reliable.}
#'
#'  \item{autocoups}{A dummy variable for any instance in which the ruler
#'  illegally changes constitutional rules to reduce the chances of the
#'  opposition to oppose policies in the legislature or to win elections. Note:
#'  The definition comprises any event in which the incumbent illegally closes
#'  the legislature the OR closes the legislature legally AND changes electoral
#'  rules (including banning parties) or adopts laws that extend his tenure
#'  (Philippines in 1972).} }
#'
#'@section Leaders:
#'
#'  \describe{
#'
#'  \item{head_title}{Title of the chief executive. This variable identifies the
#'  formal position the occupant of which is the head of the government. Note
#'  that this variable does not necessarily identify the effective rulers, who
#'  need not occupy government positions. Most general (first) secretaries of
#'  single ruling parties did not, while some rulers who assumed idiosyncratic
#'  titles ("Dictator" "Guardian of Faith," "The Leader") entrusted the
#'  operation of the government to their delegates. Coded as follows:
#'
#'  -1 if it is unclear who the chief executive is or if the country is occupied
#'  by a foreign power,
#'
#'  0 if the monarch assumes directly the direction of the government,
#'
#'  1 if the head of government can be removed by the parliament under "good
#'  behavior,"
#'
#'  2 if the head of government cannot be removed by the parliament or if the
#'  president can remove a prime minister, who is the nominal head of
#'  government, independently of the parliament,
#'
#'  4 if collective executive,
#'
#'  5 if other.
#'
#'  This variable is generated from \code{title_ce} by introducing the following
#'  modifications: (1) If the constitutional status of the effective chief
#'  executive is unclear but there is someone who holds the title of prime
#'  minister or president, coded respectively as 1 or 2. (2) If the nominal
#'  chief executive is the monarch, coded as 1 unless the monarch occupies the
#'  position of prime minister. (3) In cases in which there is both a president
#'  and a prime minister (\code{title_ce}=3), coded as 1 if the government can
#'  be removed by the legislature and cannot be unilaterally removed by the
#'  president, coded as 2 if either of these conditions is false. (4) In cases
#'  in which the executive is nominally plural but has a clear leader and in
#'  cases in which the nominal ruler bears an unconventional title coded as 1 if
#'  there is a prime minister and as 2 otherwise.
#'
#'  Note: There are cases in which the constitution provides that the head of
#'  the government is a prime minister but the constitution is not in force and
#'  the de facto chief executive is the president. There are also systems that
#'  appear to be parliamentary in that the head of government is a prime
#'  minister who can be removed by the parliament but in which he or she can be
#'  also removed by the president without the consent of the parliament. This is
#'  true, for example, of the 2004 Constitution of Central African Republic,
#'  which states that "The President of the Republic is the Chief of the
#'  Executive. The Prime Minister is the Chief of Government" (Article 21) and
#'  gives the President the power to remove the Prime Minister unilaterally
#'  (Article 40). Such cases are coded as \code{head_title}=2.}
#'
#'  \item{heads}{Number of distinct spells of chief executives during a year.
#'  "Spell" refers to a continuous tenure of a person in an office. If the same
#'  person holds office more than once during a particular year, with someone
#'  else serving in between, each tenure of the same person is counted
#'  separately. Juntas and collective presidencies that govern collectively are
#'  counted as one, but rotating presidencies are counted separately. Bearers of
#'  provisional titles are included as well as acting occupants of existing
#'  offices.
#'
#'  Note: (1) If there are several governments in different regions and there is
#'  no national one, the whole period is coded as -1. (2) Juntas are counted as
#'  one head. (3) Acting heads are counted in cases of time overlap between the
#'  nominal head and the acting head; in such cases, the nominal head is not
#'  counted. Includes regents. (4) Governments in rebellion are not counted. (5)
#'  In some cases an office is not occupied during some part of a year. Such
#'  vacancies are not counted.}
#'
#'  \item{head_age}{The number of complete years the current head has been in
#'  office.}
#'
#'  \item{term}{This variable indicates whether the legislative or the
#'  presidential term was completed according to previously specified rules.
#'  Note that a particular term can be only completed or not: this variable
#'  codes the entire term, not the years of particular chief executives.
#'  Right-censored spells are coded as -1. Term is treated differently for
#'  different types of heads:
#'
#'  For presidents:
#'
#'  1 For each year of a term during which (i) the chief executive is elected or
#'  appointed to a previously specified term AND completes the term OR (ii) the
#'  chief executive elected or appointed to a previously specified term dies of
#'  natural causes or resigns for reasons of health AND is succeeded by the
#'  constitutional successor who then completes the term OR (iii) an early
#'  election is held early or the term in office is reduced but completed.
#'
#'  0 For each year of a term during which at least one of the following
#'  conditions holds: (i) the incumbent extends the current term in office
#'  (changes in term limits do not count as extensions of the current term) (ii)
#'  the incumbent is a provisional, acting, or interim chief executive (iii) the
#'  incumbent serves a term that had not been previously specified (iv) the
#'  chief executive is deposed or impeached or assassinated (v) the incumbent
#'  resigns for reasons other than poor health (vi) the incumbent resigns or is
#'  briefly ousted and then comes back to finish the term (vii) the incumbent is
#'  elected or appointed for a new term before finishing the current term and
#'  the new term overlaps with the current one (viii) the term is specifically
#'  designed for a particular person (for example, Pinochet in Chile).
#'
#'  With regard to prime ministers the relevant term is the \code{legterm}:
#'
#'  1 For each year of a legislative term during which all heads of governments
#'  were replaced according to constitutional rules while the parliament
#'  remained open.
#'
#'  0 otherwise. This includes cases in which the prime minister was overthrown
#'  (including assassinated) or imposed by force while the parliament was open
#'  as well as cases in which the parliament was constitutionally dissolved and
#'  the prime minister was replaced while the parliament remained dissolved. It
#'  also includes cases in which the current legislature extended its term and
#'  those in which the parliament was dissolved unconstitutionally. Note: It is
#'  possible for term to be 0 and the last digit of "sequence" to be "E" if the
#'  incumbent extended the term of office while in office and lasted until the
#'  election for the longer term (example is Honduras in 1847).}
#'
#'  \item{first_term}{Year during which the first executive completed a
#'  previously specified constitutional term, whether before or after
#'  independence. If a new unit emerged from a breakdown or unification of
#'  previously existing units, first term is coded separately for this new unit.
#'  Coded according to the rules for \code{term}. For prime ministers, first
#'  term is the last year of the term of the first legislature during which
#'  succession of prime ministers followed constitutional rules. The first term
#'  counts if the legislature was constitutionally dissolved and there was an
#'  early election. Country invariant. Right-censored spells are coded as -1.
#'  Note: First term has to be coded separately from term for the following
#'  reason. Suppose that someone assumed office in year t for a k term period.
#'  He completed the term by August 1 of the year t + k. Hence,
#'  \code{first_term} = t + k. But if the ruler who assumed on August 1, t + k,
#'  did not finish his term, then \code{term}=0 in t + k.}
#'
#'  \item{mentry}{Mode of entry of the last head (chief executive as given by
#'  \code{head_title}) who entered during a particular year. Coded for years in
#'  which an entry occurred (\code{heads}>1 or \code{heads}=1 and the particular
#'  position either did not exist or was not occupied previously).
#'
#'  0 if by force (includes any replacement of a military chief executive by
#'  another military, unless the succession occurred according to
#'  pre-established rules),
#'
#'  1 if openly imposed by a foreign power (includes cases when someone is
#'  elected, overthrown by a coup, and reinstated by an intervention of a
#'  foreign power; does not include clandestine actions, foreign sponsored
#'  coups, foreign pressures, and the like),
#'
#'  2 if selected by any not popularly elected body (e.g., by a self-constituted
#'  junta, a single ruling party) or if self-appointed (even if followed by an
#'  election), unless self-appointment is to the position of prime minister and
#'  the legislature is open,
#'
#'  3 if elected (directly or indirectly but at entry) or if constitutional
#'  successor (say vice-president assuming on the death of the president). Note
#'  that under parliamentarism elected refers to being approved by the
#'  parliament, even if the person was not elected by voters. Prime ministers
#'  appointed by monarchs are coded here as long as the legislature is open and
#'  there is no single party. Includes monarchs who enter by plebiscite or
#'  election by legislature
#'
#'  4 if selected by a constitutionally empowered body but not according to the
#'  rules of succession (say the first vice-president is skipped in favor of
#'  second vice-president).
#'
#'  Note: If there are more than two chief executives during a particular year,
#'  the information about all but the one serving as of December 31 is lost.
#'  This also implies that the mode of entry can equal 3 even if there are coups
#'  during the particular year. What is coded here is entry of a person to/from
#'  a particular office. Hence, if the title of the chief executive changed
#'  during a particular year, say from prime minister to president, an entry to
#'  the new position will be recorded even if the person remains the same
#'  (\code{heads}=1). Note that it is possible that \code{heads}=1 but
#'  \code{mentry} is recorded: this occurs when an office is newly created or if
#'  it was not occupied during some period.}
#'
#'  \item{mexit}{Mode of exit of the first head who exited during a particular
#'  year. Coded only for years in which an exit occurred (\code{heads}>1 or if
#'  \code{heads}=1 and the position was abolished or was not occupied as of the
#'  end of the year).
#'
#'  0 if by force (includes any replacement of a military chief executive by
#'  another military, unless the succession occurred according to
#'  pre-established rules, as well as assassinations, regardless of their
#'  motives),
#'
#'  1 if deposed by a foreign power (indicated by the presence of foreign
#'  military force on the territory; does not include clandestine actions,
#'  foreign sponsored coups, foreign pressures, and the like),
#'
#'  2 if removed by some not popularly elected body (e.g., single ruling party),
#'
#'  3 if lost an election or subject to term limits or lost confidence or
#'  resigned for any reasons, followed by a constitutional successor, or other
#'  good reasons, including peaceful transitions to democracy and removal by a
#'  monarch as long as the legislature is open and there is no single party,
#'
#'  4 if removed by a constitutionally empowered body but not according to
#'  rules,
#'
#'  -1 if died in office (and it is not generally known that the incumbent was
#'  assassinated).
#'
#'
#'  Note: If there are more than two chief executives during a particular year,
#'  the information about all but the one serving as of January 1 is lost. This
#'  also implies that the mode of exit can equal 3 even if there are coups
#'  during the particular year. Note that it is possible that \code{heads}=1 but
#'  \code{mexit} is recorded: this occurs when an office is abolished or becomes
#'  temporarily vacant.
#'
#'  Note about \code{mentry} and \code{mexit}: Direct information about entry
#'  and exit is often difficult to obtain for prime ministers. Because
#'  constitutional changes of prime ministers are routine events, they do not
#'  attract attention of historians. Non-constitutional changes, however,
#'  whether prime ministers being removed by coups or by dissolutions of the
#'  parliament by monarchs, are typically mentioned by historians. In the cases
#'  where such information is not provided by historical sources, we assume that
#'  the entry and the exit were constitutional.} }
#'
#'@section Constructed variables in the original dataset:
#'
#'  \describe{
#'
#'  \item{electoral_age}{Number of years in a period during which elections were
#'  held regularly without being interrupted by any of the following: (1) a coup
#'  or an autocoup, (2) an unconstitutional usurpation of the office of the
#'  chief executive (\code{const_inforce}=0), (3) an occupation by a foreign
#'  power (\code{occupied}=1). Elections are considered to be held regularly if
#'  the period between two successive elections does not exceed the term in
#'  office plus one year, except for war periods during which elections were
#'  postponed. At least two consecutive elections must occur for electoral age
#'  to be counted (the first \code{term} must be completed and the subsequent
#'  election must take place, even if it is immediately followed by an
#'  interruption). \code{electoral_age} is coded as missing if these conditions
#'  are not satisfied, that is, during periods in which no electoral periods
#'  satisfy the above conditions.}
#'
#'  \item{republic_age}{Number of years in a period during which elections were
#'  held regularly without being interrupted with some modicum of the opposition
#'  (\code{opposition}=1). Coded as missing if \code{electoral_age} is missing
#'  or \code{electoral_age} is not missing but \code{opposition}=0. Counted from
#'  the election after which the person who won the first pluralistic election
#'  completed a full term and opposition was not suppressed during this term.}
#'
#'  \item{max_republic_age}{Maximum years as a republic. (Constructed?)}
#'
#'  \item{salt_e_scheduled}{Year in which an election is scheduled where the
#'  office of chief executive is at stake. (Constructed? Not documented in
#'  codebook).}
#'
#'  \item{pre_coups}{For a year where an election happens where the chief
#'  executive is at stake (\code{salt_elections} > 0), the number of successful
#'  coups before the election in that year. (Constructed? Not documented in
#'  codebook).}
#'
#'  \item{post_coups}{For a year where an election happens where the chief
#'  executive is at stake (\code{salt_elections} > 0), the number of successful
#'  coups after the election in that year. (Constructed? Not documented in
#'  codebook).}
#'
#'  \item{term_length}{Duration in office of chief executive? Not documented in
#'  codebook.}
#'
#'  \item{first_election}{Year of first election? Not documented in codebook.} }
#'
#'@section Other calculated variables added by this package:
#'
#'  Note - the instructions in the original codebook for calculating these
#'  variables are not always clear. Errors may have resulted.
#'
#'  \describe{
#'
#'  \item{republic}{Whether the country is a republic during the year.
#'  (\code{republic_age} is not missing). Calculated from \code{republic_age}.}
#'
#'  \item{republican_period}{Identifier for periods of republican and
#'  non-republican rule in a given country. Increases with each change between
#'  republic and non-republic.}
#'
#'  \item{cum_salterel}{Cumulative number of strong alternations in a republican
#'  period. Calculated from \code{salterel}.}
#'
#'  \item{cum_term}{Cumulative years in which a term is completed. Calculated
#'  from the cumulative sum of \code{term} for each \code{republican_period} in
#'  a country.}
#'
#'  \item{democracy}{Whether the country is a democracy according to the
#'  formula: elections are held regularly without being interrupted, with some
#'  modicum of the opposition (\code{republic_age} is not missing), following an
#'  alternation in office (\code{salterel}=1) after which the winner completed a
#'  full term. Includes periods before independence.}
#'
#'  \item{democracy2}{Whether the country is a democracy according to the
#'  formula: elections are held regularly without being interrupted, with some
#'  modicum of the opposition (\code{republic_age} is not missing), following an
#'  alternation in office (\code{salterel}=1) after which the winner completed a
#'  full term. Does not include periods before independence.}
#'
#'  \item{democracy_age}{Number of years of democracy2.}
#'
#'  \item{democratic_period}{Identifier for periods of full democracy
#'  (\code{democracy2 = TRUE}) and non-democracy in a given country. Increases
#'  by 1 with each change in \code{democracy2}.}
#'
#'  \item{regime}{This variable is coded only for years following independence.
#'  It is missing before independence even if the variables on the bases of
#'  which it is created are not missing.
#'
#'  0 if \code{electoral_age} is missing. There are two distinct reasons why it
#'  may be missing: either elections are not held regularly or they are held but
#'  the winner does not complete a term in office or makes an autocoup.
#'  Elections are considered not to be held if (1) there is a constitution that
#'  specifies the length of term of the chief executive (or the legislature) and
#'  this period is exceeded by more than one year, except for war years, (2)
#'  there is no constitution or the constitution does not provide for elections
#'  and no elections are held during this period.
#'
#'  1 if \code{electoral_age} is not missing and \code{opposition}=0 (or
#'  \code{republic_age} is missing). These are regimes in which elections are
#'  held regularly and the winners (or their constitutional successors) complete
#'  electoral terms but either elections are uncontested or there is one party
#'  and independents or parties are banned and everyone runs as independent.
#'  Note that if everyone runs as independents it is possible for the incumbent
#'  government to lose an election, as in Swaziland in 1993. It is also possible
#'  for the incumbent to lose if the regime had no opposition up to some time
#'  when a competitive election occurred but the winner did not complete a term,
#'  as in Honduras in 1852. Finally, incumbents can lose when \code{regime}=1 if
#'  the election was competitive but at the end of the year the opposition was
#'  suppressed, as in Panama in 1968.
#'
#'  2 if \code{republic_age} is not missing, that is if \code{electoral_age} is
#'  not missing and \code{opposition}=1.
#'
#'  3 if \code{democracy_age} is not missing.}
#'
#'  \item{regime_period}{Identifier for regime periods in a given country.
#'  Increases by 1 with each change in \code{regime}.}
#'
#'  }
#'
#'
#'@section Appendix 1. Coding Electoral Sequences:
#'
#'  The unit of observation is a sequence of events following an election in
#'  which the office of the chief executive is at stake. An event is an election
#'  and the subsequent occupancies of the chief executive office by different
#'  persons. These events are coded as answers to questions formulated below.
#'  The general syntax of coding consists of answers to who? and did (s)he?,
#'  separated by commas. For example, suppose an incumbent, who originally came
#'  into office by force, presented himself in the election, won, assumed and
#'  stayed in office for four years. This sequence of events is coded as FPY,
#'  IY, 4: FPY is a result of the election, IY records that the incumbent
#'  assumed office, and 4 that he stayed that many years.
#'
#'  Note that only events following the elections are coded, with the exception
#'  of the manner in which the current incumbent arrived in office. The first
#'  three digits summarize information about the election. They are recorded
#'  under the variable called result. \describe{
#'
#'  \item{result}{The first digit answers the question How did the incumbent
#'  come into office?
#'
#'  Note: The variable coding who is the chief executive is \code{head_title}.
#'  The incumbent is the ruler at the moment when the election occurs. It makes
#'  no difference how the current ruler assumed office: if there is an elected
#'  chief executive, he is overthrown, and the general who overthrows calls an
#'  election, the general is the incumbent. There are cases in which the
#'  constitution requires the incumbent ruler to resign some short time before
#'  the election and an institutionally designated person (say, chief justice)
#'  administers the election. In such cases and only in such cases the incumbent
#'  is the outgoing chief executive. If this is first election after
#'  independence and the colony was run by a governor general (or equivalent)
#'  without local prime minister, there is no incumbent. The monarch, even if
#'  (s)he is the nominal chief executive is not considered the incumbent unless
#'  (s)he occupies the office of the prime minister. The incumbent is the head
#'  of the government.
#'
#'  Answers to the first question are coded as:
#'
#'  F By overthrowing someone else (If the incumbent originally came into power
#'  by force but then had himself elected, he is elected. Plebiscites, however,
#'  do not count as elections.)
#'
#'  A Appointed by a non-elected body (If the king appoints a PM in the absence
#'  of parliament or some junta takes over and appoints someone, not necessarily
#'  one of its members, the chief executive)
#'
#'  E Elected (An incumbent who is a constitutional successor of an elected
#'  incumbent, say vice-president who assumes office upon the death of the
#'  president, inherits his status.)
#'
#'  T A non-partisan or caretaker incumbent appointed by an elected body
#'  (parliament, sometimes party leaders)
#'
#'  0 (zero) There was no incumbent.
#'
#'  The second digit answers the question, Did the incumbent run in the
#'  election? Coded as follows:
#'
#'  P if the incumbent person run (distinguished systematically only under
#'  presidentialism)
#'
#'  S if a successor run
#'
#'  N if the incumbent person did not run and there was no successor or if there
#'  was no incumbent (Includes cases coded as T in the first digit). Note:
#'  Successor is coded differently under presidentialism and parliamentarism.
#'  Under presidentialism, S is a different member of the same party or a
#'  candidate designated by the incumbent government. Under parliamentarism, as
#'  long as the party of the incumbent is present in the election it is always
#'  coded as S.
#'
#'  The final (third) digit answers the question Did the incumbent/successor
#'  win? The answers to this question can be Y yes N no ? cannot be determined
#'
#'  Note: If the challenger cannot form a government and the incumbent remains
#'  in office, then the incumbent won.
#'
#'  Some examples: TN,: the incumbent was a non-partisan caretaker, who did not
#'  run in the election. FPY: the incumbent came to office by force, ran in the
#'  election, and won. Note again that if someone who originally came into
#'  office by force had been elected once, he becomes an elected incumbent.
#'  Hence, F applies only to the first election after a coup. ESN: either a
#'  successor of a president (but not the incumbent president himself) or the
#'  party of the prime minister ran in the election and lost. ES?: either a
#'  successor of a president (but not the incumbent president himself) or the
#'  party of the prime minister ran in the election and it is not clear who won
#'  (no presidential candidate won a majority, which is required by the
#'  constitution, or no party won a majority of seats necessary to form the
#'  government).}
#'
#'  \item{sequence}{The variable called sequence consists of the result,
#'  followed by answers to the following pairs of questions, pairs separated by
#'  commas, with as many pairs as necessary, and a one-digit field indicating
#'  how long the last chief executive remained in office. The full syntax is
#'  thus: How did the incumbent get in? Did he run? (If he ran, did he win?),
#'  Who assumed office? Did he stay in power?, ... (as many times as necessary),
#'  How long? Who assumed office? In principle, everyone who assumed the office
#'  of the chief executive after an election, regardless for how long, is
#'  recorded, with the exception of constitutionally required caretakers. The
#'  answers to this question can be:
#'
#'  I incumbent (the person who was the incumbent at the moment of the election)
#'
#'  W a winner of the election (other than the incumbent person)
#'
#'  L a loser of the election who entered by force (or other non-constitutional
#'  means)
#'
#'  R a loser of the election who entered by constitutional means (this
#'  typically occurred when the king appointed a member of the losing party and
#'  the parliament was in session and did not or could not vote non-confidence)
#'
#'  M military (If they take power directly. If the king appoints or a
#'  parliament elects a military officer, they are not military here.)
#'
#'  A if a non-elected power (king, military, one party) imposes someone who is
#'  neither a winner or a loser (non-party, technical, caretaker. For example,
#'  King Boris of Bulgaria appointed a Russian general who was not a party
#'  member).
#'
#'  T if an elected power (parliament, party leaders, indirectly elected
#'  president) selects someone who is neither a winner or a loser (non-party,
#'  technical, caretaker. For example, the President of the Bolivian Senate was
#'  appointed by the Congress as caretaker when no one could muster majority
#'  required by the constitution.)
#'
#'  C if an institutional actor came in by force or by otherwise violating
#'  constitutional rules (For example, President Kasavubu removed PM Lumumba or
#'  the king assumed power by a coup).
#'
#'  ? cannot tell
#'
#'  Notes: The incumbent person remains I in the entire sequence that follows.
#'  Other members of his party are W if the incumbent's party won, L or R if it
#'  lost. Suppose the incumbent party lost, the king appointed a member of the
#'  incumbent party, then appointed the original incumbent until the next
#'  election. The sequence would be ESN,RN,IY,E Party splits are ignored. If
#'  there was an interim constitutional occupant between the election and
#'  inauguration, he is coded as T. For example, the sequence in which the
#'  incumbent did not run, an interim person took over, and then the winner
#'  assumed would be EN,TN,W. . .
#'
#'  The answer to the question Did he/she stay in power? can be: Y yes N no
#'
#'  Note: The answer entails a stopping rule. The sequence of events is
#'  considered to be completed if the current occupant survived in power at
#'  least one year and neither the incumbent, nor the winner, nor the loser
#'  returned to office before the next election or if the current occupant
#'  lasted less than one year but until the next election. Prime ministers of
#'  the same party and constitutional successors of elected presidents are
#'  considered here to be the same persons as their predecessors: if a president
#'  dies within a year and he is followed by the vice-president,
#'  constitutionally designated to take over, and if the total tenure of the two
#'  is at least one year, then the answer is Y. If the president is overthrown
#'  by force, however, then the answer concerning him is N and the
#'  vice-president, even if he is a constitutionally designated, is treated as a
#'  new occupant of office. Hence, "not return" means here that neither the
#'  original incumbent nor anyone who occupied office in the aftermath of the
#'  election returned to office before the next election.
#'
#'  If the answer is Y the last digit answers the question How long?, with two
#'  possible answers: Length of time, measured in full years if the current
#'  ruler did not last until the next election (but at least one full year) or
#'  if the next election did not take place within one year of the scheduled
#'  date and the current ruler lasted until the scheduled date. For example, if
#'  the next scheduled election was supposed to take place within 5 years and
#'  the first person who survived in office at least one year after the current
#'  election was deposed 3 years later, the answer is "3". In turn, if the next
#'  election did not occur until 12 years later and the first person who lasted
#'  one year survived the 5 years, the answer is "12," even if this person was
#'  deposed 7 years after assuming office. "E" if the current ruler lasted until
#'  the next election. If the answer is N coding continues, repeating answers to
#'  both questions as long as necessary. If there is more than one election
#'  during the same year, each election is coded as above with the sign j
#'  separating the elections. For example, if an elected incumbent run, won,
#'  lasted until the new election the same year, run again, and lost, the
#'  sequence is coded as ESY,IY,EjESN,WY,E.} }
#'
#'@section Caveats:
#'
#'  Caveats are many and some are consequential.
#'
#'  \describe{ \item{Missing data}{In principle, the data should cover all
#'  elections that selected chief executives in all countries that existed at
#'  any time after 1917, including periods before independence. There are good
#'  reasons to suspect that not all such elections are included: the historical
#'  record is simply absent for some countries during the early periods. The
#'  bias of inclusion is against early elections, particularly those in
#'  dependent territories.}
#'
#'  \item{Chief executives}{The elections that are coded are intended to be
#'  those which potentially determine the selection of the chief executive.
#'  Chief executives are presidents, directly or indirectly elected, who are
#'  heads of governments and cannot be dismissed by the legislature while in
#'  good conduct or prime ministers whenever governments serve at the discretion
#'  of the legislature. In systems in which presidents and prime ministers share
#'  executive prerogatives and prime ministers can be removed by the
#'  legislature, chief executives are prime ministers. Note that if a country
#'  changed from parliamentary to presidential system (or vice versa, which is
#'  less frequent), the incumbent is the occupant of the previous office. In
#'  terms of government formation, parliamentarism is a much more complex system
#'  than presidentialism. Tracing the individual prime ministers is often
#'  unfeasible. Hence, sequences are more accurate under presidentialism than
#'  under parliamentarism. A sequence ESY,WY,E under presidentialism states
#'  exactly that the incumbent person was not a candidate, that a successor of
#'  this person won the election, assumed office, and served until the next
#'  election. The same sequence under parliamentarism, however, may only
#'  indicate that the incumbent party run and won the election and one or more
#'  of its members (but not the incumbent prime minister) held office until the
#'  next election. To put it differently, a sequence ESY,WN,WN,WY,3 under
#'  presidentialism may be coded as only ESY,WY,3 under parliamentarism. Note
#'  that if the person who occupied office immediately after the election was
#'  the outgoing incumbent, these sequences would be coded respectively as
#'  EPY,IN,WN,WY,3 under presidentialism and as ESY,IN,WY,E under
#'  parliamentarism (even if WY may stand here for several prime ministers from
#'  the same party).}
#'
#'  \item{General}{Some elections constitute truly convoluted events and the
#'  exact sequence of events is often difficult to identify. Different
#'  historical sources frequently ignore different details, so that codes based
#'  on particular sources could be different. Moreover, the information is
#'  sometimes inconsistent, so that making sense of it is not always possible.
#'  One must suspect, therefore, that the coding contains errors.} }
#'
#'@section Other variables (undocumented in codebook):
#'
#'  \describe{ \item{popg}{Population growth?}
#'
#'  \item{unrest}{Unrest variable from Banks?}
#'
#'  \item{europe}{Dummy variable for Europe?}
#'
#'  \item{gdpcap}{Per capita GDP, probably from Maddison?}
#'
#'  \item{gdp_M2010}{GDP in 2010, in thousands of dollars? Probably from
#'  Maddison.}
#'
#'  \item{pop_M2010}{Population in 2010, in thousands? A number of population
#'  variables are mentioned in the codebook but not found in the dataset:
#'
#'  POP_C Population, current borders, in thousands. These data incorporate
#'  variations in population due to changes in geographical boundaries. It was
#'  constructed from COW2, Maddison, and GFD.
#'
#'  POP_C_FILL Based on POP_C but linearily interpolated whenever data were
#'  missing, except for war years.
#'
#'  POP20 Population 20 or over (in thousands). Calculated from Mitchell (2003)
#'
#'  FPOP20 Female population 20 or over (in thousands). Calculated from Mitchell
#'  (2003) MPOP20 Male population over 20 or over (in thousands). Calculated
#'  from Mitchell (2003)
#'
#'  PROPPOP20 Population 20 or over as a proportion of total population.
#'
#'  PROPFPOP20 Females 20 or over as a proportion of total population.
#'
#'  PROPMPOP20 Males 20 or over as a proportion of total population.}
#'
#'  \item{growth}{Growth rate, from Maddison? Undocumented in codebook.}
#'
#'  \item{civil_war}{Is the country embroiled in a civil war? (Undocumented,
#'  perhaps from COW?)}
#'
#'  \item{sidea}{Side A in war. Undocumented.}
#'
#'  \item{sideb}{Side B in war. Undocumented.}
#'
#'  \item{warname}{War name. Undocumented.}
#'
#'  }
#'
#'@template standard-variables
#'@references Caramani, Daniele. 2000. Elections in Western Europe since 1815:
#'  electoral results by constituencies. London: Macmillan. CD-ROM.
#'
#'  Elections Canada On-Line, \url{http://www.elections.ca}
#'
#'  Federal Election Commission, \url{http://www.fec.gov} (USA) Historical
#'  Statistics of the United States. Colonial times to 1957. Washington, DC: US
#'  Department of Commerce. Series Y 146-149.
#'
#'  Lambert, J. Amerique Latine, Presses Universitaires de France, 1968: 21-24.
#'
#'  Mitchell, B. R. 2003. International Historical Statistics: The Americas,
#'  17502000. Fifth edition. London: Palgrave MacMillan.
#'
#'  Mitchell, B. R. 2003. International Historical Statistics: Europe,
#'  1750-2000. Fifth edition. London: Palgrave MacMillan.
#'
#'  Mitchell, B. R. 2003. International Historical Statistics: Africa, Asia and
#'  Oceania, 1750-2000. Fourth edition. London: Palgrave MacMillan.
#'
#'  Nohlen, Dieter (ed.). 2005. Elections in the Americas. A data handbook,
#'  volume 1: North America, Central America, and the Caribbean. New York:
#'  Oxford University Press.
#'
#'  Nohlen, Dieter. Enciclopedia Electoral Latinoamericana y del Caribe,
#'  Instituto Americano de Derechos Humanos, Costa Rica: San Jose, 1993.
#'
#'  Nohlen, Dieter, Michael Krennerich, and Bernhard Thibaut (eds.). 1999.
#'  Elections in Africa: a data handbook. New York: Oxford University Press.
#'  Nohlen, Dieter, Florian Grotz, and Christof Hartmann (eds.). 2001. Elections
#'  in Asia and the Pacific: a data handbook. New York: Oxford University Press.
#'
#'  Nohlen, Dieter (editor). 2005. Elections in the Americas: A Data Handbook
#'  Volume 1: North America, Central America, and the Caribbean. New York:
#'  Oxford University Press.
#'
#'  Vanhanen, Tatu. The Polyarchy Dataset, Norwegian University of Science and
#'  Technology. \url{http://www.svt.ntnu.no/iss/data/vanhanen}
#'
#'  Historical Statistics Of The United States. Colonial Times To 1970.
#'  Washington, Dc: Us Department Of Commerce. Series Y 135-186.
#'
#'  Sources for additional data available on request.
#'
#'  Global Financial Data
#'
#'  The Correlates of War Project
#'
#'  Maddison, A. 2003. The World Economy: Historical Statistics, OECD
#'  Development Centre.
#'@family democracy
#'@family institutions
#'@source `r roxygen_cite("PIPE")`
"PIPE"


# Democracy Info Dataset --------------------------------------------------

#' Basic information about existing democracy measures
#'
#' This data frame contains some basic info about all the democracy measures I
#' know about.
#'
#' @section Variables:
#'
#'   \describe{
#'
#'   \item{dataset}{The basic name of the dataset. This usually matches the name
#'   of the dataset included in this package, except for datasets with more than
#'   one version (e.g., \code{gwf} matches \link{gwf_all},
#'   \link{gwf_all_extended}, \link{gwf_autocratic}, and
#'   \link{gwf_autocratic_extended}).}
#'
#'   \item{long_name}{Longer name of the dataset, or official name, if any.}
#'
#'   \item{main_democracy_measure_col}{The column or columns of the dataset
#'   containing a measure of democracy. There may be more than one; refer to the
#'   individual dataset documentation for details. If more than one measure,
#'   these are separated by commas.}
#'
#'   \item{measure_type}{The type of measure. It can be dichotomous
#'   (disintguishing only between democracy and non-democracy, with perhaps
#'   special codes for state interruptions or no-authority conditions),
#'   trichotomous (including a semidemocracy or hybrid category, but no other
#'   distinctions), ordinal (including several levels of democracy), or
#'   continuous.}
#'
#'   \item{based_on}{Some measures of democracy modify or build on existing
#'   ones. Many are based on Polity data, for example. This column lists the
#'   basis for the measures of democracy in each datasets, as far as I know
#'   based on my reading of the sources. In some cases no relationship to other
#'   measures could be identified; this does not mean that no relationship
#'   exists. In other cases a measure may draw on more than one existing
#'   dataset. (For example, Wahman-Teorell-Hadenius use both Freedom House and
#'   Polity to help them identify democracies). An attempt to map these
#'   relationships more systematically is made in
#'   vignette("Relationships_between_democracy_measures").}
#'
#'   \item{in_pmm_replication}{Logical. Lists whether the measure is found in
#'   Pemstein, Meserve, and Melton's (2013) replication data for their 2010
#'   article introducing the Unified Democracy Scores (Pemstein, Meserve, and
#'   Melton 2010). In some cases this is the only electronic source I have been
#'   able to identify for the included measure (e.g., \link{arat_pmm}). It's
#'   also worth noting that in a few cases (e.g., \link{prc_gasiorowski},
#'   \link{prc_pmm}) there are some identifiable differences between the
#'   original data and the data in the replication dataset. See the vignette in
#'   this package for further discussion.}
#'
#'   \item{categorical_regime_types}{Whether the dataset contains information
#'   about categorical regime types - primarily forms of authoritarianism (e.g.,
#'   monarchies and military regimes).}
#'
#'   \item{user_extendable}{Whether the dataset is extendable in time by the
#'   user. Some datasets (e.g., \link{gwf}, \link{ulfelder}, \link{bnr},
#'   \link{magaloni}) contain information about regime duration that can be used
#'   to extend their range back in time; others are latent variable indexes that
#'   can be extended using specific packages (e.g., \link{uds}, which can be
#'   extended using functions on this package, including
#'   [generate_extended_uds]; see
#'   vignette("Replicating_and_extending_the_UD_scores")). The "extended"
#'   versions of some datasets are included in this package.}
#'
#'   \item{donwloadable}{Whether this package includes a function to download
#'   the dataset directly from the original source.}
#'
#'   \item{included_in_package}{Whether the dataset is included in this package.
#'   Some are not, either due to use restrictions, or because they are updated
#'   with some frequency (e.g., \link{fh}).}
#'
#'   \item{first_published_use}{Year of first published use (as far as I know).
#'   In some cases the data used in the first published use is very different
#'   from the current data; for example, as far as I know the Polity I data was
#'   first used in a 1975 study (though its compilation started in the late
#'   1960s), but the current Polity 5 data is very different.}
#'
#'   \item{source_link}{A link to where the data is (or was) originally hosted.
#'   Some of these links no longer work.}
#'
#'   \item{licensing_info}{Licensing info, if available. I assume CC0 unless
#'   otherwise stated; some datasets have CC-BY-4.0 licenses.}
#'
#'   \item{notes}{Other notes. Evolving.} }
#'
#' @references
#'
#' `r roxygen_cite("pmm")`
#'
#'   \url{http://hdl.handle.net/1902.1/PMM}
"democracy_info"


