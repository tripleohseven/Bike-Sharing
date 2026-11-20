# MATH 167R – Bike Sharing Project

## Overview

This project uses the Bike Sharing Dataset from the UCI Machine Learning Repository. We are comparing average daily bike rentals between clear-weather days and misty/cloudy days using descriptive statistics, visualizations, and a Welch two-sample t-test.

## Group Members

- Stephani Marie Soriano – Data Cleaning and Descriptive Statistics
- Anson Fong – Hypothesis Testing
- Nathan Montero – Data Visualization

## Project Structure

```
Bike-Sharing/
├── README.md
├── data/
│   ├── day.csv
│   ├── cleaned_day.csv
│   └── summary_statistics.csv
├── R/
│   ├── cleaning.R
│   └── HypothesisTesting.R
├── visuals/
│   └── visualizations.R
└── reports/
    └── HypothesisReport.md
```

## Running the Code

Set the working directory to the main `Bike-Sharing` folder.

Run the scripts in this order:

1. `R/cleaning.R`
2. `visuals/visualizations.R`
3. `R/HypothesisTesting.R`

## Dataset Source

UCI Bike Sharing Dataset (2011–2012)

https://archive.ics.uci.edu/dataset/275/bike+sharing+dataset