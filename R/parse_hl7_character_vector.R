#' Parse a HL7 character vector
#'
#' The work horse of HL7 parsing
#'
#' @param hl7_char character, a character vector from a valid HL7 file
#' @param name_fields boolean, whether to name fields within segements
#' @param dev_msg boolean, whether to print package development messages
#'
#' @return a list
#'
#' @export
parse_hl7_character_vector <- function(hl7_char, name_fields = TRUE, dev_msg = F){

  field_separators <- extract_field_separators(hl7_char)

  # Parse message
  hl7_list <- list()

  for(i in seq_along(hl7_char)){

    segment_list <- split_segment(hl7_char[i],
                                  FieldSeparator = field_separators$field_sep,
                                  SubcomponentSeparator = field_separators$subcomponent_sep,
                                  FieldRepeatSeparator = field_separators$repetition_sep)

    segment_name <- segment_list[[1]]

    hl7_list[[i]] <- segment_list[-1]

    names(hl7_list[[i]]) <- segment_names[[segment_name]][1:length(hl7_list[[i]])]

    names(hl7_list)[i] <- segment_name

    # Numbering repeatable fields?
    set_id = hl7_list[[i]][1]

    if (segment_name %in% c('OBX') & set_id != ''){
      names(hl7_list)[i] <- paste(segment_name, set_id, sep = '.')
    }

    rm(list = c('segment_list', 'segment_name', 'i'))
  }

  # Add nested names
  if (name_fields) {
    for(i in seq_along(hl7_list)){
      hl7_list[[i]] <- add_field_names(hl7_list[[i]], dev_msg = dev_msg)
    }
  }

  return(hl7_list)
}
