use `awesomeproduct`;

insert into `monthly summary`

select date_format(s.saledate, '%Y%m'), pr.pid, p.spid, sum(s.Amount), count()
    sum(
    if(s.amount>1000, 1, 0)),
    sum(
    if(s.amount>5000, 1, 0)),
    sum(s.Boxes)
from `awesome product`.sales s
join `awesome product`.people p on p.spid = s.spid
join `awesome product`.products pr on pr.PID = s.pid
group by p.salesperson, pr.Product,
date_format(s.saledate, '%Y%m')