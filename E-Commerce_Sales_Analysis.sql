SELECT SUM(total_amount) AS Total_Sales
FROM ecommerce_db.ecommerce_sales;

SELECT COUNT(DISTINCT order_id) AS Total_Orders
FROM ecommerce_db.ecommerce_sales;

SELECT COUNT(DISTINCT customer_id) AS Total_Customers
FROM ecommerce_db.ecommerce_sales;

SELECT AVG(total_amount) AS Average_Order_Value
FROM ecommerce_db.ecommerce_sales;

SELECT 
    category,
    SUM(total_amount) AS Total_Sales
FROM ecommerce_db.ecommerce_sales
GROUP BY category
ORDER BY Total_Sales DESC;

SELECT
    category,
    COUNT(DISTINCT order_id) AS Total_Orders
FROM ecommerce_db.ecommerce_sales
GROUP BY category
ORDER BY Total_Orders DESC;

SELECT
    category,
    SUM(total_amount * profit_margin / 100) AS Total_Profit
FROM ecommerce_db.ecommerce_sales
GROUP BY category
ORDER BY Total_Profit DESC;

SELECT
    region,
    SUM(total_amount) AS Total_Sales
FROM ecommerce_db.ecommerce_sales
GROUP BY region
ORDER BY Total_Sales DESC;

SELECT
    region,
    COUNT(DISTINCT order_id) AS Total_Orders
FROM ecommerce_db.ecommerce_sales
GROUP BY region
ORDER BY Total_Orders DESC;

SELECT
    YEAR(order_date) AS Year,
    MONTH(order_date) AS Month,
    SUM(total_amount) AS Total_Sales
FROM ecommerce_db.ecommerce_sales
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY Year, Month;

SELECT
    customer_id,
    SUM(total_amount) AS Total_Spent,
    COUNT(DISTINCT order_id) AS Total_Orders
FROM ecommerce_db.ecommerce_sales
GROUP BY customer_id
ORDER BY Total_Spent DESC
LIMIT 10;

SELECT
    product_id,
    SUM(total_amount) AS Total_Sales,
    COUNT(DISTINCT order_id) AS Total_Orders,
    SUM(quantity) AS Total_Quantity
FROM ecommerce_db.ecommerce_sales
GROUP BY product_id
ORDER BY Total_Sales DESC
LIMIT 10;

SELECT
    payment_method,
    COUNT(DISTINCT order_id) AS Total_Orders,
    SUM(total_amount) AS Total_Sales,
    AVG(total_amount) AS Average_Order_Value
FROM ecommerce_db.ecommerce_sales
GROUP BY payment_method
ORDER BY Total_Sales DESC;

SELECT
    returned,
    COUNT(DISTINCT order_id) AS Total_Orders,
    SUM(total_amount) AS Total_Sales,
    AVG(total_amount) AS Average_Order_Value
FROM ecommerce_db.ecommerce_sales
GROUP BY returned;

