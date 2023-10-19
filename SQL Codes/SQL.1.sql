

use swiggy;

-- 1. Find customers who have never ordered

select * from users
where user_id not in ( select user_id from orders ) ;
# insight: two users have not at all ordered any things 


-- 2. Average Price/dish

select f.f_id,f.f_name, avg(price) as average_price
from food f join menu m
on f.f_id= m.f_id
group by f.f_id,f.f_name 
order by average_price desc ; 
# insight: Highest average price of food is Rs 450 and lowest is Rs 98


-- 3. Find the top restaurant in terms of the number of orders for a given month

select r_name, count(order_id ) as ordercount
from orders o join restaurents r 
on o.r_id = r.r_id 
where monthname(date) like 'may' 
group by r_name 
order by ordercount desc 
limit 1 ;
# insights: Dosa Plaza has highest orders in May month


select r_name, count(order_id ) as ordercount
from orders o join restaurents r 
on o.r_id = r.r_id 
where monthname(date) like 'june' 
group by r_name 
order by ordercount desc 
limit 1 ;
# insights: KFC has highest orders in June month



select r_name, count(order_id ) as ordercount
from orders o join restaurents r 
on o.r_id = r.r_id 
where monthname(date) like 'july' 
group by r_name 
order by ordercount desc 
limit 1 ;
# insights: KFC has highest orders in July



-- 4. restaurants with monthly sales greater than x for 

select r.r_name,sum(o.amount) as revenue
from orders o join restaurents r 
on o.r_id = r.r_id 
where monthname(o.date) = 'may' 
group by r.r_name 
having revenue >=500
order by revenue desc ;
#insight: kfc, dosa plaza and dominos have revenue more than x

select r.r_name,sum(o.amount) as revenue
from orders o join restaurents r 
on o.r_id = r.r_id 
where monthname(o.date) = 'june' 
group by r.r_name 
having revenue >=500
order by revenue desc ;

select r.r_name,sum(o.amount) as revenue
from orders o join restaurents r 
on o.r_id = r.r_id 
where monthname(o.date) = 'july' 
group by r.r_name 
having revenue >=500
order by revenue desc ;


-- 5. Show all orders with order details for a particular customer in a particular date range

select o.order_id, r.r_name, f.f_name
from orders o
join restaurents r 
on o.r_id =r.r_id 
join order_details od 
on o.order_id = od.order_id
join food f 
on f.f_id = od.f_id 
where user_id = (select user_id from users 
				where name like 'Ankit' )
 and ( date > '2022-06-10' and date < '2022-07-10' ) ;


-- 6. Find the restaurants with maximum repeated loyal customers 

select r.r_name, count(*) as loyalcustomers
from (
     select r_id,user_id, count(order_id) as 'visits'
      from orders 
      group by r_id, user_id
      having visits  > 1 )  t
join restaurents r 
on r.r_id = t.r_id 
group by r.r_name
order by loyalcustomers  desc  ;
#insight: kfc has highest loyal / repeated customers

