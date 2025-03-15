-- A starting point to explore the raw data from the Open Food Facts dataset.

-- Preview raw data
SELECT raw_data 
FROM OFF_RAW_DB.OFF_RAW_SCHEMA.products_raw_variant 
LIMIT 10;

-- Explore column names 
SELECT DISTINCT KEY FROM OFF_RAW_DB.OFF_RAW_SCHEMA.products_raw_variant, 
LATERAL FLATTEN(input => raw_data);

-- Check distinct categories 
SELECT DISTINCT raw_data:categories 
FROM OFF_RAW_DB.OFF_RAW_SCHEMA.products_raw_variant 
LIMIT 20;

-- Count total records
SELECT COUNT(*) 
FROM OFF_RAW_DB.OFF_RAW_SCHEMA.products_raw_variant;

-- Check how many records have null product names
SELECT COUNT(*) 
FROM OFF_RAW_DB.OFF_RAW_SCHEMA.products_raw_variant
WHERE raw_data:product_name IS NULL;

--focus on allergens_tags
-- Extract particular column names (e.g., allergens_tags)
SELECT raw_data:allergens_tags 
FROM OFF_RAW_DB.OFF_RAW_SCHEMA.products_raw_variant 
LIMIT 10;

--check for NULL values
SELECT COUNT(*)
FROM OFF_RAW_DB.OFF_RAW_SCHEMA.products_raw_variant
WHERE raw_data:allergens_tags IS NULL;

--check for empty arrays
SELECT COUNT(*)
FROM OFF_RAW_DB.OFF_RAW_SCHEMA.products_raw_variant
WHERE ARRAY_SIZE(raw_data:allergens_tags) = 0;

-- count distinct allergen tabs
SELECT COUNT(*)
FROM OFF_RAW_DB.OFF_RAW_SCHEMA.products_raw_variant,
LATERAL FLATTEN(input => raw_data:allergens_tags);

-- check distinct allergen tags format
SELECT DISTINCT value
FROM OFF_RAW_DB.OFF_RAW_SCHEMA.products_raw_variant,
LATERAL FLATTEN(input => raw_data:allergens_tags)
LIMIT 100;
