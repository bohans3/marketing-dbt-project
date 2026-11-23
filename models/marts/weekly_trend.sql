select
    date_trunc('week', campaign_date) as week,
    round(sum(revenue), 2) as revenue,
    round(sum(cost), 2) as cost
from {{ ref('stg_campaign_data') }}
group by 1
order by 1
