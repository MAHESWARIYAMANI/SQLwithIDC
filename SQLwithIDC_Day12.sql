--1.Find all weeks in services_weekly where no special event occurred.
USE HOSPITAL;
SELECT DISTINCT(week) FROM services_weekly
WHERE event <> 'none';

--2.Count how many records have null or empty event values.
SELECT COUNT(*) AS null_events FROM services_weekly
WHERE event IS NULL OR 
      event = ' ' OR
      event = 'none';

--3.List all services that had at least one week with a special event.
SELECT DISTINCT(service) FROM services_weekly
WHERE event IS NOT NULL OR event != 'none';

/*Analyze the event impact by comparing weeks with events vs weeks
without events. Show: event status ('With Event' or 'No Event'),
count of weeks, average patient satisfaction, and average staff morale.
Order by average patient satisfaction descending.*/
SELECT 
CASE WHEN event IS NULL OR event = 'none' OR event = ' ' THEN 'No Event'
     ELSE 'With Event' END AS event_status,
COUNT(week) AS no_of_weeks,
AVG(patient_satisfaction) AS avg_satisfaction_score,
AVG(staff_morale) AS avg_staff_morale
FROM services_weekly
GROUP BY 
CASE WHEN event IS NULL OR event = 'none' OR event = ' ' THEN 'No Event'
     ELSE 'With Event' END 
ORDER BY avg_satisfaction_score DESC;



     