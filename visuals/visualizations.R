
#---------- MATH 167R Group 8 - Data Visualizations Script ----------#

#---------- Dataset ----------#

bike <- read.csv("data/cleaned_day.csv")

#Convert weather conditions into a factor
bike$weathersit <- factor(bike$weathersit, levels = c("Clear", "Mist/Cloudy"))

head(bike)
str(bike)
table(bike$weathersit)


#---------- Graph 1: Histogram ----------#

#Distribution of daily bike rentals
hist(bike$cnt, main = "Distribution of Daily Bike Rentals", xlab = "Number of Daily Rentals", ylab = "Frequency", col = "lightblue", border = "white", breaks = 20)


#---------- Graph 2: Boxplot by Weather Condition ----------#

#Compare daily rentals between clear and misty/cloudy days
boxplot(cnt ~ weathersit, data = bike, main = "Daily Bike Rentals by Weather Condition", xlab = "Weather Condition", ylab = "Number of Daily Rentals", col = c("lightblue", "lightgray"))

#Average rentals for each weather group
mean_rentals <- tapply(bike$cnt, bike$weathersit, mean)

#Red points on boxplots represents the group means
points(1:2, mean_rentals, col = "red", pch = 19)


#---------- Graph 3: Temperature vs Daily Rentals ----------#

#Relationship between temperature and rentals
plot(bike$temp, bike$cnt, main = "Temperature vs Daily Bike Rentals", xlab = "Normalized Temperature", ylab = "Number of Daily Rentals", col = "blue", pch = 19, cex = 0.5)

#Add a linear regression trend line
abline(lm(cnt ~ temp, data = bike), col = "red", lwd = 2)


#---------- Graph 4: Humidity vs Daily Rentals ----------#

#Relationship between humidity and rentals
plot(bike$hum, bike$cnt, main = "Humidity vs Daily Bike Rentals", xlab = "Normalized Humidity", ylab = "Number of Daily Rentals", col = "darkgreen", pch = 19, cex = 0.5)
#linear regression trend line
abline(lm(cnt ~ hum, data = bike), col = "red", lwd = 2)
