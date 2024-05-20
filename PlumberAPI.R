# Load necessary libraries
library(plumber)

# Load the saved gbm model
loaded_gbm_model <- readRDS("./models/gbm_model.rds")

#* @apiTitle BodyFat Prediction Model API
#* @apiDescription Used to predict BodyFat using gradient boosting.

#* @post /predict_bodyfat
#* @param Density Numeric: Body density
#* @param Age Numeric: Age
#* @param Weight Numeric: Weight
#* @param Height Numeric: Height
#* @param Neck Numeric: Neck circumference
#* @param Chest Numeric: Chest circumference
#* @param Abdomen Numeric: Abdomen circumference
#* @param Hip Numeric: Hip circumference
#* @param Thigh Numeric: Thigh circumference
#* @param Knee Numeric: Knee circumference
#* @param Ankle Numeric: Ankle circumference
#* @param Biceps Numeric: Biceps circumference
#* @param Forearm Numeric: Forearm circumference
#* @param Wrist Numeric: Wrist circumference
#* @serializer unboxedJSON
predict_bodyfat <- function(Density, Age, Weight, Height, Neck, Chest, Abdomen, Hip, Thigh, Knee, Ankle, Biceps, Forearm, Wrist) {
  # Prepare the input data
  new_data <- data.frame(
    Density = as.numeric(Density),
    Age = as.numeric(Age),
    Weight = as.numeric(Weight),
    Height = as.numeric(Height),
    Neck = as.numeric(Neck),
    Chest = as.numeric(Chest),
    Abdomen = as.numeric(Abdomen),
    Hip = as.numeric(Hip),
    Thigh = as.numeric(Thigh),
    Knee = as.numeric(Knee),
    Ankle = as.numeric(Ankle),
    Biceps = as.numeric(Biceps),
    Forearm = as.numeric(Forearm),
    Wrist = as.numeric(Wrist)
  )
  
  # Use the loaded model to make predictions
  prediction <- predict(loaded_gbm_model, newdata = new_data)
  
  # Return the prediction
  return(as.character(prediction))
}
