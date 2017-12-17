install.packages("RColorBrewer")
install.packages("tm")
install.packages("wordcloud")
install.packages('base64enc')
install.packages('ROAuth')
install.packages('plyr')
install.packages('stringr')
install.packages('twitteR')

library(RColorBrewer)
library(wordcloud)
library(tm)
library(twitteR)
library(ROAuth)
library(plyr)
library(stringr)
library(base64enc)
download.file(url="http://curl.haxx.se/ca/cacert.pem",destfile="cacert.pem")
requestURL <- "https://api.twitter.com/oauth/request_token"
accessURL <- "https://api.twitter.com/oauth/access_token"
authURL <- "https://api.twitter.com/oauth/authorize"

consumerKey <- "dyklnEjrZbBg1aamL6r3CuIDn"
consumerSecret <- "np6KPctbyMO55UoSYH98Ggk72JtJa0VwAXLYpIMLm2uNjydwkJ"
accessToken <- "2810953832-6XFZhaP9MTzCDK6M15ZPemCL8XtXtARn9OeGSl5"
accessTokenSecret <- "s9WJikwfdKJnKWZQWqy7J0zIUBOZ6E1z15IfU9G8WdVPi"
setup_twitter_oauth(consumerKey,
                    consumerSecret,
                    accessToken,
                    accessTokenSecret)
insta <- searchTwitter("#ASU",n=5000)
length (insta)
insta[[1]] # the first tweet
tweet=userTimeline("ASU",n=100)
# tweet(1) will post 1 on my timeline
