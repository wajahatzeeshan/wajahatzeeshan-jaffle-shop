with customer_order as (
    select
        *
    from {{ ref('stg_jaffle_shop__orders') }}
),

payment as (
    select
        *
    from {{ ref('stg_stripe__payments') }}
),

customer_payment as (
    select  
        co.order_id,
        co.customer_id,
        -- p.amount as payment_amount
        co.order_date,
        coalesce(sum (case when p.status = 'success' then amount end),0) as amount --fix for duplicate orders
    from customer_order as co
    left join payment as p
        on co.order_id = p.orderid
    group by 1,2,3
)

select 
    * 
from customer_payment