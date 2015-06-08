source('helper.R')
source('retweets.R')


texts <- c("RT @orvtech: #Python: some text",
           "RT @orvtech: #Python: some text RT @aaa: ",
           "#Python: some text",
           "some text RT @aaa: ")
screenNames <- c('ala', 'ma', 'koty', 'dwa')
tweets.df <- data.frame(text=texts, screenName=screenNames, stringsAsFactors=FALSE)

describe('retweets.ines', {  
  rt.matches <- retweetsMatches(tweets.df)
  expect_that(rt.matches, equals(c(1,2)))
})


describe('extractPosters()', {
  expect_that(extractPosters(tweets.df),
              equals(c("orvtech", "orvtech", NA, NA )))
})

describe('retweetsEdgelist()', {
  rts.edgelist.df <- retweetsEdgelist(tweets.df)
  expect_that(dim(rts.edgelist.df), equals(c(2,2)))
  expect_that(rts.edgelist.df$retwitter, equals(c('ala', 'ma')))
  expect_that(rts.edgelist.df$twitter, equals(c("orvtech", "orvtech")))
})
