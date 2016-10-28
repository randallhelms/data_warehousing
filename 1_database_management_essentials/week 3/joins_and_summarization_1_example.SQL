--List offering number, number of students enrolled, and average GPA in each 2013 course offering
--Only include offerings with an average GPA greater than 3.3

Select Offering.OfferNo, 
	Count (*) AS NumStudents, --computer column with renaming
	AVG (StdGPA) AS AvgGPA --computer column with renaming

FROM Enrollment, Offering, Student

WHERE Offering.OfferNo = Enrollment.OfferNo --pk/fk join
	AND Student.StdNo = Enrollment.StdNo --pk/fk join
	AND OffYear = 2013
	
GROUP BY Offering.OfferNo --need to qualify OfferNo as it is a common column
HAVING AVG(StdGPA)>3.3;  --includes condition with AVG function