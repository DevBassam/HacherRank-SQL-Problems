with h_ch_count as(
select h.hacker_id, h.name, count(c.challenge_id) as ch_count
from hackers as h
inner join challenges as c
using(hacker_id)
group by h.hacker_id, h.name
order by ch_count desc,h.hacker_id
)

select * 
from h_ch_count
where ch_count in (select ch_count
                    from h_ch_count
                    group by ch_count
                    having count(*) = 1 or ch_count = (select max(ch_count)
                                                       from h_ch_count))
