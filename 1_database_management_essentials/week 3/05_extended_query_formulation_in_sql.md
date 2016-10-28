**Query formulation guidelines with SQL**

Query formulation is a process:

	1. Problem statement
	2. Database representation
	3. Database language statement
	
Critical questions:

	What tables?
		Columns in result
		Conditions to test (including join conditions)
		
	How to combine the tables?
		Usually join of PK to FK
		More complex ways to combine
		
	Individual rows or groups of rows?
		Aggregate functions in result
		Conditions with aggregate functions, i.e. 'courses with more than 30 students'
		
Database diagram can help you to understand connections between different tables, i.e. when you need to use an intermediary table to facilitate an indirect connections

Efficiency considerations:

	Little concern for efficiency with today's intelligent SQL compilers
	Correct and non redundant solution:
	
		No extra tables
		No unnecessary grouping
		No missing join conditions
		
	HAVING clause is likely to slow the performance of the query execution

Summary:

	Remember the query formulation process
	Use critical questions to convert problem statement into a database representation
	Check for unnecessary tables and missing join conditions
	Much practice with more difficult problems involving joins and grouping
	
**Multiple table problems**

What are some problems with multiple tables?

	Have a mental image of the query formulation process
	Use critical questions for converting a problem statement into a database representation
	Each statement has 1 join condition less than the number of joined tables
	With n tables, you need n-1 join operations
	Sometimes more, but typically not
	
**Problems involving join and grouping operations**

What are some issues when running join and group operations?

	Remember the query formulation process
	Use critical questions to convert problem statement into a database representation
	Use a database diagram for connections among tables
	
	Joins and groupings are very common tools in business intelligence
	
**SQL set operators**

UNION operator is the most important SQL set operator

Set operators:

	UNION = all members of two sets
	INTERSECT = common members of two sets
	MINUS = members unique to only one set
	
Traditional set operators assume that members of two sets can be compared

UNION compatibility

	Requirement for the traditional set operators; they are not so common in queries
	Strong requirement
		Same number of columns
		Each corresponding column is compatible
		Positional correspondence
		Data type compatibility
	Apply to similar tables by removing columns first
	
Typically applied to subset of each table

UNION operator is used to combine tables distributed over multiple locations

Union operator has important use in distributed and partitioned databases

**SQL modification statements**

Why are modification statements less widely used than select statement?

	Users make modifications more rarely than they query data
	They are simpler than SELECT statement
	Most usage done by database administrators
	There are important variations for data integration usage
	
The modification statements are:

	UPDATE: Update values in a database
	INSERT: Insert new values into a database (need to be sure that table can support all new values)
	DELETE: Delete values from a database