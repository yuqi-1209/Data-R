# 加载数据
data <- data.frame(
  Mo = c(0, 0, 0, 0.15, 0.15, 0.15, 0.3, 0.3, 0.3),
  N = c(0.06, 0.24, 0.42, 0.06, 0.24, 0.42, 0.06, 0.24, 0.42),
  Mean = c(0.236, 0.757, 1.186, 0.182, 0.746, 2.046, 0.263, 0.639, 1.527),
  SD = c(0.068, 0.078, 0.095, 0.013, 0.142, 0.567, 0.037, 0.146, 0.544),
  stringsAsFactors = FALSE
)

# 将数据转换为长格式
library(ggplot2)
library(dplyr)
data_long <- data %>%
  pivot_longer(cols = c(Mean, SD), names_to = "Stat", values_to = "Value")

# 绘制柱状图
ggplot(data_long, aes(x = factor(Mo), y = Value, fill = factor(N))) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.7)) +
  facet_wrap(~ Stat, scales = "free") +
  labs(x = "Mo (mg/kg)", y = "Value", fill = "N (mg/kg)") +
  ggtitle("Total Free Amino Acid Content (% DW)") +
  theme_minimal()
