CREATE SCHEMA IF NOT EXISTS Cinema_db;

SET SEARCH_PATH = Cinema_db;

/*****************************************************************************************/
----------------------------------ПОСЕТИТЕЛИ-----------------------------------------------
DROP TABLE IF EXISTS Cinema_db.Visitor CASCADE;
CREATE TABLE IF NOT EXISTS Cinema_db.Visitor
(
    visitor_id         INTEGER PRIMARY KEY,
    visitor_nm         VARCHAR(255) NOT NULL,
    email_desc         VARCHAR(255) NOT NULL,
    phone_no           VARCHAR(255) NOT NULL
);
/*****************************************************************************************/


/*****************************************************************************************/
--------------------------------КИНОТЕАТРЫ-------------------------------------------------
DROP TABLE IF EXISTS Cinema_db.Cinema CASCADE;
CREATE TABLE IF NOT EXISTS Cinema_db.Cinema
(
    cinema_id          INTEGER PRIMARY KEY,
    cinema_nm          VARCHAR(255) NOT NULL,
    address_desc       VARCHAR(255) NOT NULL
);
/*****************************************************************************************/


/*****************************************************************************************/
---------------------------------СОТРУДНИКИ------------------------------------------------
DROP TABLE IF EXISTS Cinema_db.Worker CASCADE;
CREATE TABLE Cinema_db.Worker
(
    worker_id          INTEGER PRIMARY KEY,
    cinema_id          INTEGER NOT NULL REFERENCES Cinema_db.Cinema (cinema_id),
    worker_nm          VARCHAR(255) NOT NULL,
    post_desc          VARCHAR(255) NOT NULL,
    email_desc         VARCHAR(255) NOT NULL,
    phone_no           VARCHAR(255) NOT NULL,
    address_desc       VARCHAR(255) NOT NULL,
    valid_from_dttm    TIMESTAMP NOT NULL,
    valid_to_dttm      TIMESTAMP
);
/*****************************************************************************************/



/*****************************************************************************************/
---------------------------------КИНОФИЛЬМЫ------------------------------------------------
DROP TABLE IF EXISTS Cinema_db.Movie CASCADE;
CREATE TABLE IF NOT EXISTS Cinema_db.Movie
(
    movie_id           INTEGER PRIMARY KEY,
    movie_nm           VARCHAR(255),
    timing_min         INTEGER CHECK (timing_min >= 60),
    rating_desc        VARCHAR(10) CHECK (rating_desc = '0+' or rating_desc = '6+' or
                                          rating_desc = '12+' or rating_desc = '16+' or 
                                          rating_desc = '18+')
);
/*****************************************************************************************/



/*****************************************************************************************/
-----------------------------------КИНОЗАЛЫ------------------------------------------------
DROP TABLE IF EXISTS Cinema_db.Room CASCADE;
CREATE TABLE Cinema_db.Room
(
    room_id            INTEGER PRIMARY KEY,
    cinema_id          INTEGER NOT NULL REFERENCES Cinema_db.Cinema (cinema_id),
    type_desc          VARCHAR(10) CHECK (type_desc = '2D' or type_desc = '3D' or 
                                          type_desc = 'IMAX 3D' or type_desc = 'VIP'),
    room_no            INTEGER NOT NULL CHECK (room_no >= 1)            
);
/*****************************************************************************************/



/*****************************************************************************************/
---------------------------------РАСПИСАНИЕ СЕАНСОВ----------------------------------------
DROP TABLE IF EXISTS Cinema_db.Session_plan;
CREATE TABLE Cinema_db.Session_plan
(
    session_id         INTEGER PRIMARY KEY,
    movie_id           INTEGER NOT NULL REFERENCES Cinema_db.Movie (movie_id),
    room_id            INTEGER NOT NULL REFERENCES Cinema_db.Room (room_id),
    start_dttm         TIMESTAMP
);
/*****************************************************************************************/



/*****************************************************************************************/
-----------------------------------ИСТОРИЯ ПОСЕЩЕНИЯ---------------------------------------
DROP TABLE IF EXISTS Cinema_db.Watch_history;
CREATE TABLE Cinema_db.Watch_history
(
    watch_id           INTEGER PRIMARY KEY,
    visitor_id         INTEGER NOT NULL REFERENCES Cinema_db.Visitor (visitor_id),
    session_id         INTEGER REFERENCES Cinema_db.Session_plan (session_id),
    ticket_no          INTEGER CHECK (ticket_no >= 1) 
);
/*****************************************************************************************/