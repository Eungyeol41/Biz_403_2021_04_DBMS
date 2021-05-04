CREATE TABLE tbl_student(
    st_num	CHAR(5)		PRIMARY KEY,
    st_name	nVARCHAR2(20)	NOT NULL,	
    st_tel	VARCHAR2(20),
    st_addr	nVARCHAR2(125),
    st_grade	NUMBER,
    st_dpcode	CHAR(20)
);

CREATE TABLE tbl_dept(
    dp_code	CHAR(10),
    dp_name	nVARCHAR2(20),
    dp_pro	nVARCHAR2(20),
    dp_tel	CHAR(10) PRIMARY KEY
);

CREATE TABLE tbl_subject(
    sb_code	CHAR(10),
    sb_name	nVARCHAR2(20),
    sb_prof	nVARCHAR2(20)
);

CREATE TABLE tbl_score(
    sc_seq	NUMBER,
    sc_stnum	CHAR(10)		PRIMARY KEY,
    sc_sbcode	CHAR(10),
    sc_score	NUMBER
);