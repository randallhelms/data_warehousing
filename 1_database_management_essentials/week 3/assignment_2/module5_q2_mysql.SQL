SELECT EventPlan.planno as plan_number, EventPlan.eventno as event_number, EventPlan.workdate as work_date, EventPlan.activity as activity

FROM EventPlan, EventPlanLine,Location,Facility

WHERE EventPlan.planno = EventPlanLine.PlanNo
	AND EventPlanLine.LocNo = Location.locno
	AND Location.facno = Facility.facno
	AND Facility.facname = 'Basketball arena'
	AND EventPlan.workdate BETWEEN '2013-12-01' AND '2013-12-31'

GROUP BY plan_number, event_number, work_date, activity;