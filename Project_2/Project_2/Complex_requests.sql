USE SkyNet;
GO

-- =======================================================
-- The following exercises are done with the "Employee" and "Department" tables
-- Display the names of employees who work in a city other than Montreal.
-- Display the names of employees in alphabetical order.
-- =======================================================

SELECT last_name
FROM employee
WHERE id_department NOT IN (
SELECT id FROM department WHERE city = 'Montreal')
ORDER BY first_name;
GO

-- =======================================================
-- Add to the query in the previous number the list of employees who do not belong to any department.
-- =======================================================
SELECT last_name
FROM employee
WHERE id_department NOT IN (
SELECT id FROM department WHERE city = 'Montreal') OR
id_department IS NULL
ORDER BY first_name;
GO

-- =======================================================
-- Write the necessary statement to find the names of the managers who do not have an employee who earn a commission.
-- =======================================================
SELECT last_name
FROM employee
WHERE id IN (
select id_manager FROM employee 
EXCEPT 
SELECT id_manager FROM employee 
WHERE commission is NOT NULL);
GO

-- =======================================================
-- Get the number of departments that never hired employees during the month of January. 
-- Identical department numbers should appear ONLY once.
-- =======================================================

SELECT DISTINCT id_department FROM employee
EXCEPT 
SELECT DISTINCT id_department from employee 
WHERE MONTH (employment_date)=1;
GO;

-- =======================================================
-- Write the statement to display 'True' if Department 20 never hired employees during the month of January.
-- =======================================================
SELECT 'TRUE' 'Result'
WHERE NOT EXISTS (
SELECT * FROM employee WHERE MONTH (employment_date)=1 AND
id_department = 20);
GO

-- =======================================================
-- Write the statement needed to produce the list of the managers numbers with their number of employees for managers who earn more than the average boss salary.
-- =======================================================
SELECT id_manager, COUNT (*) 'Number'
FROM employee
WHERE id_manager IS NOT NULL
GROUP BY id_manager
HAVING id_manager IN (
SELECT id FROM employee
WHERE salary>(SELECT AVG (salary) FROM employee))
ORDER BY id_manager;
GO
						
