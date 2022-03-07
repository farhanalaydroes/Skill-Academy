-- Skill Academy SQL --

-- Materi 1 --

SELECT * 
FROM products

SELECT * 
FROM products
LIMIT 3

SELECT name, category
FROM products

SELECT category
FROM products

SELECT DISTINCT category
FROM products

SELECT *
FROM products
WHERE category = 'Handphone'


SELECT *
FROM products
WHERE stock >= 3

SELECT *
FROM products
WHERE stock > 3


SELECT *
FROM products
WHERE stock <= 3

SELECT *
FROM products
WHERE stock < 3

SELECT * 
FROM products
WHERE category IN ('Handphone','Computer')

SELECT * 
FROM products
WHERE name like 'laptop%'

SELECT *
FROM products
WHERE category = 'Handphone' AND stock > 5

SELECT *
FROM products
WHERE category = 'Handphone' OR stock > 5

SELECT *
FROM products
WHERE category = 'Computer'
AND name NOT like 'laptop%'

-- Materi 2 --

SELECT * 
FROM products
ORDER BY stock ASC

SELECT * 
FROM products
ORDER BY stock DESC

SELECT * 
FROM products
ORDER by price DESC
LIMIT 5

SELECT COUNT(category)
FROM products

SELECT MIN(stock),MAX(stock),SUM(stock),AVG(stock)
FROM products

SELECT category, COUNT(*) as n_products, SUM(stock) as total stock, AVG(price) as avg_Price
FROM products 
GROUP BY category

SELECT category,
	CASE
		WHEN price > 10000000 THEN 'Very Expensive'
		WHEN price > 50000000 THEN 'Expensive'
		ELSE 'Cheap'
	END AS price_type,
	COUNT(*) as n_products
	SUM(stock) as total_stock
FROM products
GROUP by category,price_type


-- Materi 3 --

SELECT * 
FROM products
WHERE category = 'Handphone'
UNION
SELECT * 
FROM products
WHERE price > 5000000
ORDER BY products_id

SELECT product_id,'products' as product_type,name,category
FROM products
UNION
SELECT product_id,'virtual_products' as product,name,category
FROM virtual_products

SELECT t.*,p.name as product_name
FROM transactions t
JOIN products p ON t.product_id = p.product_id AND t.product_type = 'products'

SELECT t.*,p.name as product_name
FROM transactions t
LEFT JOIN products p ON t.product_id = p.product_id AND t.product_type = 'products'

SELECT t.*,ap.name as product_name
FROM transactions t
JOIN
(SELECT product_id,'products' as product_type,name,category
FROM products
UNION
SELECT product_id,'virtual_products' as product,name,category
FROM virtual_products
) ap on ap.product_id = t.product_id AND ap.product_type = t.product_type



