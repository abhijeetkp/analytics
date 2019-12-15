# Installing rpart Package
install.packages("rpart")

#Loading rpart Library
library(rpart)

# Reading the data of "DTbills.csv" and placing it in variable df, header = T will treat the first row as header
df <- read.csv("https://raw.githubusercontent.com/DUanalytics/datasets/master/csv/DTbills.csv", header = T)

# Viewing the content of df
View(df)

# Applying the filter to segregate the data into "Males Only" and transferring the same into another variable df1
#df1 <- df %>% filter(Bill > 600) %>% (Gender == 0) %>% (std == 0)

# Viewing the content of df1
#View(df1)

# Fit tree
tree<-rpart(Leave.service ~ Bill + Gender + std,method = "class", data = df, control = rpart.control(minsplit=0, cp=0.001))

# Plot tree
plot(tree, uniform=TRUE, main="Classification Tree for Telecom")
text(tree, use.n=TRUE, all=TRUE, cex=.6)
