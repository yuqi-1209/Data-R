# script.R
# Load required packages
if (!require(ggplot2)) install.packages("ggplot2")
if (!require(dplyr)) install.packages("dplyr")

# Create the data
data <- data.frame(
  Indicator = rep("N accumulation (mg)", 9),
  Treatment1 = c("Mo 0.00 mg/kg", "Mo 0.00 mg/kg", "Mo 0.00 mg/kg",
                 "Mo 0.15 mg/kg", "Mo 0.15 mg/kg", "Mo 0.15 mg/kg",
                 "Mo 0.30 mg/kg", "Mo 0.30 mg/kg", "Mo 0.30 mg/kg"),
  Treatment2 = c("N0.06", "N0.24", "N0.42", "N0.06", "N0.24", "N0.42", 
                 "N0.06", "N0.24", "N0.42"),
  Mean = c(159.46149, 384.41425, 586.43785, 115.61516, 482.21422, 679.52815,
           129.15355, 486.20496, 797.59174),
  SD = c(52.85056, 23.37657, 31.96027, 10.96387, 50.5475, 60.0271,
         14.20665, 27.96296, 57.28248),
  Variance = c("f", "e", "c", "f", "d", "b", "f", "d", "a")
)

# Create combined treatment labels
data <- data %>% mutate(Combined_Treatment = paste(Treatment1, "+", Treatment2))

# Plot
library(ggplot2)
library(dplyr)

plot <- ggplot(data, aes(x = Combined_Treatment, y = Mean, fill = Treatment1)) +
  geom_bar(stat = "identity", position = position_dodge(), width = 0.7) +
  geom_errorbar(aes(ymin = Mean - SD, ymax = Mean + SD), 
                width = 0.2, position = position_dodge(0.7)) +
  labs(title = "Nitrogen Accumulation under Different Treatments",
       x = "Treatment Combinations",
       y = "N Accumulation (mg)",
       fill = "Mo Treatment") +
  scale_fill_brewer(palette = "Set2") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        plot.title = element_text(hjust = 0.5, face = "bold"))

# Save the plot
ggsave("N_accumulation_plot.png", plot, width = 8, height = 6, dpi = 300)

print("Plot saved as 'N_accumulation_plot.png'")
