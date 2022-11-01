#' Segment OBR: Observation Request
#'
#' Convert input to a OBR segment for HL7 2.3.1. Outputs a character vector of
#' length 1 with input values pipe delimited. Below function definition are helper
#' functions for particular fields: UniversalServiceIDComponents
#'
#' @param SetID = "",
#' @param PlacerOrderNumber = "",
#' @param FillerOrderNumber = "",
#' @param UniversalServiceID = UniversalServiceIDComponents(),
#' @param PriorityOBR = "",
#' @param RequestedDatetime = "",
#' @param ObservationDateTime = "",
#' @param ObservationEndDateTime = "",
#' @param CollectionVolume = "",
#' @param CollectorIdentifier = "",
#' @param SpecimenActionCode = "",
#' @param DangerCode = "",
#' @param RelevantClinicalInfo = "",
#' @param SpecimenReceivedDateTime = "",
#' @param SpecimenSource = "",
#' @param OrderingProvider = "",
#' @param OrderCallbackPhoneNumber = "",
#' @param PlacerField1 = "",
#' @param PlacerField2 = "",
#' @param FillerField1 = "",
#' @param FillerField2 = "",
#' @param ResultsRptStatusChngDateTime = "",
#' @param ChargetoPractice = "",
#' @param DiagnosticServSetID = "",
#' @param ResultStatus = "",
#' @param ParentResult = "",
#' @param QuantityTiming = "",
#' @param ResultCopiesTo = "",
#' @param Parent = "",
#' @param TransportationMode = "",
#' @param ReasonforStudy = "",
#' @param PrincipalResultInterpreter = "",
#' @param AssistantResultInterpreter = "",
#' @param Technician = "",
#' @param Transcriptionist = "",
#' @param ScheduledDateTime = "",
#' @param NumberofSampleContainers = "",
#' @param TransportLogisticsofCollectedSample = "",
#' @param CollectorsComment = "",
#' @param TransportArrangementResponsibility = "",
#' @param TransportArranged = "",
#' @param EscortRequired = "",
#' @param PlannedPatientTransportComment = "",
#' @param ProcedureCode = "",
#' @param ProcedureCodeModifier = "",
#' @param .FieldSeparator = '|',
#' @param .version = c("2.3.1", "2.4"),
#' @param .trim = TRUE
#'
#' @export
OBR <-
  function(SetID = "",
           PlacerOrderNumber = "",
           FillerOrderNumber = "",
           UniversalServiceID = UniversalServiceIDComponents(),
           PriorityOBR = "",
           RequestedDatetime = "",
           ObservationDateTime = "",
           ObservationEndDateTime = "",
           CollectionVolume = "",
           CollectorIdentifier = "",
           SpecimenActionCode = "",
           DangerCode = "",
           RelevantClinicalInfo = "",
           SpecimenReceivedDateTime = "",
           SpecimenSource = "",
           OrderingProvider = "",
           OrderCallbackPhoneNumber = "",
           PlacerField1 = "",
           PlacerField2 = "",
           FillerField1 = "",
           FillerField2 = "",
           ResultsRptStatusChngDateTime = "",
           ChargetoPractice = "",
           DiagnosticServSetID = "",
           ResultStatus = "",
           ParentResult = "",
           QuantityTiming = "",
           ResultCopiesTo = "",
           Parent = "",
           TransportationMode = "",
           ReasonforStudy = "",
           PrincipalResultInterpreter = "",
           AssistantResultInterpreter = "",
           Technician = "",
           Transcriptionist = "",
           ScheduledDateTime = "",
           NumberofSampleContainers = "",
           TransportLogisticsofCollectedSample = "",
           CollectorsComment = "",
           TransportArrangementResponsibility = "",
           TransportArranged = "",
           EscortRequired = "",
           PlannedPatientTransportComment = "",
           ProcedureCode = "",
           ProcedureCodeModifier = "",
           .FieldSeparator = '|',
           .version = c("2.3.1", "2.4"),
           .trim = TRUE){

    # .parameters not included in environment() and others in order required
    inputs = as.list(environment())

    # TODO check version, predicate can be expanded in future
    version_segment_length <- ifelse(.version[1] == '2.3.1', 45, 47)

    return_value <-
      paste(c('OBR', inputs[1:version_segment_length]),
            collapse = .FieldSeparator)

    if (.trim){
      return_value <- trim_trailing_chars(return_value, char = .FieldSeparator)
    }

    class(return_value) <- c('hl7segment', 'obr', class(return_value))

    return_value
  }

#' Components of OBR UniversalServiceID
#'
#' Function will create a character vector of length 1 with input values separated
#' with a ^
#'
#' @param identifier = "",
#' @param text = "",
#' @param nameOfCodingSystem = "",
#' @param alternateIdentifier = "",
#' @param alternateText = "",
#' @param nameOfAlternateCodingSystem = "",
#' @param .sep = '^',
#' @param .trim = TRUE
#' @export
UniversalServiceIDComponents <-
  function(identifier = "",
           text = "",
           nameOfCodingSystem = "",
           alternateIdentifier = "",
           alternateText = "",
           nameOfAlternateCodingSystem = "",
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
