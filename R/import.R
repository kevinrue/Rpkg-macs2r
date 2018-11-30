
#' Import narrowPeaks file
#'
#' From the MACS2 documentation: "NAME_peaks.narrowPeak is BED6+4 format file which contains the peak locations together with peak summit, pvalue and qvalue.
#' Definition of some specific columns are:
#'
#' \itemize{
#' \item 5th: integer score for display calculated as int(-10*log10qvalue).
#' Please note that currently this value might be out of the [0-1000] range defined in UCSC Encode narrowPeak format.
#' \item 7th: fold-change
#' \item 8th: -log10pvalue
#' \item 9th: -log10qvalue
#' \item 10th: relative summit position to peak start"
#' }
#'
#' @param file Path a "NAME_peaks.narrowPeak" file.
#' @param extraCols A character vector in the same form as colClasses from \code{\link{read.table.}}.
#' It should indicate the name and class of each extra/special column to read from the BED file.
#' See \code{\link{import.bed}} for details.
#' @param ... Additional arguments passed to \code{import.bed}.
#'
#' @return A \code{\link{GRanges}} object.
#' @export
#'
#' @author Kevin Rue-Albrecht
#' @importFrom rtracklayer import.bed
#'
#' @examples
#' # Example file ----
#' file <- system.file(package = "macs2r", "extdata", "example_peaks.narrowPeak")
#'
#' # Example usage ----
#' gr <- import.narrowPeaks(file)
#'
#' # seqlevels(x) may need to be switched to the adequate format
#' # for downstream analyses
#' library(GenomeInfoDb)
#' seqlevelsStyle(narrowPeakGranges) <- "Ensembl"
import.narrowPeaks <- function(
    file,
    extraCols=c(
        "FoldChange"="numeric",
        "MinusLog10pvalue"="numeric",
        "MinusLog10qvalue"="numeric",
        "RelativeSummitPositionToPeakStart"="numeric"),
    ...
) {
    gr <- import.bed(file, extraCols=extraCols, ...)
    gr
}
