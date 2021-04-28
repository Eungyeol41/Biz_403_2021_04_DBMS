-- 여기는 
DROP TABLE tbl_books;
CREATE TABLE tbl_books(
    bk_ISBN	CHAR(13) PRIMARY KEY,
    bk_pub nVARCHAR2(15) NOT NULL	,
    bk_title nVARCHAR2(125) NOT NULL,	
    bk_author nVARCHAR2(50) NOT NULL,	
    bk_trans nVARCHAR2(20),
    bk_date	VARCHAR2(10),
    bk_page	NUMBER,
    bk_price NUMBER
);

INSERT INTO tbl_books(bk_ISBN, bk_pub, bk_title, bk_author, bk_trans, bk_date, bk_page, bk_price) VALUES ('9791162540770', '비즈니스북스', '데스 바이 아마존', '시로타 마코토', '신희원', '2019-04-15', '272', '15000');
INSERT INTO tbl_books(bk_ISBN, bk_pub, bk_title, bk_author, bk_trans, bk_date, bk_page, bk_price) VALUES ('9791188850549', '북라이프', '4주 만에 완성하는 레깅스핏 스트레칭', '모리 다쿠로', '김현정', '2019-04-11', '132', '13000');
INSERT INTO tbl_books(bk_ISBN, bk_pub, bk_title, bk_author, bk_trans, bk_date, bk_page, bk_price) VALUES ('9791188850518', '북라이프', '왕이 된 남자2', '김선덕', '', '2019-04-10', '388', '14000');
INSERT INTO tbl_books(bk_ISBN, bk_pub, bk_title, bk_author, bk_trans, bk_date, bk_page, bk_price) VALUES ('9791188850501', '북라이프', '왕이 된 남자1', '김선덕', '', '2019-04-10', '440', '14000');
INSERT INTO tbl_books(bk_ISBN, bk_pub, bk_title, bk_author, bk_trans, bk_date, bk_page, bk_price) VALUES ('9791162540756', '비지니스북스', '새벽에 읽는 유대인 인생 특강', '장대은', '', '2019-04-10', '280', '15000');
INSERT INTO tbl_books(bk_ISBN, bk_pub, bk_title, bk_author, bk_trans, bk_date, bk_page, bk_price) VALUES ('9791188850471', '북라이프', '왕이 된 남자 포토에세이', '스튜디오 드래곤', '', '2019-04-10', '368', '25000');
INSERT INTO tbl_books(bk_ISBN, bk_pub, bk_title, bk_author, bk_trans, bk_date, bk_page, bk_price) VALUES ('9791162540732', '비지니스북스', '오토노미 제 2의 이동 혁명', '로렌스 번스 - 크리스토퍼 슐건', '김현정', '2019-03-31', '536', '22000');
INSERT INTO tbl_books(bk_ISBN, bk_pub, bk_title, bk_author, bk_trans, bk_date, bk_page, bk_price) VALUES ('9791162540718', '비지니스북스', '쓴다 쓴다 쓰는 대로 된다', '후루카와 다케시', '유나현', '2019-03-30', '232', '13000');
INSERT INTO tbl_books(bk_ISBN, bk_pub, bk_title, bk_author, bk_trans, bk_date, bk_page, bk_price) VALUES ('9791162540695', '비지니스북스', '머니패턴', '이요셉 - 김채송화', '', '2019-03-25', '264', '15000');
INSERT INTO tbl_books(bk_ISBN, bk_pub, bk_title, bk_author, bk_trans, bk_date, bk_page, bk_price) VALUES ('9791162540671', '비지니스북스', '1日 1行의 기적', '유근용', '', '2019-03-20', '500', '13800');
INSERT INTO tbl_books(bk_ISBN, bk_pub, bk_title, bk_author, bk_trans, bk_date, bk_page, bk_price) VALUES ('9791188850440', '북라이프', '오늘도 울컥하고 말았습니다', '정민지', '', '2019-03-15', '248', '13800');
INSERT INTO tbl_books(bk_ISBN, bk_pub, bk_title, bk_author, bk_trans, bk_date, bk_page, bk_price) VALUES ('9791188850426', '북라이프', '엘리트 제국의 몰락', '미하엘 하르트만', '이덕임', '2019-02-27', '376', '16800');
INSERT INTO tbl_books(bk_ISBN, bk_pub, bk_title, bk_author, bk_trans, bk_date, bk_page, bk_price) VALUES ('9791162540640', '비지니스북스', '아주 작은 습관의 힘', '제임스 클리어', '이한이', '2019-02-26', '360', '16000');
INSERT INTO tbl_books(bk_ISBN, bk_pub, bk_title, bk_author, bk_trans, bk_date, bk_page, bk_price) VALUES ('9791186805398', '비지니스북스', '그릿 GRIT(100쇄 기념 리커버 에디션)', '엔젤라 더크워스', '김미정', '2019-02-20', '416', '16000');

