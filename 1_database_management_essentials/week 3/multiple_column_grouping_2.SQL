--List offering number, course number, faculty first name, faculty last name and average GPA
--Only courses in fall 2012 in which average GPA is above 3.0

SELECT Enrollment.OfferNo, CourseNo, FacFirstName, FacLastName, AVG (StdGPA) AS AvgGPA

FROM Offering, Enrollment, Student, Faculty

WHERE Offering.OfferNo = Enrollment.OfferNo
	AND Student.StdNo = Enrollment.StdNo
	AND Faculty.FacNo = Offering.FacNo
	AND OffYear = 2013 AND OffTerm = 'FALL'
	
GROUP BY Enrollment.OfferNo, CourseNo,FacFirstName,FacLastName
HAVING AVG (StdGPA) > 3.0;