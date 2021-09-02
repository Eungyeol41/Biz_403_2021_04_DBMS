USE myLibs;

DROP TABLE tbl_gallery;
CREATE TABLE tbl_gallery(
	g_seq		BIGINT			PRIMARY KEY 	AUTO_INCREMENT,
	g_writer	VARCHAR(20)		NOT NULL,
	g_date		VARCHAR(10)		NOT NULL,
	g_time		VARCHAR(10)		NOT NULL,
	g_subject	VARCHAR(50)		NOT NULL,
	g_content	VARCHAR(1000)	NOT NULL,
	g_image		VARCHAR(125)
);

SHOW TABLES;

DROP TABLE tbl_files;
CREATE TABLE tbl_files(
	file_seq		BIGINT			PRIMARY KEY AUTO_INCREMENT,
	file_gseq		BIGINT			NOT NULL,
	file_original	VARCHAR(125)	NOT NULL,
	file_upname		VARCHAR(125)	NOT NULL
);

SHOW TABLES;

INSERT INTO tbl_gallery(g_writer, g_date, g_time, g_subject, g_content)
VALUES('은결', '2021-07-06', '15:10:30', '비 많이', '오는 건가...');
-- 현재 연결된 session에서 INSERT가 수행되고 그 과정에서 AUTO_INCREMENT 칼럼의 변화가 있으면 그 값을 알려주는 함수
SELECT last_insert_id();

INSERT INTO tbl_files ( file_gseq, file_original, file_upname )
VALUES (1, 'title', 'UUID-title1');

-- INSERT를 수행할 때 AUTO_INCREMENT로 설정된 칼럼에 0 또는 NULL, '' 등을 설정하면 AUTO_INCREMENT가 작동된다.
INSERT INTO tbl_gallery (g_seq, g_writer, g_date, g_time, g_subject, g_content)
VALUES (0, 'Eng', '2021-07-07', '10:18:20', '졸리다', '3시간바께 못 잤는데 여기서도 시끄러워서 못 자게 생겼다.');

-- EQ JOIN
-- 카티션 곲
-- 2개의 TABLE을 JOIN하여 TABLE1의 개수 * TABLE2의 개수만큼 LIST 출력
SELECT * FROM tbl_gallery G, tbl_files F 
	WHERE G.g_seq = F.file_gseq;
    
SELECT * FROM tbl_gallery G, tbl_files F 
	WHERE G.g_seq = F.file_gseq
	AND G.g_seq = 1;

SELECT 

	G.g_seq AS g_seq,
    G.g_writer AS g_writer, 
    G.g_date AS g_date, 
    G.g_time AS g_time, 
    G.g_subject AS g_subject, 
    G.g_content AS g_content, 
    F.file_seq AS f_seq, 
    F.file_original AS f_original,
    F.file_upname AS f_upname
    
FROM tbl_gallery G, tbl_files F 
	WHERE G.g_seq = F.file_gseq
	AND G.g_seq = 1;

/*
	view_갤러리의 SQL 코드
    EQ JOIN을 만들어서 보여지는 코드
    tbl_gallery에는 데이터가 있는 데 tbl_files에 연결되는 데이터가 하나도 없는 경우
    tbl_gallery 자체가 출력되지 않는 문제가 있다
*/
CREATE VIEW view_갤러리 AS (    
	SELECT 
		G.g_seq AS g_seq,
		G.g_writer AS g_writer, 
		G.g_date AS g_date, 
		G.g_time AS g_time, 
		G.g_subject AS g_subject, 
		G.g_content AS g_content, 
		F.file_seq AS f_seq, 
		F.file_original AS f_original,
		F.file_upname AS f_upname
	FROM tbl_gallery G
		LEFT JOIN tbl_files F
			ON G.g_seq = F.file_gseq
		WHERE G.g_seq = 17
);

DESC view_갤러리;
SELECT * FROM view_갤러리;
DROP TABLE tbl_member;

/*
	1 : N 관계의 table일 경우
    보통은 FK로 설정하여 데이터를 유지한다
    
    1 : 0 ~ N : child table에 연관된 데이터가 하나도 없는 경우가 있다
    1 : 0 ~ N 인 경우는 child table에 데이터가 하나도 없는 경우 EQ JOIN을 수행하면 출력되는 데이터가 한 개도 없는 상황이 발생
    
    1 : 1 ~ N : child table에 연관된 데이터가 최소 한 개는 있는 경우
    1 : 1 ~ N 인 경우는 EQ JOIN을 수행해도 실제로 Parent table에 있는 데이터는 무조건 출력이 된다
    
    JOIN을 수행할 때는 FK가 설정되는 경우가 있거나 말거나 JOIN은 LEFT(OUTER) JOIN을 수행하는 것이 좋다.
*/
SELECT 
		G.g_seq AS g_seq,
		G.g_writer AS g_writer, 
		G.g_date AS g_date, 
		G.g_time AS g_time, 
		G.g_subject AS g_subject, 
		G.g_content AS g_content, 
		F.file_seq AS f_seq, 
		F.file_original AS f_original,
		F.file_upname AS f_upname
	FROM tbl_gallery G
		LEFT JOIN tbl_files F
			ON G.g_seq = F.file_gseq
		WHERE G.g_seq = 16;
        
DELETE FROM tbl_files WHERE file_seq = 20;

SELECT MAX(g_seq) FROM tbl_gallery;
UPDATE tbl_gallery SET g_image = '' WHERE g_seq = 17;