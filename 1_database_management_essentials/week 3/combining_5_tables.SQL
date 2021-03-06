--List Bob Norbert's course schedule in spring 2013
--List offering number, course number, days, location, time, course units, faculty name

SELECT Offering.OfferNo, Offering.CourseNo, OffDays, OffLocation, OffTime, CrsUnits, FacFirstName,FacLastName

FROM Faculty, Offering, Enrollment, Student, Course

WHERE Faculty.Facno = Offering.Facno --pk/fk join relationship
	AND Offering.OfferNo = Enrollment.OfferNo --pk/fk join relationship
	AND Student.StdNo = Enrollment.StdNo --pk/fk join relationship
	AND Offering.CourseNo = Course.CourseNo --pk/fk join relationship
	AND OffYear = 2013 AND OffTerm = 'Spring' 
	AND FacFirstName = 'BOB'
	AND FacLastName = 'NORBERT';