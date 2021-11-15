with fct_orders as (

    select
        o.id as order_id,
        user_id as customer_id,
        amount
    from raw.jaffle_shop.orders as o
    left join raw.stripe.payment as p on o.id = p.orderid
)
select * from fct_orders