# Online Bookstore SQL Analysis

## Project Overview
This project presents a complete SQL-based analysis for an online bookstore. It covers relational database design, importing structured datasets, and executing a range of SQL queries to extract valuable business insights.

### Key Components
- Tables: Books, Customers, Orders (Normalized schema)
- Data Size: 500+ books, 400+ customers, 450+ orders
- Tools Used: SQL Server Management Studio (SSMS), SQL (DDL, DML, Views, Window Functions)

## Business Insights
- Total revenue generated: ₹75,393
- Top customer identified: Kim Turner with ₹1,396 spent
- Fantasy emerged as the highest-selling genre
- Customers segmented into Premium, Regular, and Basic categories based on lifetime spend using CASE logic
- Inventory status calculated by analyzing remaining stock after fulfilling orders
- Revenue trends tracked over time using running totals by genre with window functions

## SQL Skills Demonstrated
- Joins: INNER JOIN, LEFT JOIN, RIGHT JOIN
- Aggregations and filtering using GROUP BY and HAVING
- Use of subqueries and views for reusable logic
- Window functions such as RANK and SUM OVER for trend analysis
- Conditional statements using CASE WHEN
- Date calculations using GETDATE, DATEDIFF, and DATEADD

## Project Goals
- Design and implement a relational database schema
- Analyze sales data, customer behavior, and inventory levels
- Solve real-world business problems through SQL
- Segment customers and evaluate performance metrics

## How to Use
1. Open the `sql code.sql` file in SQL Server Management Studio (SSMS)
2. Run the script block by block to review results
3. Modify queries for deeper exploration and practice

## Recommendations
- Prioritize marketing for high-performing genres like Fantasy
- Engage Premium customers with loyalty programs and personalized offers
- Monitor inventory for frequently ordered books to improve stock management

## Outcome
This project demonstrates how structured data and SQL logic can be applied to solve real-world business problems. It showcases strong SQL skills in data modeling, query writing, and analytical thinking for e-commerce analytics.
