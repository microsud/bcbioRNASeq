#' Count Matrix Accessors
#'
#' By default, [counts()] returns the raw counts. Normalized counts, including
#' transcripts per million (TPM) can be accessed using the `normalized`
#' argument.
#'
#' @rdname counts
#' @name counts
#' @author Michael Steinbaugh
#'
#' @inheritParams AllGenerics
#' @param normalized Select raw counts (`FALSE`), DESeq2 normalized counts
#'   (`TRUE`), or additional normalization methods:
#'   - `tpm`: Transcripts per million.
#'   - `tmm`: Trimmed mean of M-values (edgeR).
#'   - `rlog`: Regularized log transformation ([DESeq2::rlog()]).
#'   - `vst`: Variance stabilizing transformation
#'     ([DESeq2::varianceStabilizingTransformation()]).
#'
#' @return [matrix].
#'
#' @examples
#' data(bcb)
#' # Raw counts
#' counts(bcb, normalized = FALSE) %>% glimpse
#'
#' # DESeq2 normalized counts
#' counts(bcb, normalized = TRUE) %>% glimpse
#'
#' # TPM
#' counts(bcb, normalized = "tpm") %>% glimpse
#'
#' # TMM
#' counts(bcb, normalized = "tmm") %>% glimpse
#'
#' # rlog
#' counts(bcb, normalized = "rlog") %>% glimpse
#'
#' # VST
#' counts(bcb, normalized = "vst") %>% glimpse
NULL



# Methods ====
#' @rdname counts
#' @export
setMethod("counts", "bcbioRNADataSet", function(object, normalized = FALSE) {
    if (normalized == FALSE) {
        slot <- "raw"
    } else if (normalized == TRUE) {
        slot <- "normalized"
    } else {
        slot <- normalized
    }

    # Check for slot presence
    if (!slot %in% names(assays(object))) {
        stop("Unsupported normalization method")
    }

    counts <- assays(object)[[slot]]

    # Return matrix from [DESeqTransform]
    if (slot %in% c("rlog", "vst")) {
        counts <- assay(counts)
    }

    counts
})
