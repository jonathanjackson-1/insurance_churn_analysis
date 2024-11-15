# Insurance Churn Analysis
## Summary
This analysis aims to decypher demographic variables that are likely to be correlated with high churn, in the case of an auto-insurance company's customers. 

The project's main goal is to recommend strategies to reduce churn, as well as to uncover key risk components of churn, in order to guide future customer prospecting.

Insights from this analysis are focused on these key variables:
- Current Annual Policy Amount
- Policy Start Date
- Income
- Home Value
- College Education
- Credit Score
- Marital Status
- Number of Children
  

### Key Questions
- Which demographic variables are correlated with high churn?
- Is there a length of tenure at which churn becomes unlikely?

### Deliverables
- Clean Database accessible through postgresql containing all related tables. *(Full SQL Notebook accessible [here](https://github.com/jonathanjackson-1/insurance_churn_analysis/blob/main/SQL_NOTEBOOK.sql))*
- Dashboard showing key churn metrics, slicable by demographic variable.
- Executive Summary indicating key insights and visualizations uncovered during analysis.

  
### Processes
#### SQL
- Create "address" database and import all relevant tables
- Clean data
- Create dataframe containing demographic variables of churned customers; Create dataframe containing demographic variables of non-churned customers
- Pull summary statistics for demographic variables of churned customers vs non-churned customers

#### Tableau
- Create relevant visualizations
- Create dashboard showing key churn metrics, slicable by demographic varibale

#### Python 
- (TBD)


## Data Structure
### Project Resources
Based on a public dataset of auto-insurance customers found on Kaggle. *(Accessible [here](https://www.kaggle.com/datasets/merishnasuwal/auto-insurance-churn-analysis-dataset?select=address.csv))*

The project uses Postgresql to support data cleaning/manipulation/extraction, Tableau for all data visualizations, and Python for all data modeling purposes.

### Size of Dataset
This dataset is based on 4 tables (“address”, “customer”, “demographic”, “termination”), each containing information linked to a customer’s tenure with a hypothetical auto insurance company. 

The dataset contains 2,280,321 unique customers with related address, demographic, and policy information. 269,259 of these customers have cancelled their policies within the last year - all of which of which are identified in the “termination” table.

### Keys
Each customer is defined by the primary identifier “INDIVIDUAL_ID”. Additionally, there is an “ADDRESS_ID”, which associates each customer in the “customer” table, with an address located in the “address” table.

(note: all addresses, and personal customer information is ficticious; will not be used for any purpose of analysis etc.) 

### Schema
![Picture of database schema](https://github.com/jonathanjackson-1/insurance_churn_analysis/blob/main/SCHEMA%20pic.jpg)


## Executive Summary

## Insights Deep Dive
### Overview of Analysis Process
This analysis begins by separating all data into 3 seperate groups based on chrun status. "Churned Customers", "Nonchurned Customers", and "All" - which cointains all data from both groups. We analyze all demographic data and the tenure length of each customer.

Summary Statistics for each group can be found below:

**Churned Customer Statistics**
- Count: 269,259
- Mean Income: 80,993.65
- Mean Length of Residence: 7.43
- Mean Low Home Valuation: 117,484.91
- Mean High Home Valuation: 144,830.19
- Mean Tenure: 
- % w/ child: 55.11%
- % homeowner: 85.52%
- % w/ college: 33.07%
- % w/ good credit: 83.87%
- % married: 41.83%

**Non-Churned Customer Statistics**
- Count: 1,405,632
- Mean Income: 81,921.80
- Mean Length of Residence: 7.97
- Mean Low Valuation: 117,401.09
- Mean High Valuation: 144,720.96
- Mean Tenure:
- % w/ child: 51.73%
- % homeowner: 86.53%
- % w/ college: 35.62%
- % w/ good credit: 84.62%
- % married: 62.82%

**All Customer Statistics**
-

### Key Insights
Insight A: Differences in Mean Tenure Length

Insight B: No Significant Difference in Demographic Variables
note: married % research?

### Recommendations
