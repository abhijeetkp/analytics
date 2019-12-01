#Batch, age, gender, cgpa, ug, class12 : select, salary

nS = 200
(age = round(runif(n = nS, min = 20, max = 30)))
mean(age)
(gender = sample(x = c('M' , 'F'), size = nS, replace = T, prob = c(.7,.3)))
table(gender)
(batch = sample(x = c('2017' , '2018' , '2019' ), size = nS, replace = T, prob = c(.2,.3,.5)))
table(batch)
(cgpa = round(rnorm(n = nS, mean = 7, sd = .75), 2))
range(cgpa)
(ug = round(rnorm(n = nS, mean = 70, sd = 5), 2))
range(ug)
(class12 = round(rnorm(n = nS, mean = 70, sd = 7), 2))
range(class12)
(domain = sample(c('Finance' , 'HR' , 'Operations' , 'Marketing'), size = nS, replace = T))
students = data.frame(age, gender, batch, domain, cgpa, ug, class12)
head(students)
(students$select = sample(c('Placed' , 'Not Placed'), size = nS, replace = T, prob = c(.7,.3)))
table(students$select)
(students$salary = round(rnorm(n = nS, mean = 12, sd = 1), 2))
(students$salary = ifelse(students$select == 'Not Placed', NA, students$salary))
head(students)

#Summary
nrow(students)
table(students$batch)
table(students$domain)
table(students$batch, students$domain)
hist(students$cgpa)
hist(students$cgpa, breaks = c(0,6.5,8.5,10))
hist(students$age)
hist(students$age, breaks = c(0, 20, 24, 26, 30))
hist(students$ug)
hist(students$ug, breaks = c(0, 60, 65, 75, 80, 100))

library(dplyr)
library(ggplot2)
t1 <- students %>% group_by(gender) %>% summarise(meanAge = mean(age))
barplot(height = t1$meanAge)

ggplot(students, aes(x = gender, fill = gender)) + geom_bar(stat = 'count') + geom_text(stat = 'count', aes(label = ..count..))

ggplot(students, aes(x = gender, fill = gender)) + geom_bar(stat = 'count') + geom_text(stat = 'count', aes(label = ..count..)) + facet_grid(batch ~ domain, scales = 'free')

ggplot(students, aes(x = gender, fill = gender)) + geom_bar(stat = 'count') + geom_text(stat = 'count', aes(label = ..count..), position = position_stack(), vjust = 1) + facet_grid(batch ~ domain, scales = 'free')

ggplot(students, aes(x = cgpa)) + geom_histogram()
ggplot(students, aes(x = cgpa)) + stat_bin(bins = 5)

students