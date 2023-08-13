##install requied packages
install.packages("ggplot2")
install.packages(c("usethis", "credentials"))
## load requied packages
library(ggplot2)

## mpg dataset
ggplot()
str(mpg)
?mpg

ggplot (data = mpg, aes(x=hwy, y = cty)) +
  geom_point() +
  labs (x= "highway mpg", y ="city mpg", title ="car city vs highway milage")

## histogram
ggplot(data=mpg,aes(x=hwy))+geom_histogram()
labs (x= "highway mpg", y ="city mpg", title ="car city vs highway milage")

#We can set the number of bars with "bins"
ggplot(data = iris, aes(x=Sepal.Length))+ geom_histogram(bin = 30)

#We can set the size of bars with 'binwidth'

ggplot(data = iris, aes(x=Sepal.Length))+ geom_histogram(binwidth = 0.25) + labs(title= "Frequency")


## Density Plots 
ggplot(data = iris, aes(x=Sepal.Length))+ geom_density() +labs(y= "Density", title="Frequency of Iris Sepal Lengths")

##Boxplot
ggplot(data = iris, aes(x=Sepal.Length))+ geom_boxplot() + 
  labs(y="Density", x= "Sepal Length", 
 title= "Frequency of Iris Sepal Length")

ggplot(data = iris, aes(y=Sepal.Length))+ geom_boxplot() + 
  labs(y="Density", x= "Sepal Length",  title= "Frequency of Iris Sepal Length")




ggplot(data =iris, aes(x=Sepal.Length, y=Species)) + geom_boxplot()
    
## Violin Plot
ggplot(data =iris, aes(y=Sepal.Length, x=Species)) + geom_violin(color="violet", fill= "blue3")+ geom_boxplot(width=0.2)

#Bar plot

ggplot(data=iris, aes(y=Sepal.Length, x=Species, fill=Species))+geom_bar(stat="summary",fun="mean")

##Scatter Plot
ggplot(data = iris, aes(y=Sepal.Length, x=Species))+ geom_jitter(width=0.25)

##Line Plot
ggplot(data = iris, aes(x=Sepal.Length, y=Sepal.Width))+ geom_line(stat="summary",fun="mean") +
  geom_point()+ geom_smooth(se=F) + theme_classic()

##Color scales
ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width))+ 
  geom_point(aes(color=Species))+
  scale_color_manual(values = c("violet","lightpink","red"))

##factors

mpg4year<-as.factor(mpg$year)

iris$Species<-factor(iris$Species, levels = c("versicolor", "setosa", "virginica"))
