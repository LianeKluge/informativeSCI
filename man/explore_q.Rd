% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/exploreInformWeight.R
\name{explore_q}
\alias{explore_q}
\title{Exploration of the Information Weights}
\usage{
explore_q(
  gMCP = NULL,
  g = NULL,
  weights = NULL,
  trueParam,
  sigma = NULL,
  qFixed = matrix(0, 0, 2),
  mu_0 = 0,
  alpha = 0.05,
  addHyp = matrix(0, 0, 3),
  allRej = NULL,
  atLeastOneRej = NULL,
  qGrid = NULL,
  qInterval = c(0, 1),
  qStepSize = 1/10,
  numSim = 1000,
  sampleSizes = NULL,
  sampleSizeControl = NULL,
  varObs = NULL,
  exploreGraph = TRUE,
  eps = 1/10^5,
  timesSmallerEps = 3,
  maxIterSCI = 1000,
  maxIterBisec = 1000,
  tolBisec = 1/10^3
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

\item{trueParam}{A numeric vector of dimension m defining the assumed true
parameters \eqn{\vartheta_i, 1\leq i\leq m}.}

\item{sigma}{A covariance matrix of dimension \eqn{m\times m}. \code{sigma}
indicates the covariance matrix of the point estimators for the parameter
of interest. Can be missing in the case of a many-to-one comparison.
Then, \code{sampleSizes}, \code{sampleSizeControl} and \code{varObs}
must be specified.}

\item{qFixed}{A numeric matrix with l rows and 2 columns, where l is an
integer between 0 and m. The matrix describes the fixed information weights
of the simulation. The first column indicates the indices of the hypothesis
for which the information weight should be fixed during the simulation
(i.e. the entries of the first column must be natural numbers between
1 and m). The second column contains the fixed values of their respective
fixed information weights (i.e. the entries of the second column must be
between 0 and 1 (inclusive)). It is permissible for all information weights
to be fixed  (i.e. \code{qFixed} has m rows) or none to be fixed
(i.e. \code{qFixed} has 0 rows).}

\item{mu_0}{A numeric vector of dimension 1 or m defining the bounds of the
null hypotheses of the underlying graphical test. If \code{mu_0} has
dimension 1, the same value is used for each null hypothesis.}

\item{alpha}{A numeric defining the overall significance level for the
graphical test (i.e. SCIs will have coverage probability of at least
\eqn{1-}\code{alpha}. The parameter must be strictly between 0 and 1.}

\item{addHyp}{A numeric matrix with k rows and 3 columns (k can be 0)
The matrix indicates for which (further) shifted hypotheses the rejection
probability is to be calculated. Every row describes one hypothesis.
The first entry is a natural number greater than m identifying the
hypothesis. The second entry of each row is the index of the corresponding
parameter of interest. The third entry is the right border of the hypothesis.}

\item{allRej}{A list of vectors. Each vector in the list contains the indices
of subfamilies of the family of all hypotheses, including the \code{addHyp}.
The indices of the null hypotheses of the underlying graph range from 1 to m.
The indices for \code{addHyp} are given by the first column of \code{addHyp}.
For each such family, the probability of rejecting all hypotheses at the same
time is calculated.}

\item{atLeastOneRej}{A list of vectors. Each vector in the list contains the
indices of subfamilies of the family of all hypotheses, including
the \code{addHyp}. The indices of the null hypotheses of the underlying graph
range from 1 to m. The indices for \code{addHyp} are given by the first
column of \code{addHyp}. For each such family, the probability of rejecting
at least one hypothesis is calculated.}

\item{qGrid}{A numeric vector indicating the values of the non-fixed
information weights for the simulation. The entries must be between 0 and 1
(inclusive).}

\item{qInterval}{A numeric vector of dimension 2 specifying the minimum
and maximum values allowed for the varying information weights.
\code{qInterval} and \code{qStepsize} can be used as the input as an
alternative to specifying \code{qGrid}. If all are entered, \code{qGrid}
is used and \code{qInterval} and \code{qStepSize} are ignored.}

\item{qStepSize}{A positive numeric defining the step size for the varying
information weights. \code{qInterval} and \code{qStepsize} can be used as
the input as an alternative to specifying \code{qGrid}.}

\item{numSim}{A natural number indicating how many simulations are to be
performed.}

\item{sampleSizes}{A numeric vector indicating the sample size of each
non-control group, in the many-to-one case. Not required if \code{sigma}
is entered.}

\item{sampleSizeControl}{A numeric indicating the sample size of the control
group, in the many-to-one case. Not required if \code{sigma} is entered.}

\item{varObs}{A positive numeric indicating the variance of the individual
observations, in the many-to-one case. Not required if \code{sigma} is
entered.}

\item{exploreGraph}{A boolean indicating whether the simulation should be
also done for the underlying graphical test and the corresponding compatible
lower SCI-bounds.}

\item{eps}{A numeric for the \code{informSCI}-algorithm indicating the
desired strict upper bound on the Chebyshev distance between two successive
calculated approximations (the Chebyshev distance is induced by
the maximum norm).}

\item{timesSmallerEps}{A positive integer for the \code{informSCI}-algorithm
indicating how many times the Chebyshev distance of two successive
calculated approximations should be less than \code{eps} in succession. Here
we use the convention \eqn{-\infty- (-\infty):=0}.}

\item{maxIterSCI}{Maximum number of iterations for determining the lower
informative SCI-bounds.}

\item{maxIterBisec}{Maximum number of iterations of the bisection method
which is used during the \code{informSCI}-algorithm for finding roots.}

\item{tolBisec}{A non-negative numeric indicating the error tolerance of
the bisection method which is used for finding roots in the
\code{informSCI}-algorithm.}
}
\value{
The function returns a list containing several statistical quantities
to use for the informative lower SCI-bounds to find the best possible
trade-off between the number of rejections and the expected size of the
informative lower SCI-bounds. In the case that  \code{exploreGraph=TRUE},
the returned list also contains the same quantities for the (original)
graphical test and related compatible bounds. This allows a comparison.
\itemize{
\item \code{rejecHyp}: A matrix containing for several hypotheses the
empirical rejection probability by the informative confidence bounds.
The first m rows correspond to the hypotheses of the graph. The other rows
correspond to the hypotheses specified by \code{addHyp}. Each row indicates
the rejection probability for different values of the information weights.
\item \code{meanISCI}: A matrix containing in its columns the empirical mean
of the lower informative confidence bounds for different information weights.
Only the lower bounds which are greater than \code{-Inf} are used for the
empirical mean.
\item \code{impISCI}: A matrix containing in its columns the empirical
average distance between the lower informative confidence bounds and
\code{mu_0} for different information weights. Only the lower bounds which
are greater than \code{-Inf} are used for the empirical average distance.
\item \code{biasISCI}: A matrix containing in its columns the empirical
average distance between the lower informative confidence bounds and the
true parameters \code{trueParam} for different information weights. Only the
lower bounds which are greater than \code{-Inf} are used for the empirical
average distance.
\item \code{numISCIfinite}: A matrix containing in its columns how many times
the lower informative confidence bounds were each greater than \code{-Inf}
for different information weights.
\item \code{rejecAllHyp}: A matrix containing in its columns for each family
from \code{allRej} the empirical probability of rejecting all of the
hypotheses from the family with the induced test at the same time for
different information weights.
\item \code{rejecAtLeastHyp}: A matrix containing in its columns for each
family from \code{atLeastOneRej} the empirical probability of rejecting
at least one of the hypotheses from the family with the induced test for
different information weights.
}

If \code{exploreGraph=TRUE}:
\itemize{
\item \code{rejecHypGraph}: A vector containing for each of the null
hypotheses of the graph and of the additional hypotheses (specified by
\code{addHyp}) its empirical rejection probability by the original graph.
\item \code{meanCSCI}: A vector containing, for each parameter
\eqn{\vartheta_i, 1\leq i\leq m} the empirical mean of the lower compatible
confidence bounds. Only the lower bounds which are greater than \code{-Inf}
are used for the empirical mean.
\item \code{impCSCI}: A vector containing, for each parameter, the empirical
average distance between the lower compatible confidence bounds and
\code{mu_0}. Only the lower bounds which are greater than \code{-Inf} are
used.
\item \code{biasCSCI}: A vector containing, for each parameter,
the empirical average distance between the lower compatible confidence bounds
and the true parameters \code{trueParam}. Only the lower bounds which are
greater than \code{-Inf} are used.
\item \code{numCSCIfinite}: A vector containing, for each parameter, how
many times the compatible lower confidence bounds were each greater
than \code{-Inf}.
\item \code{rejecAllHypCSCI}: A vector containing, for each family from
\code{allRej}, the empirical probability of rejecting all of the hypotheses
from the family with the (original) graphical test.
\item \code{rejecAtLeastHypCSCI}: A vector containing, for each family from
\code{atLeastOneRej}, the empirical probability of rejecting at least one
of the hypotheses from the family with the (original) graphical test.
}
}
\description{
The function calculates various statistical quantities giving some
information about the behavior of informative lower SCI-bounds
(\link{informSCI}) and its induced test for a given graphical test procedure
with m hypotheses. The simulation is done for different information weights
of the hypotheses. These statistical quantities are intended to be used for
determining information weights that represent the best possible trade-off
between the number of rejections and the expected size of the informative
lower informative SCI-bounds. The statistical quantities can also be
calculated for the graphical test and the related compatible lower
SCI-bounds, which allows a comparison between the two strategies.
}
\details{
It is assumed that there are m parameters of interest
\eqn{\vartheta_1,\dots,\vartheta_m}. For each parameter there is a null
hypothesis defined as \eqn{H_i^{{\mu_0}_i}:\vartheta_i\leq{\mu_0}_i}.
The bounds \eqn{{\mu_0}} correspond to \code{mu_0}. The underlying graphical
test (specified by \code{gMCP} or \code{g} and \code{weights}) is based on
these hypotheses.

The function simulates estimations of point estimators for the parameter of
interest \eqn{\vartheta_1,\dots, \vartheta_m}. The estimators follow a
multivariate normal distribution with mean \code{trueParam} and covariance
matrix \code{sigma}. The function repeatedly calls the
\code{\link{informSCI}}-function.

The algorithm only optimizes for a single parameter, which is used for all
non-fixed information weights.
The parameter is chosen from a grid specified by \code{qInterval} and
\code{qStepsize}. The constructed grid contains all values which are between
\code{qInterval[1]} and \code{qInterval[2]} and can be written as
\code{qInterval[1]}\eqn{+k\cdot}\code{qStepsize} where k is a natural number.
Alternatively, the parameter is chosen directly from \code{qGrid}.
}
\examples{
explore_q(gMCP=BonferroniHolm(3), trueParam=c(1.5,1,0.2),
sigma=diag(3)*0.2, qFixed=matrix(c(2,3,0.3,0.3),2,2), mu_0=c(-0.5,0,0),
addHyp=matrix(c(4,1,0),1,3),allRej =list(c(1,2), c(4,2)), 
atLeastOneRej=list(c(2,3)),numSim=100)
explore_q(g=matrix(c(0,0,1,0),2,2), weights=c(1,0), trueParam=c(0.5,2), 
mu_0=c(-1,0), alpha=0.025, qGrid=c(1/10*c(1:10),c(0.97,0.98,0.99)), 
numSim=100, sampleSizes=c(89,95), sampleSizeControl=77, varObs=10)

}
\references{
S. Schmidt, W. Brannath: Informative simultaneous confidence intervals
for the fallback procedure. Biometrical Journal 57.4 (2015), pp. 712–719.
}
\seealso{
\code{\link{informSCI}} \code{\link[gMCP]{gMCP}}
\code{\link[gMCP]{simConfint}}
}
