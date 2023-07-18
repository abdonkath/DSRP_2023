# Load the required packages
library(tidyverse)
library(tidymodels)
library(ggplot2)

# Step 1: Collect Data

# Step 2: Clean and process data
# Filter data for 'Action' and 'Drama' genres
imdb<-(imdb_clean[1:100,])
View(imdb)
crime_drama_data <- filter(imdb, genre %in% c("Crime", "Drama"))

# Step 3: Visualize Data using Linear Regression Plot
ggplot(crime_drama_data, aes(x = genre, y = rating)) +
  geom_jitter(width = 0.2) +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(x = "genre", y = "rating") +
  theme_minimal()

#Step 4 Perform feature selection
m_fit <- linear_reg() |>
  set_engine ("lm") |>
  set_mode ("regression") |>
  fit (rating ~ genre,
       data = imdb)
m_fit|
  
  # Step 5: Separate data into training and testing sets
  set.seed(123)  # Set a seed for reproducibility
data_split <- initial_split(crime_drama_data, prop = 0.7)  # Split the data into 70% training and 30% testing

train_data <- training(data_split)  # Training data
test_data <- testing(data_split)  # Testing data


# Step 6: Visualize Model Performance (Linear regression) ####
ggplot(reg_results, aes(x = rating, y = lm_pred)) +
  geom_point() +
  geom_abline(intercept = 0, slope = 1, color = "red", linetype = "dashed") +
  labs(x = "Actual Rating", y = "Predicted Rating") +
  theme_minimal()


# Step 7: Evaluate the model performance
library(yardstick)
reg_results <-test_data
reg_results$lm_pred <- predict(lm_fit, test_data)$.pred
yardstick::mae(reg_results, rating, lm_pred)

yardstick::rmse(reg_results, rating, lm_pred)

# Step 8: Perform PCA
# Update the dataset
train_data$release_year <- NULL  # Remove the release_year variable
train_data$runtime <- as.numeric(train_data_updated$runtime)  # Convert runtime to numeric
numeric_cols <- sapply(train_data, is.numeric)  # Identify numeric columns
pcas <- prcomp(train_data[, numeric_cols], scale. = TRUE)  # Perform PCA on numeric columns

# Get the proportion of variance explained by each PC
variance_prop <- pcas$sdev^2 / sum(pcas$sdev^2)

# Print the proportion of variance explained by each PC
variance_prop

# Step 9: Visualize PCA Plot
pca_vals <- as.data.frame(pcas$x[, 1:2])  # Select the first two principal components (PC1 and PC2)

# Match the number of rows between pca_vals and crime_drama_data
pca_vals <- pca_vals[1:nrow(crime_drama_data), ]
pca_vals$rating <- crime_drama_data$rating

ggplot(pca_vals, aes(PC1, PC2, color = rating)) +
  geom_point() +
  labs(x = "PC1", y = "PC2", color = "Rating") +
  theme_minimal()


