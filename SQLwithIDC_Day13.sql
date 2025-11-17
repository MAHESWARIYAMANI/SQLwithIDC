/*Create a comprehensive report showing patient_id, patient name, age, service,
and the total number of staff members available in their service. Only include
patients from services that have more than 5 staff members. Order by number of
staff descending, then by patient name.*/
USE HOSPITAL;
SELECT 
    p.patient_id,
    p.name,
    p.age,
    p.service,
    s.total_staff
FROM 
    patients p
INNER JOIN 
    (
        SELECT 
            service,
            COUNT(*) AS total_staff
        FROM staff
        GROUP BY service
        HAVING COUNT(*) > 5
    ) s
    ON p.service = s.service
ORDER BY 
    s.total_staff DESC,
    p.name;
