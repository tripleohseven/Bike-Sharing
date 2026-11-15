# MATH 167R Group 8 — Bike Sharing

Daily Capital Bikeshare rentals, 2011–2012, from the [UCI Bike Sharing dataset](https://archive.ics.uci.edu/dataset/275/bike+sharing+dataset).

Research question: is the mean number of daily rentals different on clear days (`weathersit = 1`) than on misty/cloudy days (`weathersit = 2`)? The comparison uses a two-sample t-test at alpha 0.05. That test is a separate part of the project.

## Who does what

| Part | Where |
| --- | --- |
| Data cleaning and descriptive statistics | `R/01_clean_daily_data.R`, `R/02_descriptive_statistics.R`, `cleaning_and_statistics.Rmd` |
| Graphs and pattern write-up | `visuals/` |
| Two-sample t-test | `hypothesis_testing/` |

## Files
```text
bike-sharing-project/
├── README.md
|
├── data/
│   ├── day.csv
│   ├── cleaned_day.csv
│   └── summary_statistics.csv
│
└── R/
    └── cleaning.R
```
