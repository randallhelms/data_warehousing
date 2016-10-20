Use dwh_test;

Select ep.planno as planno, count(epl.PlanNo) as event_plan_count, sum(rt.rate) as resources_assigned

FROM EventPlan ep

INNER JOIN EventPlanLine epl ON ep.planno = epl.PlanNo
INNER JOIN ResourceTbl rt ON epl.ResNo = rt.resno

GROUP BY planno

ORDER BY event_plan_count DESC;