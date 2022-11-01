#' Segment field names
#'
#' A list of segment (MSH, PID, etc) and sub-field names (MessageType,
#' PatientIdentifierList, etc). Not exhaustive. Used with \code{add_field_names()},
#' which simply matches by \code{names}. Additional list objects are used for
#' repetitive sub-field names, so far: \code{coded_element}, \code{extended_telecommunication_number},
#' and new ones included whenever the need arises.


#' Coded Element (CE) field structure
#'
#' @describeIn segment_names
#'
#' A list of field names for coded element (CE) fields. Used by \code{segment_names}
#' This is a recurring structure used to identify a value in one or possibly
#' two different coding systems, e.g. a lab might transmit the same value in both
#' their local coding and also the universal LOINC standard code.
#' Described further at: http://www.hl7.eu/HL7v2x/v231/hl7v231typCE.htm
#'
coded_element <-
  c('identifier',
    'text',
    'nameOfCodingSystem',
    'alternateComponents',
    'alternateText',
    'nameOfAlternateCodingSystem'
  )

#' Extended Telecommunication Number (XTN) field structure
#'
#' @describeIn segment_names
#'
#' A list of field names for Extended Telecommunication Number (XTN) fields. Used by \code{segment_names}
#'
extended_telecommunication_number <-
  c('anyText',
    'telecommunicationUseCode',
    'telecommunicationEquipmentType',
    'emailAddress',
    'countryCode',
    'areaCityCode',
    'phoneNumber',
    'extension',
    'anyText2')

