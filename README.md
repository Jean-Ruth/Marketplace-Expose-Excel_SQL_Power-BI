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
- Evaluate the distribution of products above and below the average unit price to understand its impact on sales performance and guide strategic pricing decisions

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


## Design

### Dashboard components required
What should the dashboard contain based on the requirements provided?
To understand what it should contain, we need to figure out what questions we need the dashboard to answer:
1.	Which 3 product categories have the highest sales revenue?
2.	Which 3 product categories have the highest number of units sold?
3.	Which category has the highest revenue per payment method?
4.	Which category has the highest revenue per region?
5.	How many products are above and below the market’s average unit price per category?

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
       
5.    Total Number of Products Above/Below the Market’s Average Unit Price by Category

      - Objective: Evaluate the distribution of products above and below the average unit price
       
      - Chart Types: Donut and Clustered Bar Chart



### Tools
|Tool|Purpose|
|----|-------|
|Excel|Exploring the data|
|SQL|Cleaning, testing, and analyzing the data|
|Power BI|Visualizing the data via interactive dashboards|

## Development
### Pseudocode
  This is the general approach in creating this solution from start to finish

  - Get the data

  - Explore the data in Excel

  - Load the data into SQL Server

  - Clean the data with SQL
  - Test the data with SQL
  - Visualize the data in Power BI
  - Generate the findings based on the insights

### Data exploration notes
  - There are at least 8 columns that contain the data we need for this analysis, which signals we have everything we need from the file
  - We have exactly the right amount of data than we need, so none of these columns would need to be removed

### Data Cleaning
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

### Transform the data

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

### Creating the SQL View
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

## Testing
   Here are the data quality tests and validation checks conducted;
   
### i. Row count check
   Count the total number of records (or rows) in the SQL View
#### SQL Query
   ```sql
SELECT COUNT(*) AS no_of_rows
FROM view_online_sales_data;
```
#### Output

