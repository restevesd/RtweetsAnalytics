# Working directory for this script should be the root of the project
# If this file is in working directory, you can run command
# setwd('..')
#

source('RtweetsAnalytics.R')

getAllHashes()

hash.txt <- '#IGUALES'
tweets.df <- getTweetsFromDB(hash.txt, n.tweets=100)
rt.graph <- tweetRetweetGraph(tweets.df)
tweetRetweetPlot(rt.graph)

writeGephiCsv(tweets.df)

names(tweets.df)
as.POSIXct(1433500000, origin = "1970-01-01")
tweets.df$created.Pct <- 

  hist(as.Date(tweets.df$created.Pct))

source('tweets.R')
createdPlot(tweets.df)
