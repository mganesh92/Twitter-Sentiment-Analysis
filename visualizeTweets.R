install.packages("SnowballC")
library(wordcloud)
library(SnowballC)
library(tm)

terror <- searchTwitter("#coldplay",n=1000)
terro_text <- sapply(terror, function(x) x$getText())
terro_text_corpus <- Corpus(VectorSource(terro_text))

# clean the data
#1. remove punctuations
#2. convert all to lower case
#3. remove stopwords or remove the words which we may feel may be trivial
terro_text_corpus_nopunc <- tm_map(terro_text_corpus, removePunctuation)
terro_text_corpus_nopunc_lc <- tm_map(terro_text_corpus_nopunc, content_transformer(tolower))
terro_text_corpus_nopunc_lc_noStopWrds <- tm_map(terro_text_corpus_nopunc_lc, function(x)removeWords(x,stopwords()))

#remove URL from the comments
removeURL <- function(x) gsub("http[[:alnum:]]*", "", x)
terro_text_corpus_nopunc_lc_noStopWrds_removeURL <- tm_map(terro_text_corpus_nopunc_lc_noStopWrds, content_transformer(removeURL))
#build a term document matrix. this would put the text in alphabetical order matrix
terror_finalCorpus<-terro_text_corpus_nopunc_lc_noStopWrds_removeURL
# create document matrix with frequency of words from all the tweets
terror_2 <- TermDocumentMatrix(terror_finalCorpus)
terror_3 <- as.matrix(terror_2)
terror_4 <- sort(rowSums(terror_3),decreasing=TRUE)
#convert words to data frames
terror_5 <- data.frame(word = names(terror_4),freq=terror_4)
head(terror_5,10)

barplot(terror_5[1:10,]$freq, las = 2, names.arg = terror_5[1:10,]$word,
        col ="yellow", main ="Most frequent words",
        ylab = "Word frequencies")
#I used dev.off if the margin error occurs
#adjust the frequency to show the most influence of the words...at fre=1000...only barcelona and terrorism shows up
wordcloud(terror_finalCorpus,min.freq=100,max.words=100,scale=c(2.2,1), colors=brewer.pal(8, "Dark2"),random.color=T, random.order=F)

