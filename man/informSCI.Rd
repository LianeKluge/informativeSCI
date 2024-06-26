% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/informSCI.R
\name{informSCI}
\alias{informSCI}
\title{Calculation of Lower Informative SCI-bounds}
\usage{
informSCI(
  gMCP = NULL,
  g = NULL,
  weights = NULL,
  q,
  mu_0 = 0,
  estimates = NULL,
  Z = NULL,
  pValues = NULL,
  SE = NULL,
  I = NULL,
  alpha = 0.05,
  eps = 1/10^5,
  timesSmallerEps = 3,
  randomShifts = 0,
  shifts = NULL,
  tolTrueSCI = sqrt(ifelse(!is.null(gMCP), length(getWeights(gMCP)), length(weights))) *
    eps,
  maxIter = 1000,
  maxIterBisec = 1000,
  tolBisec = 1/10^5,
  calculateCSCI = TRUE,
  checkInput = TRUE
)
}
\arguments{
\item{gMCP}{An object of class \code{\link[gMCP]{graphMCP}} indicating the
underlying graphical test.}

\item{g}{Numeric square matrix of transition weights for the graphical test
with m rows and m columns. The i-th row of the entered matrix defines the
arrows starting from the i-th hypothesis. Each entry has to be between
0 and 1 and each row must sum to a number less than or equal to 1. The
diagonal elements must be zero. Entering \code{g} and \code{weights} can be
used as the input as an alternative to specifying \code{gMCP}.}

\item{weights}{Numeric vector of weights of dimension m. It defines the
initial proportion of significance level which is assigned to each null
hypothesis. Entering \code{g} and \code{weights} can be used as the input as
an alternative to specifying \code{gMCP}.}

\item{q}{A numeric vector of dimension 1 or m defining the information
weights for each hypothesis. The entries have to be between 0 and 1
(inclusive). If \code{q} has dimension 1, the same information weight is
used for each hypothesis.}

\item{mu_0}{A numeric vector of dimension 1 or m defining the bounds of the
null hypotheses of the underlying graphical test. If \code{mu_0} has
dimension 1, the same value is used for each null hypothesis.}

\item{estimates}{An m-dimensional numeric vector of unbiased point estimates
for the parameters of interest. Each estimator is assumed to be
(asymptotically) normal.}

\item{Z}{An m-dimensional numeric vector of z-scores for testing the null
hypotheses. \code{Z} can be entered as an alternative to \code{estimates}.}

\item{pValues}{An m-dimensional numeric vector of p-values from (asymptotic)
z-tests for testing the null hypotheses. \code{pValues} can be entered as an
alternative to \code{estimates} and \code{Z}.}

\item{SE}{A positive numeric vector of dimension 1 or m indicating the
standard errors of the point estimators. If \code{SE} has dimension 1, the
same value is used for each estimator.}

\item{I}{A positive numeric vector indicating the information of the
estimators. It can be entered as an alternative to the vector \code{SE}.
The relationship \code{SE}\eqn{=1/}\code{I}\eqn{^{1/2}} is assumed.}

\item{alpha}{A numeric defining the overall significance level for the
graphical test (i.e. SCIs will have coverage probability of at least
\eqn{1-}\code{alpha}. The parameter must be strictly between 0 and 1.}

\item{eps}{A numeric indicating the desired strict upper bound on the
Chebyshev distance between two successive calculated approximations (the
Chebyshev distance is induced by the maximum norm).}

\item{timesSmallerEps}{A positive integer indicating how many times the
Chebyshev distance of two successive calculated approximations should be
less than \code{eps} in succession. Here we use the convention
\eqn{|-\infty-(-\infty)|:=0}.}

\item{randomShifts}{A positive integer indicating how many random directions
of length \code{tolTrueSCI} should be generated. At the end of the algorithm
the parameter is passed to the \code{\link{inExactSCI}}- and the
\code{\link{notInExactSCI}}-functions to determine whether the approximation
\code{L} of the true lower SCI-bounds is precise or imprecise.}

\item{shifts}{A matrix with m columns and any number of rows. Each entry must
be non-negative. Each row is a direction in the m-dimensional real space.
Each row must have at least one positive entry. At the end of the algorithm
the parameter is passed to the \code{\link{inExactSCI}}- and the
\code{\link{notInExactSCI}}-functions to determine whether the approximation
\code{L} of the true lower SCI-bounds is precise or imprecise.
\code{randomShifts} must be a positive integer or \code{shifts} must contain
at least one row. It is recommended to choose \code{randomShifts}\eqn{>0}
or enter a \code{shifts}-matrix with at least one row. Entering both
parameters is also permissible.}

\item{tolTrueSCI}{The randomly generated shift-vectors and the row vectors
in \code{shifts} are rescaled to have length \code{tolTrueSCI}. It is
recommended to choose \code{tolTrueSCI} greater than
\eqn{\sqrt{m}\cdot}\code{eps} and greater than \code{tolBisec}.}

\item{maxIter}{Maximum number of iterations for determining the lower
informative SCI bounds.}

\item{maxIterBisec}{Maximum number of iterations of the bisection method
which is used during the algorithm for finding roots.}

\item{tolBisec}{A non-negative numeric indicating the error tolerance of the
bisection method which is used for finding roots.}

\item{calculateCSCI}{A boolean indicating whether compatible bounds should
also be calculated.}

\item{checkInput}{A boolean specifying whether the entered values should be
checked.}
}
\value{
The function returns a list containing the calculated lower
informative SCI-bounds as well as compatible lower SCI-bounds
(if \code{calculateCSCI==TRUE}) to allow a comparison. Additionally, the
returned list contains elements which can give some information about the
precision of the calculated lower informative SCI-bounds compared to the
true informative SCI-bounds.
\itemize{
\item \code{L}: A numeric vector of dimension m of the lower informative
SCI-bounds
\item \code{rejecHyp}: A boolean vector of dimension m indicating the rejected
hypotheses of the multiple test induced by the informative SCI-bounds
\item \code{diffApprox}: A non-negative numeric indicating the Chebyshev distance
between the calculated last two approximations of the lower informative
SCI-bounds.
\item \code{timesApprSmallerEps}: A natural number between 0 and
\code{timesSmallerEps} indicating how many times the Chebyshev distance of
two successive calculated approximations in succession  was less than
\code{eps} when the algorithm terminated.
\item \code{numIter}: A natural number indicating the number of iterations
required by the algorithm.
\item \code{accuracyL}: A string containing information about the collected
information about the precision of the calculated lower informative
SCI-bounds compared with the true lower SCI-bounds.
}

If \code{calculateCSCI=TRUE}:
\itemize{
\item \code{informSCIcompatible}: A boolean vector of dimension m indicating
whether each informative bound is compatible to the test decision
about its corresponding null hypothesis by the underlying graphical test.
\item \code{cSCI}: A numeric vector of dimension m of compatible lower
SCI-bounds from \code{\link[gMCP]{simConfint}}.
\item \code{rejecHypGraph}: A boolean vector of dimension m indicating the
rejected hypotheses of the underlying graphical test.
}
}
\description{
The function calculates informative lower SCI-bounds for a given graph of m
hypotheses and given information weights. m is a natural number.
}
\details{
It is assumed that there are m parameters of interest
\eqn{\vartheta_1,\dots,\vartheta_m}. For each parameter there is a null
hypothesis defined as \eqn{H_i^{{\mu_0}_i}:\vartheta_i\leq{\mu_0}_i}.
The bounds \eqn{{\mu_0}} correspond to \code{mu_0}. The parameter \code{gMCP}
or the parameters \code{g} and \code{weights} define a graphical multiple
test procedure for the hypotheses.

The algorithm further assumes that for each hypothesis there is an unbiased
point estimator which is (asymptotically) normal.
The \code{informSCI}-algorithm is based on the p-values from the
corresponding (asymptotic) z-tests.

The algorithm terminates when the Chebyshev distance of two successive
calculated approximations is less than \code{eps}
\code{timesSmallerEps}-times in succession or if the maximum number of
iterations is reached.

The function also tries to find information about the precision of the final
calculated approximation of the true lower informative SCI-bounds by
calling the \code{\link{inExactSCI}}- and the
\code{\link{notInExactSCI}}-functions.

For further details see the given references.
}
\examples{
informSCI(gMCP=BonferroniHolm(3), q=0.3, mu_0=-0.5 ,estimates=c(0,2,-1),
SE=0.1467)
Z <- (c(0,2,-1)-(-0.5))/0.1467
informSCI(gMCP=BonferroniHolm(3), q=0.3, mu_0=-0.5, Z=Z, I=1/(0.1467^2),
randomShifts=100)
informSCI(g=matrix(c(0,0,1,0),2,2), weights=c(1,0), q=c(0.0068,1),
mu_0=c(-1,0), pValues=c(0.0002,0.01), SE=c(0.31,1.11), alpha=0.025, 
shifts=rbind(c(1,0),c(0,1),c(1,1)))
informSCI(g=matrix(c(0,0,1,0),2,2), weights=c(1,0), q=c(0.0068,1),
mu_0=c(-1,0), pValues=c(0.0002,0.01), I=1/c(0.31,1.11)^2, alpha=0.025, 
shifts=rbind(c(1,0),c(0,1),c(1,1)), calculateCSCI = FALSE)

}
\references{
F. Bretz, W. Maurer, W. Brannath, M. Posch: A graphical approach
to sequentially rejective multiple test procedures. Statistics in Medicine
28.4 (2009), pp. 586-604.

K. Strassburger, F. Bretz: Compatible simultaneous lower confidence bounds
for the Holm procedure and other Bonferroni based closed tests. Statistics
in Medicine 27.4 (2008), pp. 4914-4927.

S. Schmidt, W. Brannath: Informative Simultaneous Confidence Intervals
in Hierarchical Testing. Methods of Information in Medicine 53.4 (2014),
pp. 278–283.
}
\seealso{
\code{\link[gMCP]{gMCP}} \code{\link[gMCP]{simConfint}}
\code{\link{explore_q}}
}
