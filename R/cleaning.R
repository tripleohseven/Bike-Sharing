# Data Cleaning and Descriptive Statistics - Stephani Soriano
#
# This script documents the initial data cleaning and descriptive
# statistics used for the project.
#
# The resulting cleaned dataset is stored at: data/cleaned_day.csv
#
# The resulting descriptive statistics are stored at: data/summary_statistics.csv
#
# Please should use cleaned_day.csv for subsequent analyses


# Load original dataset
bike <- read.csv("data/day.csv")

head(bike)
str(bike)
dim(bike)

# missing col. check
colSums(is.na(bike))

# duplicates check
sum(duplicated(bike))

# convert date to Date format
bike$dteday <- as.Date(bike$dteday)

# convert categorical variables to factors
bike$season <- factor(bike$season)
bike$yr <- factor(bike$yr)
bike$mnth <- factor(bike$mnth)
bike$holiday <- factor(bike$holiday)
bike$weekday <- factor(bike$weekday)
bike$workingday <- factor(bike$workingday)

# give weather conditions readable labels
bike$weathersit <- factor(
  bike$weathersit,
  levels = c(1, 2, 3, 4),
  labels = c(
    "Clear",
    "Mist/Cloudy",
    "Light Snow/Rain",
    "Heavy Rain/Snow"
  )
)

# keep research relevant weather groups
weather_data <- bike[
  bike$weathersit %in% c("Clear", "Mist/Cloudy"),
]

# remove unused factor levels
weather_data$weathersit <- droplevels(weather_data$weathersit)


#descriptive statistics: 

# num of observations in each weather group
n_by_weather <- table(weather_data$weathersit)

# mean daily rentals
mean_by_weather <- tapply(
  weather_data$cnt,
  weather_data$weathersit,
  mean
)

# median daily rentals
median_by_weather <- tapply(
  weather_data$cnt,
  weather_data$weathersit,
  median
)

# standard deviation of daily rentals
sd_by_weather <- tapply(
  weather_data$cnt,
  weather_data$weathersit,
  sd
)

# min daily rentals
min_by_weather <- tapply(
  weather_data$cnt,
  weather_data$weathersit,
  min
)

# max daily rentals
max_by_weather <- tapply(
  weather_data$cnt,
  weather_data$weathersit,
  max
)


# combine into one data frame
summary_statistics <- data.frame(
  Weather = names(mean_by_weather),
  N = as.numeric(n_by_weather),
  Mean = as.numeric(mean_by_weather),
  Median = as.numeric(median_by_weather),
  Standard_Deviation = as.numeric(sd_by_weather),
  Minimum = as.numeric(min_by_weather),
  Maximum = as.numeric(max_by_weather)
)

print(summary_statistics)


#display

cat("\nOverall Statistics for Clear and Mist/Cloudy Days\n")
cat("Number of observations:", nrow(weather_data), "\n")
cat("Mean rentals:", mean(weather_data$cnt), "\n")
cat("Median rentals:", median(weather_data$cnt), "\n")
cat("Standard deviation:", sd(weather_data$cnt), "\n")
cat("Minimum rentals:", min(weather_data$cnt), "\n")
cat("Maximum rentals:", max(weather_data$cnt), "\n")

# output files

# save cleaned dataset
write.csv(
  weather_data,
  "data/cleaned_day.csv",
  row.names = FALSE
)

# save summary statistics
write.csv(
  summary_statistics,
  "data/summary_statistics.csv",
  row.names = FALSE
)