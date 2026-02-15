# Write your MySQL query statement below
select 'Low Salary' AS category
,COUNT(CASE WHEN income<20000 THEN 1 END) AS accounts_count
from accounts
UNION ALL
Select 'Average Salary' AS category
,COUNT(CASE WHEN income BETWEEN 20000 AND 50000 THEN 1 END) AS accounts_count
from accounts
UNION ALL
select 'High Salary' AS category
,COUNT(CASE WHEN income>50000 THEN 1 END) AS accounts_count
from accounts;