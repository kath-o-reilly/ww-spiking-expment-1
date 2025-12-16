# aim: to trial a experiment for estimating,
# 1) the residence time for specific sampling points (alpha) (minutes)
# 2) the percentage recovery (rho)

# assumptions in the model...
# we know the residence time (alpha)
# the recovery is 1.00
# the distribution of alpha is normal

impulse <- 1E+100
alpha <- 90
alpha_v <- 1
t_max <- 180
samp <- 10 # maximum number of samples

# 1 - simulate our output response
# - simulate our data collection
x <- floor(seq(1,t_max,length.out=samp))

# here we want to have a value of the impulse that will be present in
# the sample...
# this is going to be complicated because,
# - time is continuous! (or split into segments)
# - diluation is going to happen in the water and we
#   need to account for this!
y <- dnorm(x,alpha,sd=sqrt(alpha_v))*impulse

plot(x,y)

# estimate the values of alpha from this data
# using MoM...
# using the equation in the paper..

# I'm not sure if the dnorm should be used above, or something else?
#e_hat <- y / *integral of y*
# https://stat.ethz.ch/R-manual/R-devel/library/stats/html/ecdf.html  
  x <- rnorm(12)
Fn <- ecdf(x)

