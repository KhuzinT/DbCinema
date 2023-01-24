/*ПРЕДСТАВЛЕНИЕ СОТРУДНИКОВ (КОТОРЫЕ НА ТЕКУЩИЙ МОМЕНТ ЕЩЕ РАБОТАЮТ) СЕТИ КИНОТЕАТРОВ*/

CREATE OR REPLACE VIEW Safety_worker AS (
	SELECT worker_nm, post_desc, cinema_nm, email_desc, ('8********' || phone_end) AS phone_no
	FROM (
		SELECT worker_nm, post_desc, cinema_nm, email_desc, SUBSTRING(phone_no, 10, 2) AS phone_end
		FROM Cinema_db.Worker AS w 
	 	 	LEFT JOIN
	 	 	Cinema_db.Cinema AS c
	 			ON w.cinema_id = c.cinema_id
		WHERE valid_to_dttm IS NULL) AS tmp
);

SELECT * FROM Safety_worker;