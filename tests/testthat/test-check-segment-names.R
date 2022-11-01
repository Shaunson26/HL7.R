test_that("segment names parse correctly", {

  hl7_file <- system.file(package = 'HL7.NCIMS.R', 'extdata/Hepatitis-A-Virus.hl7')

  hl7_list <- parse_hl7_message(hl7_file)

  # TODO OBX. for missing
  expected_names <- c('MSH','PID','NK1','ORC','OBR','OBX','OBR','OBX.1','OBX.2')

  expect_identical(names(hl7_list), expected_names)
})
