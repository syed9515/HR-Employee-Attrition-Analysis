CREATE DATABASE hr_analytics;

USE hr_analytics;

-- Section 1  Company KPIs

-- Total Employees
SELECT COUNT(*)  AS Total_Employees
FROM employees;

-- Preview the Data
SELECT * FROM employees
LIMIT  10 ;

-- Employees Who Left
SELECT COUNT(*) AS Employees_Left 
FROM employees
WHERE Attrition = 'YES';


-- Employees Who Stayed
SELECT COUNT(*) AS Employees_Stayed
FROM employees
WHERE Attrition = 'NO';

-- Attrition Rate
SELECT ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END )*100.0/COUNT(*),2) 
AS Attrition_Rate FROM employees;


-- Section 2 Workforce Analysis

-- Average Employee Age

SELECT ROUND(AVG(Age),1) AS Average_Age
FROM employees;

-- Average Monthly Salary

SELECT ROUND(AVG(Monthly_Income),2) AS Average_Salary
FROM employees;

-- Employees by Gender

SELECT Gender,
COUNT(*) AS Employees
FROM employees
GROUP BY Gender;

-- Employees by Department

SELECT Department,
COUNT(*) AS Employees
FROM employees
GROUP BY Department
ORDER BY Employees DESC;

-- Employees by Job Role

SELECT Job_Role,
COUNT(*) AS Employees
FROM employees
GROUP BY Job_Role
ORDER BY Employees DESC;


-- Section 3 Attrition Analysis

-- Attrition by Department

SELECT Department,
COUNT(*) AS Employees_Left
FROM employees
WHERE Attrition='Yes'
GROUP BY Department
ORDER BY Employees_Left DESC;

-- Attrition by Job Role

SELECT Job_Role,
COUNT(*) AS Employees_Left
FROM employees
WHERE Attrition='Yes'
GROUP BY Job_Role
ORDER BY Employees_Left DESC;

-- Overtime vs Attrition

SELECT OverTime,
COUNT(*) AS Employees_Left
FROM employees
WHERE Attrition='Yes'
GROUP BY OverTime;

-- Marital Status vs Attrition

SELECT MaritalStatus,
COUNT(*) AS Employees_Left
FROM employees
WHERE Attrition='Yes'
GROUP BY MaritalStatus
ORDER BY Employees_Left DESC;

-- Education Field vs Attrition

SELECT EducationField,
COUNT(*) AS Employees_Left
FROM employees
WHERE Attrition='Yes'
GROUP BY EducationField
ORDER BY Employees_Left DESC;


-- Advanced Business Insights 

-- Average Salary by Department

SELECT Department,
ROUND(AVG(Monthly_Income),2) AS Average_Salary
FROM employees
GROUP BY Department
ORDER BY Average_Salary DESC;


-- Average Years at Company by Department

SELECT Department,
ROUND(AVG(Years_At_Company),1) AS Avg_Years
FROM employees
GROUP BY Department;


-- Job Satisfaction Distribution 

SELECT JobSatisfaction,
COUNT(*) AS Employees
FROM employees
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;

-- Work-Life Balance Distribution

SELECT Work_Life_Balance,
COUNT(*) AS Employees
FROM employees
GROUP BY Work_Life_Balance
ORDER BY Work_Life_Balance;

-- Top 10 Highest Paid Employees

SELECT Employee_ID,
Age,
Department,
Job_Role,
Monthly_Income
FROM employees
ORDER BY Monthly_Income DESC
LIMIT 10;

