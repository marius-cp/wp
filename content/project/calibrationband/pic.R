library(calibrationband)
library(dplyr)
set.seed(123)
s=.8
n=10000
x <- runif(n)
p <- function(x,s){p = 1/(1+((1/x*(1-x))^(s+1)));return(p)}
dat <- tibble::tibble(pr=x, s=s, cep = p(pr,s), y=rbinom(n,1,cep))%>% dplyr::arrange(pr)

cb <- calibration_bands(x=dat$pr, y=dat$y,alpha=0.05, method = "round", digits = 3)
print(cb) # prints autoplot and summary, see also autoplot(.) and summary(.)

pic <- autoplot(cb)
pic
setwd("~/Dropbox/work/wp/hugo/wp_20211210/content/project/calibrationband")
ggplot2::ggsave("featured.jpg", width = 2, height = 2)
