/*ДОПУСТИМ У ВАС ЕСТЬ ДЕТИ-ПОДРОСТКИ И ВЫ ХОТИТЕ СВОДИТЬ ИХ В КИНО. НО САМИ ВЫ НЕ ХОТИТЕ СМОТРЕТЬ ФИЛЬМ, ВЫ ОЧЕНЬ ХОТИТЕ СПАТЬ*/
/*ИТАК, ТОГДА НАША ЦЕЛЬ НАЙТИ КОЛИЧЕСТВО ФИЛЬМОВ ДЛИНОЙ БОЛЕЕ 2 ЧАСОВ С ВОЗРАСТНЫМ ОГРАНИЧЕНИЕМ 12+ ИЛИ 16+, ЧТОБЫ И ВЫ ПОСПАЛИ И ДЕТИ ФИЛЬМ ПОСМОТРЕЛИ*/

SELECT rating_desc, COUNT(movie_nm) as count_long_films
FROM Cinema_db.Movie
WHERE timing_min >= 120
GROUP BY rating_desc
HAVING rating_desc = '12+' or rating_desc = '16+';