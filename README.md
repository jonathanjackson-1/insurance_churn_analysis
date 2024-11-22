# Insurance Churn Analysis
## Summary
This exploratory data analysis aims to decypher demographic and policy variables that are likely to be correlated with high churn, in the case of an auto-insurance company's customers. 

The project's main goal is to recommend strategies to reduce churn, as well as to uncover key risk components of churn, in order to provide guidance to the marketing team on future customer segmentation, as well as insights to drive key profit metrics like the churn rate and customer lifetime value.

**Insights from this analysis are focused on these key variables:**
- Annual Policy Cost
- Tenure
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
- Executive Summary indicating key insights and visualizations uncovered during analysis
- Reccomendations on strategies for future customer segmentation and customer retention efforts
- Suggestions for future areas of analysis.


## Data Structure
### Project Resources
Based on a public dataset of auto-insurance customers found on Kaggle. *(Accessible [here](https://www.kaggle.com/datasets/merishnasuwal/auto-insurance-churn-analysis-dataset?select=address.csv))*

The project uses Postgresql to support data cleaning/manipulation/extraction and Tableau for all data visualizations.

### Size of Dataset
This dataset is based on 4 tables (“address”, “customer”, “demographic”, “termination”), each containing information linked to a customer’s tenure with a hypothetical auto insurance company. 

The dataset contains 2,280,321 unique customers with related address, demographic, and policy information. 269,259 of these customers have cancelled their policies within the last year - all of which of which are identified in the “termination” table.

### Keys
Each customer is defined by the primary identifier “INDIVIDUAL_ID”. Additionally, there is an “ADDRESS_ID”, which associates each customer in the “customer” table, with an address located in the “address” table.

(note: all addresses, and personal customer information is ficticious; will not be used for any purpose of analysis etc.) 

### Schema
![Schema Visualization](https://github.com/jonathanjackson-1/insurance_churn_analysis/blob/main/visualizations/SCHEMA%20pic.jpg)


## Executive Summary
### Objective
This analysis explores key demographic and policy factors influencing customer churn. The primary objective is to identify insights which will deepen our understanding surrounnding our target customers and enhance both customer retention and customer lifetime values.

### Key Insights
#### Churn Rate Peaks within the First Year of Tenure
- Churn rates peak at 26.38% withinin the first year of tenure, dropping significantly and immediately after, and remaining below 6% from year two onwards.
- This suggests that the first year of tenure is a critical stage of customer retentention, after which long-term customer loyalty is achieved.
- Opportunity: Customer Retention strategies focused particularlry on first-year clients could have outsized impacts on customer lifetime value and overall churn rates, leading to improved profitability.

<img src="https://github.com/jonathanjackson-1/insurance_churn_analysis/blob/main/visualizations/Churn%20Rate%20by%20Tenure%20Year%20Graph.png" width="850">

#### Little Correlaton Found Between Policy Cost and Churn Rate
- The density graph created shows little to no correlation between policy costs and churn rate
- This suggests higher paying customers are not inherently at risk for churn
- Opportunity: Higher paying customers drive top-line revenue and are also more profitable; knowing that they are not inherently riskier can be an opportunity to focus
  
- note: This data does not imply that raising prices has little consequence on an individual's likelihood of churn

<img src="https://github.com/jonathanjackson-1/insurance_churn_analysis/blob/main/visualizations/Churn%20Rate%20vs%20Policy%20Cost.png" width="850">

#### Demographic Variables Associated with Increased Churn
- Demographic variables like income, homeownership, and education showed minimal differences between churned and non-churned groups.
- Marriage status was the notable exception, with a significantly lower percentage of married individuals in the churned group (41.83%) compared to non-churned customers (62.82%).
- Further research could explore potential connections between marital status and customer loyalty.
- Opportunity: Understanding demographic drivers of lifetime customers represents a key insight for marketing, specificially, future customer prospecting.

### Recommendations


## Insights Deep Dive
### Overview of Analysis Process
This analysis begins by separating all data into seperate groups based on chrun status. "Churned Customers" and "Nonchurned Customers". We analyze all demographic data as well as the tenure length and policy cost of each customer.

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
- Represents a significant opportunity to drive profit: focusing customer retention efforts to drive lower churn in year one of tenure may create more lifelong customers, increasing customer lifetime value.

#### Differences in Demographic Variables
Demographic variables observed: Income, Length of Residence, Home Value, Have Child, Homeowner, Credit Score, Marraige Status

- Little to no differences were shown in summary statistics between the two groups.
- The only difference of note was found in the % married, with 62.82% married in the Non-Churn group as opposed to 41.83% among churned customers.
- Maybe more research can be done to determine whether marraige factors contribute to churn in any adjacent ways?
- Understanding demographic drivers of lifetime customers represents a key insight for customer prospecting.

#### Correlations Between Policy Cost and Churn
To answer whether correlations are shown between policy cost and churn, we create a density plot to map the distribution of policy cost against churn status:

<img src="https://github.com/jonathanjackson-1/insurance_churn_analysis/blob/main/visualizations/Churn%20Rate%20vs%20Policy%20Cost.png" width="850">

- Little to no correlation is shown between the two variables
- This does not suggest that increasing prices has no consequence on churn, but it does indicate that higher paying customer are not inherently at risk for churn.
- Focusing on customer satisfaction for individuals with higher policy costs may have positive impact on both revenues and profits by improving customer lifetime value in a high-profit segment.

