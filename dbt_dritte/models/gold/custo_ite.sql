{{config(
    materialized='table')
}}

with cte as (select *, row_number() over(partition by customer_sk order by timest desc) as rn
from {{ source('custom_cdc', 'custo') }})
select * from cte
where rn=1
