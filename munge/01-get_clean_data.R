# Analysis of Mexican Medical Students' PHQ-9/GAD-7/Epworth
# Part 1: Getting, Cleaning, and Preparing the Dataset
# This code is licensed under a MIT License Copyright (c) 2016 Juan C. López-Tavera
rm(list = ls())

raw_data <-
    read_csv(file = "https://files.figshare.com/1893389/depression_data.csv")

## Found that min(age) == 12, which is nonsense;
## imputting the mean age of the observations that satisfy year == 3
raw_data[raw_data["age"] < 18, ] <-
    tapply(raw_data$age, raw_data$year, mean)[raw_data[raw_data["age"] < 18, ]$year]

names(raw_data) <-
    gsub(pattern = "epworth", replacement = "epw", names(raw_data))

## exporting raw dataset to this repository RUN ONCE
#write_csv(x = raw_data, path = "data/raw//raw_data.csv")

raw_data <- raw_data %>%
    mutate(
        bmi = weight / (height ^ 2),
        phq_score = phq1 + phq2 + phq3 + phq4 + phq5 + phq6 + phq7 + phq8 + phq9,
        gad_score = gad1 + gad2 + gad3 + gad4 + gad5 + gad6 + gad7,
        epw_score = epw1 + epw2 + epw3 + epw4 + epw5 + epw6 + epw7 + epw8
    )

raw_data <- raw_data %>%
    mutate(
        gender = ifelse(
            test = sex == "m",
            yes = "male",
            no = "female"
        ),
        who_bmi = cut(
            x = bmi,
            breaks = c(min(bmi, na.rm = TRUE),
                       18.5,
                       25,
                       30,
                       max(bmi, na.rm = TRUE)),
            labels = c("under", "normal", "over", "obese"),
            include.lowest = FALSE,
            right = TRUE
        ),
        depression_level = cut(
            x = phq_score,
            breaks = c(0, 5, 10, 15, 20, 27),
            right = FALSE,
            include.lowest = TRUE,
            ordered_result = TRUE,
            labels = c(
                "None-minimal",
                "Mild",
                "Moderate",
                "Moderately severe",
                "Severe"
            )
        ),
        depressed = ifelse(
            test = (phq_score >= 10 | phq9 > 0),
            yes = TRUE,
            no = FALSE
        ),
        suicidal = ifelse(test = phq9 > 0,
                          yes = TRUE,
                          no = FALSE),
        anxiety_level = cut(
            gad_score,
            breaks = c(0, 5, 10, 15, 21),
            labels = c("None-minimal", "Mild", "Moderate", "Severe"),
            include.lowest = TRUE,
            right = FALSE,
            ordered_result = TRUE
        ),
        anxious = ifelse(test = gad_score >= 10, yes = TRUE, no = FALSE),
        sleepy = ifelse(test = epw_score >= 10, yes = TRUE, no = FALSE),
        depression_diagnosis = as.logical(prev_depression_dx),
        anxiety_diagnosis = as.logical(prev_anxiety_dx),
        depression_treatment = as.logical(prev_depression_rx),
        anxiety_treatment = as.logical(prev_anxiety_rx)
    )


raw_data %>%
    select(
        medschool_year = year,
        age,
        gender,
        bmi,
        who_bmi,
        phq_score,
        depression_level,
        depressed,
        suicidal,
        depression_diagnosis,
        depression_treatment,
        gad_score,
        anxiety_level,
        anxious,
        anxiety_diagnosis,
        anxiety_treatment,
        epw_score,
        sleepy
    )

# Tidy dataset, ready to go!
write_csv(x = raw_data, path = "data/tidy/tidy_depression_anxiety.csv")
saveRDS(object = raw_data, file = "data/tidy/tidy_depression_anxiety.rds")

rm(list = ls())
