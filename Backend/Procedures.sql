--PROCEDURE For Login
CREATE PROCEDURE PROC_Login 
    @Username VARCHAR(55),
    @Password VARCHAR(55)  
AS  
BEGIN  
  SET NOCOUNT ON;  
  SELECT EmployeeId,Username FROM LoginCredentials WHERE Username=@Username AND Password = HASHBYTES('SHA1',@Password)  
END 
--EXEC PROC_Login @Username="kartikgoenka",@Password= "kartikgoenka"

--CRUD Operations on Employee
CREATE PROCEDURE GEmployee 
AS  
BEGIN  
  SET NOCOUNT ON;  
  SELECT EmployeeId,FName,LName,Gender,FORMAT (DateOfBirth, 'dd/MM/yyyy ')as DateOfBirth,
  FORMAT (DateJoined, 'dd/MM/yyyy ')as DateJoined,Email,Phone,Street,City,State,ZipCode,e.Code,Title as Position, DName
FROM Employee AS e
   INNER JOIN
   JobTitle AS j
   ON e.Code = j.Code
   INNER JOIN
   DepartmentDetail AS d
   ON j.DId = d.DId
END

--EXEC GEmployee

CREATE PROCEDURE GEmployeeById
@EmployeeId INT
AS  
BEGIN  
  SET NOCOUNT ON;  
  SELECT EmployeeId,FName,LName,Gender,FORMAT (DateOfBirth, 'dd/MM/yyyy ')as DateOfBirth,
  FORMAT (DateJoined, 'dd/MM/yyyy ')as DateJoined,Email,Phone,Street,City,State,ZipCode,e.Code,Title as Position, DName
FROM Employee AS e
   INNER JOIN
   JobTitle AS j
   ON e.Code = j.Code
   INNER JOIN
   DepartmentDetail AS d
   ON j.DId = d.DId  WHERE EmployeeId=@EmployeeId 
END
--EXEC GEmployeeById @EmployeeId = 1001

CREATE PROCEDURE GEmployeeByName
@EName VARCHAR(255)
AS  
BEGIN  
  SET NOCOUNT ON;  
  SELECT EmployeeId,FName,LName,Gender,FORMAT (DateOfBirth, 'dd/MM/yyyy ')as DateOfBirth,
  FORMAT (DateJoined, 'dd/MM/yyyy ')as DateJoined,Email,Phone,Street,City,State,ZipCode,e.Code,Title as Position, DName
FROM Employee AS e
   INNER JOIN
   JobTitle AS j
   ON e.Code = j.Code
   INNER JOIN
   DepartmentDetail AS d
   ON j.DId = d.DId  WHERE 
   FName LIKE '%' + @EName + '%' OR 
   LName LIKE '%' + @EName + '%' OR 
   EmployeeId LIKE '%' + @EName + '%' OR
   Phone LIKE '%' + @EName + '%' OR
   Email LIKE '%' + @EName + '%' 
END
--EXEC GEmployeeByName @EName = '675'


CREATE PROCEDURE AEmployee
	@FName VARCHAR (50),
	@LName VARCHAR (50),
	@Gender VARCHAR (50),
	@DateOfBirth DATE,
	@DateJoined DATE,
	@Email VARCHAR (255),
	@Phone VARCHAR (25),
	@Street VARCHAR (255),
	@City VARCHAR (255),
	@State VARCHAR (60),
	@ZipCode VARCHAR (25),
	@Code VARCHAR (50)
AS  
BEGIN  
  SET NOCOUNT ON;  
  INSERT INTO Employee (FName,LName,Gender,DateOfBirth,DateJoined,Email,Street,Phone,City,State,ZipCode,Code) VALUES (@FName,@LName,@Gender,@DateOfBirth,@DateJoined,@Email,@street,@Phone,@City,@State,@ZipCode,@Code)
END

--EXEC AEmployee @FName = "Xyz",@LName ="ssz",@Gender ="Male",@DateOfBirth="19990519",@DateJoined= "20210519",@Email ="xyz@gmail.com" ,@street= " ",@Phone = "9988776655",@City = "mum",@State = "mah",@ZipCode = 123456,@Code = "TD01"

CREATE PROCEDURE UEmployee
	@EmployeeId INT,
	@FName VARCHAR (50),
	@LName VARCHAR (50),
	@Gender VARCHAR (50),
	@DateOfBirth DATE,
	@DateJoined DATE,
	@Email VARCHAR (255),
	@Phone VARCHAR (25),
	@Street VARCHAR (255),
	@City VARCHAR (255),
	@State VARCHAR (60),
	@ZipCode VARCHAR (25),
	@Code VARCHAR (50)
