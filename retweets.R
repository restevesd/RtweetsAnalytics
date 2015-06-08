RETWEET.PATERN <- "^(RT|via)((?:\\b\\W*@\\w+)+)"

require('stringr')

retweetsMatches <- function(tweets.df) {
  grep(RETWEET.PATERN, 
       tweets.df$text, ignore.case=TRUE)
}

extractPosters <- function(tweets.df) {
  rt.posters <- str_extract(tweets.df$text, RETWEET.PATERN)
  gsub("(RT @|via @)", "", rt.posters, ignore.case=TRUE) 
}

retweetsEdgelist <- function(tweets.df) {
  retweets.ines <- retweetsMatches(tweets.df)
  retwitters <- tweets.df[retweets.ines,]$screenName
  twitters <- extractPosters(tweets.df[retweets.ines,])
  data.frame(twitter=twitters, retwitter=retwitters, stringsAsFactors=FALSE)
}
