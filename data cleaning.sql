 #  checking missing data
 
SELECT * 
FROM zepto.zepto_v2
WHERE 
  zepto_v2.`ï»¿Category` IS NULL 
  OR zepto_v2.name IS NULL
  OR zepto_v2.mrp IS NULL
  OR zepto_v2.discountPercent IS NULL
  OR zepto_v2.availableQuantity IS NULL
  OR zepto_v2.discountedSellingPrice IS NULL
  OR zepto_v2.weightInGms IS NULL
  OR zepto_v2.outOfStock IS NULL
  OR zepto_v2.quantity IS NULL;
  
  
  
  alter table zepto_v2
  change column `ï»¿Category` category VARCHAR(120);
  
  
  select * from zepto_v2;
 