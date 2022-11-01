#' Segment FHS - File Header Segment
#'
#' Convert input to a FHS segment for HL7 2.3.1 or 2.4. Outputs a character vector of
#' length 1 with input values pipe delimited.
#'
#' @param FHS.1_FileFieldSeparator = "|",
#' @param FHS.2_FileEncodingCharacters = "",
#' @param FHS.3_FileSendingApplication = "",
#' @param FHS.4_FileSendingFacility = "",
#' @param FHS.5_FileReceivingApplication = "",
#' @param FHS.6_FileReceivingFacility = "",
#' @param FHS.7_FileCreationDateTime = "",
#' @param FHS.8_FileSecurity = "",
#' @param FHS.9_FileNameID = "",
#' @param FHS.10_FileHeaderComment = "",
#' @param FHS.11_FileControlID = "",
#' @param FHS.12_ReferenceFileControlID = "",
#' @param .version = c("2.3.1", "2.4"),
#' @param .trim = TRUE
#'
#' @return character vector
#'
#' @export
FHS <-
  function(FHS.1_FileFieldSeparator = "|",
           FHS.2_FileEncodingCharacters = "",
           FHS.3_FileSendingApplication = "",
           FHS.4_FileSendingFacility = "",
           FHS.5_FileReceivingApplication = "",
           FHS.6_FileReceivingFacility = "",
           FHS.7_FileCreationDateTime = "",
           FHS.8_FileSecurity = "",
           FHS.9_FileNameID = "",
           FHS.10_FileHeaderComment = "",
           FHS.11_FileControlID = "",
           FHS.12_ReferenceFileControlID = "",
           .version = c("2.3.1", "2.4"),
           .trim = TRUE){

    .FieldSeparator = FHS.1_FileFieldSeparator

    # .parameters not included in environment() and others in order required
    inputs = as.list(environment())

    # TODO check version, predicate can be expanded in future
    version_segment_length <- ifelse(.version[1] == '2.3.1', 12, 12)

    # field separator needs exclusion - index starts at 2
    return_value <-
      paste(c('FHS', inputs[2:version_segment_length]),
            collapse = .FieldSeparator)

    if (.trim){
      return_value <- trim_trailing_chars(return_value, char = .FieldSeparator)
    }

    class(return_value) <- c('hl7segment', 'fhs', class(return_value))

    return_value

  }

