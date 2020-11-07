launch <- read.csv("~/Desktop/Portfolio/Challengervc/data/challenger.csv")

library(stats)
lm2 <- lm(distress_ct ~ temperature + pressure, data = launch)
lm2