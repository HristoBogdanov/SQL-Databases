SELECT TOP 5 EmployeeId
	,JobTitle
	,e.AddressId
	,a.AddressText
	FROM Employees e JOIN Addresses a
	ON e.AddressID=a.AddressID
	ORDER BY e.AddressID


SELECT TOP 50 FirstName,LastName,t.[Name],a.AddressText
	FROM Employees e JOIN Addresses a
	ON e.AddressID=a.AddressID
	JOIN Towns t
	ON a.TownID=t.TownID
	ORDER BY FirstName, LastName

SELECT EmployeeID,FirstName,LastName,d.[Name]
FROM Employees e JOIN Departments d
ON e.DepartmentID=d.DepartmentID
WHERE d.[Name]='Sales'
ORDER BY EmployeeID


SELECT TOP 5 EmployeeID,FirstName,Salary,d.[Name]
FROM Employees e JOIN Departments d
ON e.DepartmentID=d.DepartmentID
WHERE Salary>15000
ORDER BY e.DepartmentID

SELECT TOP 3 EmployeeID,FirstName
FROM Employees
WHERE EmployeeID NOT IN
(SELECT e.EmployeeID
FROM Employees e  JOIN EmployeesProjects ep
ON e.EmployeeID=ep.EmployeeID JOIN Projects p
ON ep.ProjectID=p.ProjectID)
ORDER BY EmployeeID

SELECT FirstName,LastName,HireDate,d.[Name] 
FROM Employees e JOIN Departments d
ON e.DepartmentID=d.DepartmentID
WHERE e.HireDate>'1.1.1999' AND
d.[Name] IN ('Sales', 'Finance')
ORDER BY HireDate


SELECT TOP 5 e.EmployeeID,FirstName,p.[Name]
FROM Employees e JOIN EmployeesProjects ep
ON e.EmployeeID=ep.EmployeeID
JOIN Projects p ON ep.ProjectID=P.ProjectID
WHERE StartDate>'2002-08-13 00:00:00' AND 
	  EndDate IS NULL
ORDER BY EmployeeID





SELECT e.EmployeeID
		,FirstName
		,p.[Name] ProjectName
FROM Employees e JOIN EmployeesProjects ep
ON e.EmployeeID=ep.EmployeeID
 JOIN Projects p ON ep.ProjectID=P.ProjectID
WHERE e.EmployeeID=24 AND 
p.StartDate < '2005-01-01 00:00:00'


SELECT s.EmployeeID,s.FirstName,s.ManagerID,e.FirstName AS ManagerName
FROM Employees s JOIN Employees e
ON e.EmployeeID=s.ManagerID
WHERE s.ManagerID IN (3,7)
ORDER BY s.EmployeeID

SELECT TOP 50 s.EmployeeID
		,CONCAT_WS(' ', s.FirstName,s.LastName) EmployeeName
		,CONCAT_WS(' ', e.FirstName,e.LastName) AS ManagerName
		,d.[Name] DepartmentName
FROM Employees s JOIN Employees e
ON e.EmployeeID=s.ManagerID
JOIN Departments d
ON s.DepartmentID=d.DepartmentID



SELECT TOP 1 AVG(Salary) MinAvgSalary
FROM Employees e JOIN Departments d 
ON e.DepartmentID=d.DepartmentID
GROUP BY d.[Name]
ORDER BY MinAvgSalary



