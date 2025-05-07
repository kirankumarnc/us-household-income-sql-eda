-- US Household Income Data Cleaning

SELECT * FROM us_household_income;
SELECT * FROM ushousehold_income_statistics;

-- Renamed incorrect column header. The first column name need to update as 'id' 
ALTER TABLE ushousehold_income_statistics RENAME COLUMN `ï»¿id` TO `id`;

SELECT COUNT(id)
FROM us_household_income;

SELECT COUNT(id)
FROM ushousehold_income_statistics;

-- Identify the duplicate id's 
SELECT id, COUNT(id)
FROM us_household_income
GROUP BY id
HAVING COUNT(id) > 1;

-- removed duplicate id entries from us_household_income using ROW_NUMBER() partition technique.

DELETE FROM us_household_income
WHERE row_id IN (
	SELECT row_id
	FROM 
		(
		SELECT row_id, id, 
		ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) AS row_num
		FROM us_household_income 
		) AS duplicates 
	 WHERE row_num > 1);


-- Count the duplicate id's from statistics table

SELECT id, COUNT(id)
FROM ushousehold_income_statistics
GROUP BY id
HAVING COUNT(id) > 1;

SELECT State_Name, COUNT(State_Name)
FROM ushousehold_income_statistics
GROUP BY State_Name;

SELECT DISTINCT(State_Name)
FROM us_household_income
ORDER BY State_Name;

-- Corrected and Updated inconsistent state names --
UPDATE us_household_income 
SET State_Name = 'Georgia'
WHERE State_Name = 'georia';

UPDATE us_household_income 
SET State_Name = 'Alabama'
WHERE State_Name = 'alabama';

-- Check the blank value in Place column
SELECT *
FROM us_household_income
WHERE Place = ''
ORDER BY 1;

SELECT *
FROM us_household_income
WHERE County = 'Autauga County'
ORDER BY 1;

-- Updated blank Place values using known County and City mappings.
UPDATE us_household_income
SET Place = 'Autaugaville'
WHERE County = 'Autauga County'
AND City = 'Vinemont';

SELECT Type, COUNT(Type)
FROM us_household_income
GROUP BY Type;

-- Standardized area type labels --
UPDATE us_household_income
SET Type = 'Borough'
WHERE Type = 'Boroughs';

-- Queried records with 0, NULL, or empty AWater to inspect outliers or data gaps.
SELECT ALand, AWater
FROM us_household_income
WHERE AWater = 0 OR AWater = '' OR AWater IS NULL;



