# Insurance Churn Analysis
## Summary
This analysis aims to decypher demographic variables that are likely to be correlated with high churn, in the case of an auto-insurance company's customers. Based on a public dataset of auto-insurance customers found on Kaggle.

The project uses Posgresql to support data cleaning/manipulation/extraction, Tableau for all data visualizations, and Python for all data modeling purposes.

### Questions
- Which demographic variables are correlated with high churn?
- Is high policy cost related to churn rate?

### Deliverables
- Clean Database accessible through posgresql containing all related tables
- Dashboard showing key churn metrics, slicable by demographic varibale
- Linear regression model to predict churn of specific customers (tbd)

  
### Processes
#### SQL
- Create "address" database and import all relevant tables
- Clean data
- Create dataframe containing demographic variables of churned customers; Create dataframe containing demographic variables of non-churned customers
- Pull summary statistics for demographic variables of churned customers vs non-churned customers
- Export data frames for further analysis in Tableau

#### Tableau
- Create relevant visualizations
- Create dashboard showing key churn metrics, slicable by demographic varibale

#### Python 
- (TBD)


## Data Structure
This dataset is based on 4 tables (“address”, “customer”, “demographic”, “termination”), each containing information linked to a customer’s tenure with a hypothetical auto insurance company. 

The dataset contains 2,280,321 unique customers with related address, demographic, and policy information. 269,259 of these customers have cancelled their policies within the last year - all of which of which are identified in the “termination” table.

Each customer is defined by the primary identifier “INDIVIDUAL_ID”. Additionally, there is an “ADDRESS_ID”, which associates each customer in the “customer” table, with an address located in the “address” table.

(note: all addresses, and personal customer information is ficticious; will not be used for any purpose of analysis etc.) 

#### Schema:
![Picture of database schema](https://github.com/jonathanjackson-1/insurance_churn_analysis/blob/main/SCHEMA%20pic.jpg)


