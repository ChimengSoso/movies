SELECT m.title

FROM stars AS s
JOIN people AS p ON s.person_id = p.id
JOIN movies AS m ON m.id = s.movie_id
JOIN ratings AS r ON r.movie_id = m.id

WHERE p.name = 'Chadwick Boseman'

ORDER BY r.rating DESC

LIMIT 5;