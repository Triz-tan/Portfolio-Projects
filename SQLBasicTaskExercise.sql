--SQL BASIC TASK EXERCISE

--Selecting Data
--Retrieve all records from the Employee table.
SELECT *
FROM dbo.EmployeeSampleData

--Retrieve only the names and ages of all employees.
SELECT FullName, Age
FROM dbo.EmployeeSampleData

--Retrieve distinct job titles from the Employee table.
SELECT DISTINCT JobTitle
FROM dbo.EmployeeSampleData

--Retrieve the count of employees in each department.
SELECT DISTINCT Department, COUNT(ID) AS EmployeeTotal
FROM dbo.EmployeeSampleData
GROUP BY Department

--Filtering Data:
--Retrieve employees who are older than 30.
SELECT FullName, Age
FROM dbo.EmployeeSampleData
WHERE Age > 30

--Retrieve employees who work in the 'Sales' department.
SELECT FullName, Department
FROM dbo.EmployeeSampleData
WHERE Department = 'Sales'

--Retrieve employees who have a annual salary greater than $100,000.
SELECT FullName, AnnualSalary
FROM dbo.EmployeeSampleData
WHERE AnnualSalary > 100000 

--Sorting Data:
--Sort employees by their ages in ascending order.
SELECT FullName, Age 
FROM dbo.EmployeeSampleData
ORDER BY AGE ASC;

--Sort employees by their salaries in descending order.
SELECT FullName, Age 
FROM dbo.EmployeeSampleData
ORDER BY AGE DESC;

--Sort employees by their exit dates in ascending order.
SELECT FullName, ExitDate
FROM dbo.EmployeeSampleData
WHERE ExitDate IS NOT NULL
ORDER BY ExitDate ASC

--Aggregating Data:
--Calculate the average annual salary of all employees.
SELECT FullName, AVG(AnnualSalary) AS AverageAnnualSalary 
FROM dbo.EmployeeSampleData
GROUP BY FullName

--Find the maximum salary in the company.
SELECT  MAX(AnnualSalary) as MaxSalary
FROM dbo.EmployeeSampleData

--Find the employees that country is United States.
SELECT  FullName, Country
FROM dbo.EmployeeSampleData
WHERE Country = 'United States'

--Grouping and Aggregating:
--Calculate the average annual salary for each job title.
SELECT  DISTINCT JobTitle, AVG(AnnualSalary) AS AveAnnualSalary
FROM dbo.EmployeeSampleData
GROUP BY JobTitle

--Find the department with the highest total annual salary.
SELECT Department, MAX(AnnualSalary) AS HighestSalary
FROM dbo.EmployeeSampleData
Group by Department 
ORDER BY Department ASC

--Determine the job title with the highest average salary.
SELECT TOP 1 JobTitle,  AVG(AnnualSalary) as HighestAverageSalary
FROM dbo.EmployeeSampleData
GROUP BY JobTitle
ORDER BY HighestAverageSalary DESC

--Subqueries:
--Retrieve employees who have a annual salary greater than the average annual salary.
SELECT  FullName
FROM dbo.EmployeeSampleData
WHERE AnnualSalary > ( SELECT AVG(AnnualSalary) FROM dbo.EmployeeSampleData)

--Find employees who have the same job title as 'Manager'.
SELECT FullName, JobTitle
FROM dbo.EmployeeSampleData
WHERE JobTitle = 'Manager'

