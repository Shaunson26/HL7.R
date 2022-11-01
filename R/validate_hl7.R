#' Check the headers of a HL7 file
#'
#' Function looks for HL7 headers - FHS, BHS and MSH - in a file and responds
#' appropriately.
#'
#' @param file input file
#'
#' @export
validate_hl7 <- function(file){

  # Check line breaks
  message_lines <- readLines(file, n = 2, warn = F)

  if(length(message_lines) < 2){
    stop('HL7 message is too short. Segments should be delimited by a new line.')
  }

  # cycle through lines
  header_lines = c()
  n = 1
  test_result = TRUE

  while (test_result) {

    if (n > 10) {
      stop('HL7 validation error - not expecting to check more than 10 lines of input')
    }

    test_line <- readLines(file, n = n)[n]
    test_result <- grepl("^FHS|^BHS|^MSH", test_line)

    if (test_result) {
      header_lines <- append(header_lines, substr(test_line, start = 1, stop = 3))
      n = n + 1
    }

  }

  if (is.null(header_lines)) {
    stop('The data specified does not appear to be valid HL7. The first line of the feed should begin with header segment - MSH, FHS, BHS')
  }

}
