use Amazon_database;
create table amazon (
Invoice_ID varchar(30) NOT NULL,
Branch varchar(10) NOT NULL,
City varchar(30) not null,
Customer_type varchar(30) not null,
Gender varchar(10) not null,
Product_line varchar(100) not null,
Unit_price decimal(10,2) not null,
Quantity int not null,
VAT float not null,
Total decimal(10,2) not null,
Date date not null,
Time time not null,
Payment varchar(50) not null,
cogs decimal(10,2) not null,
gross_margin_percentage float not null,
gross_income decimal(10,2) not null,
rating float not null
);



SELECT * FROM amazon_database.amazon;

-- there is no duplicate value in this data.
select Invoice_ID, count(*) from amazon group by Invoice_ID having count(*)>1;

-- There is no null value in this data.
select * from amazon
where Invoice_ID is null
or Branch is null
or City is null
or 'Customer type' is null 
or Gender is null
or Product_line is null 
or Unit_price is null
or Quantity is null
or 'Tax_5%' is null
or Total is null
or 'Date' is null
or 'Time' is null
or Payment is null
or cogs is null
or gross_margin_percentage is null
or gross_income is null
or Rating is null;


use amazon_database;
select * from amazon;

alter table amazon
add column time_of_day varchar(30);
-- Add a new column named timeofday to give insight of sales in the Morning, Afternoon and Evening.
-- This will help answer the question on which part of the day most sales are made.
update amazon
set time_of_day = 
      case when time(time) between '00:00:00' and '11:59:59' then 'Morning'
           when time(Time) between '12:00:00' and '17:59:59' then 'Evening'
           else 'Night'
      end;

--  Add a new column named dayname that contains the extracted days of the week on which the given transaction
--  took place (Mon, Tue, Wed, Thur, Fri). This will help answer the question on which week of the day each branch
--  is busiest.

alter table amazon
add column dayname varchar(3);

update amazon
set dayname = date_format(Date,'%a');

select * from amazon;

-- Add a new column named monthname that contains the extracted months of the year on which the given transaction
-- took place (Jan, Feb, Mar). Help determine which month of the year has the most sales and profit.

alter table amazon
add column month_name varchar(3);
alter table amazon
drop month_name;
update amazon
set month_name = substring(monthname(Date),1,3);

select * from amazon;



