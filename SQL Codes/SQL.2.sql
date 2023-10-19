

-- 7. Month over month revenue growth of swiggy

select month, ((revenue - prev )/prev) * 100  as growthrate
from  
(
with sales_data as 
  (
  select monthname(date) as month, sum(amount) as revenue
  from orders
  group by monthname(date) 
  )
select *, lag(revenue) over(order by revenue ) as prev  
from sales_data 
) t ;

-- 8. Write a query to find Month over month revenue growth of "KFC" restaurant

select month, ((revenue-prev)/prev)*100 as growthrate
from 
(
select *, 
lag(revenue,1) over () as prev
from (
       select monthname(date) as month, sum(o.amount) as revenue 
       from orders o join restaurents r
       on o.r_id= r.r_id 
       where r_name = 'kfc'
       group by month
     ) t  
 ) a ;    
 #insight: revenue rate increased 53% in june and 95% in july
 
-- 9. Write a query to find Month over month revenue growth of "Dominos" restaurant 

select month, ((revenue-prev)/prev)*100 as growthrate
from 
(
select *, 
lag(revenue,1) over () as prev
from (
       select monthname(date) as month, sum(o.amount) as revenue 
       from orders o join restaurents r
       on o.r_id= r.r_id 
       where r_name = 'dominos'
       group by month
     ) t  
 ) a ;
 #insight: revenue rate decreased -5% in june and increased 15% in july


-- 10. Write a query to find most ordered or liked food  

select f.f_name, count(od.f_id) as count
from order_details od join food f
on od.f_id=f.f_id
group by f.f_name
order by count desc 
limit 1 ;
#insight: 'Choco Lava cake' is most ordered food


-- 11. Write a query to find favorite food of each Customer 

with temp as 
  (
   select o.user_id,od.f_id, count(*) as frequency
   from orders o join order_details od
   on o.order_id = od.order_id
   group by o.user_id,od.f_id
   )
select u.name, f.f_name,t1.frequency from 
temp t1 join users u
on u.user_id =t1.user_id
join food f
on f.f_id = t1.f_id 
where t1.frequency = (
                      select max(frequency)
                      from temp t2
                      where t2.user_id = t1.user_id
                      );
                      
                      
                      
-- 12. Write a query to find most loyal customer for each restaurents 

-- For KFC
select r.r_name, u.name, max(t.visits) as 'no of visists'
from (
      select r_id,user_id, count(order_id) as 'visits'
      from orders 
      group by r_id, user_id
	  having visits  > 1  
      ) t 
join restaurents r 
on r.r_id = t.r_id 
join users u
on u.user_id = t.user_id
where r.r_name='kfc'
group by r.r_name, u.name ;

-- For Dominos

select r.r_name, u.name, max(t.visits) as 'no of visists'
from (
      select r_id,user_id, count(order_id) as 'visits'
      from orders 
      group by r_id, user_id
	  having visits  > 1  
      ) t 
join restaurents r 
on r.r_id = t.r_id 
join users u
on u.user_id = t.user_id
where r.r_name='dominos'
group by r.r_name, u.name ;

-- For Dosa Plaza

select r.r_name, u.name, max(t.visits) 'no of visists'
from (
      select r_id,user_id, count(order_id) as 'visits'
      from orders 
      group by r_id, user_id
	  having visits  > 1  
      ) t 
join restaurents r 
on r.r_id = t.r_id 
join users u
on u.user_id = t.user_id
where r.r_name='Dosa Plaza'
group by r.r_name, u.name ;

-- For China Town

select r.r_name, u.name, max(t.visits) 'no of visists'
from (
      select r_id,user_id, count(order_id) as 'visits'
      from orders 
      group by r_id, user_id
	  having visits  > 1  
      ) t 
join restaurents r 
on r.r_id = t.r_id 
join users u
on u.user_id = t.user_id
where r.r_name='china town'
group by r.r_name, u.name ;
