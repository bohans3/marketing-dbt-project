select
    campaign_name,
    channel,
    sum(conversions) as conversions,
    round(sum(revenue), 2) as revenue
from {{ ref('stg_campaign_data') }}
group by campaign_name, channel
order by revenue desc
limit 5
