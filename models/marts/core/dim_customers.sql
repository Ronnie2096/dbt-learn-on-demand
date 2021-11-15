{{config(
    materialized="table"
)}}

with customers as(
    select * from {{ref('stg_customers')}}
),

fct_orders as(
    select * from {{ref('fct_orders')}}
),

payments as(
    select * from {{ref('stg_payments')}}
),

customer_orders as (

    select
        customer_id,
        count(order_id) as number_of_orders,
        CONCAT('$',cast(cast((sum(amount)/100) as float) as VARCHAR)) as amount_spent
    from fct_orders

    group by customer_id

),
final as (

    select
        customers.customer_id,
        customers.first_name,
        customers.last_name,
        --customer_orders.first_order_date,
       -- customer_orders.most_recent_order_date,
        amount_spent as lifetime_value,
        coalesce(customer_orders.number_of_orders, 0) as number_of_orders
    from customers

    left join customer_orders using (customer_id)
)

select * from final