USE restaurant_db;

-- Objective 1 : Exploring the menu_items table

-- 1. View the menu_items table
SELECT * FROM menu_items;


-- 2. Find the number of items on the menu
SELECT COUNT(*) FROM menu_items;


-- 3. What are the least and most expensive items on the menu?
SELECT * FROM menu_items
ORDER BY price LIMIT 1;  -- LEAST EXPENSIVE

SELECT * FROM menu_items
ORDER BY price DESC LIMIT 1;  -- MOST EXPENSIVE


-- 4. How many Italian dihes are o the menu?
SELECT COUNT(*) FROM menu_items
WHERE category = 'Italian';


-- 5. What are the least and most expensive Italian dishes on the menu? 
SELECT *
FROM menu_items
WHERE category = 'Italian'
ORDER BY price;


-- 6. How many dishes are in each category?
SELECT category, COUNT(menu_item_id) as num_dishes
FROM menu_items
GROUP BY category;


-- 7. What is the average dish price within each category?
SELECT category, AVG(price) as avg_price
FROM menu_items
GROUP BY category;