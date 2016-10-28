--List Leonard Vince's teaching schedule in fall 2012
--For each course, list offering number, course number, number of units, days, location, time

Select OfferNo,Offering.CourseNo,CrsUnits,OffDays,OffLocation,OffTime

FROM Faculty, Course, Offering

WHERE Faculty.FacNo = Offering.FacNo

	AND Offering.CourseNo = Course.CourseNo
	AND OffYear = 2012 AND OffTerm = 'FALL'
	AND FacFirstName = 'Leonard'
	AND FacLastName = 'Vince';