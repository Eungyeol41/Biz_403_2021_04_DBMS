-- gbUser 접속
SHOW DATABASES;
USE GuestBook;
DROP TABLE tbl_guest_book;
CREATE TABLE tbl_guest_book(
	gb_seq		BIGINT			PRIMARY KEY AUTO_INCREMENT,
	gb_date		VARCHAR(10)		NOT NULL,
	gb_time		VARCHAR(10)		NOT NULL,
	gb_writer	VARCHAR(30)		NOT NULL,
	gb_email	VARCHAR(30)		NOT NULL,
	gb_password	VARCHAR(125)	NOT NULL,
	gb_content	VARCHAR(2000)	NOT NULL
);

INSERT INTO tbl_guest_book(gb_date, gb_time, gb_writer, gb_email, gb_password, gb_content)
VALUES('2021-05-18', '10:30:00', 'Eungyeol', 'iniziato@naver.com', '12345', '오늘은 화요일');

INSERT INTO tbl_guest_book(gb_date, gb_time, gb_writer, gb_email, gb_password, gb_content)
VALUES('2021-05-18', '10:35:28', 'Eungyeol', 'iniziato@naver.com', '12345', '내일은 수요일');

INSERT INTO tbl_guest_book(gb_date, gb_time, gb_writer, gb_email, gb_password, gb_content)
VALUES('2021-05-18', '10:36:00', 'Eungyeol', 'iniziato@naver.com', '12345', '내일은 석가탄신일');

SELECT * FROM tbl_guest_book;
SELECT * FROM tbl_guest_book
WHERE gb_date = '2021-05-18';

SELECT * FROM tbl_guest_book
ORDER BY gb_seq DESC;

SELECT * FROM tbl_guest_book
ORDER BY gb_date desc, gb_time desc;

-- UPDATE, DELETE를 수행할 때는 2개 이상의 레코드에 영향을 미치는 명령은 매우 신중하게 실행해야 한다
-- 가장 좋은 방법은 변경, 삭제하고자 하는 데이터가 여러 개 있더라도 가급적 PK를 기준으로 1개씩 처리하는 것이 좋다.
UPDATE tbl_guest_book
SET gb_time = '10:36:00'
WHERE gb_seq = 2;

DELETE FROM tbl_guest_book
WHERE gb_seq = 1;

SELECT * FROM tbl_guest_book;
-- MySQL은 AUTO_COMMIT 상태라 UPDATE나 DELETE를 수행함과 동시에 COMMIT이 되서 ROLLBACK이 되지 않는다.
ROLLBACK;

SELECT 30 * 40;

-- MySQL 고유함수로 문자열을 연결할 때
SELECT CONCAT('대한', '민국', '만세');

SELECT * FROM tbl_guest_book
WHERE gb_content LIKE CONCAT('%', '내일', '%');

-- Oracle의 DECODE()와 유사한 형태의 조건연산
-- gb_seq의 값이 짝수이면 짝수로 표시 / 그렇지 않으면 홀수로 표시
SELECT IF((gb_seq, 2) = 0, '짝수', '홀수')
FROM tbl_guest_book;

SELECT FLOOR(RAND() * 100);
SELECT IF(MOD(FLOOR(RAND() * 100), 2) = 0, '짝수', '홀수');

SELECT * FROM tbl_guest_book
ORDER BY gb_date DESC, gb_time DESC;

SELECT * FROM tbl_guest_book
WHERE gb_content
LIKE '국가'
ORDER BY gb_date DESC, gb_time DESC;

CREATE VIEW view_방명록 AS 
(
	SELECT gb_seq AS '일련번호',
			gb_date AS '등록일자',
			gb_time AS '등록시간',
			gb_writer AS '등록자이름',
			gb_email AS '등록Email',
			gb_password AS '비밀번호',
			gb_content AS '내용'
	FROM tbl_guest_book
);

SELECT * FROM view_방명록;