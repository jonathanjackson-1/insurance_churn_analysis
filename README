# Insurance Churn Analysis
## Summary
This analysis looks at a dataset of auto-insurance customers, aiming to decypher demographic variables that are likely to be correlated with high churn.

### Goals
- Dashboard containing Churn % by demographic
- Analyze relationship between Churn and Homeowner/Children/Income
- Model to predict lieklihood of customer churn

## Data Structure
This dataset is based on 4 tables (“address”, “customer”, “demographic”, “termination”), each containing information linked to a customer’s tenure with a hypothetical auto insurance company. The data set contains 2,280,321 unique customers with related address, demographic, and policy information. 269,259 of these customers have cancelled their policies within the last year - all of which of which are identified in the “termination” table.


Each customer is defined by the primary identifier “INDIVIDUAL_ID”. Additionally, there is an “ADDRESS_ID”, which associates each customer in the “customer” table, with an address located in the “address” table.

Schema:

￼

Most relevant analysis will be done by comparing demographic information of terminated customers to that of current customers. Data frames were created by joining both demographic / termination tables to make analysis easier

Created dataframe for Terminated Customers' Demographics using:

SELECT *
FROM "demographic"
FULL OUTER JOIN "termination"
ON "termination"."INDIVIDUAL_ID" = "demographic"."INDIVIDUAL_ID"
WHERE "termination"."INDIVIDUAL_ID" IS NOT NULL
