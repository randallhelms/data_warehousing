Use dwh_test;

Select empname,department,email,phone

from Employee

Where phone like '3-%'

Group By empname,department,email,phone;