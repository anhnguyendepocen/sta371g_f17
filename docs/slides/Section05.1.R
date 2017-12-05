library(readr)
path = "https://jaredsmurray.github.io/sta371g_f17/data/"

beer = read_csv(paste0(path, 'beer.csv'))
beerfit_hw = lm(nbeer~weight+height, data=beer)
summary(beerfit_hw)
beerfit_w = lm(nbeer~weight, data=beer)
summary(beerfit_w)

## Out of sample forecasts for the airline data
library(forecast)
airline = read_csv(paste0(path, 'airline.csv'))
passengers = ts(airline$Passengers[-nrow(airline)], start=c(1949, 1), frequency=12)

fit1 = tslm(log(passengers)~trend)
fit2 = tslm(log(passengers)~trend+season)


X = cbind(trend=1:length(passengers), # This is the trend
          season=seasonaldummy(passengers) # These are the seasonal (month) dummies
          )

# We can use Arima to generate forecasts with lagged variables here too, by
# specifying the other variables (trend + seasonal dummies) using the xreg 
# argument below
fit3 = Arima(log(passengers), order=c(1,0,0), xreg = X)

h=1
f1 = forecast(fit1, h=h)
f2 = forecast(fit2, h=h)
# First we need to build the new covariates:
new_X = cbind(trend = seq(length(passengers)+1, length(passengers)+h),
              season = seasonaldummy(passengers, h=h))
f3 = forecast(fit3, h=h,  xreg=new_X)

full_series =  ts(airline$Passengers, start=c(1949, 1), frequency=12)
plot(log(passengers), xlim=c(1959, 1962), ylim=c(5.75, 6.5))
points(1961 - 1/12, log(full_series[length(full_series)]), pch=20)
points(1961 - 1/12, f1$mean, pch=4, col='red')
points(1961 - 1/12, f2$mean, pch=4, col='blue')
points(1961 - 1/12, f3$mean, pch=4, col='darkorange')

## Out of sample forecasts for the airline data, this time with a whole year
library(forecast)
passengers = ts(airline$Passengers[-((nrow(airline)-11):nrow(airline))], start=c(1949, 1), frequency=12)

h=12
f1 = forecast(fit1, h=h)
f2 = forecast(fit2, h=h)
# First we need to build the new covariates:
new_X = cbind(trend = seq(length(passengers)+1, length(passengers)+h),
              season = seasonaldummy(passengers, h=h))
f3 = forecast(fit3, h=h,  xreg=new_X)

plot(log(passengers), xlim=c(1959, 1962), ylim=c(5.75, 6.5))
points(1960 + (1:12)/12, log(full_series[((nrow(airline)-11):nrow(airline))]), pch=20)
points(1960 + (1:12)/12, f1$mean, pch=4, col='red')
points(1960 + (1:12)/12, f2$mean, pch=4, col='blue')
points(1960 + (1:12)/12, f3$mean, pch=4, col='darkorange')

# Computing model selection criteria for the two beer models:
CV(beerfit_hw)
CV(beerfit_w)
