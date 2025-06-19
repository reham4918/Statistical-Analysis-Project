# Install and load necessary packages
install.packages("tidyverse")
install.packages("janitor")
install.packages("DataExplorer")
install.packages("lubridate")
install.packages("ggplot2")
install.packages("gridExtra")
install.packages("moments")
install.packages("nortest")
install.packages("car")
install.packages("MASS")
install.packages("sampling")
install.packages("BSDA")
library(tidyverse)
library(janitor)
library(DataExplorer)
library(lubridate)
library(ggplot2)
library(gridExtra)
library(moments)
library(nortest)
library(car)
library(MASS)
library(corrplot)
library("BSDA")

# Data Collection and Cleaning
exams <- read_csv("exams.csv") 
exams <- clean_names(exams) 
View(exams)

# Remove NA values
exams <- drop_na(exams)



#add new column(avg_score) for the math and writing and reading scores
exams$avg_score = (exams$math_score + exams$reading_score+ exams$writing_score) / 3
head(exams)

View(exams)

#systematic sampling 

SAMPLE_SIZE = 150
alpha = 0.05
systematic_sampling <- function(data, n) {
  
  total_obs <- nrow(data)  # Total number of observations
  
  sampling_interval <- ceiling(total_obs / n)  # Calculate the sampling interval
  
  start_point <- sample(1:sampling_interval, 1)  # Generate a random starting point
  
  # Generate indices while ensuring they stay within the bounds of the data
  sample_indices <- (start_point + sampling_interval * (0:(n-1))) %% total_obs
  sample_indices[sample_indices == 0] <- total_obs  # Replace 0 with total_obs to handle modulo wrapping correctly
  
  sample_data <- data[sample_indices, ]  # Select the samples
  
  return(sample_data)
}

set.seed(2004)
examsSample = systematic_sampling(exams, SAMPLE_SIZE)
View(examsSample)


#sample plots
hist(examsSample$avg_score, col='#7ED7C1', main='avg_score of the sample', xlab='avg_score', ylab = 'count')
hist(examsSample$math_score, col='#FF8080', main='math score of the sample', xlab='math score', ylab = 'count')
hist(examsSample$reading_score, col='#8EACCD', main='reading score of the sample', xlab='reading score', ylab = 'count')
hist(examsSample$writing_score, col='#79AC78', main='writing score of the sample', xlab='writing score', ylab = 'count')

hist(examsSample$avg_score[examsSample$test_preparation_course=="completed"], main='completed test preparation cource', xlab = 'avg_score', ylab = 'count', col='#BEADFA')

hist(examsSample$avg_score[examsSample$test_preparation_course=="none"], main='did not take the test preparation cource', xlab = 'avg_score', ylab = 'count', col='#756AB6')

hist(examsSample$avg_score[examsSample$math_score>80], main='math_score>80', xlab = 'avg_score', ylab = 'count', col='#7469B6')

clyinders1 = table(examsSample$test_preparation_course)
barplot(clyinders1, col=c("#BEADFA", "#756AB6"),xlab='test preparation cource of the sample', ylab = 'count')

clyinders2 = table(examsSample$gender)
barplot(clyinders2, col=c("#E1ACAC", "#BED7DC"),xlab='gender of the sample', ylab = 'count')

clyinders3 = table(examsSample$lunch)
barplot(clyinders3, col=c('#C5EBAA',"#A5DD9B"),xlab='lunch price of the sample', ylab = 'count')

clyinders4 = table(examsSample$parental_level_of_education)
barplot(clyinders4, col=c("#FFCCCB", "#FFDAB9", "#FFE4E1", "#B0E0E6", "#98FB98", "#DDA0DD"),xlab='parental_level_of_education(sample)', ylab = 'count')

clyinders5 = table(examsSample$race_ethnicity)
barplot(clyinders5, col=c("#FFB6C1", "#ADD8E6", "#FFDAB9", "#98FB98", "#FFA07A")
,xlab='race_ethnicity', ylab = 'count')

boxplot(examsSample$avg_score, col='#7ED7C1', xlab='avg score (sample)')
boxplot(examsSample$math_score, col='#FF8080', xlab='math score (sample)')
boxplot(examsSample$reading_score, col='#8EACCD', xlab='reading score (sample)')
boxplot(examsSample$writing_score, col='#79AC78', xlab='writing score (sample)')

