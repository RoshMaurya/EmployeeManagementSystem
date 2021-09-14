CREATE TABLE DepartmentDetail (
	DId VARCHAR (20) PRIMARY KEY,
	DName VARCHAR (50) NOT NULL,
	DDetails VARCHAR(255)
);

INSERT INTO DepartmentDetail (
    DId,
    DName,
	DDetails
)
VALUES
    	('HR01','HR','Manages HR related problem.'),
	('IT01','IT','Manages IT related problem.'),
	('FD01','Finance','Manages Finance related problem.'),
	('SD01','Software Developers','Responsible for Software Design.')


CREATE TABLE JobTitle (
	Code VARCHAR (50) PRIMARY KEY,
	Title VARCHAR (255) NOT NULL,
	DId VARCHAR (20),
	Description VARCHAR (255),
	SalaryMin DECIMAL (10, 2) DEFAULT 25000,
	SalaryMax DECIMAL (10, 2) DEFAULT 25000,
	FOREIGN KEY (DId) REFERENCES DepartmentDetail (DId),
);


INSERT INTO JobTitle (
    Code,
    Title,
	DId,
    Description,
	SalaryMin,
	SalaryMax   
)
VALUES
    	('TD01','Trainee SDE','SD01','Trained on Different Tecnologies',25000,27000),
	('AD02','Associate SDE','SD01','Successfully completed there training period',27000,30000),
	('SD01','Software Developer','SD01','Minimum 1yrs of Experience',30000,35000),
	('SD02','Tecnical Lead','SD01','Minimum 3yrs of Experience',35000,40000),
	('SD03','Senior SDE','SD01','Minimum 7yrs of Experience',40000,45000),
	('HR01','HR','HR01','Managing Companys Workforce',35000,40000),
	('HR02','Manager-HR','HR01','Handels all the Companys environment',40000,45000),
	('SA01','System Engineer','IT01','Managing IT resoures',35000,40000),
	('SA02','Senior System Engineer','IT01','Min 4yrs of Experience in Managing IT resoures',35000,40000),
	('AA02','Account Analyst','FD01','Managing Finance related problem ',35000,40000)

CREATE TABLE Employee (
	EmployeeId INT PRIMARY KEY,
	FName VARCHAR (50) NOT NULL,
	LName VARCHAR (50) NOT NULL,
	Gender VARCHAR (50) NOT NULL,
	DateOfBirth DATE NOT NULL,
	DateJoined DATE NOT NULL,
	Email VARCHAR (255) NOT NULL UNIQUE,
	Phone VARCHAR (25) NOT NULL,
	Street VARCHAR (255) ,
	City VARCHAR (255) NOT NULL,
	State VARCHAR (60) NOT NULL,
	ZipCode VARCHAR (25) NOT NULL,
	Code VARCHAR (50) NOT NULL,
	FOREIGN KEY (Code) REFERENCES JobTitle (Code)
);

INSERT INTO Employee(
    EmployeeId,FName,LName,Gender,DateOfBirth,
	DateJoined,Email,Phone,Street,City,State,ZipCode,Code 
)
VALUES
    	(1001,'John','Cena','Male','19990519','20210809','johncena99@gmail.com','9988776655','Los Angeles','West Newbury','Massacuhusetts','12234','TD01'),
	(1002,'Dean','Ambrose','Male','19950801','20200501','deanambrose45@gmail.com','9482766250','Los Angeles','Cincinnati','Ohio','334455','SD01'),
    	(1003,'David','Joseph','Male','19980525','20150715','davidjoseph@gmail.com','9482766250','western most city','Pensacola','Florida','745964','AD02'),
	(1004,'Seth','Dhawan','Male','19900528','20190501','sethdhawan@gmail.com','2246878998','Mississippi River','Buffalo','Lowa','235698','SD03'),
	(1005,'Ronda','Norona','Female','19970201','20210601','rondanorona@gmail.com','6584930213','Mississippi River','Riverside','California','436578','AD02'),
	(1006,'Jinder','Mahal','Male','19950719','20210809','jindermahal@gmail.com','7638945629','Cow Town','Calgary','Canada','235464','SD02'),
	(1007,'Neeraj','Desai','Male','19971224','20201101','neerajdesai@gmail.com','4567819407','Elizabeth street','Panipat','Haryana','245364','AD02'),
	(1008,'Anuraj','Basu','Male','19990827','20210809','anuragbasu@gmail.com','8254869238','Eden Garden','Kolkata','West Bengal','235464','TD01'),
	(1009,'Prerna','Bajaj','Female','19950430','20210809','prernabajaj@gmail.com','5463278249','xyz colony','Visakhapatnam','Andra Pradesh','235464','SD02'),
	(1010,'Simar','Oswal','Female','19970313','20200515','simaroswal@gmail.com','9283274654','Express Highway','Mumbai','Maharashtra','543245','HR01'),
	(1011,'Reema','Narayan','Female','19981010','20210325','reemanarayan@gmail.com','3378374637','LBS Marg','Mumbai','Maharashtra','40076','SA01'),
	(1012,'Kartik','Goenka','Male','19901230','20180917','kartikgoenka@gmail.com','7923847562','Gandhi Niwas','Ahmedabad','Gujarat','686746','SD03'),
	(1013,'Vikas','Gupta','Male','19940623','20191205','vikasgupta@gmail.com','7927847636','Thakur Ground','Lucknow','Uttarpradesh','578392','SA02'),
	(1014,'Sarabjeet','Singh','Male','19960712','20170813','sarabjeetsingh@gmail.com','6734554365','Guru Dwara','Attari','Punjab','345672','SD01'),
	(1015,'Virat','Mathur','Male','19950712','20140621','viratmathur@gmail.com','2348957485','Santacruz Road','Mumbai','Maharashtra','324354','SA01'),
	(1016,'Heer','Singh','Female','19971120','20160410','heersingh@gmail.com','6472737648','Chinnaswamy Stadium','Bengaluru','Karnataka','325476','HR01'),
	(1017,'Yug','Rajput','Male','19910912','20160210','yugrajput@gmail.com','4563738256','Mhatare Bridge','Pune','Maharashtra','436782','AA02'),
	(1018,'Raghu','Jadhav','Male','19970715','20170130','raghujadhav@gmail.com','7438742974','Sakuntala Devi Chowk','Pune','Maharashtra','645637','SD01'),
	(1019,'Reena','Desai','Female','19960115','20180513','reenadesai@gmail.com','7438567387','Durga Mata Mandir','Pune','Maharashtra','748653','SD01'),
	(1020,'Sakuntala','Rathod','Female','19920409','20190705','sakuntalarathod@gmail.com','4876563746','Kanthor Road','Mumbai','Maharashtra','389747','HR02')

