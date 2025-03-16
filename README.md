# Pret Food Analysis

## Overview

This dbt project analyzes data from the Open Food Facts database to understand the prevalence and distribution of allergens in food products. The goal is to provide insights that could be relevant to Pret A Manger for improving product labeling and enhancing customer safety related to allergens. The project transforms raw data in Snowflake and visualizes the findings in a Tableau Cloud dashboard.

## Data Source

The primary data source for this project is the Open Food Facts database. The raw data, in a parquet file format, has been uploaded to Snowflake using scripts located in the `snowflake_ingestion` folder.

## Tools and Technologies

* **dbt (data build tool):** Used for transforming and modeling data in Snowflake.
* **Snowflake:** Cloud-based data warehouse where the data is stored and transformed.
* **AWS S3:** Used to store the Parquet data file
* **SQL:** The language used for data transformation within dbt and for interacting with Snowflake.
* **Tableau Cloud:** Used for creating and hosting the interactive dashboard visualizing the analysis results.

## Project Structure

The project is organized into the following main directories:

* **`dashboard/`:** Contains a static PDF version of the allergen distribution dashboard (`allergen_distribution_dashboard.pdf`).
* **`dbt_project/`:** Contains all the dbt project files.
  * **`dbt_project.yml`:** The main configuration file for the dbt project.
  * **`packages.yml`:** Lists the external dbt packages used (e.g., `dbt_utils`).
  * **`package-lock.yml`:** Records the  versions of the packages installed.
  * **`dbt_packages/`:** Directory where dbt installs the external packages.
  * **`logs/`:** Contains the dbt run logs.
  * **`macros/`:** Contains custom dbt macros for operations used often .
  * **`models/`:** Contains the SQL models that define the data transformations.
    * **`staging/`:** Models that directly select and clean data from the raw Open Food Facts data in Snowflake (`stg_off_products.sql`).
    * **`intermediate/`:** Models that perform further transformations and aggregations (`int_product_allergens.sql`).
    * **`data_marts/`:** Models that are the final, ready-for-analysis tables.
  * **`target/`:** Directory where dbt compiles and stores the results of running the project.
* **`snowflake_ingestion/`:** Contains SQL scripts used to load the raw data into Snowflake.
  * `01_create_db_schema.sql`: Script to create the database and schema in Snowflake.
  * `02_create_stage.sql`: Script to create an external stage in Snowflake to access the data file.
  * `03_load_raw_data.sql`: Script to load the parquet data into a raw table in Snowflake.
  * `04_explore_raw_data.sql`: Script used for initial exploration of the raw data.

## Snowflake Ingestion

The raw Open Food Facts data is loaded into Snowflake using the SQL scripts in the `snowflake_ingestion` folder. These scripts should be executed directly within your Snowflake environment in the order specified by their numbering.

## dbt Setup and Execution

To run this dbt project, you will need to have dbt installed and a dbt profile configured to connect to your Snowflake instance.

**Setting up a dbt Profile:**

A dbt profile contains the connection details for your data warehouse. You can find detailed instructions on how to set up a dbt profile for Snowflake in the official dbt documentation here: [dbt Documentation: Connecting to Snowflake](https://docs.getdbt.com/docs/core/connect-data-platform/snowflake-setup)

**Running the dbt Project:**

1. Navigate to the `dbt_project` directory in your terminal.
2. To execute all the dbt models and transform the data in Snowflake, run the following command:

    ```
    dbt run
    ```

3. To run all the tests defined in the dbt project, use the command:

    ```
    dbt test
    ```

## Tableau Dashboard

The results of this data analysis are visualized in a Tableau Cloud dashboard. The dashboard provides insights into the prevalence of key allergens across different product categories and highlights the most common allergens found in the dataset. You can view the interactive dashboard here: [Tableau Cloud Allergen Distribution Dashboard](https://prod-uk-a.online.tableau.com/t/ancaconstantin1-7d7fdfda60/views/AllergenDistributionDashboard/Dashboard1). A static PDF version of the dashboard (`allergen_distribution_dashboard.pdf`) is available in the `dashboard` folder.

## Key Insights

Based on the analysis, key insights from the dashboard include:

* Identification of the most common allergens present in the Open Food Facts dataset.
* Understanding the distribution and prevalence of specific allergens across various product categories.
* Highlighting the extent of products with a high number of reported allergens.

These insights can help Pret better understand the allergen landscape in their potential product range.

## Further Improvements

Future improvements for this project could include:

* Adding more comprehensive data tests to ensure data quality and integrity.
* Performing more in-depth data cleaning and standardization of the raw data.
* Exploring additional features and information available in the Open Food Facts dataset.
* Integrating this analysis with potential internal Pret A Manger product data for a more tailored analysis.
