Select EventPlan.planno as plan_number, EventPlanLine.LineNo as line_number,
  ResourceTbl.resname as resource_name, sum(EventPlanLine.NumberFld) as number_of_resources,
  Location.locname as location_name, EventPlanLine.TimeStart as time_start,
  EventPlanLine.TimeEnd as time_end

FROM EventPlan,EventPlanLine,ResourceTbl,Location,Facility

WHERE EventPlan.planno = EventPlanLine.PlanNo
	AND EventPlanLine.LocNo = Location.locno
	AND Location.facno = Facility.facno
	AND EventPlanLine.ResNo = ResourceTbl.resno
	AND Facility.facname = 'Basketball arena'
	AND EventPlan.activity = 'Operation'
	AND EventPlan.workdate BETWEEN '2013-10-01' AND '2013-12-31'

GROUP BY plan_number, line_number, resource_name, location_name,time_start,time_end

ORDER BY number_of_resources DESC;