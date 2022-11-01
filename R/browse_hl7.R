#' Browse a parsed HL7
#'
#' Browse a parsed HL7 in the viewer pane. This function uses the details and summary
#' HTML tags for effect
#'
#' @param x a HL7 file to parse
#'
#'
#' @export
browse_hl7 <- function(x){

  summary_details <- function(x, padding_left = 0){
    style = sprintf('padding-left: %sem;', padding_left)

    paste(x) %>%
      htmltools::tags$summary(style=style) %>%
      htmltools::tags$details()
  }

  parsed_hl7 <- parse_hl7_message(x)


  hl7_details <- list()

  for (segment_i in seq_along(parsed_hl7)) {

    # extract segment
    segment <- parsed_hl7[[segment_i]]

    # output object
    segment_elements <- list()

    # for each segment element
    for (element_i in seq_along(segment)) {

      # extract element
      element <- segment[[element_i]]

      if (length(element) == 1) {

        out <-
          paste(element_i, element, sep = '. ') %>%
          summary_details(padding_left = 1)

      } else {

        out <- list()

        for(subelement_i in seq_along(element)) {

          subelement <- element[[subelement_i]]

          out[[subelement_i]] <-
            paste(subelement_i, subelement, sep = '. ') %>%
            summary_details(padding_left = 2)
        }

        out <-
          htmltools::tags$details(open = 'open',
            htmltools::tags$summary(
              style = 'padding-left: 1em;',
              paste0(element_i, '. '),
            ),
            out
          )
      }

      # combine element_i
      segment_elements[[element_i]] <- out
    }

    hl7_details[[segment_i]] <-
      htmltools::tags$details(
        htmltools::tags$summary(
          names(parsed_hl7[segment_i]) %>% htmltools::tags$strong(),
          style = 'cursor: pointer'
        ),
        segment_elements
      )

  }



  htmltools::tagList(htmltools::tags$h3(attr(parsed_hl7, 'filename')),
          hl7_details) %>%
    htmltools::browsable()
}
