SELECT DISTINCT teachers.name as teacher,
cohorts.name as cohort,
count(assistance_requests.id) as total_assistances
FROM teachers 
JOIN assistance_requests ON teachers.id = teacher_id
JOIN students ON students.id = student_id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name = 'JUL02'
GROUP BY cohort, teacher
ORDER BY cohort;