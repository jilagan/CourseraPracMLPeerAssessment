library(lubridate)  # For year() function below
library(forecast)
dat = read.csv("gaData.csv") # placed in working directory
training = dat[year(dat$date) < 2012,]
testing = dat[(year(dat$date)) > 2011,]
tstrain = ts(training$visitsTumblr)

