test_that("build_hl7 build parse works", {

  # TODO
  a_hl7 <-
    build_hl7(
      MSH(EncodingCharacters = EncodingCharactersComponents(),
          SendingApplication = 1,
          SendingFacility = SendingFacilityComponents(2.1,2.2,2.3),
          ReceivingApplication = 3,
          ReceivingFacility = 4,
          DateTimeOfMessage = 5,
          Security = 6,
          MessageType = MessageTypeComponents(7.1,7.2,7.3),
          MessageControlID = 8,
          ProcessingID = 9,
          VersionID = 10,
          SequenceNumber = 11,
          ContinuationPointer = 12,
          AcceptAcknowledgmentType = 13,
          ApplicationAcknowledgmentType = 14,
          CountryCode = 15,
          CharacterSet = 16,
          PrincipalLanguageOfMessage = 17,
          AlternateCharacterSetHandlingScheme = 18,
          ConformanceStatementID = 19,
          .FieldSeparator = '|',
          .version = "2.3.1"
      ),
      PID(SetID = 1,
          PatientID = 2,
          PatientIdentifierList = 3,
          AlternatePatientIDPID = 4,
          PatientName = PatientNameComponents(5.1,5.2,5.3,5.4,5.5,5.6,5.7,5.8),
          MothersMaidenName = 6,
          DateTimeOfBirth = 7,
          Sex = 8,
          PatientAlias = 9,
          Race = 10,
          PatientAddress = PatientAddressComponents(11.1,11.2,11.3,11.4,11.5,11.6),
          CountyCode = 12,
          PhoneNumberHome = PhoneNumberComponents(13.1,13.2,13.3,13.4,13.5,13.6,13.7,13.8),
          PhoneNumberBusiness = PhoneNumberComponents(14.1,14.2,14.3,14.4,14.5,14.6,14.7,14.8),
          PrimaryLanguage = 15,
          MaritalStatus = 16,
          Religion = 17,
          PatientAccountNumber = 18,
          SSNNumberPatient = 19,
          DriversLicenseNumberPatient = 20,
          MothersIdentifier = 21,
          EthnicGroup = 22,
          BirthPlace = 23,
          MultipleBirthIndicator = 24,
          BirthOrder = 25,
          Citizenship = 26,
          VeteransMilitaryStatus = 27,
          Nationality = 28,
          PatientDeathDateandTime = 29,
          PatientDeathIndicator = 30,
          IdentityReliabilityCode = 31,
          IdentityUnknownIndicator = 32,
          LastUpdateDateTime = 33,
          LastUpdateFacility = 34,
          SpeciesCode = 35,
          BreedCode = 36,
          Strain = 37,
          ProductionClassCode = 38)
    )

  tmp_hl7 <- tempfile(fileext = ".hl7")

  cat(a_hl7,
      file = tmp_hl7,
      sep = "\n")

  parsed_hl7 <- parse_hl7_message(tmp_hl7)

  unlink(tmp_hl7)

  # Should be increasing
  segment <- parsed_hl7$MSH
  #create_test_text(segment) %>% clipr::write_clip()

  expect_equal(segment$EncodingCharacters, "^~\\&")
  expect_equal(segment$SendingApplication, "1")
  expect_equal(segment$SendingFacility[[1]], "2.1")
  expect_equal(segment$SendingFacility[[2]], "2.2")
  expect_equal(segment$SendingFacility[[3]], "2.3")
  expect_equal(segment$ReceivingApplication, "3")
  expect_equal(segment$ReceivingFacility, "4")
  expect_equal(segment$DateTimeOfMessage, "5")
  expect_equal(segment$Security, "6")
  expect_equal(segment$MessageType$messageType, "7.1")
  expect_equal(segment$MessageType$triggerEvent, "7.2")
  expect_equal(segment$MessageType$MessageStructure, "7.3")
  expect_equal(segment$MessageControlID, "8")
  expect_equal(segment$ProcessingID, "9")
  expect_equal(segment$VersionID, "10")
  expect_equal(segment$SequenceNumber, "11")
  expect_equal(segment$ContinuationPointer, "12")
  expect_equal(segment$AcceptAcknowledgmentType, "13")
  expect_equal(segment$ApplicationAcknowledgmentType, "14")
  expect_equal(segment$CountryCode, "15")
  expect_equal(segment$CharacterSet, "16")
  expect_equal(segment$PrincipalLanguageOfMessage, "17")
  expect_equal(segment$AlternateCharacterSetHandlingScheme, "18")

  segment <- parsed_hl7$PID
  #create_test_text(segment) %>% cat(sep="\n")

  expect_equal(segment$SetID, "1")
  expect_equal(segment$PatientID, "2")
  expect_equal(segment$PatientIdentifierList, "3")
  expect_equal(segment$AlternatePatientIDPID, "4")
  expect_equal(segment$PatientName$familyName, "5.1")
  expect_equal(segment$PatientName$givenName, "5.2")
  expect_equal(segment$PatientName$middleName, "5.3")
  expect_equal(segment$PatientName$suffix, "5.4")
  expect_equal(segment$PatientName$prefix, "5.5")
  expect_equal(segment$PatientName$degree, "5.6")
  expect_equal(segment$PatientName$nameTypeCode, "5.7")
  expect_equal(segment$PatientName$nameRepresentationCode, "5.8")
  expect_equal(segment$MothersMaidenName, "6")
  expect_equal(segment$DateTimeOfBirth, "7")
  expect_equal(segment$Sex, "8")
  expect_equal(segment$PatientAlias, "9")
  expect_equal(segment$Race, "10")
  expect_equal(segment$PatientAddress$streetAddress, "11.1")
  expect_equal(segment$PatientAddress$otherDesignation, "11.2")
  expect_equal(segment$PatientAddress$city, "11.3")
  expect_equal(segment$PatientAddress$stateProvince, "11.4")
  expect_equal(segment$PatientAddress$zipPostcode, "11.5")
  expect_equal(segment$PatientAddress$country, "11.6")
  expect_equal(segment$CountyCode, "12")
  expect_equal(segment$PhoneNumberHome$anyText, "13.1")
  expect_equal(segment$PhoneNumberHome$telecommunicationUseCode, "13.2")
  expect_equal(segment$PhoneNumberHome$telecommunicationEquipmentType, "13.3")
  expect_equal(segment$PhoneNumberHome$emailAddress, "13.4")
  expect_equal(segment$PhoneNumberHome$countryCode, "13.5")
  expect_equal(segment$PhoneNumberHome$areaCityCode, "13.6")
  expect_equal(segment$PhoneNumberHome$phoneNumber, "13.7")
  expect_equal(segment$PhoneNumberHome$extension, "13.8")
  expect_equal(segment$PhoneNumberBusiness$anyText, "14.1")
  expect_equal(segment$PhoneNumberBusiness$telecommunicationUseCode, "14.2")
  expect_equal(segment$PhoneNumberBusiness$telecommunicationEquipmentType, "14.3")
  expect_equal(segment$PhoneNumberBusiness$emailAddress, "14.4")
  expect_equal(segment$PhoneNumberBusiness$countryCode, "14.5")
  expect_equal(segment$PhoneNumberBusiness$areaCityCode, "14.6")
  expect_equal(segment$PhoneNumberBusiness$phoneNumber, "14.7")
  expect_equal(segment$PhoneNumberBusiness$extension, "14.8")
  expect_equal(segment$PrimaryLanguage, "15")
  expect_equal(segment$MaritalStatus, "16")
  expect_equal(segment$Religion, "17")
  expect_equal(segment$PatientAccountNumber, "18")
  expect_equal(segment$SSNNumberPatient, "19")
  expect_equal(segment$DriversLicenseNumberPatient, "20")
  expect_equal(segment$MothersIdentifier, "21")
  expect_equal(segment$EthnicGroup, "22")
  expect_equal(segment$BirthPlace, "23")
  expect_equal(segment$MultipleBirthIndicator, "24")
  expect_equal(segment$BirthOrder, "25")
  expect_equal(segment$Citizenship, "26")
  expect_equal(segment$VeteransMilitaryStatus, "27")
  expect_equal(segment$Nationality, "28")
  expect_equal(segment$PatientDeathDateandTime, "29")
  expect_equal(segment$PatientDeathIndicator, "30")

})

test_that("build_hl7 creates hl7vector", {

  a_hl7 <- build_hl7(MSH(), OBR(), PID())

  expect_equal(
    object = class(a_hl7),
    expected = c("hl7vector", "character")
  )


})

test_that("build_hl7 builds correct length", {

  a_hl7 <- build_hl7(MSH(), OBR(), PID())

  expect_equal(
    object = length(a_hl7),
    expected =  3
  )

})

test_that("build_hl7() only accepts hl7segments", {

  expect_error(object = build_hl7(MSH(), 'a'))

})

test_that("MSH() must be first argument in build_hl7()", {

  expect_error(build_hl7(PID(), MSH()))

})
