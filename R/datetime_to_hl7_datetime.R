#' Convert a date or datetime to HL7 datetime
#'
#' Simple wrapper to convert to date/datetime without any separators
#'
#' @param x date/datetime, object with class in c("Date", "POSIXct", "POSIXt")
#'
#' @export
datetime_to_hl7_datetime <- function(x){
  # TODO UTC +x value
  x_class = class(x)[1]
  stopifnot('x must be a Date or Time' = x_class %in% c("Date", "POSIXct", "POSIXt"))
  if (x_class == 'Date') {
    format(x, format = '%Y%m%d')
  } else {
    format(x, format = '%Y%m%d%H%M%S')
  }
}
