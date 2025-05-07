WITH campaign_group AS(

SELECT *
from {{ref("stg_raw__adwords")}}
UNION ALL
SELECT *
from {{ref("stg_raw__bing")}}
UNION ALL
SELECT *
from {{ref("stg_raw__criteo")}}
UNION ALL
SELECT *
from {{ref("stg_raw__facebook")}}

)

SELECT
date_date,
SUM(ads_cost) AS ads_cost,
SUM(impression) AS ads_impression,
SUM(click) AS ads_clicks,
FROM campaign_group
GROUP BY date_date
ORDER BY date_date DESC
