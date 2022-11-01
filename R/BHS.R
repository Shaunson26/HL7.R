#' Segment BHS - Batch Header Segment
#'
#' Convert input to a BHS segment for HL7 2.3.1 or 2.4. Outputs a character vector of
#' length 1 with input values pipe delimited.
#'
#' @param BHS.1_BatchFieldSeparator = "|",
#' @param BHS.2_BatchEncodingCharacters = "",
#' @param BHS.3_BatchSendingApplication = "",
#' @param BHS.4_BatchSendingFacility = "",
#' @param BHS.5_BatchReceivingApplication = "",
#' @param BHS.6_BatchReceivingFacility = "",
#' @param BHS.7_BatchCreationDateTime = "",
#' @param BHS.8_BatchSecurity = "",
#' @param BHS.9_BatchNameIDType = "",
#' @param BHS.10_BatchComment = "",
#' @param BHS.11_BatchControlID = "",
#' @param BHS.12_ReferenceBatchControlID = ""
#' @param .version = c("2.3.1", "2.4"),
#' @param .trim = TRUE
#'
#' @return character vector
#'
#' @export
BHS <-
  function(BHS.1_BatchFieldSeparator = "|",
           BHS.2_BatchEncodingCharacters = "",
           BHS.3_BatchSendingApplication = "",
           BHS.4_BatchSendingFacility = "",
           BHS.5_BatchReceivingApplication = "",
           BHS.6_BatchReceivingFacility = "",
           BHS.7_BatchCreationDateTime = "",
           BHS.8_BatchSecurity = "",
           BHS.9_BatchNameIDType = "",
           BHS.10_BatchComment = "",
           BHS.11_BatchControlID = "",
           BHS.12_ReferenceBatchControlID = "",
           #.FieldSeparator = '|',
           .version = c("2.3.1", "2.4"),
           .trim = TRUE){

    .FieldSeparator = BHS.1_BatchFieldSeparator

    # .parameters not included in environment() and others in order required
    inputs = as.list(environment())

    # TODO check version, predicate can be expanded in future
    version_segment_length <- ifelse(.version[1] == '2.3.1', 12, 12)

    # field separator needs exclusion - index starts at 2
    return_value <-
      paste(c('BHS', inputs[2:version_segment_length]),
            collapse = .FieldSeparator)

    if (.trim){
      return_value <- trim_trailing_chars(return_value, char = .FieldSeparator)
    }

    class(return_value) <- c('hl7segment', 'bhs', class(return_value))

    return_value

  }

