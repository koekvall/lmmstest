% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/test.R
\name{score_test}
\alias{score_test}
\title{Compute the (modified) score test statistic}
\usage{
score_test(
  y,
  X,
  Z,
  Beta,
  sigma,
  lambda,
  lam_idx,
  test_idx,
  fix_idx,
  efficient = TRUE
)
}
\arguments{
\item{y}{A vector of observed responses.}

\item{X}{A matrix of predictors whose i:th row corresponds to the i:th
element in y.}

\item{Z}{A design matrix for the random effects whose i:th row corresponds
to the i:th element in y.}

\item{Beta}{A vector of regression coefficients of length ncol(X).}

\item{sigma}{The standard deviation of the error term.}

\item{lambda}{A vector of scale parameters (standard deviations) of the
random effects.}

\item{lam_idx}{A vector of length ncol(Z) whose j:th element indicates
which element of lambda scales the j:th random effect.}

\item{test_idx}{A vector of integers indicating for which elements of
theta = c(Beta, sigma, lambda) the test statistic is to be computed.}

\item{fix_idx}{A vector of integeres indicating which elements of
theta are treated as fixed and known}

\item{efficient}{If TRUE, use efficient Fisher information (Schur complement)
for tested parameters.}
}
\value{
A vector with test statistic ("chi_sq"), degrees of freedom ("df"),
and p-value ("p_val").
}
\description{
{
  The statistic is based on a modified score function that, unlike the usual
  score function, has a full rank covariance matrix on the whole parameter
  space. See ?log_lik for details on the parameterization.
  
  The test is reliable at and near the boundary of the
  parameter space where some scale parameters (sigma, lambda) are near zero.
}
}
\details{
{
  The linear mixed model assumed is y = X \%*\% Beta + Z \%*\% u + e,
  where the vector of random effects u is from a multivariate normal
  distribution with mean zero and diagonal covariance matrix. The j:th
  diagonal element of that covariance matrix -- the variance of the j:th
  random effect -- is equal to lambda(lam_idx[j])^2.
 
  The elements of e are independent draws from a normal distribution
  with mean 0 and variance sigma^2.
  
  The test statistic is computed for theta[test_idx], where theta = c(Beta,
  sigma, lambda). Elements of theta not restricted under the null hypothesis
  should ideally be evaluated at their maximum likelihood estimates under the
  null hypothesis.
  
  When no standard deviation parameters are zero under the
  null hypothesis, the test statistic is the usual score test statistic
  standardized by expected Fisher information.
}
}
