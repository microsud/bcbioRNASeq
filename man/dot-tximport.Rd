% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/internal-tximport.R
\name{.tximport}
\alias{.tximport}
\title{Import RNA-Seq Counts}
\usage{
.tximport(sampleDirs, tx2gene)
}
\arguments{
\item{sampleDirs}{Sample directories to import.}

\item{tx2gene}{Transcript to gene annotations.}
}
\value{
Counts saved in \link{tximport} list object.
}
\description{
Import RNA-seq counts using \code{\link[=tximport]{tximport()}}. Currently supports
\href{https://combine-lab.github.io/salmon/}{salmon} (\strong{recommended}) and
\href{http://www.cs.cmu.edu/~ckingsf/software/sailfish/}{sailfish}.
}
\seealso{
\itemize{
\item \code{\link[tximport:tximport]{tximport::tximport()}}.
}
}
\author{
Michael Steinbaugh, Rory Kirchner
}
\keyword{internal}