#' Segment name
#'
#' @describeIn segment_names
#'
#' The actual list of segment (MSH, PID, etc) and sub-field names (MessageType,
#' PatientIdentifierList, etc), that calls upon other lists described here.
#'
segment_names <-
  list(
    # MSH ----
    MSH =
      c(#'MSH',
        'EncodingCharacters',
        'SendingApplication',
        'SendingFacility',
        'ReceivingApplication',
        'ReceivingFacility',
        'DateTimeOfMessage',
        'Security',
        'MessageType',
        'MessageControlID',
        'ProcessingID',
        'VersionID',
        'SequenceNumber',
        'ContinuationPointer',
        'AcceptAcknowledgmentType',
        'ApplicationAcknowledgmentType',
        'CountryCode',
        'CharacterSet',
        'PrincipalLanguageOfMessage',
        'AlternateCharacterSetHandlingScheme')
    ,
    MessageType =
      c('messageType',
        'triggerEvent',
        'MessageStructure'
      ),
    VersionID =
      c('versionId',
        'internationalizationCode',
        'internationalVersionId'
      ),
    # PID ----
    PID =
      c(#'PID',
        'SetID',
        'PatientID',
        'PatientIdentifierList',
        'AlternatePatientIDPID',
        'PatientName',
        'MothersMaidenName',
        'DateTimeOfBirth',
        'Sex',
        'PatientAlias',
        'Race',
        'PatientAddress',
        'CountyCode',
        'PhoneNumberHome',
        'PhoneNumberBusiness',
        'PrimaryLanguage',
        'MaritalStatus',
        'Religion',
        'PatientAccountNumber',
        'SSNNumberPatient',
        'DriversLicenseNumberPatient',
        'MothersIdentifier',
        'EthnicGroup',
        'BirthPlace',
        'MultipleBirthIndicator',
        'BirthOrder',
        'Citizenship',
        'VeteransMilitaryStatus',
        'Nationality',
        'PatientDeathDateandTime',
        'PatientDeathIndicator')
    ,
    PatientIdentifierList =
      c('id',
        'checkDigit',
        'codeIdentifyingTheCheckDigitSchemeEmployed',
        'assigningAuthority'	,
        'identifierTypeCode',
        'assigningFacility'
      ),
    PatientName =
      c('familyName',
        'givenName',
        'middleName',
        'suffix',
        'prefix',
        'degree',
        'nameTypeCode',
        'nameRepresentationCode')
    ,
    Race = coded_element,
    PatientAddress =
      c('streetAddress',
        'otherDesignation',
        'city',
        'stateProvince',
        'zipPostcode',
        'country',
        'addressType',
        'otherGeographicDesignation',
        'countyParishCode',
        'censusTract',
        'addressRepresentationCode')
    ,
    PhoneNumberHome = extended_telecommunication_number,
    PhoneNumberBusiness = extended_telecommunication_number,
    EthnicGroup = coded_element
    ,
    # PV1 ----
    PV1 =
      c(#'PV1',
        'SetID',
        'PatientClass',
        'AssignedPatientLocation',
        'AdmissionType',
        'PreadmitNumber',
        'PriorPatientLocation',
        'AttendingDoctor',
        'ReferringDoctor',
        'ConsultingDoctor',
        'HospitalService',
        'TemporaryLocation',
        'PreadmitTestIndicator',
        'ReadmissionIndicator',
        'AdmitSource',
        'AmbulatoryStatus',
        'VIPIndicator',
        'AdmittingDoctor',
        'PatientType',
        'VisitNumber',
        'FinancialClass',
        'ChargePriceIndicator',
        'CourtesyCode',
        'CreditRating',
        'ContractCode',
        'ContractEffectiveDate',
        'ContractAmount',
        'ContractPeriod',
        'InterestCode',
        'TransfertoBadDebtCode',
        'TransfertoBadDebtDate',
        'BadDebtAgencyCode',
        'BadDebtTransferAmount',
        'BadDebtRecoveryAmount',
        'DeleteAccountIndicator',
        'DeleteAccountDate',
        'DischargeDisposition',
        'DischargedtoLocation',
        'DietType',
        'ServicingFacility',
        'BedStatus',
        'AccountStatus',
        'PendingLocation',
        'PriorTemporaryLocation',
        'AdmitDateTime',
        'DischargeDateTime',
        'CurrentPatientBalance',
        'TotalCharges',
        'TotalAdjustments',
        'TotalPayments',
        'AlternateVisitID',
        'VisitIndicator',
        'OtherHealthcareProvider')
    ,
    # ORC ----
    ORC =
      c(#'OBC',
        'OrderControl',
        'PlacerOrderNumber',
        'FillerOrderNumber',
        'PlacerGroupNumber',
        'OrderStatus',
        'ResponseFlag',
        'QuantityTiming',
        'Parent',
        'DateTimeofTransaction',
        'EnteredBy',
        'VerifiedBy',
        'OrderingProvider',
        'EnterersLocation',
        'CallBackPhoneNumber',
        'OrderEffectiveDateTime',
        'OrderControlCodeReason',
        'EnteringOrganization',
        'EnteringDevice',
        'ActionBy',
        'AdvancedBeneficiaryNoticeCode',
        'OrderingFacilityName',
        'OrderingFacilityAddress',
        'OrderingFacilityPhoneNumber',
        'OrderingProviderAddress')
    ,
    # OBR ----
    OBR =
      c(#'OBR',
        'SetID',
        'PlacerOrderNumber',
        'FillerOrderNumber',
        'UniversalServiceID',
        'PriorityOBR',
        'RequestedDatetime',
        'ObservationDateTime',
        'ObservationEndDateTime',
        'CollectionVolume',
        'CollectorIdentifier',
        'SpecimenActionCode',
        'DangerCode',
        'RelevantClinicalInfo',
        'SpecimenReceivedDateTime',
        'SpecimenSource',
        'OrderingProvider',
        'OrderCallbackPhoneNumber',
        'PlacerField1',
        'PlacerField2',
        'FillerField1',
        'FillerField2',
        'ResultsRptStatusChngDateTime',
        'ChargetoPractice',
        'DiagnosticServSetID',
        'ResultStatus',
        'ParentResult',
        'QuantityTiming',
        'ResultCopiesTo',
        'Parent',
        'TransportationMode',
        'ReasonforStudy',
        'PrincipalResultInterpreter',
        'AssistantResultInterpreter',
        'Technician',
        'Transcriptionist',
        'ScheduledDateTime',
        'NumberofSampleContainers',
        'TransportLogisticsofCollectedSample',
        'CollectorsComment',
        'TransportArrangementResponsibility',
        'TransportArranged',
        'EscortRequired',
        'PlannedPatientTransportComment',
        'ProcedureCode',
        'ProcedureCodeModifier')
    ,
    UniversalServiceID = coded_element,
    SpecimenSource =
      c('specimenSourceNameOrCode',
        'additives',
        'freetext',
        'bodySite',
        'siteModifier',
        'collectionModifierMethodCode',
        'specimenRole'
      ),
    specimenSourceNameOrCode = coded_element,
    bodySite = coded_element,
    siteModifier = coded_element,
    collectionModifierMethodCode = coded_element,
    OrderingProvider =
      c('idNumber',
        'familyNameAndLastNamePrefix',
        'givenName',
        'middleInitialOrName',
        'suffix',
        'prefix',
        'degree',
        'sourceTable',
        'assigningAuthority',
        'nameTypeCode',
        'identifierCheckDigit',
        'codeIdentifyingTheCheckDigitSchemeEmployed',
        'identifierTypeCode',
        'assigningFacility',
        'nameRepresentationCode'
      ),
    OBX =
      c(#'OBX',
        'SetID',
        'ValueType',
        'ObservationIdentifier',
        'ObservationSubID',
        'ObservationValue',
        'Units',
        'ReferencesRange',
        'AbnormalFlags',
        'Probability',
        'NatureofAbnormalTest',
        'ObservationResultStatus',
        'DateLastObsNormalValues',
        'UserDefinedAccessChecks',
        'DateTimeoftheObservation',
        'ProducersID',
        'ResponsibleObserver',
        'ObservationMethod'),
    ObservationIdentifier = coded_element
  )








