-- =====================================================
-- E-Commerce Analytics SQL Queries
-- Author: Namkyeong Kim
-- =====================================================

-- 1. Total Revenue

SELECT
    ROUND(SUM(Quantity * UnitPrice), 2) AS total_revenue
FROM online_retail;


-- 2. Total Orders

SELECT
    COUNT(DISTINCT InvoiceNo) AS total_orders
FROM online_retail;


-- 3. Total Customers

SELECT
    COUNT(DISTINCT CustomerID) AS total_customers
FROM online_retail;


-- 4. Average Order Value (AOV)

SELECT
    ROUND(
        SUM(Quantity * UnitPrice)
        / COUNT(DISTINCT InvoiceNo),
        2
    ) AS average_order_value
FROM online_retail;


-- 5. Monthly Revenue Trend

SELECT
    YEAR(InvoiceDate) AS year,
    MONTH(InvoiceDate) AS month,
    ROUND(SUM(Quantity * UnitPrice), 2) AS revenue
FROM online_retail
GROUP BY YEAR(InvoiceDate), MONTH(InvoiceDate)
ORDER BY year, month;


-- 6. Top 10 Products by Revenue

SELECT
    Description,
    ROUND(SUM(Quantity * UnitPrice), 2) AS revenue
FROM online_retail
GROUP BY Description
ORDER BY revenue DESC
LIMIT 10;


-- 7. Top 10 Countries by Revenue

SELECT
    Country,
    ROUND(SUM(Quantity * UnitPrice), 2) AS revenue
FROM online_retail
GROUP BY Country
ORDER BY revenue DESC
LIMIT 10;


-- 8. Top Customers by Revenue

SELECT
    CustomerID,
    ROUND(SUM(Quantity * UnitPrice), 2) AS revenue
FROM online_retail
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY revenue DESC
LIMIT 10;