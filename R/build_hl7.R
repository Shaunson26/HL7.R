#' Build HL7 character vector from segment functions
#'
#' Build a character vector from segment functions for export as HL7 text files
#' The function only accepts objects from the segment functions MSH(), OBR(), etc.
#' The first segment must be MSH().
#'
#' @param ... segment functions MSH(), OBR(), etc.
#'
#' @return character vector of length equal to the number of segment functions and
#' of class 'hl7vector'
#'
#' @examples build_hl7(MSH(), PID())
#'
#' @export
build_hl7 <- function(...){
  dots <- list(...)
  dot_classes <- sapply(dots, function(x) class(x)[1])
  stopifnot('Only HL7 segment objects can be inlcuded (MSH(), PID(), ...)' = all(dot_classes == 'hl7segment'))
  stopifnot('The first segment should be MSH()' = class(dots[[1]])[2] == 'msh')

  result_value <- do.call(c, dots)
  class(result_value) <- c('hl7vector', class(result_value))
  result_value
}
