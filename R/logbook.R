#' @title logbook
#'
#' @description
#' This function will create a blank logbook that will be used to store observations with issues
#'
#' @param  NA No input or argument is required for the function
#'
#'
#' @return An empty logbook from \code{\link{logbook}}
#' @export
#'
#' @examples
#' logbook()
#' \dontrun{
#' cleaning_log <- logbook()
#' }
#'
#'
logbook <- function() {
  data.frame(
    uuid = numeric(),
    question.name = numeric(),
    issue = character(),
    feedback = character(),
    action = as.character(),
    old.value = as.character(),
    new.value = as.character()
  )

}
