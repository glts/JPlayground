NB. From "Continuing to write in J".
NB. See http://www.jsoftware.com/help/jforc/continuing_to_write_in_j.htm

empno=: 316 317 319 320
payrate=: 60 42 44 54
billrate=: 120 90 90 108
clientlist=: 10011 10012 10025
emp_client=: 10012 10025 10012 10025
hoursworked=: 4 31 $ 8 0 3 10 9 8 8 9 4 0 8 7 10 10 12 9 0 6 8 9 9 9 0 0 10 11 9 7 10 2 0 8 0 0 9 9 8 9 10 0 0 8 8 10 7 10 0 0 7 8 9 8 9 0 4 9 8 9 8 9 0 0 5 0 0 8 9 9 9 9 0 0 8 7 0 0 9 0 2 10 10 9 11 8 0 0 8 9 10 8 9 0 0 9 0 0 9 10 8 6 6 8 0 9 8 10 6 9 7 0 6 8 8 8 9 0 5 8 9 8 8 12 0 0

NB. Finds the number of hours each employee worked in the given month.
emphours=: 3 : '+/"1 hoursworked'

NB. Determines the wages earned by each employee in the given month.
empearnings=: 3 : 'payrate * +/"1 hoursworked'

NB. Determines the profit brought in by each employee.
empprofit=: 3 : 0
(billrate - payrate) * +/"1 hoursworked
)

NB. Returns the amount to bill a given client.
billclient=: 3 : 0
mask=. emp_client = y
+/ (mask # billrate) * +/"1 mask # hoursworked
)

NB. Finds for each day of the month the employee who billed the most hours.
dailydrudge=: 3 : 0
((|: hoursworked) i."1 0 >./ hoursworked) { empno
)

NB. Main

NB. Problem 1
echo emphours''

NB. Problem 2
echo empearnings''

NB. Problem 3
echo empprofit''

NB. Problem 4
echo billclient 10025

NB. Problem 5
echo dailydrudge''
