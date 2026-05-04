{% test quantity (model, column_name)%}
{%- set cols = ['transactionID', 'customerID', 'dateTime', 'product', 'quantity'] -%}
select
    {%for i in cols %}
        {{i}}
        {%if not loop.last%}
            ,
        {%endif%}
    {%endfor%}
    from {{model}}
    where {{column_name}} < 0
{% endtest %}