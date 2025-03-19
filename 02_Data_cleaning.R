#loading packages
library(dplyr)
library(tidyverse)
load("ST606/irltim.Rdata")

raw_data <- as.data.frame(irltim)  

cleaned_data <- raw_data %>%
  select(stu_id, math, sex, parent_support, computer, book, shortage_math_teachers) %>%
  rename(
    ID = stu_id,
    Scores = math,
    Gender = sex,
    Parent_Support = parent_support,
    Computer_Access = computer,
    Book_Availability = book,
    Teacher_Shortage = shortage_math_teachers
  )


cleaned_data$Book_Availability <- recode(cleaned_data$Book_Availability,
                                         "0-10 BOOKS" = "Few",
                                         "11-25 BOOKS" = "Moderate",
                                         "26-100 BOOKS" = "Good",
                                         "101-200 BOOKS" = "Very Good",
                                         "MORE THAN 200" = "Excellent",
                                         "NONE OR VERY FEW (0-10 BOOKS)" = "Few",
                                         "ENOUGH TO FILL ONE SHELF (11-25 BOOKS)" = "Moderate",
                                         "ENOUGH TO FILL ONE BOOKCASE (26-100 BOOKS)" = "Good",
                                         "ENOUGH TO FILL TWO BOOKCASES (101-200 BOOKS)" = "Very Good",
                                         "ENOUGH TO FILL THREE OR MORE BOOKCASES (MORE THAN 200)" = "Excellent"
)

cleaned_data$Teacher_Shortage <- recode(cleaned_data$Teacher_Shortage,
                                        "0 TO 10%" = "Low",
                                        "11 TO 25%" = "Moderate",
                                        "26 TO 50%" = "High",
                                        "MORE THAN 50%" = "Severe"
)

View(cleaned_data)
