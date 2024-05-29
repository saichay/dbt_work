{{
    config(
        materialized="view",
        alias="first_dbt_model",
        schema="Public"
    )
}}

with final as
(
    select s.customerid, s.productid, p.productname,p.category
    from {{ source('source_1', 'sales') }} s 
    inner join {{ source('source_1', 'products') }} p 
    on s.productid = p.productid
)

select * from final