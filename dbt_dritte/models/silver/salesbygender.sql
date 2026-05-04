{{
  config(
    materialized = 'table',
    schema = 'gold'
    )
}}
with customers as (
    select customerID, first_name, last_name, gender
    from {{ref("customers")}}
),
transactions as (
    select customerID, product, totalPrice 
    from {{ref("transactions")}}
),
joined as
(
    select customers.first_name, customers.last_name, customers.gender, transactions.product, transactions.totalPrice
    from customers
    right join transactions
    on transactions.customerID=customers.customerID
)
select product, gender, sum(totalPrice) as gesamt
from joined
group by product, gender
order by gesamt