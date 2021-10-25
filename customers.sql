select distinct b.customer_id, a.name, a.email, min(b.created_at) as first_order_at,
                count(distinct b.id) as number_orders, max(b.created_at) as last_order_at
from coffee_shop.customers a
inner join coffee_shop.orders b on a.id = b.customer_id
group by 1,2,3
order by first_order_at limit 5
