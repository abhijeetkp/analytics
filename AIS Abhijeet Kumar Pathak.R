# Installing DAAG Package.
install.packages(DAAG)

# Initializing Library DAAG
library(DAAG)

# Initializing Library dplyr
library(dplyr)

# Help topic about "ais" == Australian Athletes Data Set
?ais

# Loading data of ais
data("ais")

# Viewing summary of ais with minimum, 1st quartile, Median, Mean, 3rd quartile and Maximum values of colomun wise data.
summary(ais)

# Writing the data of "ais" in the "ais.csv" file for accessing the data easily for Linear Regression
write.csv(ais, file = "ais.csv")

# Reading the data of "ais.csv" and placing it in variable df, header = T will treat the first row as header
df <- read.csv("ais.csv", header = T)

# Viewing the content of df
View(df)

# Applying the filter to segregate the data into "Males Only" and transferring the same into another variable df1
df1 <- df %>% filter(sex == "m")

# Viewing the content of df1
View(df1)

# Applying Linear Regression with "hg" as independent data and "hc" as dependent data and placing the same in variable result
result <- lm(hc ~ hg, data = df1)

# Viewing the summary of result.
summary(result)
# Here both "intercept" and "hg" are very significant (***) with adjusted R-squared 0.799 and Multiple R-squared 0.801. Also the difference between Adjusted R-squared and Multiple R-squared is only 0.002. So the Accuracy will be approx. 80%.

# Preparing Box Plot for hg and hc of data df1
boxplot(x = df1$hg)
boxplot(x = df1$hc)

# Preparing Density Plot for hg and hc of data df1
densityplot(x = df1$hg)
densityplot(x = df1$hc)

# Preparing Histogram for hg and hc of data df1
hist(df1$hg, freq = TRUE)
