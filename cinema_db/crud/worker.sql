/*ДАВАЙТЕ ЕЩЕ ПОИЗДЕВАЕМСЯ НАД ИМЕНИТЫМИ РЕЖИССЕРАМИ, ЗАСТАВИВ ИХ РАБОТАТЬ У НАС В КИНОТЕАТРАХ */

INSERT INTO Cinema_db.Worker
VALUES (11, 4, 'Стенли Кубрик',   'кинооператор', 'cub@yandex.ru', '8881162395', 'Ленина 17/5', TIMESTAMP'2020-10-10 00:00:00', NULL),
	   (12, 4, 'Джейсон Стэтхем', 'охранник',     'lalala@yandex.ru',   '825196', 'Мира 28', TIMESTAMP'2020-10-10 00:00:00', NULL);

/*МЫ ВДРУГ ЗАМЕТИЛИ ЧТО НЕПРАВИЛЬНО НАПИСАЛИ НОМЕР ДЖЕЙСОНА, ДАВАЙТЕ ЭТО ИСПРАВИМ*/


-- UPDATE Cinema_db.Worker AS Worker
-- SET phone_no = '82519609428'       <----- МОЖНО ЛУЧШЕ ВЕДЬ ТАБЛИЦА ВЕРСИОННАЯ 
-- WHERE worker_id = 12;

UPDATE Cinema_db.Worker 
SET valid_to_dttm = TIMESTAMP'2020-10-11 00:00:00'
WHERE worker_id = 12;

INSERT INTO Cinema_db.Worker
VALUES (13, 4, 'Джейсон Стэтхем', 'охранник', 'lalala@yandex.ru', '82519609428', 'Мира 28', TIMESTAMP'2020-10-11 00:00:00', NULL);

/*ДАВАЙТЕ УЗНАЕМ КТО ГЕНИЙ*/

SELECT worker_nm
FROM Cinema_db.Worker
WHERE post_desc = 'гений';

/*УДАЛИМ ДЖЕЙСОНА ИЗ РАБОТНИКОВ, ОН ВЕДЬ НЕ РЕЖИССЕР*/

-- DELETE 
-- FROM Cinema_db.Worker                   <------------- МОЖНО ЛУЧШЕ ВЕДЬ ТАБЛИЦА ВЕРИОННАЯ
-- WHERE worker_nm = 'Джейсон Стэтхем';

UPDATE Cinema_db.Worker
SET valid_to_dttm = TIMESTAMP'2020-10-11 9:00:00'
WHERE worker_id = 13;

/*ПОСМОТРИ ТЕПЕРЬ НА ТАБЛИЦУ*/

SELECT worker_nm, post_desc, valid_from_dttm, valid_to_dttm
FROM Cinema_db.Worker;
