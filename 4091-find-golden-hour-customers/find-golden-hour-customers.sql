# Write your MySQL query statement below
SELECT *
FROM (
    SELECT
        customer_id,
        COUNT(order_id) AS total_orders,
        ROUND(
            (
                SUM(
                    CASE 
                        WHEN HOUR(order_timestamp) IN (11,12,13,18,19,20)
                        THEN 1
                        ELSE 0
                    END
                ) / COUNT(order_id)
            ) * 100, 0
        ) AS peak_hour_percentage,
        ROUND(AVG(order_rating), 2) AS average_rating
    FROM restaurant_orders
    GROUP BY customer_id
    HAVING COUNT(order_id) >= 3
       AND (COUNT(order_rating) * 100.0 / COUNT(order_id)) >= 50
) t
WHERE average_rating >= 4
  AND peak_hour_percentage >= 60
ORDER BY average_rating DESC, customer_id DESC;