![Row count](https://github.com/Jean-Ruth/Marketplace-Expose/blob/main/Row%20count%20check.png)

### ii. Column count check
   Count the total number of fields (or columns) in the SQL View
   #### SQL Query
   ```sql
SELECT COUNT(*) as column_count 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'view_online_sales_data'
```
#### Output
![Column count](https://github.com/Jean-Ruth/Marketplace-Expose/blob/main/Column%20count%20check.png)

### iii. Data type check
   #### SQL Query
   ```sql
SELECT 
COLUMN_NAME,
DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'view_online_sales_data'
```
#### Output
![Data type check](https://github.com/Jean-Ruth/Marketplace-Expose/blob/main/Data%20type%20check.png)

### iv. Duplicate count check
   #### SQL Query
   ```sql
SELECT transaction_id,
	COUNT(*) AS duplicate_count
FROM online_sales_db.`online sales data`
GROUP BY transaction_id
HAVING COUNT(*) > 1
```
#### Output
![Duplicate records check](https://github.com/Jean-Ruth/Marketplace-Expose/blob/main/Duplicate%20records%20check.png)

## Visualization
### Results
- What does the dashboard look like?
    It is an interactive Power BI dashboard that provides insights into the data
  
![Dashboard](https://github.com/Jean-Ruth/Marketplace-Expose/blob/main/Power%20BI%20dashboard.png)

  You can open, view and interact with the  dashboard in Power BI Desktop [here](https://github.com/Jean-Ruth/Marketplace-Expose/blob/main/Online%20Sales%20visualization.pbix)
 
  ### DAX Measures
1. Overall Total Revenue
   
  ```powerbi
Overall Total Revenue = SUM('view online_sales_sql'[total_revenue])
```

2. Average Revenue
```powerbi
Avg Revenue = AVERAGE('view online_sales_sql'[total_revenue])
```

3. Total Number of Units Sold
```powerbi
No of Units sold = SUM('view online_sales_sql'[units_sold])
```

4. Average Unit Price
```powerbi
Avg Unit Price = AVERAGE('view online_sales_sql'[unit_price])
```

5. Number of Products
```powerbi
No of Products = COUNTROWS('view online_sales_sql')
```

6. Rank by Most Products Sold
```sql
Rank by Most Products Sold = RANKX(ALL('view online_sales_sql'[category]), CALCULATE(SUM('view online_sales_sql'[units_sold])))
```

7. Rank by Overall Total Revenue
```sql
Rank by Overall Total Revenue = RANKX(ALL('view online_sales_sql'[category]), CALCULATE(SUM('view online_sales_sql'[total_revenue])))
```

8. Rank by Overall Total Revenue per Payment Method
```sql
Rank by Overall Total Revenue per Payment Method = RANKX(ALL('view online_sales_sql'[category]), CALCULATE(SUM('view online_sales_sql'[total_revenue])))
```

9. Rank by Overall Total Revenue per Region
```sql
Rank by Overall Total Revenue per Region = RANKX(ALL('view online_sales_sql'[category]), CALCULATE(SUM('view online_sales_sql'[total_revenue])))
```

10. Pricing Position of Beauty Products
```sql
no above avg = COUNTA('Beauty Products(unit px vs avg px)'[Beauty Pdts px position])
```

11. Pricing Position of Books category
```sql
no above/below avg = COUNTA('Books(unit px vs avg px)'[Books px position])
```

12. Pricing Position of Clothing category
```sql
no above/below avg by Clothing px position = COUNTA('Clothing(unit px vs avg px)'[Price_position])
```

13. Pricing Position of Electronics category
```sql
no above/below avg by Electronics px position = COUNTA('Electronics (unit px vs avg px)'[Price_position])
```

14. Pricing Position of Home Appliances category
```sql
no above/below avg by Home Apliances px position = COUNTA('Home Appliances(unit px vs avg px)'[Price_position])
```

15. Pricing Position of Sports category
```sql
no above/below avg by Sports px position = COUNTA('Sports(unit px vs avg px)'[Price_position])
``` 


## 5. Analysis
### Findings
- What did we find?

For this analysis, we are going to focus on the questions below to get the information we need

1.	Which 3 product categories have the highest sales revenue?
2.	Which 3 product categories have the highest number of units sold?
3.	Which category has the highest revenue per payment method?
4.	Which category has the highest revenue per region?
5.	How many products are above and below the market’s average unit price per category?

#### 1. Which 3 product categories have the highest sales revenue?

   |Category|Overall Total Revenue|
   |--------|---------------------|
   |Electronics|$34,982.41|
   |Home Appliances|$18,646.16|
   |Sports|$14,326.52|

#### 2. Which 3 product categories have the highest number of units sold?

   |Category|Total No. of Units Sold|
   |--------|---------------------|
   |Clothing|145|
   |Books|114|
   |Sports|88|

#### 3. Which category has the highest revenue per payment method?

   |Category|Payment Method|Overall Total Revenue|
   |--------|--------------|---------------------|
   |Electronics|Credit Card|$34,982.41|
   |Home Appliances|PayPal|$18,646.16|
   |Clothing|Debit Card|$8,128.93|

#### 4. Which category has the highest revenue per region?

   |Category|Region|Overall Total Revenue|
   |--------|------|---------------------|
   |Electronics|North America|$34,982.41|
   |Home Appliances|Europe|$18,646.16|
   |Sports|Asia|$14,326.52|

#### 5. How many products are above and below the market’s average unit price per category?

##### i) Beauty Products
Category Average Unit price = $61.6

|Above Avg price|Below Avg price|
|---------------|---------------|
|13|27|

##### ii) Books
Category Average Unit price = $16.15

|Above Avg price|Below Avg price|
|---------------|---------------|
|14|26|

##### iii) Clothing
Category Average Unit price = $67.54

|Above Avg price|Below Avg price|
|---------------|---------------|
|14|26|

##### iv) Electronics
Category Average Unit price = $691.59 

|Above Avg price|Below Avg price|
|---------------|---------------|
|13|27|

##### v) Home Appliances
Category Average Unit price = $320.19  

|Above Avg price|Below Avg price|
|---------------|---------------|
|15|25|

##### vi) Sports
Category Average Unit price = $261.28   

|Above Avg price|Below Avg price|
|---------------|---------------|
|13|27|

### Validation

#### MySQL Query

```sql

1.	Which 3 product categories have the highest sales revenue?
2.	Which 3 product categories have the highest number of units sold?
3.	Which category has the highest revenue per payment method?
4.	Which category has the highest revenue per region?
5.	How many products are above and below the market’s average unit price per category?



1. Which 3 product categories have the highest sales revenue?

SELECT category, sum(total_revenue) AS Overall_total_revenue
FROM online_sales_db.view_online_sales_data
GROUP BY category
ORDER BY sum(total_revenue) DESC
LIMIT 3


2.	Which 3 product categories have the highest number of units sold?

SELECT category, sum(units_sold) AS Total_no_of_units_sold
FROM online_sales_db.view_online_sales_data
GROUP BY category
ORDER BY sum(units_sold) DESC
LIMIT 3


3.	Which category has the highest revenue per payment method?

SELECT category, payment_method, sum(total_revenue) AS Overall_total_revenue
FROM online_sales_db.view_online_sales_data
GROUP BY payment_method, category
LIMIT 3


4.	Which category has the highest revenue per region?

SELECT category, region, sum(total_revenue) AS Overall_total_revenue
FROM online_sales_db.view_online_sales_data
GROUP BY region, category
ORDER BY Overall_total_revenue DESC
LIMIT 3


5.	How many products are above and below the market’s average unit price per category?

i) Beauty Products

SELECT category, 
unit_price,
CASE
	WHEN unit_price > 61.6 THEN 'Above avg price'
    WHEN unit_price = 61.6 THEN 'Avg price'
    WHEN unit_price < 61.6 THEN 'Below avg price'
 END AS Price_position
 FROM
 (SELECT category, unit_price
FROM online_sales_db.view_online_sales_data
ORDER BY category
LIMIT 40) AS Agg_table


ii) Books

SELECT category, 
unit_price,
CASE
	WHEN unit_price > 16.15 THEN 'Above avg price'
    WHEN unit_price = 16.15 THEN 'Avg price'
    WHEN unit_price < 16.15 THEN 'Below avg price'
 END AS Price_position
 FROM
 (SELECT category, unit_price
FROM online_sales_db.view_online_sales_data
ORDER BY category
LIMIT 40, 40) AS Agg_table2


iii) Clothing

SELECT category, 
unit_price,
CASE
	WHEN unit_price > 67.54 THEN 'Above avg price'
    WHEN unit_price = 67.54 THEN 'Avg price'
    WHEN unit_price < 67.54 THEN 'Below avg price'
 END AS Price_position
 FROM
 (SELECT category, unit_price
FROM online_sales_db.view_online_sales_data
ORDER BY category
LIMIT 80, 40) AS Agg_table3


iv) Electronics

SELECT category, 
unit_price,
CASE
	WHEN unit_price > 691.59 THEN 'Above avg price'
    WHEN unit_price = 691.59 THEN 'Avg price'
    WHEN unit_price < 691.59 THEN 'Below avg price'
 END AS Price_position
 FROM
 (SELECT category, unit_price
FROM online_sales_db.view_online_sales_data
ORDER BY category
LIMIT 120, 40) AS Agg_table4


v) Home Appliances

SELECT category, 
unit_price,
CASE
	WHEN unit_price > 320.19 THEN 'Above avg price'
    WHEN unit_price = 320.19 THEN 'Avg price'
    WHEN unit_price < 320.19 THEN 'Below avg price'
 END AS Price_position
 FROM
 (SELECT category, unit_price
FROM online_sales_db.view_online_sales_data
ORDER BY category
LIMIT 160, 40) AS Agg_table5


vi) Sports

SELECT category, 
unit_price,
CASE
	WHEN unit_price > 261.28 THEN 'Above avg price'
    WHEN unit_price = 261.28 THEN 'Avg price'
    WHEN unit_price < 261.28 THEN 'Below avg price'
 END AS Price_position
 FROM
 (SELECT category, unit_price
FROM online_sales_db.view_online_sales_data
ORDER BY category
LIMIT 200, 40) AS Agg_table6
```




