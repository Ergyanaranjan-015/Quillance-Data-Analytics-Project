
-- E-COMMERCE SALES ANALYTICS PROJECT
-- SQL Analysis using SQLite

-- 1. Overall Business Performance
SELECT
    COUNT(*) AS Total_Records,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity,
    ROUND(SUM(Profit) * 100.0 / SUM(Sales), 2) AS Profit_Margin
FROM Superstore;

-- 2. Category-wise Analysis
SELECT
    Category,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity
FROM Superstore
GROUP BY Category
ORDER BY Total_Sales DESC;

-- 3. Region-wise Analysis
SELECT
    Region,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Profit) * 100.0 / SUM(Sales), 2) AS Profit_Margin
FROM Superstore
GROUP BY Region
ORDER BY Total_Sales DESC;

-- 4. Monthly Sales and Profit Analysis
SELECT
    strftime('%Y', "Order Date") AS Order_Year,
    strftime('%m', "Order Date") AS Order_Month,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM Superstore
GROUP BY Order_Year, Order_Month
ORDER BY Order_Year, Order_Month;
