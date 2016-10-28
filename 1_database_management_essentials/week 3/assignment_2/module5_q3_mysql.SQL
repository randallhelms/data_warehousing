Select EventRequest.eventno as event_number, EventRequest.dateheld as event_date, EventRequest.status as status, EventRequest.estcost as estimated_cost

FROM EventRequest,EventPlan,Facility,Employee

WHERE EventRequest.eventno = EventPlan.eventno
	AND EventRequest.facno = Facility.facno
	AND EventPlan.empno = Employee.empno
	AND Facility.facname = 'Basketball arena'
	AND Employee.empname = 'Mary Manager'
	AND EventRequest.dateheld BETWEEN '2013-10-01' AND '2013-12-31'

GROUP BY event_number, event_date,status, estimated_cost;