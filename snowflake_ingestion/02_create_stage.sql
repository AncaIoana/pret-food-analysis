-- Create external stage to access S3 bucket
CREATE OR REPLACE STAGE OFF_RAW_DB.OFF_RAW_SCHEMA.off_s3_stage
URL = 's3://off-raw/'
CREDENTIALS=(AWS_KEY_ID='YOUR_AWS_KEY_ID' AWS_SECRET_KEY='YOUR_AWS_SECRET_KEY');


