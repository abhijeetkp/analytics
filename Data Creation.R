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
students = data.frame(age, gender, batch, cgpa, ug, class12)
head(students)

