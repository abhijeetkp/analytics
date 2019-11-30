#Histogram Plot in R
#count of categories
library(dplyr)
library(ggplot2)

df=mtcars
catcols = c('cyl', 'vs', 'am', 'gear', 'carb')
df[,catcols] = lapply(df[,catcols], as.factor)

sapply(df, class)

hist(df$mpg)
hist(mtcars$mpg)
hist(mtcars$mpg, breaks = 10)
hist(mtcars$mpg, breaks = c(0, 10, 20, 30, 40, 50))

plot(density(df$mpg))

hist(df$mpg, freq = F)
lines(density(df$mpg))

boxplot(df$mpg)
summary(df$mpg)
