mtcars
head(mtcars)
#How many cars are having gear 3?
table(mtcars$gear)
table(mtcars$cyl, mtcars$gear, dnn=c("cyl","gear"))
table(mtcars$am, mtcars$gear, dnn=c("am","gear"))
table(mtcars$mpg)
table(mtcars$cyl, mtcars$carb, dnn=c("cyl","carb"))
table(mtcars$hp)
table(mtcars$cyl, mtcars$wt, dnn=c("cyl","wt"))
library(dplyr)
mtcars %>% filter(gear == 3)
max(mtcars$mpg)
mtcars %>% filter(gear == 3) %>% top_n(1, hp)
#group by summaries
mtcars %>% group_by(gear) %>% summarise(total =(n))
mtcars %>% group_by(gear) %>% summarise(total = n(), meanMPG = mean(mpg), maxMPG = max(mpg), minHP = min(hp), meanWT = mean(wt))
mtcars %>% group_by(vs) %>% summarise(min(qsec), max(qsec))

#arrange

mtcars %>% arrange(am, mpg) %>% head()
mtcars %>% group_by(am, gear) %>% top_n(1, wt)

#sample

mtcars %>% sample_n(2)
mtcars %>% sample_frac(.1)
mtcars %>% group_by(am) %>% sample_n(2)

#apply
x
apply(x=..., MARGIN = ...., FUN=...)
?apply
(data = trunc(rnorm(24, mean = 60, sd = 10)))
(m1 = matrix(data, nrow=4))
colSums(m1)
rowSums(m1)
apply(x = m1, MARGIN = 1, FUN = sum)

A=1:5 ; B=4:7 ; C=1:100
list1 = list(A, B, C)
list1
lapply(x=list1, FUN=mean)

rollno = 1:5
gender = sample(c('M','F'), size=5, replace = T)
sub1 = rnorm(5, 60, 10)
sub2 = rnorm(5, 65, 5)
sub3 = rnorm(5, 70, 3)
students=(data.frame(rollno, sub1, sub2, sub3))
students

longdata = melt(students, id.vars = c('rollno','gender'), variable.name = 'subject', value.name = 'marks')
longdata
head(longdata)

widedata = dcast(longdata, rollno + gender ~ subject)

f<- file.choose("C1/TitanicDataMissingValues.csv")
c1 <- read.csv(f)
c1 <- read.csv("C1/TitanicDataMissingValues.csv")
c1
View(c1)


#Finding Missing Values in R

df <- data.frame(A = c(2,NA,9, NA), B = c(4, NA, 55, 66), C = c(3, 44, 1, 22))
df

#is.na() - indicates which elements are missing
is.na(df)

# any(is.na()) - indicates if there are any NAs
any(is.na(df))

#sum(is.na()) - counts the number of NAs
sum(is.na(df))

# summary() - finds NAs
summary(df)

#complete.cases() - to find rows with no missing values
complete.cases(df)
df[complete.cases(df),]

#na.omit() - to remove rows with NAs
df1 <- na.omit(df)
df1

#Example Titanic

df_titanic <- read.csv(file = "TitanicDataMissingValues.csv")
View(df_titanic)
dim(df_titanic)

list.na <- colnames(df_titanic)[apply(df_titanic, 2, anyNA)]
list.na

#Exclude the missing observations
library(dplyr)
df_titanic_drop <- df_titanic %>%
  na.omit()
dim(df_titanic_drop)

#Imputing Missing Values in Dataset
#Immputing Missing data with the Mean and Median
#Create Mean
average_missing <- apply(df_titanic[,colnames(df_titanic) %in% list.na], 2, mean, na.rm = TRUE)

average_missing

#Create a new variable with the mean and median
#mutate()

df_titanic_replace <- df_titanic %>% mutate(replace_mean_age = ifelse(is.na(Age), average_missing[1], age), replace_mean_fare = ifelse(is.na(Fare), average_missing[2], Fare))
View(df_titanic_replace)