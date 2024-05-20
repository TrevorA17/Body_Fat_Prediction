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

# Set seed for reproducibility
set.seed(123)

# Perform bootstrapping for the entire dataset
bootstrap_results <- boot(body_data, statistic = function(data, i) mean(data[i, "BodyFat"]), R = 1000)
bootstrap_results

# Set seed for reproducibility
set.seed(123)

# Perform k-fold cross-validation (example: linear regression)
library(caret)
control <- trainControl(method = "cv", number = 10)
cv_model <- train(BodyFat ~ ., data = body_data, method = "lm", trControl = control)
summary(cv_model)
print(cv_model)

# Load required libraries
library(caret)
library(gbm)
library(randomForest)

# Set seed for reproducibility
set.seed(123)

# Define predictors and response variable
predictors <- c("Density", "Age", "Weight", "Height", "Neck", "Chest", "Abdomen", "Hip", "Thigh", "Knee", "Ankle", "Biceps", "Forearm", "Wrist")
response <- "BodyFat"

# Create training control
train_control <- trainControl(method = "cv", number = 10)

# Train linear regression model (lm)
lm_model <- train(as.formula(paste(response, "~", paste(predictors, collapse = "+"))), 
                  data = body_data, 
                  method = "lm", 
                  trControl = train_control)

# Train gradient boosting model (gbm)
gbm_model <- train(as.formula(paste(response, "~", paste(predictors, collapse = "+"))), 
                   data = body_data, 
                   method = "gbm", 
                   trControl = train_control,
                   verbose = FALSE)

# Train random forest model (rf)
rf_model <- train(as.formula(paste(response, "~", paste(predictors, collapse = "+"))), 
                  data = body_data, 
                  method = "rf", 
                  trControl = train_control)

# Print model summaries
print("Linear Regression Model:")
print(lm_model)
print("Gradient Boosting Model:")
print(gbm_model)
print("Random Forest Model:")
print(rf_model)

# Compare model performances using resamples
resamples_list <- resamples(list(LM = lm_model, GBM = gbm_model, RF = rf_model))
summary(resamples_list)
