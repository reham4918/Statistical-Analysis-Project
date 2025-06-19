# 📊 Statistical Analysis Project 📈

## Overview
This study aims to uncover the factors that influence students' exam scores using various statistical methods. The analysis was conducted on data collected from three American high schools, examining the relationships between student performance and various demographic and educational factors.

## 📋 Dataset
The analysis uses the exams.csv dataset (sourced from Kaggle) which includes the following variables:
- Math scores
- Reading scores
- Writing scores
- Test preparation course status
- Gender
- Race/ethnicity
- Parental level of education
- Lunch type

## 🎯 Key Findings

1. *Test Preparation Impact*
   - Significant difference in average scores between students who completed test preparation courses and those who didn't
   - P-value = 0.0004193 indicating strong statistical significance

2. *Gender Differences*
   - Significant differences found in reading scores between male and female students
   - No significant relationship between gender and lunch type categories

3. *Score Distributions*
   - Math Score: Mean = 67, SD = 15
   - Reading Score: Mean = 70, SD = 14
   - Writing Score: Mean = 69, SD = 16

4. *Confidence Intervals (95%)*
   - Population mean of average scores: between 65 and 71
   - Proportion of male students: between 45% and 55%
   - Math scores standard deviation: between 13 and 17

## 🔍 Analysis Components

### 1. 🧹 Data Preparation
- Data cleaning and handling missing values
- Creation of average score variable
- Systematic sampling implementation (n=150 from population of 1000)

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
- Correlation between writing and math scores: r = 0.65

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

## 📝 Notes
- Analysis uses an α level of 0.05 for hypothesis testing
- Systematic sampling is used with a sample size of 150
- Both parametric and non-parametric methods are employed for robust analysis

## 👥 Authors
- Ryham Houari
- Joudi J. G. Besaiso
- Leen Alabudi
- Abrar Al-harazi
