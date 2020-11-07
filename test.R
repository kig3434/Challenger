library(stats)
library(psych)
library(tidyverse)


launch <- read.csv("~/Desktop/Portfolio/Challengervc/docs/challenger.csv")
summary(launch)

#Regression analyses
lm1 <- lm(distress_ct ~ temperature, data = launch)
lm2 <- lm(distress_ct ~ temperature + pressure, data = launch)
lm3 <- lm(distress_ct ~ temperature * pressure, data = launch)
summary(lm1)
summary(lm2)
summary(lm3)
anova(lm1, lm2, lm3)


#Plots
launch$distress_ct <- as.factor(launch$distress_ct)
launch$pressure <- as.factor(launch$pressure)

ggplot(launch, aes(x=distress_ct, y=temperature)) + 
  geom_point(aes(shape=pressure, col=pressure)) +
  labs(y="Temperature (F)", 
       x="Number of distressed o-rings", 
       title="Number of distressed o-rings by temperature", 
       caption = "Source: challenger.csv")
