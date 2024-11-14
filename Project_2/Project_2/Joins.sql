
USE SkyNet;
Go

SELECT * from department
SELECT * from employee

-- =======================================================
-- For the following numbers, use the "department" and "employee" tables
-- Have each employee display their full names, employee ID, and the city in which they work.
-- =======================================================


SELECT e.first_name, e.last_name,e.id, d.city
FROM employee e, department d
WHERE e.id_department=d.id;
GO

-- =======================================================
-- View a list of employees who work in a city other than Montreal. Include the employee's name and the name of the city in the response. Display in order of employee name.
-- =======================================================
SELECT e.first_name, e.last_name, d.city
FROM employee e LEFT JOIN department d ON e.id_department=d.id
WHERE city!='Montreal'
ORDER BY e.last_name;
GO
--OR
SELECT e.first_name, e.last_name, d.city
FROM employee e, department d
WHERE e.id_department = d.id AND city != 'Montreal'
ORDER BY e.last_name;
GO

-- =======================================================
-- Add to the query the list of employees who do not belong to any city. Include the employee's name and the name of the city in the response.
-- =======================================================
SELECT e.first_name, e.last_name, d.city
FROM employee e LEFT JOIN department d ON e.id_department=d.id
WHERE city!='Montreal' OR city IS NULL
ORDER BY e.last_name;
GO

-- =======================================================
-- View a list of employees who have a manager from different department. For each employee, provide their name and the name of their manager.
-- =======================================================
SELECT E.first_name, P.position
FROM employee E, employee P
WHERE (E.id_manager = P.id) AND (E.id_department != P.id_department);
GO

