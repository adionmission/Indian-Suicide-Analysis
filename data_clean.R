# Code written by Aditya Kakde, owner of account @Onnamission

library(tidyverse)
library(janitor)

# Setting working directory
print(getwd())
setwd("D:/Projects/Suicides-Analysis-India")
print(getwd())

df = read.csv('dataset/suicides.csv')

View(df)


# Data cleaning pipeline
data_clean = df %>%
  na_if("Total (States)") %>%
  na_if("Total (All India)") %>%
  na_if("Total (Uts)") %>%
  na_if("Others (Please Specify)") %>%
  na_if("Other Causes (Please Specity)") %>%
  na_if("By Other means") %>%
  na_if("By Other means (please specify)") %>%
  na_if("Causes Not known") %>%
  na_if("0-100+") %>%
  drop_na()

View(data_clean)


# Renaming

data_clean$State[data_clean$State == "Delhi (Ut)"] = "Delhi"

data_clean$Type[data_clean$Type == "Not having Children (Barrenness/Impotency"] = "Not having Children"

data_clean$Type[data_clean$Type == "Not having Children(Barrenness/Impotency"] = "Not having Children"

data_clean$Type[data_clean$Type == "Divorcee"] = "Divorce"

data_clean$Type[data_clean$Type == "Unemployment"] = "Unemployed"

data_clean$Type[data_clean$Type == "Bankruptcy or Sudden change in Economic Status"] = "Bankruptcy or Sudden change in Economic"

View(data_clean)


# cleaning it again

dataclean = data_clean %>%
  janitor::clean_names()

View(dataclean)


# Exporting in csv format

write.csv(dataclean, "suicides.csv", row.names = FALSE)
