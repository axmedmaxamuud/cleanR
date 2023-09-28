
#' survey time check
#'
#' @param df data frame in XML Values format
#' @param time_min minimum time to complete the survey
#' @param time_max maximum time to complete the survey
#'
#' @return
#' @export
#'
#' @examples

survey_time <- function(df, time_min, time_max) {
  # Check if 'start' and 'end' columns exist in the data frame
  if (!all(c("start", "end") %in% colnames(df))) {
    stop("The 'start' and 'end' columns are not found in the data.")
  }

  df <- df %>%
    mutate(interview_duration = difftime(as.POSIXct(ymd_hms(end)), as.POSIXct(ymd_hms(start)), units = "mins"),
           CHECK_interview_duration = case_when(
             interview_duration < time_min ~ "Too short",
             interview_duration > time_max ~ "Too long",
             TRUE ~ "Okay"
           )) %>%
    filter(CHECK_interview_duration %in% c("Too short", "Too long"))

  return(df)
}
