/*СДЕЛАЕМ ПРЕДСТАВЛЕНИЕ --- НОРМАЛЬНАЯ (В ЧЕЛОВЕЧЕСКОМ ПОНИМАНИИ) ИСТОРИЯ ПОСЕЩЕНИЙ*/


CREATE OR REPLACE VIEW Normal_watch_history AS (
	WITH movie_x_room AS (
		SELECT movie_nm, room_id, start_dttm, session_id
		FROM Cinema_db.Session_plan AS s
	 	 	 LEFT JOIN
	 	 	 Cinema_db.Movie AS m
	 			ON s.movie_id = m.movie_id),

	movie_x_cinema AS (
		SELECT cinema_id, movie_nm, room_no, start_dttm, session_id
		FROM movie_x_room AS mr
	 	 	 LEFT JOIN 
	 	 	 Cinema_db.Room AS r
	 			ON mr.room_id = r.room_id),

	movie_x_session AS (
		SELECT movie_nm, cinema_nm, room_no, start_dttm, session_id
		FROM movie_x_cinema AS mc
	 	 	 LEFT JOIN
	 	 	 Cinema_db.Cinema AS c
	 			ON c.cinema_id = mc.cinema_id),

	movie_x_visitor AS (
		SELECT visitor_id, movie_nm, cinema_nm, room_no, ticket_no, start_dttm
		FROM Cinema_db.Watch_history AS wh
		 	 LEFT JOIN 
		 	 movie_x_session AS ms
		 		ON wh.session_id = ms.session_id)

	SELECT visitor_nm, movie_nm, cinema_nm, room_no, ticket_no, start_dttm
	FROM movie_x_visitor AS mv
		 LEFT JOIN 
		 Cinema_db.Visitor AS v
		 	ON mv.visitor_id = v.visitor_id
	ORDER BY visitor_nm, start_dttm
);

SELECT * FROM Normal_watch_history;