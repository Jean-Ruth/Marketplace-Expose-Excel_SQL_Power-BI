# Online Marketplace Exposé: Unveiling Sales Performance and Insights 

## Online Marketplace Sales Analysis

![image](https://github.com/user-attachments/assets/b8fcbbed-5f6f-4fbc-b287-3beb0b3cffd9)

## Project Overview

This Excel to Power BI data analysis project focuses on evaluating the sales performance of a leading online marketplace over the past year. By examining different facets of the sales data, we aim to uncover trends, offer data-driven recommendations, and gain a comprehensive understanding of the marketplace’s performance.

## Objective/Problem Statement

What is the key pain point?

To conduct a comprehensive overview of online sales transactions across different product categories in order to:
- Identify top-selling products within each category to optimize inventory and marketing strategies
- Evaluate the performance of specific categories in different regions to tailor marketing campaigns accordingly
- Investigate the impact of payment methods on sales volume or revenue in order to identify key insights and opportunities for optimization using various KPIs and visualizations in Power BI

KPI Requirements;
- Overall Total Revenue; The overall revenue generated from all items sold
- Average Revenue; The Average revenue generated per sale
- Total Number of products; The count of the various products sold
- Average Price; The average price for items sold

What is the ideal solution?

To create a dashboard that provides insights into the top-performing product categories, regions and payment method that includes their;
- Revenue generated
- Average Revenue
- Number of units sold
- Average Price

This will help the marketing team make more informed decisions about which product categories and marketing campaigns that are right to optimize

## Data source
The data needed to achieve our objective is data on Online Sales of a Popular Marketplace that includes;
- Order ID
- Date
- Category
- Product Name
- Quantity Sold
- Unit Price
- Total Price
- Region
- Payment Method

The data is sourced from Kaggle (an Excel extract), [see here to find it](https://www.kaggle.com/datasets/shreyanshverma27/online-sales-dataset-popular-marketplace-data)

## Stages
- Design
- Development
- Testing
- Analysis

### 1. Design

#### Dashboard components required
What should the dashboard contain based on the requirements provided?
To understand what it should contain, we need to figure out what questions we need the dashboard to answer:
1.	Which 3 product categories have the highest sales revenue?
2.	Which 3 product categories have the highest number of products sold?
3.	Which category has the highest revenue per payment method?
4.	Which category has the highest revenue per region?

### Charts Requirements
1.	Overall Total Revenue by Category

     - Objective: Identify the performance of different categories in regards to overall total revenue

     - Additional KPI metrics: Assess how other KPIs (Average Revenue, Number of Products, Average Price) vary by Category

     - Chart Type: Donut Chart

2.	Total Revenue by Payment Method and Category

     - Objective: Compare the Overall Total Revenue across different Payment Methods segmented by Category

     - Additional KPI metrics: Assess how other KPIs (Average Revenue, Number of Products, Average Price) vary across different Payment Methods segmented by Category

     - Chart Type: Clustered Column Chart

3.	Total Revenue by Region

     - Objective: To analyze the performance of different regions in regards to overall total revenue

     - Additional KPI metrics: Assess how other KPIs (Average Revenue, Number of Products, Average Price) vary across different Regions

     - Chart Type: Funnel

4.	All Metrics by Month

     - Objective: Provide a comprehensive view of all key metrics (Average Revenue, Number of Products, Average Price) categorized by Month

     - Chart Type: Matrix Card

### Tools
|Tool|Purpose|
|----|-------|
|Excel|Exploring the data|
|SQL|Cleaning, testing, and analyzing the data|
|Power BI|Visualizing the data via interactive dashboards|

### 2. Development
#### Pseudocode
  This is the general approach in creating this solution from start to finish

  - Get the data

  - Explore the data in Excel

  - Load the data into SQL Server

  - Clean the data with SQL
  - Test the data with SQL
  - Visualize the data in Power BI
  - Generate the findings based on the insights

#### Data exploration notes
  - There are at least 8 columns that contain the data we need for this analysis, which signals we have everything we need from the file
  - We have exactly the right amount of data than we need, so none of these columns would need to be removed

#### Data Cleaning
  In the data cleaning phase, the following steps were performed to clean and shape the data into the desired format;
  - Data loading and inspection
  - Removing unnecessary columns by only selecting the ones we need


Below is a table outlining the constraints on our cleaned dataset:
|Property|Description|
|--------|-----------|
|Number of Rows|240|
|Number of Columns|8|

And below is a tabular representation of the expected schema for the clean data:
|Column name|Data type|
|-----------|---------|
|order_date|TEXT|
|category|TEXT|
|product_name|TEXT|
|units_sold|INTEGER|
|unit_price|DOUBLE|
|total_revenue|DOUBLE|
|region|TEXT|
|payment_method|TEXT|

#### Transform the data

Removing the unnecessary columns by only selecting the ones we need (removed transaction id column)

```sql
SELECT
order_date,
category,
product_name,
units_sold
unit_price,
total_revenue,
region,
payment_method 
FROM online_sales_db.`online sales data`;
```

Creating the SQL View
```sql
CREATE VIEW view_online_sales_data AS

SELECT
order_date,
category,
product_name,
units_sold,
unit_price,
total_revenue,
region,
payment_method 
FROM online_sales_db.`online sales data`;
```

### 3. Testing
   Here are the data quality tests and validation checks conducted;
   
#### i. Row count check
   Count the total number of records (or rows) in the SQL View
##### SQL Query
   ```sql
SELECT COUNT(*) AS no_of_rows
FROM view_online_sales_data;
```
##### Output

![Row count](https://github.com/Jean-Ruth/Marketplace-Expose/blob/main/Row%20count%20check.png)

#### ii. Column count check
   Count the total number of fields (or columns) in the SQL View
   ##### SQL Query
   ```sql
SELECT COUNT(*) as column_count 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'view_online_sales_data'
```
##### Output
![Column count](https://github.com/Jean-Ruth/Marketplace-Expose/blob/main/Column%20count%20check.png)

#### iii. Data type check
   ##### SQL Query
   ```sql
SELECT 
COLUMN_NAME,
DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'view_online_sales_data'
```
##### Output
![Data type check](https://github.com/Jean-Ruth/Marketplace-Expose/blob/main/Data%20type%20check.png)

#### iv. Duplicate count check
   ##### SQL Query
   ```sql
SELECT transaction_id,
	COUNT(*) AS duplicate_count
FROM online_sales_db.`online sales data`
GROUP BY transaction_id
HAVING COUNT(*) > 1
```
##### Output
![Duplicate records check](https://github.com/Jean-Ruth/Marketplace-Expose/blob/main/Duplicate%20records%20check.png)

## Visualization
### Results
- What does the dashboard look like?






