Use dwh_test;

Select joined.ep.planno as planno, count(joined.epl.PlanNo) as event_plan_count, sum(rt.rate) as resources_assigned

from (

	Select planno
	
	FROM EventPlan ep

	JOIN (Select PlanNo,ResNo from EventPlanLine) as epl
	
	ON ep.planno = epl.PlanNo

	) as joined

JOIN (Select resno, rate from ResourceTbl) as rt

ON joined.epl.resno = rt.ResNo

GROUP BY planno;