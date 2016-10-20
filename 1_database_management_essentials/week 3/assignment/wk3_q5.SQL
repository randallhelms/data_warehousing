Use dwh_test;

Select Location.locno as locno,Location.locname as locname

from Location

JOIN Facility

ON Location.facno = Facility.facno

WHERE Facility.facname like "Basketball%"

GROUP BY locno,locname;