test_that("extra arguments to matches passed onto grepl", {
  expect_success(expect_match("te*st", "e*", fixed = TRUE))
  expect_success(expect_match("test", "TEST", ignore.case = TRUE))
})

test_that("special regex characters are escaped in output", {
  error <- tryCatch(expect_match("f() test", "f() test"), expectation = function(e) e$message)
  expect_equal(error, "\"f\\(\\) test\" does not match \"f() test\".\nActual value: \"f\\(\\) test\"")
})

test_that("correct reporting of expected label", {
  expect_failure(expect_match("[a]", "[b]"), escape_regex("[a]"), fixed = TRUE)
  expect_failure(expect_match("[a]", "[b]", fixed = TRUE), "[a]", fixed = TRUE)
})

test_that("errors if obj is empty str", {
  expect_error(expect_match(character(0), 'asdf'), 'is empty')
})

test_that("prints multiple unmatched values", {
  expect_error(expect_match(c('x', 'y'), 'z'), "x.*y")
})
