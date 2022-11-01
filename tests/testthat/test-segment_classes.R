test_that("segments have correct classes", {
  expect_identical(class(MSH()), c("hl7segment", "msh", "character"))
  expect_identical(class(OBR()), c("hl7segment", "obr", "character"))
  expect_identical(class(OBX()), c("hl7segment", "obx", "character"))
  expect_identical(class(ORC()), c("hl7segment", "orc", "character"))
  expect_identical(class(PID()), c("hl7segment", "pid", "character"))
  expect_identical(class(PV1()), c("hl7segment", "pv1", "character"))
})
