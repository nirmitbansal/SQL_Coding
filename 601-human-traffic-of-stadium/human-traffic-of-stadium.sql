# Write your MySQL query statement below
WITH StadiumWithGroup AS (
    SELECT 
        id,
        visit_date,
        people,
        id - ROW_NUMBER() OVER (ORDER BY id) AS group_id
    FROM Stadium
    WHERE people >= 100
)
SELECT id, visit_date, people
FROM StadiumWithGroup
WHERE group_id IN (
    SELECT group_id
    FROM StadiumWithGroup
    GROUP BY group_id
    HAVING COUNT(*) >= 3
)
ORDER BY visit_date;
