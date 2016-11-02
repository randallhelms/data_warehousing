**Database development goals**

Databases are essential components of many information systems

Provide long-term memory for information systems

	Inputs -> Processes -> Outputs
	Environment -> Processes -> Environment
	
Database development is most important activity for development effort of new business

Broad goals of database development:

	Develop common vocabulary for various users: 
		Not easy
		Must satisfy many users (a bit like being a politician)
	Define business rules
		Support business policies
		Example: Important rule is that order must precede shipment
		Can be passive and active rules
	Ensure data quality
		Poor data quality can lead to poor decision making, poor understanding
	Provide efficient implementation
		
**Basic ERD Notation**

Entity Relationship Diagram (ERD) is a way to map out the relations between databases

No standard for ERDs

Three basic symbols in an ERD:

	Entity Type: 
		Rectangles represent them
		a table with its columns (entities)
	Relationship Name: Names of type of relationship, i.e. HAS
	Relationship Symbol: depicts type of relationship
	
Cardinality symbols:

		Crow's foot: Many cardinality (many variations)
		Circle: zero cardinality
		Outside symbol: Maximum cardinality
		Inside symbol: Minimum cardinality
		Perpendicular line: One cardinality

ERDs have a natural language relationship; Entity types as nouns, relationship names as verbs

Cardinalities constrain number of objects participating in a relationship
	
	Classified by minimum and maximum values
	
	Mandatory = minimum cardinality >= 1
	Optional = minimum cardinality = 0
	Functional or single-valued = minimum cardinality = 1
	
Examples: Part can be provided by many suppliers, and suppliers can offer many parts

Differences between ERDs and Relational Database Diagrams:

	ERDs have more information than RDBDs
	ERDs use names for relationships
	ERD is supplement to RDBD 

**Relationship variations, part 1**

Key question: what is the difference between existence dependency and identification dependency? 

Two key types of relationship variations:

	Identification dependencys
	M-N relationship (many to many relationship) and associative entity types
	
Identification dependency

	Entity types may not necessarily have a primary key
	Weak entity type: borrows part or entire primary key
	Identifying relationship: provides a component of a primary key for a weak entity type
	Identification dependency: weak entity type and one or more identifying relationships
	ERD symbol is a diagonal line in the corner of the rectangle
	
Why does it occur?

	Because some entities are closely associated with other entities
	Example: a room does not have an identity separate from its building, because a room is physically contained in a building
	
M-N relationships can have multiple attributes

	Example, EnrolledGrade can be attribute of both Student and Offering
	Or, AuthOrder is attribute of both Author and Book
	
M-N Relationship Equivalency Rule

	Replace M-N relationship with:
		Associative entity type: 
			New entity to go between two other ones
			Student -> EnrollsIn -> Offering
			Student -> Enrollment (entity) -> Offering
		Two identifying 1-M relationships
	Associative entity type is more flexible in some situations
		Exists to connect other entities

Summary
	
	Specialized relationships are not common but important when necessary
	Do not useruse specialized relationships
	Avoid notation errors when specifying
	
**Relationship variations, part 2**

Self-referencing relationships

	Sometimes called reflexive relationships, because they are like a reflection in a mirror
	Start and terminate with same entity type
	Can be an important part of the database
	
Associative entity types for M-Way relationships

	M-Way relationship: association of more than 2 entity types
	Indirect relationship: associative entity type and a collection of 1-M relationships
	Rare to have more than 3 relationships
	
When should it be used?

	Not needed when db needs to record pairs of facts
	
Instance diagrams

	Depict self-referencing relationships
	Show 1-M self referencing
	Show M-N self-referencing