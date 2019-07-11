#' ---
#' title: Analysis of Mexican medical students' mental health data: PHQ-9, GAD-7, Epworth survey data preparation
#' author: "Juan C. López Tavera"
#' date: "2018-09-07"
#' license: MIT License Copyright (c) 2016-2018 Juan C. López Tavera
#' ---

#' During fall 2014, we collected sociodemographic and mental health data
#' from Mexican medical students enrolled in the Medicine programme at
#' Universidad Autonoma de Guadalajara, Guadalajara Jalisco, Mexico.
#' We collected:
#' * sociodemographic data
#' * height and weigth data
#' * depression data using the PHQ-9 instrument (spanish version)
#' * anxiety data using the GAD-7 instrument (spanish version)
#' * daily sleepness data using the Epworth survey (spanish version)
#' * school and study related habits using
#' The objective of this script is to get and prepare the original data set
#' in a reproducible way for subsequent steps in the analysis process.

# if (!file.exists("data/raw/depression_data.csv")) {
#   message("Downloading original raw data file...")
#   download.file(
#     "https://files.figshare.com/1893389/depression_data.csv",
#     "data/raw/depression_data.csv"
#   )
#   message("Download complete, proceeding to read...")
#   raw_data <- read_csv(file = "data/raw/depression_data.csv")
# } else {
  message("The raw data file exists locally, proceeding to read...")
  raw_data <- read_csv(file = "data/raw/datoscompletos respaldo - PLoS1.csv")
# }

raw_data[which(raw_data["gad5"] == 10),]$gad5 <- 1

zero_append <- function(x, n) {
  x <- as.character(x)
  i <- str_length(x) < n & !is.na(x)
  x_ <- x[i]

  x_ <- sapply(
    X = x_,
    FUN = function(x) {
      paste0(paste0(rep(0, n - stringr::str_length(x)), collapse = ""), x)
    }
  )

  x[i] <- x_
  x

}

raw_data$semester_tidy <- raw_data$semester %/% 10 ^ 3
raw_data$group <- (raw_data$semester / 10 ^ 1) %% 10 ^ 1

raw_data$group <- c(raw_data$group[raw_data$group == 0], LETTERS[raw_data$group[raw_data$group != 0]])

x <- zero_append(as.character(raw_data$time_sleep), 4)

chtime <- gsub(pattern = "([0-9]{2})([0-9]{2})", replacement = "\\1:\\2", x = x)

df <- tibble(chtime, ntime = x) %>%
  mutate(chtime = gsub("24:|12:", "00:", chtime))  %>%
  mutate(chtime = gsub("11:", "23:", chtime)) %>%
  mutate(chtime = gsub("10:", "22:", chtime)) %>%
  mutate(chtime = gsub("09:", "21:", chtime)) %>%
  mutate(chtime = gsub("08:", "20:", chtime))

raw_data$time_sleep <- df$chtime

x <- zero_append(as.character(raw_data$time_wakeup), 4)

chtime <- gsub(pattern = "([0-9]{2})([0-9]{2})", replacement = "\\1:\\2", x = x)

df <- tibble(chtime, ntime = x) %>%
  mutate(chtime = gsub("05.7|05.75", "05:00:", chtime))
raw_data$time_wakeup <- df$chtime

