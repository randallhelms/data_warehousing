--Change the major and class of Joe Student

UPDATE Student
SET StdMajor = 'ACCT',
		StdClass = 'SO'
WHERE StdFirstName = 'JOE'
	AND StdLastName = 'STUDENT';