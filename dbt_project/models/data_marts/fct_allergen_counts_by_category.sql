--Prevalence of Key Allergens by Product Category

{{ config(
    materialized = 'table'
) }}

select
    allergen,
    -- Assuming the first category in the array is the primary category
    categories[0]::varchar as category,
    count(distinct product_code) as number_of_products
from {{ ref('int_product_allergens') }}
where array_size(categories) > 0 -- Only include products with English categories
  and categories[0]::varchar != 'undefined' -- Filter out "undefined" categories
group by allergen, category
order by category, number_of_products desc
