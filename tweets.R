require(ggplot2)

createdPlot <- function(tweets.df) {
  new.ts <- data.frame(dt=as.POSIXct(tweets.df$created, origin = "1970-01-01"))
  new.ts$day <- as.Date(new.ts$dt)
  
  ggplot(data=new.ts) + geom_freqpoly(aes(dt), binwidth=10000)+
    theme_bw() + xlab('DateTime')
  
}
