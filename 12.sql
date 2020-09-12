SELECT m.title
FROM stars  AS s
JOIN movies AS m ON s.movie_id = m.id
JOIN people AS p ON s.person_id = p.id
WHERE p.name = 'Johnny Depp' AND m.title IN (SELECT m.title FROM stars  AS s
				  JOIN movies AS m ON s.movie_id = m.id
				  JOIN people AS p ON s.person_id = p.id
				  WHERE p.name = 'Helena Bonham Carter');