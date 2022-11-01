test_that("BHS() works", {
  bhs_real = 'BHS|^~\\&|LABTRAK|4|PATH_RESULTS|6|202107020955|8|\\labserver\\trakcarelablive\\EDI\\OUT\\NSW291.HL7|10|11|12'
  bhs_parameter_position = BHS('|',"^~\\&",'LABTRAK',4,'PATH_RESULTS',6,'202107020955',8,"\\labserver\\trakcarelablive\\EDI\\OUT\\NSW291.HL7",10,11,12)

  # text only
  expect_equal(bhs_real, as.character(bhs_parameter_position))
})
