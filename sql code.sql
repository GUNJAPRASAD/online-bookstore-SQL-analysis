-- Create Database
CREATE DATABASE OnlineBookstore;

-- Use the database
USE OnlineBookstore;

-- Drop Tables if they exist
DROP TABLE IF EXISTS Books;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Orders;

-- Create Tables
CREATE TABLE Books (
    Book_ID INT IDENTITY(1,1) PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price NUMERIC(10, 2),
    Stock INT
);

CREATE TABLE Customers (
    Customer_ID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);

CREATE TABLE Orders (
    Order_ID INT IDENTITY(1,1) PRIMARY KEY,
    Customer_ID INT FOREIGN KEY REFERENCES Customers(Customer_ID),
    Book_ID INT FOREIGN KEY REFERENCES Books(Book_ID),
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10, 2)
);

-- Sample Queries

-- 1. Retrieve all Fiction books
SELECT * FROM Books
WHERE Genre = 'Fiction';

-- 2. Books published after 1950
SELECT * FROM Books
WHERE Published_Year > 1950;

-- 3. Customers from Canada
SELECT * FROM Customers
WHERE Country = 'Canada';

-- 4. Orders placed in November 2023
SELECT * FROM Orders
WHERE MONTH(Order_Date) = 11 AND YEAR(Order_Date) = 2023;

-- 5. Total stock of books available
SELECT SUM(Stock) AS Total_Stock
FROM Books;

-- 6. Most expensive book
SELECT TOP 1 * FROM Books
ORDER BY Price DESC;

-- 7. Customers who ordered more than 1 quantity
SELECT C.Name, O.Quantity
FROM Customers C
JOIN Orders O ON C.Customer_ID = O.Customer_ID
WHERE O.Quantity > 1;

-- 8. Orders where total amount exceeds $20
SELECT * FROM Orders
WHERE Total_Amount > 20;

-- 9. List all genres with book count
SELECT Genre, COUNT(Book_ID) AS Book_Count
FROM Books
GROUP BY Genre;

-- 10. Book with the lowest stock
SELECT TOP 1 * FROM Books
ORDER BY Stock ASC;

-- 11. Total revenue
SELECT SUM(Total_Amount) AS Total_Revenue
FROM Orderss;

-- Advanced Analysis

-- 1. Total books sold per genre
SELECT B.Genre, SUM(O.Quantity) AS Quantity_Sold
FROM Books B
JOIN Orders O ON B.Book_ID = O.Book_ID
GROUP BY B.Genre;

-- 2. Average price of Fantasy books
SELECT AVG(Price) AS Avg_Price
FROM Books
WHERE Genre = 'Fantasy';

-- 3. Customers with at least 5 orders
SELECT C.Name, COUNT(O.Order_ID) AS Orders_Placed
FROM Customers C
JOIN Orders O ON C.Customer_ID = O.Customer_ID
GROUP BY C.Name
HAVING COUNT(O.Order_ID) >= 5;

-- 4. Most frequently ordered book
SELECT TOP 1 B.Title, COUNT(O.Book_ID) AS Order_Count
FROM Books B
JOIN Orders O ON B.Book_ID = O.Book_ID
GROUP BY B.Title
ORDER BY Order_Count DESC;

-- 5. Top 3 most expensive Fantasy books
SELECT TOP 3 * FROM Books
WHERE Genre = 'Fantasy'
ORDER BY Price DESC;

-- 6. Total quantity sold by author
SELECT B.Author, SUM(O.Quantity) AS Quantity_Sold
FROM Books B
JOIN Orders O ON B.Book_ID = O.Book_ID
GROUP BY B.Author;

-- 7. Cities of customers who spent over $250
SELECT DISTINCT C.City
FROM Customers C
JOIN Orders O ON C.Customer_ID = O.Customer_ID
GROUP BY C.City
HAVING SUM(O.Total_Amount) > 250;

-- 8. Customer who spent the most
SELECT TOP 1 C.Name, SUM(O.Total_Amount) AS Total_Spent
FROM Customerss C
JOIN Orderss O ON C.Customer_ID = O.Customer_ID
GROUP BY C.Name
ORDER BY Total_Spent DESC;

-- 9. Remaining stock after orders
SELECT B.Book_ID, B.Title, B.Stock - ISNULL(SUM(O.Quantity), 0) AS Remaining_Stock
FROM Books B
LEFT JOIN Orders O ON B.Book_ID = O.Book_ID
GROUP BY B.Book_ID, B.Title, B.Stock;

-- 10. Customer type classification
SELECT C.Name, SUM(O.Total_Amount) AS Total_Spent,
       CASE
           WHEN SUM(O.Total_Amount) > 350 THEN 'Premium'
           WHEN SUM(O.Total_Amount) BETWEEN 200 AND 350 THEN 'Regular'
           ELSE 'Basic'
       END AS Customer_Type
FROM Customers C
JOIN Orders O ON C.Customer_ID = O.Customer_ID
GROUP BY C.Name;

-- 11. Books ordered more than average quantity
SELECT * FROM Bookss
WHERE Book_ID IN (
    SELECT Book_ID
    FROM Orderss
    GROUP BY Book_ID
    HAVING SUM(Quantity) > (
        SELECT AVG(Quantity) FROM Orderss
    )
);

-- 12. Create view for customer orders
CREATE VIEW CustomerOrderDetails AS
SELECT C.Name AS Customer_Name, B.Title AS Book_Title, O.Total_Amount
FROM Orders O
JOIN Customers C ON O.Customer_ID = C.Customer_ID
JOIN Books B ON O.Book_ID = B.Book_ID;

-- 13. (To be executed with permission): Create index for faster search
-- CREATE INDEX idx_customer_name ON Customers(Name);

-- 14. Rank customers based on quantity per book
SELECT C.Name, B.Title, O.Quantity,
       RANK() OVER(PARTITION BY B.Title ORDER BY O.Quantity DESC) AS Rank
FROM Orders O
JOIN Customers C ON O.Customer_ID = C.Customer_ID
JOIN Books B ON O.Book_ID = B.Book_ID;

-- 15. Orders placed in last 365 days
SELECT * FROM Orders
WHERE Order_Date >= DATEADD(DAY, -365, GETDATE());

-- 16. Month-wise total sales
SELECT MONTH(Order_Date) AS Month, SUM(Total_Amount) AS Monthly_Sales
FROM Orders
GROUP BY MONTH(Order_Date)
ORDER BY Month;

-- 17. Days since each order was placed
SELECT Order_ID, Order_Date, DATEDIFF(DAY, Order_Date, GETDATE()) AS Days_Ago
FROM Orders;

-- 18. Show customer name with first 6 letters in uppercase
SELECT UPPER(LEFT(Name, 6)) AS Name_Formatted
FROM Customers;

-- 19. Running total of total_amount per genre
SELECT B.Genre, O.Total_Amount,
       SUM(O.Total_Amount) OVER (PARTITION BY B.Genre ORDER BY O.Order_ID) AS Running_Total
FROM Orders O
JOIN Books B ON O.Book_ID = B.Book_ID;

-- 20. Distinct genres
SELECT DISTINCT Genre FROM Books;
