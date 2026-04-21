# Retrieve the citation for a specific dataset included in this package

This is a convenient wrapper for `print(bibliography)`, searching by
`key = dataset_name`, with `BibOptions(use.regex = TRUE)`. You can also
search and manipulate the
[`bibliography`](https://xmarquez.github.io/democracyData/reference/bibliography.md)
object directly using the
[RefManageR::RefManageR](https://docs.ropensci.org/RefManageR/reference/RefManageR-package.html)
package functions.

## Usage

``` r
cite_dataset(dataset_name, to_bibtex = FALSE)
```

## Arguments

- dataset_name:

  The name of the dataset to cite.

- to_bibtex:

  Whether to provide bibtex/biblatex markup.

## Value

Prints the citation information. Returns the
[`RefManageR::BibEntry()`](https://docs.ropensci.org/RefManageR/reference/BibEntry.html)
object.

## Examples

``` r
cite_dataset("gwf") 
#> [1] B. Geddes, J. Wright, and E. Frantz. “Autocratic Breakdown and
#> Regime Transitions: A New Data Set”. In: _Perspectives on Politics_
#> 12.1 (2013), pp. 313-331. DOI: 10.1017/S1537592714000851.

cite_dataset("pmm") 
#> [1] D. Pemstein, S. A. Meserve, and J. Melton. _Replication Data for:
#> Democratic Compromise: A Latent Variable Analysis of Ten Measures of
#> Regime Type_. 2012. DOI: 10.7910/DVN/WWYOHU.
#> 
#> [2] D. Pemstein, S. Meserve, and J. Melton. “Democratic Compromise: A
#> Latent Variable Analysis of Ten Measures of Regime Type”. In:
#> _Political Analysis_ 18.4 (2009), pp. 426-449. DOI: 10.1093/pan/mpq020.

cite_dataset("uds") # Same output as the previous one
#> [1] X. Márquez. “A Quick Method for Extending the Unified Democracy
#> Scores”. In: _Available at SSRN 2753830_ (2015). DOI:
#> 10.2139/ssrn.2753830.
#> 
#> [2] D. Pemstein, S. A. Meserve, and J. Melton. _Replication Data for:
#> Democratic Compromise: A Latent Variable Analysis of Ten Measures of
#> Regime Type_. 2012. DOI: 10.7910/DVN/WWYOHU.
```
