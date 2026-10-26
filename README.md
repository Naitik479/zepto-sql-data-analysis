# zepto-sql-data-analysis
SQL-based exploratory data analysis of Zepto retail inventory data using MySQL. This project explores product pricing, discounts, stock availability, category-wise revenue, inventory weight, and best-value products to uncover actionable business insights.
# Zepto Inventory & Retail Data Analysis using SQL

## 📌 Project Overview

This project focuses on exploratory data analysis (EDA) of a Zepto product inventory dataset using **MySQL**. The goal is to understand product pricing, discount strategies, stock availability, inventory distribution, and category-level performance through SQL queries.

The project demonstrates how SQL can be used to clean, explore, transform, and analyze retail data to derive meaningful business insights.

## 🎯 Objectives

- Explore and understand the structure of the Zepto dataset.
- Identify missing values and investigate data quality issues.
- Analyze product and category diversity.
- Examine stock availability and out-of-stock products.
- Identify products offering the highest discounts.
- Analyze high-MRP products with relatively low discounts.
- Estimate revenue across product categories.
- Calculate inventory weight by category.
- Identify best-value products based on price per gram.

## 🛠️ Tools & Technologies

- **Database:** MySQL
- **Language:** SQL
- **Analysis techniques:** Data cleaning, aggregation, filtering, grouping, sorting, and exploratory data analysis
- **Visualization:** Charts and dashboard-style infographics based on query results

## 📂 Dataset Overview

The dataset contains the following columns:

| Column | Description |
|---|---|
| `Category` | Product category |
| `name` | Product name |
| `mrp` | Maximum retail price |
| `discountPercent` | Discount percentage |
| `availableQuantity` | Available inventory quantity |
| `discountedSellingPrice` | Selling price after discount |
| `weightInGms` | Product weight in grams |
| `outOfStock` | Stock availability indicator |
| `quantity` | Product quantity field |

### Dataset Summary

- **Total records:** 3,728
- **Unique product names:** 1,674
- **Unique categories:** 14
- **Missing values:** None found in the dataset, according to the initial checks
- **MRP data quality issue:** One record had an MRP of zero and was flagged for investigation.

## 🔍 Project Workflow

### 1. Database Setup

Created a MySQL database and selected it for analysis.

```sql
CREATE DATABASE zepto_database;
USE zepto_database;
```

### 2. Data Exploration

Inspected the dataset, counted records, reviewed column names, and examined distinct products and categories.

```sql
SELECT * FROM zepto_v1;

SELECT COUNT(*) FROM zepto_v1;

SHOW COLUMNS FROM zepto_v1;

SELECT COUNT(DISTINCT name) AS unique_products
FROM zepto_v1;

SELECT DISTINCT Category
FROM zepto_v1;
```

### 3. Data Quality Checks

Checked for missing values in important columns and investigated records with zero MRP.

```
SELECT *
FROM zepto_v1
WHERE mrp IS NULL
   OR outOfStock IS NULL
   OR quantity IS NULL;

SELECT *
FROM zepto_v1
WHERE mrp = 0;
```

The initial analysis found no missing values in the dataset. One record with zero MRP was identified for further cleaning.

### 4. Stock Availability Analysis

Examined the distribution of products by stock status.

```sql
SELECT outOfStock, COUNT(*) AS product_count
FROM zepto_v1
GROUP BY outOfStock;
```

### 5. Data Transformation

The original MRP and discounted selling price values were stored in paise. These values were converted to rupees.

```sql
UPDATE zepto_v1
SET mrp = mrp / 100.0,
    discountedSellingPrice = discountedSellingPrice / 100.0
WHERE sku_id > 0;
```

A unique auto-incrementing `sku_id` was also added to identify individual records.

### 6. Business Analysis

The project explores the following business questions through SQL:

- Which products offer the highest discount percentages?
- Which high-MRP products are currently out of stock?
- What is the estimated revenue across categories?
- Which expensive products have discounts below 10%?
- Which categories offer the highest average discounts?
- Which categories have the most unavailable products?
- Which products provide the lowest price per gram?
- How is inventory weight distributed across categories?

## 📊 Key Findings

Based on the query results:

- **3,728 records** were analyzed across 14 categories.
- **3,275 records** were marked in stock and **453** out of stock.
- The recorded stock distribution was approximately 87.85% in stock and 12.15% out of stock.
- Fruits & Vegetables had the highest average discount in the reported category comparison, at approximately 15.46%.
- Cooking Essentials and Munchies appeared among the leading categories in the reported inventory-weight and revenue results.
- Several products, including Dukes Waffy wafers, appeared among the highest-discount products.
- High-MRP products such as Dhara and Saffola oils appeared in the low-discount product analysis.

*Note: Category revenue figures are estimates derived from the analysis, not verified company financial revenue.*

## 📈 Skills Demonstrated

- MySQL database creation and table inspection
- SQL data exploration
- Data quality checks
- Data type and unit awareness
- `SELECT`, `WHERE`, `DISTINCT`, and `LIMIT`
- Aggregate functions such as `COUNT()`
- `GROUP BY` and `ORDER BY`
- `ALTER TABLE` and `UPDATE`
- Retail inventory analysis
- Translating business questions into SQL queries

## 🚀 How to Run the Project

1. Install MySQL Server and MySQL Workbench, or use another compatible MySQL client.
2. Import the Zepto dataset into a table named `zepto_v1`.
3. Open the SQL script in your MySQL client.
4. Execute the queries in order.
5. Review the output of each query and use the results to build charts or a dashboard.

**Important:** The script expects the table `zepto_v1` to exist before the analysis queries run. The dataset itself is not included in this repository unless you upload it separately.

Run the data-transformation queries carefully. The `UPDATE` statement modifies the table, so avoid running it repeatedly on already-converted values.

## 📁 Repository Structure

```text
zepto-sql-data-analysis/
│
├── README.md
├── zepto_sql.sql
├── results.pdf
└── visuals/
    └── zepto_analysis_dashboard.png
```

The structure above is a suggested layout. Add the PDF and visualization files only if you upload them to your repository.

## 🔮 Future Improvements

- Complete the SQL analysis with additional category and inventory metrics.
- Improve data validation and handle anomalous records.
- Add window functions and more advanced analytical queries.
- Build an interactive Power BI or Tableau dashboard.
- Compare category performance using clearly defined revenue and inventory metrics.

## 👨‍💻 Author

**Your Name**

B.Tech Student | Aspiring Data Analyst

---

If you find this project useful, feel free to star the repository!
