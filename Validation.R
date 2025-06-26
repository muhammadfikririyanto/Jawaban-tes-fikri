
# Load data
credit <- read.csv("data/credit_scoring.csv")

# Drop leakage
credit_scoring$leak_col_good <- NULL
credit_scoring$leak_col_subtle <- NULL

# Build logistic regression model
model <- glm(default ~ ., data = credit_scoring, family = binomial())

# Hosmer-Lemeshow test
hltest_result <- hltest(model, g = 10)
print(hltest_result)

# Predict probabilities
credit_scoring$predicted <- predict(model, type = "response")

# Create calibration plot
credit_scoring$bucket <- cut(credit_scoring$predicted, breaks = quantile(credit_scoring$predicted, probs = seq(0,1,0.1)), include.lowest = TRUE)
calibration <- aggregate(cbind(default, predicted) ~ bucket, data = credit_scoring, FUN = mean)

ggplot(calibration, aes(x = predicted, y = default)) +
  geom_point() +
  geom_line() +
  labs(title = "Calibration Curve", x = "Predicted Probability", y = "Observed Default Rate") +
  theme_minimal()

ggsave("calibration_curve.png")

# Find cutoff score to keep expected default ≤ 5%
sorted <- credit_scoring[order(-credit_scoring$predicted), ]
cumsum_defaults <- cumsum(sorted$default)
cutoff_index <- which(cumsum_defaults / seq_along(cumsum_defaults) > 0.05)[1]
cutoff_score <- sorted$predicted[cutoff_index]
cat("Suggested cut-off score:", cutoff_score, "\n")