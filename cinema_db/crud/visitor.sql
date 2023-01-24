/*ДОБАВИМ ЕГОРА БЕДРИНСКОГО В СПИСОК ТЕХ, КТО ХОДИТ В КИНО*/

INSERT INTO Cinema_db.Visitor
VALUES (10, 'Бедринский Егор', 'egorbedrynsky@yandex.ru', '+75140967135');


/*УПС МЫ ЗАБЫЛИ ДОБАВИТЬ ЕГОРУ ОТЧЕСТВО*/

UPDATE Cinema_db.Visitor AS Visitor
SET visitor_nm = 'Бедринский Егор Иванович'
WHERE visitor_id = 10;


/*ТЕПЕРЬ ПОСМОТРИМ КТО ХОДИТ В КИНО*/

SELECT visitor_nm
FROM Cinema_db.Visitor;


/*УДАЛИМ ЕГОРА ИЗ СПИСКА, ОН ЗАНЯТОЙ ЧЕЛОВЕК И ЕМУ НЕКОГДА ХОДИТЬ В КИНО(((( */

DELETE 
FROM Cinema_db.Visitor
WHERE visitor_id = 10;