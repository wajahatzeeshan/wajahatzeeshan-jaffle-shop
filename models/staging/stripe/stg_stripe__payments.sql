select 
    id as payment_id,
    orderid,
    paymentmethod,
    status,
    amount / 100 as amount,
    created as created_dt
from {{ source('stripe', 'payment') }}