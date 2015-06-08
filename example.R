wd <- getwd()
setwd('lib/RtweetsDb/')
source('twitterDb.R')
setwd(wd)

ts.python <- getTweetsFromDB('#python')
print(colnames(ts.python))
getAllHashes()
