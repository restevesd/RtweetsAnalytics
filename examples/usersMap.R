# Working directory for this script should be the root of the project
# If this file is in working directory, you can run command
# setwd('..')
#

source('RtweetsAnalytics.R')

hash.txt <- getAllHashes()[1,1]
tweets.df <- getTweetsFromDB(hash.txt, n.tweets=100)

require('ggmap')

twitterOAuth()
userInfo <- lookupUsers(tweets.df$screenName)  # Batch lookup of user info


userFrame <- twListToDF(userInfo)  # Convert to a nice dF

locatedUsers <- userFrame$location != ""




locations <- geocode(userFrame$location[locatedUsers])  # Use amazing API to guess
# approximate lat/lon from textual location data.
#with(locations, plot(lon, lat))
locations 
worldMap <- map_data("world")  # Easiest way to grab a world map shapefile
 
zp1 <- ggplot(worldMap)
zp1 <- zp1 + geom_path(aes(x = long, y = lat, group = group),  # Draw map
                       colour = gray(2/3), lwd = 1/3)
zp1 <- zp1 + geom_point(data = locations,  # Add points indicating users
                        aes(x = lon, y = lat),
                        colour = "RED", alpha = 1/2, size = 1)
zp1 <- zp1 + coord_equal()  # Better projections are left for a future post
zp1 <- zp1 + theme_minimal()  # Drop background annotations
print(zp1)
