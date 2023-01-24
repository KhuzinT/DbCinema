/*ХОЧЕТСЯ УЗНАТЬ КАКИЕ ФИЛЬМЫ САМЫЕ ПРОСМАТРИВАЕМЫЕ В ОТДЕЛЬНЫХ КАТЕГОРИЯХ ЗАЛОВ (2D/3D/IMAX/VIP)
  ДЛЯ ЭТОГО ПОСМОТРИМ НА КОЛИЧЕСТВО СЕАНСОВ С ДАННЫМ ФИЛЬМОМ В ДАННОЙ КАТЕГОРИИ, ПРИ РАВЕНСТВЕ
  ЭТОГО КОЛИЧЕСТВА БУДЕМ СМОТРЕТЬ НА ХРОНОМЕТРАЖ, ЧЕМ ОН МЕНЬШЕ ТЕМ ЛУЧШЕ, ВЕДЬ ТОГДА
  МОЖНО БУДЕТ ЗАПУСТИТЬ БОЛЬШЕ СЕАНСОВ В ДЕНЬ
*/

WITH movie_X_session AS (
	SELECT movie_nm, timing_min, session_id, room_id
	FROM Cinema_db.Movie as m
	 	 LEFT JOIN
	 	 Cinema_db.Session_plan as s
	 		ON m.movie_id = s.movie_id),

movie_X_room AS (
	SELECT movie_nm, type_desc AS room_type, timing_min, session_id
	FROM movie_X_session as m
		 LEFT JOIN 
		 Cinema_db.Room as r
		 	ON m.room_id = r.room_id),

most_viewed_session AS (
	SELECT session_id, COUNT(session_id) 
	FROM Cinema_db.Watch_history
	GROUP BY session_id
),

all_needed_info AS (
	SELECT movie_nm, room_type, timing_min, COALESCE(count, 0) AS view_count
	FROM movie_X_room AS mr
		 LEFT JOIN
		 most_viewed_session AS s
			 ON mr.session_id = s.session_id)

SELECT room_type, movie_nm, timing_min 
FROM (
	SELECT RANK() OVER (PARTITION BY room_type ORDER BY view_count DESC, timing_min ASC) AS rank,
	   room_type, movie_nm, timing_min
	FROM all_needed_info) AS result_table
WHERE rank = 1;
