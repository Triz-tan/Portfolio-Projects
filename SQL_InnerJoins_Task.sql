show databases;
use small_business_example;
show tables;

#Retrieving customer information along with their orders.
select * 
from customers as cus
inner join orders as ord 
on cus.customer_id = ord.customer_id;

#Finding out which products were ordered by each customer.

select cus.name as customers_name , pro.name as product_name
from customers as cus
inner join orders as ord on cus.customer_id = ord.customer_id
inner join  order_items as ord_i on ord_i.order_id = ord.order_id
inner join products as pro
on pro.product_id = ord_i.product_id;

#Calculating the total amount spent by each customer.

select cus.name, sum(ord_i.quantity * ord_i.unit_price) as total_spent
from customers as cus
inner join orders as ord on cus.customer_id = ord.customer_id
inner join order_items as ord_i on ord_i.order_id = ord.order_id
group by cus.name;



#Identifying the most popular products based on the number of orders.

select pro.name as popular_products, sum(ord_i.quantity) as number_of_orders
from products as pro
inner join order_items as ord_i on pro.product_id = ord_i.product_id
group by popular_products;


#Joining multiple tables to find out details of each order item, 
#including the product name, quantity, and total price.

select 
	ord_i.order_item_id, 
    pro.name as product_name, 
    ord_i.quantity, 
    (ord_i.quantity * ord_i.unit_price) as total_price
from 
	order_items as ord_i
inner join 
	products as pro on ord_i.product_id = pro.product_id
group by 
	ord_i.order_item_id
order by 
	ord_i.order_item_id asc;