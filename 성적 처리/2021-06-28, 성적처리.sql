USE db_school;

SELECT * FROM tbl_subject;
INSERT INTO tbl_score(sc_stnum, sc_sbcode, sc_score) VALUES('20210001', 'S004', '55');

/*
	tbl_subject, tbl_score tabl을 가지고 각 학생의 성적 리스트를 출력해보기
    
    과목 리스트를 출력하고 각 과목의 성적이 입력된 학생의 리스트를 확인하기
    
    학번을 조건으로 하여 한 학생의 성적입력 여부를 확인하기
    
    학생의 점수가 입력된 과목과 입력되지 않은 과목을 확인하고 싶다.
*/
SELECT SB.sb_code, SB.sb_name, SB.sb_prof, SC.sc_stnum, SC.sc_score
FROM tbl_subject SB
	LEFT JOIN (SELECT * FROM tbl_score WHERE sc_stnum = '20210001') SC
		ON SC.sc_sbcode = SB.sb_code;
-- WHERE SC.sc_stnum = '20210001';

/*
	과목리스트를 전체 보여주고, 학생 성적 table을 JOIN하여 학생의 점수가 있으면 점수를 보이고 없으면 NULL로 보여주는 JOIN SQL문
    
    이 JOIN 명령문에 특정한 학번을 조건으로 부여하여 한 학생의 성적 여부를 조회하는 SQL문 만들기
    
    순수한 JOIN을 사용하여 한 학생의 성적을 조회하는 데 학생의 성적이 tbl_score table에 있으면 점수를 보이고 없으면 NULL로 표현하기 위하여 
		where 절에서 학번을 조건으로 부여하지 않고 JOIN문의 ON 절에서 학번을 조건으로 부여한다.
*/
SELECT SB.sb_code, SB.sb_name, SB.sb_prof, SC.sc_stnum, SC.sc_score
FROM tbl_subject SB
	LEFT JOIN tbl_score SC
		ON SC.sc_sbcode = SB.sb_code
        AND SC.sc_stnum = '20210001';

DELETE FROM tbl_subject WHERE sb_code LIKE '과목코드';
desc tbl_subject;

ALTER TABLE tbl_subject MODIFY COLUMN sb_code CHAR(4) PRIMARY KEY;

SELECT COUNT(*) FROM tbl_score WHERE sc_stnum = "20210222" GROUP BY sc_stnum;
SELECT COUNT(*) FROM tbl_score WHERE sc_stnum = "20210222";

USE db_school;
DROP TABLE tbl_score;
/*
	TABLE에 INSERT INTO ON DUPLICATE KEY UPDATE를 실행하기 위해서는 PK 설정을 변경해야 한다
	tbl_score는 두 개의 칼럼을 기준으로 UPDATE, DELETE를 수행하는 문제가 발생
    가장 좋은 설계는 UPDATE, DELETE를 수행할 때 한 개의 칼럼으로 구성된 PK를 기준으로 수행하는 것이 좋다
*/
/*
	PK는 그대로 살려두고, 2개의 칼럼을 묶어 UNIQUE로 설정
    2개 칼럼의 값이 동시에 같은 경우에는 추가하지 말라는 제약조건 설정
*/
CREATE TABLE tbl_score (
	sc_seq BIGINT AUTO_INCREMENT PRIMARY KEY,
    sc_stnum CHAR(8) NOT NULL,
    sc_sbcode CHAR(4) NOT NULL,
    sc_score INT NOT NULL,
    UNIQUE(sc_stnum, sc_sbcode)
);

-- 한 학생의 3과목 점수를 개별적으로 INSERT하기
INSERT INTO tbl_score(sc_stnum, sc_sbcode, sc_score) VALUES ('20210002', 'S001', 90);
INSERT INTO tbl_score(sc_stnum, sc_sbcode, sc_score) VALUES ('20210002', 'S002', 95);
INSERT INTO tbl_score(sc_stnum, sc_sbcode, sc_score) VALUES ('20210002', 'S003', 92);

-- 1번의 INSERT 명령문으로 다수의 명령문 INSERT하기
INSERT INTO tbl_score (sc_stnum, sc_sbcode, sc_score)  VALUES ('2021003', 'S001', 90), ('20210003', 'S002', 95), ('20210003', 'S003', 92);
SELECT * FROM tbl_score;