Use dwh_test;

Select eventno,dateauth,status

from EventRequest

Where (status IN ('Approved','Denied')) AND (dateauth like '2013-07-%')

Group By eventno,dateauth,status;