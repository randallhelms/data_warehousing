--make customer table

CREATE TABLE Customer (
	custno CHAR(4) not null,
	custname VARCHAR(50) not null,
	address VARCHAR(50) not null,
	Internal CHAR(1) not null,
	contact VARCHAR(50) not null,
	phone INTEGER(7) not null,
	city VARCHAR(30) not null,
	state BOOLEAN(2) not null,
	zip INTEGER (5),
	CONSTRAINT CustomerPK PRIMARY KEY (custno)
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