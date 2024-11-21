# Insurance Churn Analysis
## Summary
This analysis aims to decypher demographic variables that are likely to be correlated with high churn, in the case of an auto-insurance company's customers. 

The project's main goal is to recommend strategies to reduce churn, as well as to uncover key risk components of churn, in order to provide guidance to the marketing team on future customer segmentation.

**Insights from this analysis are focused on these key variables:**
- Annual Policy Cost
- Income
- Home Value
- College Education
- Credit Score
- Marital Status
- Number of Children
  

### Key Questions
- Which demographic variables are correlated with high churn?
- Are higher Policy Costs correlated with high churn?
- Is there a length of tenure at which churn becomes unlikely?

### Deliverables
- Clean Database accessible through postgresql containing all related tables. *(Full SQL Notebook accessible [here](https://github.com/jonathanjackson-1/insurance_churn_analysis/blob/main/SQL_NOTEBOOK.sql))*
- Executive Summary indicating key insights and visualizations uncovered during analysis, as well as reccomendations for future customer segmentation and areas of analysis.

  
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
![Schema Visualization](https://github.com/jonathanjackson-1/insurance_churn_analysis/blob/main/visualizations/SCHEMA%20pic.jpg)


## Executive Summary

## Insights Deep Dive
### Overview of Analysis Process
This analysis begins by separating all data into 3 seperate groups based on chrun status. "Churned Customers", "Nonchurned Customers", and "All" - which cointains all data from both of the prior groups. We analyze all demographic data and the tenure length of each customer.

Summary Statistics for each group can be found below:

**Churned Customer Statistics**
- Count: 269,259
- Mean Income: $80,993.65
- Mean Length of Residence: 7.43 years
- Mean Low Home Valuation: $117,484.91
- Mean High Home Valuation: $144,830.19
- Mean Tenure: 2123.37 days
- Mean Policy Cost: $945.46
- % w/ child: 55.11%
- % homeowner: 85.52%
- % w/ college: 33.07%
- % w/ good credit: 83.87%
- % married: 41.83%

**Non-Churned Customer Statistics**
- Count: 1,405,632
- Mean Income: $81,921.80
- Mean Length of Residence: 7.97 years
- Mean Low Valuation: $117,401.09
- Mean High Valuation: $144,720.96
- Mean Tenure: 3791.04 days
- Mean Policy Cost: $942.34
- % w/ child: 51.73%
- % homeowner: 86.53%
- % w/ college: 35.62%
- % w/ good credit: 84.62%
- % married: 62.82%

### Key Insights
#### Differences in Average Tenure
There are clear differences in the mean tenure length of the Churned dataframe (2123 days) when compared to the Non-Churn group (3791 days). However, this is ultimately flawed by survivorship bias; customers who haven't churned are still active, increasing their tenure. 

Here, we opt to compare the churn rate at each year of tenure to come to a more accurate conclusion:

<img src="https://github.com/jonathanjackson-1/insurance_churn_analysis/blob/main/visualizations/Churn%20Rate%20by%20Tenure%20Year%20Graph.png" width="850">

- Churn is significantly higher in years 0-1, peaking at 26.38% in the first year of tenure (Year 0), then falling off significantly. Drop off between the second and third year of tenure is still signficant.
- Churn rate remains below 6% post-year-2, representing the end of a critical period in customer retention efforts.
- Represents a significant opportunity to drive profit: focusing customer retention efforts to drive lower churn in year one of tenure may create more lifelong customers.

#### Differences in Demographic Variables
Demographic variables observed: Income, Length of Residence, Home Value, Have Child, Homeowner, Credit Score, Marraige Status

- Little to no differences were shown in summary statistics between the two groups.
- The only difference of note was found in the % married, with 62.82% married in the Non-Churn group as opposed to 41.83% among churned customers.
- Maybe more research can be done to determine whether marraige factors contribute to churn in any adjancent ways?

#### Correlations Between Policy Cost and Churn

### Recommendations
