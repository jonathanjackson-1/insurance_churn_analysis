'''
SQL USE CASE
- Create database for related tables
- Clean/Manipulate all data

GOALS
- Create database (Complete 10/27/24)
- Clean important tables for analysis (Complete 10/28/24)
- Create clean data frames for churned customers and current customers (Complete 10/28/24)
- Pull summary statistics on churned customers and current customers: count, mean, median for numeric variables ; % true for boolean
  '''

-- CLEANING PROCESSES
-- Notes: Most relevant analysis will be done by comparing demographic information of terminated customers to that of current customers. 
-- Most of these processes will specificially focus on these two tables
  
-- 1. Change Data type of column "HAS_CHILDREN" to boolean

-- Decimal dropped from "HAS_CHILDREN" column in "demographic" table
UPDATE demographic
SET "HAS_CHILDREN" = REPLACE("HAS_CHILDREN", '.0', '');

-- Data type changed to BigInt
ALTER TABLE demographic
ALTER COLUMN "HAS_CHILDREN" TYPE BIGINT USING "HAS_CHILDREN"::BIGINT;

-- Data type changed to boolean
ALTER TABLE demographic
ALTER COLUMN "HAS_CHILDREN" TYPE boolean 
USING "HAS_CHILDREN" = 1;


-- 2. Split "HOME_MARKET_VALUE" column into "HIGH VALUATION" and "LOW VALUATION" 

-- Add new columns to store the lower and higher values
ALTER TABLE demographic
ADD COLUMN "LOW_VALUATION" BIGINT,
ADD COLUMN "HIGH_VALUATION" BIGINT;

-- Split "HOME_MARKET_VALUE" and populate new columns
-- errors caused here due to some values not following format for CAST statements to allow efficient splitting of the column
-- created CASE statement to set null when format is not followed; these null values will be dealt with later
UPDATE demographic
SET "LOW_VALUATION" = 
        CASE 
            WHEN "HOME_MARKET_VALUE" LIKE '% - %' 
            THEN CAST(SPLIT_PART("HOME_MARKET_VALUE", ' - ', 1) AS BIGINT)
            WHEN "HOME_MARKET_VALUE" LIKE '%Plus%' 
            THEN CAST(regexp_replace("HOME_MARKET_VALUE", '[^0-9]', '', 'g') AS BIGINT)
            ELSE NULL
        END;
    "HIGH_VALUATION" = 
        CASE 
            WHEN "HOME_MARKET_VALUE" LIKE '% - %' 
            THEN CAST(SPLIT_PART("HOME_MARKET_VALUE", ' - ', 2) AS BIGINT)
            WHEN "HOME_MARKET_VALUE" LIKE '%Plus%' 
            THEN NULL -- Since "Plus" implies no upper bound, set it to NULL or a very high value if desired
            ELSE NULL
        END;

-- Drop original "HOME_MARKET_VALUE" column
ALTER TABLE demographic
DROP COLUMN "HOME_MARKET_VALUE";


-- 3. Drop null/duplicate values from "demographic" and "termination" tables

-- Drop null values from "demographic" variables
DELETE FROM demographic
WHERE "INCOME" IS NULL
	OR "HAS_CHILDREN" IS NULL
	OR "LENGTH_OF_RESIDENCE" IS NULL
	OR "MARITAL_STATUS" IS NULL
	OR "HOME_OWNER" IS NULL
	OR "COLLEGE_DEGREE" IS NULL
	OR "GOOD_CREDIT" IS NULL
	OR "LOW_VALUATION" IS NULL
	OR "HIGH_VALUATION" IS NULL;
-- 525793 Rows affected

-- Drop null values from "termination" variables
DELETE FROM termination
WHERE "ACCT_SUSPD_DATE" IS NULL;
-- 0 Rows affected

-- Return count of duplicate Id's in "demographic" table
SELECT "INDIVIDUAL_ID", COUNT(*) AS duplicate_count
FROM demographic
GROUP BY "INDIVIDUAL_ID"
HAVING COUNT(*) > 1;
-- 0 Rows affected

-- Return count of duplicate Id's in "termination" table
SELECT "INDIVIDUAL_ID", COUNT(*) AS duplicate_count
FROM termination
GROUP BY "INDIVIDUAL_ID"
HAVING COUNT(*) > 1;
-- 0 Rows affected

-- Cleaning complete for now


-- Create dataframe for demographics of churned customers
SELECT "termination"."INDIVIDUAL_ID", 
	"demographic"."INCOME",
	"demographic"."HAS_CHILDREN",
	"demographic"."LENGTH_OF_RESIDENCE",
	"demographic"."MARITAL_STATUS",
	"demographic"."HOME_OWNER",
	"demographic"."COLLEGE_DEGREE",
	"demographic"."GOOD_CREDIT",
	"demographic"."LOW_VALUATION",
	"demographic"."HIGH_VALUATION",
	"termination"."ACCT_SUSPD_DATE"
FROM "demographic"
FULL OUTER JOIN "termination"
ON "termination"."INDIVIDUAL_ID" = "demographic"."INDIVIDUAL_ID"
WHERE "termination"."INDIVIDUAL_ID" IS NOT NULL;
-- Saved dataframe as .csv file for later use: "churn_customers_demographics_dataframe_clean.csv"

-- Create dataframe for demographics of customers who have not yet churned
SELECT "demographic"."INDIVIDUAL_ID", 
	"demographic"."INCOME",
	"demographic"."HAS_CHILDREN",
	"demographic"."LENGTH_OF_RESIDENCE",
	"demographic"."MARITAL_STATUS",
	"demographic"."HOME_OWNER",
	"demographic"."COLLEGE_DEGREE",
	"demographic"."GOOD_CREDIT",
	"demographic"."LOW_VALUATION",
	"demographic"."HIGH_VALUATION"
