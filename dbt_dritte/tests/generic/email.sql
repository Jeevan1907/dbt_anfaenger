{%test email (model, column_name)%}

select 
* 
from {{model}}
where {{column_name}} not like '%.com' and {{column_name}} not like '%.net' and {{column_name}} not like '%.org'

{%endtest%}