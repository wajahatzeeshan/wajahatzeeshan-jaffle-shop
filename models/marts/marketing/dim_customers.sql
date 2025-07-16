
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below


--{{ config(materialized='table') }}

with source_data as (

    select 1 as id
    union all
    select null as id

)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
with customers as (

select *
from {{ ref('stg_jaffle_shop__customers') }}

),
orders as (
select * from {{ ref ('fct_orders')}}
),
/*
--orders as (

select *
from {{ ref('stg_jaffle_shop__orders') }}
),

payments as (

select * 
from {{ ref('stg_stripe__payments') }}

),

orders_with_payments as (
    select
        o.customer_id,
        o.order_id,
        o.order_date,
        p.amount
    from orders as o
    left join payments as p
        on o.order_id = p.orderid
),

*/

customer_orders as (

    select
        customer_id,
        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(order_id) as number_of_orders,
        sum(amount) as lifetime_value
    --from orders_with_payments
    from orders
    group by 1

),

final as (

    select
        customers.customer_id,
        customers.first_name,
        customers.last_name,
        customer_orders.first_order_date,
        customer_orders.most_recent_order_date,
        coalesce(customer_orders.number_of_orders, 0) as number_of_orders,
        coalesce(customer_orders.lifetime_value,0) lifetime_value
    from customers
    left join customer_orders using (customer_id)


)

select * from final