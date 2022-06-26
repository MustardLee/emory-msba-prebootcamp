#########Starter Portion######################################
#this code installs and loads the following packages if they are not already on your system
#gapminder (gives access to a dataset)
#dplyr (data manipulation in R)
#ggplot2 (charts/graphs in R)
if(!require("gapminder")) { install.packages("gapminder"); require("gapminder") }
if(!require("dplyr")) { install.packages("dplyr"); require("dplyr") }
if(!require("ggplot2")) { install.packages("ggplot2"); require("ggplot2") }


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
library(ggthemes)

# question 3
for (x in 1:10) {
  print("Emory Rocks!")
}

for (i in 610:615) {
  print(gap[i, 1])
}


# question 4
a <- sample(1:10,1)
empty_str = ""

if (a%%2 == 0) {
  empty_str = "even"
  } else 
    empty_str = "odd"
print(empty_str)


# question 5
identifier_func <- function(x) {
  if (is.numeric(x)) {
    if (x>0){
      return("positive")
}   else if (x<0) {
      return("regative")
}   else if (x==0)
      return("0")
} else
    print("Error: Not a number")
}

identifier_func(-1)
identifier_func("ok")


# question 6
copy <- gap
all.equal(copy,gap)

# question 7
summary(gap["pop"])

# question 8
linear <- lm(gdpPercap ~ lifeExp, data = gap)
linear

linear$coefficients

# question 9
Afg_df <- gap[gap$country == 'Afghanistan',]
library(ggplot2)

ggplot(data=Afg_df, aes(x=year, y=pop/1000000)) +
  geom_line()+
  geom_point()+
  geom_text(aes(label = year, vjust = -.5))+
  xlim(min(Afg_df$year), max(Afg_df$year)+1)+
  xlab('year')+
  ylab('population/m')+
  ggtitle('Afganistan Population by Year (million)')

# question 10
library("readxl")
worker <- read_excel("../sql-exercise/MSBA SQL Tables.xlsx", sheet = "Workers")
title <- read_excel("../sql-exercise/MSBA SQL Tables.xlsx", sheet = "Title")

# question 11
library(dplyr)
join_table<-left_join(worker, title, by = c("Worker_ID" = "Worker_Ref_ID"))

# question 12
join_table %>% 
  group_by(Department,Worker_Title) %>% 
  summarise(count_num = n())

# question 13
## a
join_table$Full_Name <- paste(join_table$First_Name,join_table$Last_Name)
## b
join_table %>% filter(Joining_Date <= "2019-08-01")
## c
join_table %>% arrange(Salary)
## d
join_table<- join_table %>% select(Full_Name, Salary, Worker_Title, Department)

# question 14
write.csv(join_table, "joined_table.csv", row.names = FALSE)


# BONUS
bonus<-gap %>% 
  mutate(GDP = gdpPercap*pop) %>% 
  filter(country != "Finland") %>%
  group_by(country) %>%
  mutate(relativePop = pop/max(pop)) %>%
  ungroup() %>%
  filter(year %in% c("1997", "2002")) %>% 
  select(country, continent, year, GDP, relativePop)

