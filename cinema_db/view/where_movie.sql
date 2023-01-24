/*СОЗДАДИМ ПРЕДСТАВЛЕНИЕ С ФИЛЬМАМИ И КИНОТЕАТРАМИ, 
ЧТОБЫ МОЖНО БЫЛО УЗНАТЬ, В КАКИХ КИНОТЕАТРАХ МОЖНО ПОСМОТРЕТЬ КОНКРЕТНЫЙ ФИЛЬМ*/


CREATE OR REPLACE VIEW Where_movie AS (
	WITH movie_x_room AS (
	SELECT movie_nm, room_id
	FROM Cinema_db.Movie AS m
	 	 LEFT JOIN 
	 	 Cinema_db.Session_plan AS s
	 		ON m.movie_id = s.movie_id),

	movie_x_cinema AS (
		SELECT movie_nm, type_desc, cinema_id
		FROM movie_x_room AS mr
	 	 	 LEFT JOIN 
	 	 	 Cinema_db.Room AS r
	 			ON mr.room_id = r.room_id)

	SELECT DISTINCT movie_nm, cinema_nm, type_desc
	FROM movie_x_cinema AS mc
	 	 LEFT JOIN 
	 	 Cinema_db.Cinema AS c
	 		ON mc.cinema_id = c.cinema_id
	ORDER BY movie_nm
);

SELECT * FROM Where_movie;