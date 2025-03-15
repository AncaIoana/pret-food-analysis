-- Number of Allergens per Product

{{ config(
    materialized = 'table'
) }}

select
    product_code,
    product_name,
    brands,
    count(distinct allergen) as number_of_allergens
from {{ ref('int_product_allergens') }}
where product_name is not null
group by product_code, product_name, brands
order by number_of_allergens desc
