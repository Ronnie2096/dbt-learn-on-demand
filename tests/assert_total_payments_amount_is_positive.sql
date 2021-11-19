select
     orderid
    ,sum(amount/100) as total_amount
from {{ref('stg_payments')}}
group by orderid
having total_amount<0