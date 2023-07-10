##BarPlots

imdb<-(imdb_clean[1:20,])
ggplot(data=imdb, aes(x=release_year))+ geom_bar()

##Scatter plots with counts
gross<-imdb_clean$`gross(M)`
ggplot(data = imdb, aes(x=genre, y=imdb$release_year))+ geom_count()
ggplot(data=imdb, aes(x=rating, y= genre))+geom_count()       
imdb_clean[1>20,]
View(imdb_clean[1:20,])


##Line plot
ggplot(data=imdb, aes(x=rating, y=gross)) + geom_line(stat="summary", fun="mean")
