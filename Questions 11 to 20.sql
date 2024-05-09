-- 111. For each product line, add a column indicating "Good" if its sales are above average, otherwise "Bad."
SELECT 
    product_line, total, average_sales,
    CASE WHEN total > average_sales THEN 'good' ELSE 'bad' END AS Sales_rating 
    FROM (SELECT  product_line, total, (SELECT  AVG(total) FROM amazon) AS average_sales FROM amazon) AS subquery; 
    
    -- 12. Identify the branch that exceeded the average number of products sold.
SELECT branch, sum(quantity) as total_quantity_sold
FROM amazon group by branch having total_quantity_sold > (select avg(quantity) from amazon);

-- 13. Calculate the average rating for each product line.

select product_line, avg(rating) as average_rating from amazon group by Product_line;

-- 14. Which product line is most frequently associated with each gender?


select product_line, gender, count(*) as frequency from amazon group by Product_line, gender 
having frequency = (select max(frequency) from (select product_line, gender, count(*) as frequency from amazon group by Product_line, gender) as subquery
where subquery.gender=amazon.gender);

-- 15. Count the sales occurrences for each time of day on every weekday.

-- In terms of quantity 
select  dayname, time_of_day, sum(quantity) from amazon group by dayname, time_of_day order by dayname;

-- in terms of revenue 
select dayname, time_of_day, sum(total) from amazon group by dayname, time_of_day order by dayname;

-- 16. Identify the customer type contributing the highest revenue.
select customer_type, sum(total) as total_revenue from amazon group by Customer_type order by total_revenue desc limit 1;

-- 17. Determine the city with the highest VAT percentage.

select city, (sum(VAT)/sum(total))*100 as Highest_VAT_percentage from amazon group by city order by Highest_VAT_percentage desc limit 1;

-- 18. Identify the customer type with the highest VAT payments.

select customer_type , sum(VAT) as total_VAT from amazon group by Customer_type order by total_VAT desc limit 1 ; 

-- 19. What is the count of distinct customer types in the dataset?

select count(distinct customer_type) as distinct_customer_type from amazon;

-- 20. What is the count of distinct payment methods in the dataset?

select count(distinct payment) as total_payment_methods from amazon;
