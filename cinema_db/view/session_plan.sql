/*СДЕЛАЕМ ПРЕДСТАВЛЕНИЕ --- НОРМАЛЬНОЕ (В ЧЕЛОВЕЧЕСКОМ ПОНИМАНИИ) РАСПИСАНИЕ СЕАНСОВ*/


CREATE OR REPLACE VIEW Normal_session_plan AS (
	WITH movie_x_room AS (
	SELECT movie_nm, rating_desc, room_id, start_dttm
	FROM Cinema_db.Session_plan AS s
	 	 LEFT JOIN
	 	 Cinema_db.Movie AS m
	 		ON s.movie_id = m.movie_id),

	movie_x_cinema AS (
	SELECT cinema_id, movie_nm, rating_desc, type_desc, room_no, start_dttm
	FROM movie_x_room AS mr
	 	 LEFT JOIN 
	 	 Cinema_db.Room AS r
	 		ON mr.room_id = r.room_id)

	SELECT movie_nm, rating_desc, type_desc, cinema_nm, room_no, start_dttm
	FROM movie_x_cinema AS mc
	 	 LEFT JOIN
	 	 Cinema_db.Cinema AS c
	 		ON c.cinema_id = mc.cinema_id
	ORDER BY start_dttm
);

SELECT * FROM Normal_session_plan;