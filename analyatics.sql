# -- Q1. Find the top 10 best-value products based on the discount percentage.

SELECT 
    name, 
    category, 
    mrp, 
    discountPercent
FROM 
    zepto_v2
ORDER BY 
    discountPercent DESC
LIMIT 10;



# -- Q2. What are the products with high MRP but are out of stock?


SELECT 
    *
FROM
    zepto_v2
WHERE
    outOfStock = 'TRUE'
ORDER BY mrp DESC;




# -- Q3. Calculate the estimated revenue for each category. 
# -- (Estimated Revenue = discountedSellingPrice * availableQuantity)

SELECT 
    category,
    SUM((discountedSellingPrice * availableQuantity)) AS Estimated_Revenue
FROM
    zepto_v2
GROUP BY category
ORDER BY Estimated_Revenue DESC;


# -- Q4. Find all products where MRP is greater than 500 and discount percentage is less than 10%.


SELECT 
    *
FROM
    zepto_v2
WHERE
    mrp > 500 AND discountPercent < 10
ORDER BY mrp DESC
;


# -- Q5. Identify the top 5 categories offering the highest average discount percentage.

SELECT 
    category, 
    ROUND(AVG(discountPercent), 2) AS Avg_Discount
FROM 
    zepto_v2
GROUP BY 
    category
ORDER BY 
    Avg_Discount DESC
LIMIT 5;

# -- Q6. Find the price per gram for products weighing above 100g
#  and sort them by best value (lowest price per gram).

SELECT DISTINCT
       name, 
    category, 
    discountedSellingPrice, 
    weightInGms, round(mrp / weightInGms,3) AS Price_Per_Grams
FROM
    zepto_v2
WHERE
    weightInGms > 100
ORDER BY Price_Per_Grams  ;


# -- Q7. Group products into size categories: Low (<=250g), Medium (251g–750g), and Bulk (>750g).


SELECT 
    name,
    category,
    discountedSellingPrice,
    weightInGms,
    CASE
        WHEN weightInGms <= 250 THEN 'LOW'
        WHEN weightInGms BETWEEN 251 AND 750 THEN 'MEDIUM'
        ELSE 'BULK'
    END AS weight_category
FROM
    zepto_v2;
    

# -- Q8. Calculate the total inventory weight per category. 
# -- (Total Inventory Weight = weightInGms * availableQuantity)


SELECT 
    category,
    ROUND(SUM(weightInGms * availableQuantity) / 1000, 2) AS Inventory_Weight_KG
FROM
    zepto_v2
GROUP BY category 
ORDER BY Inventory_weight_KG DESC ;










