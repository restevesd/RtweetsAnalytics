# RtweetsAnalytics


## Description

This project uses various ideas to present twitter's data. Many of
these ideas can be found on internet. I have selected ones that I or
people I work with find useful then I rewrote them to suit our
needs. There is also some new stuff. 

It is build on my project:
https://github.com/sbartek/RtweetsDb
that uploads and saves data form Twitter into a relational database. 

Features:
* Basic statistics: number of tweets, number of retweets, number of
participants, list of most influencing users
* Create graph of tweets where the relation between tweets is the
following: tweet1 -> tweet2 if tweet2 is a retweet of tweet1.
* Create csv files that can be exported to gephi
* Plot the graph


## Examples

See 'examples' directory

## Tests

```r
require('testthat')
test_dir('tests/testthat')
```
