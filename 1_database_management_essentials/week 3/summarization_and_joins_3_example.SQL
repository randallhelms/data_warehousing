--List offering number, course number, and average GPA
--Only include courses offered in fall 2012 in which average GPA is greater than 3.0

--Example of extra table redundancy (see Course)

SELECT Enrollment.OfferNo, CourseNo, AVG(StdGPA) AS AvgGPA

FROM Offering, Enrollment, Student, Course --Combines multiple tables

WHERE Offering.OfferNo = Enrollment.OfferNo --one join

	AND Student.StdNo = Enrollment.StdNo --second join
	
	AND OffYear = 2012 AND OffTerm = 'FALL'
	
GROUP BY Enrollment.OfferNo, CourseNo

HAVING AVG (StdGPA) > 3.0;