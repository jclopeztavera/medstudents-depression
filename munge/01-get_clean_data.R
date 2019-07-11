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

if (!file.exists("data/raw/depression_data.csv")) {
  message("Downloading original raw data file...")
  download.file(
    "https://files.figshare.com/1893389/depression_data.csv",
    "data/raw/depression_data.csv"
  )
  message("Download complete, proceeding to read...")
  raw_data <- read_csv(file = "data/raw/depression_data.csv")
} else {
  message("The raw data file exists locally, proceeding to read...")
  raw_data <- read_csv(file = "data/raw/depression_data.csv")
}

## Found that min(age) == 12, which is nonsense;
## imputting the mean age of the observations that satisfy year == 3
raw_data[raw_data["age"] == 12, ]$age <-
  round(tapply(raw_data$age, raw_data$year, mean)[raw_data[raw_data["age"] == 12, ]$year])

raw_data[which(raw_data["gad5"] == 10),]$gad5 <- 1

## Adding ID and getting secondary variables: bmi and questionnaire scores
data <- raw_data %>%
  rownames_to_column("id") %>%
  mutate(
    bmi = weight / (height^2),
    phq_score = phq1 + phq2 + phq3 + phq4 + phq5 + phq6 + phq7 + phq8 + phq9,
    gad_score = gad1 + gad2 + gad3 + gad4 + gad5 + gad6 + gad7,
    epworth_score = epworth1 + epworth2 + epworth3 + epworth4 + epworth5 + epworth6 + epworth7 + epworth8
  )

## Cleaning binary gender data and categorising questionnaire data
data <- data %>%
  mutate(
    gender = ifelse(
      test = tolower(sex) == "m",
      yes = "male",
      no = "female"
    ),
    who_bmi = case_when(
      bmi < 18.5 ~ "Underweight",
      bmi >= 18.5 & bmi < 25 ~ "Normal",
      bmi >= 25 & bmi < 30 ~ "Overweight",
      bmi >= 30 & bmi < 35 ~ "Class I Obesity",
      bmi >= 35 & bmi < 40 ~ "Class II Obesity",
      bmi >= 40 ~ "Class III Obesity"
    ),
    depression_severity = case_when(
      phq_score == 0 ~ "none",
      phq_score >= 0 & phq_score < 5 ~ "None-minimal",
      phq_score >= 5 & phq_score < 10 ~ "Mild",
      phq_score >= 10 & phq_score < 15 ~ "Moderate",
      phq_score >= 15 & phq_score < 20 ~ "Moderately severe",
      phq_score >= 20 & phq_score <= 27 ~ "Severe"
    ),
    depressiveness = ifelse(
      test = (phq_score >= 10 | phq9 > 0),
      yes = TRUE,
      no = FALSE
    ),
    suicidal = ifelse(test = phq9 > 0,
      yes = TRUE,
      no = FALSE
    ),
    anxiety_severity = case_when(
      gad_score >= 0 & gad_score < 5 ~ "None-minimal",
      gad_score >= 5 & gad_score < 10 ~ "Mild",
      gad_score >= 10 & gad_score < 15 ~ "Moderate",
      gad_score >= 15 ~ "Severe"
    ),
    anxiousness = ifelse(test = gad_score >= 10, yes = TRUE, no = FALSE),
    sleepiness = ifelse(test = epworth_score >= 10, yes = TRUE, no = FALSE),
    depression_diagnosis = as.logical(prev_depression_dx),
    anxiety_diagnosis = as.logical(prev_anxiety_dx),
    depression_treatment = as.logical(prev_depression_rx),
    anxiety_treatment = as.logical(prev_anxiety_rx)
  )


depression_anxiety_data <- data %>%
  select(
    id,
    school_year = year,
    age,
    gender,
    bmi,
    who_bmi,
    phq_score,
    depression_severity,
    depressiveness,
    suicidal,
    depression_diagnosis,
    depression_treatment,
    gad_score,
    anxiety_severity,
    anxiousness,
    anxiety_diagnosis,
    anxiety_treatment,
    epworth_score,
    sleepiness
  )

depression_anxiety_survey_data <- data %>%
  select_at(.vars = vars("id", matches("phq|gad|epw|treatment|diagnosis")))

# Tidy dataset, ready to go!
write_csv(
  x = depression_anxiety_data,
  path = "data/tidy/depression_anxiety_data.csv"
)
saveRDS(
  object = depression_anxiety_data,
  file = "data/tidy/depression_anxiety_data.rds"
)

# Survey data
write_csv(
  x = depression_anxiety_survey_data,
  path = "data/tidy/depression_anxiety_survey_data.csv"
)
saveRDS(
  object = depression_anxiety_survey_data,
  file = "data/tidy/depression_anxiety_survey_data.rds"
)

rm(raw_data, data)
