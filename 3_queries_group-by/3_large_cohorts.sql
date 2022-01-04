SELECT cohorts.name as cohort_name, count(students.*) as student_count
FROM students JOIN cohorts ON cohort_id = cohorts.id
GROUP BY cohorts.name
Having count(students.*) >= 18
ORDER BY count(students.*) ASC;