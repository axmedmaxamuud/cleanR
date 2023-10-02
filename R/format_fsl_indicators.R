#' Compute FCS Indicator
#'
#' This function will calculate the FCS indicator, you'll need to include the cutoff threshold in the function.
#'
#' @param data Survey data with FCS indicator as per the WFP Survey Designer
#' @param FCSStap Cereals, grains, roots and tubers
#' @param FCSPulse Pulses/ legumes / nuts
#' @param FCSPr Milk and other dairy products
#' @param FCSVeg Meat, fish and eggs
#' @param FCSFruit Vegetables and leaves
#' @param FCSDairy Fruits
#' @param FCSFat Oil/fat/butter
#' @param FCSSugar Sugar, or sweet
#' @param cutoff threshold
#'
#' @return
#' @export
#'
#' @examples
compute_fcs <- function(data,
                        FCSStap = "FCSStap",
                        FCSPulse = "FCSPulse",
                        FCSPr = "FCSPr",
                        FCSVeg = "FCSVeg",
                        FCSFruit = "FCSFruit",
                        FCSDairy = "FCSDairy",
                        FCSFat = "FCSFat",
                        FCSSugar = "FCSSugar",
                        cutoff = "Cat28"){
  # check the cutoff first
  if(!(cutoff %in% c("Cat28", "Cat21"))){
    rlang::abort(glue::glue("`cutoff` must be one of: `Cat28` or `Cat21` not {cutoff}."))
  }

  # calculate scores
  data <- data %>%
    dplyr::mutate(FCS = (FCSStap * 2) + (FCSPulse * 3)+ (FCSPr * 4)+ (FCSDairy * 4)+ FCSVeg+ FCSFruit+ (FCSFat * 0.5)+ (FCSSugar * 0.5))

  # create FCG based on 21/35 or 28/42 thresholds
  if(cutoff == "Cat28"){
    data <- data %>% dplyr::mutate(
      FCSCat28 = case_when(
        FCS <= 28 ~ 1,
        between(FCS, 28.5, 42) ~ 2,
        FCS > 42 ~ 3
      )
    )
  } else {
    data <- data %>% dplyr::mutate(
      FCSCat21 = case_when(
        FCS <= 21 ~ 1,
        between(FCS, 21.5, 35) ~ 2,
        FCS > 35 ~ 3
      )
    )
  }

  return(data)

}
