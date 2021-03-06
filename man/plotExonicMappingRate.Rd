% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AllGenerics.R,
%   R/methods-plotExonicMappingRate.R
\docType{methods}
\name{plotExonicMappingRate}
\alias{plotExonicMappingRate}
\alias{plotExonicMappingRate,bcbioRNADataSet-method}
\alias{plotExonicMappingRate,data.frame-method}
\title{Plot Exonic Mapping Rate}
\usage{
plotExonicMappingRate(object, ...)

\S4method{plotExonicMappingRate}{bcbioRNADataSet}(object, passLimit = 60L,
  flip = TRUE)

\S4method{plotExonicMappingRate}{data.frame}(object,
  interestingGroup = "sampleName", passLimit = 60L, flip = TRUE)
}
\arguments{
\item{object}{Object.}

\item{...}{\emph{Additional arguments (for the S4 generic definition).}}

\item{passLimit}{Threshold to plot pass color marker.}

\item{flip}{Flip X and Y axes.}

\item{interestingGroup}{Category to use to group samples (color and shape).
If unset, this is automatically determined by the metadata set inside the
\link{bcbioRNADataSet}.}
}
\value{
\link{ggplot}.
}
\description{
Plot Exonic Mapping Rate
}
\examples{
data(bcb)

# bcbioRNADataSet
plotExonicMappingRate(bcb)

# data.frame
metrics(bcb) \%>\% plotExonicMappingRate
}
\seealso{
Other Quality Control Plots: \code{\link{plot53Bias}},
  \code{\link{plotCountDensity}},
  \code{\link{plotCountsPerGene}},
  \code{\link{plotGenderMarkers}},
  \code{\link{plotGeneSaturation}},
  \code{\link{plotGenesDetected}}, \code{\link{plotGene}},
  \code{\link{plotIntronicMappingRate}},
  \code{\link{plotMappedReads}},
  \code{\link{plotMappingRate}},
  \code{\link{plotRRNAMappingRate}},
  \code{\link{plotTotalReads}}
}
\author{
Michael Steinbaugh, Rory Kirchner, Victor Barrera
}
\concept{Quality Control Plots}
