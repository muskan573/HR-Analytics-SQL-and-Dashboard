CREATE DATABASE HR_Analytics;
USE HR_Analytics;
Select * from `hr analytics`;

#1.Employee Attrition Analysis:
#a)What is the overall attrition rate in the organization?
SELECT (COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*)) AS AttritionRate
FROM `hr analytics`;

#b)Which departments have the highest and lowest attrition rates?
SELECT Department,
(COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*)) AS AttritionRate
FROM `hr analytics`
GROUP BY Department
ORDER BY AttritionRate DESC;

#c)Is there a correlation between age, salary, and attrition rates?
SELECT Attrition,
AVG(Age) AS AverageAge,
AVG(Salary) AS AverageSalary,
(COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*)) AS AttritionRate
FROM `hr analytics`
GROUP BY Attrition;

#2.Performance and Satisfaction:
#a) How does employee satisfaction relate to performance ratings?
SELECT PerformanceRating,
AVG(SatisfactionScore) AS AverageSatisfactionScore
FROM `hr analytics`
GROUP BY PerformanceRating;

#b) What are the average satisfaction scores for different job roles?
SELECT JobRole,
AVG(SatisfactionScore) AS Avg_Satisfaction
FROM `hr analytics`
GROUP BY JobRole;

#c) Is there a difference in satisfaction scores between genders or ethnicities?
SELECT Gender,
AVG(SatisfactionScore) AS Avg_Satisfaction_Gender
FROM `hr analytics`
GROUP BY Gender;

SELECT Ethnicity,
AVG(SatisfactionScore) AS Avg_Satisfaction_Ethnicity
FROM `hr analytics`
GROUP BY Ethnicity;

#3Training and Development
#a) What is the relationship between training hours and performance ratings?
SELECT PerformanceRating,
AVG(TrainingHours) AS Avg_Training_Hours
FROM `hr analytics`
GROUP BY PerformanceRating;

#b) Do employees who receive more training have lower absenteeism days?
SELECT AVG(AbsenteeismDays) AS Avg_Absenteeism_Low_Training
FROM `hr analytics`
WHERE TrainingHours < (SELECT AVG(TrainingHours) FROM `hr analytics`);

SELECT AVG(AbsenteeismDays) AS Avg_Absenteeism_High_Training
FROM `hr analytics`
WHERE TrainingHours >= (SELECT AVG(TrainingHours) FROM `hr analytics`);

#4. Work-Life Balance
#) How does work-life balance score vary across different departments?
SELECT Department,
AVG(WorkLifeBalanceScore) AS Avg_WorkLifeBalance_Score
FROM `hr analytics`
GROUP BY Department;

#b) Is there a correlation between overtime hours and work-life balance scores?
SELECT AVG(WorkLifeBalanceScore) AS Avg_WorkLifeBalance_With_Overtime
FROM `hr analytics`
WHERE OverTime = 'Yes';

SELECT AVG(WorkLifeBalanceScore) AS Avg_WorkLifeBalance_Without_Overtime
FROM `hr analytics`
WHERE OverTime = 'No';


