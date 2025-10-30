select e.name as name, b.bonus as bonus
from
Employee as e
left join
Bonus as b
on 
e.empID = b.empID
where b.bonus< 1000 or b.bonus is NULL;