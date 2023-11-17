#' FSL cleaning log
#'
#' @param data
#' @param uuid
#'
#' @return
#' @export
#'
#' @examples
fsl_cleaning_log <- function(data, uuid) {
  # creating blank logbook
  fsl_logbook <- cleanR::logbook()

  # Define a list of conditions
  conditions <- list(
    list(variable = "FCS", threshold = 60, issue = "Household food consumption score is too high (>60).", action = "check"),
    list(variable = "rCSI", threshold = 30, issue = "Household reported very high rCSI. ", action = "check")
    # keep adding conditions
  )

  # Loop through conditions
  for (condition in conditions) {
    # Check if the variable exists in the data
    if (condition$variable %in% names(data)) {
      # Apply the condition and log the issues
      flagged_data <- data %>%
        filter(get(condition$variable) > condition$threshold) %>%
        log_sheet(
          question.name = condition$variable,
          issue = condition$issue,
          action = condition$action
        )

      # Add flagged data to the logbook
      fsl_logbook <- rbind(fsl_logbook, flagged_data)
    } else {
      # Log a message if the variable is not found in the data
      message(paste("Variable", condition$variable, "not found. Skipping this condition."))
    }
  }

  # Return the logbook
  return(fsl_logbook)
}


