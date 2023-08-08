#' cleaning folders
#'
#' @return
#' @export
#'
#' @examples
cleaning_folders <- function() {
  # Get the current working directory
  working_dir <- getwd()

  # Define folder names for data cleaning
  folders <- c("input", "output", "src")

  # Check and create folders if they don't exist
  for (folder in folders) {
    folder_path <- file.path(working_dir, folder)

    if (!file.exists(folder_path)) {
      dir.create(folder_path)
      cat("Created folder:", folder_path, "\n")
    } else {
      cat("Folder already exists:", folder_path, "\n")
    }
  }
}
