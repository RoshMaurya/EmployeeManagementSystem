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
	PId VARCHAR (20),
	FOREIGN KEY (Code) REFERENCES JobTitle (Code),
	FOREIGN KEY (PId) REFERENCES JobProject (PId)
);

INSERT INTO Employee(
    EmployeeId,FName,LName,Gender,DateOfBirth,
	DateJoined,Email,Phone,Street,City,State,ZipCode,Code,PId 
)
VALUES
    	(1001,'John','Cena','Male','19990519','20210809','johncena99@gmail.com','9988776655','Los Angeles','West Newbury','Massacuhusetts','12234','TD01','AA01'),
	(1002,'Dean','Ambrose','Male','19950801','20200501','deanambrose45@gmail.com','9482766250','Los Angeles','Cincinnati','Ohio','334455','SD01','AA01'),
    	(1003,'David','Joseph','Male','19980525','20150715','davidjoseph@gmail.com','9482766250','western most city','Pensacola','Florida','745964','AD02','RP201'),
	(1004,'Seth','Dhawan','Male','19900528','20190501','sethdhawan@gmail.com','2246878998','Mississippi River','Buffalo','Lowa','235698','SD03','MA02'),
	(1005,'Ronda','Norona','Female','19970201','20210601','rondanorona@gmail.com','6584930213','Mississippi River','Riverside','California','436578','AD02','RP201'),
	(1006,'Jinder','Mahal','Male','19950719','20210809','jindermahal@gmail.com','7638945629','Cow Town','Calgary','Canada','235464','SD02','RP201'),
	(1007,'Neeraj','Desai','Male','19971224','20201101','neerajdesai@gmail.com','4567819407','Elizabeth street','Panipat','Haryana','245364','AD02','PT02'),
	(1008,'Anuraj','Basu','Male','19990827','20210809','anuragbasu@gmail.com','8254869238','Eden Garden','Kolkata','West Bengal','235464','TD01','MA02'),
	(1009,'Prerna','Bajaj','Female','19950430','20210809','prernabajaj@gmail.com','5463278249','xyz colony','Visakhapatnam','Andra Pradesh','235464','SD02','MSA01'),
	(1010,'Simar','Oswal','Female','19970313','20200515','simaroswal@gmail.com','9283274654','Express Highway','Mumbai','Maharashtra','543245','HR01','DA01'),
	(1011,'Reema','Narayan','Female','19981010','20210325','reemanarayan@gmail.com','3378374637','LBS Marg','Mumbai','Maharashtra','40076','SA01','TI02'),
	(1012,'Kartik','Goenka','Male','19901230','20180917','kartikgoenka@gmail.com','7923847562','Gandhi Niwas','Ahmedabad','Gujarat','686746','SD03','AA01'),
	(1013,'Vikas','Gupta','Male','19940623','20191205','vikasgupta@gmail.com','7927847636','Thakur Ground','Lucknow','Uttarpradesh','578392','SA02','VA01'),
	(1014,'Sarabjeet','Singh','Male','19960712','20170813','sarabjeetsingh@gmail.com','6734554365','Guru Dwara','Attari','Punjab','345672','SD01','MA02'),
	(1015,'Virat','Mathur','Male','19950712','20140621','viratmathur@gmail.com','2348957485','Santacruz Road','Mumbai','Maharashtra','324354','SA01','VA01'),
	(1016,'Heer','Singh','Female','19971120','20160410','heersingh@gmail.com','6472737648','Chinnaswamy Stadium','Bengaluru','Karnataka','325476','HR01','DA01'),
	(1017,'Yug','Rajput','Male','19910912','20160210','yugrajput@gmail.com','4563738256','Mhatare Bridge','Pune','Maharashtra','436782','AA02','ZA01'),
	(1018,'Raghu','Jadhav','Male','19970715','20170130','raghujadhav@gmail.com','7438742974','Sakuntala Devi Chowk','Pune','Maharashtra','645637','SD01','AA01'),
	(1019,'Reena','Desai','Female','19960115','20180513','reenadesai@gmail.com','7438567387','Durga Mata Mandir','Pune','Maharashtra','748653','SD01','TI02'),
	(1020,'Sakuntala','Rathod','Female','19920409','20190705','sakuntalarathod@gmail.com','4876563746','Kanthor Road','Mumbai','Maharashtra','389747','HR02','DA01'),
	(1021,'Pratik','Phane','Male','1988-05-23','2019-10-05','pratikp@gmail.com','9856376590','Haglur Road','Barshi','Maharashtra','5783101','SD03','CL01'),
	(1022,'Aniket','Nimbalkar','Male','1983-02-21','2016-09-05','anikten@gmail.com','98563766554','Chandminar Road','Delhi','Uttarpradesh','5783119','AD02','PT02'),
	(1023,'Aishwarya','Wale','Female','1995-04-15','2019-08-04','awale@gmail.com','9767898750','Baramati Road','Baramati','Maharashtra','5783102','SA02','VA01'),
	(1024,'Aakash','Patil','Male','1983-06-12','2019-05-06','aakashpatil@gmail.com','8459910113','Indoor Road','Indoor','Uttarpradesh','5783103','SA01','VA01'),
	(1025,'Akshay','Swami','Male','1970-06-11','2008-11-04','akshayswami@gmail.com','8390507864','Balaji Road','Pondicherry','Tamilnadu','5783104','HR01','DA01'),
	(1026,'Shraddha','Birajdar','Female','1986-06-16','2019-01-04','shraddhab@gmail.com','9876543290','Hydrabad Road','Hydrabad','Aandrapradesh','5783105','TD01','RPA02'),
	(1027,'Amol','Kale','Male','1978-04-11','2015-11-04','amolkale@gmail.com','9843567870','Tahne Road','Mumbai','Maharashtra','5783106','SD03','MA02'),
	(1028,'Omkar','Sale','Male','1980-06-13','2017-11-06','omsale@gmail.com','7020874380','karve Road','Pune','Maharashtra','5783107','SD03','PT02'),
	(1029,'Pooja','Tripathi','Female','1989-06-04','2018-11-02','poojtri@gmail.com','9922463329','Bandra Road','Mumbai','Maharashtra','5783108','TD01','MSA01'),
	(1030,'Lavanya','Sandupatla','Female','1996-06-23','2019-06-04','lavanyas@gmail.com','8976543459','Sinhgad Road','Pune','Maharashtra','5783109','TD01','MA02'),
	(1031,'Prasad','Patil','Male','1990-06-22','2019-11-04','prasadpatil@gmail.com','8976543450','Vijapur Road','Solapur','Maharashtra','5783100','SD02','RPA02'),
	(1032,'Vinayak','Patil','Male','1980-06-22','2019-10-04','vinayakpatil@gmail.com','7076543453','Vilas Road','Jaipur','Rajasthan','5783110','AA02','ZA01'),
	(1033,'Vilas','Mane','Male','1987-04-15','2017-03-04','vilasmane@gmail.com','9467858750','Beera Road','Patna','Bihar','5783112','AD02','PT02'),
	(1034,'Shri', 'Mithe','Male','1983-06-12','2019-05-06','shrim@gmail.com','8459910113','Indoor Road','Indoor','Uttarpradesh','5783113','SA01','TA01'),
	(1035,'Akansha','Swami','Female','1988-06-11','2018-11-04','akanshas@gmail.com','8390555664','Bing Road','Bhopal','Madhyapradesh','5783114','SD02','TA01'),
	(1036,'Shreya','Mule','Female','1993-06-16','2019-01-04','shreya@gmail.com','9876543440','Meera Road','Hydrabad','Aandrapradesh','5783115','TD01','MSA01'),
	(1037,'Darshan','Handiwadi','Male','1981-04-11','2015-10-04','darshand@gmail.com','8967543580','Goregaon Road','Mumbai','Maharashtra','5783116','HR02','DA01'),
	(1038,'Aparna','Sugwe','Female','1988-06-17','2017-08-07','aparnasugwe@gmail.com','7020874678','Seva Road','Pune','Maharashtra','5783117','HR01','DA01'),
	(1039,'Minakshi','Dhande','Female','1988-04-02','2018-11-05','minakshid@gmail.com','9922463339','Gurudwar Road','Chandigrah','Punjab','5783118','TD01','CL01'),
	(1040,'Suvaran','Dhaye','Female','1983-05-23','2016-10-05','sdhaye@gmail.com','9856376658','Chandminar Road','Delhi','Uttarpradesh','5783111','AD02','RPA02')

CREATE TABLE JobProject (
	PId VARCHAR(20)PRIMARY KEY,
	PName VARCHAR(55) NOT NULL,
	PDetail VARCHAR (255),
	SupervisorEmployeeId INT,
	FOREIGN KEY (SupervisorEmployeeId) REFERENCES Employee (EmployeeId)
);

INSERT INTO JobProject (
    PId ,
	PName,
	PDetail,
	SupervisorEmployeeId
)
VALUES
    	('AA01','Ashling  Agency','Working on the Products Department',1012),
	('MA02','Mars Agency','Working on Dashboard',1027),
   	('RP201','Reliance Partners','Working on Graph Development',1006),
	('ZA01','Zillow Agency','Working on Login',1032),
	('TI02','Transportation Insights','Working on About Us.',1019),
	('TA01','Trafigura Agency','Working on Components',1035),
	('RPA02','RPA Agency','Working on Database',1031),
	('DA01','Digital Apps','Woking on Recruitment Process',1020),
	('VA01','Varo Agency','Software Develpoment Testing',1013),
	('MSA01','Mastery Agency','Working on Employee Data',1009),
	('CL01','Coyote Logistics','Working On Navbars',1021),
	('PT02','Petromin','Working On Tables',1028)

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