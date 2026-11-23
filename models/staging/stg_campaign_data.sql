select
    "DATE" as campaign_date,
    CAMPAIGN_NAME as campaign_name,
    CHANNEL as channel,
    REGION as region,
    AGE_GROUP as age_group,
    IMPRESSIONS as impressions,
    CLICKS as clicks,
    COST as cost,
    CONVERSIONS as conversions,
    REVENUE as revenue
from {{ source('marketing', 'campaign_data') }}
