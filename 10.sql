SELECT DISTINCT(p.name)

FROM directors as d
JOIN people as p ON d.person_id = p.id
-- JOIN movies as m ON d.movie_id = m.id
JOIN ratings as r ON d.movie_id = r.movie_id

WHERE r.rating >= 9.0;