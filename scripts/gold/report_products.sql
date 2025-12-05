/*
Product Report 
Report Type: View
Purpose:
- This report consolidates key product metrics and behaviours

Highlights:
1. Gathers essential fields such as product names, category, subcategory, cost
2. Segments products by revenue to identify High Performers, Mid-Range, Low Performers
3. Aggregates product-level metrics:
	- total orders
	- total sales
	- total quantity sold
	- total customers (unique)
	- lifespan in months
4.Calculates valuable KPIs:
	- recency (months since last order)
	- average order revenue (AOR)
	- average monthly revenue
How to use: SELECT * FROM gold.report_products
*/

IF OBJECT_ID('gold.report_products', 'V') IS NOT NULL
DROP VIEW gold.report_products;
GO

CREATE VIEW gold.report_products AS 
-- Base query: Retrieves core columns from tables
WITH base_query AS (
SELECT
	f.order_number,
	f.product_key,
	f.customer_key,
	f.order_date,
	f.sales_amount,
	f.quantity,
	p.product_name,
	p.category,
	p.subcategory,
	p.cost
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
WHERE order_date IS NOT NULL )

, product_aggregation AS (

-- Product Aggregations: Summarizes key metrics at the product level
SELECT
	product_key,
	product_name,
	category,
	subcategory,
	cost,
SUM(sales_amount) AS total_sales,
SUM(quantity) AS total_quantity,
ROUND(AVG(CAST(sales_amount AS FLOAT) / NULLIF(quantity, 0)), 1) AS average_selling_price,
COUNT(DISTINCT order_number) AS total_orders,
COUNT (DISTINCT customer_key) AS total_customers,
MAX(order_date) AS last_order_date,
DATEDIFF(month, MIN(order_date), MAX(order_date)) AS lifespan
FROM base_query
GROUP BY 
	product_key,
	product_name,
	category,
	subcategory,
	cost )

SELECT
	product_key,
	product_name,
	category,
	subcategory,
	cost,
--
CASE WHEN total_sales >= 50000  THEN 'High_Performers'
	WHEN  total_sales BETWEEN 10000 AND 50000 THEN 'Mid_Performers'
	ELSE 'Low_Performers'
END AS product_segments,
 total_orders,
 total_sales,
 total_quantity,
 average_selling_price
 total_customers,
 last_order_date,
 DATEDIFF (month, last_order_date, GETDATE()) AS recency,
 lifespan,
 -- Calculate average order value (AVO)
 CASE WHEN total_sales = 0 THEN 0
	ELSE total_sales/ total_orders 
 END AS avg_order_value,
 -- Calculate average mothly spending
 CASE WHEN lifespan = 0 THEN total_sales
	ELSE total_sales/ lifespan
END AS avg_montly_spend

FROM product_aggregation 
