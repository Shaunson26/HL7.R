#' Helper for writing tests
#'
#' Sneaky way for testing. Flatten a segment element, fix the names to select the list
#' element (. to $ and trail numbers with [[]]), and create string to use with \code{expect_equal()}.
#' \code{cat()} the result and paste into test script. An even sneaker thing is to parse
#' the text and evaluate it. \cr
#' \cr
#' zz = create_test_text(segment)\cr
#' eval(parse(text = zz))\cr
#' \cr
#'
#' @param x list, segment from parsing
create_test_text <- function(x){
  segment_flat <- unlist(x)

  segment_flat_names <- names(segment_flat)
  segment_flat_names <- gsub('\\.', '\\$',segment_flat_names)
  segment_flat_names <-  gsub('(\\d)', '[[\\1]]', segment_flat_names)

  paste0('expect_equal(segment$', segment_flat_names, ', "', segment_flat, '")')
}
