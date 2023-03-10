
/*****************************************************************************************/
----------------------------------ПОСЕТИТЕЛИ-----------------------------------------------
TRUNCATE Cinema_db.Visitor CASCADE;
INSERT INTO Cinema_db.Visitor
-------ID--ФИО----------------------------EMAIL-----------------------PHONE---------  
VALUES (0, 'Хузин Тимур Ильирович',       'huzin@yandex.ru',          '82292871322'),
       (1, 'Сенаторов Петр Павлович',     'senatoroff@yandex.ru',     '86766386659'),
       (2, 'Лескин Иван Алексеевич',      'leskin@yandex.ru',         '87813600632'),
       (3, 'Мысов Никита Андеевич',       'mysov@yandex.ru',          '87100591576'),
       (4, 'Смирнов Павел Андреевич',     'slimpavel@yandex.ru',      '88777278394'),
       (5, 'Хайруллин Азат Рифатович',    'aZot@yandex.ru',           '87656386552'),
       (6, 'Матвеев Илья Юрьевич',        'dadaon@yandex.ru',         '83432264592'),
       (7, 'Лопатин Артемий',             'lopatin@yandex.ru',        '86546728629'),
       (8, 'Кутный Данила',               'kutny@yandex.ru',          '82077896323'),
       (9, 'Агафонов Александр',          'agallex@yandex.ru',        '88729888062');
/*****************************************************************************************/


/*****************************************************************************************/
----------------------------------КИНОТЕАТРЫ-----------------------------------------------
TRUNCATE Cinema_db.Cinema CASCADE;
INSERT INTO Cinema_db.Cinema
-------ID---НАЗВАНИЕ-------АДРЕС------------------
VALUES (0, 'Югра Синема', 'Ленина 15П'),
       (1, 'Galaxy Star', 'Чапаева 27'),
       (2, 'Мир',         'Мира 76/1'),
       (3, 'StartCinema', 'Интернациональная 73'),
       (4, 'GreenPark',   'Ленина 8'),
       (5, 'Car Cinema',  'Мира 37А');
/*****************************************************************************************/



/*****************************************************************************************/
--------------------------------СОТРУДНИКИ-------------------------------------------------
TRUNCATE Cinema_db.Worker CASCADE;
INSERT INTO Cinema_db.Worker
-------ID-ID_C-ФИО-----------------ДОЛЖНОСТЬ--------EMAIL----------PHONE----------АДРЕС---------------ВАЛИДНО С-----------------------ДО------------------------------
VALUES (0, 0, 'Квентин Тарантино', 'менеджер',      'a@yandex.ru', '84182246264', 'Первомайская 32/2', TIMESTAMP'2016-04-05 00:00:00', TIMESTAMP'2016-10-12 00:00:00'),
       (1, 0, 'Квентин Тарантино', 'администратор', 'a@yandex.ru', '84182246264', 'Первомайская 32/2', TIMESTAMP'2016-10-13 00:00:00', NULL),
       (2, 0, 'Эдгар Райт',        'кассир',        'b@yandex.ru', '89050090265', 'Первомайская 32/2', TIMESTAMP'2017-08-14 10:00:00', NULL),
       (3, 1, 'Кристофер Нолан',   'бармен',        'c@yandex.ru', '88053383778', 'Первомайская 32/2', TIMESTAMP'2015-06-06 9:00:00', TIMESTAMP'2015-06-06 9:00:00'),
       (4, 1, 'Хидео Кодзима',     'гений',         'd@yandex.ru', '89810111567', 'Первомайская 32/2', TIMESTAMP'2017-05-01 10:00:00', NULL),
       (5, 2, 'Пол Томас Андерсон','кассир',        'e@yandex.ru', '89330349137', 'Первомайская 32/2', TIMESTAMP'2017-05-01 10:00:00', NULL),
       (6, 2, 'Уес Андерсон',      'охранник',      'f@yandex.ru', '85261278340', 'Первомайская 32/2', TIMESTAMP'2016-07-19 12:20:00', NULL),
       (7, 3, 'Люк Бессон',        'кинооператор',  'g@yandex.ru', '89672349198', 'Первомайская 32/2', TIMESTAMP'2019-01-03 13:05:00', NULL),
       (8, 3, 'Джеймс Кемерон',    'кассир',        'h@yandex.ru', '86547579374', 'Первомайская 32/2', TIMESTAMP'2017-03-27 10:45:00', NULL),
       (9, 4, 'Мартин Скорсезе',   'промоутер',     'i@yandex.ru', '86955259768', 'Первомайская 32/2', TIMESTAMP'2018-02-14 20:00:00', NULL),
       (10,5, 'Гай Ричи',          'охранник',      'j@yandex.ru', '86102580195', 'Первомайская 32/2', TIMESTAMP'2017-09-11 7:20:00', NULL);
