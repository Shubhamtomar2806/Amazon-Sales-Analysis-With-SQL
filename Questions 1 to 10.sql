SELECT 
    *
FROM
    amazon;


-- 1. What is the count of distinct cities in the dataset?
SELECT 
    city, COUNT(DISTINCT city) AS count_distinct_city
FROM
    amazon
GROUP BY city
ORDER BY count_distinct_city DESC;

-- 2. For each branch, what is the corresponding city?
select branch, max(city) as coressponding_city from amazon group by branch;


-- 3.What is the count of distinct product lines in the dataset?
select count(distinct product_line) as distinct_product_line from amazon;

select product_line, count(distinct product_line) as count_of_distinct_product_line from amazon group by product_line;

-- 4. Which payment method occurs most frequently?
select payment, count(payment) as most__frequently_used_payment_method from amazon group by payment order by most__frequently_used_payment_method desc limit 1;

--  5. Which product line has the highest sales?

-- in terms of quantity

select product_line, sum(quantity) as highest_product_line_quantity_sales
  from amazon group by product_line order by highest_product_line_quantity_sales desc limit 1;
  
  -- In terms amaount
  select Product_line, sum(total) as total_sales from amazon group by Product_line order by total_sales desc limit 1;

-- 6. How much revenue is generated each month?
select count(distinct month_name) from amazon;

select month_name, sum(total) as total_revenue from amazon group by month_name order by total_revenue desc;

-- 7. In which month did the cost of goods sold reach its peak?

select month_name, sum(cogs) as highest_cogs from amazon group by month_name order by highest_cogs desc limit 1;

-- 8. Which product line generated the highest revenue?

select product_line, sum(total) as highest_revenue from amazon group by product_line order by highest_revenue desc limit 1;


-- 9. In which city was the highest revenue recorded?

select city, sum(total) as highest_revenue from amazon group by city order by highest_revenue desc limit 1;

-- 10. Which product line incurred the highest Value Added Tax?

select product_line, sum(VAT) as highest_VAT from amazon group by product_line order by highest_VAT desc limit 1;