SELECT
    category,
    COUNT(DISTINCT order_id) AS Total_Orders,
    SUM(CASE WHEN returned = 'Yes' THEN 1 ELSE 0 END) AS Returned_Orders,
    ROUND(
        SUM(CASE WHEN returned = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(DISTINCT order_id) * 100,
        2
    ) AS Return_Rate_Percent
FROM ecommerce_db.ecommerce_sales
GROUP BY category
ORDER BY Return_Rate_Percent DESC;

SELECT
    Customer_Type,
    COUNT(*) AS Total_Customers
FROM (
    SELECT
        customer_id,
        CASE
            WHEN COUNT(DISTINCT order_id) = 1
                THEN 'One-time Customer'
            ELSE 'Repeat Customer'
        END AS Customer_Type
    FROM ecommerce_db.ecommerce_sales
    GROUP BY customer_id
) AS customer_frequency
GROUP BY Customer_Type
ORDER BY Total_Customers DESC;

SELECT
    customer_id,
    SUM(total_amount) AS Total_Spent,
    CASE
        WHEN SUM(total_amount) < 250 THEN 'Low Value'
        WHEN SUM(total_amount) < 750 THEN 'Medium Value'
        ELSE 'High Value'
    END AS Customer_Segment
FROM ecommerce_db.ecommerce_sales
GROUP BY customer_id
ORDER BY Total_Spent DESC;

SELECT
    customer_id,
    SUM(total_amount) AS Total_Spent,
    COUNT(DISTINCT order_id) AS Total_Orders
FROM ecommerce_db.ecommerce_sales
GROUP BY customer_id
ORDER BY Total_Spent DESC
LIMIT 10;

SELECT
    Customer_Type,
    COUNT(*) AS Number_of_Customers
FROM (
    SELECT
        customer_id,
        CASE
            WHEN COUNT(DISTINCT order_id) = 1 THEN 'One-time Customer'
            ELSE 'Repeat Customer'
        END AS Customer_Type
    FROM ecommerce_db.ecommerce_sales
    GROUP BY customer_id
) AS customer_types
GROUP BY Customer_Type;


SELECT
    returned,
    COUNT(DISTINCT order_id) AS Total_Orders
FROM ecommerce_db.ecommerce_sales
GROUP BY returned;


SELECT
    category,
    COUNT(DISTINCT order_id) AS Total_Orders,
    SUM(CASE WHEN returned = 'Yes' THEN 1 ELSE 0 END) AS Returned_Orders,
    ROUND(
        SUM(CASE WHEN returned = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(DISTINCT order_id) * 100,
        2
    ) AS Return_Rate
FROM ecommerce_db.ecommerce_sales
GROUP BY category
ORDER BY Return_Rate DESC;


SELECT
    region,
    SUM(total_amount) AS Total_Sales
FROM ecommerce_db.ecommerce_sales
GROUP BY region
ORDER BY Total_Sales DESC;

SELECT
    payment_method,
    COUNT(DISTINCT order_id) AS Total_Orders,
    SUM(total_amount) AS Total_Sales
FROM ecommerce_db.ecommerce_sales
GROUP BY payment_method
ORDER BY Total_Sales DESC;

SELECT
    product_id,
    SUM(total_amount) AS Total_Sales,
    COUNT(DISTINCT order_id) AS Total_Orders,
    SUM(quantity) AS Total_Quantity
FROM ecommerce_db.ecommerce_sales
GROUP BY product_id
ORDER BY Total_Sales DESC
LIMIT 10;

SELECT
    product_id,
    SUM(total_amount) AS Total_Sales,
    COUNT(DISTINCT order_id) AS Total_Orders,
    SUM(quantity) AS Total_Quantity
FROM ecommerce_db.ecommerce_sales
GROUP BY product_id
ORDER BY Total_Sales ASC
LIMIT 10;

SELECT
    CASE
        WHEN Total_Spent < 200 THEN 'Low Value'
        WHEN Total_Spent < 1000 THEN 'Medium Value'
        ELSE 'High Value'
    END AS Customer_Segment,
    COUNT(*) AS Number_of_Customers,
    ROUND(SUM(Total_Spent), 2) AS Total_Sales
FROM (
    SELECT
        customer_id,
        SUM(total_amount) AS Total_Spent
    FROM ecommerce_db.ecommerce_sales
    GROUP BY customer_id
) AS customer_data
GROUP BY Customer_Segment
ORDER BY Total_Sales DESC;

SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS Month,
    ROUND(SUM(total_amount), 2) AS Total_Sales
FROM ecommerce_db.ecommerce_sales
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY Month;

SELECT
    category,
    ROUND(
        SUM(total_amount * profit_margin / 100),
        2
    ) AS Estimated_Profit
FROM ecommerce_db.ecommerce_sales
GROUP BY category
ORDER BY Estimated_Profit DESC;

SELECT
    quantity,
    COUNT(DISTINCT order_id) AS Total_Orders,
    ROUND(SUM(total_amount), 2) AS Total_Sales,
    ROUND(AVG(total_amount), 2) AS Average_Order_Value
FROM ecommerce_db.ecommerce_sales
GROUP BY quantity
ORDER BY quantity;

SELECT
    discount,
    COUNT(DISTINCT order_id) AS Total_Orders,
    ROUND(SUM(total_amount), 2) AS Total_Sales,
    ROUND(AVG(total_amount), 2) AS Average_Order_Value
FROM ecommerce_db.ecommerce_sales
GROUP BY discount
ORDER BY discount;

SELECT
    delivery_time_days,
    COUNT(DISTINCT order_id) AS Total_Orders,
    ROUND(SUM(total_amount), 2) AS Total_Sales,
    ROUND(AVG(total_amount), 2) AS Average_Order_Value
FROM ecommerce_db.ecommerce_sales
GROUP BY delivery_time_days
ORDER BY delivery_time_days;