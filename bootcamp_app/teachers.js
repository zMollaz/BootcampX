const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});
pool.connect(() => {
  console.log("connected to the db");
});

const queryString = 
`SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
FROM teachers 
JOIN assistance_requests ON teachers.id = teacher_id
JOIN students ON students.id = student_id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name LIKE $1
ORDER BY teachers.name;`;
const cohort = process.argv[2] || 'JUL02';
const values = [`%${cohort}%`];

pool.query(queryString, values)

.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.cohort}: ${user.teacher}`)
  })
})

.catch(err => console.error('query error', err.stack));