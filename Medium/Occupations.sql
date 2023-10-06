with doc_names as(
select name, Row_number() over(order by name) as my_row
from occupations
where occupation = 'Doctor'
)
,prof_names as(
select name, Row_number() over(order by name) as my_row
from occupations
where occupation = 'Professor'
)
, sing_names as(
select name, Row_number() over(order by name) as my_row
from occupations
where occupation = 'Singer'
)
,act_names as(
select name, Row_number() over(order by name) as my_row
from occupations
where occupation = 'Actor'
)

select d.name, p.name, s.name, a.name
from prof_names as p
left join doc_names as d
using(my_row)
left join act_names as a
using(my_row)
left join sing_names as s
using(my_row)
