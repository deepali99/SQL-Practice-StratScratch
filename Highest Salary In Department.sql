/*

Find the employee with the highest salary per department.
Output the department name, employee's first name along with the corresponding salary.
https://platform.stratascratch.com/coding/9897-highest-salary-in-department?code_type=3
*/



WITH ranked_salary AS
(
SELECT
    first_name, 
    department,
    salary, 
    RANK()OVER(PARTITION BY department ORDER BY salary DESC) AS rnk
FROM employee
) 

SELECT 
    department, 
    first_name, 
    salary
FROM ranked_salary
WHERE rnk = 1 
    
