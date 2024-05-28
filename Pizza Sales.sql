use Pizzadb

select * from pizza_sales

select SUM(total_price) as total_sales from pizza_sales --Total Revenu


select SUM(total_price) / COUNT(distinct order_id)
as avg_order_value from pizza_sales --Average Order value

select SUM(quantity) as Total_Quantity_Sold from pizza_sales --Total Pizza Quantity Sold

select COUNT(distinct order_id) from pizza_sales --Total Orders

select cast(cast(SUM(quantity) as decimal (10,2)) / 
cast(COUNT(distinct order_id) as decimal(10,2))
as decimal (10,2)) as avg_pizza_per_order from pizza_sales --avg pizza per order

select DATENAME(DW,order_date) as Day_Name, count(distinct order_id) as Total_Orders
from pizza_sales group by DATENAME(DW,order_date) -- Daily Trend for total Orders

select DATENAME(month, order_date) as Month_Name, COUNT(distinct order_id)
as Total_Orders from pizza_sales
GROUP BY DATENAME(month, order_date)
order by Total_Orders desc -- Monthly Trend for total Orders

select pizza_category, SUM(total_price) * 100 /
(select SUM(total_price) from pizza_sales) as Percentage_
from pizza_sales
group by pizza_category -- percenatge of sales by pizza category

select pizza_size, SUM(total_price)  * 100 /
(select SUM(total_price) from pizza_sales) as Percentage_
from pizza_sales
group by pizza_size order by Percentage_ desc -- percenatge of sales by pizza size


select pizza_category, SUM(quantity)
as total_quantity_sold from pizza_sales
group by pizza_category order by total_quantity_sold desc -- Total quantity sold by pizza category

select top 5 pizza_name, SUM(total_price)
as total_revenue from pizza_sales
group by pizza_name
order by total_revenue desc -- Top 5 best selling pizza by revenue

select top 5 pizza_name, SUM(total_price)
as total_revenue from pizza_sales
group by pizza_name
order by total_revenue asc -- Bottom 5 selling pizza by revenue

select top 5 pizza_name, SUM(quantity)
as total_quantity_sold from pizza_sales
group by pizza_name
order by total_quantity_sold desc -- Top 5 best selling pizza by quantity

select top 5 pizza_name, SUM(quantity)
as total_quantity_sold from pizza_sales
group by pizza_name
order by total_quantity_sold asc -- Bottom 5  selling pizza by quantity

select top 5 pizza_name, COUNT(distinct order_id)
as total_orders from pizza_sales
group by pizza_name
order by total_orders desc -- Top 5 best selling pizza by orders

select top 5 pizza_name, COUNT(distinct order_id)
as total_orders from pizza_sales
group by pizza_name
order by total_orders asc -- Bottom 5 selling pizza by orders