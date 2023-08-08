% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/codaSeq.phi.r
\name{codaSeq.phi}
\alias{codaSeq.phi}
\title{Expected value of Phi from Dirichlet log-ratio distribution}
\usage{
codaSeq.phi(aldex.clr)
}
\arguments{
\item{aldex.clr}{An \code{aldex.clr} S3 object, output by \code{aldex.clr} from the \code{ALDEx2} package.}
}
\value{
Returns expected Phi values for pairwise comparisons between
all features.
}
\description{
Expected value of Phi from Dirichlet log-ratio distribution
}
\details{
This function is time- and memory-intensive! Requires the \code{aldex.clr()}
function from the \code{ALDEx2} package. We ignore all the other measures that
are used for trouble-shooting phi.
}
\examples{
# load example HMP data from CoDaSeq package
data("ak_op")  # feature table: 4347 OTU x 30 samples (15x ak, 15x op)

# CLR using ALDEx2
clr.data <- aldex.clr(ak_op,
                      conds = c(rep("AK",15),rep("OP",15)),
                      denom = "all")

# calculate phi
phi<-codaSeq.phi(clr.data)
}
\seealso{
\code{\link[=codaSeq.clr]{codaSeq.clr()}}, \link{codaSeq.filter}, \link{codaSeq.rarefy}, \link{codaSeq.outlier}
}
\author{
Greg Gloor, Jean Macklaim, Wallace Chan
}
