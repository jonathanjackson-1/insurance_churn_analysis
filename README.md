# Insurance Churn Analysis
## Summary
This analysis aims to decypher demographic variables that are likely to be correlated with high churn, in the case of an auto-insurance company's customers. Based on a public dataset of auto-insurance customers found on Kaggle.

### Goals
- Dashboard containing Churn % by demographic
- Analyze relationship between Churn and Homeowner/Children/Income
- Model to predict lieklihood of customer churn

## Data Structure
This dataset is based on 4 tables (“address”, “customer”, “demographic”, “termination”), each containing information linked to a customer’s tenure with a hypothetical auto insurance company. The data set contains 2,280,321 unique customers with related address, demographic, and policy information. 269,259 of these customers have cancelled their policies within the last year - all of which of which are identified in the “termination” table.


Each customer is defined by the primary identifier “INDIVIDUAL_ID”. Additionally, there is an “ADDRESS_ID”, which associates each customer in the “customer” table, with an address located in the “address” table.

Schema:
<picture>
 <source media="(prefers-color-scheme: dark)" srcset="[file:///Users/jonathanjackson/Downloads/SCHEMA%20pic.jpg](https://drive.google.com/drive/my-drive?dmr=1&ec=wgc-drive-hero-goto)">
 <source media="(prefers-color-scheme: light)" srcset="[file:///Users/jonathanjackson/Downloads/SCHEMA%20pic.jpg](https://drive.google.com/drive/my-drive?dmr=1&ec=wgc-drive-hero-goto)">
 <img alt="Image showing schema for insurance_churn database src="[Yfile:///Users/jonathanjackson/Downloads/SCHEMA%20pic.jpg](https://drive.google.com/drive/my-drive?dmr=1&ec=wgc-drive-hero-goto)">
</picture>
￼

