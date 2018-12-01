test_that("", {

    file <- system.file(package = "macs2r", "extdata", "example_peaks.narrowPeak")

    gr <- import.narrowPeaks(file)

    expect_length(gr, 7)
    expect_s4_class(gr, "GRanges")
})
