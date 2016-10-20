DROP SCHEMA IF EXISTS dwh_test;
CREATE SCHEMA dwh_test;
USE dwh_test;

-- make customer table

CREATE TABLE Customer (
	custno VARCHAR(8) not null,
	custname VARCHAR(50) not null,
	address VARCHAR(50) not null,
	internal CHAR(1) not null,
	contact VARCHAR(50) not null,
	phone INTEGER(7) not null,
	city VARCHAR(30) not null,
	state CHAR(2) not null,
	zip INTEGER(5) not null,
	PRIMARY KEY (custno)
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
	UNIQUE (facname)

);

-- make location table

CREATE TABLE Location (
	locno VARCHAR(8) not null,
	facno VARCHAR(8) not null,
	locname VARCHAR(30) not null,
	PRIMARY KEY (locno),
	FOREIGN KEY (facno) REFERENCES Facility (facno)
);

-- make resource table

CREATE TABLE ResourceTbl (
	resno VARCHAR(8) not null,
	resname VARCHAR(20),
	rate FLOAT(2) not null,
	PRIMARY KEY (resno),
);

-- make event request table

CREATE TABLE EventRequest (
	eventno VARCHAR(8) not null,
	dateheld DATE not null,
	datereq DATE not null,
	custno VARCHAR(8) not null,	
	facno VARCHAR(8) not null,
	dateauth DATE,
	status VARCHAR(10) not null,
	estcost FLOAT(2) not null,
	estaudience INTEGER(7) not null,
	budno CHAR(5),
	PRIMARY KEY (eventno),
	FOREIGN KEY (custno) REFERENCES Customer (custno),
	FOREIGN KEY (facno) REFERENCES Facility (facno),
	);
	
-- make EventPlan table

CREATE TABLE EventPlan (
	planno VARCHAR(8) not null,
	eventno VARCHAR(8) not null,
	workdate DATE not null,
	notes VARCHAR (50),
	activity VARCHAR(20) not null,
	empno VARCHAR(8),
	PRIMARY KEY (planno),
	FOREIGN KEY (empno) REFERENCES Employee (empno),
	FOREIGN KEY (eventno) REFERENCES EventRequest (eventno)	
	);
	
-- make EventPlanLine table

CREATE TABLE EventPlanLine (
	PlanNo CHAR(4) not null,
	LineNo VARCHAR(8) not null,
	TimeStart DATETIME not null,
	TimeEnd DATETIME not null,
	NumberFld INTEGER(1) not null,
	LocNo VARCHAR(8) not null,
	ResNo VARCHAR(8) not null,
	PRIMARY KEY (LineNo),
	FOREIGN KEY (ResNo) REFERENCES ResourceTbl (resno),
	FOREIGN KEY (LocNo) REFERENCES Location (locno)
	);
	
DELIMITER $$

CREATE TRIGGER ck_audience BEFORE INSERT ON dwh_test1.EventRequest
FOR EACH ROW 
BEGIN 
    SET new.estaudience = GREATEST(1, new.estaudience)
END IF; 
END;$$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER ck_status BEFORE INSERT ON dwh_test1.EventRequest
FOR EACH ROW 
BEGIN 
    SET new.status IN ("Pending","Denied","Approved")
END IF; 
END;$$
DELIMITER ;

DELIMITER $$

CREATE TRIGGER ck_rate BEFORE INSERT ON dwh_test1.ResourceTbl
FOR EACH ROW 
BEGIN 
    SET new.rate = GREATEST(1, new.rate)
END IF; 
END;$$

DELIMITER ;