#' Parse a HL7 2.x message
#'
#' Parse a given HL7 file. Function will validate input file and parse both
#' single and batch HL7 messages.
#'
#' @param file A file containing a valid HL7 feed
#'
#' @return a list
#'
#' @export
parse_hl7_message <- function(file){

  validate_hl7(file)

  hl7_char <- readLines(file, warn = F)

  # batch
  if (grepl('^BHS|^FHS', hl7_char[1])) {

    msh_lines <- grep('^MSH', hl7_char)

    message('Found ', length(msh_lines), ' messages within file')

    msg_lines <-
      cbind(msh_lines,
            append(msh_lines[-1]-1, length(hl7_char)))

    hl7_list <-
      lapply(1:nrow(msg_lines), function(i) {

        line_range = msg_lines[i, 1]:msg_lines[i,2]
        parse_hl7_character_vector(hl7_char[line_range])

      })

  }

  # single
  if (grepl('^MSH', hl7_char[1])) {
    hl7_list <- parse_hl7_character_vector(hl7_char)
  }

  attr(hl7_list, 'filename') <- base::basename(file)

  hl7_list

}
