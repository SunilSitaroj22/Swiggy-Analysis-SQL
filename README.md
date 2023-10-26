# Swiggy Data Analysis-SQL

## Introduction
Swiggy is an Indian online food ordering and delivery platform. Founded in 2014, Swiggy is headquartered in Bangalore and operates in more than 500 Indian cities.

This case study contains orders data in the month of may,jun, july. There are 7 tables present in this dataset,They are

1. Users: Contains basic user information about users like, user_id,name,emial,password.
2. Restaurents: Contains restaurents details like restaurent_id,restaurent_name,cuisine
3. Food: Attributes like food_id,food_name,food_type
4. Menu: menu_id,restaurent_id,food_id,price
5. Order: order_id,user_id,r_id,amount,date,partner_id,delivery_time,delivery_rating,restaurant_rating
6. Order details: id,order_id,food_id
7. Delivery partners: partner_id,partner_name

## SQL Challenge Requests: 
#### 1. Find customers who have never ordered

insight: two users have not at all ordered any things 

#### 2. Find Average Price of dishes available in this data.

insight: Highest average price of food is Rs 450 and lowest is Rs 98


#### 3. Find the top restaurant in terms of the number of orders for a given month

insights: Dosa Plaza has highest orders in May month
insights: KFC has highest orders in June month
insights: KFC has highest orders in July

#### 4. Find the restaurants with monthly sales greater than x for 

insight: kfc, dosa plaza and dominos have revenue more than x

#### 5. Show all orders with order details for a particular customer in a particular date range

insight: Customer ankit has made four orders in this data range.     

#### 6. Find the restaurants with maximum repeated loyal customers 

insight: kfc has highest loyal / repeated customers


