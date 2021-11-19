with payments as (

    select 
        orderid,
        paymentmethod,
        status,
        amount
    from {{source('stripe','payment')}}
)
select * from payments