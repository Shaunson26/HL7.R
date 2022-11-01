#' Custom print methods for HL7 objects
#'
#' Simply to make things print noice.
#'
#' @param x character, what to print
#' @param ..., passed onto print
#'
#' importFrom base print
#' @export
#' @method print hl7segment
print.hl7segment <- function(x, ...){
  cat(x, sep = "\n")
}

#' importFrom base print
#'
#' @param x character, what to print
#' @param ..., passed onto print
#'
#' @export
#' @method print hl7vector
print.hl7vector <- function(x, ...){
  cat(x, sep = '\n')
}
