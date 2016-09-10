*Database characteristics*

Data are raw facts:

	* Conventional raw facts: number and text
	* Unconventional raw facts: images, drawings, fingerprints, maps, etc
	
Transformation from data to information involves work

Characteristics of databases:

	Persistency means data lasts longer
	Inter-related: relations between data points
	Shared: Links from database to applications, and to multiple users
	
Databases:
	* support daily operations and decision making
	* vital to modern organizations

*Organizational Roles*

Functional users - Work with data as part of their work
Information Technology users - Involved with designing and implementing databases

Types of Functional Users

	Indirect users: Least active users; passive role
	Direct users:
	Parametric users
	Power users: Most active users
	
Types of IT users

	Developer
	Database Administrator
	Data Administrator: Has most planning responsibilities
	
Large organizations have more specialization, small organizations have more variety

*DBMS overview and database definition*

Definition: Database Management System (DBMS) is a collection of components that supports the creation, use and maintenance of databases.

DBMS features:

	* Data acquisition
	* Storage
	* Dissemination
	* Maintenance
	* Retrieval
	* Formatting
	
Desktop DBMS support smaller groups of users, small data volumes

Embedded DBMS sold by value-added software resellers, require little maintenance

Database Definition distinguishes databases from spreadsheets and documents

	No planning required for standard docs/spreadsheets
	Planning is essential for databases
	Need to build a database diagram when starting
	Visual representation of table relationships
	
Standard tools for creating tables:

	Structured Query Language (SQL)
	Graphical tools, i.e. diagrams
	
Planning for databases:

	Requires planning
	Initial planning always essential, often laborious
	
*Non-Procedural Access"
	
Question: How much have software costs been reduced by non-procedural database access?

NPA allows users with limited skills to access data

No looping statements involved, makes it easy to get data; requires much less code

Big difference in software productivity; factor of 2-100

Examples of NPA: 

	Select statement in SQL
	Microsoft Access graphical tools
	No industry standard tools
	
Graphical tools provided for building complete applications

Reports enhance appearance of data (i.e. indentation)

NPA makes report creation possible without extensive coding

*Transaction Processing*

Transaction Management is about management of electronic goods

Examples

	Online banking
	E-travel
	E-Commerce
	
Transactions need to be processed reliably, with no loss of data due to concurrency

Examples:

	Airline reservation
	ATM transaction
	
DBMS prevents concurrent users from overwriting each other's transactions

Transparency means inner details of transaction processing are invisible

DBMS systems improve the productivity of developers (they don't need to write all of the code)

Transactions that fail in the course of the transaction cause rollbacks

*Data warehouse processing*

Traditional management hierarchy:

	Top: Strategic
	Middle: Tactical
	Lower: Operational
	
Operational examples:

	Resolution of delays
	Scheduling employees
	Restocking products
	
Tactical examples:

	Forecasting sales
	Choosing suppliers
	Determining annual staffing levels
	
Strategic examples:

	* Identify new markets
	* Determine pricing levels
	* Choose new locations
	
Operational databases support these functions

Reasons to get an operational database:

	* Faster processing
	* Larger volumes of business
	* Reduced personnel costs
	
Integration is necessary to connect operational, tactical and strategic data sets
	
Data Warehouse is a logically centralized data repositor where data from operational databases and other sources are integrated, cleaned and standardized to support business intelligence

Tangible benefit:

	* Increased revenue
	* Decreased expenses
	
Levels of data:

	* Individual-level data
	* Summarized data
	
Operational databases have a process orientation
Data warehouses have a subject orientation

BI processing requires substantial processing resources

DWs support tactical and strategic decision making
Different DBMS features for BI support

*DBMS technology evolution*