AS  
BEGIN  
  SET NOCOUNT ON;  
	UPDATE Employee SET FName=@FName,LName=@LName,Gender=@Gender,DateOfBirth=@DateOfBirth,DateJoined=@DateJoined,Email=@Email,Street=@Street,Phone=@Phone,City=@City,State=@State,ZipCode=@ZipCode,Code=@Code WHERE EmployeeId = @EmployeeId
END

--EXEC UEmployee @FName = "Xyzxyz",@LName ="SSEssz",@Gender ="Male",@DateOfBirth="19990519",@DateJoined= "20210519",@Email ="xyz@gmail.com" ,@street = "colony",@Phone = "9988776655",@City = "mum",@State = "mah",@ZipCode = 123456,@Code = "TD01"

CREATE PROCEDURE DEmployee
@EmployeeId INT
AS  
BEGIN  
  SET NOCOUNT ON;  
	DELETE FROM LoginCredentials WHERE EmployeeId = @EmployeeId; 
	UPDATE JobProject SET SupervisorEmployeeId = NULL WHERE SupervisorEmployeeId = @EmployeeId;
	DELETE FROM Employee WHERE EmployeeId = @EmployeeId 
END

--EXEC DEmployee @EmployeeId = 1021

--CRUD Operations on Project

CREATE PROCEDURE GProject
AS  
BEGIN  
  SET NOCOUNT ON;  
  SELECT PID,PName,PDetail,SupervisorEmployeeId from JobProject  
END 

--EXEC GProject

CREATE PROCEDURE GProjectById
@PId VARCHAR(20)
AS  
BEGIN  
  SET NOCOUNT ON;  
  SELECT PID,PName,PDetail,SupervisorEmployeeId from JobProject
 WHERE PId=@PId 
END

--EXEC GProjectById @PId = AA01

CREATE PROCEDURE GProjectByName
@PName VARCHAR(55)
AS  
BEGIN  
  SET NOCOUNT ON;  
  SELECT PID,PName,PDetail,SupervisorEmployeeId from JobProject
 WHERE PName LIKE '%' + @PName + '%'  OR PId LIKE '%' + @PName + '%'
END
--EXEC GProjectByName @PName = 'aa01'

CREATE PROCEDURE AProject
	@PId VARCHAR(20),
	@PName VARCHAR(55),
	@PDetail VARCHAR (255),
	@SupervisorEmployeeId INT
AS  
BEGIN  
  SET NOCOUNT ON;  
	INSERT INTO JobProject (PId,PName,PDetail,SupervisorEmployeeId) VALUES (@PId,@PName,@PDetail,@SupervisorEmployeeId)
END

select * from JobProject
--EXEC AProject @PId ="AA01",@PName="XYZ",@PDetail="Nothing",@SupervisorEmployeeId= 1041

CREATE PROCEDURE UProject
	@PId VARCHAR(20),
	@PName VARCHAR(55),
	@PDetail VARCHAR (255),
	@SupervisorEmployeeId INT
AS  
BEGIN  
  SET NOCOUNT ON;  
	UPDATE JobProject SET PName=@PName,PDetail=@PDetail,SupervisorEmployeeId=@SupervisorEmployeeId WHERE PId=@PId
END

--EXEC UProject @PId ="AQ01",@PName="XYZ",@PDetail="Nothing Impossible",@SupervisorEmployeeId= 1019

CREATE PROCEDURE DProject
@PId VARCHAR(20)
AS  
BEGIN  
  SET NOCOUNT ON;
  UPDATE Employee SET PId = NULL WHERE PId = @PId  
  DELETE FROM JobProject WHERE PId = @PId 
END
 
--EXEC DProject @PId = AQ01


--Project Procedures for Employee

CREATE PROCEDURE EmpProject
AS
BEGIN
	SELECT e.EmployeeId,e.PId,PName
	FROM Employee AS e
	INNER JOIN
	JobProject AS j
	ON e.PId = j.PId
END

--EXEC EmpProject

--ADD Employee To Particular Project
CREATE PROCEDURE AEmpProject
    @EmployeeId INT,
    @PId VARCHAR(20)
AS  
BEGIN  
  SET NOCOUNT ON;  
    UPDATE Employee SET PId=@PId WHERE EmployeeId = @EmployeeId
END

--EXEC AEmpProject @PId='MA02',@EmployeeId=1005

--View Employee Assign To Particular Project
CREATE PROCEDURE VEmpProject
    @PId VARCHAR(20)
AS  
BEGIN  
  SET NOCOUNT ON;  
    SELECT EmployeeId,PId FROM Employee WHERE PId = @PId
END

--EXEC VEmpProject @PId='AA01'

--View Which Employee Has Not Been Assigned Project 
CREATE PROCEDURE VEmpNotProject
AS  
BEGIN  
  SET NOCOUNT ON;  
    SELECT EmployeeId,PId FROM Employee WHERE PId IS NULL
END
--EXEC VEmpNotProject
