-- Top N Most Common Allergens 

{{ config(
    materialized = 'table'
) }}

select
    allergen,
    count(distinct product_code) as number_of_products
from {{ ref('int_product_allergens') }}
group by allergen
order by number_of_products desc
