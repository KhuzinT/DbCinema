/*ПРЕДСТАВЛЕНИЕ О КИНОТЕАТРАХ И ЗАЛАХ В НИХ*/

CREATE OR REPLACE VIEW Cinema_x_room AS (
	SELECT (CASE WHEN room_no = 1 THEN cinema_nm ELSE NULL END) AS cinema_nm,
	   	   (CASE WHEN room_no = 1 THEN address_desc ELSE NULL END) AS address_desc,
	   		room_no, type_desc
	FROM (
		SELECT cinema_nm, address_desc, room_no, type_desc
		FROM Cinema_db.Cinema AS c
	 	 	 RIGHT JOIN
	 	 	 Cinema_db.Room AS r
	 			ON c.cinema_id = r.cinema_id) as tmp 
);

SELECT * FROM Cinema_x_room;
 