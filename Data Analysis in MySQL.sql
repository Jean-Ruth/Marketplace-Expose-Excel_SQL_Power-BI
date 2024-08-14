
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

