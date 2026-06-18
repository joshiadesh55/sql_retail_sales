SELECT * FROM retail_sales

SELECT 
      category,
	  sum(total_sale) as net_sale,
	  COUNT(*) as total_orders
FROM retail_sales
GROUP BY 1


SELECT 
ROUND(AVG(age),2) FROM retail_sales
WHERE category = 'Beauty'


SELECT * FROM retail_sales
WHERE total_sale > 1000

SELECT 
      category,
	  gender, 
	  COUNT(*) as total_trans
FROM retail_sales
GROUP BY
       category,
	   gender
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
	  RANK() OVER(PARTITION BY EXTRACT(YEAR FROM sale_date)ORDER BY AVG(total_sale)DESC) as rank 
FROM retail_sales
GROUP BY 1,2
) as t1
WHERE rank = 1;

SELECT 
     customer_id,
	 SUM(total_sale) as total_sales
FROM retail_sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5


SELECT 
     category,
     COUNT(DISTINCT customer_id) 
FROM retail_sales
GROUP BY category 

SELECT *
    CASE
	    WHEN EXTRACT(HOUR FROM sale_time)< 12 THEN 'Morning'
		WHEN THEN 
		ELSE
	END as shift
FROM retail_sales

SELECT EXTRACT(HOUR FROM CURRENT_TIME)
 