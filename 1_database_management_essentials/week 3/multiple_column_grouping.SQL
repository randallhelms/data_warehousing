--List course number, offering number, and number of students enrolled
--Only courses in spring 2013
--Every column in SELECT clause must be in GROUP BY clause, except for columns used in aggregate functions

SELECT CourseNo, Enrollment.OfferNo, Count (*) AS NumStudents

FROM Offering, Enrollment

WHERE Offering.OfferNo = Enrollment.OfferNo
	AND OffYear = 2013 AND OffTerm = 'SPRING'
	
GROUP BY Enrollment.OfferNo, CourseNo;