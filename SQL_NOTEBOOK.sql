'''
SQL USE CASE
- Create database for related tables
- Clean/Manipulate all data

GOALS
- Create database (Completed 10/27/24)
- Clean important tables for analysis
- Pull summary statistics on churned customers and current customers
- Create dashboard showing key churn rate metrics filtered by demographic
  '''

-- Cleaning Processes
-- Note: Most relevant analysis will be done by comparing demographic information of terminated customers to that of current customers. Most of these processes will specificially focus on these two tables
  
-- 1. Change Data type of column "HAS_CHILDREN" to boolean

-- Decimal dropped from "HAS_CHILDREN" column in "demographic" table
UPDATE demographic
SET "HAS_CHILDREN" = REPLACE("HAS_CHILDREN", '.0', '')

-- Data type changed to BigInt
ALTER TABLE demographic
ALTER COLUMN "HAS_CHILDREN" TYPE BIGINT USING "HAS_CHILDREN"::BIGINT;

-- Data type changed to boolean
ALTER TABLE demographic
ALTER COLUMN "HAS_CHILDREN" TYPE boolean 
USING "HAS_CHILDREN" = 1;


-- 2. Split "HOME_MARKET_VALUE" columb into "HIGH VALUATION" and "LOW VALUATION" 

--   Step 1: Add new columns to store the lower and higher values
ALTER TABLE demographic
ADD COLUMN "LOW_VALUATION" BIGINT,
ADD COLUMN "HIGH_VALUATION" BIGINT;

--   Step 2: Split "HOME_MARKET_VALUE" and populate new columns
-- errors caused here due to some values not following format for CAST statements to allow efficient splitting of the column
-- created statement to set null when format is not followed; these null values will be dealt with later
UPDATE demographic
SET "LOW_VALUATION" = 
        CASE 
            WHEN "HOME_MARKET_VALUE" LIKE '% - %' 
            THEN CAST(SPLIT_PART("HOME_MARKET_VALUE", ' - ', 1) AS BIGINT)
            WHEN "HOME_MARKET_VALUE" LIKE '%Plus%' 
            THEN CAST(regexp_replace("HOME_MARKET_VALUE", '[^0-9]', '', 'g') AS BIGINT)
            ELSE NULL
        END,
    "HIGH_VALUATION" = 
        CASE 
            WHEN "HOME_MARKET_VALUE" LIKE '% - %' 
            THEN CAST(SPLIT_PART("HOME_MARKET_VALUE", ' - ', 2) AS BIGINT)
            WHEN "HOME_MARKET_VALUE" LIKE '%Plus%' 
            THEN NULL -- Since "Plus" implies no upper bound, set it to NULL or a very high value if desired
            ELSE NULL
        END;

-- Step 3: Drop original "HOME_MARKET_VALUE" column
ALTER TABLE demographic
DROP COLUMN "HOME_MARKET_VALUE";
