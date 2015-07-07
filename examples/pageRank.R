## Working directory for this script should be the root of the project
## If this file is in working directory, you can run command
## setwd('..')

source('RtweetsAnalytics.R')

hash.txt <- getAllHashes()[1,1]
tweets.df <- getTweetsFromDB(hash.txt, n.tweets=100)
rt.graph <- tweetRetweetGraph(tweets.df)
page.rank(rt.graph)
tweetRetweetNodes(rt.graph)



diameter(rt.graph)
average.path.length(rt.graph)
graph.density(rt.graph)
clusters(rt.graph)$no

basicStat3Df(rt.graph)

retwitted <- degree(rt.graph, mode='in')
retwitted
retwitted.df <- data.frame(Nodes=names(retwitted),
                           Nretwitted = retwitted,
                           orginalOrder = 1:length(retwitted),
                           stringsAsFactors=FALSE)
retwitted.df
retweets <- degree(rt.graph, mode='out')
retweets.df <- data.frame(Nodes=names(retweets),
                            Nretweets = retweets,
                          stringsAsFactors=FALSE)
prv <- page.rank(rt.graph)$vector
prv.df <- data.frame(Nodes=names(prv), PageRank=prv)
retweets.df
merged2 <- merge(retwitted.df, retweets.df)
merged3 <- merge(merged2, prv.df)
  # We should reurn it in the orginal order since it is needed for
  # ploting the graph of connections
merged1 <- merged3[order(merged3$orginalOrder),-3]
rownames(merged1) <- c()
merged3
merged1
