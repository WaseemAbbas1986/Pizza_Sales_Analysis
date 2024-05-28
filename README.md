# Pizza Sales Analysis

### Project Overview
In this project will find the pizza sales trend over time, monthly. Daily and hourly. we will also analyse the top and worst selling products by different parameters

### Tools
- Excel - Data Sourcr
- Microsoft SQL Server - Data Analyse
- Microsoft Power BI Desktop - Data vasualization Report (Dashboard)

### Problem Statement
1- KPIs Requirement 
  - Total Revenue
  - Average Order by Value
  - Total Pizza quantity Sold
  - Total Numbers of orders
  - Average Pizza per Order

2- Charts Requirement
  - create Percentage of sales by pizza size in Pie chart
  - Create a funnel chart which shows the Total Pizza sold by pizza category
  - Create a bar Chart wich shows the Top 5 selling product by Revenue, Quanity and total number of orders
  - Create a bar Chart wich shows the  5 worst selling product by Revenue, Quanity and total number of orders
  - Daily Trends for Total Order in Bar Chart
  - Montly trend by order in line chart
  - Percentage of sales by pizza by category in Pie chart

### Microsoft SQL Data Analysis
- Total Revenue

```sql
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales
```
- Average Order by Value

```sql
  SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza_sales
  ```
- Total Pizza Sold
```sql
  SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza_sales
  ```
- Total Orders
```sql
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales
```
- Average Pizza per Order
```sql
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales
```
- Daily Trend for total Orders
```sql
SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)
```
- Monthly Trend for total orders
```sql
select DATENAME(MONTH, order_date) as Month_Name, COUNT(DISTINCT order_id) as Total_Orders
from pizza_sales
GROUP BY DATENAME(MONTH, order_date)
```
- % of sales by Pizza category
```sql
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category
```
- % of sales by Pizza Size
```sql
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size
```
- Total Pizza Sold by category
```sql
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC
```
- Top 5 Pizza by Revenue
```sql
SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
```
- Bottom 5 Pizza by Revenue
```sql
SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC
```
- Top 5 Pizza by Quantity
```sql
SELECT Top 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC
```
- Bottom 5 Pizza by Quantity
```sql
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC
```
- Top 5 Pizza by Total Orders
```sql
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC
```
- Bottom 5 Pizza by Total Orders
```sql
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC
```
