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



