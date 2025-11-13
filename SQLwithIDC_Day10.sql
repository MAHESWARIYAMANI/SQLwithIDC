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
