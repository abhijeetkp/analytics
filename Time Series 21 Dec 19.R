#TS - 21 Dec 2019

#dates-----
dob = '03-June-1992'
dobs = c('08-Oct-1994', '13-Aug-1997', '11-Oct-1996')
class(dob)
class(dobs)
dob + 1 #this will not work
#-----
Sys.Date()  #todays date : Year-Month-Day : %Y-%m-%d
print(format(Sys.Date(), format('%d-%m-%Y')))
print(format(Sys.Date(), format('%d-%B-%Y')))
format(Sys.Date(), format('%d ::: %m %b %B :: %y %Y : %a %A'))
#what are the other formats ???
dt_dob = as.Date(dob)  #incorrect
dt_dob = as.Date(dob, format="%d-%b-%Y")
dt_dob
class(dt_dob)
dt_dobs = as.Date(dobs, format="%d-%b-%Y")
dt_dobs
dt_dob + 1
dt_dobs + 5
format(dt_dobs, format = "%A")
Sys.Date() - dt_dob
Sys.Date() - dt_dobs  #numeric 
(Sys.Date() - dt_dobs)/365  #years
diff(dt_dobs)
#sequence of dates----
(trainingDays <- seq(Sys.Date(), length = 6, by = "day"))
seq(Sys.Date(), length = 6, by = "month")
seq(Sys.Date(), length = 6, by = "3 months")

all <- seq(as.Date('2019-10-01'),as.Date('2019-12-31'),by = 1)
all
range(all)
weekdays(all)
(weekends <- all[weekdays(all) %in% c('Saturday','Sunday')])
weekends
weekdays(weekends)
weekends[months(weekends) %in% c('December')]   #december
range(all)
diff(range(all))


#include time
tm1 <- as.Date("2019-12-22 10:10", format="%Y-%m-%b %H:%M")
tm1
tm1 <- as.POSIXct("2019-12-22 10:10")
tm1
tm2 <- as.POSIXct("2019-12-22 18:00")
tm2
tm2 - tm1
difftime(tm2, tm1, units='mins')
difftime(tm2, tm1, units='hours')

months(all)
quarter(all)

#print date & time
print(format(tm1, format = "%d - %b , %Y : %d/%B/%y, %A : %a : %H:%M:%S %l %p"))
print(format(tm2, format = "%d - %b , %Y : %d/%B/%y, %A : %a : %H:%M:%S %l %p"))
print(tm2, format = "%Y-%m-%d %H:%M:%S")
#library-lubridate
library(lubridate)
dmy('231219') 
mdy('231219') # error
dmy(231219)
mdy(12232019)
dobs
dmy(dobs) #auto picking up in the order

#read more about libridate: ?lubridate
#time series----
#https://cran.r-project.org/web/packages/timeSeries/timeSeries.pdf
library(timeSeries)
tsdata = ts(data = sample(100:150), start=c(2019,1), end=c(2019,12), frequency=12)
tsdata
class(tsdata)
window(tsdata, start=c(2019,2), end=c(2019,5) )
plot(tsdata)

#Moving Average----
library(TTR)
SMA3 = SMA(tsdata,3)  #smoothening
SMA3

#(x1+x2+x3)/3  : keep shifting
#Exponential Smoothening : recent values more weightage
ES = ets(tsdata)
ES
forecast::forecast(ES,2)  #forecast next 2 months

sales = round(rnorm(100, mean = 120, sd = 2))
sales
ts1 = ts(data = sales, start = c(2010,1), frequency = 12)
ts1
plot(ts1)
SMA1a = SMA(ts1, n = 5)
head(ts1); head(SMA1a)
sum(ts1[1:5]/5)

#built in data sets
AirPassengers
monthplot(AirPassengers)
forecast::seasonplot(AirPassengers)
plot(AirPassengers)

#Decompose into Components : Random, Seasonsal, Trend
dcAP <- decompose(AirPassengers, type = "multiplicative")
dcAP
plot(dcAP)  #see the components
dcAP$seasonal  #which are high season periods
forecast::seasonplot(AirPassengers)

#multiple sales/ stocks
library(zoo)


library(xts)


#financialdata----
library(quantmod)
start <- as.Date("2019-10-01") ;end <- as.Date("2019-12-20")
getSymbols("SBIN.NS", src = "yahoo", from = start, to = end)
SBIN.NS
head(SBIN.NS)
plot(SBIN.NS[, "SBIN.NS.Close"], main = "SBIN.NS")
candleChart(SBIN.NS, up.col = "black", dn.col = "red", theme = "white")

getSymbols("MSFT", src = "yahoo", from = start, to = end)
MSFT
head(MSFT)
plot(MSFT[, "MSFT.Close"], main = "MSFT")
candleChart(MSFT, up.col = "black", dn.col = "red", theme = "white")

#multiple stocks - prices from 
getSymbols(c("ICICIBANK.NS", "TATAMOTORS.NS"), src = "yahoo", from = start, to = end)

stocks = as.xts(data.frame(SBIN = SBIN.NS[, "SBIN.NS.Close"], ICICI = ICICIBANK.NS[, "ICICIBANK.NS.Close"], TATAMOTORS = TATAMOTORS.NS[, "TATAMOTORS.NS.Close"]))
head(stocks)
plot(as.zoo(stocks), screens = 1, lty = 1:3, xlab = "Date", ylab = "Price")
legend("right", c("SBIN", "ICICI", "TATATMOTORS"), lty = 1:3, cex = 0.5)
