% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/backward.R
\name{backward}
\alias{backward}
\alias{backward.HMM}
\title{The backward part of the FB algorithm}
\usage{
backward(...)

\method{backward}{HMM}(x, y, sfactors)
}
\value{
A HMM object.
}
\description{
Calculates the backward probabilities.
}
\examples{
HMM(1L, matrix(c(1L,1L), nrow = 2), EM = matrix(1, nrow = 1))
}
