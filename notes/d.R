library(ggplot2)

ggplot(iris, aes(x = Sepal.Length,  y = Sepal.Width, color = Species)) +
  geom_point() +
  scale_color_manual(values = c("red", "purple", "pink"),
                     name = "Iris Species") +
  coord_cartesian(xlim = c(0.8, NA), ylim = c(0, 4.5)) +
  theme_minimal() +
  theme(axis.text.y = element_text(color = "red"))
  

## gem_text and geom_label

ggplot(iris, aes (x = Sepal.Length, y = Sepal.Width)) +
  geom_point() +
  geom_text (aes(label = Species))

install.packages("plotly")
library(plotly)
ggplotly()
