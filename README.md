# 🍕 Pizza Sales Analysis with MySQL

## 🎯 Project Objective
To perform data analysis on a pizza sales database using SQL in order to extract meaningful business insights. This includes identifying top-selling pizzas, understanding sales trends, optimizing inventory decisions, and supporting strategic planning for increased profitability.

## 🗃️ Dataset used
- <a href="https://github.com/diveshpatil01/SQL-Pizza-Sales-Analysis/blob/main/pizza_sales.csv">Dataset</a>

## 📌 KPI's
- Total Revenue Analysis
- Average Order Value Insights
- Total Pizzas Sold Assessment
- Understanding Total Orders
- Average Pizzas Per Order Calculation
- Daily and Monthly Order Trends
- Sales Breakdown by Pizza Category and Size
- Top and Bottom 5 Best Sellers Revealed

## 🧾 Process Summary
The SQL script creates and populates a pizza sales database, including tables such as pizza_sales with fields like order_id, pizza_name, order_date, quantity, and price. It involves standard SQL operations like CREATE TABLE, INSERT INTO, and SELECT for data manipulation and analysis. Key SQL functions used include SUM(), COUNT(), AVG(), and GROUP BY to calculate KPIs like total revenue, best-selling pizzas, and order trends.

To enable time-based analysis, the order_date column—originally stored as TEXT—was converted to the DATE datatype using the STR_TO_DATE() function in MySQL. This allows accurate filtering, sorting, and grouping by date for insights like daily sales and peak order times.

## 🔍 Project Insights
- Popular Pizzas: Classic and Deluxe pizzas are the most ordered.
- Top Size: Large-sized pizzas sell the most.
- Peak Hours: Most orders happen between 6 PM to 9 PM (dinner time).
- Weekend Boost: Sales are higher on weekends.
- Sales Strategies:
    - Offer combo deals or discounts during slow hours.
    - Promote best-selling pizzas with marketing.
    - Focus inventory on top categories and sizes to reduce waste and meet demand.
