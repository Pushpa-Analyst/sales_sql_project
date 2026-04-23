-- Total sales
SELECT SUM(sales) AS total_sales FROM sales_data;

-- Sales by region
SELECT region, SUM(sales) AS total_sales
FROM sales_data
GROUP BY region
ORDER BY total_sales DESC;

-- Top products
SELECT product, SUM(sales) AS total_sales
FROM sales_data
GROUP BY product
ORDER BY total_sales DESC;

-- Monthly trend
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month,
       SUM(sales) AS total_sales
FROM sales_data
GROUP BY month
ORDER BY month;
