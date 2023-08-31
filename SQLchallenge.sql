### Please provide a SQL statement for each question

1. Write a query to get the sum of impressions by day.

SELECT date, SUM(impressions) as total_impressions
FROM marketing_data
GROUP BY date
ORDER BY date;

2. Write a query to get the top three revenue-generating states in order of best to worst. How much revenue did the third best state generate?

SELECT state, SUM(revenue) as total_revenue
FROM website_revenue
GROUP BY state
ORDER BY total_revenue DESC
LIMIT 3;

3. Write a query that shows total cost, impressions, clicks, and revenue of each campaign. Make sure to include the campaign name in the output.

SELECT md.campaign_id, ci.name, SUM(md.cost) as total_cost, SUM(md.impressions) as total_impressions, 
       SUM(md.clicks) as total_clicks, SUM(wr.revenue) as total_revenue
FROM marketing_data md
LEFT JOIN campaign_info ci ON md.campaign_id = ci.id
LEFT JOIN website_revenue wr ON md.date = wr.date AND md.campaign_id = wr.campaign_id
GROUP BY md.campaign_id, ci.name
ORDER BY ci.name;


4. Write a query to get the number of conversions of Campaign5 by state. Which state generated the most conversions for this campaign?

SELECT wr.state, SUM(md.conversions) as total_conversions
FROM marketing_data md
JOIN website_revenue wr ON md.date = wr.date AND md.campaign_id = wr.campaign_id
WHERE md.campaign_id = '99058240'
GROUP BY wr.state
ORDER BY total_conversions DESC;

5. In your opinion, which campaign was the most efficient, and why?


**Bonus Question**

6. Write a query that showcases the best day of the week (e.g., Sunday, Monday, Tuesday, etc.) to run ads.
SELECT DAYNAME(date) as day_of_week, SUM(cost) as total_cost, SUM(impressions) as total_impressions,
       SUM(clicks) as total_clicks, SUM(conversions) as total_conversions
FROM marketing_data
GROUP BY DAYNAME(date)
ORDER BY total_conversions DESC
LIMIT 1;