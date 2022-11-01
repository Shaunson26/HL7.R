#' Extract HL7 version ID from MSH segment
#'
#' Extract element 12.1 from the MSH segment. Version ID > Version ID
#'
#' @param hl7_char character vector, character vector of segments. Only the first line is interrogated.
#'
#' @export
get_hl7_version <- function(hl7_char){

  # Validate that Data is Valid HL7
  if(!grepl('^MSH', hl7_char[1])){
    stop('The data specified does not appear to be valid HL7. The first line of the feed should begin with "MSH"')
  }

  element_12 <- strsplit(hl7_char[1], split = '|', fixed = T)[[1]][12]
  element_12_1 <- strsplit(element_12, split = '^', fixed = T)[[1]][1]
  element_12_1

}
