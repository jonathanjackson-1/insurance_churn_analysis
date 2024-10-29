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


