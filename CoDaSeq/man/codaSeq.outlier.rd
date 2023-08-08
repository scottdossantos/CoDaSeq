% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/codaSeq.outlier.r
\name{codaSeq.outlier}
\alias{codaSeq.outlier}
\title{Identifying sample outliers}
\usage{
codaSeq.outlier(x, plot.me = TRUE, col = rgb(1, 0, 0, 0.3))
}
\arguments{
\item{x}{A matrix or data frame with CLR-transformed values,
with samples by row; ideally from \code{codaSeq.clr()} or \code{aldex.clr()}.}

\item{plot.me}{A logical value determining if a histogram of the variance
contribution per sample should be plotted (default: \code{TRUE}).}

\item{col}{RGB values for your selection of colours (default: \code{rgb(1,0,0,0.3)}).}
}
\value{
Returns a list with three elements: \code{sample.var}, containing
proportional variance contributions for each sample, \code{bad}, containing
outlier samples, and \code{good}, containing non-outlier samples.
}
\description{
Returns a list of proportional contibution to group variance,
sample names that are outliers, and sample names that are not outliers.
}
\details{
Samples must be grouped, but this approach makes no sense when used across
groups. If you do not know if you have natural groups, ignore this step and
examine your data by PCA. Outliers are defined as those contributing
more than the median plus twice the interquartile range of the sample
variance to the total.
}
\examples{
# load example HMP data from CoDaSeq package
data("ak_op")  # feature table: 4347 OTU x 30 samples (15x ak, 15x op)

# Bayesian-multiplicative replacement of count-zeros 
clr.input<-cmultRepl(t(ak_op),label = "0",
                     method = "CZM",output = "p-counts")

# CLR-transformation using codaSeq.clr
clr.data<-codaSeq.clr(t(clr.input), IQLR = FALSE,
                      aitch = FALSE, samples.by.row = TRUE)
# get outliers for keratinised gingiva samples
outliers.ak<-codaSeq.outlier(clr.data[1:15,])

# get outliers for oral plaque samples
outliers.ak<-codaSeq.outlier(clr.data[16:30,])
}
