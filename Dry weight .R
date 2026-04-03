# 安装和加载ggplot2包（如果尚未安装）
# install.packages("ggplot2")
library(ggplot2)

# 创建数据框
data <- data.frame(
  Mo = c(0.00, 0.00, 0.00, 0.15, 0.15, 0.15, 0.30, 0.30, 0.30),
  N = c(0.06, 0.24, 0.42, 0.06, 0.24, 0.42, 0.06, 0.24, 0.42),
  Mean = c(11.46, 14.88, 16.89, 12.12, 16.67, 19.77, 11.27, 16.71, 21.82),
  stringsAsFactors = FALSE
)

# 创建组合变量用于分组
data$Group <- paste("Mo", data$Mo, "mg/kg", "N", data$N, sep = " ")

# 绘制柱状图
ggplot(data, aes(x = Group, y = Mean, fill = Group)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Dry Weight (g) by Treatment",
       x = "Treatment",
       y = "Mean Dry Weight (g)",
       fill = "Treatment") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_fill_brewer(palette = "Paired")  # 使用颜色方案
