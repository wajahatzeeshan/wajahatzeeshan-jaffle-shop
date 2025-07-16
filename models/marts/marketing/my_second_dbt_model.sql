
-- Use the `ref` function to select from other models
{{
  config(
    materialized='view'
  )
}}

select *
from {{ ref('stg_jaffle_shop__customers') }}
where customer_id = 1
