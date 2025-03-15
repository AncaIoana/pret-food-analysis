-- Create table to store raw data from Parquet file
CREATE OR REPLACE TABLE OFF_RAW_DB.OFF_RAW_SCHEMA.products_raw_variant (
    raw_data VARIANT
);

-- Copy data from the S3 stage into the table
COPY INTO OFF_RAW_DB.OFF_RAW_SCHEMA.products_raw_variant
FROM @OFF_RAW_DB.OFF_RAW_SCHEMA.off_s3_stage/food.parquet
FILE_FORMAT = (TYPE = 'PARQUET');