#population plot 
hist(exams$avg_score, col='#7ED7C1', main='avg_score of the populationn', xlab='avg_score', ylab = 'count')
hist(exams$math_score, col='#FF8080', main='math score of the populationn', xlab='math score', ylab = 'count')
hist(exams$reading_score, col='#8EACCD', main='reading score of the populationn', xlab='reading score', ylab = 'count')
hist(exams$writing_score, col='#79AC78', main='writing score of the populationn', xlab='writing score', ylab = 'count')

hist(exams$avg_score[exams$test_preparation_course=="completed"], main='completed test preparation cource (pop)', xlab = 'avg_score', ylab = 'count', col='#BEADFA')

hist(exams$avg_score[exams$test_preparation_course=="none"], main='does not take the test preparation cource(pop)', xlab = 'avg_score', ylab = 'count', col='#756AB6')

clyinders6 = table(exams$test_preparation_course)
barplot(clyinders6, col=c("#BEADFA", "#756AB6"),xlab='test preparation cource of the populaton', ylab = 'count')

clyinders7 = table(exams$gender)
barplot(clyinders7, col=c("#8E7AB5", "#BED7DC"),xlab='gender of the populaton', ylab = 'count')

clyinders8 = table(exams$lunch)
barplot(clyinders8, col=c('#C5EBAA',"#A5DD9B"),xlab='lunch price of the populaton', ylab = 'count')

clyinders9 = table(exams$parental_level_of_education)
barplot(clyinders9, col=c("#FFCCCB", "#FFDAB9", "#FFE4E1", "#B0E0E6", "#98FB98", "#DDA0DD"),xlab='parental_level_of_education_of_the_populaton', ylab = 'count')

clyinders10 = table(exams$race_ethnicity)
barplot(clyinders10, col=c("#FFB6C1", "#ADD8E6", "#FFDAB9", "#98FB98", "#FFA07A"),xlab='race_ethnicity_of_the_populaton', ylab = 'count')

boxplot(exams$avg_score, col='#7ED7C1', xlab='avg score (population)')
boxplot(exams$math_score, col='#FF8080', xlab='math score (population)')
boxplot(exams$reading_score, col='#8EACCD', xlab='reading score (population)')
boxplot(exams$writing_score, col='#79AC78', xlab='writing score (population)')
#normality tests
#Pearson’s Coefficient (PC) of Skewness
#avg_score
qqnorm(examsSample$avg_score,col='pink', main='avg_score normal probability plot')
3*(mean(examsSample$avg_score) - median(examsSample$avg_score)) / sd(examsSample$avg_score)
#math_score
qqnorm(examsSample$math_score,col='blue', main='math_score normal probability plot')
3*(mean(examsSample$math_score) - median(examsSample$math_score)) / sd(examsSample$math_score)
#reading_score
qqnorm(examsSample$reading_score,col='purple', main='reading_score normal probability plot')
3*(mean(examsSample$reading_score) - median(examsSample$reading_score)) / sd(examsSample$reading_score)
#wirting_score
qqnorm(examsSample$writing_score,col='green', main='writing_score normal probability plot')
3*(mean(examsSample$writing_score) - median(examsSample$writing_score)) / sd(examsSample$writing_score)


# Point estimation

pop_sd = function(data){
  return(sqrt(var(data) * ((length(data) - 1) / length(data))))
}

cat("mean population avg_score:", mean(exams$avg_score), ", mean sample avg_score:",mean(examsSample$avg_score))
cat("std population avg_score:", pop_sd(exams$avg_score), ", std sample avg_score:",sd(examsSample$avg_score))

cat("mean population math_score:", mean(exams$math_score), ", mean sample math_score:",mean(examsSample$math_score))
cat("std population math_score:", pop_sd(exams$math_score), ", std sample math_score:",sd(examsSample$math_score))

cat("mean population reading_score:", mean(exams$reading_score), ", mean sample reading_score:",mean(examsSample$reading_score))
cat("std population reading_score:", pop_sd(exams$reading_score), ", std sample reading_score:",sd(examsSample$reading_score))

cat("mean population writing_score:", mean(exams$writing_score), ", mean sample writing_score:",mean(examsSample$writing_score))
cat("std population writing_score:", pop_sd(exams$writing_score), ", std sample writing_score:",sd(examsSample$writing_score))

#congidence intervals
# avg_score confidence interval
avg_score_sample_mean = mean(examsSample$avg_score)
avg_score_sample_sd = sd(examsSample$avg_score)
avg_score_sample_se = avg_score_sample_sd / sqrt(SAMPLE_SIZE)

