USE dwh_test;

Select ep.planno as planno, count(epl.PlanNo) as event_plan_count, sum(epl.NumberFld) as resources_assigned

FROM EventPlan ep

INNER JOIN EventPlanLine epl ON ep.planno = epl.PlanNo

GROUP BY planno

ORDER BY event_plan_count DESC;