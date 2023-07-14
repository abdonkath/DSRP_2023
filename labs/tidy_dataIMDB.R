imdb <- imdb_clean

drama<-filter(imdb, genre =="Drama")
action <- filter(imdb, genre == "Action")


t.test(drama$rating, action$rating, paired = F, alternative = "less")

