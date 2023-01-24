/*ИЗВЕСТНО ЧТО МЫ С ДРУЗЬЯМИ РЕШИЛИ СХОДИТЬ В КИНО НА ФИЛЬМ МСТИТЕЛИ В КИНОТЕАТР GREEN PARK, НО КОГО-ТО ЗАБЫЛИ. НАДО УЗНАТЬ КОГО*/

/*ТАБЛИЦА С СЕАНСОМ И ИМЕНЕМ ЧЕЛОВЕКА КОТОРЫЙ ТАМ БЫЛ*/
WITH watch_history_X_visitor AS (
	SELECT session_id, visitor_nm
	FROM Cinema_db.Visitor AS v 
		 LEFT JOIN 
		 Cinema_db.Watch_history AS w
			ON v.visitor_id = w.visitor_id
),

/*ТАБЛИЦА С ID ЗАЛОВ ТОЛЬКО ИЗ GREEN PARK*/
rooms_at_greenpark AS (
	SELECT room_id
	FROM Cinema_db.Room AS r
		 LEFT JOIN
		 Cinema_db.Cinema AS c 
		 	ON r.cinema_id = c.cinema_id
	WHERE c.cinema_nm = 'GreenPark'
),

/*ТАБЛИЦА ГДЕ БУДУТ СЕАНСЫ С ФИЛЬМОМ МСТИТЕЛИ*/
avengers_session AS (
	SELECT session_id, room_id
	FROM Cinema_db.Session_plan as s
		 LEFT JOIN
		 Cinema_db.Movie as m
		 	ON s.movie_id = m.movie_id
	WHERE m.movie_nm = 'Мстители'
),

/*ТАБЛИЦА С СЕАНСОМ МСТИТЕЛЕЙ ТОЛЬКО В GREEN PARK*/
avengers_greenpark AS (
	SELECT session_id
	FROM avengers_session AS av
	WHERE av.room_id IN (
		SELECT * FROM rooms_at_greenpark
		)
)

/*ВЫЧИТАЕМ ИЗ ВСЕХ ЛЮДЕЙ ТЕХ КТО БЫЛ НА НУЖНОМ СЕАНСЕ*/
SELECT visitor_nm FROM Cinema_db.Visitor
EXCEPT
SELECT visitor_nm FROM watch_history_X_visitor
WHERE session_id IN (
	SELECT * FROM avengers_greenpark
);

