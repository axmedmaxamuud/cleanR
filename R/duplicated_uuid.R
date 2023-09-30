#' Check duplicated uuids
#'
#' This function will check if there are any duplicated uuids in your data, it will need only data with uui column.
#'
#' @param data data in XML values format
#'
#' @return
#' @export
#'
#' @examples
check_duplicate_uuid <- function(data) {
  if ("uuid" %in% names(data)) {
    duplicate_uuid <- data[duplicated(data$uuid), "uuid"]

    if (length(duplicate_uuid) > 0) {
      message("The following UUID(s) are duplicated:")
      message(paste(duplicate_uuid, collapse = ", "))
    } else {
      message("No duplicate UUID found.")
    }
  } else {
    message("UUID variable not found in the dataset.")
  }
}

