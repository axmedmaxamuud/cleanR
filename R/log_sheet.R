#' log_sheet
#'
#' This function is the powerhouse of cleanR, it will reshape your data into a cleaning log shape, just make sure you understood that the question.name variable is the variable that you want to treat/clean. so the old.value should be assocaited with the treating variable.
#'
#' @param data this should be survey data in XML value format
#' @param question.name this will be the variable name
#' @param issue provide further detail on the issue
#' @param action type of action required for the issue
#'
#' @return A logbook with flagged observations from \code{\link{log_sheet}}
#' @export
#'
#' @examples
#' log_sheet()
#' \dontrun{
#' log_sheet(data = data, question.name = "variable", issue = "issue", action = "check")
#' }
#'
log_sheet <- function(data, question.name, issue, action){
  cleaning_logbook <- data.frame("uuid" = as.character(),
                                 "question.name" = as.character(),
                                 "issue" = as.character(),
                                 "feedback" = as.character(),
                                 "action" = as.character(),
                                 "old.value" = as.character(),
                                 "new.value" = as.character(),
                                 stringsAsFactors = F)
  if(nrow(data) > 0){
    for(a in 1:nrow(data)) {
      cleaning_logbook <- cleaning_logbook %>%
        add_row(
          tibble_row(
            uuid = as.character(data[a, "uuid"]),
            question.name = as.character(question.name),
            issue = as.character(issue),
            feedback = as.character(""),
            action = as.character(action),
            old.value = as.character(data[a, question.name]),
            new.value = as.character("")

          )
        )
    }
  }
  return(cleaning_logbook)
}
