source('helper.R')
source('retweets.R')


texts <- c("RT @orvtech: #Python: some text",
           "RT @orvtech: #Python: some text RT @aaa: ",
           "#Python: some text",
           "some text RT @aaa: ",
           "RT @Indavelopers: @MiguelAngel_LV Para el resto, la mejor alternativa, como siempre, es #Python y #beautifulsoup p. ej. #jpd15 #jpd15al")
screenNames <- c('ala', 'ma', 'koty', 'dwa', 'trzy')
tweets.df <- data.frame(text=texts, screenName=screenNames, stringsAsFactors=FALSE)

describe('retweets.ines', {  
  rt.matches <- retweetsMatches(tweets.df)
  expect_that(rt.matches, equals(c(1,2,5)))
})

describe('extractPosters()', {
  expect_that(extractPosters(tweets.df),
              equals(c("orvtech", "orvtech", NA, NA, "Indavelopers" )))
})

describe('retweetsEdgelist()', {
  rts.edgelist.df <- retweetsEdgelist(tweets.df)
  expect_that(dim(rts.edgelist.df), equals(c(3,2)))
  expect_that(rts.edgelist.df$Target, equals(c('ala', 'ma', 'trzy')))
  expect_that(rts.edgelist.df$Source, equals(c("orvtech", "orvtech", "Indavelopers")))
})

texts <- c("RT @p2:", "RT @p3:", "RT @p1:", "RT @p3:") 
screenNames <- c('p1', 'p2', 'p3', 'p4')
tweets2.df <- data.frame(text=texts, screenName=screenNames, stringsAsFactors=FALSE)
print(retweetsEdgelist(tweets2.df))
#gr <- tweetRetweetGraph(tweets2.df)
#rglplot(gr)
