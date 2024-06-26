% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/informSCI.R
\name{funcBisec}
\alias{funcBisec}
\title{Bisection function}
\usage{
funcBisec(f_1, f_2, a, b, maxIter = 1000, tol = 1/10^3)
}
\arguments{
\item{f_1}{Left side of the key equation as a function in one variable.}

\item{f_2}{Right side of the key equation as a function in one variable.}

\item{a}{A real value indicating the left bound of the search region.
\eqn{f_1(a)\leq f_2(a)} must hold true.}

\item{b}{A real value indicating the right bound of the search region.
\eqn{f_1(b)\geq f_2(b)} must hold true.}

\item{maxIter}{A positive integer defining the maximum number of iterations.}

\item{tol}{A non-negative numeric indicating the error tolerance.}
}
\value{
Returns intersection point. In the case that no intersection point
is found, the left side of the final interval is returned, rather than the
midpoint. The returned point is a lower approximation of the solution of the
key equation.
}
\description{
Bisection function to find solutions of the key equation of the
\code{informSCI}-algorithm.
}
\details{
The function tries to find a solution of the key equation of the
\code{informSCI}-algorithm which is equivalent to  determining the
intersection point of \code{f_1} and \code{f_2}.
The function uses the bisection method and tries to determine the root
of the function \code{f_1-f_2}. Note that by definition of the key equation
and the assumptions of the \code{informSCI}-algorithm \code{f_1-f_2} is
a continuous strictly increasing function. Because of the assumptions on
\code{a} and \code{b} \code{f_1-f_2} has a non-positive function value in
point \code{a} and non-negative function value in point \code{b}. Thus,
\code{f_1-f_2} has exactly one root in the closed interval \eqn{[a,b]}.

The bisection method repeatedly halves the interval between \code{a} and
\code{b}. The function stops when the root is found or when the maximum
number of iterations is reached or when the interval is less than \code{tol}.
}
\keyword{internal}
