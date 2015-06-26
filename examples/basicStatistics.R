# Working directory for this script should be the root of the project
# If this file is in working directory, you can run command
# setwd('..')
#

source('RtweetsAnalytics.R')

hash.txt <- getAllHashes()[1,1]
tweets.df <- getTweetsFromDB(hash.txt, n.tweets=100)

bs.df <- basicStatDf(tweets.df)
bs.df

print(paste('Total number of tweets:', bs.df[1,1]))
print(paste('Number of retweets:', bs.df[3,1]))
print(paste('Number of no retwitted tweets:', bs.df[2,1]))

freqPlotAll(tweets.df)
freqPlotByTRT(tweets.df)

tweets.df$created > 1

freqPlotByTRT(tweets.df, "2015-06-04") 
freqPlotByTRT(tweets.df, end.date="2015-06-09")
freqPlotByTRT(tweets.df, "2015-06-04", "2015-06-09")
freqPlotByTRT(tweets.df, "2015-06-04", "2015-06-20") 

useers.df <- getAllUsers()

bs2.df <- basicStat2Df(tweets.df, users.df)
bs2.df
