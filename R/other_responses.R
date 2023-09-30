
#' Check other responses
#'
#' This function will flag all other responses provided in the data, make sure to have a list of all other column.
#'
#' @param data this should be survey data in XML value format
#' @param other_columns list of all other responses variables, usually prepare this list from the XLSX tool
#'
#' @return
#' @export
#'
#' @examples
check_other_responses <- function(data, other_columns){
  df <- data %>% dplyr::select("uuid", other_columns) %>%

    pivot_longer(other_columns,
                 names_to = "question.name",
                 values_to = "old.value") %>%
    dplyr::filter(!is.na(old.value)) %>% dplyr::filter(!old.value %in% c("", TRUE, FALSE, 1, 0, "VRAI", "FAUX", "TRUE", "FALSE", "<NA>", "NA")) %>%
    dplyr::mutate(
      issue = "Other response that need to be checked and recoded",
      feedback = "",
      action = "translate and recode",
      new.value = ""
    ) %>% select(
      uuid, question.name, issue, feedback, action, old.value, new.value
    )

}

