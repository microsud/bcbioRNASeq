#' Differentially Expressed Gene Heatmap
#'
#' This function is a simplified version of [plotGeneHeatmap()] that is
#' optimized for handling a [DESeqResults] object rather a gene vector. All of
#' the optional parameters for [plotGeneHeatmap()] are also available to this
#' function.
#'
#' @rdname plotDEGHeatmap
#' @name plotDEGHeatmap
#' @inherit plotGeneHeatmap
#'
#' @param counts Secondary object containing a normalized count matrix.
#' @param lfc log2 fold change ratio cutoff.
#' @param ... Options to pass to [plotGeneHeatmap()].
#' @examples
#' data(dds, res, rld)
#'
#' # DESeqResults, DESeqTransform
#' plotDEGHeatmap(res, rld)
#'
#' # DESeqResults, DESeqDataSet
#' plotDEGHeatmap(res, dds)
NULL



# Constructors ====
.plotDEGHeatmap <- function(
    results,
    counts,
    alpha = 0.01,
    lfc = 0L,
    title = TRUE,
    ...) {
    results <- results %>%
        as.data.frame %>%
        camel %>%
        # Keep genes that pass alpha cutoff
        .[!is.na(.[["padj"]]), , drop = FALSE] %>%
        .[.[["padj"]] < alpha, , drop = FALSE] %>%
        # Keep genes that pass log2 fold change cutoff
        .[!is.na(.[["log2FoldChange"]]), , drop = FALSE] %>%
        .[.[["log2FoldChange"]] > lfc |
              .[["log2FoldChange"]] < -lfc, , drop = FALSE]
    if (nrow(results) == 0L) {
        warning("No genes passed significance cutoffs", call. = FALSE)
        return(NULL)
    }
    genes <- rownames(results)
    if (isTRUE(title)) {
        title <- "deg"
    } else if (is.character(title)) {
        title <- paste("deg:", title)
    }
    if (length(genes) < 2L) {
        message(paste(length(genes), "is too few to plot"))
    } else {
        plotGeneHeatmap(counts, genes = genes, title = title, ...)
    }
}



# Methods ====
#' @rdname plotDEGHeatmap
#' @export
setMethod(
    "plotDEGHeatmap",
    signature(object = "DESeqResults",
              counts = "DESeqTransform"),
    function(
        object,
        counts,
        lfc = 0L,
        ...) {
        results <- as.data.frame(object)
        counts <- assay(counts)
        alpha <- metadata(object)[["alpha"]]
        title <- .resContrastName(object)
        .plotDEGHeatmap(
            results = results,
            counts = counts,
            alpha = alpha,
            lfc = lfc,
            title = title,
            ...)
    })



#' @rdname plotDEGHeatmap
#' @export
setMethod(
    "plotDEGHeatmap",
    signature(object = "DESeqResults",
              counts = "DESeqDataSet"),
    function(
        object,
        counts,
        lfc = 0L,
        title = TRUE,
        ...) {
        warning("Using a DESeqTransform object for counts is recommended",
                call. = FALSE)
        results <- as.data.frame(object)
        counts <- counts(counts, normalized = TRUE)
        alpha <- metadata(object)[["alpha"]]
        title <- .resContrastName(object)
        .plotDEGHeatmap(
            results = results,
            counts = counts,
            alpha = alpha,
            lfc = lfc,
            title = title,
            ...)
    })
