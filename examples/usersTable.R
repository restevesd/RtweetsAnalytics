# Working directory for this script should be the root of the project
# If this file is in working directory, you can run command
# setwd('..')
#

source('RtweetsAnalytics.R')


hash.txt <- getAllHashes()[1,1] # get first hash in db
tweets.df <- getTweetsFromDB(hash.txt, n.tweets=100) # get tweets from db
retweetsEdgelist(tweets.df) # list of edges of graph

trt.graph <- tweetRetweetGraph(tweets.df)

## Graph statistics
tweetRetweetNodes(trt.graph)

## Get full statistics (join with db users)
tweetRetweetNodesFull(trt.graph)
