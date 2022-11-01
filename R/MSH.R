#' Segment MSH: Message Header
#'
#' Convert input to a MSH segment for HL7 2.3.1 or 2.4. Outputs a character vector of
#' length 1 with input values pipe delimited. Below function definition are helper
#' functions for particular fields: SendingFacilityComponents, MessageTypeComponents.
#'
#' @param EncodingCharacters = EncodingCharactersComponents(),
#' @param SendingApplication = "",
#' @param SendingFacility = SendingFacilityComponents(),
#' @param ReceivingApplication = "",
#' @param ReceivingFacility = "",
#' @param DateTimeOfMessage = "",
#' @param Security = "",
#' @param MessageType = MessageTypeComponents(),
#' @param MessageControlID = "",
#' @param ProcessingID = "",
#' @param VersionID = "",
#' @param SequenceNumber = "",
#' @param ContinuationPointer = "",
#' @param AcceptAcknowledgmentType = "",
#' @param ApplicationAcknowledgmentType = "",
#' @param CountryCode = "",
#' @param CharacterSet = "",
#' @param PrincipalLanguageOfMessage = "",
#' @param AlternateCharacterSetHandlingScheme = "",
#' @param ConformanceStatementID = "",
#' @param .FieldSeparator = '|',
#' @param .version either "2.3.1" or "2.4",
#' @param .trim trim trailing empty fields from output
#'
#' @return character vector
#'
#' @export
MSH <-
  function(EncodingCharacters = EncodingCharactersComponents(),
           SendingApplication = "",
           SendingFacility = SendingFacilityComponents(),
           ReceivingApplication = "",
           ReceivingFacility = "",
           DateTimeOfMessage = "",
           Security = "",
           MessageType = MessageTypeComponents(),
           MessageControlID = "",
           ProcessingID = "",
           VersionID = "",
           SequenceNumber = "",
           ContinuationPointer = "",
           AcceptAcknowledgmentType = "",
           ApplicationAcknowledgmentType = "",
           CountryCode = "",
           CharacterSet = "",
           PrincipalLanguageOfMessage = "",
           AlternateCharacterSetHandlingScheme = "",
           ConformanceStatementID = "",
           .FieldSeparator = '|',
           .version = c("2.3.1", "2.4"),
           .trim = TRUE){

    # .parameters not included in environment() and others in order required
    inputs = as.list(environment())

    # TODO check version, predicate can be expanded in future
    version_segment_length <- ifelse(.version[1] == '2.3.1', 19, 20)

    return_value <-
      paste(c('MSH', inputs[1:version_segment_length]),
            collapse = .FieldSeparator)

    if (.trim){
      return_value <- trim_trailing_chars(return_value, char = .FieldSeparator)
    }

    class(return_value) <- c('hl7segment', 'msh', class(return_value))

    return_value

  }

#' Encoding characters
#'
#' @describeIn MSH
#'
#' create a character vector of length 1 with input values separated with a ^
#'
#' @param componentSeparator = "^",
#' @param repetitionSeparator = "~",
#' @param escapeCharacter = "\\",
#' @param subcomponentSeparator = "&"
#'
#' @export
EncodingCharactersComponents <-
  function(componentSeparator = "^",
           repetitionSeparator = "~",
           escapeCharacter = "\\",
           subcomponentSeparator = "&"){

    paste(collapse =  '',
          as.list(environment()))

  }


#' Components of MSH SendingFacility
#'
#' @describeIn MSH
#'
#' create a character vector of length 1 with input values separated with a ^
#' @param namespace_ID = "",
#' @param universalID = "",
#' @param universalIDtype = "",
#' @param .sep = '^',
#' @param .trim = TRUE
#'
#' @export
SendingFacilityComponents <-
  function(namespace_ID = "",
           universalID = "",
           universalIDtype = "",
           .sep = '^',
           .trim = TRUE){

    return_value <-
      paste(collapse = .sep,
            as.list(environment()))

    if (.trim){
      return_value <- trim_trailing_chars(return_value, char = .sep)
    }

    return_value

  }

#' Components of MSH MessageType
#'
#' @describeIn MSH create a character vector of length 1 with input values separated with a ^
#'
#' @param messageType = "",
#' @param triggerEvent  = "",
#' @param messageStructure = "",
#' @param .sep = '^',
#' @param .trim = TRUE
#' @export
MessageTypeComponents <-
  function(messageType = "",
           triggerEvent  = "",
           messageStructure = "",
           .sep = '^',
           .trim = TRUE){

    return_value <-
      paste(collapse = .sep,
            as.list(environment()))

    if (.trim){
      return_value <- trim_trailing_chars(return_value, char = .sep)
    }

    return_value

  }

#' Components of MSH VersionID
#'
#' @describeIn MSH create a character vector of length 1 with input values separated with a ^
#'
#' @param versionId = '',
#' @param internationalizationCode = '',
#' @param internationalversionId = '',
#' @param .sep = "^",
#' @param .trim = TRUE
#' @export
VersionIDComponents <-
  function(versionId = '',
           internationalizationCode = '',
           internationalversionId = '',
           .sep = "^",
           .trim = TRUE){

    return_value <-
      paste(collapse = .sep,
            as.list(environment()))

    if (.trim){
      return_value <- trim_trailing_chars(return_value, char = .sep)
    }

    return_value

  }
