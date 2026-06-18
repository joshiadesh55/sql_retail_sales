CREATE TABLE 
(
    transactions_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
 customer_id INT,
 gender VARCHAR(50),
 age INT,
 category VARCHAR(50),
 quantiy INT,
 price_per_unit_cogs FLOAT
 total_sale FLOAT
);

SELECT COUNT(*) FROM retail_sales
LIMIT110

SELECT * FROM retail_sales
WHERE quantity IS NULL
OR
sale_date IS NULL
OR
sale_time IS NULL
OR
customer_id IS NULL
OR
gender IS NULL
OR
age IS NULL
OR
category IS NULL
OR
quantity IS NULL
OR
price_per_unit_cogs IS NULL
OR
cogs IS NULL
OR
total_sale IS NULL;
	
--How many sales we have?
SELECT COUNT(*) as total_sale FROM retail_sales

--How many customers we have?
SELECT COUNT(customer_id) AS total_sale FROM retail_sales

--How many unique customers we have?
SELECT COUNT(DISTINCT customer_id) AS total_sale FROM retail_sales

SELECT DISTINCT category FROM retail_sales

--Data analysis and buisness key problem & answer?
	
--1. Write a sql query to retieve all column for sales mode on 2022-11-05?
```sql
SELECT * FROM retail_sales
WHERE sale_date = '2022-11-05'
...
	
--2. Write a sql query to retrieve all transaction where the category is 'clothing' and the quantity sold is more than 10 in the month of nov-2022 ?
```sql
SELECT * 
FROM retail_sales
WHERE category = 'Clothing'
	   AND TO_CHAR(sale_date, 'YYYY-MM') = '2022-11'
	   AND quantity >= 4;
...
	
--3. write a sql querry to calculate the total sales(total_sale) for each category.
```sql
SELECT 
      category,
	  sum(total_sale) as net_sale,
	  COUNT(*) as total_orders
FROM retail_sales
GROUP BY 1
...
	
--4. Write a SQL query to find the average age of customers who purchased items from the 'beauty' category.
```sql
SELECT 
	ROUND(AVG(age),2) as avg_age
	FROM retail_sales
WHERE category = 'Beauty'
...

--5. Write a SQL query to find all transactions where the total_sale is greater than 1000
```sql
SELECT * FROM retail_sales
WHERE total_sale > 1000
...

--6. Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
```sql
SELECT 
      category,
	  gender, 
	  COUNT(*) as total_trans
FROM retail_sales
GROUP BY
       category,
	   gender
ORDER BY 1
...
	
--7. Write a SQL query to calculate the average sale for each month. Find out best selling month in each year.
```sql
SELECT 
      year,
	  month,
	  avg_sale
FROM 
(
SELECT 
      EXTRACT(YEAR FROM sale_date) as year,
	  EXTRACT(month FROM sale_date) as month,
	  AVG(total_sale) as avg_sale,
	  RANK()OVER(PARTITION BY EXTRACT(YEAR FROM sale_date)ORDER BY AVG(total_sale)DESC) as rank 
FROM retail_sales
GROUP BY 1,2
) as t1
WHERE rank = 1;
...

--8. Write a SQL query to find the top 5 customers based on the highest total sales.
```SQL
SELECT 
     customer_id,
	 SUM(total_sale) as total_sales
FROM retail_sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5
...
	
--9. Write a SQL query to find the number of unique customers who purchased items from each other category.	
```sql
SELECT 
     category,
     COUNT(DISTINCT customer_id) 
FROM retail_sales
GROUP BY category 
...
	
--10. Order analysis by shift (Morning, Afternoon, Evening). 	
```sql
SELECT *
    CASE
	    WHEN EXTRACT(HOUR FROM sale_time)< 12 THEN 'Morning'
		WHEN THEN 
		ELSE
	END as shift
FROM retail_sales
...
