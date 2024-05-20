# Load dataset
body_data <- read.csv("data/bodyfat.csv", colClasses = c(
  Density = "numeric",
  Age = "integer",
  Weight = "numeric",
  Height = "numeric",
  Neck = "numeric",
  Chest = "numeric",
  Abdomen = "numeric",
  Hip = "numeric",
  Thigh = "numeric",
  Knee = "numeric",
  Ankle = "numeric",
  Biceps = "numeric",
  Forearm = "numeric",
  Wrist = "numeric",
  BodyFat = "numeric"
))

# Display the structure of the dataset
str(body_data)

# View the first few rows of the dataset
head(body_data)

# View the dataset in a separate viewer window
View(body_data)

# Mean for numeric variables
means <- sapply(body_data[, c("Density", "Age", "Weight", "Height", "Neck", "Chest", "Abdomen", "Hip", "Thigh", "Knee", "Ankle", "Biceps", "Forearm", "Wrist", "BodyFat")], mean)
means

# Median for numeric variables
medians <- sapply(body_data[, c("Density", "Age", "Weight", "Height", "Neck", "Chest", "Abdomen", "Hip", "Thigh", "Knee", "Ankle", "Biceps", "Forearm", "Wrist", "BodyFat")], median)
medians

# Standard deviation for numeric variables
sds <- sapply(body_data[, c("Density", "Age", "Weight", "Height", "Neck", "Chest", "Abdomen", "Hip", "Thigh", "Knee", "Ankle", "Biceps", "Forearm", "Wrist", "BodyFat")], sd)
sds

# Range for numeric variables
ranges <- sapply(body_data[, c("Density", "Age", "Weight", "Height", "Neck", "Chest", "Abdomen", "Hip", "Thigh", "Knee", "Ankle", "Biceps", "Forearm", "Wrist", "BodyFat")], function(x) diff(range(x)))
ranges

# Quartiles for numeric variables
quartiles <- apply(body_data[, c("Density", "Age", "Weight", "Height", "Neck", "Chest", "Abdomen", "Hip", "Thigh", "Knee", "Ankle", "Biceps", "Forearm", "Wrist", "BodyFat")], 2, quantile)
quartiles

# Correlation matrix for numeric variables
correlation_matrix <- cor(body_data[, c("Density", "Age", "Weight", "Height", "Neck", "Chest", "Abdomen", "Hip", "Thigh", "Knee", "Ankle", "Biceps", "Forearm", "Wrist", "BodyFat")])
correlation_matrix

# Scatterplot matrix for numeric variables
pairs(~Density + Age + Weight + Height + Neck + Chest + Abdomen + Hip + Thigh + Knee + Ankle + Biceps + Forearm + Wrist + BodyFat, data = body_data)

# Histogram for a numeric variable (Age)
hist(body_data$Age, main = "Histogram of Age", xlab = "Age")

# Boxplot for a numeric variable (Weight)
boxplot(body_data$Weight, main = "Boxplot of Weight")

# Scatterplot matrix for multiple numeric variables
pairs(~Density + Age + Weight + Height + Neck + Chest + Abdomen + Hip + Thigh + Knee + Ankle + Biceps + Forearm + Wrist + BodyFat, data = body_data)

# Correlation heatmap for numeric variables
library(ggplot2)
# Load the reshape2 package
library(reshape2)
correlation_data <- cor(body_data[, c("Density", "Age", "Weight", "Height", "Neck", "Chest", "Abdomen", "Hip", "Thigh", "Knee", "Ankle", "Biceps", "Forearm", "Wrist", "BodyFat")])
ggplot(data = melt(correlation_data), aes(x = Var1, y = Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradient(low = "blue", high = "red") +
  theme_minimal() +
  labs(title = "Correlation Heatmap")

# Density plots for multiple numeric variables
library(ggplot2)
library(tidyr)
body_data_long <- gather(body_data, key = "Variable", value = "Value", -Density, -Age)
ggplot(data = body_data_long, aes(x = Value, fill = Variable)) +
  geom_density(alpha = 0.5) +
  facet_wrap(~Variable, scales = "free") +
  labs(title = "Density Plots for Numeric Variables")




