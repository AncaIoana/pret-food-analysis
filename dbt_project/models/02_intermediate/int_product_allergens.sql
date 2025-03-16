{{ config(
    materialized = 'view'
) }}

with stg_products as (
    select * from {{ ref('stg_off_products') }}
),

product_allergens as (
    select
        stg_products.product_code,
        stg_products.product_name,
        stg_products.brands,
        stg_products.categories_tags,
        allergens.value::varchar as allergen_tag,
        {{ extract_english_name('allergens.value') }} as allergen
    from stg_products,
    lateral flatten(input => stg_products.allergens_tags) as allergens
    where array_size(stg_products.allergens_tags) > 0
      and allergens.value::varchar LIKE 'en:%'
      and stg_products.allergens_tags IS NOT NULL
),

product_categories as (
    select
        stg_products.product_code,
        categories.value::varchar as category_tag,
        {{ extract_english_name('categories.value') }} as category
    from stg_products,
    lateral flatten(input => stg_products.categories_tags) as categories
    where array_size(stg_products.categories_tags) > 0
      and categories.value::varchar LIKE 'en:%'
      and stg_products.categories_tags IS NOT NULL
)

select
    pa.product_code,
    pa.product_name,
    pa.brands,
    array_agg(pc.category) as categories, 
    pa.allergen
from product_allergens pa
left join product_categories pc on pa.product_code = pc.product_code
group by pa.product_code, pa.product_name, pa.brands, pa.allergen