FROM "demographic"
FULL OUTER JOIN "termination"
ON "termination"."INDIVIDUAL_ID" = "demographic"."INDIVIDUAL_ID"
WHERE "termination"."INDIVIDUAL_ID" IS NULL;
-- Saved dataframe as .csv file for later use: "nonchurn_customers_demographics_dataframe_clean.csv"


-- SUMMARY STATISTICS

-- AVERAGES FOR ALL CUSTOMERS
-- Find averages for numeric demographic variables
-- note: error here due to data type, used CAST to convert columns to numeric for avg function
SELECT ROUND(CAST(avg("INCOME") AS numeric), 2) AS avg_income_rounded, 
       ROUND(CAST(avg("LENGTH_OF_RESIDENCE") AS numeric), 2) AS avg_length_of_residence,
	   ROUND(avg("LOW_VALUATION"), 2),
	   ROUND(avg("HIGH_VALUATION"), 2)
FROM demographic;
-- Mean Income: 81,815.84
-- Mean Length of Residence: 7.91
-- Mean Low Valuation: 117,419.66
-- Mean High Valuation: 144,733.43

-- Find averages for boolean demographic variables
SELECT ROUND(AVG("HAS_CHILDREN"::int) * 100, 2) AS "%_HAS_CHILD",
	ROUND(AVG("HOME_OWNER"::int) * 100, 2) AS "%_HOMEOWNER",
	ROUND(AVG("COLLEGE_DEGREE"::int) * 100, 2) AS "%_COLLEGE",
	ROUND(AVG("GOOD_CREDIT"::int) * 100, 2) AS "%_GOOD_CREDT"
FROM demographic;
-- % w/ child: 52.12%
-- % homeowner: 86.41%
-- % w/ college: 35.33%
-- % w/ good credit: 84.56%

-- note: go back to find marital status by casting as boolean
SELECT ROUND(AVG(CASE WHEN "MARITAL_STATUS" = 'Married' THEN 1 ELSE 0 END) * 100, 2) AS percent_married
FROM demographic;
-- Percent Married: 62.75%

-- Find count of all customers post cleaning
SELECT COUNT(*)
FROM demographic
-- Count: 1,586,786

-- AVERAGES FOR CHURN CUSTOMERS
-- Imported "churn_customers_demographics_dataframe_clean.csv" as seperate table "churn_df" for this

-- Find count of churn customers
SELECT COUNT(*)
FROM churn_df
-- Count: 269,259

-- Find averages for numeric demographic variables
SELECT ROUND(CAST(avg("INCOME") AS numeric), 2) AS avg_income_rounded, 
       ROUND(CAST(avg("LENGTH_OF_RESIDENCE") AS numeric), 2) AS avg_length_of_residence,
	   ROUND(avg("LOW_VALUATION"), 2),
	   ROUND(avg("HIGH_VALUATION"), 2)
FROM churn_df;
-- Mean Income: 80,993.65
-- Mean Length of Residence: 7.43
-- Mean Low Valuation: 117,484.91
-- Mean High Valuation: 144830.19

-- Find averages for boolean demographic variables
SELECT ROUND(AVG("HAS_CHILDREN"::int) * 100, 2) AS "%_HAS_CHILD",
	ROUND(AVG("HOME_OWNER"::int) * 100, 2) AS "%_HOMEOWNER",
	ROUND(AVG("COLLEGE_DEGREE"::int) * 100, 2) AS "%_COLLEGE",
	ROUND(AVG("GOOD_CREDIT"::int) * 100, 2) AS "%_GOOD_CREDT"
FROM churn_df;
-- % w/ child: 55.11%
-- % homeowner: 85.52%
-- % w/ college: 33.07%
-- % w/ good credit: 83.87%

-- Marital Status avg
SELECT ROUND(AVG(CASE WHEN "MARITAL_STATUS" = 'Married' THEN 1 ELSE 0 END) * 100, 2) AS percent_married
FROM churn_df:
-- Percent Married: 41.83%


-- AVERAGES FOR NONCHURN CUSTOMERS
-- Imported "nonchurn_customers_demographics_dataframe_clean.csv" as seperate table "nonchurn_df" for this
	
-- Find count of churn customers
SELECT COUNT(*)
FROM nonchurn_df
-- Count: 1,405,632

-- Find averages for numeric demographic variables
SELECT ROUND(CAST(avg("INCOME") AS numeric), 2) AS avg_income_rounded, 
       ROUND(CAST(avg("LENGTH_OF_RESIDENCE") AS numeric), 2) AS avg_length_of_residence,
	   ROUND(avg("LOW_VALUATION"), 2),
	   ROUND(avg("HIGH_VALUATION"), 2)
FROM nonchurn_df;
-- Mean Income: 81,921.80
-- Mean Length of Residence: 7.97
-- Mean Low Valuation: 117,401.09
-- Mean High Valuation: 144720.96

-- Find averages for boolean demographic variables
SELECT ROUND(AVG("HAS_CHILDREN"::int) * 100, 2) AS "%_HAS_CHILD",
	ROUND(AVG("HOME_OWNER"::int) * 100, 2) AS "%_HOMEOWNER",
	ROUND(AVG("COLLEGE_DEGREE"::int) * 100, 2) AS "%_COLLEGE",
	ROUND(AVG("GOOD_CREDIT"::int) * 100, 2) AS "%_GOOD_CREDT"
FROM nonchurn_df;
-- % w/ child: 51.73%
-- % homeowner: 86.53%
-- % w/ college: 35.62%
-- % w/ good credit: 84.62%
