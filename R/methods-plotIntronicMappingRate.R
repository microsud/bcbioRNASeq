#' Plot Intronic Mapping Rate
#'
#' @rdname plotIntronicMappingRate
#' @name plotIntronicMappingRate
#'
#' @examples
#' data(bcb)
#'
#' # bcbioRNADataSet
#' plotIntronicMappingRate(bcb)
#'
#' # data.frame
#' metrics(bcb) %>% plotIntronicMappingRate
NULL



# Constructors ====
.plotIntronicMappingRate <- function(
    object,
    interestingGroup = "sampleName",
    warnLimit = 20L,
    flip = TRUE) {
    p <- ggplot(object,
                aes_(x = ~sampleName,
                     y = ~intronicRate * 100L,
                     fill = as.name(interestingGroup))) +
        geom_bar(stat = "identity") +
        labs(title = "intronic mapping rate",
             x = "sample",
             y = "intronic mapping rate (%)") +
        ylim(0L, 100L) +
        scale_fill_viridis(discrete = TRUE)
    if (!is.null(warnLimit)) {
        p <- p + qcWarnLine(warnLimit)
    }
    if (isTRUE(flip)) {
        p <- p + coord_flip()
    }
    p
}



# Methods ====
#' @rdname plotIntronicMappingRate
#' @export
setMethod(
    "plotIntronicMappingRate",
    "bcbioRNADataSet",
    function(
        object,
        warnLimit = 20L,
        flip = TRUE) {
        .plotIntronicMappingRate(
            metrics(object),
            interestingGroup = .interestingGroup(object),
            warnLimit = warnLimit,
            flip = flip)
    })



#' @rdname plotIntronicMappingRate
#' @export
setMethod("plotIntronicMappingRate", "data.frame", .plotIntronicMappingRate)
