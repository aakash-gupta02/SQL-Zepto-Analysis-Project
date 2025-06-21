# 🛒 SQL Zepto Inventory Analysis Project

Welcome to the **Zepto Inventory SQL Analysis Project**, where I dive into a retail-style dataset to generate real-world business insights using SQL.

> 🔍 **Goal**: Analyze product performance, inventory, discounts, and revenue patterns based on real-time inventory-style data similar to Zepto or BigBasket.

---

## 📁 Dataset Overview

The dataset simulates inventory data for grocery and FMCG products. Each row represents a product listing and contains:

| Column Name            | Description                                     |
|------------------------|-------------------------------------------------|
| `category`             | Product category (e.g., Snacks, Beverages)      |
| `name`                 | Product name                                    |
| `mrp`                  | Maximum retail price                            |
| `discountPercent`      | Discount on the product in %                    |
| `availableQuantity`    | Units available in inventory                    |
| `discountedSellingPrice` | Selling price after discount                |
| `weightInGms`          | Product weight in grams                         |
| `outOfStock`           | Whether the product is out of stock (TRUE/0)    |
| `quantity`             | Total quantity per order (assumed)             |

---

## 📊 Business Questions & Queries

### 🔹 Q1. Top 10 Best-Value Products (Highest Discount %)
```sql
SELECT name, category, mrp, discountPercent 
FROM zepto_v2 
ORDER BY discountPercent DESC 
LIMIT 10;
````

---

### 🔹 Q2. High MRP Products That Are Out of Stock

```sql
SELECT * 
FROM zepto_v2 
WHERE outOfStock = 'TRUE' 
ORDER BY mrp DESC;
```

---

### 🔹 Q3. Estimated Revenue Per Category

(*discountedSellingPrice × availableQuantity*)

```sql
SELECT category, 
       SUM(discountedSellingPrice * availableQuantity) AS Estimated_Revenue 
FROM zepto_v2 
GROUP BY category 
ORDER BY Estimated_Revenue DESC;
```

---

### 🔹 Q4. Premium Products with Low Discounts

(MRP > 500 AND discountPercent < 10%)

```sql
SELECT * 
FROM zepto_v2 
WHERE mrp > 500 AND discountPercent < 10 
ORDER BY mrp DESC;
```

---

### 🔹 Q5. Top 5 Categories with Highest Average Discounts

```sql
SELECT category, 
       ROUND(AVG(discountPercent), 2) AS Avg_Discount 
FROM zepto_v2 
GROUP BY category 
ORDER BY Avg_Discount DESC 
LIMIT 5;
```

---

### 🔹 Q6. Price Per Gram for Products Above 100g

(Helps find best value by weight)

```sql
SELECT DISTINCT name, category, discountedSellingPrice, weightInGms, 
       ROUND(mrp / weightInGms, 3) AS Price_Per_Grams 
FROM zepto_v2 
WHERE weightInGms > 100 
ORDER BY Price_Per_Grams;
```

---

### 🔹 Q7. Classify Products by Size

(*Low: ≤250g, Medium: 251–750g, Bulk: >750g*)

```sql
SELECT name, category, discountedSellingPrice, weightInGms,
       CASE 
         WHEN weightInGms <= 250 THEN 'LOW'
         WHEN weightInGms BETWEEN 251 AND 750 THEN 'MEDIUM'
         ELSE 'BULK'
       END AS weight_category
FROM zepto_v2;
```

---

### 🔹 Q8. Total Inventory Weight (in KG) Per Category

```sql
SELECT category, 
       ROUND(SUM(weightInGms * availableQuantity) / 1000, 2) AS Inventory_Weight_KG 
FROM zepto_v2 
GROUP BY category 
ORDER BY Inventory_Weight_KG DESC;
```

---

## 🧠 Key Learnings

* Hands-on experience with **realistic SQL analytics**
* Mastery of **GROUP BY**, **CASE**, **aggregates**, and **conditional filtering**
* Business-focused insights into product pricing, stock strategy, and revenue

---

## 📌 How to Use

1. Import the `zepto.csv` file into MySQL
2. Run the queries from [`analysis.sql`](#)
3. Explore insights and expand with visualizations in Python (optional)

---

## 🧑‍💻 Author

* **Aakash Gupta**
* GitHub: [@aakash-gupta02](https://github.com/aakash-gupta02)
* LinkedIn: [linkedin.com/in/aakash-gupta02](#)

---

## ⭐ Want More?

I’m working on more SQL + Python + MERN projects.
Stay tuned or check [my profile](https://github.com/aakash-gupta02) for updates!
