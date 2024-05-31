-- DB_ORGANIZER0528 USER

CREATE DATABASE DB_ORGANIZER0528;
USE DB_ORGANIZER0528;


-- MEMBER TABLE 

CREATE TABLE TBL_MEMBER(
	M_NO INT AUTO_INCREMENT UNIQUE,
    M_ID VARCHAR(30) NOT NULL UNIQUE,
    M_PW VARCHAR(100) NOT NULL,
    M_MAIL VARCHAR(50) NOT NULL,
    M_PHONE VARCHAR(30) NOT NULL,
    M_REG_DATE DATETIME DEFAULT NOW(),
    M_MOD_DATE DATETIME DEFAULT NOW(), 
    PRIMARY KEY(M_ID)
);

ALTER TABLE TBL_MEMBER 
ADD COLUMN M_ROLE VARCHAR(20) DEFAULT 'USER_PENDING' AFTER M_PHONE;

SELECT * FROM TBL_MEMBER;
DELETE FROM TBL_MEMBER;


CREATE TABLE TBL_PLAN (
	P_NO INT AUTO_INCREMENT,
    P_ORI_NO INT,               		-- 최초 일정 NO
    P_ORI_OWNER_ID VARCHAR(20),      	-- 최초 일정 등록자 ID(공유 받은 경우 M_ID값을 가지고 insert됨)
    M_ID VARCHAR(20),            		-- 일정 등록자 ID(공유 받은 경우 공유 받은 사람 ID값을 이용해서 insert됨)
    P_YEAR INT,
    P_MONTH INT,
    P_DATE INT,
    P_IMG_NAME VARCHAR(50),
    P_TITLE VARCHAR(100),
    P_BODY VARCHAR(100),
    P_REG_DATE DATETIME DEFAULT NOW(),
    P_MOD_DATE DATETIME DEFAULT NOW(),
    PRIMARY KEY(P_NO)
);

SELECT * FROM TBL_PLAN;
DELETE FROM TBL_PLAN;


CREATE TABLE TBL_COMMENT (
	C_NO INT AUTO_INCREMENT UNIQUE,
    P_ORI_NO INT,
    M_ID VARCHAR(20),
    C_TXT VARCHAR(100),
    C_REG_DATE DATETIME DEFAULT NOW(),
    C_MOD_DATE DATETIME DEFAULT NOW(),
    PRIMARY KEY(C_NO)
);


SELECT * FROM TBL_COMMENT;
DELETE FROM TBL_COMMENT;