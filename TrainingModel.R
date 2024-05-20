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

# Set seed for reproducibility
set.seed(123)

# Split the dataset into training and testing sets (e.g., 70% training, 30% testing)
library(caTools) # You may need to install this package if not already installed
split <- sample.split(body_data$BodyFat, SplitRatio = 0.7)
training_data <- subset(body_data, split == TRUE)
testing_data <- subset(body_data, split == FALSE)

print(dim(training_data))
print(dim(testing_data))
