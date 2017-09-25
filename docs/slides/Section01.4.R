library(readr)
sp500 = read_csv("~/Dropbox/teaching/sta371g/sta371g_f17/docs/data/sp500_mar-1-17_to_sep-1-17.csv")

plot(sp500, type='l')
hist(sp500$daily.returns, main="", xlab="daily returns", prob=TRUE)

xbar = mean(sp500$daily.returns)
s2    = var(sp500$daily.returns)
s     = sd(sp500$daily.returns)
print(xbar)
print(s2)
print(s)

hist(sp500$daily.returns, prob=TRUE, main="", ylim=c(0, 0.9), xlab="daily returns")
curve(dnorm(x, xbar, s), add=TRUE, lwd=2, col='red')
      
sap = read_csv("~/Dropbox/teaching/sta371g/sta371g_f17/docs/data/sap.csv")
# The code below (using the mosaic package) takes a sample
# with replacement (of the same size) from the rows of sap
# and computes the mean in that sample. We are simulating
# repeated draws from the population, by assuming the population
# distribution of ROE is the same as the sample distribution.
library(mosaic)
print(sap)
sap.boot = do(1000) * { 
  # The ~roe notation below tells R to look in the data argument
  # (usually a data.frame) for a column called "roe".
  # The resample() command does the sampling with replacement
  # every time the do loop runs
  mean(~roe, data=resample(sap))
}
# The code below (using the mosaic package) takes a sample
# with replacement (of the same size) from the rows of sap
# and computes the mean in that sample. We are simulating
# repeated draws from the population, by assuming the population
# distribution of ROE is the same as the sample distribution.
library(mosaic)
sap.boot = do(1000) * { 
  mean(~roe, data=resample(sap))
}
hist(sap.boot$result, main="", xlab="xbar")

hist(sap.boot$result, main="", xlab="xbar", prob=TRUE, ylim=c(0, 20))
xbar = mean(~roe, data=sap)
s = sd(~roe, data=sap)
curve(dnorm(x, xbar, s/sqrt(81)), add=TRUE, col='red', lwd=2)

