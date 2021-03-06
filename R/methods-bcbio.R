#' `bcbioRNADataSet` Caller Slot Accessor
#'
#' This method is used to access alternative count matrices with differing
#' dimensions from the primary counts stored as a `SummarizedExperiment`.
#'
#' @rdname bcbio
#' @name bcbio
#'
#' @param type Type of data to retrieve.
#' @param value Value to assign.
#'
#' @details
#' Additional count matrices of interest include:
#'
#' - Aligned counts generated by [STAR](https://github.com/alexdobin/STAR) and
#'   [featureCounts](http://bioinf.wehi.edu.au/featureCounts/).
#' - Transcript-level gene expression, for
#'   [sleuth](http://pachterlab.github.io/sleuth) analysis.
#' - miRNA expression counts.
#'
#' Since these matrices don't necessarily contain the same number of columns and
#' rows as the counts imported with [tximport()], it is preferable to store this
#' information as alternative callers.
#'
#' @note By default, we store the quasi-aligned (a.k.a. lightweight) gene
#'   expression counts generated by
#'   [salmon](https://combine-lab.github.io/salmon/) into in a
#'   [SummarizedExperiment::SummarizedExperiment] using [tximport()]. These
#'   counts should be accessed using the `counts()` generic. Any additional
#'   transformations of those original counts, including [tpm()], [rlog()], or
#'   [tmm()] are stored alongside the raw counts.
#'
#' @return [slot] object.
#'
#' @examples
#' # tximport list
#' txi <- bcbio(bcb, "tximport")
#' class(txi)
#' length(txi)
#' names(txi)
#'
#' # featureCounts matrix
#' fc <- bcbio(bcb, "featureCounts")
#' class(fc)
#' dim(fc)
#' colnames(fc)
NULL



# Methods ====
#' @rdname bcbio
#' @export
setMethod("bcbio", "bcbioRNADataSet", function(object, type) {
    if (type %in% names(slot(object, "callers"))) {
        slot(object, "callers")[[type]]
    } else {
        stop(paste(type, "not found"))
    }
})



#' @rdname bcbio
#' @export
setMethod(
    "bcbio<-",
    signature(object = "bcbioRNADataSet", value = "ANY"),
    function(object, type, value) {
        slot(object, "callers")[[type]] <- value
        validObject(object)
        object
    })
