/*ПРЕДСТАВЛЕНИЕ ПОСЕТИТЕЛЕЙ КИНОТЕАТРОВ*/

CREATE OR REPLACE VIEW Safety_visitor AS (
	SELECT tmp.visitor_nm, tmp.email_desc, ('8********' || tmp.phone_end) AS phone_no
	FROM (
		SELECT visitor_nm, email_desc, SUBSTRING(phone_no, 10, 2) AS phone_end
		FROM Cinema_db.Visitor) AS tmp
);

SELECT * FROM Safety_visitor;