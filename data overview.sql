# data overview


select zepto_v2.category , count(id) from zepto.zepto_v2 
group by category;

select name , count(id)  from zepto_v2 group by name order by count(id) desc;

start transaction;

update zepto.zepto_v2
set mrp = mrp / 100.0, discountedSellingPrice = discountedSellingPrice / 100.0;



SET sql_safe_updates = 0;




SELECT mrp, discountedSellingPrice FROM zepto.zepto_v2;
