-- US Household Income Exploratory Data Analysis

-- Check the available records and structure in the us_household_income dataset --
SELECT * FROM us_household_income;

-- Check the available records and structure in the ushousehold_income_statistics dataset --
SELECT * FROM ushousehold_income_statistics;

-- What are the land and water areas for each city and county within the states --
SELECT State_Name,County, City, ALand, Awater
FROM us_household_income;

-- Which states have the largest total land area --
SELECT State_Name, SUM(ALand), SUM(Awater)
FROM us_household_income
GROUP BY State_Name
ORDER BY SUM(ALand) DESC;

-- Which states have the largest total water area --
SELECT State_Name, SUM(ALand), SUM(Awater)
FROM us_household_income
GROUP BY State_Name
ORDER BY SUM(Awater) DESC;

-- Which are the top 10 US states with the largest total land area --
SELECT State_Name, SUM(ALand)
FROM us_household_income
GROUP BY State_Name
ORDER BY SUM(ALand) DESC
LIMIT 10;

-- Which are the top 10 US states with the largest total water area --
SELECT State_Name, SUM(AWater)
FROM us_household_income
GROUP BY State_Name
ORDER BY SUM(AWater) DESC
LIMIT 10;

-- What is the average household income (mean and median) for each state --
SELECT ui.State_Name, ROUND(AVG(Mean), 2) AS avg_mean, ROUND(AVG(Median), 2) AS avg_median
FROM us_household_income AS ui
INNER JOIN ushousehold_income_statistics AS us
ON ui.id = us.id
WHERE Mean <> 0
GROUP BY ui.State_Name
ORDER BY avg_mean;

/* How does the average household income (mean and median) vary by area type 
(e.g., urban, rural), considering only types with more than 100 records */

SELECT Type, COUNT(Type), ROUND(AVG(Mean), 2) AS avg_mean, ROUND(AVG(Median), 2) AS avg_median
FROM us_household_income AS ui
INNER JOIN ushousehold_income_statistics AS us
ON ui.id = us.id
WHERE Mean <> 0
GROUP BY Type
HAVING COUNT(Type) > 100
ORDER BY avg_mean;

-- Which cities in the US have the highest average household income --
SELECT ui.State_Name, City, ROUND(AVG(Mean), 2) AS avg_mean
FROM us_household_income AS ui
INNER JOIN ushousehold_income_statistics AS us
ON ui.id = us.id
GROUP BY ui.State_Name, City
ORDER BY avg_mean DESC;

-- How are different area types (Type: Rural, Urban, Suburban, etc.) distributed across states --
SELECT State_Name, Type, COUNT(*) AS total_areas
FROM us_household_income
GROUP BY State_Name, Type
ORDER BY total_areas DESC;

-- City Size vs Income --
SELECT ui.State_Name, City, ALand, ROUND(AVG(Mean), 2) AS avg_mean_income
FROM us_household_income AS ui
JOIN ushousehold_income_statistics AS us ON ui.id = us.id
GROUP BY ui.State_Name, City, ALand
ORDER BY avg_mean_income DESC;

