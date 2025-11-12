--1.Extract the year from all patient arrival dates.
USE HOSPITAL;
SELECT YEAR(arrival_date) AS year_of_arrival FROM patients;

--2.Calculate the length of stay for each patient (departure_date - arrival_date).
SELECT DATEDIFF(day,arrival_date,departure_date) AS length_of_stay
FROM patients;

--3.Find all patients who arrived in a specific month.
SELECT * FROM patients
WHERE MONTH(arrival_date) = 3;

--DAILY CHALLENGE :
/*Calculate the average length of stay (in days) for each service, showing only
services where the average stay is more than 7 days. Also show the count of
patients and order by average stay descending.*/
SELECT 
    service,
    CAST(ROUND(AVG(CAST(DATEDIFF(DAY, arrival_date, departure_date) AS DECIMAL(10,2))), 2) AS DECIMAL(4,2)) AS avg_len_of_stay,
    COUNT(*) AS no_of_patients
FROM patients
GROUP BY service
HAVING AVG(CAST(DATEDIFF(DAY, arrival_date, departure_date) AS DECIMAL(10,2))) > 7
ORDER BY avg_len_of_stay DESC;
