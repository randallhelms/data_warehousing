--retrieve basic data about all university people

SELECT FacNo AS PerNo, FacFirstName AS FirstName, FacLastName as LastName, FacCity as City, FacState as State

FROM Faculty

	UNION
	
Select StdNo as PerNo, StdFirstName as FirstName, StdLastName as LastName, StdCity as City, StdState as State

FROM Student;