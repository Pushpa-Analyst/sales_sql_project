1 : Region ranking (CTE)--Total sales per region + ranking regions
WITH region_sales AS (
    SELECT 
        Region,
        SUM(Sales) AS total_sales
    FROM sales_data
    GROUP BY Region
)

SELECT 
    Region,
    total_sales,
    RANK() OVER (ORDER BY total_sales DESC) AS region_rank
FROM region_sales;

2 : Running total sales (window function)--Sales trend + cumulative revenue
SELECT 
    order_date,
    Sales,
    SUM(Sales) OVER (ORDER BY order_date) AS running_total_sales
FROM sales_data
ORDER BY order_date;

3 : Product ranking (CTE + window)--Rank products by total revenue
WITH product_sales AS (
    SELECT 
        Product,
        SUM(Sales) AS total_sales
    FROM sales_data
    GROUP BY Product
)

SELECT 
    Product,
    total_sales,
    RANK() OVER (ORDER BY total_sales DESC) AS product_rank
FROM product_sales;

4 : Sales ranking per order--Rank each order by sales value
SELECT 
    OrderID,
    Region,
    Product,
    Sales,
    RANK() OVER (ORDER BY Sales DESC) AS sales_rank
FROM sales_data;

5 : Moving average sales--3-day moving average of sales
SELECT 
    order_date,
    Sales,
    AVG(Sales) OVER (
        ORDER BY order_date
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS moving_avg_sales
FROM sales_data;
