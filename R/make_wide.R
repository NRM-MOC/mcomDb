
#' Wide format for MCoM database.
#'
#' @param MCoM data table of contaminants in marine biota presented in a long format.
#' @param group the contaminants substance groups. Choose from:  "Metals","PFAS","PCBs", "Dioxins and furans" , "Pesticides","BFRs", "Solvents-phenols","PAH". "Organotin compounds" .
#' @param bio choose from:"year", "date", "species", "species_EN",  "class","number_individuals","sex", "total_length","age", "weight","shell_thickness" ,  "d13C", "d15N","C_dw_percentage", "N_dw_percentage", "station_name", "latitude", "longitude", "HELCOM_basin", "ICES_basin", "season"
#'
#'
#' @return database in wide format with contaminants in separate columns.
#' @export
#'
#' @importFrom dplyr filter
#' @importFrom dplyr mutate
#' @importFrom dplyr select
#' @importFrom dplyr group_by
#' @importFrom dplyr summarise
#' @importFrom dplyr all_of
#' @importFrom dplyr left_join
#' @importFrom dplyr distinct
#' @importFrom tidyr pivot_wider
#'
#' @examples make_wide(MCoM, "Metals") |>  glimpse() |> View()
#' @examples make_wide(MCoM, "BFRs") |> write_csv2(file = "BFRs.csv")
#' @examples make_wide(MCoM, c("Dioxins and furans" , "Pesticides"))
#'
make_wide <- function(MCoM, group , bio = c("year", "date", "species", "species_EN",  "class",
                                                      "number_individuals","sex", "total_length","age", "weight", "shell_thickness" ,
                                                      "d13C", "d15N","C_dw_percentage", "N_dw_percentage",
                                                      "station_name", "latitude", "longitude", "HELCOM_basin", "ICES_basin", "season")){
  cont <- MCoM |>
    filter((substance_group ==  group) ) |>
    mutate(value = ifelse(is_censored == TRUE, paste0("<", value), as.character(value))) |>
    select(specimen_ID, contaminant, value) |>
    group_by(specimen_ID, contaminant) |>
    summarise(value = value[1]) |>
    pivot_wider(names_from = "contaminant", values_from = "value")

  bio <- MCoM |> select(specimen_ID, all_of(bio)) |>
    distinct()


  bio |> left_join(cont)
}

