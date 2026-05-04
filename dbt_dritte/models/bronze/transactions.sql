{{
  config(
    materialized = 'table',
    )
}}
select * from {{source ('sales', 'sales_transactions')}}