t_score = qt(p=1-alpha/2, df=SAMPLE_SIZE-1,)
margin_error <- t_score * avg_score_sample_se
lower_bound <- avg_score_sample_mean - margin_error
upper_bound <- avg_score_sample_mean + margin_error
cat('cl=',1-alpha,lower_bound,'< avg_score < ', upper_bound)
mean(exams$avg_score)

# Confidence Intervals for Proportions of Male Students

num_males = sum(examsSample$gender == "male")
p_hat = num_males / SAMPLE_SIZE
q_hat = 1 - p_hat
SE = sqrt(p_hat * q_hat / SAMPLE_SIZE)
z_score = qnorm(1 - alpha / 2)
moe = z_score * SE
lower_bound = p_hat - moe
upper_bound = p_hat + moe
cat('cl =', 1 - alpha, lower_bound, '< proportion of male students <', upper_bound)

# Confidence Intervals for Variances and Standard Deviations
df = SAMPLE_SIZE - 1
chi_right = qchisq(1-alpha/2,df)
chi_left = qchisq(alpha/2,df)
cat('cl=',1-alpha,sqrt(df/chi_right) * sd(exams$math_score),' < sigma < ',sqrt(df/chi_left) * sd(exams$math_score))

# Hypotheses tests

# H_0: none__preparation_test and take__preparation_test student have the same avarage score
# H_a: none__preparation_test and take__preparation_test student have different avarage score
none__preparation_test = systematic_sampling(exams[exams$test_preparation_course == "none",], SAMPLE_SIZE)
take__preparation_test= systematic_sampling(exams[exams$test_preparation_course == "completed",], SAMPLE_SIZE)
t.test(none__preparation_test$avg_score, take__preparation_test$avg_score)
#p-value = 0.0004193 - reject
#The p-value is extremely small, indicating strong evidence against the null hypothesis.
#p-value = 4.422e-07

#We assume the avg math score is 60 lets test that 
#with alpha=0.05
#H0: the mean score of math scores equals 60
#Ha: the mean score of math scores is less than 60
t.test(examsSample$math_score, mu = 60, alternative = 'less')
#p-value = 1 fail to reject 

#Third test: with alpha=0.05
#H0: male and female students have the same reading score 
#Ha: male and female students have different reading scores
female_sample = systematic_sampling(exams[exams$gender == 'female',], SAMPLE_SIZE)
male_sample = systematic_sampling(exams[exams$gender == "male",], SAMPLE_SIZE)
t.test(female_sample$reading_score, male_sample$reading_score)
#p-value = 0.000158 reject the null Hypothesis 

#Fourth test: with alpha=0.05
#H0: the standard deviations of avg scores of the students who take the test preparation course 
#equal to the avg score of the students haven't take it
#Ha: #H0: the standard deviations of avg scores of the students who take the test preparation course 
#not equal to the avg score of the students haven't take it
none__preparation_test = systematic_sampling(exams[exams$test_preparation_course == 'none',], SAMPLE_SIZE)
take__preparation_test = systematic_sampling(exams[exams$test_preparation_course == "completed",], SAMPLE_SIZE)
var.test(none__preparation_test$avg_score, take__preparation_test$avg_score)
#p-value = 0.2895 fail to reject the null hypothesis

#Fifth test: with alpha=0.05
#H0: the proportion of  parental bachelor's degree is equal to 0.5.
#Ha: the proportion of  parentel bachelor's degree is not equal to 0.5
# Count the number of parents with a bachelor's degree
bachelors_degree = sum(examsSample$parental_level_of_education == "bachelor's degree")
total_degrees = length(examsSample$parental_level_of_education)
prop.test(x = bachelors_degree, n = total_degrees, p = 0.5)
#p-value < 2.2e-16 reject the null hypothesis

cot_v <- unlist(lapply(exams, is.numeric), use.names = FALSE)  
corrplot(cor(exams[,cot_v]),method = "circle", type = "upper", order = "AOE")

#first model
#writing_score and math scores
cor(examsSample$writing_score,examsSample$math_score)

model = lm(examsSample$writing_score~examsSample$math_score)


cor(examsSample$writing_score,examsSample$math_score)
a <- examsSample$writing_score
x <- examsSample$math_score
model = lm(a~x)
#This makes predictions for writing_score based on given math_score
predict(model, data.frame(x=c(80, 90, 60)))

plot(examsSample$writing_score, examsSample$math_score, main = "Linear Regression", xlab = "x", ylab = "y")
abline(model, col = "red")

