source('retweets.R')

tweetRetweetGraph <- function(tweets.df) {
  graph.edgelist(retweetsEdgelist.matrix(tweets.df))
}

tweetRetweetNodes <- function(rt.graph) {
  retwitted <- degree(rt.graph, mode='out')
  names(retwitted)
  retwitted.df <- data.frame(Nodes=names(retwitted),
                             Nretwitted = retwitted,
                             orginalOrder = 1:length(retwitted),
                             stringsAsFactors=FALSE)
  retweets <- degree(rt.graph, mode='in')
  retweets.df <- data.frame(Nodes=names(retweets),
                            Nretweets = retweets,
                            tringsAsFactors=FALSE)
  merged <- merge(retwitted.df, retweets.df)
  merged[order(merged$orginalOrder),]
}

tweetRetweetPlot <- function(rt.graph, Nlabels=10) {
  nodes.df <- tweetRetweetNodes(rt.graph)
  labeledNodes <- nodes.df[order(-nodes.df$Nretwitted),]$Nodes[1:Nlabels]
  nodes.df$label <- sapply(nodes.df$Nodes, function(n) {if (n %in% labeledNodes) {n} else {""}})
  nodes.df$color <- "gray45"
  l <- layout.fruchterman.reingold(rt.graph, niter=10000,area=vcount(rt.graph)^2.3,
                                  repulserad=vcount(rt.graph)^2.2)
  plot(rt.graph, vertex.size=nodes.df$Nretwitted/20, vertex.label= nodes.df$label,
     vertex.color=nodes.df$Nretweets, # edge.color=fb.net.el$color,
     edge.width=1, edge.arrow.size=0.2, edge.curved=0.3,  layout=l)


}

