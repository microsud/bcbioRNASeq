% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AllGenerics.R, R/methods-tmm.R
\docType{methods}
\name{tmm}
\alias{tmm}
\alias{tmm,bcbioRNADataSet-method}
\alias{tmm,DESeqDataSet-method}
\alias{tmm,matrix-method}
\title{Trimmed Mean of M-Values (TMM) Normalization}
\usage{
tmm(object)

\S4method{tmm}{bcbioRNADataSet}(object)

\S4method{tmm}{DESeqDataSet}(object)

\S4method{tmm}{matrix}(object)
}
\arguments{
\item{object}{Object.}
}
\value{
\link{matrix}.
}
\description{
TMM normalization is recommended for RNA-seq data generally when the majority
of genes are not differentially expressed. We use this as a quality control
tool when plotting counts per gene.
}
\examples{
data(bcb, dds)

# bcbioRNADataSet
tmm(bcb) \%>\% head

\dontrun{
# DESeqDataSet
tmm(dds) \%>\% head

# matrix
assay(bcb) \%>\% tmm \%>\% head
}
}
\author{
Michael Steinbaugh
}
