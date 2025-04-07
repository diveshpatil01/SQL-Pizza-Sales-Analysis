use pizza;

select * from pizza_sales limit 50000;

-- A) KPI's

# Total Revenue
select sum(total_price) as Total_Revenue from pizza_sales;

# Average Order Value
select (sum(total_price) / count(distinct order_id)) as Avg_Order_Value from pizza_sales;

# Total Pizza Sold
select sum(quantity) as Total_Pizza_Sold from pizza_sales;

# Total Orders
select count(distinct order_id) as Total_Orders from pizza_sales;

# Average Pizzas Per Order
select cast(cast(sum(quantity) as decimal(10,2)) / 
cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2))
as Avg_Pizzas_Per_Order from pizza_sales;

-- B) Daily Trend for Total Orders

-- str_to_date , date_format
update pizza_sales set `order_date` = replace(`order_date`,'-','/');

update pizza_sales set order_date = date_format(str_to_date(order_date,'%d/%m/%Y'),'%Y-%m-%d');

alter table pizza_sales modify column `order_date` date;

DESCRIBE pizza_sales;

select dayname(order_date) as Order_Day, count(distinct order_id) as Total_Orders
from pizza_sales
group by dayname(order_date);

-- C) Hourly Trend for Total Orders

select hour(order_time) as Order_Hours, count(distinct order_id) as Total_Orders
from pizza_sales
group by hour(order_time)
order by hour(order_time);

-- D) % of Sales by Pizza Category

select pizza_category, cast(sum(total_price) as decimal(10,2)) as Total_Revenue, 
cast(sum(total_price) * 100 / (select sum(total_price) from pizza_sales) as decimal(10,2)) as PCT 
from pizza_sales
group by pizza_category;

## If you want output for particular month/quarter you can use where clause for filtering let see

-- month wise filter
select pizza_category, cast(sum(total_price) as decimal(10,2)) as Total_Revenue, 
cast(sum(total_price) * 100 / (select sum(total_price) from pizza_sales where month(order_date) = 1) as decimal(10,2)) as PCT 
from pizza_sales
where month(order_date) = 1
group by pizza_category;

-- quarter wise filter
select pizza_category, cast(sum(total_price) as decimal(10,2)) as Total_Revenue, 
cast(sum(total_price) * 100 / (select sum(total_price) from pizza_sales where quarter(order_date) = 1) as decimal(10,2)) as PCT 
from pizza_sales
where quarter(order_date) = 1
group by pizza_category;

-- E) % of Sales by Pizza Size

select pizza_size, cast(sum(total_price) as decimal (10,2)) as Total_Revenue, 
cast(sum(total_price) * 100 / (select sum(total_price) from pizza_sales) as decimal(10,2)) as PCT
from pizza_sales
group by pizza_size
order by pizza_size;

-- F) Total Pizza Sold by Pizza Category

select pizza_category, sum(quantity) as Total_Quantity_Sold 
from pizza_sales
group by pizza_category
order by Total_Quantity_Sold desc;

-- G) Top 5 Best Sellers by Total Pizzas Sold

select pizza_name, sum(quantity) as Total_Pizzas_Sold from pizza_sales
group by pizza_name
order by Total_Pizzas_Sold desc
limit 5;

-- H) Bottom 5 Worst Sellers by Total Pizzas Sold

select pizza_name, sum(quantity) as Total_Pizzas_Sold from pizza_sales
group by pizza_name
order by Total_Pizzas_Sold
limit 5;