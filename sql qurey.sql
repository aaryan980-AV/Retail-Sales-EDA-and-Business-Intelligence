USE ApexPlanet;
-- Q1. What is the total revenue generated?
SELECT
SUM(Total_Sales) AS Total_Revenue
FROM sales;

-- Q2. Which are the Top 5 Products by Sales?
SELECT
Product,
SUM(Total_Sales) AS Total_Revenue
FROM sales
GROUP BY Product
ORDER BY Total_Revenue DESC
LIMIT 5;

-- Q3. Which city generates the highest revenue?

SELECT
City,
SUM(Total_Sales) AS Total_Revenue
FROM sales
GROUP BY City
ORDER BY Total_Revenue DESC;

-- Q4. Which product category has the highest sales?-- 
SELECT
Category,
SUM(Total_Sales) AS Total_Revenue
FROM sales
GROUP BY Category
ORDER BY Total_Revenue DESC;

-- Q5. What is the monthly sales trend?
SELECT
YEAR(Order_Date) AS Year,
MONTH(Order_Date) AS Month,
MONTHNAME(Order_Date) AS Month_Name,
SUM(Total_Sales) AS Monthly_Revenue
FROM sales
GROUP BY
YEAR(Order_Date),
MONTH(Order_Date),
MONTHNAME(Order_Date)
ORDER BY Year, Month;

-- Q6. Which gender contributes more to sales?
SELECT
Gender,
SUM(Total_Sales) AS Total_Revenue
FROM sales
GROUP BY Gender
ORDER BY Total_Revenue DESC;

-- Q7. What is the Average Order Value (AOV)?
SELECT
AVG(Order_Total) AS Average_Order_Value
FROM (
SELECT
Order_ID,
SUM(Total_Sales) AS Order_Total
FROM sales
GROUP BY Order_ID
) AS Orders;

