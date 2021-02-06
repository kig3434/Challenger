# load packages
library(stats)
library(psych)
library(tidyverse)
library(ggthemes)

#Load data
launch <- read.csv("C:/Users/kevin/Desktop/Portfolio/Challenger/docs/challenger.csv")


#Summary stats
summary(launch)

#Basic Plot#####
launch$distress_ct <- as_factor(launch$distress_ct)
launch$pressure <- as_factor(launch$pressure)

ggplot(launch, aes(x = distress_ct, y = temperature)) + 
  geom_point(aes(shape = pressure, color = pressure), position = position_jitterdodge(dodge.width=0.4), size = 3) +
  labs(y="Temperature (˚F)", 
       x="Number of distressed o-rings(out of 6)", 
       title="Number of distressed o-rings by temperature", 
       caption = "Source: challenger.csv",
       color = "Pressure",
       shape = "Pressure") +
  theme_calc() +
  theme(plot.title = element_text(hjust = 0.5))

#Regression analyses####
launch$distress_ct <- as.numeric(as.character(launch$distress_ct))
launch$pressure <- as.numeric(as.character(launch$pressure))

lm1 <- lm(distress_ct ~ temperature, data = launch)
lm2 <- lm(distress_ct ~ temperature + pressure, data = launch)
lm3 <- lm(distress_ct ~ temperature * pressure, data = launch)
summary(lm1)
summary(lm2)
summary(lm3)
anova(lm1, lm2, lm3)

## Prediction with simple lm model
predict(lm1, data.frame(temperature = 36))

# Given the dataset only has 23 observations, there is no need to run a more complex alogrithm that requires training, validation and test datasets.






