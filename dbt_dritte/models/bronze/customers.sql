{% set cols = ['customerID', 'first_name', 'last_name', 'email_address', 'phone_number', 'address','city' , 'gender']%}

select 
    {%for col in cols%}
        {{col}}
        {%if not loop.last%}
            ,
        {%endif%}
    {%endfor%}
from {{source ('sales', 'sales_customers')}}