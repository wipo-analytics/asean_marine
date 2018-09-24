#' Separate and Trim Rows
#' @description Use for splitting concatenated columns by rows. White space is trimmed on both sides of the split column and is also trimmed on the id column supplied e.g. dois, isi unique article identifiers or patent numbers. Trimming of the id field ensures accurate counts.
#' @param x a data frame
#' @param col The column to be separated into rows
#' @param sep the separator e.g. ";
#' @param id The column to use as the id (typically for counts)
#'
#' @return a data frame
#' @export
#'
#' @examples
separate_trim <- function(x, col = NULL, sep = NULL, id = NULL){
  df <- x %>% tidyr::separate_rows(col, sep = ";")
  df[[col]] <- trimws(df[[col]], which = "both")
  df[[id]] <- trimws(df[[id]], which = "both") # trimws from the id field
  df
}
