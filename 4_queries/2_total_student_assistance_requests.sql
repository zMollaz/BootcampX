SELECT name, count(assistance_requests.id) as total_assistance_requests
FROM students JOIN assistance_requests ON student_id = students.id
WHERE name = 'Elliot Dickinson'
GROUP BY students.name;