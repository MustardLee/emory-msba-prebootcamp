#########Starter Portion######################################
#this code installs and loads the following packages if they are not already on your system
#gapminder (gives access to a dataset)
#dplyr (data manipulation in R)
#ggplot2 (charts/graphs in R)
if(!require("gapminder")) { install.packages("gapminder"); require("gapminder") }
if(!require("dplyr")) { install.packages("dplyr"); require("dplyr") }
if(!require("ggplot2")) { install.packages("ggplot2"); require("ggplot2") }

library(gapminder)
#this code assigns the gapminder table to gap, which will put the dataframe on your local system
gap <- gapminder 

#this code changes the data type of the country column (from factors to stings)
gap$country <- as.character(gap$country)

# question 1
a<-137+614
b<-39-81
c<-17*14
d<-107/12
e<-13**4 
f<-1783%%23 # remainder

# question 2
