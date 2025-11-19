/*Show all staff members and their schedule information (including those
with no schedule entries).*/
USE HOSPITAL;
SELECT s.staff_id, s.staff_name, s.service, SUM(present) AS attendance
FROM staff s LEFT JOIN staff_schedule ss
ON s.service = ss.service
GROUP BY s.staff_id,s.staff_name,s.service;

/*Create a staff utilisation report showing all staff members (staff_id,
staff_name, role, service) and the count of weeks they were present
(from staff_schedule). Include staff members even if they have no schedule
records. Order by weeks present descending.*/
USE HOSPITAL;
SELECT 
    s.staff_id,
    s.staff_name,
    s.role,
    s.service,
    COUNT(sc.week) AS weeks_present
FROM staff s
LEFT JOIN staff_schedule sc
    ON s.staff_id = sc.staff_id
GROUP BY 
    s.staff_id,
    s.staff_name,
    s.role,
    s.service
ORDER BY 
    weeks_present DESC;

