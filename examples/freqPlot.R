# Working directory for this script should be the root of the project
# If this file is in working directory, you can run command
# setwd('..')
#

source('RtweetsAnalytics.R')

hash.txt <- getAllHashes()[1,1]
tweets.df <- getTweetsFromDB(hash.txt, n.tweets=100)
freqPlotByTRT(tweets.df)
