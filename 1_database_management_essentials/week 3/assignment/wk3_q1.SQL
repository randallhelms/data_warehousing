Use dwh_test;

Select city,state,zip

from Customer

Group By city,state,zip;