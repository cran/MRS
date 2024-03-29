% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/andova.R
\name{andova}
\alias{andova}
\title{Multi Resolution Scanning for one-way ANDOVA using the multi-scale Beta-Binomial model}
\usage{
andova(X, G, H, n_groups = length(unique(G)), n_subgroups = NULL,
  Omega = "default", K = 6, init_state = c(0.8, 0.2, 0), beta = 1,
  gamma = 0.07, delta = 0.4, eta = 0, alpha = 0.5,
  nu_vec = 10^(seq(-1, 4)), return_global_null = TRUE, return_tree = TRUE)
}
\arguments{
\item{X}{Matrix of the data. Each row represents an observation.}

\item{G}{Numeric vector of the group label of each observation. Labels are integers starting from 1.}

\item{H}{Numeric vector of the replicate label of each observation. Labels are integers starting from 1.}

\item{n_groups}{Number of groups.}

\item{n_subgroups}{Vector indicating the number of replicates for each grop.}

\item{Omega}{Matrix defining the vertices of the sample space.
The \code{"default"} option defines a hyperrectangle containing all the data points.
Otherwise the user can define a matrix  where each row represents a dimension,  and the two columns contain the associated lower and upper limit.}

\item{K}{Depth of the tree. Default is \code{K = 6}, while the maximum is \code{K = 14}.}

\item{init_state}{Initial state of the hidden Markov process.
The three states are \emph{null}, \emph{altenrative} and \emph{prune}, respectively.}

\item{beta}{Spatial clustering parameter of the transition probability matrix. Default is \code{beta = 1.0}.}

\item{gamma}{Parameter of the transition probability matrix. Default is \code{gamma = 0.07}.}

\item{delta}{Parameter of the transition probability matrix. Default is \code{delta = 0.4}.}

\item{eta}{Parameter of the transition probability matrix. Default is \code{eta = 0.0}.}

\item{alpha}{Pseudo-counts of the Beta random probability assignments.}

\item{nu_vec}{The support of the discrete uniform prior on nu.}

\item{return_global_null}{Boolean indicating whether to return the marginal posterior probability of the global null.}

\item{return_tree}{Boolean indicating whether to return the posterior representative tree.}
}
\value{
An \code{mrs} object.
}
\description{
This function executes the Multi Resolution Scanning algorithm to detect differences
across the distributions of multiple groups having multiple replicates.
}
\examples{
set.seed(1)
n = 1000
M = 5
class_1 = sample(M, n, prob= 1:5, replace=TRUE  )
class_2 = sample(M, n, prob = 5:1, replace=TRUE )

Y_1 = rnorm(n, mean=class_1, sd = .2)
Y_2 = rnorm(n, mean=class_2, sd = .2)

X = matrix( c(Y_1, Y_2), ncol = 1)
G = c(rep(1,n),rep(2,n))
H = sample(3,2*n, replace = TRUE  )

ans = andova(X, G, H)
ans$PostGlobNull
plot1D(ans)
}

\references{
Ma L. and Soriano J. (2018).
Analysis of distributional variation through multi-scale Beta-Binomial modeling.
 \emph{Journal of Computational and Graphical Statistics. Vol. 27, No. 3, 529-541.}.
 \doi{10.1080/10618600.2017.1402774}
}

