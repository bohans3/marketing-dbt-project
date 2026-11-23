select
    channel,
    sum(impressions) as impressions,
    sum(clicks) as clicks,
    round(sum(clicks) / nullif(sum(impressions), 0) * 100, 2) as ctr_pct,
    round(sum(cost), 2) as cost,
    sum(conversions) as conversions,
    round(sum(revenue), 2) as revenue,
    round(sum(revenue) / nullif(sum(cost), 0), 2) as roas
from {{ ref('stg_campaign_data') }}
group by channel
order by revenue desc
