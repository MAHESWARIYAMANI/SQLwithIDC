/*1.Join patients and staff based on their common service field
(show patient and staff who work in same service).*/
USE hospital;
SELECT patient_id, name AS patient_name, p.service, staff_name, role 
FROM patients p JOIN staff s
ON p.service = s.service

--2.Join services_weekly with staff to show weekly service data with staff information.
SELECT week, sw.service, patients_admitted, patients_refused, patient_satisfaction 
FROM staff s JOIN services_weekly sw
ON s.service = sw.service

/*3.Create a report showing patient information along with staff assigned to their
service.*/
SELECT patient_id, name AS patient_name, p.service, staff_id, staff_name 
FROM patients p JOIN staff s
ON p.service = s.service

/*Create a comprehensive report showing patient_id, patient name, age, service,
and the total number of staff members available in their service. Only include
patients from services that have more than 5 staff members. Order by number of
staff descending, then by patient name.*/
SELECT patient_id,name AS patient_name, age, p.service, staff_members
FROM patients p 
JOIN 
   (
     SELECT service, COUNT(*) AS staff_members FROM staff
     GROUP BY service
     HAVING COUNT(*) > 5) AS s 
ON p.service = s.service 
ORDER BY s.staff_members DESC, p.name;