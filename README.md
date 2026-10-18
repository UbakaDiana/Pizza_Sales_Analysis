# Pizza Sales Analysis
## Project Overview

This project explores pizza sales data using SQL to uncover sales trends, customer ordering patterns, and revenue performance across different pizza types, sizes, and categories.
The analysis focuses on answering business questions that can help a pizza business understand which products sell the most, when customers place orders, and which pizza categories contribute most to revenue.
Using SQL Server, I queried and combined data from multiple tables to generate insights into order volumes, product performance, and revenue distribution.

## Business Objectives
The objectives of this project were to:
* Measure overall order volume and total revenue.
* Identify the highest-priced pizza and the most commonly ordered pizza size.
* Determine the best-selling pizza types and categories by quantity.
* Analyze order distribution by hour of the day.
* Evaluate the percentage contribution of pizza categories to total revenue.
* Rank the top-performing pizza types by revenue within each category.
  
## Business Questions
This analysis answers the following questions:
1. How many orders were placed in total?
2. How much revenue was generated from pizza sales?
3. Which pizza has the highest price?
4. Which pizza size is ordered most frequently?
5. What are the five most ordered pizza types by quantity?
6. Which pizza categories have the highest total quantity ordered?
7. At what hours of the day are orders most frequently placed?
8. What percentage of total revenue does each pizza category contribute?
9. What are the top three pizza types by revenue within each category?
    
## SQL Analysis and Techniques
The project uses SQL Server to query the sales database and answer the business questions.
1. Order Volume and Revenue Analysis
* Used COUNT() to calculate the total number of orders.
* Used SUM() to calculate total revenue from pizza quantities and prices.
2. Product and Pricing Analysis
* Used TOP and ORDER BY to identify the highest-priced pizza.
* Used GROUP BY and COUNT() to determine the most commonly ordered pizza size.
* Used aggregate functions to identify the top five pizza types by quantity sold.
3. Category Performance Analysis
* Aggregated pizza quantities by category to compare product demand.
* Calculated each category’s percentage contribution to total revenue.
4. Ordering Time Analysis
* Used DATEPART(HOUR, ...) to extract the hour from each order’s time.
* Grouped orders by hour to examine when orders were most frequently placed.
5. Revenue-Based Ranking
* Used Common Table Expressions (CTEs) to calculate revenue by pizza type and category.
* Applied the DENSE_RANK() window function with PARTITION BY to rank pizza types within each category.
* Retrieved the top three ranked pizza types in each category based on revenue.
  
## SQL Concepts Demonstrated
* Aggregate functions: COUNT(), SUM(), and ROUND()
* Data joins: INNER JOIN and JOIN
* Data grouping and sorting: GROUP BY and ORDER BY
* Filtering results with TOP
* Date and time analysis using DATEPART()
* Data type conversion using CAST()
* Scalar subqueries
* Common Table Expressions (CTEs)
* Window functions: DENSE_RANK()
* Percentage calculations and revenue analysis

## Tool Used
* Microsoft SQL Server

## Business Value
The analysis demonstrates how sales data can support practical business decisions, including:
* Identifying popular products to inform inventory and ingredient planning.
* Understanding peak ordering hours to support staffing and order management.
* Comparing pizza categories to understand differences in product demand.
* Identifying high-revenue products to support menu and promotional decisions.
* Understanding the relationship between product popularity and revenue contribution.
These insights can help management make more informed decisions about product availability, sales strategies, and operational planning.

## Conclusion
This project demonstrates the use of SQL to transform raw sales records into business-relevant insights. By combining data from orders, order details, pizzas, and pizza types, I explored order volume, revenue, product popularity, and ordering patterns.
The project also provided practical experience with multi-table joins, aggregate functions, subqueries, CTEs, and window functions to solve business questions using SQL.

