--Age
CREATE PROCEDURE EmployeeAge 
AS  
BEGIN  
  SELECT AgeGroup, count(*) AS COUNT FROM
(
select
  case
    WHEN datediff(YY,DateOfBirth,getdate()) BETWEEN 20 AND 30 THEN '20+'
    WHEN datediff(YY,DateOfBirth,getdate()) BETWEEN 30 AND 40 THEN '30+'
    WHEN datediff(YY,DateOfBirth,getdate()) BETWEEN 40 AND 50 THEN '40+'
    WHEN datediff(YY,DateOfBirth,getdate()) BETWEEN 50 AND 60 THEN '50+'
    WHEN datediff(YY,DateOfBirth,getdate())>60 THEN '60+'
 END as AgeGroup
 FROM Employee
) t
group by AgeGroup
END 
--EXEC EmployeeAge

--Gender
CREATE PROCEDURE EmployeeGender
AS
BEGIN
 SELECT Gender,COUNT(Gender) AS COUNT FROM Employee
GROUP BY Gender;
END
--EXEC EmployeeGender

--DEPARTMENT
CREATE PROCEDURE EmployeeDept
AS
BEGIN 
 SELECT DName AS Department, COUNT(DName) as COUNT
 FROM Employee AS e
   INNER JOIN
   JobTitle AS j
   ON e.Code = j.Code
   INNER JOIN
   DepartmentDetail AS d
   ON j.DId = d.DId
   GROUP BY DName
END
--EXEC EmployeeDept

--POSITION 
CREATE PROCEDURE EmployeePosition
AS
BEGIN
  SELECT Title AS Position, COUNT(Title) as COUNT
 FROM Employee AS e
   INNER JOIN
   JobTitle AS j
   ON e.Code = j.Code
   GROUP BY Title
END
--EXEC EmployeePosition