/*****************************************************************************************/
       


/*****************************************************************************************/
-----------------------------------КИНОФИЛЬМЫ----------------------------------------------
TRUNCATE Cinema_db.Movie CASCADE;
INSERT INTO Cinema_db.Movie
-------ID--НАЗВАНИЕ------------ХРОНОМЕТРАЖ--ВОЗРАСТНОЕ ОГРАНИЧЕНИЕ------
VALUES (0, 'Побег из Шоушенка',        142, '16+'),
       (1, 'Темный рыцарь',            152, '12+'),
       (2, 'Хороший, плохой, злой',    161, '12+'),
       (3, 'Назад в будущее',          116, '12+'),
       (4, 'Король Лев',               88,  '0+' ),
       (5, 'Помни',                    113, '16+'),
       (6, 'Мстители',                 142, '16+'),
       (7, 'История игрушек 3',        103, '6+' ),
       (8, 'Все везде и сразу',        139, '18+'),
       (9, 'Остров Проклятых',         138, '16+'),
       (10,'Джентельмены',             113, '18+'),
       (11,'Типа крутые легавые',      121, '12+'),
       (12,'ЗВ: Возвращение джедая',   131, '12+');
/*****************************************************************************************/



/*****************************************************************************************/
-------------------------------------КИНОЗАЛЫ----------------------------------------------
TRUNCATE Cinema_db.Room CASCADE;
INSERT INTO Cinema_db.Room
------ID-ID_C--ТИП------НОМЕР В КИНОТЕАТРЕ-----------------
VALUES (0, 0, '2D',      1),
       (1, 0, '2D',      2),
       (2, 0, '3D',      3),
       (3, 0, 'VIP',     4),
       (4, 1, '2D',      1),
       (5, 1, '2D',      2),
       (6, 1, '2D',      3),
       (7, 2, '2D',      1),
       (8, 3, '2D',      1),
       (9, 3, '3D',      2),
       (10,3, '3D',      3),
       (11,4, 'IMAX 3D', 1),
       (12,4, '3D',      2),
       (13,4, '3D',      3),
       (14,5, '2D',      1);
/*****************************************************************************************/


/*****************************************************************************************/
--------------------------------РАСПИСАНИЕ СЕАНСОВ-----------------------------------------
TRUNCATE Cinema_db.Session_plan CASCADE;
INSERT INTO Cinema_db.Session_plan
--------ID-ID_M-ID_R----ДАТА НАЧАЛА-----------------------------
VALUES (0,  1,  11, TIMESTAMP'2018-10-12 10:00:00'),
       (1,  10, 3,  TIMESTAMP'2018-10-12 17:30:00'),
       (2,  2,  7,  TIMESTAMP'2018-10-12 15:00:00'),
       (3,  3,  14, TIMESTAMP'2018-10-12 21:20:00'),
       (4,  6,  11, TIMESTAMP'2018-10-12 13:45:00'),
       (5,  6,  10, TIMESTAMP'2018-10-12 12:20:00'),
       (6,  5,  7,  TIMESTAMP'2018-10-12 20:40:00'),
       (7,  11, 0,  TIMESTAMP'2018-10-12 15:30:00'),
       (8,  4,  1,  TIMESTAMP'2018-10-12 10:45:00'),
       (9,  0,  6,  TIMESTAMP'2018-10-12 19:25:00'),
       (10, 8,  2,  TIMESTAMP'2018-10-12 22:05:00'),
       (11, 7,  4,  TIMESTAMP'2018-10-12 11:45:00'),
       (12, 9,  5,  TIMESTAMP'2018-10-12 23:40:00'),
       (13, 6,  9,  TIMESTAMP'2018-10-12 13:30:00'),
       (14, 12, 13, TIMESTAMP'2018-10-12 16:00:00');
/*****************************************************************************************/


/*****************************************************************************************/
-----------------------------ИСТОРИЯ ПОСЕЩЕНИЙ--------------------------------------------
TRUNCATE Cinema_db.Watch_history CASCADE;
INSERT INTO Cinema_db.Watch_history
-------ID--ID_V-ID_S--КРЕСЛО В ЗАЛЕ------------------
VALUES (0,  0,  0,  15),
       (1,  0,  4,  20),
       (2,  1,  4,  21),
       (3,  2,  4,  22),
       (4,  3,  4,  23),
       (5,  4,  4,  24),
       (6,  5,  4,  25),
       (7,  6,  4,  26),
       (8,  7,  4,  27),
       (9,  8,  4,  28),
       (10, 0,  12, 12),
       (11, 9,  10, 10),
       (12, 1,  14, 19);
/*****************************************************************************************/
