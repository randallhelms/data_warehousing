DROP SCHEMA IF EXISTS module_3;
CREATE SCHEMA module_3;
USE module_3;

-- make customer table

CREATE TABLE Customer (
	custno VARCHAR(8) not null constraint customer_pk PRIMARY KEY,
	custname VARCHAR(50) not null,
	address VARCHAR(50) not null,
	Internal CHAR(1) not null,
	contact VARCHAR(50) not null,
	phone INTEGER(7) not null,
	city VARCHAR(30) not null,
	state CHAR(2) not null,
	zip INTEGER(5) not null,
);

-- make employee table

CREATE TABLE Employee (
	empno VARCHAR(8) not null,
	empname VARCHAR(30) not null,	
	department VARCHAR(20) not null,
	email VARCHAR(30) not null,
	phone CHAR(6) not null,
	PRIMARY KEY (empno)
);

-- make facility table

CREATE TABLE Facility (
	facno VARCHAR(8) not null,
	facname VARCHAR(50) not null,
	PRIMARY KEY (facno),
	CONSTRAINT UniqueFacName UNIQUE (FacName)

);

-- make location table

CREATE TABLE Location (
	locno VARCHAR(8) not null,
	facno CHAR(4) not null,
	locname VARCHAR(20) not null,
	PRIMARY KEY (locno),
	CONSTRAINT `FK_FACNO` FOREIGN KEY (FacNo) REFERENCES Facility (facno)
);

-- make resource table

CREATE TABLE ResourceTbl (
	resno VARCHAR(8) not null,
	resname VARCHAR(20),
	rate FLOAT(2) not null,
	PRIMARY KEY (resno),
	CHECK (rate > 0)
);

-- make event request table

CREATE TABLE EventRequest (
	eventno VARCHAR(8) not null,
	dateheld DATE not null,
	datereq DATE not null,
	facno CHAR(4) not null,
	custno CHAR(4) not null,
	dateauth DATE,
	status VARCHAR(10) not null,
	estcost FLOAT(2) not null,
	estaudience INTEGER(7) not null,
	budno CHAR(5),
	PRIMARY KEY (eventno),
	CONSTRAINT `FK_custno` FOREIGN KEY (custno) REFERENCES Customer (custno),
	CONSTRAINT `FK_facno` FOREIGN KEY (facno) REFERENCES Facility (facno),
	CONSTRAINT `ck_Audience` CHECK (estaudience > 0 AND status IN ("Pending","Denied","Approved"))
	);
	
-- make EventPlan table

CREATE TABLE EventPlan (
	planno VARCHAR(8) not null,
	eventno CHAR(4) not null,
	workdate DATE not null,
	notes VARCHAR (50),
	activity VARCHAR(20) not null,
	empno CHAR(4),
	PRIMARY KEY (planno),
	CONSTRAINT `FK_empno` FOREIGN KEY (empno) REFERENCES Employee (empno),
	CONSTRAINT `FK_eventno` FOREIGN KEY (eventno) REFERENCES EventRequest (eventno)	
	);
	
-- make EventPlanLine table

CREATE TABLE EventPlanLine (
	PlanNo CHAR(4) not null,
	LineNo VARCHAR(8) not null,
	TimeStart DATETIME not null,
	TimeEnd DATETIME not null,
	NumberFld CHAR(1) not null,
	LocNo CHAR(4) not null,
	ResNo CHAR(4) not null,
	PRIMARY KEY (LineNo),
	CONSTRAINT `FK_ResNo` FOREIGN KEY (ResNo) REFERENCES ResourceTbl (resno),
	CONSTRAINT `FK_LocNo` FOREIGN KEY (LocNo) REFERENCES Location (locno)
		);