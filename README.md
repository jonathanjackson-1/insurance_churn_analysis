# Insurance Churn Analysis
## Summary
This analysis aims to decypher demographic variables that are likely to be correlated with high churn, in the case of an auto-insurance company's customers. Based on a public dataset of auto-insurance customers found on Kaggle.

### Goals
- Create Tableau dashboard showing key churn metrics, slicable by demographic varibale
- Create linear regression model to predict churn of specific customer

### Questions
- Which demographic variables are correlated with high churn?
- Is high policy cost related to churn?

### Processes
#### SQL
- Create "address" database and import all relevant tables (Completed 10/28/24)
- Clean data
  - Edit "Has Children" column values in "demographic" table to change to boolean data type
  - Create new columns for home values (high / low valuations)
- Create dataframe containing demographic variables of churned customers; Create dataframe containing demographic variables of non-churned customers
- Pull summary statistics for demographic variables of churned customers vs non-churned customers
- Export data frames for further analysis in Tableau

Tableau
- Create dashboard showing key churn metrics, slicable by demographic varibale

Python (TBD)


## Data Structure
This dataset is based on 4 tables (“address”, “customer”, “demographic”, “termination”), each containing information linked to a customer’s tenure with a hypothetical auto insurance company. The data set contains 2,280,321 unique customers with related address, demographic, and policy information. 269,259 of these customers have cancelled their policies within the last year - all of which of which are identified in the “termination” table.


Each customer is defined by the primary identifier “INDIVIDUAL_ID”. Additionally, there is an “ADDRESS_ID”, which associates each customer in the “customer” table, with an address located in the “address” table.

Schema:


