# Basic information about existing democracy measures

This data frame contains some basic info about all the democracy
measures I know about.

## Usage

``` r
democracy_info
```

## Format

An object of class `spec_tbl_df` (inherits from `tbl_df`, `tbl`,
`data.frame`) with 43 rows and 14 columns.

## Variables

- dataset:

  The basic name of the dataset. This usually matches the name of the
  dataset included in this package, except for datasets with more than
  one version (e.g., `gwf` matches
  [gwf_all](https://xmarquez.github.io/democracyData/reference/gwf_all.md),
  [gwf_all_extended](https://xmarquez.github.io/democracyData/reference/gwf_all.md),
  [gwf_autocratic](https://xmarquez.github.io/democracyData/reference/gwf_all.md),
  and
  [gwf_autocratic_extended](https://xmarquez.github.io/democracyData/reference/gwf_all.md)).

- long_name:

  Longer name of the dataset, or official name, if any.

- main_democracy_measure_col:

  The column or columns of the dataset containing a measure of
  democracy. There may be more than one; refer to the individual dataset
  documentation for details. If more than one measure, these are
  separated by commas.

- measure_type:

  The type of measure. It can be dichotomous (disintguishing only
  between democracy and non-democracy, with perhaps special codes for
  state interruptions or no-authority conditions), trichotomous
  (including a semidemocracy or hybrid category, but no other
  distinctions), ordinal (including several levels of democracy), or
  continuous.

- based_on:

  Some measures of democracy modify or build on existing ones. Many are
  based on Polity data, for example. This column lists the basis for the
  measures of democracy in each datasets, as far as I know based on my
  reading of the sources. In some cases no relationship to other
  measures could be identified; this does not mean that no relationship
  exists. In other cases a measure may draw on more than one existing
  dataset. (For example, Wahman-Teorell-Hadenius use both Freedom House
  and Polity to help them identify democracies). An attempt to map these
  relationships more systematically is made in
  vignette("Relationships_between_democracy_measures").

- in_pmm_replication:

  Logical. Lists whether the measure is found in Pemstein, Meserve, and
  Melton's (2013) replication data for their 2010 article introducing
  the Unified Democracy Scores (Pemstein, Meserve, and Melton 2010). In
  some cases this is the only electronic source I have been able to
  identify for the included measure (e.g.,
  [arat_pmm](https://xmarquez.github.io/democracyData/reference/arat_pmm.md)).
  It's also worth noting that in a few cases (e.g.,
  [prc_gasiorowski](https://xmarquez.github.io/democracyData/reference/prc_gasiorowski.md),
  [prc_pmm](https://xmarquez.github.io/democracyData/reference/prc_gasiorowski.md))
  there are some identifiable differences between the original data and
  the data in the replication dataset. See the vignette in this package
  for further discussion.

- categorical_regime_types:

  Whether the dataset contains information about categorical regime
  types - primarily forms of authoritarianism (e.g., monarchies and
  military regimes).

- user_extendable:

  Whether the dataset is extendable in time by the user. Some datasets
  (e.g.,
  [gwf](https://xmarquez.github.io/democracyData/reference/gwf_all.md),
  [ulfelder](https://xmarquez.github.io/democracyData/reference/ulfelder.md),
  [bnr](https://xmarquez.github.io/democracyData/reference/bnr.md),
  [magaloni](https://xmarquez.github.io/democracyData/reference/magaloni.md))
  contain information about regime duration that can be used to extend
  their range back in time; others are latent variable indexes that can
  be extended using specific packages (e.g.,
  [uds](https://xmarquez.github.io/democracyData/reference/uds_2014.md),
  which can be extended using functions on this package, including
  [generate_extended_uds](https://xmarquez.github.io/democracyData/reference/generate_extended_uds.md);
  see vignette("Replicating_and_extending_the_UD_scores")). The
  "extended" versions of some datasets are included in this package.

- donwloadable:

  Whether this package includes a function to download the dataset
  directly from the original source.

- included_in_package:

  Whether the dataset is included in this package. Some are not, either
  due to use restrictions, or because they are updated with some
  frequency (e.g.,
  [fh](https://xmarquez.github.io/democracyData/reference/fh_pmm.md)).

- first_published_use:

  Year of first published use (as far as I know). In some cases the data
  used in the first published use is very different from the current
  data; for example, as far as I know the Polity I data was first used
  in a 1975 study (though its compilation started in the late 1960s),
  but the current Polity 5 data is very different.

- source_link:

  A link to where the data is (or was) originally hosted. Some of these
  links no longer work.

- licensing_info:

  Licensing info, if available. I assume CC0 unless otherwise stated;
  some datasets have CC-BY-4.0 licenses.

- notes:

  Other notes. Evolving.

## References

D. Pemstein, S. Meserve, and J. Melton. "Democratic Compromise: A Latent
Variable Analysis of Ten Measures of Regime Type". In: *Political
Analysis* 18.4 (2010), pp. 426-449. DOI:
[10.1093/pan/mpq020](https://dx.doi.org/10.1093/pan/mpq020).

D. Pemstein, S. A. Meserve, and J. Melton. *Replication Data for:
Democratic Compromise: A Latent Variable Analysis of Ten Measures of
Regime Type*. 2013. DOI:
[10.7910/DVN/WWYOHU](https://dx.doi.org/10.7910/DVN/WWYOHU).
