SELECT day, 
count(id) as number_of_assignemnts,
sum(duration) as duration
FROM assignments 
GROUP BY day
ORDER BY day ASC;