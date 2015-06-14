# Working directory for this script should be the root of the project
# If this file is in working directory, you can run command
# setwd('..')
#

source('RtweetsAnalytics.R')

hash.txt <- getAllHashes()[1,1]
tweets.df <- getTweetsFromDB(hash.txt, n.tweets=100)

bs <- basicStat(tweets.df)

basicStatDf(tweets.df)

bs.df <- data.frame(Number=c(bs$totalNumber, bs$noRetwittedNumber, bs$retwittedNumber))
rownames(bs.df) <- c('Total','No retwitted', 'Retwitted')
bs.df

print(paste('Total number of tweets:', dim(tweets.df)[1]))
print(paste('Number of retweets:', dim(retwitted(tweets.df))[1]))
print(paste('Number of no retwitted tweets:', dim(noRetwitted(tweets.df))[1]))

freqPlotAll(tweets.df)
freqPlotByTRT(tweets.df)

tweets.df$created > 1

freqPlotByTRT(tweets.df, "2015-06-04") 
freqPlotByTRT(tweets.df, end.date="2015-06-09")
freqPlotByTRT(tweets.df, "2015-06-04", "2015-06-09")
freqPlotByTRT(tweets.df, "2015-06-04", "2015-06-20") 

require('ggplot2')

bs <- basicStat(tweets.df)

bs.df
ggplot(data=NULL) +
  geom_bar(aes(x=c("Originl","Retwitted"),
               y=c(Original, )), stat='identity') +
  theme_bw()
