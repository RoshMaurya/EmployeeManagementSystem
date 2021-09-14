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
  SELECT EmployeeId,FName,LName,Gender,FORMAT (DateOfBirth, 'dd/MM/yyyy ')as DateOfBirth,FORMAT (DateJoined, 'dd/MM/yyyy ')as DateJoined,Email,Phone,Street,City,State,ZipCode,Code from Employee;  
END 

--EXEC GEmployee

CREATE PROCEDURE GEmployeeById
@EmployeeId INT
AS  
BEGIN  
  SET NOCOUNT ON;  
  SELECT EmployeeId,FName,LName,Gender,FORMAT (DateOfBirth, 'dd/MM/yyyy ')as DateOfBirth,FORMAT (DateJoined, 'dd/MM/yyyy ')as DateJoined,Email,Phone,Street,City,State,ZipCode,Code from Employee
  WHERE EmployeeId=@EmployeeId 
END

--EXEC GEmployeeById @EmployeeId = 1001

CREATE PROCEDURE AEmployee
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
  INSERT INTO Employee (EmployeeId, FName,LName,Gender,DateOfBirth,DateJoined,Email,Street,Phone,City,State,ZipCode,Code) VALUES (@EmployeeId, @FName,@LName,@Gender,@DateOfBirth,@DateJoined,@Email,@street,@Phone,@City,@State,@ZipCode,@Code)
END

--EXEC AEmployee @EmployeeId = 1021, @FName = "Xyz",@LName ="ssz",@Gender ="Male",@DateOfBirth="19990519",@DateJoined= "20210519",@Email ="xyz@gmail.com" ,@street= " ",@Phone = "9988776655",@City = "mum",@State = "mah",@ZipCode = 123456,@Code = "TD01"

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
	UPDATE Employee SET EmployeeId=@EmployeeId,FName=@FName,LName=@LName,Gender=@Gender,DateOfBirth=@DateOfBirth,DateJoined=@DateJoined,Email=@Email,Street=@Street,Phone=@Phone,City=@City,State=@State,ZipCode=@ZipCode,Code=@Code WHERE EmployeeId = @EmployeeId
END

--EXEC UEmployee @EmployeeId = 1021, @FName = "Xyzxyz",@LName ="SSEssz",@Gender ="Male",@DateOfBirth="19990519",@DateJoined= "20210519",@Email ="xyz@gmail.com" ,@street = "colony",@Phone = "9988776655",@City = "mum",@State = "mah",@ZipCode = 123456,@Code = "TD01"

CREATE PROCEDURE DEmployee
@EmployeeId INT
AS  
BEGIN  
  SET NOCOUNT ON;  
  alter table JobProject nocheck constraint all 
  DELETE FROM Employee WHERE EmployeeId = @EmployeeId 
  alter table JobProject check constraint all 
END

--EXEC DEmployee @EmployeeId = 1021

--CRUD Operations on Project

CREATE PROCEDURE GProject
AS  
BEGIN  
  SET NOCOUNT ON;  
  SELECT PID,PName,EmployeeId,FORMAT (StartDate, 'dd/MM/yyyy ')as StartDate,FORMAT (EndDate, 'dd/MM/yyyy ')as EndDate,PDetail,SupervisorEmployeeId from JobProject  
END 

--EXEC GProject

CREATE PROCEDURE GProjectById
@PId VARCHAR(20)
AS  
BEGIN  
  SET NOCOUNT ON;  
  SELECT PID,PName,EmployeeId,FORMAT (StartDate, 'dd/MM/yyyy ')as StartDate,FORMAT (EndDate, 'dd/MM/yyyy ')as EndDate,PDetail,SupervisorEmployeeId from JobProject
 WHERE PId=@PId 
END

--EXEC GProjectById @PId = AA01

CREATE PROCEDURE AProject
	@PId VARCHAR(20),
	@PName VARCHAR(55),
	@EmployeeId INT,
	@StartDate DATE,
	@EndDate DATE,
	@PDetail VARCHAR (255),
	@SupervisorEmployeeId INT
AS  
BEGIN  
  SET NOCOUNT ON;  
	INSERT INTO JobProject (PId,PName,EmployeeId,StartDate,EndDate,PDetail,SupervisorEmployeeId) VALUES (@PId,@PName,@EmployeeId,@StartDate,@EndDate,@PDetail,@SupervisorEmployeeId)
END

--EXEC AProject @PId ="AQ01",@PName="XYZ",@EmployeeId="1020",@StartDate="20200514",@EndDate="20200514",@PDetail="Nothing",@SupervisorEmployeeId= 1019

CREATE PROCEDURE UProject
	@PId VARCHAR(20),
	@PName VARCHAR(55),
	@EmployeeId INT,
	@StartDate DATE,
	@EndDate DATE,
	@PDetail VARCHAR (255),
	@SupervisorEmployeeId INT
AS  
BEGIN  
  SET NOCOUNT ON;  
	UPDATE JobProject SET PId=@PId,PName=@PName,EmployeeId=@EmployeeId,StartDate=@StartDate,EndDate=@EndDate,PDetail=@PDetail,SupervisorEmployeeId=@SupervisorEmployeeId WHERE PId=@PId
END

--EXEC UProject @PId ="AQ01",@PName="XYZ",@EmployeeId="1020",@StartDate="20200514",@EndDate="20200914",@PDetail="Nothing Impossible",@SupervisorEmployeeId= 1019

CREATE PROCEDURE DProject
@PId VARCHAR(20)
AS  
BEGIN  
  SET NOCOUNT ON;  
  DELETE FROM JobProject WHERE PId = @PId 
END

--EXEC DProject @PId = AQ01
