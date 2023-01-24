/*ДАВАЙТЕ ВЫЯСНИМ, КТО БОЛЬШЕ ВСЕГО СМОТРИТ ФИЛЬМОВ И ПО ПРАВУ МОЖЕТ НАЗЫВАТЬСЯ КИНОМАНОМ*/

SELECT RANK() OVER (ORDER BY count_watches DESC) AS winning_place, visitor_nm
FROM
	(SELECT DISTINCT visitor_nm, COUNT(session_id) AS count_watches
	 FROM Cinema_db.Visitor AS v
	 	  LEFT JOIN
	      Cinema_db.Watch_history AS w
	 		ON v.visitor_id = w.visitor_id
	GROUP BY v.visitor_id) AS count_watches_table;

