
-- Objective 3 : Analyzing the Customer Behavior

-- 1. Combining the menu_items and ordere_details tables into a single table.
SELECT * FROM menu_items;
SELECT * FROM order_details;

SELECT *
FROM order_details od LEFT JOIN menu_items mi 
	 ON od.item_id = mi.menu_item_id;
 

-- 2. What were the least and most ordered items? What categories were they in?
SELECT item_name, category, COUNT(order_details_id) as num_purchases
FROM order_details od LEFT JOIN menu_items mi 
	 ON od.item_id = mi.menu_item_id
GROUP BY item_name, category
ORDER BY num_purchases DESC;


-- 3. What are the top 5 orders that spent the most money?
SELECT order_id, SUM(price) AS total_spend
FROM order_details od LEFT JOIN menu_items mi 
	 ON od.item_id = mi.menu_item_id
GROUP BY order_id
ORDER BY total_spend DESC 
LIMIT 5;


-- 4. View the details of the highest spend order. What insights can you gather from the results?
SELECT category, COUNT(item_id) AS num_items
FROM order_details od LEFT JOIN menu_items mi 
	 ON od.item_id = mi.menu_item_id
WHERE order_id = 440    -- top spend order id
GROUP BY category;


-- 5. Viewing the results of the top 5 highest spend orders. Insights I've gathered from the results..
SELECT order_id, category, COUNT(item_id) AS num_items
FROM order_details od LEFT JOIN menu_items mi 
	 ON od.item_id = mi.menu_item_id
WHERE order_id IN (440, 2075, 1957, 330, 2675)
GROUP BY order_id, category;

-- So, from the top 5 orders I can see that, customers tend to spend more likely on Italian dishes
-- So, the Insight I've gathered here is, we should keep thsese expensive Italian dishes on our menu as customers see to be ordering them alot,
-- Especially our Highest Spend Customers  
