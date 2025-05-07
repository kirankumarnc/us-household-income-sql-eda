# US Household Income – Exploratory Data Analysis (EDA)

## Table of Contents
- [Project Overview](#project-overview)  
- [Data Cleaning Summary](#data-cleaning-summary)  
- [Objectives](#objectives)  
- [Tools Used](#tools-used)  
- [Key Analyses Performed](#key-analyses-performed)  
- [Insights](#insights)  
- [Files and Structure](#files-and-structure)  

---

## Project Overview  
This project presents an exploratory data analysis (EDA) of US household income at the state, county, and city levels using SQL. It uncovers geographic and economic insights by analyzing land/water distribution, income levels, and area classifications across different regions in the United States.

---

## Data Cleaning Summary  

### Cleaning Tasks Performed:
- Renamed incorrect column header: `ï»¿id` → `id`  
- Verified total records in both datasets  
- Removed duplicate records using `ROW_NUMBER()` window function  
- Corrected state name typos (e.g., `georia`, `alabama`)  
- Filled missing `Place` values using County + City reference  
- Standardized type values (`Boroughs` → `Borough`)  
- Identified zero/missing values in `AWater` column  

---

## Objectives
- Analyze land and water distribution by state  
- Understand income variation across states and cities  
- Compare income levels by area type (Urban, Rural, etc.)  
- Explore relationships between land area and income  
- Identify high-performing states and cities based on income  

---

## Tools Used  
- SQL (MySQL) for querying and transformation  

---

## Key Analyses Performed  
- Verified structure and content of both datasets  
- Aggregated land and water area by state  
- Identified top 10 states by land and water area  
- Calculated average mean and median income by state and city  
- Analyzed income by area type (Urban, Rural, etc.)  
- Explored relationships between land area and income  

---

## Insights  
- Texas, California, and Alaska have the highest land area  
- Michigan and Florida lead in water area due to geography  
- Urban areas show higher average income than rural areas  
- Some states show high income inequality (Mean ≫ Median)  
- Small, high-density cities often have the highest income levels  

---

## Files and Structure

- [README.md](README.md) – Project overview and documentation  
- [US_Household_Income_Project_Data_cleaning.sql](US_Household_Income_Project_Data_cleaning.sql) – SQL script for cleaning the dataset  
- [EDA_US_Household_Income_Project.sql](EDA_US_Household_Income_Project.sql) – SQL script for exploratory data analysis  
- [Data Cleaning and Exploratory Data Analysis for US Household Income dataset.pdf](Data%20Cleaning%20and%20Exploratory%20Data%20Analysis%20Report.pdf) – This file contains complete queries with output screenshots (PDF)

