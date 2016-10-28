Select er.eventno as event_number, er.dateheld as event_date, COUNT(ep.planno) as total_event_plans

FROM EventRequest er

JOIN EventPlan ep

ON er.eventno = ep.eventno
  
WHERE ep.workdate BETWEEN '2013-12-01' AND '2013-12-31'

GROUP BY event_number, event_date

HAVING total_event_plans > 1;