plot(model, which = 1)  # Residuals vs. Fitted values plot

#chi square tests
# Godness-of-fit
#observed
table(examsSample$lunch)
r = table(examsSample$lunch)[[1]]
s = table(examsSample$lunch)[[2]]
o = c(r,s)
#expected
p = c(0.5,0.5)
#H0: the percentages in our data match the expected values.
#Ha: the percentages don’t match the expected values.
result = chisq.test(o,p=p)
result
#p-value = 0.0003274 reject the null
result$expected
result$observed
#The difference between expected and observed is as plotted.
# Create a first line
plot(result$expected, type = "b", frame = FALSE, pch = 19, 
     col = "#804674", xlab = "lunch", ylab = "count", ylim = c(0,100), xaxt = "n",)
axis(1,                         # Define x-axis manually
     at = 1:2,
     labels = c('reduces_free_lunch', 'standard_lunch'))
# Add a second line
lines(result$observed, pch = 18, col = "#51829B", type = "b", lty = 2)
# Add a legend to the plot
legend("right", legend=c("expected", "observed"),
       col=c("#804674", "#51829B"), lty = 1:2, cex=0.8)
#independence test
#H0: The categorical variables gender and lunch are independent.
#Ha: The categorical variables are dependent.
table(examsSample$gender, examsSample$lunch)
chisq.test(table(examsSample$gender, examsSample$lunch))
#p-value = 0.4332>0.05 fail to reject


# homogeneity test
#H0: The male and female are homogeneous when it comes to the categories of the lunch variable.
#Ha: There is a difference when it comes to the categories of the variable lunch between male and female.
sample1 = systematic_sampling(exams[exams$gender == "male", ], SAMPLE_SIZE)
sample2 = systematic_sampling(exams[exams$gender == "female", ], SAMPLE_SIZE)
sample3 = rbind(sample1, sample2)
table(sample3$gender, sample3$lunch)
chisq.test(table(sample3$gender, sample3$lunch))
#p-value = 0.5337 fail to reject the null hypothesis

#one way ANOVA
#H0: The reading score mean is the same for all group categories.
#Ha: The reading score mean is the different for at least one group category.
#unique(exams$race_ethnicity)
examsSample$race_ethnicity = ordered(examsSample$race_ethnicity, levels = c("group A", "group B", "group C","group E", "group D"))
anova_t1 = aov(reading_score~race_ethnicity, data=examsSample)
summary(anova_t1)
#The p-value =  0.0755,fail to reject the null hypothesis
#perform Scheffe's test
ScheffeTest(anova_t1)

##two-way
#Three hypotheses:
#H01: There is no difference between the means of Reading score for gender categories.
#Ha1: There is a difference between the means of Reading score for gender categories.

#H02: There is no difference between the means of Reading score for test preparation course categories.
#Ha2: There is a difference between the means of Reading score for test preparation course categories.

#H03: There is no interaction affect between the gender and the test preparation course 
#categories on the Reading score means.
#Ha3: There is an interaction affect between the gender and the test preparation course categories on the Reading score means

anova_t2 = aov(reading_score~gender*test_preparation_course, data=examsSample)
summary(anova_t2)
# first & second hypothesis we have significant evidence to reject the null hypothesis
#the third hypothesis-> p-values was not significant enough to reject the null hypotheses

# non-parametric tests

#H0: The median of math_score equals 90
#Ha: The median of math_score is less than 90
#test 
#Sign test
s2 = systematic_sampling(exams, 20)
SIGN.test(s2$math_score ,md=90, alternative = 'less')
#p-value is too small reject the null hypothesis 


#Wilcox rank sum test.
#H0: The median of math_score for students who took or didn't take the test preparation course is the same.
#Ha: The median of math_score for tudents who took or didn't take the test preparation course is different.

wilcox.test(s2$math_score[s2$test_preparation_course == "completed"],s2$math_score[s2$test_preparation_course == "none"])
#fail to reject ,p-value = 0.3219
#Spearman correlation 
#H0: There is no correlation between math_score and reading_score
#Ha: There is a correlation between math_score and reading_score
cor.test(s2$math_score, s2$reading_score , method = "spearman", exact = FALSE)
# reject the null hypothesis ,p-value = 5.467e-11

# runs test
#H0: The sequence is random.
#Ha: The sequence is not random.
runs_test_sample = exams$math_score[1:90] %%2
runs_test_sample
runs.test(runs_test_sample)
#fail to reject the null hypothesis 

