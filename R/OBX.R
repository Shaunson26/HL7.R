#' Segment OBX: Observation/Result
#'
#' Convert input to a OBX segment for HL7 2.3.1. Outputs a character vector of
#' length 1 with input values pipe delimited. Below function definition are helper
#' functions for particular fields: UnitsComponents
#'
#' @param SetID = "",
#' @param ValueType = "",
#' @param ObservationIdentifier = "",
#' @param ObservationSubID = ObservationIdentifierComponents(),
#' @param ObservationValue = '',
#' @param Units = UnitsComponents(),
#' @param ReferencesRange = "",
#' @param AbnormalFlags = "",
#' @param Probability = "",
#' @param NatureofAbnormalTest = "",
#' @param ObservationResultStatus = "",
#' @param DateLastObsNormalValues = "",
#' @param UserDefinedAccessChecks = "",
#' @param DateTimeoftheObservation = "",
#' @param ProducersID = "",
#' @param ResponsibleObserver = "",
#' @param ObservationMethod = "",
#' @param EquipmentInstanceIdentifier = '',
#' @param DateTimeoftheAnalysis = '',
#' @param .FieldSeparator = '|',
#' @param .version = c("2.3.1", "2.4"),
#' @param .trim = TRUE
#'
#' @export
OBX <-
  function(SetID = "",
           ValueType = "",
           ObservationIdentifier = "",
           ObservationSubID = ObservationIdentifierComponents(),
           ObservationValue = '',
           Units = UnitsComponents(),
           ReferencesRange = "",
           AbnormalFlags = "",
           Probability = "",
           NatureofAbnormalTest = "",
           ObservationResultStatus = "",
           DateLastObsNormalValues = "",
           UserDefinedAccessChecks = "",
           DateTimeoftheObservation = "",
           ProducersID = "",
           ResponsibleObserver = "",
           ObservationMethod = "",
           EquipmentInstanceIdentifier = '',
           DateTimeoftheAnalysis = '',
           .FieldSeparator = '|',
           .version = c("2.3.1", "2.4"),
           .trim = TRUE){

    # .parameters not included in environment() and others in order required
    inputs = as.list(environment())

    # TODO check version, predicate can be expanded in future
    version_segment_length <- ifelse(.version[1] == '2.3.1', 17, 19)

    return_value <-
      paste(c('OBX', inputs[1:version_segment_length]),
            collapse = .FieldSeparator)

    if (.trim){
      return_value <- trim_trailing_chars(return_value, char = .FieldSeparator)
    }

    class(return_value) <- c('hl7segment', 'obx', class(return_value))

    return_value
  }

#' Components of ObservationIdentifier
#'
#' Function will create a character vector of length 1 with input values separated
#' with a ^
#'
#' @param ... dots!
#' @param .sep = '^'
#'
#' @export
variedComponents <-
  function(...,
           .sep = '^'){

    paste(collapse = .sep,
          list(...))

  }

#' Components of ObservationIdentifier
#'
#' Function will create a character vector of length 1 with input values separated
#' with a ^
#'
#' @param identifier = '',
#' @param text = '',
#' @param nameOfCodingSystem = '',
#' @param alternateIdentifier = '',
#' @param alternateText = '',
#' @param nameOfAlternateCodingSystem = '',
#' @param .sep = '^',
#' @param .trim = TRU
#'
#' @export
ObservationIdentifierComponents <-
  function(identifier = '',
           text = '',
           nameOfCodingSystem = '',
           alternateIdentifier = '',
           alternateText = '',
           nameOfAlternateCodingSystem = '',
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


#' Components of OBR Units
#'
#' Function will create a character vector of length 1 with input values separated
#' with a ^
#'
#' @param identifier = '',
#' @param text = '',
#' @param nameOfCodingSystem = '',
#' @param alternateIdentifier = '',
#' @param alternateText = '',
#' @param nameOfAlternateCodingSystem = '',
#' @param .sep = '^',
#' @param .trim = TRUE
#'
#' @export
UnitsComponents <-
  function(identifier = '',
           text = '',
           nameOfCodingSystem = '',
           alternateIdentifier = '',
           alternateText = '',
           nameOfAlternateCodingSystem = '',
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
