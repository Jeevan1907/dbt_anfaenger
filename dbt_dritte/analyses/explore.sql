select email_address from {{ref ("customers")}}
where email_address not like '%.com' and email_address not like '%.net' and email_address not like '%.org'