CREATE TABLE JobProject (
	PId VARCHAR(20)PRIMARY KEY,
	PName VARCHAR(55) NOT NULL,
	EmployeeId INT,
	StartDate DATE NOT NULL,
	EndDate DATE,
	PDetail VARCHAR (255),
	SupervisorEmployeeId INT NOT NULL,
	FOREIGN KEY (EmployeeId) REFERENCES Employee (EmployeeId),
	FOREIGN KEY (SupervisorEmployeeId) REFERENCES Employee (EmployeeId)
);

INSERT INTO JobProject (
    PId ,
	PName,
    EmployeeId ,
	StartDate ,
    EndDate ,
	PDetail,
	SupervisorEmployeeId
)
VALUES
    	('AA01','Ashling  Agency',1009,'20200514','20210401','Working on the Products Department',1012),
	('MA02','Mars Agency',1006,'20200714',NULL,'Working on Dashboard',1012),
   	('RP201','Reliance Partners',1002,'20200714',NULL,'Working on Graph Development',1006),
	('ZA01','Zillow Agency',1001,'20210220','20210630','Working on Login',1014),
	('TI02','Transportation Insights',1018,'20191201','20200702','Working on About Us.',1004),
	('TA01','Trafigura Agency',1008,'20210101','20210809','Working on Components',1012),
	('RPA02','RPA Agency',1019,'20200412','20210901','Working on Database',1004),
	('DA01','Digital Apps',1010,'20200104','20210330','Woking on Recruitment Process',1020),
	('VA01','Varo Agency',1011,'20190820','20200711','Software Develpoment Testing',1013),
	('MSA01','Mastery Agency',1003,'20210305',NULL,'Working on Employee Data',1009),
	('CL01','Coyote Logistics',1007,'20180517','20200502','Working On Navbars',1012),
	('PT02','Petromin',1004,'20200212','20210415','Working On Tables',1012)

CREATE TABLE LoginCredentials (
	EmployeeId INT NOT NULL,
	Username VARCHAR(55) PRIMARY KEY,
	Password VARCHAR(55) NOT NULL UNIQUE,
	FOREIGN KEY (EmployeeId) REFERENCES Employee (EmployeeId)
);

INSERT INTO LoginCredentials(
    EmployeeId,
    Username,
	Password
)
VALUES
    (1020,'sakuntalarathod',HASHBYTES('SHA1','sakuntalarathod')),
    (1016,'heersingh',HASHBYTES('SHA1','heersingh')),
	(1012,'kartikgoenka',HASHBYTES('SHA1','kartikgoenka')),
	(1004,'sethdhawan',HASHBYTES('SHA1','sethdhawan')),
	(1010,'simaroswal',HASHBYTES('SHA1','simaroswal')),
	(1017,'yugrajput',HASHBYTES('SHA1','yugrajput')),
	(1013,'vikasgupta',HASHBYTES('SHA1','vikasgupta'))