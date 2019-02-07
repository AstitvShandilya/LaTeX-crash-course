########################################
# LaTeX workshop
# Script to generate regression table
# Javier Osorio
########################################


########################################
# Setup in R

#Install stargazer. Do this only once
install.packages("stargazer") 

#Load the library
library(stargazer)

#Set your own working directory
setwd("C:/Users/javie/Desktop")



########################################
# Get the data

# Load the mtcars database
data <- mtcars

# Clean up the data
vs <- factor(data$vs, labels = c("V", "S"))
am <- factor(data$am, labels = c("automatic", "manual"))



########################################
# Run regression

# Run regression models
model1 <- lm(mpg ~ am,             data=data)
   summary(model1)
  
model2 <- lm(mpg ~ am + vs,        data=data)
   summary(model2)

model3 <- lm(mpg ~ am + vs + gear, data=data)
   summary(model3)

   
   
########################################
# Export results table to LaTeX
   
# Generate basic table   
stargazer(model1, model2, model3, type="latex", out="mytable1.tex")   

# Edit labels   
stargazer(model1, model2, model3, 
   dep.var.labels=c("Miles per gallon"),
   covariate.labels=c("Manual transmission","Straight engine","Num. of gears"),
   type="latex", out="mytable2.tex")  
 
 

########################################
# End of script 
########################################