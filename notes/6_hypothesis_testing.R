



##Compare the mass of male and female human star wars characters?
## null hypothesis: average of male and female star wars characters is the same
## alternative hypothesis: average mass of male and female star wars characters is different
swHumans <- starwars|> filter(species == "Human", mass >0)
males <- swHumans |> filter (sex == "male")
females <- swHumans |> filter (sex == "female")

t.test (males$mass, females$mass, paired = F, alternative = "two sided")

#p value is 0.06
## not significant, failed to reject null hypothesis


## ANOVA ####
iris

anova_results<- aov(Sepal.Width ~ Species, iris)


## Are any groups different from each other?
summary(anova_results)

## Which ones?
TukeyHSD(anova_results)

### Is there a significant difference in the mean petal lengths or petal width by species?
anova_results <- aov(Petal.Width ~ Species, iris)
summary(anova_results)
TukeyHSD(anova_results)


##Starwars
head(starwars)
unique(starwars$species)

##Which 5 speices are the most common?
top3species <- starwars |>
  summarize(.by = species, 
  count = sum(!is.na(species)))|>
  slice_max(count, n = 3)

top3species

starwars_top3species <- starwars |> filter(species %in% top3species$species)

starwars_top3species

## Is there a significant difference in the mass of each of the top 3 species?
a <- aov(height~species, starwars_top3species)
summary(a)
TukeyHSD(a)

## Chi-Squared ####
starwars_clean <- starwars |>
  filter(!is.na(species),
         !is.na(homeworld))

t <-table(starwars$species, starwars$homeworld)
chisq.test(t) # not enough data

mpg
table(mpg$manufacturer, mpg$class)
table(mpg$cyl, mpg$displ)

## How do we get a contingency table of year and dry?
table(mpg$year, mpg$drv)

chisq_result<- chisq.test(t)
chisq_result
chisq.result$p.value
chisq.result$residuals

install.packages("corrplot")
library(corrplot)

corrplot(chisq.result$residuals)


## chi-squared full analysis
heroes <- (heroes_information)
head(heroes)

##clean data
heroes_clean <- heroes |>
  filter(Alignment != "-",
         Gender != "-")

## plot the counts of alignment and gender
ggplot(heroes_clean, aes(x=Gender, y = Alignment)) +
  geom_count()+
  theme_minimal()

## make contigency table
t <- table(heroes_clean$Alignment, heroes_clean$Gender)
t

##chi squared test
chi <- chisq.test(t)
chi$p.value
chi$residuals

corrplot(chi$residuals, is.cor = F)
