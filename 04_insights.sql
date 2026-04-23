Insight 1 : West is the highest performing region with a total sales of 11290.
Insight 2 : Laptop is the best selling product.(21 Laptops with total sales worth 31000).
Insight 3 : Product Performance Across Regions

SELECT 
    Region,
    Product,
    SUM(Sales) AS total_sales,
    SUM(Quantity) AS total_quantity
FROM sales_data
GROUP BY Region, Product
ORDER BY Region, total_sales DESC;

--This query helps understand:
-- 1. Which product dominates in each region ? 
-- 2.Revenue distribution across products
-- 3.Regional buying behavior patterns

    West → Laptop dominates (high revenue consistently)
    North → balanced but lower revenue products
    South → mixed demand (Laptop + Keyboard + Mouse)
    East → more balanced spread

Insight 4 : Average Order Value by Product

        SELECT 
    Product,
    AVG(Sales) AS avg_order_value
FROM sales_data
GROUP BY Product
ORDER BY avg_order_value DESC;

-- This query shows the pricing power of products.
