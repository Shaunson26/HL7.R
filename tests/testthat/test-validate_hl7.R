# TODO split to individual test_thats
test_that("HL7 validation works", {

  # A single MSH
  tmp_hl7 <- tempfile(fileext = ".hl7")
  cat("MSH|||", "PID|||",
      file = tmp_hl7,
      sep = "\n")
  expect_invisible(validate_hl7(tmp_hl7))
  unlink(tmp_hl7)

  # A batch
  tmp_hl7 <- tempfile(fileext = ".hl7")
  cat("FHS|||", "BHS|||", "MSH|||", "PID|||",
      file = tmp_hl7,
      sep = "\n")
  expect_invisible(validate_hl7(tmp_hl7))
  unlink(tmp_hl7)

  # Ill formed messages
  # * no header
  tmp_hl7 <- tempfile(fileext = ".hl7")
  cat("PID|||", "MSH|||",
      file = tmp_hl7,
      sep = "\n")
  expect_error(validate_hl7(tmp_hl7), regexp = '^The data specified does not appear to be valid HL7')
  unlink(tmp_hl7)

  # * no linebreaks
  tmp_hl7 <- tempfile(fileext = ".hl7")
  cat("FHS|||", "BHS|||", "MSH|||", "PID|||",
      file = tmp_hl7,
      sep = "")
  expect_error(validate_hl7(tmp_hl7), regexp = '^HL7 message is too short')
  unlink(tmp_hl7)

})
