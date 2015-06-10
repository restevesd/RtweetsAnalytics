RETWEET.PATERN <- "^(RT|via)((?:\\b\\W*@\\w+:)+)"

require('stringr')
require('igraph')

retweetsMatches <- function(tweets.df) {
  grep(RETWEET.PATERN, tweets.df$text, ignore.case=TRUE)
}

extractPosters <- function(tweets.df) {
  rt.posters <- str_extract(tweets.df$text, RETWEET.PATERN)
  rt.posters <- gsub("(RT @|via @)", "", rt.posters, ignore.case=TRUE)
  gsub(":", "", rt.posters, ignore.case=TRUE)
}

retweetsEdgelist <- function(tweets.df) {
  retweets.ines <- retweetsMatches(tweets.df)
  who.retweets <- tweets.df[retweets.ines,]$screenName
  who.tweets <- extractPosters(tweets.df[retweets.ines,])
  data.frame(Source=who.tweets, Target=who.retweets,
             stringsAsFactors=FALSE)
}

retweetsEdgelist.matrix <- function(tweets.df) {
  rts.edgelist.df <- retweetsEdgelist(tweets.df)
  cbind(rts.edgelist.df$Source, rts.edgelist.df$Target)
}

writeGephiCsv <- function(tweets.df,
                          vertices.csv.fn=NULL,edges.csv.fn=NULL
                          ) {
  if (is.null(vertices.csv.fn)) {
    vertices.csv.fn <- 'output/csv/vertices.csv'
  }
  if (is.null(edges.csv.fn)) {
    edges.csv.fn <- 'output/csv/edges.csv'
  }
  edges.df <- retweetsEdgelist(tweets.df)
  write.csv(edges.df, file=edges.csv.fn, row.names=F)
  vertices.df <- data.frame(ID=union(edges.df$Source, edges.df$Target))
  write.csv(vertices.df, file=vertices.csv.fn, row.names=F)
}

