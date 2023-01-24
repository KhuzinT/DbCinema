/*ИТАК, НАША ЦЕЛЬ ДЛЯ КАЖДОЙ ВОЗРАСТНОЙ КАТЕГОРИИ ФИЛЬМОВ ОПРЕДЕЛИТЬ СРЕДНЮЮ ПРОДОЛЖИТЕЛЬНОСТЬ ФИЛЬМА В МИНУТАХ*/

SELECT DISTINCT rating_desc, 
				ROUND(AVG(timing_min) OVER (PARTITION BY rating_desc), 2) AS avg_timing
FROM Cinema_db.Movie; 