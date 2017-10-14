# Dataset for hw 5 problem 1
stereos = data.frame(
  sales = c(420, 380, 350, 400, 440, 380, 450, 420 ),
  price = c(5.5, 6.0, 6.5, 6.0, 5.0, 6.5, 4.5, 5.0)
)

# Example for plotting a scatterplot + regression line
# Delete this from the R script you submit
dat = data.frame(x = c(1,2,3,4,5),y = c(-1, 2, 0, 5, 4))
fit = lm(y~x, data=dat)
plot(y~x, data=dat)
abline(fit)

library(readr)
# This is a shortcut to download data directly from the course website.
# To work offline, download the file to a folder on your computer
# and edit the path variable to point to that folder. Or you
# can use RStudio's import tool like in the tutorials in HW 0
path = "https://jaredsmurray.github.io/sta371g_f17/data/"
waite = read_csv(paste0(path, 'waite.csv'))

