#' Split a HL7 segment into respective fields
#'
#' This function simply does a \code{strsplit()} routine, and will do this for
#' sub-components as well.
#'
#' @param segment a character vector
#' @param FieldSeparator character, splits this
#' @param ComponentSeparator character, splits this
#' @param SubcomponentSeparator character, splits this
#' @param FieldRepeatSeparator character, splits this
split_segment <- function(segment, FieldSeparator = "|", ComponentSeparator = "^", SubcomponentSeparator = "&", FieldRepeatSeparator = "~"){

  segment_1 <-
    strsplit_as_list(segment, split = FieldSeparator)

  for(i in seq_along(segment_1)){

    has_split = grepl(ComponentSeparator, x = segment_1[[i]], fixed = TRUE)

    if (segment_1[[1]] == 'MSH' & i == 2) {
      has_split <- FALSE
    }

    if (has_split) {

      segment_1_i <- strsplit_as_list(segment_1[[i]], split = ComponentSeparator)

      for(j in seq_along(segment_1_i)) {

        has_split = grepl(SubcomponentSeparator, x = segment_1_i[[j]], fixed = TRUE)

        if (has_split) {

          segment_1_i[[j]] <- strsplit_as_list(segment_1_i[[j]], split = SubcomponentSeparator)

        }
      }
      segment_1[[i]] <- segment_1_i
    }
  }

  segment_1
}

