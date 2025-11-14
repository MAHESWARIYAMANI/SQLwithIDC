/*Create a service performance report showing service name, total patients admitted,
and a performance category based on the following: 'Excellent' if 
avg satisfaction >= 85, 'Good' if >= 75, 'Fair' if >= 65,
otherwise 'Needs Improvement'. Order by average satisfaction descending.*/
USE HOSPITAL;
SELECT 
    service,
    COUNT(patients_admitted) AS total_patients_admitted,
    ROUND(AVG(patient_satisfaction), 2) AS average_satisfaction,
    CASE 
        WHEN AVG(patient_satisfaction) >= 85 THEN 'Excellent'
        WHEN AVG(patient_satisfaction) >= 75 THEN 'Good'
        WHEN AVG(patient_satisfaction) >= 65 THEN 'Fair'
        ELSE 'Needs Improvement'
    END AS performance_category
FROM services_weekly
GROUP BY service
ORDER BY average_satisfaction DESC;

--1.Categorise patients as 'High', 'Medium', or 'Low' satisfaction based on their scores.
USE HOSPITAL;
SELECT * ,
CASE WHEN satisfaction >=85 THEN 'Excellent'
     WHEN satisfaction >=75 THEN 'Good'
     WHEN satisfaction >=65 THEN 'Fair'
     ELSE 'Needs Improvement'
     END AS satisfaction_category
FROM patients;

--2.Label staff roles as 'Medical' or 'Support' based on role type.
SELECT staff_id,staff_name, 
CASE WHEN role = 'nurse' THEN 'Support'
     WHEN role = 'nursing_assistant' THEN 'Support'
     ELSE 'Medical' END AS role_type
FROM staff;

--3.Create age groups for patients (0-18, 19-40, 41-65, 65+).
SELECT name, age,
CASE WHEN age BETWEEN 0 AND 18 THEN 'Children'
     WHEN age BETWEEN 19 AND 40 THEN 'Young Adults'
     WHEN age BETWEEN 41 AND 65 THEN 'MIddle Aged Adults'
     ELSE 'Senior' END AS age_group
FROM patients;
