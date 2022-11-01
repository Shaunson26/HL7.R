test_that("PID() works", {

  pid_real = 'PID|1||11572935.RAN^^^SEALS^MR||Chan^Jin^^^MR||199506270000|M||4^Neither Aboriginal/Torres St|100 Straight Rd^^Artarmon^NSW^2064^Australia^C||123456789^PRN^PH^^^^123456789|||||||||||N||||||N'

  pid_explicit <-
    PID(
      SetID = "1",
      PatientID = "",
      PatientIdentifierList = "11572935.RAN^^^SEALS^MR",
      AlternatePatientIDPID = "",
      PatientName = "Chan^Jin^^^MR",
      MothersMaidenName = "",
      DateTimeOfBirth = "199506270000",
      Sex = "M",
      PatientAlias = "",
      Race = "4^Neither Aboriginal/Torres St",
      PatientAddress = "100 Straight Rd^^Artarmon^NSW^2064^Australia^C",
      CountyCode = "",
      PhoneNumberHome = PhoneNumberComponents(anyText = "123456789",
                                              telecommunicationUseCode = "PRN",
                                              telecommunicationEquipmentType = "PH",
                                              phoneNumber = "123456789"),
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
      MultipleBirthIndicator = "N",
      BirthOrder = "",
      Citizenship = "",
      VeteransMilitaryStatus = "",
      Nationality = "",
      PatientDeathDateandTime = "",
      PatientDeathIndicator = "N"
    )

  pid_minimal <-
    PID(
      SetID = "1",
      PatientIdentifierList = "11572935.RAN^^^SEALS^MR",
      PatientName = "Chan^Jin^^^MR",
      MothersMaidenName = "",
      DateTimeOfBirth = "199506270000",
      Sex = "M",
      Race = "4^Neither Aboriginal/Torres St",
      PatientAddress = "100 Straight Rd^^Artarmon^NSW^2064^Australia^C",
      PhoneNumberHome = PhoneNumberComponents(anyText = "123456789",
                                              telecommunicationUseCode = "PRN",
                                              telecommunicationEquipmentType = "PH",
                                              phoneNumber = "123456789"),
      MultipleBirthIndicator = "N",
      PatientDeathIndicator = "N"
    )

  # Manual inspection
  #cat(pid_real, pid_explicit, sep = '\n')
  #cat(pid_real, pid_minimal, sep = '\n')

  # text only
  expect_equal(pid_real, as.character(pid_explicit))
  expect_equal(pid_real, as.character(pid_minimal))
  # classes etc
  expect_identical(pid_explicit, pid_minimal)
})
