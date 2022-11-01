#' Helper function for strsplit
#'
#' Helps extract the result of \code{strsplit} and then return it as a list
#'
#' @param x a character vector
#' @param split character, what to split, passed on to strsplit
strsplit_as_list <- function(x, split){
  x %>%
    strsplit(split = split, fixed = T) %>%
    unlist() %>%
    as.list()
}
