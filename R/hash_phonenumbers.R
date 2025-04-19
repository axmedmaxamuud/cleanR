#' Hash Phone Numbers
#'
#' @param data
#' @param PhoneNumber
#' @param name
#'
#' @return
#' @export
#'
#' @examples
hash_phonenumbers <- function(data, PhoneNumber, name, debug = FALSE){
  data <- data[!duplicated(data[[PhoneNumber]]), ]

  used_hashes <- character()

  # Hash phonenumbers
  for (k in 1:nrow(data)) {
    contact_number <- as.character(data[k, PhoneNumber])
    contact_hash <- paste0('w', substr(digest(contact_number, "sha1"), 1, 8))

    while(contact_hash %in% used_hashes) {
      contact_hash <- paste0(contact_hash, sample(letters, 1, replace = TRUE))
    }

    used_hashes <- c(used_hashes, contact_hash)
    data[k, name] <- contact_hash

    if (debug) {
      print(contact_hash)
    }
  }

  data$duplicated <- duplicated(data[[name]])
  if (debug) {
    print(data$duplicated)
  }

  return(data)
}

