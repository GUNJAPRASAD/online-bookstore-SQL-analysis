
##  Executive Summary

This project demonstrates a complete **data analytics workflow** for an online bookstore using **SQL**. It includes designing a relational database schema, importing real-world-like datasets, and running a wide range of queries to extract meaningful business insights.

Three main entities—**Books**, **Customers**, and **Orders**—were modeled using normalized SQL tables. The datasets contain over 400 customer records, 500 books, and 450+ sales transactions across different countries and genres. Once the data was structured, a series of both basic and advanced SQL queries were applied to simulate day-to-day business questions faced by online retailers.

Key analytical goals included identifying **top-selling genres**, **highest spending customers**, **revenue trends**, and **inventory forecasting**. Complex queries using **aggregations, joins, subqueries, views, and window functions** were performed to answer questions such as:

- Which customers are classified as *Premium* based on lifetime spend?
- What is the *running total of revenue* by genre?
- Which books are *ordered more than average*?
- How much *stock remains* after fulfilling current orders?

The project also involved:
- Creating a **view** to display customer-order-book information for reporting
- Using **CASE statements** for customer segmentation
- Leveraging **window functions** to rank and track trends
- Performing **date-based filtering** to analyze recent activity and time since order

##  Skills Demonstrated
- **Database Design (ER Modeling)**
- **SQL Query Writing**
- **Data Aggregation & Transformation**
- **Business Problem Solving with Data**
- **Customer Segmentation Logic**
- **Window Functions & Views**

##  Outcome
This project simulates the analytical needs of an e-commerce company and showcases how structured data and SQL logic can uncover patterns that support **data-driven decision-making**.


## Overview
This project involves designing a database schema for an **online bookstore** and performing **SQL queries** to analyze sales, customer behavior, book inventory, and revenue. The project includes basic to advanced SQL queries covering data retrieval, aggregation, window functions, views, and classification.

##  Tools & Technologies
- SQL Server Management Studio (SSMS)
- SQL (DDL, DML, Aggregates, Joins, Views, Window Functions)

##  Objectives
- Build relational database tables: `Books`, `Customers`, and `Orders`
- Run queries to analyze sales performance, customer segmentation, and inventory
- Practice real-world business scenarios using SQL

##  Tables Created
- **Books**: Stores book details such as title, author, genre, price, stock  
- **Customers**: Contains customer information including location  
- **Orders**: Records purchase data including book, customer, date, quantity, and total amount  

## Sample Queries & Insights

###  Basic Queries
- List all books in a genre (e.g., `Fiction`)
- Find books published after a certain year
- Retrieve customer info from a specific country

###  Sales & Revenue
- Calculate total revenue and monthly sales
- Identify most expensive books and top-selling genres
- Show orders exceeding certain value (e.g., ₹20+)

### 📈 Advanced Analytics
- Rank customers based on purchase volume  
- Create views for customer order summaries  
- Classify customers as Premium, Regular, or Basic  
- Analyze stock remaining after sales  
- Find frequently ordered books and seasonal trends  

## ✅ Example Results

| Query Type               | Insight                                 |
|--------------------------|------------------------------------------|
| Total Revenue            | ₹75,393                                |
| Top Customer             | "Kim Turner" - ₹1396 spent               |
| Top Genre by Sales       | "Fantasy"                                |
| Running Total by Genre   | Window function used                     |
| Customer Type Logic      | CASE WHEN on total spending              |

##  Key SQL Concepts Practiced
- **DDL & DML Statements**
- **INNER JOIN / LEFT JOIN / RIGHT JOIN**
- **GROUP BY / HAVING**
- **Window Functions** (e.g., `RANK`, `SUM OVER`)
- **Subqueries**
- **Views & Indexes**
- **Date Functions** (e.g., `GETDATE`, `DATEDIFF`, `DATEADD`)
- **CASE WHEN Logic**

##  How to Run
1. Open the `.sql` file in **SQL Server Management Studio** (SSMS)
2. Execute each block step by step
3. Review outputs and tweak queries for further learning

##  Outcome
This project simulates real-world retail analysis using SQL, helping improve skills in:
- Data modeling
- Analytical thinking
- Query writing for reporting & decision-making
