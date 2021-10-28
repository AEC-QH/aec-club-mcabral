with customer_orders as (
	select
		customer_id,
		count(*) as number_of_orders,
		min(created_at) as first_order_at
	from coffee_shop.orders
	group by 1
)

select
	customers.id as customer_id,
	customers.name,
	customers.email,
	customers_orders.first_order_at,
	customer_orders.number_of_orders

from coffee_shop.customers
left join customer_orders
	on customers.id = customer_orders.customer_id
