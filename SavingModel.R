# Create a directory named "models" if it doesn't exist
if (!file.exists("./models")) {
  dir.create("./models")
}

# Saving the gbm model
saveRDS(gbm_model, file = "./models/gbm_model.rds")

# Load the saved gbm model
loaded_gbm_model <- readRDS("./models/gbm_model.rds")

# Prepare new data for prediction
new_data <- data.frame(
  Density = 1.0708,
  Age = 23,
  Weight = 154.25,
  Height = 67.75,
  Neck = 36.2,
  Chest = 93.1,
  Abdomen = 85.2,
  Hip = 94.5,
  Thigh = 59,
  Knee = 37.3,
  Ankle = 21.9,
  Biceps = 32,
  Forearm = 27.4,
  Wrist = 17.1
)

# Use the loaded model to make predictions for new data
predictions_loaded_model <- predict(loaded_gbm_model, newdata = new_data)

# Print predictions
print(predictions_loaded_model)
