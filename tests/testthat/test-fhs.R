test_that("FHS() works", {
  fhs_real = 'FHS|^~\\&|LABTRAK|4|PATH_RESULTS|6|202107020955|8|\\labserver\\trakcarelablive\\EDI\\OUT\\NSW291.HL7|10|11|12'
  fhs_parameter_position = FHS('|',"^~\\&",'LABTRAK',4,'PATH_RESULTS',6,'202107020955',8,"\\labserver\\trakcarelablive\\EDI\\OUT\\NSW291.HL7",10,11,12)

  # text only
  expect_equal(fhs_real, as.character(fhs_parameter_position))
})
