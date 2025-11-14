/*Find all unique combinations of service and event type from the services_weekly
table where events are not null or none, along with the count of occurrences
for each combination. Order by count descending.*/
USE HOSPITAL;
SELECT DISTINCT(service),event, COUNT(*) AS occurence_count
FROM services_weekly
WHERE event IS NOT NULL
and event <> 'none'
GROUP BY service,event
ORDER BY occurence_count DESC ;




--1.List all unique services in the patients table.
SELECT DISTINCT(service) FROM services_weekly;

--2.Find all unique staff roles in the hospital.
SELECT DISTINCT(role) FROM staff;

--3.Get distinct months from the services_weekly table.
SELECT DISTINCT(month) FROM services_weekly;

