CREATE DATABASE pizza;
USE pizza;
SELECT * from pizzas;

/*analisando os kpis para os dados de vendas das piszzas, para tirar insights sobre a perfomance no negocio*/
/* especificamente vamos calular as seguintes metricas:*/

/*1. Total Revenue: Soma do total do preço de todos os pedidos de pizza*/

SELECT SUM(total_price) as 'Total_Revenue' 
FROM pizzas;

/*2. Average Order Value:media do total gasto por ordem, divide total_revenue pelo total de numero de ordens */

SELECT (SUM(total_price) / COUNT(distinct order_id )) AS 'Avg_order_Value'
FROM pizzas;

/*3. Total Pizzas Sold*/

SELECT SUM(quantity)
FROM pizzas;

/*4. Total Orders*/

SELECT COUNT(distinct order_id) AS Total_Orders
FROM pizzas;


/*5. Average Pizzas Per Order: total de pizzas / total de ordens*/

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizzas;

/* calculadondo varios aspectos dos dados de vendas das pizzas*/

/*1. Daily Trend for Total Orders: total de de ordens por dias */

SELECT DAYNAME(order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizzas
GROUP BY DAYNAME(order_date);


select DAyname(MONTH, order_date) as Month_Name, COUNT(DISTINCT order_id) as Total_Orders
from pizzas
GROUP BY dayname(MONTH, order_date);









