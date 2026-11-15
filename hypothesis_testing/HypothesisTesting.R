#load the cleaned dataset
bike <- read.csv("data/cleaned_day.csv")

#check the two weather groups
table(bike$weathersit)

#null hypothesis: the two means are equal
#alternative hypothesis: the two means are different

#set significance level
alpha <- 0.05

#two sample t-test
result <- t.test(cnt ~ weathersit, data = bike)

#show t-test results
print(result)

#check if the result is statistically significant
if (result$p.value < alpha) {
  print("Reject the null hypothesis")
} else {
  print("Fail to reject the null hypothesis")
}
