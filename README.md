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
  - Write the documentation + commentary

	



