library(mosaic)
num.sim = 10000
num.heads.sample = do(num.sim) * {
  coinflips.result = sample(x = c(0, 1),
                            size = 2, replace = TRUE)
  sum(coinflips.result)
}
table(num.heads.sample)/num.sim
