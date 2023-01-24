/*СДЕЛАМ ВИД ЧТО БЭТМЕН ВСЕ-ТАКИ ВЫШЕЛ В ПРОКАТ В РОССИИ*/

INSERT INTO Cinema_db.Movie
VALUES (13, 'Бэтмен', 176, '16+');

/*ПОСМОТРИМ КАКИЕ ФИЛЬМЫ СЕЙЧАС В ПРОКАТЕ*/

SELECT movie_nm
FROM Cinema_db.Movie;

/*НАМ ЕЩЕ НЕТ 16 ЛЕТ, НА КАКИЕ ФИЛЬМЫ МОЖНО БУДЕТ СХОДИТЬ В КИНО? */

SELECT movie_nm
FROM Cinema_db.Movie
WHERE rating_desc = '0+' or rating_desc = '6+' or rating_desc = '12+';

/*БЛИН, НА БЭТМЕНА НЕ ПОЛУЧИТСЯ СХОДИТЬ. ТОГДА УДАЛИМ ЕГО*/

DELETE
FROM Cinema_db.Movie
WHERE movie_nm = 'Бэтмен';