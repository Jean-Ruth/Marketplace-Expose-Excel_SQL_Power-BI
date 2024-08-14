# Data Cleaning Steps

1.	Remove unnecessary columns by only selecting the ones you need (Removed transaction_id)


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

