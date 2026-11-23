# Marketing Campaign Analytics — dbt + Snowflake

A dbt project that models a sample marketing campaign dataset in Snowflake, from a raw source table through a cleaned staging layer to three report-ready mart tables.

## Data source

- Snowflake table `PRACTICE_DB.MARKETING.CAMPAIGN_DATA` (declared as a dbt source)
- 840 rows of daily campaign performance: 60 days, 14 campaigns, 6 channels (Paid Search, Email, Paid Social, Display, Video Ads, Organic Social)

## Project structure

- `models/staging/stg_campaign_data.sql` — staging model (view). Selects from the source and renames the raw columns into clean names (for example `"DATE"` becomes `campaign_date`).
- `models/marts/channel_performance.sql` — one row per channel with impressions, clicks, click-through rate, cost, conversions, revenue, and return on ad spend.
- `models/marts/top_campaigns.sql` — the top 5 campaigns by revenue.
- `models/marts/weekly_trend.sql` — weekly revenue and cost trend.
- Mart models are built as tables; the staging model is a view (configured in `dbt_project.yml`).

## Data quality tests

Six tests are defined in the schema files:

- `channel` on the staging model: `not_null` and `accepted_values` (the six known channels)
- `campaign_date` and `revenue` on the staging model: `not_null`
- `channel` on `channel_performance`: `unique` and `not_null`

A full `dbt build` passes all 10 nodes (4 models + 6 tests), and the mart outputs were cross-checked against the same reports written as direct SQL queries in Snowflake.

## Stack

dbt Cloud · Snowflake · SQL
