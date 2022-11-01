#' Add names within HL7 segments - field names
#'
#' This function examines the lengths of elements within a parsed HL7 and if the
#' length is > 1, it will compare the element name to a list of gathered names in
#' \code{segment_names}. If names are found, the field names will be applied
#'
#' @param hl7_list_element a list, that from one after HL7 parsing has been conducted
#' @param dev_msg boolean, development message - reveal field which still require names
add_field_names <- function(hl7_list_element, dev_msg = FALSE){

  # named numerical vector from named T/F vector
  need_field_names_inds <- which(sapply(hl7_list_element, length) > 1)
  need_field_names <- names(need_field_names_inds)

  # match names to collect names list (not exhaustive)
  have_field_names <- need_field_names[need_field_names %in% names(segment_names)]

  to_do_names <- setdiff(need_field_names, have_field_names)

  if (length(to_do_names) > 0 & dev_msg) {
    message('Still need segment_names for: ', paste(to_do_names, collapse = ', '))
  }

  for(field_name_id in have_field_names){

    # TODO do something about element differences (2.3.1 vs 2.4)
    # 2.4 have more elements, need ot match lengths
    # Trailing empty elements can be missing need to match lengths
    element_length <- length(hl7_list_element[[field_name_id]])
    names_length <- length(segment_names[[field_name_id]])

    length_to_use <- ifelse(element_length > names_length, names_length, element_length)

    names(hl7_list_element[[field_name_id]]) <- segment_names[[field_name_id]][seq(length_to_use)]

    hl7_list_element[[field_name_id]] <- add_field_names(hl7_list_element[[field_name_id]], dev_msg)
  }

  hl7_list_element
}
