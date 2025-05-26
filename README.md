
<!-- README.md is generated from README.Rmd. Please edit that file -->

# informativeSCI

<!-- badges: start -->
<!-- badges: end -->

informativeSCI can be used for calculating informative lower
simultaneous confidence bounds for a given graphical test procedure and
given information weights. Furthermore, it can help to find the right
information weights for the bounds.

## Installation

You can install the development version of informativeSCI from
[GitHub](https://github.com/) with:

``` r
install.packages("devtools")
library(devtools)
install_github("LianeKluge/informativeSCI")
```

Otherwise just use the current version from CRAN.

## Usage

The main function of the package is the -function for calculating
informative lower simultaneous confidence bounds for a given graphical
test procedure and given information weights. The -function can help to
find the right information weights for the -algorithm. The - and
-functions can help to determine how accurate a (numerical)
approximation of the true informative lower SCI-bounds is. For examples,
see the Example sections of the documentation pages.

## References

@references W. Brannath, L. Kluge, M. Scharpenberg: Informative
Simultaneous Confidence Intervals for Graphical Test Procedures. arXiv
preprint arXiv:2402.13719 (2024). F. Bretz, W. Maurer, W. Brannath, M.
Posch: A graphical approach to sequentially rejective multiple test
procedures. Statistics in Medicine 28.4 (2009), pp. 586-604.

K. Strassburger, F. Bretz: Compatible simultaneous lower confidence
bounds for the Holm procedure and other Bonferroni based closed tests.
Statistics in Medicine 27.4 (2008), pp. 4914-4927.

S. Schmidt, W. Brannath: Informative Simultaneous Confidence Intervals
in Hierarchical Testing. Methods of Information in Medicine 53.4 (2014),
pp. 278–283.
