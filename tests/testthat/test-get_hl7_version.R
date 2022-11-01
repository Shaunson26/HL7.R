test_that("selects correct element", {
  expect_equal(get_hl7_version('MSH|||||||||||2.4|||||'), '2.4')
  expect_equal(get_hl7_version('MSH|||||||||||2.4^|||||'), '2.4')
})

test_that("fails on wrong segment", {
  expect_error(get_hl7_version('ABC|||||||||||2.4|||||'))
})



