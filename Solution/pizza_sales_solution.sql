--Retrieve the total number of orders placed.
SELECT COUNT (*) total_number_of_orders
FROM orders;

--Calculate the total revenue generated from pizza sales.
SELECT SUM(od.quantity * CAST (p.price AS DECIMAL (10,2))) total_revenue
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id;

--Identify the highest-priced pizza.
SELECT TOP (1) pt.name, size, CAST(price AS DECIMAL (10,2)) pizza_price
FROM pizzas p
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
ORDER BY pizza_price DESC;

--Identify the most common pizza size ordered.
SELECT TOP (1) size, COUNT (size) no_of_order
FROM pizzas
GROUP BY size
ORDER BY no_of_order DESC;

--List the top 5 most ordered pizza types along with their quantities.
SELECT TOP (5) pt.name, SUM (CAST (od.quantity AS INT)) no_of_quantity
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY no_of_quantity DESC;

--Find the total quantity of each pizza category ordered.
SELECT pt.category, SUM (CAST(od.quantity AS INT)) total_quantity
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.category
ORDER BY total_quantity DESC;

--Determine the distribution of orders by the hour of the day.
SELECT DATEPART(HOUR,o.time) hour_of_day, COUNT (od.quantity) quantity
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
GROUP BY DATEPART(HOUR,o.time)
ORDER BY hour_of_day

--Find the category-wise distribution of pizzas.
SELECT pt.category, SUM (CAST(od.quantity AS INT)) total_quantity
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.category
ORDER BY total_quantity DESC;

--Calculate the percentage contribution of each pizza type to the total revenue.
SELECT pt.category, ROUND((SUM(od.quantity * CAST (price AS DECIMAL (10,2))) / 
					(SELECT SUM(quantity * CAST (price AS DECIMAL (10,2))) total_reveue
					FROM order_details
					JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id)) * 100 , 2) percentage_revenue
FROM order_details od
INNER JOIN pizzas p ON od.pizza_id = p.pizza_id
INNER JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.category;

--Determine the top 3 most ordered pizza types based on revenue for each pizza category.
WITH pizza_revenue AS (
		SELECT pt.name pizza_type, pt.category, SUM(od.quantity * CAST(p.price AS DECIMAL (10,2))) revenue
		FROM order_details od
		INNER JOIN pizzas p ON od.pizza_id = p.pizza_id
		INNER JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
		GROUP BY pt.name, pt.category),

ranked_pizza AS (
		SELECT pizza_type, category, revenue, DENSE_RANK() OVER (PARTITION BY category ORDER BY revenue DESC) AS rank_num 
		FROM pizza_revenue)

SELECT category, pizza_type, revenue, rank_num
FROM ranked_pizza
WHERE rank_num <= 3
ORDER BY category, revenue DESC;



