
#' Non-responses
#'
#' @param data data set in XML values format
#'
#' @return
#' @export
#'
#' @examples
get_na_response_rates <- function(data) {
  non_response_df <- data %>%
    summarise(across(everything(), ~ sum(is.na(.), na.rm = TRUE))) %>%
    mutate(perc_non_response = (rowSums(.) / nrow(data)) * 100) %>%
    rownames_to_column("question") %>%
    arrange(num_non_response, question)

  return(non_response_df)
}
