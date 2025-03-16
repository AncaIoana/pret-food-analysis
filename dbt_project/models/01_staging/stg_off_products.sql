{{ config(
    materialized = 'view'
) }}

select
    raw_data:code::varchar as product_code,
    raw_data:product_name[0]:text::varchar as product_name,
    raw_data:brands::varchar as brands,
    raw_data:categories_tags as categories_tags,
    raw_data:allergens_tags as allergens_tags
from OFF_RAW_DB.OFF_RAW_SCHEMA.products_raw_variant
