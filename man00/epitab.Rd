\name{epitab}

\alias{epitab}
%- Also NEED an '\alias' for EACH other topic documented here.

\title{Epidemiologic tabulation for a cohort or case-control study}

\description{
  Calculates risks, risk ratio, odds ratio, and confidence intervals for
  epidemiologic data
}

\usage{
epitab(exposure, disease = NULL, c.cell = NULL, d.cell = NULL, conf.level = 0.95)
}
%- maybe also 'usage' for other objects documented here.

\arguments{
  \item{exposure}{Exposure vector with any number of levels (e.g., from
    a data frame), or cell 'a' from a 2x2 table, or a nx2 table}
  \item{disease}{Outcome vector with 2 levels (Yes vs. No), or cell 'b'
    from a 2x2 table}
  \item{c.cell}{Cell 'c' from a 2x2 table}
  \item{d.cell}{Cell 'd' from a 2x2 table}
  \item{conf.level}{Confidence level (default = 0.95)}
}

\details{
  The 'epitab' function can take data in several forms: 4 numbers from
  cells of a 2x2 table, a nx2 table, or 2 vectors (exposure
  vs. 2-level outcome). It then calculates the risks for every level, the
  exposure distribution, Fishers exact p value for every level, the risk
  ratios with confidence intervals ("cohort analysis"), and the odds
  ratios with confidence intervals ("case-control analysis"). Therefore,
  submit either 4 numbers, nx2 table, or 2 categorical vectors. The risk
  ratios and the odds ratios also include a small sample adjustment
  [Jewell (2004)]. The cohort analysis includes the distribution of risk
  for each level of exposure, and the case-control analysis includes the
  distribution of exposure for both levels of outcome (case
  vs. control).

  Notice the expected structure of the data to be given to 'epitab':
\preformatted{
                 Disease
  Exposure       No  Yes
   Level 1 (ref)  a    b
   Level 2        c    d
   }
}


\value{
  \item{$data}{Original data in table form, now with marginal totals}
  \item{$risks}{Risk for each level}
  \item{$exposure.distrib}{Distribution of exposure levels}
  \item{$cohort.analysis}{Matrix with risk and risk ratio analysis}
  \item{$case.control.analysis}{Matrix with odds ratio analysis}
}

\references{
Jewell NP. Statistics for Epidemiology, 1st Edition, 2004, Chapman & Hall, pp. 73-82
}

\author{Tomas Aragon, \email{aragon@berkeley.edu}, \url{http://www.medepi.net/aragon}}

\note{none}

%- ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
  See also as \code{\link{risk.ratio}}, \code{\link{odds.ratio}}
}

\examples{
risk.ratio(178, 1589, 79, 1565)
epitab(1486, 79, 1411, 178)$cohort

odds.ratio(347, 555, 20, 88)
epitab(88, 20, 555, 347)$case.control

data(infert)
epitab(infert$induced, infert$case)$case.control
epitab(cut(infert$age, 2), infert$case)$case.control
}

\keyword{models}
%- \keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
