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

# Check for missing values in the dataset
missing_values <- sum(is.na(body_data))

# Output the number of missing values
if (missing_values > 0) {
  print(paste("There are", missing_values, "missing values in the dataset."))
} else {
  print("There are no missing values in the dataset.")
}
