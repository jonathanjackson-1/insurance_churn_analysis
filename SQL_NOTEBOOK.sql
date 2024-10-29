'''
SQL USE CASE
- Create database for related tables
- Clean/Manipulate all data

GOALS
- Create database
- Pull summary statistics on churned customers and current customers
- Create dashboard showing key churn rate metrics filtered by demographic
  '''

-- Cleaning Processes
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
