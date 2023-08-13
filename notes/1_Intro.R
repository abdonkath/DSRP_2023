2+2
number<-5
number
number + 1
number <- number + 1

#This is a comment
number <- 10 # set number to 10

# R Objects ####
ls()# print the names of all objects

number <- 5
decimal <- 1.5

letter <- "a"
world <- "hello"

logic <-TRUE
logic2<-F
letter
## types of variables
## there are 3 main classes: numeric, character, and logical)
class(number)
class(decimal) # numeric

class(letter)
class(word)# character

class(logic)#logical



## there is more variation in types.
typeof(number)
typeof(decimal)

## we can change the type of an object
as.character(number)
as.integer(number)
as.integer(decimal)


## how to round numbers
round(decimal) #less than.05, rounds down, greater or equal to 0.5, rounds up
round(22/7, 3) # 3 values after the decimal
?round

22/7
ceiling(22/7) #ceiling always rounds up
floor(22/7)#floor always rounds down
floor(3.9)


?as.integer
word_as_int<-as.integer("hello")

## NA values
NA+5

##naming
name <- "Sarah"
NAME <- "JOE"
n.a.m.e<-"Sam"
n_a_m_e<-"Lisa"

#illegal naming characters:
# starting with a number
#operators;+-/*
#conditionals:&<>!
#others:\,space
#starting with an underscore

n+ame<-"Paul"
n,a,m,e<-"Paul"


## good naming convention
camelCase <- "start with capital letter"
snake_case<-"underscores between words"


## Object manipulation ####
number
number +7 

decimal
number + decimal

name
paste(name, "Parker", "is", "awesome")## concatenates character vectors
paste(name, "Parker is awesome")
paste0(name, "Parker")

paste(name,number)# we can join together characters and numbers
logic<-T
paste0(name,logic)

letter
ls()
paste(n.a.m.e,"is","making","delicous","cookies")

?grep
food<-"watermelon"
grepl("me",food)
sub("me","you",food)

##substituting charcters in words
sub("me","you",food)
sub("me","",food)



#Vectors ####
#make a vector of numerics
numbers<-c(2,4,6,8,10)
range_of_vals <- 1:5 ## all integers from 1 to 5
5:10 # all integers from to 10
seq(2,10,2)
seq(by = 2, from =2, to = 10)
seq(from=2, to=9, by = 2)
rep(3,5) # repeats 3 5x
rep(c(1,2),5)# repeats 1,2 5x

# how can we get all the values between 1 and 5 by 0.5
seq(from =1, to=5, by=0.5)

c(rep(1,3),rep(2,3))
rep(c(1,2),each=3)
#make a vector of characters
letters <- c("a","b","c")
paste("a","b","c") #paste() is different from (0)

letters<- c(letters,"d")

letters<- c(letter, letter)
letter <- c("x",letters,"w")


# make a vector of random numbers between 1 and 20
numbers<- 1:20
five_nums<-sample(numbers,5)
five_nums<-sort(five_nums)
five_nums
rev(five_nums)
fifteen_nums<- sample(numbers,15,replace=T)
fifteen_nums
fifteen_nums<-sort(fifteen_nums)
fifteen_nums
length(fifteen_nums)# length of a vector
unique(fifteen_nums)# what are the unique values in the vector
#how do we get the number of unique values?
length(unique(fifteen_nums))

table(fifteen_nums)# get the count of values in the vector

fifteen_nums +5 #adds 5 to every single value
fifteen_nums/2
nums1<-c(1,2,3)
nums2<-c(4,5,6)
nums1+nums2# values are added together element-wise
nums3<-c(nums1,nums2)
nums3+nums1 #values are recycled to add together
nums3+nums1 +1

sum(nums3+1)
sum(nums3)+1

#Vector indexing
numbers<- rev(numbers)
numbers[1]
numbers[5]

numbers[c(1,2,3,4,5)]
numbers[1:5]
numbers[c(1,5,2,12)]
i<-5
numbers[i]

#Datasets ####
?mtcars
mtcars #print entire datasets to console

View(mtcars) # View entire datasets in a new tab

summary(mtcars)#gives us information about the spread of each variable
str(mtcars)# preview the stucture of the dataset

names(mtcars)#names of variables
head(mtcars,5)# preview the first numebrs of rows

##Pull out individual variables as vectors
mtcars[2,2]#values ar second row, second column
mtcars[3,]#third row, all columns

#first 3 columns
mtcars[1:3]

#use the names to pull out columns
mtcars$gear
mtcars[c("gear","mpg")]

sum(mtcars$gear)
iris
iris$Sepal.Length[1:5]
first5<- iris$Sepal.Length[1:5]
first5

max(first5)-min(first5)
max(iris$Sepal.Length)-min(iris$Sepal.Length)

var(first5)
sd(first5)
sqrt(first5)

var(iris$Sepal.Length)

##IQR

IQR(first5)  #range of the middle 50% of data
quantile(first5,0.25) #Q1
quantile(first5,0.75) #Q3

sl<-iris$Sepal.Length
mean(sl-3*sl)


##outliers
lower<- mean(sl)-3*sd(sl)
upper<- mean(sl)+3*sd(sl)

as.numeric(quantile(sl,0.25)-1.4*IQR(sl))
values<-c(first5,3,9)
upper           
lower

values[values>lower & values <upper]
superhero<- (super_hero_powers_super_hero_powers_1_)
View(superhero)

mean(superhero-3*superhero)
first6<- imdb_clean$rating[1:6]
mean(imdb_clean$rating)
median(imdb_clean$rating)
range(imdb_clean$rating)
var(imdb_clean$rating)
sd(imdb_clean$rating)
IQR(imdb_clean$rating)
iqr(first6)





## Conditionals ####
x<-5
x>3
x==3
x==5
x!=3

numbers <- 1:5
numbers < 3
numbers == 3

numbers[1]
numbers[c(1,2)]
numbers [1:2]

numbers[numbers<3]# numbers "where" numbers <3

## pull out only outliers
numbers[numbers<lower]
numbers[numbers>upper]

#combine with I (or)
numbers [numbers < lower | numbers > upper]

#use 7 to get all values in between outlier thresholds
numbers[numbers>= lower & numbers <= upper]

#using 7 with outlier threshold doesn't work
number[numbers < lower & numbers > upper]

mean(imdb_clean$rating)-3*(imdb_clean$rating)
mean(imdb_clean$rating)+3*(imdb_clean$rating)


lower<- mean(imdb_clean$rating)-3*sd(imdb_clean$rating)
upper <- mean(imdb_clean$rating)+3*sd(imdb_clean$rating)

rating <- imdb_clean$rating>lower&imdb_clean$rating<upper
mean(rating)
median(rating)

