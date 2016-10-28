--List number of students enrolled in each 2013 course offering, showing the offer number and number of students in the result

Select Offering.OfferNo, 
	
	Count (*) AS NumStudents

FROM Enrollment, Offering

WHERE Offering.OfferNo = Enrollment.OfferNo 

	AND OffYear = 2013 
	
GROUP BY Offering.OfferNo; --need to qualify OfferNo as it is a common column