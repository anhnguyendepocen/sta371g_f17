library(readr)
# Load data for problem 1
path = "https://jaredsmurray.github.io/sta371g_f17/data/"
baseball = read_csv(paste0(path, 'baseball.csv'))
# We can tell R which level should be the reference category
# for a factor using the relevel function. The code below
# modifis the League column so R knows we want the National
# League to be the reference category when we fit a regression
# model.
baseball$League = relevel(factor(baseball$League), ref="National")

# Load data for problem 2
path = "https://jaredsmurray.github.io/sta371g_f17/data/"
orion = read_csv(paste0(path, 'orion.csv'))

