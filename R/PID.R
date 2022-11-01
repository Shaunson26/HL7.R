#' Segment PID: Patient identification
#'
#' Convert input to a PID segment for HL7 2.3.1. Outputs a character vector of
#' length 1 with input values pipe delimited. Below function definition are helper
#' functions for particular fields: PatientNameComponents, PatientAddressComponents,
#' PhoneNumberComponents
#'
#' @param SetID = "",
#' @param PatientID = "",
#' @param PatientIdentifierList = "",
#' @param AlternatePatientIDPID = "",
#' @param PatientName = PatientNameComponents(),
#' @param MothersMaidenName = "",
#' @param DateTimeOfBirth = "",
#' @param Sex = "",
#' @param PatientAlias = "",
#' @param Race = "",
#' @param PatientAddress = PatientAddressComponents(),
#' @param CountyCode = "",
#' @param PhoneNumberHome = PhoneNumberComponents(),
#' @param PhoneNumberBusiness = PhoneNumberComponents(),
#' @param PrimaryLanguage = "",
#' @param MaritalStatus = "",
#' @param Religion = "",
#' @param PatientAccountNumber = "",
#' @param SSNNumberPatient = "",
#' @param DriversLicenseNumberPatient = "",
#' @param MothersIdentifier = "",
#' @param EthnicGroup = "",
#' @param BirthPlace = "",
#' @param MultipleBirthIndicator = "",
#' @param BirthOrder = "",
#' @param Citizenship = "",
#' @param VeteransMilitaryStatus = "",
#' @param Nationality = "",
#' @param PatientDeathDateandTime = "",
#' @param PatientDeathIndicator = "",
#' @param IdentityReliabilityCode = "",
#' @param IdentityUnknownIndicator = "",
#' @param LastUpdateDateTime = "",
#' @param LastUpdateFacility = "",
#' @param SpeciesCode = "",
#' @param BreedCode = "",
#' @param Strain = "",
#' @param ProductionClassCode = "",
#' @param .version = c("2.3.1", "2.4"),
#' @param .FieldSeparator = '|',
#' @param .trim = TRUE
#' @export
PID <-
  function(SetID = "",
           PatientID = "",
           PatientIdentifierList = "",
           AlternatePatientIDPID = "",
           PatientName = PatientNameComponents(),
           MothersMaidenName = "",
           DateTimeOfBirth = "",
           Sex = "",
           PatientAlias = "",
           Race = "",
           PatientAddress = PatientAddressComponents(),
           CountyCode = "",
           PhoneNumberHome = PhoneNumberComponents(),
           PhoneNumberBusiness = PhoneNumberComponents(),
           PrimaryLanguage = "",
           MaritalStatus = "",
           Religion = "",
           PatientAccountNumber = "",
           SSNNumberPatient = "",
           DriversLicenseNumberPatient = "",
           MothersIdentifier = "",
           EthnicGroup = "",
           BirthPlace = "",
           MultipleBirthIndicator = "",
           BirthOrder = "",
           Citizenship = "",
           VeteransMilitaryStatus = "",
           Nationality = "",
           PatientDeathDateandTime = "",
           PatientDeathIndicator = "",
           IdentityReliabilityCode = "",
           IdentityUnknownIndicator = "",
           LastUpdateDateTime = "",
           LastUpdateFacility = "",
           SpeciesCode = "",
           BreedCode = "",
           Strain = "",
           ProductionClassCode = "",
           .version = c("2.3.1", "2.4"),
           .FieldSeparator = '|',
           .trim = TRUE){

    # .parameters not included in environment() and others in order required
    inputs = as.list(environment())

    # TODO check version, predicate can be expanded in future
    version_segment_length <- ifelse(.version[1] == '2.3.1', 30, 38)

    return_value <-
      paste(c('PID', inputs[1:version_segment_length]),
            collapse = .FieldSeparator)

    if (.trim){
      return_value <- trim_trailing_chars(return_value, char = .FieldSeparator)
    }


    class(return_value) <- c('hl7segment', 'pid', class(return_value))

    return_value

  }

#' Components of PID PatientAddress
#'
#' Function will create a character vector of length 1 with input values separated
#' with a ^
#'
#' @param id = '',
#' @param checkDigit = '',
#' @param codeIdentifyingTheCheckDigitSchemeEmployed = '',
#' @param assigningAuthority = '',
#' @param IdentifierTypeCode = '',
#' @param AssigningFacility = '',
#' @param .sep = "^",
#' @param .trim = TRUE
#'
#' @export
PatientIdentifierListComponents <-
  function(id = '',
           checkDigit = '',
           codeIdentifyingTheCheckDigitSchemeEmployed = '',
           assigningAuthority = '',
           IdentifierTypeCode = '',
           AssigningFacility = '',
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

#' Components of PID PatientName
#'
#' Function will create a character vector of length 1 with input values separated
#' with a ^
#'
#' @param familyName = "",
#' @param givenName = "",
#' @param middleName = "",
#' @param suffix = "",
#' @param prefix = "",
#' @param degree = "",
#' @param nameTypeCode = "",
#' @param nameRepresentationCode =  "",
#' @param .sep = "^",
#' @param .trim = TRUE
#'
#' @export
PatientNameComponents <-
  function(familyName = "",
           givenName = "",
           middleName = "",
           suffix = "",
           prefix = "",
           degree = "",
           nameTypeCode = "",
           nameRepresentationCode =  "",
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


#' Components of PID PatientAddress
#'
#' Function will create a character vector of length 1 with input values separated
#' with a ^
#'
#' @param streetAddress = '',
#' @param otherDesignation = '',
#' @param city = '',
#' @param stateProvince = '',
#' @param zipPostcode = '',
#' @param country = '',
#' @param .sep = "^",
#' @param .trim = TRUE
#'
#' @export
PatientAddressComponents <-
  function(streetAddress = '',
           otherDesignation = '',
           city = '',
           stateProvince = '',
           zipPostcode = '',
           country = '',
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

#' Components of PID Race
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
#' @param .sep = "^",
#' @param .trim = TRUE
#'
#' @export
RaceComponents <-
  function(identifier = "",
           text = "",
           nameOfCodingSystem = "",
           alternateIdentifier = "",
           alternateText = "",
           nameOfAlternateCodingSystem = "",
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


#' Components of PID PhoneNumber*
#'
#' Function will create a character vector of length 1 with input values separated
#' with a ^
#'
#' @param anyText = "",
#' @param telecommunicationUseCode = "",
#' @param telecommunicationEquipmentType = "",
#' @param emailAddress = "",
#' @param countryCode = "",
#' @param areaCityCode = "",
#' @param phoneNumber = "",
#' @param extension = "",
#' @param anyText2 = "",
#' @param .sep = "^",
#' @param .trim = TRUE
#'
#' @export
PhoneNumberComponents <-
  function(anyText = "",
           telecommunicationUseCode = "",
           telecommunicationEquipmentType = "",
           emailAddress = "",
           countryCode = "",
           areaCityCode = "",
           phoneNumber = "",
           extension = "",
           anyText2 = "",
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

