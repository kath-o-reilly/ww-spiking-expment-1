# aim: to trial a experiment for estimating,
# 1) the residence time for specific sampling points (alpha) (minutes)
# 2) the percentage recovery (rho)

# ** Brief description of model **
# - Assuming a impulse-response model...
# - an amount (impulse) is deposited in the sewer network, upstream
# - this is then detected downstream, as a response
# - the response is assumed to take the form of a Gaussian distribution,
# - with mean "alpha" and variance "alpha_v"

# assumptions in the model...
# we know the residence time (alpha), assume minutes
# the recovery is 1.00
# the distribution of alpha is normal

setwd("~/Documents/GitHub/ww-spiking-expment-1")

library(ggplot2)

# Assumptions of the impulse
impulse <- 1E+100
alpha <- 90
alpha_v <- 50
t_max <- 180

# assumptions for the sampling
samp <- 10 # maximum number of samples
samp_dur <- 1 # duration of the sampling

# simple plot of normal dist
# ty - the distribution of impulse once deposited, asssuming a average post-impulse time of alpha

t <- seq(20,t_max,1)
ty <- dnorm(t,alpha,sd=sqrt(alpha_v))

dat <- data.frame(t,ty)

p1 <- ggplot(dat,aes(x=t,y=ty)) + geom_line() + 
  geom_vline(xintercept = c(60,120,180),lty=2,col="grey50") +
  labs(title="Impulse-response model",x ="Time post-impulse (mins)", y = "Quantity (proportion)")
p1

# so let's optimistically hope that all the tracer will be shed within about 1 hour
# - this corresponds to about alpha_v = 50


# 1 - simulate our output response
# - simulate our data collection (x)
x <- floor(seq(1,t_max,length.out=samp))

# here we want to have a value of the impulse that will be present in
# the sample...
# this is going to be complicated because,
# - time is continuous! (or split into segments)
# - diluation is going to happen in the water and we
#   need to account for this!
y <- dnorm(x,alpha,sd=sqrt(alpha_v))

plot(x,y)

# estimate the values of alpha from this data
# using MoM...
# using the equation in the paper..

# I'm not sure if the dnorm should be used above, or something else?
#e_hat <- y / *integral of y*
# https://stat.ethz.ch/R-manual/R-devel/library/stats/html/ecdf.html  
  x <- rnorm(12)
Fn <- ecdf(x)

