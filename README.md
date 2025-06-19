# 📊 Statistical Analysis Project 📈

## Overview
This project performs a comprehensive statistical analysis on student exam performance data, exploring various factors that might influence academic performance including test preparation, gender, parental education, and other demographic factors.

## 📋 Dataset
The analysis uses the exams.csv dataset which includes the following variables:
- Math scores
- Reading scores
- Writing scores
- Test preparation course status
- Gender
- Race/ethnicity
- Parental level of education
- Lunch type

## 🔍 Analysis Components

### 1. 🧹 Data Preparation
- Data cleaning and handling missing values
- Creation of average score variable
- Systematic sampling implementation (n=150)

### 2. 📊 Exploratory Data Analysis
- Histograms for score distributions
- Box plots for score comparisons
- Bar plots for categorical variables
- Distribution analysis by test preparation course status

### 3. 📈 Statistical Tests and Analyses

#### 🔄 Normality Tests
- Pearson's Coefficient of Skewness
- Q-Q plots for score distributions

#### 📏 Point Estimation
- Mean and standard deviation calculations for population and sample
- Confidence intervals for:
  - Average scores
  - Proportion of male students
  - Variances and standard deviations

#### 🎯 Hypothesis Testing
1. Test preparation course effect on average scores
2. Math score mean comparison against hypothesized value
3. Gender differences in reading scores
4. Variance comparison between preparation course groups
5. Proportion test for parental education levels

#### 🔗 Correlation Analysis
- Correlation matrix visualization
- Linear regression analysis (writing scores vs. math scores)

#### 🧪 Advanced Statistical Tests
- Chi-square tests (Goodness-of-fit, Independence, Homogeneity)
- One-way ANOVA (race/ethnicity effect on reading scores)
- Two-way ANOVA (gender and test preparation effects)
- Non-parametric tests:
  - Sign test
  - Wilcoxon rank sum test
  - Spearman correlation
  - Runs test

## 📦 Required R Packages
- tidyverse
- janitor
- DataExplorer
- lubridate
- ggplot2
- gridExtra
- moments
- nortest
- car
- MASS
- BSDA
- corrplot

## 🚀 How to Run
1. Ensure all required packages are installed
2. Place the exams.csv file in the project directory
3. Run the R script to perform the analysis

## 📊 Results
The analysis reveals several significant findings:
- Strong evidence for test preparation course effectiveness
- Gender differences in reading scores
- Significant correlations between different types of scores
- Various demographic factors influencing academic performance

## 📝 Notes
- Analysis uses an α level of 0.05 for hypothesis testing
- Systematic sampling is used with a sample size of 150
- Both parametric and non-parametric methods are employed for robust analysis
