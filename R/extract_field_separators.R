#' Extract field separators from with the MSH segment of a HL7 message
#'
#' These are usually default, but if not, they'l; be captured and used for parsing
#' a message
#'
#' @param hl7_char a character vector, the lines from a HL7 message
extract_field_separators <- function(hl7_char){

  # Identify the Field Delimiter
  field_sep <- substr(hl7_char[1], 4, 4)

  if(field_sep != '|'){
    warning('This HL7 data uses a different field seperator than is recommended. `|` is recommended. `', field_sep, '` is used.')
  }

  # Identify and Validate Other Delimiters
  MSH.2 <- strsplit(hl7_char[1], field_sep, fixed = TRUE)[[1]][2]

  if(nchar(MSH.2) != 4){
    stop('Non-Standard Number of Encoding Characters Found in MSH.2. Expected 4, got ', nchar(MSH.2))
  }

  if(grepl('[A-Z a-z 0-9]', MSH.2)){
    warning('Alphanumeric Encoding Characters Found in MSH.2. This is likely an error!', MSH.2)
  }

  component_sep <- substr(MSH.2, 1, 1)
  repetition_sep <- substr(MSH.2, 2, 2)
  escape_char <- substr(MSH.2, 3, 3)
  subcomponent_sep <- substr(MSH.2, 4, 4)

  list(
    field_sep = field_sep,
    component_sep = component_sep,
    repetition_sep = repetition_sep,
    escape_char = escape_char,
    subcomponent_sep = subcomponent_sep
  )
}
