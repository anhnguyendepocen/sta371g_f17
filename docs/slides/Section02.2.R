# Here I'm putting this small dataset right in the R script...
housing = data.frame(
  Size=c(0.8,0.9,1.0,1.1,1.4,1.4,1.5,1.6,1.8,2.0,2.4,2.5,2.7,3.2,3.5),
  Price=c(70,83,74,93,89,58, 85,114, 95,100,138,111,124,161,172)
)
# Computing least squares estimates "by hand"
y = housing$Price; x = housing$Size
rxy = cor(y, x)
sx = sd(x)
sy = sd(y)
ybar = mean(y)
xbar = mean(x)
b1 = rxy*sy/sx
b0 = ybar - b1*xbar
print(b0); print(b1)

# We get the same result as lm()
fit = lm(Price~Size, data=housing)
print(fit)

# R^2 is on the second to last line of the R output, under
# "Multiple R-squared". We'll talk about "Adjusted R-squared"
# when we get to multiple linear regression.
summary(fit)

# The anova() function will extract sums of squares, and do some hypothesis tests.
# We can use it to "check" how the sums of squares are related
anova(fit)

