# Working directory for this script should be the root of the project
# If this file is in working directory, you can run command
# setwd('..')
#

source('RtweetsAnalytics.R')

hash.txt <- getAllHashes()[1,1]
tweets.df <- getTweetsFromDB(hash.txt, n.tweets=100)

print(paste('Total number of tweets:', dim(tweets.df)[1]))
print(paste('Number of retweets:', dim(retwitted(tweets.df))[1]))
print(paste('Number of no retwitted tweets:', dim(noRetwitted(tweets.df))[1]))

freqPlotAll(tweets.df)
freqPlotByTRT(tweets.df)


