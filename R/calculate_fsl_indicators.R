#' Calculate FSL Indicators
#'
#' @param data
#' @param FCSStap
#' @param FCSPulse
#' @param FCSPr
#' @param FCSVeg
#' @param FCSFruit
#' @param FCSDairy
#' @param FCSFat
#' @param FCSSugar
#' @param cutoff
#' @param rCSILessQlty
#' @param rCSIBorrow
#' @param rCSIMealSize
#' @param rCSIMealAdult
#' @param rCSIMealNb
#' @param HHhSNoFood_FR
#' @param HHhSBedHung_FR
#' @param HHhSNotEat_FR
#' @param HDDSStapCer
#' @param HDDSStapRoot
#' @param HDDSVeg
#' @param HDDSFruit
#' @param HDDSPrMeat
#' @param HDDSPrEgg
#' @param HDDSPrFish
#' @param HDDSPulse
#' @param HDDSDairy
#' @param HDDSFat
#' @param HDDSSugar
#' @param HDDSCond
#'
#' @return
#' @export
#'
#' @examples
calculate_fsl_indicators <- function(data,
                                        FCSStap = NULL, FCSPulse = NULL,
                                        FCSPr = NULL, FCSVeg = NULL, FCSFruit = NULL,
                                        FCSDairy = NULL, FCSFat = NULL, FCSSugar = NULL,
                                        cutoff = "Cat28",
                                        rCSILessQlty = NULL, rCSIBorrow = NULL,
                                        rCSIMealSize = NULL, rCSIMealAdult = NULL, rCSIMealNb = NULL,
                                        HHhSNoFood_FR = NULL, HHhSBedHung_FR = NULL, HHhSNotEat_FR = NULL,
                                        HDDSStapCer = NULL, HDDSStapRoot = NULL, HDDSVeg = NULL,
                                        HDDSFruit = NULL, HDDSPrMeat = NULL, HDDSPrEgg = NULL,
                                        HDDSPrFish = NULL, HDDSPulse = NULL, HDDSDairy = NULL,
                                        HDDSFat = NULL, HDDSSugar = NULL, HDDSCond = NULL) {

  # Input validation
  if (!is.null(FCSStap)) {
    stopifnot(FCSStap %in% names(data))
  }
  if (!is.null(FCSPulse)) {
    stopifnot(FCSPulse %in% names(data))
  }
  # Repeat similar checks for other arguments...

  if(!(cutoff %in% c("Cat28", "Cat21"))) {
    stop(glue::glue("`cutoff` must be one of: `Cat28` or `Cat21`, not {cutoff}."))
  }

  # Calculate scores and categories only for provided arguments
  if (!is.null(FCSStap) && !is.null(FCSPulse)) {
    data <- data %>%
      mutate(FCS = (FCSStap * 2) + (FCSPulse * 3) + (FCSPr * 4) +
               (FCSDairy * 4) + FCSVeg + FCSFruit + (FCSFat * 0.5) +
               (FCSSugar * 0.5))

    data <- data %>%
      mutate(
        FCSCat = case_when(
          cutoff == "Cat28" ~ case_when(
            FCS <= 28 ~ 1,
            between(FCS, 28.5, 42) ~ 2,
            TRUE ~ 3
          ),
          cutoff == "Cat21" ~ case_when(
            FCS <= 21 ~ 1,
            between(FCS, 21.5, 35) ~ 2,
            TRUE ~ 3
          )
        )
      )
  }

  if (!is.null(rCSILessQlty) && !is.null(rCSIBorrow) && !is.null(rCSIMealSize) &&
      !is.null(rCSIMealAdult) && !is.null(rCSIMealNb)) {
    data <- data %>%
      mutate(rCSI = rCSILessQlty + (rCSIBorrow * 2) + rCSIMealSize+ (rCSIMealAdult * 3) + rCSIMealNb)
  }

  if (!is.null(HHhSNoFood_FR) && !is.null(HHhSBedHung_FR) && !is.null(HHhSNotEat_FR)) {
    data <- data %>%
      mutate(
        HHhSNoFood_FR_r = case_when(
          {{HHhSNoFood_FR}} == "1" ~ 1,
          {{HHhSNoFood_FR}} == "2" ~ 1,
          {{HHhSNoFood_FR}} == "3" ~ 2,
          TRUE ~ 0
        ),
        HHhSBedHung_FR_r = case_when(
          {{HHhSBedHung_FR}} == "1" ~ 1,
          {{HHhSBedHung_FR}} == "2" ~ 1,
          {{HHhSBedHung_FR}} == "3" ~ 2,
          TRUE ~ 0
        ),
        HHhSNotEat_FR_r = case_when(
          {{HHhSNotEat_FR}} == "1" ~ 1,
          {{HHhSNotEat_FR}} == "2" ~ 1,
          {{HHhSNotEat_FR}} == "3" ~ 2,
          TRUE ~ 0
        )
      )

    data <- data %>%
      mutate(HHS = HHhSNoFood_FR_r + HHhSBedHung_FR_r + HHhSNotEat_FR_r)

    data <- data %>%
      mutate(HHSCat = case_when(
        HHS %in% c(0,1) ~ "No or little hunger in the household",
        HHS %in% c(2,3) ~ "Moderate hunger in the household",
        HHS >= 4 ~ "Severe hunger in the household"
      ))
  }

  if (!is.null(HDDSStapCer) && !is.null(HDDSStapRoot) && !is.null(HDDSVeg) &&
      !is.null(HDDSFruit) && !is.null(HDDSPrMeat) && !is.null(HDDSPrEgg) &&
      !is.null(HDDSPrFish) && !is.null(HDDSPulse) && !is.null(HDDSDairy) &&
      !is.null(HDDSFat) && !is.null(HDDSSugar) && !is.null(HDDSCond)) {
    data <- data %>%
      mutate(HDDS = HDDSStapCer + HDDSStapRoot + HDDSVeg + HDDSFruit + HDDSPrMeat + HDDSPrEgg + HDDSPrFish + HDDSPulse + HDDSDairy + HDDSFat + HDDSSugar + HDDSCond)
  }

  return(data)
}




