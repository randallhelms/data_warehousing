--module 3 assignment

--NOTE: UNFINISHED

--make customer table

CREATE TABLE Customer (
	custno CHAR(4) not null,
	custname VARCHAR(50) not null,
	address VARCHAR(50) not null,
	Internal BOOLEAN(2) not null,
	contact VARCHAR(50) not null,
	phone INTEGER(7) not null,
	city VARCHAR(30) not null,
	state CHAR(2) not null,
	zip INTEGER (5),
	CONSTRAINT CustomerPK PRIMARY KEY (custno)
)

--make employee table

CREATE TABLE Employee (
	empno CHAR(4),
	empname VARCHAR(30) not null,
	department VARCHAR(20),
	email VARCHAR(30),
	phone CHAR(6)
	
)

--make facility table

CREATE TABLE Facility (
	facno CHAR(4) not null,
	facname VARCHAR(50) not null,
	CONSTRAINT FacilityPK PRIMARY KEY (facno),
	CONSTRAINT UniqueFacName UNIQUE (FacName)

)

--make location table

CREATE TABLE Location (
	locno CHAR(4),
	facno CHAR(4) not null,
	locname VARCHAR(20) not null,
	CONSTRAINT LocationPK PRIMARY KEY (locno),
	CONSTRAINT FK_FACNO FOREIGN KEY (FacNo) REFERENCES Facility (facno)
)

--make resource table

CREATE TABLE ResourceTbl (
	resno CHAR(4),
	resname VARCHAR(20),
	rate FLOAT(2)
)

--make event request table

CREATE TABLE EventRequest (
	eventno CHAR(4),
	dateheld DATE,
	datereq DATE,
	facno CHAR(4),
	custno CHAR(4),
	dateauth DATE,
	status VARCHAR(10),
	estcost FLOAT(2),
	estaudience INTEGER(7),
	budno CHAR(5)
	)
	
--make EventPlan table

CREATE TABLE EventPlan (
	planno CHAR(4),
	eventno CHAR(4),
	workdate DATE,
	notes VARCHAR (50),
	activity VARCHAR(20),
	empno CHAR(4)
	)