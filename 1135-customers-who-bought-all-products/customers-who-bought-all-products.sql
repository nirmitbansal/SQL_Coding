select customer_id from customer
group by customer_id
having count(Distinct product_key) = (select count(*)from product);