/*
https://platform.stratascratch.com/coding/10152-workers-with-the-highest-and-lowest-salaries?code_type=3
You have been asked to find the employees with the highest and lowest salary across whole dataset.
Your output should include the employee's ID, salary, and employee's department, as well as a column salary_type that categorizes the output by:

'Highest Salary' represents the highest salary
'Lowest Salary' represents the lowest salary

*/





WITH ranked_sal AS 
(
SELECT 
    worker_id, 
    salary, 
    department,
    RANK()OVER(ORDER BY salary DESC) AS high_sal_rank1, 
    RANK ()OVER(ORDER BY salary ASC) AS low_sal_rank1
FROM worker
) 


SELECT 
    worker_id, 
    salary, 
    department, 
    CASE 
        WHEN high_sal_rank1 = 1 THEN 'Highest Salary'
        WHEN low_sal_rank1 = 1 THEN 'Lowest Salary'
        END AS salary_type
FROM ranked_sal
WHERE 
    high_sal_rank1 = 1 OR
    low_sal_rank1 = 1 

