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

You can view Data cleaning and Creating SQL View [here](https://github.com/Jean-Ruth/Marketplace-Expose/blob/main/Data%20cleaning-online%20sales.sql)

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


## Analysis
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

Download MySQL Query File for Data Analysis in MySQL [here](https://github.com/Jean-Ruth/Marketplace-Expose/blob/main/Data%20Analysis%20in%20MySQL.sql)

## Recommendations

- What do we recommend based on the insights gathered?

Based on the sales analysis data from the online marketplace project, here are some targeted recommendations to optimize sales and revenue:

1. Focus on High-Revenue Categories
   - Enhance Marketing for Electronics:  Since Electronics is the highest revenue category, investing more in targeted marketing campaigns could further boost sales. Consider partnerships with tech influencers, running promotions, or increasing ad spend in channels that have shown high engagement.
   - Promote Home Appliances and Sports: Although these categories are less profitable than Electronics, they still generate substantial revenue. Create cross-promotional strategies with Electronics or seasonal sales to increase their visibility.
   - Analyze Product Performance: Conduct a deep dive into product performance within these categories to identify which products are driving revenue. Use this data to optimize inventory and promotional strategies.

2. Improve Sales in High-Volume Categories
   - Expand Clothing and Books: Since Clothing and Books have the highest number of units sold, consider expanding these categories by introducing new product lines or exclusive items. Look into customer preferences and trends to tailor the inventory.
   - Optimize Inventory Management: Ensure that popular items are well-stocked to meet demand and avoid missed sales opportunities.

3. Tailor Payment Method Strategies
   - Promote Payment Method Preferences: Enhance marketing efforts to highlight preferred payment methods for each category. For example, since customers prefer using Credit Cards for Electronics, PayPal for Home Appliances and Debit Card for Clothing, emphasize this payment option in marketing materials and checkout pages for the respective categories.
   - Introduce Payment Incentives: Offer discounts or incentives for using preferred payment methods in specific categories. This could encourage customers to use the most profitable payment options for both the marketplace and themselves.

4. Capitalize on Regional Performance
   - Regional Marketing Campaigns:  Tailor marketing campaigns based on regional strengths. For example, promote Electronics heavily in North America and focus on Home Appliances and Beauty Products in Europe as well as Sports and Clothing in Asia. Customize messaging and offers to resonate with regional preferences.
   - Localized Promotions: Develop regional promotions and sales events that align with the purchasing habits and trends in each region. This could include localized ads, special offers, or region-specific product recommendations.

Based on the analysis of unit prices relative to average unit prices across various categories, recommendations to optimize pricing strategies and improve overall sales and profitability by category include;

#### 1. Beauty Products
   - Evaluate Pricing Strategy: Given the high number of products priced below the average, consider reviewing the pricing strategy to ensure it aligns with market positioning. If the goal is to attract budget-conscious customers, ensure that the pricing structure still allows for profitability.
   - Focus on Premium Lines: Increase visibility and marketing efforts for higher-priced premium beauty products. This could involve highlighting the unique features and benefits of these products to justify the higher prices and attract customers looking for luxury or high-quality options.
   - Promotional Balance: Reassess promotional tactics to balance between discounting lower-priced products and promoting higher-margin items. Offering bundled deals that include both average and above-average priced items might increase overall sales.


#### 2. Books
   - Segment Pricing: Implement segmented pricing strategies for different types of books (for example; bestsellers, academic texts, niche genres). This can help in targeting various customer segments effectively and maximizing revenue from high-value books.
   - Promotional Strategies: Use discounts or promotions for below-average priced books to drive sales volume, but also create special marketing campaigns for above-average priced books to highlight their value, such as exclusive editions or limited releases.
   - Inventory Management: Ensure a balanced inventory that aligns with both average and premium pricing to meet diverse customer preferences and manage stock levels efficiently.


#### 3. Clothing
   - Dynamic Pricing: Employ dynamic pricing strategies to adjust prices based on market trends, seasonality, and inventory levels. This could involve increasing prices for in-demand items while offering promotions or discounts on older or slower-moving stock.
   - Highlight Premium Products: Invest in marketing campaigns to showcase higher-priced clothing items, emphasizing quality, design, or brand value. This can attract customers who are willing to pay more for premium items.
   - Seasonal Sales: Utilize seasonal sales and clearance events to move below-average priced items while attracting customers with competitive pricing.


#### 4. Electronics
   - Promote Premium Features: For above-average priced electronics, emphasize advanced features, superior technology, or unique selling points to justify the higher cost and attract tech enthusiasts or professionals.
   - Competitive Pricing: Continue offering competitive pricing for below-average priced electronics to capture a broad customer base. Consider bundling related products or offering trade-in deals to increase the perceived value.
   - Inventory and Promotions: Regularly review inventory to ensure the availability of popular electronics while strategically discounting older models to clear space for new arrivals.


#### 5. Home Appliances
   - Focus on Premium Options: Given the higher number of above-average priced products, emphasize the value and benefits of premium home appliances. Highlight energy efficiency, advanced features, or durability in marketing campaigns.
   - Adjust Pricing Strategy: Consider adjusting prices for some below-average products to align better with market trends and customer expectations. Offer incentives for purchasing higher-priced items or upgrading to premium models.
   - Customer Education: Educate customers on the benefits of higher-priced home appliances through detailed product descriptions, reviews, and comparisons to justify the investment.


#### 6. Sports
   - Market High-End Products: For sports equipment and apparel priced above average, focus on targeting serious athletes and enthusiasts who value quality and performance. Use endorsements, sponsorships, and demonstrations to attract this segment.
   - Competitive Pricing for Popular Items: Maintain competitive pricing for below-average priced sports products to attract casual users or those looking for deals. Consider offering promotions or discounts to boost sales volume.
   - Seasonal Promotions: Leverage seasonal trends and sports events to drive sales of both above-average and below-average priced items. Create targeted promotions aligned with specific sports seasons or events.

In a nutshell:
1. Price Segmentation: Develop tailored pricing strategies for different product segments within each category to address various customer needs and preferences.
2. Promotional Balance: Ensure a balanced approach in promotional strategies, promoting both high-margin and budget-friendly products to maximize sales and profitability.
3. Dynamic Adjustments: Regularly review and adjust pricing based on market conditions, inventory levels, and customer feedback to stay competitive and responsive to changing demands.


### Action Plan

- What course of action should we take and why?

#### 1. Optimize Marketing Strategies

 Objective: Increase visibility and sales in high-revenue categories and target specific customer segments.

   Actions:
 
  ##### i. Electronics:
   
  - Campaigns: Launch targeted digital marketing campaigns focusing on tech enthusiasts.
  - Influencer Partnerships: Collaborate with tech influencers for reviews and promotions.
  - Promotions: Offer limited-time discounts or bundles.


  ##### ii. Home Appliances:
  
  - Seasonal Promotions: Create promotions around major home events (for example; spring cleaning, holiday sales).
  - Cross-Promotions: Bundle with Electronics or offer discounts on complementary products.

  ##### iii. Sports:
   
  - Event Marketing: Align marketing with major sports events or seasons.
  - Targeted Ads: Use targeted ads to reach sports enthusiasts and fitness communities


#### 2. Expand and Optimize Inventory
   
Objective: Increase sales in high-volume categories and manage stock effectively.

 Actions:

  ##### i. Clothing and Books:
  - Product Expansion: Introduce new lines or exclusive collections based on customer preferences and trends.
  - Inventory Management: Use data analytics to forecast demand and optimize stock levels.

  ##### ii. Analysis: Regularly review sales data to identify top-performing products and adjust inventory accordingly.

 #### 3. Tailor Payment Method Strategies

Objective: Enhance customer satisfaction and increase revenue through preferred payment options.

 Actions:

  ##### i. Electronics:
  - Payment Options: Highlight Credit Card payment as a preferred option during checkout and marketing.

  ##### ii. Home Appliances:
  - PayPal Incentives: Offer special discounts or cashback for PayPal transactions.

  ##### iii. Clothing:
  - Debit Card Promotions: Promote Debit Card payment options with exclusive offers.

  ##### iv. Incentives: Introduce incentives for using specific payment methods to encourage their use and boost revenue.


#### 4. Develop Regional Marketing Campaigns

Objective: Increase sales by tailoring marketing efforts to regional strengths and preferences.

 Actions:

  ##### i. North America (Electronics, Books):
  - Localized Campaigns: Run targeted ads and promotions in North America focusing on Electronics and Books.
  - Customer Engagement: Increase engagement through local events or online communities.

  ##### ii. Europe (Home Appliances, Beauty Products):
  - Regional Promotions: Create region-specific promotions for Home Appliances and Beauty Products.
  - Local Partnerships: Collaborate with local influencers or brands.

  ##### iii. Asia (Sports, Clothing):
  - Event-Driven Marketing: Align marketing efforts with local sports events or fashion trends.
  - Localized Content: Develop marketing materials that resonate with Asian markets.


## Conclusion

The sales analysis of the online marketplace has provided valuable insights into its current performance and highlighted several key opportunities for growth and optimization. By analyzing revenue, units sold, payment methods, and regional performance, we have identified critical areas where targeted actions can drive significant improvements in sales and profitability.

### Key Findings:

1. **Revenue Leaders**: Electronics, Home Appliances, and Sports are our top revenue-generating categories. Focused marketing efforts and promotional strategies in these areas can amplify their already strong performance
2. **High-Volume Sales**: Clothing and Books lead in the number of units sold, indicating high customer demand. Expanding product lines and optimizing inventory for these categories will help meet this demand and capitalize on sales opportunities.
3. **Payment Preferences**: Different categories show varying preferences for payment methods. Tailoring payment incentives to match these preferences can enhance customer satisfaction and potentially increase revenue.
4. **Regional Insights**: Our analysis reveals distinct regional strengths, with Electronics and Books performing best in North America, Home Appliances and Beauty Products in Europe, and Sports and Clothing in Asia. Regional-specific marketing strategies can leverage these strengths and drive localized growth.

### Recommendations 
To capitalize on these insights, we recommend implementing targeted marketing campaigns, optimizing inventory, and tailoring payment and regional strategies to align with customer preferences. Enhancing user experience and continuously monitoring performance will also be crucial in adapting to market changes and maximizing ROI.






