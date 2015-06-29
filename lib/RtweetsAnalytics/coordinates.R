DELTA <- 0.1

## require('ggmap')

tweetsCoordinates <- function(tweets.df, users.df, coordinates.df,
                              users.screenName='screenName'
                              ) {
  ts <- tweets.df$screenName
  n <- length(ts)
  tw.df <- data.frame(screenName=ts, orginalPos=1:n)
  us.df <- data.frame(screenName=users.df[users.screenName], location=users.df$location)
  twUs.df <- merge(tw.df, us.df, all.x=TRUE)
  cs.df <- coordinates.df[c("location", "lon", "lat")]
  twUsCs.df <- merge(twUs.df, cs.df, all.x=TRUE)
  twUsCs.df[twUsCs.df$orginalPos,]
}

distrurb <- function(vec, delta=DELTA) {
  n <- length(vec)
  noise <- rnorm(n, 0, delta)
  vec + noise
}

coordinatesDisturbed <- function(coordinates.df, delta=DELTA) {
    data.frame(lon=distrurb(coordinates.df$lon, delta),
               lat=distrurb(coordinates.df$lat, delta))
}

tweetsCoordinatesDisturbed <- function(tweets.df, users.df, coordinates.df,
                              users.screenName='screenName', delta=DELTA) {
  tsCs <- tweetsCoordinates(tweets.df, users.df, coordinates.df,
                            users.screenName)
  coordinatesDisturbed(tsCs, delta=DELTA)
}

## Ploting on World Map

usersMapPlot <- function(coordinates.df) {
  worldMap <- map_data("world")
  coordinates.plot <- ggplot() +
    geom_polygon( data=worldMap, aes(x=long, y=lat, group = group),
                 colour="grey", fill="grey10", size=.1 ) +
    theme_minimal() +
    theme(plot.background= element_rect(fill = "gray10"),
          panel.grid.major = element_line(colour="grey", size=0.1),
          panel.grid.minor = element_line(colour="grey", linetype="dashed", size=0.1)
          ) +
    xlab("") + ylab("") 
  coordinates.plot + geom_point(data = coordinates.df,  
                                aes(x = lon, y = lat),
                                colour = "yellow", alpha = .1, size = 1)
}
