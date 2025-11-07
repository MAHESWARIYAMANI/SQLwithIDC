--1.Count the total number of patients in the hospital.
USE HOSPITAL
SELECT COUNT(patient_id) AS total_patients
FROM patients;

--2.Calculate the average satisfaction score of all patients.
SELECT AVG(patient_satisfaction) AS avg_satisfaction_score
FROM services_weekly;

--3.Find the minimum and maximum age of patients.
SELECT MIN(age) AS youngest_patient_age, 
       MAX(age) AS oldest_patient_age
       FROM patients;

/*Calculate the total number of patients admitted,
total patients refused, and the average patient satisfaction
across all services and weeks.
Round the average satisfaction to 2 decimal places.*/
SELECT COUNT(patients_admitted) AS total_admitted_patients,
       COUNT(patients_refused) AS total_patients_refused,
       ROUND(AVG(patient_satisfaction),2) AS avg_patient_satisfaction
FROM services_weekly;
