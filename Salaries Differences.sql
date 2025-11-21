/*
Calculates the difference between the highest salaries in the marketing and engineering departments. Output just the absolute difference in salaries.
https://platform.stratascratch.com/coding/10308-salaries-differences?code_type=3
*/



WITH all_sal_dept AS 
(
SELECT
    department, 
    salary,
    RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS rnk
FROM db_employee emp JOIN db_dept dept 
ON emp.department_id = dept.id
), 

marketing_engineering AS 
(
SELECT 
    department, 
    salary
FROM all_sal_dept 
WHERE 
    department IN ('marketing', 'engineering') AND 
    rnk = 1
) 


SELECT 
    ABS(
        MAX(CASE WHEN department = 'engineering' THEN salary END) - 
        MAX(CASE WHEN department = 'marketing' THEN salary END)
    ) AS salary_difference
FROM marketing_engineering;
