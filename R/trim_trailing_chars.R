#' Trim trailing characters from character vector
#'
#' Trim trailing characters from character vector
#'
#' @param x character, string to trim
#' @param char character, character to trim from end of string
#'
trim_trailing_chars <- function(x, char){
  escape = ifelse(char %in% c('^', '|'), '\\', '')
  pattern <- sprintf('%s%s{1,}$', escape, char)
  #print(pattern)
  sub(pattern = pattern, replacement = '', x = x)
}
