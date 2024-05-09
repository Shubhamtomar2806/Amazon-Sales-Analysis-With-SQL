-- 21. Which customer type occurs most frequently?

select customer_type, count(customer_type) as frequency from amazon group by customer_type order by frequency desc limit 1;

-- 22. Identify the customer type with the highest purchase frequency.
-- in terms of quantity 
select customer_type, sum(quantity) as Total_quantity_purchase from amazon group by Customer_type order by Total_quantity_purchase desc limit 1;

-- in terms of revenue 
select customer_type, sum(total) as total_purchase_amount from amazon group by Customer_type order by total_purchase_amount desc limit 1;

-- 23. Determine the predominant gender among customers.

select customer_type, gender, count(gender) as frequency from amazon group by customer_type, gender order by frequency desc limit 2;

-- 24. Examine the distribution of genders within each branch.

select branch, gender, count(gender) as frequncy from amazon group by branch, gender order by branch ;

-- 25. Identify the time of day when customers provide the most ratings.

select time_of_day , count(rating) total_number_of_rating from amazon group by Time_of_day order by total_number_of_rating desc limit 1;

-- 26. Determine the time of day with the highest customer ratings for each branch.

select time_of_day, branch, count(rating) as Total_rating from amazon group by time_of_day, branch order by total_rating desc limit 3;

-- 27. Identify the day of the week with the highest average ratings.

select dayname, avg(rating) as average_rating from amazon group by dayname order by average_rating desc limit 1;


-- 28. Determine the day of the week with the highest average ratings for each branch.

 select dayname, branch, avg(rating) as average_rating from amazon group by dayname, branch order by average_rating desc limit 1;