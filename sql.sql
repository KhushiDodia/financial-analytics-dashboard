CREATE TABLE cafe_sales ( 
	transaction_id TEXT, 
	item TEXT, quantity NUMERIC, 
	price_per_unit NUMERIC, 
	total_spent NUMERIC, 
	payment_method TEXT, 
	location TEXT, 
	transaction_date DATE ); 

SELECT * FROM cafe_sales LIMIT 10;

 -- Monthly revenue trend 
SELECT DATE_TRUNC('month', 'transaction_date') AS month, 
 	SUM(total_spent) AS revenue 
	FROM cafe_sales 
	GROUP BY month 
	ORDER BY month;

-- Revenue by item 
SELECT item, SUM(total_spent) AS revenue 
	FROM cafe_sales GROUP BY item 
	ORDER BY revenue DESC;

-- Revenue by location 
SELECT location, 
	SUM(total_spent) AS revenue 
	FROM cafe_sales GROUP BY location 
	ORDER BY revenue DESC;


-- Revenue by payment method 
SELECT payment_method, 
	SUM(total_spent) AS revenue 
	FROM cafe_sales GROUP BY payment_method 
	ORDER BY revenue DESC;
	