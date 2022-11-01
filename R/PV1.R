#' Segment PV1: Patient visit
#'
#' Convert input to a MSH segment for HL7 2.3.1. Outputs a character vector of
#' length 1 with input values pipe delimited. Below function definition are helper
#' functions for particular fields: SendingFacilityComponents, MessageTypeComponents.
#'
#' @param SetID = "",
#' @param PatientClass = "",
#' @param AssignedPatientLocation = "",
#' @param AdmissionType = "",
#' @param PreadmitNumber = "",
#' @param PriorPatientLocation = "",
#' @param AttendingDoctor = "",
#' @param ReferringDoctor = "",
#' @param ConsultingDoctor = "",
#' @param HospitalService = "",
#' @param TemporaryLocation = "",
#' @param PreadmitTestIndicator = "",
#' @param ReadmissionIndicator = "",
#' @param AdmitSource = "",
#' @param AmbulatoryStatus = "",
#' @param VIPIndicator = "",
#' @param AdmittingDoctor = "",
#' @param PatientType = "",
#' @param VisitNumber = "",
#' @param FinancialClass = "",
#' @param ChargePriceIndicator = "",
#' @param CourtesyCode = "",
#' @param CreditRating = "",
#' @param ContractCode = "",
#' @param ContractEffectiveDate = "",
#' @param ContractAmount = "",
#' @param ContractPeriod = "",
#' @param InterestCode = "",
#' @param TransfertoBadDebtCode = "",
#' @param TransfertoBadDebtDate = "",
#' @param BadDebtAgencyCode = "",
#' @param BadDebtTransferAmount = "",
#' @param BadDebtRecoveryAmount = "",
#' @param DeleteAccountIndicator = "",
#' @param DeleteAccountDate = "",
#' @param DischargeDisposition = "",
#' @param DischargedtoLocation = "",
#' @param DietType = "",
#' @param ServicingFacility = "",
#' @param BedStatus = "",
#' @param AccountStatus = "",
#' @param PendingLocation = "",
#' @param PriorTemporaryLocation = "",
#' @param AdmitDateTime = "",
#' @param DischargeDateTime = "",
#' @param CurrentPatientBalance = "",
#' @param TotalCharges = "",
#' @param TotalAdjustments = "",
#' @param TotalPayments = "",
#' @param AlternateVisitID = "",
#' @param VisitIndicator = "",
#' @param OtherHealthcareProvider = ""
#' @param .FieldSeparator = '|'
#' @param .version = c("2.3.1", "2.4")
#' @param .trim = TRUE
#'
#' @export
PV1 <-
  function(SetID = "",
           PatientClass = "",
           AssignedPatientLocation = "",
           AdmissionType = "",
           PreadmitNumber = "",
           PriorPatientLocation = "",
           AttendingDoctor = "",
           ReferringDoctor = "",
           ConsultingDoctor = "",
           HospitalService = "",
           TemporaryLocation = "",
           PreadmitTestIndicator = "",
           ReadmissionIndicator = "",
           AdmitSource = "",
           AmbulatoryStatus = "",
           VIPIndicator = "",
           AdmittingDoctor = "",
           PatientType = "",
           VisitNumber = "",
           FinancialClass = "",
           ChargePriceIndicator = "",
           CourtesyCode = "",
           CreditRating = "",
           ContractCode = "",
           ContractEffectiveDate = "",
           ContractAmount = "",
           ContractPeriod = "",
           InterestCode = "",
           TransfertoBadDebtCode = "",
           TransfertoBadDebtDate = "",
           BadDebtAgencyCode = "",
           BadDebtTransferAmount = "",
           BadDebtRecoveryAmount = "",
           DeleteAccountIndicator = "",
           DeleteAccountDate = "",
           DischargeDisposition = "",
           DischargedtoLocation = "",
           DietType = "",
           ServicingFacility = "",
           BedStatus = "",
           AccountStatus = "",
           PendingLocation = "",
           PriorTemporaryLocation = "",
           AdmitDateTime = "",
           DischargeDateTime = "",
           CurrentPatientBalance = "",
           TotalCharges = "",
           TotalAdjustments = "",
           TotalPayments = "",
           AlternateVisitID = "",
           VisitIndicator = "",
           OtherHealthcareProvider = "",
           .FieldSeparator = '|',
           .version = c("2.3.1", "2.4"),
           .trim = TRUE){

    # .parameters not included in environment() and others in order required
    inputs = as.list(environment())

    # TODO check version, predicate can be expanded in future
    version_segment_length <- ifelse(.version[1] == '2.3.1', 52, 52)

    return_value <-
      paste(c('PV1', inputs[1:version_segment_length]),
            collapse = .FieldSeparator)

    if (.trim){
      return_value <- trim_trailing_chars(return_value, char = .FieldSeparator)
    }

    class(return_value) <- c('hl7segment', 'pv1', class(return_value))

    return_value
  }
