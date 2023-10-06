with name_occ as
(
SELECT concat(name, '(', left(occupation,1), ')') as name_pro
from occupations
)

,occ_count as
(
select concat('There are a total of ',
             counter,' ',
             case when pro = 'P' then 'professors.'
             when pro = 'D' then 'doctors.'
             when pro = 'S' then 'singers.'
             else 'actors.' end)
from(select left(occupation,1) as pro, count(*) as counter
        from occupations
        group by left(occupation,1)
        order by counter, pro
    )as sub
)

select * from name_occ
union
select * from occ_count
order by name_pro
