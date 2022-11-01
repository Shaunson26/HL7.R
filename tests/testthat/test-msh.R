test_that("MSH() works", {

  # \\& escaped
  msh_real <- 'MSH|^~\\&|OMNI-Lab_11|SEALS^2206^AUSNATA|eNotification||20220210062321+1000||ORU^R01^ORU_R01|SEALS_20220210.7981|P|2.4^AUS&Australia&ISO3166|602287501||||AU^Australia^ISO3166||EN^English^ISO639-1'

  msh_test_explicit <-
    MSH(EncodingCharacters = EncodingCharactersComponents(),
        SendingApplication = "OMNI-Lab_11",
        SendingFacility = 'SEALS^2206^AUSNATA', #SendingFacilityComponents(),
        ReceivingApplication = "eNotification",
        ReceivingFacility = "",
        DateTimeOfMessage = "20220210062321+1000",
        Security = "",
        MessageType = "ORU^R01^ORU_R01", #MessageTypeComponents(),
        MessageControlID = "SEALS_20220210.7981",
        ProcessingID = "P",
        VersionID = "2.4^AUS&Australia&ISO3166",
        SequenceNumber = "602287501",
        ContinuationPointer = "",
        AcceptAcknowledgmentType = "",
        ApplicationAcknowledgmentType = "",
        CountryCode = "AU^Australia^ISO3166",
        CharacterSet = "",
        PrincipalLanguageOfMessage = "EN^English^ISO639-1",
        AlternateCharacterSetHandlingScheme = "",
        .FieldSeparator = "|",
        .version = '2.3.1'
    )

  msh_test_minimal <-
    MSH(SendingApplication = "OMNI-Lab_11",
        SendingFacility = 'SEALS^2206^AUSNATA', #SendingFacilityComponents(),
        ReceivingApplication = "eNotification",
        DateTimeOfMessage = "20220210062321+1000",
        MessageType = "ORU^R01^ORU_R01", #MessageTypeComponents(),
        MessageControlID = "SEALS_20220210.7981",
        ProcessingID = "P",
        VersionID = "2.4^AUS&Australia&ISO3166",
        SequenceNumber = "602287501",
        CountryCode = "AU^Australia^ISO3166",
        PrincipalLanguageOfMessage = "EN^English^ISO639-1"
    )

  # text only
  expect_equal(msh_real, as.character(msh_test_explicit))
  expect_equal(msh_real, as.character(msh_test_minimal))
  # classes etc
  expect_identical(msh_test_explicit, msh_test_minimal)
})

test_that("MSH(.version = 2.4) works", {

  # \\& escaped
  msh_real <- 'MSH|^~\\&|OMNI-Lab_11|SEALS^2206^AUSNATA|eNotification||20220210062321+1000||ORU^R01^ORU_R01|SEALS_20220210.7981|P|2.4^AUS&Australia&ISO3166|602287501||||AU^Australia^ISO3166||EN^English^ISO639-1'

  msh_test_explicit <-
    MSH(.version = 2.4,
        .FieldSeparator = "|",
        EncodingCharacters = EncodingCharactersComponents(),
        SendingApplication = "OMNI-Lab_11",
        SendingFacility = 'SEALS^2206^AUSNATA', #SendingFacilityComponents(),
        ReceivingApplication = "eNotification",
        ReceivingFacility = "",
        DateTimeOfMessage = "20220210062321+1000",
        Security = "",
        MessageType = "ORU^R01^ORU_R01", #MessageTypeComponents(),
        MessageControlID = "SEALS_20220210.7981",
        ProcessingID = "P",
        VersionID = "2.4^AUS&Australia&ISO3166",
        SequenceNumber = "602287501",
        ContinuationPointer = "",
        AcceptAcknowledgmentType = "",
        ApplicationAcknowledgmentType = "",
        CountryCode = "AU^Australia^ISO3166",
        CharacterSet = "",
        PrincipalLanguageOfMessage = "EN^English^ISO639-1",
        AlternateCharacterSetHandlingScheme = ""
    )

  msh_test_minimal <-
    MSH(.version = 2.4,
        SendingApplication = "OMNI-Lab_11",
        SendingFacility = 'SEALS^2206^AUSNATA', #SendingFacilityComponents(),
        ReceivingApplication = "eNotification",
        DateTimeOfMessage = "20220210062321+1000",
        MessageType = "ORU^R01^ORU_R01", #MessageTypeComponents(),
        MessageControlID = "SEALS_20220210.7981",
        ProcessingID = "P",
        VersionID = "2.4^AUS&Australia&ISO3166",
        SequenceNumber = "602287501",
        CountryCode = "AU^Australia^ISO3166",
        PrincipalLanguageOfMessage = "EN^English^ISO639-1"
    )

  # text only
  expect_equal(msh_real, as.character(msh_test_explicit))
  expect_equal(msh_real, as.character(msh_test_minimal))
  # classes etc
  expect_identical(msh_test_explicit, msh_test_minimal)
})