#' plot ridge distribution
#'
#' @param df
#' @param numeric_cols
#' @param name_groups
#' @param name_units
#' @param grouping
#' @param file_path
#' @param wdth
#' @param hght
#' @param title_name
#'
#' @return
#' @export
#'
#' @examples
plot_ridge_distribution <- function(df, numeric_cols, name_groups = NULL, name_units = NULL, grouping = NULL,
                                    file_path = NULL, wdth = NULL, hght = NULL, title_name = NULL) {

  a <- 0
  if(!methods::hasArg(grouping)) {
    df <- df %>% dplyr::mutate(group = "All")
    grouping <- "group"
    a <- 1
  }
  if(is.null(name_groups)) {name_groups <- "Groups"}
  if(is.null(name_units)) {name_units <- "Units"}

  df <- df %>% dplyr::select(grouping, numeric_cols) %>%
    tidyr::gather(key = !!name_groups, value = !!name_units, numeric_cols)

  g <- ggplot2::ggplot(df, ggplot2::aes(x = get(name_units), y = get(name_groups), fill = get(name_groups))) +
    ggridges::geom_density_ridges() +
    ggridges::theme_ridges() + ggplot2::xlab(name_units) + ggplot2::ylab(name_groups) +
    ggplot2::theme(legend.position = "none", legend.title = ggplot2::element_text(name_groups))

  if(a == 0) {
    g <- g + ggplot2::facet_wrap(~get(grouping))
  }

  if(!is.null(title_name)) {g <- g + ggplot2::ggtitle(title_name)}

  if(is.null(wdth)) {wdth <- 5}
  if(is.null(hght)) {hght <- 5}

  if(!is.null(file_path)) {ggplot2::ggsave(filename = file_path, width = wdth, height = hght)}

  return(g)

}



