wd <- getwd()
setwd('lib/RtweetsDb/')
source('twitterDb.R')
setwd(wd)

source('retweets.R')
source('retweetsIGraph.R')

getAllHashes()

hash.txt <- '#IGUALES'
tweets.df <- getTweetsFromDB(hash.txt, n.tweets=10000)
rt.graph <- tweetRetweetGraph(tweets.df)
tweetRetweetPlot(rt.graph)

writeGephiCsv(ts.df)

names(tweets.df)
as.POSIXct(1433500000, origin = "1970-01-01")
tweets.df$created.Pct <- 

  hist(as.Date(tweets.df$created.Pct))

source('tweets.R')
createdPlot(tweets.df)
