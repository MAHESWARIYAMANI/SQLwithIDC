 --1.Count the number of patients by each service.
 USE hospital
 SELECT service,COUNT(*) AS no_of_patients 
 FROM patients
 GROUP BY service;

 --2.Calculate the average age of patients grouped by service.
 SELECT service, AVG(age) AS avg_age
 FROM patients
 GROUP BY service;

 --3.Find the total number of staff members per role.
 SELECT role, COUNT(staff_id) AS staff_count
 FROM staff
 GROUP BY role;

 --DAILY CHALLENGE :
  /*For each hospital service, calculate the total number of patients admitted,
  total patients refused, and the admission rate (% of requests that were admitted).
  Order by admission rate descending.*/
USE hospital
SELECT service,
         SUM(patients_admitted) AS total_patients_admitted,
         SUM(patients_refused) AS total_patients_refused,
         CAST(ROUND((SUM(patients_admitted) * 100.00/ SUM(patients_request)),2)
         AS DECIMAL (10,2))
         AS admission_rate 
FROM services_weekly
GROUP BY service
ORDER BY admission_rate DESC;