#' Segment ORC: Common Order
#'
#' Convert input to a segment for HL7 2.3.1. Outputs a character vector of
#' length 1 with input values pipe delimited. Below function definition are helper
#' functions for particular fields:
#'
#' @param OrderControl = '',
#' @param PlacerOrderNumber = '',
#' @param FillerOrderNumber = '',
#' @param PlacerGroupNumber = '',
#' @param OrderStatus = '',
#' @param ResponseFlag = '',
#' @param QuantityTiming = '',
#' @param Parent = '',
#' @param DateTimeofTransaction = '',
#' @param EnteredBy = '',
#' @param VerifiedBy = '',
#' @param OrderingProvider = '',
#' @param EnterersLocation = '',
#' @param CallBackPhoneNumber = '',
#' @param OrderEffectiveDateTime = '',
#' @param OrderControlCodeReason = '',
#' @param EnteringOrganization = '',
#' @param EnteringDevice = '',
#' @param ActionBy = '',
#' @param AdvancedBeneficiaryNoticeCode = '',
#' @param OrderingFacilityName = '',
#' @param OrderingFacilityAddress = '',
#' @param OrderingFacilityPhoneNumber = '',
#' @param OrderingProviderAddress = '',
#' @param OrderStatusModifier = '',
#' @param .FieldSeparator = '|',
#' @param .version = c("2.3.1", "2.4"),
#' @param .trim = TRUE
#'
#' @export
ORC <- function(
    OrderControl = '',
    PlacerOrderNumber = '',
    FillerOrderNumber = '',
    PlacerGroupNumber = '',
    OrderStatus = '',
    ResponseFlag = '',
    QuantityTiming = '',
    Parent = '',
    DateTimeofTransaction = '',
    EnteredBy = '',
    VerifiedBy = '',
    OrderingProvider = '',
    EnterersLocation = '',
    CallBackPhoneNumber = '',
    OrderEffectiveDateTime = '',
    OrderControlCodeReason = '',
    EnteringOrganization = '',
    EnteringDevice = '',
    ActionBy = '',
    AdvancedBeneficiaryNoticeCode = '',
    OrderingFacilityName = '',
    OrderingFacilityAddress = '',
    OrderingFacilityPhoneNumber = '',
    OrderingProviderAddress = '',
    OrderStatusModifier = '',
    .FieldSeparator = '|',
    .version = c("2.3.1", "2.4"),
    .trim = TRUE){

  # .parameters not included in environment() and others in order required
  inputs = as.list(environment())

  # TODO check version, predicate can be expanded in future
  version_segment_length <- ifelse(.version[1] == '2.3.1', 24, 25)

  return_value <-
    paste(c('ORC', inputs[1:version_segment_length]),
          collapse = .FieldSeparator)

  if (.trim){
    return_value <- trim_trailing_chars(return_value, char = .FieldSeparator)
  }

  class(return_value) <- c('hl7segment', 'orc', class(return_value))

  return_value

}
