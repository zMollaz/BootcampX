SELECT cohorts.name as cohort_name, count(assignment_submissions.id) as total_submissions
FROM students 
JOIN assignment_submissions ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
GROUP BY cohorts.name
ORDER BY total_submissions DESC;