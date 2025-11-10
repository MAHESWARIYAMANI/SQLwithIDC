--DAILY CHALLENGE 
/*Identify services that refused more than 100 patients in total and had 
an average patient satisfaction below 80. 
Show service name, total refused, and average satisfaction.*/
USE hospital;
SELECT service,SUM(PATIENTS_REFUSED) AS total_refused, 
CAST(AVG(PATIENT_SATISFACTION) AS DECIMAL(10,2)) AS patient_satisfaction
FROM services_weekly
GROUP BY service
HAVING SUM(PATIENTS_REFUSED)>100 AND AVG(PATIENT_SATISFACTION)<80;