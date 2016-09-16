**Relational Data Model and the CREATE TABLE Statement**

**Basics of relational databases**

Table listing shows column heading in first row
Body in subsequent rows

Connections between tables must be understood

If different tables have matching column, that can be used as a key

	Table-oriented terminologies
	* Table
	* Row
	* Column
	
	Set-oriented terminologies
	* Relation
	* Tuple
	* Attribute
	
*Integrity rules*

Entity integrity: primary keys

	* Each table has column(s) with unique values
	* No missing values for primary keys
	* Ensure traceable entities
	
Important that business entities are traceable and unique

Referential integrity: foreign keys
	
	Values of column in one table match values from a source table
	Ensure valid references among tables
	
Database diagram important tool for understanding relationships

Relationships can be:

	One to one
	One to many
	Many to one
	Many to many
	
Naming conventions can be very helpful for mapping relationships

**Basic SQL CREATE TABLE statement**

CREATE TABLE is SQL method of creating new table in database

CREATE TABLE syntax

	CREATE TABLE <table_name> (<column_list> [<constraint_list])
	Column list with data types and optional and inline constraints
	Optional external constraint list

Basic example

	CREATE TABLE Student
	(	StdNo			CHAR(11),
		STDFIrstName	VARCHAR(50),
		STDLastName		VARCHAR(50),
		STDCity			VARCHAR(50),
		STDGPA			DECIMAL(3,2)
	)
	
Syntax errors

	Keywords must be spelled exactly
	Each column is terminated with a comma
	
Common SQL data types

	CHAR = Character string (exact)
	VARCHAR = Variable length character strength (number is maximum characters)
	INTEGER = Whole numbers
	FLOAR(P) = Decimal number with floating precisiion
	DECIMAL(W,R) = Numbers with fixed decimal places
	DATE
	
**Integrity Constraint Syntax**

Why are constraint names important?

Subjects constraints

	PRIMARY KEY 
	FOREIGN KEY
	UNIQUE - Other columns besides primary that are unique
	REQUIRED (NOT NULL) - Indicate that a value must be entered, no null values allowed
	CHECK - Conditions that a column must follow
	
Placement constraints

	Inline - Part of column definition
	External - After column definitions
	
Examples

	CONSTRAINT PkCourse PRIMARY KEY (CourseNo)
	CONSTRAINT UniqueCrsDesc UNIQUE (CrsDesc)
	CONSTRAINT OffCourseNoReq (NOT NULL)
	
CONSTRAINT optional for inline constraints

Multiple column constraints must be placed externally

Examples

	CONSTRAINT ValidGPA CHECK (StdGPA BETWEEN 0 AND 4)
	CONSTRAINT ValidStdClass
		CHECK ( StdClass IN ('FR','SO','JR','SR' )
	CONSTRAINT OffYearValid CHECK ( OffYear > 1970 )
	
Meaningful Constraints help database administrators

Need to read up MySQL syntax limitations