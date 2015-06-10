wd <- getwd()
setwd('lib/RtweetsDb/')
source('twitterDb.R')
setwd(wd)

source('retweets.R')
source('retweetsIGraph.R')

getAllHashes()

hash.txt <- '#IGUALES'
ts.df <- getTweetsFromDB(hash.txt, n.tweets=500)
dim(ts.df)
rt.graph <- tweetRetweetGraph(ts.df)

rt.graph <- tweetRetweetGraph(ts.df)

get.vertex.attribute(rt.graph, "name", index=V(rt.graph))

tweetRetweetPlot(rt.graph)

writeGephiCsv(ts.df)
