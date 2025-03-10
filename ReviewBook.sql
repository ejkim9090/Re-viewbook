DROP TABLE "WRITER_BBS";
DROP TABLE "TIME_PERIOD";
DROP TABLE "ORDER_BOOK";
DROP TABLE "SUBSCRIBE";
DROP TABLE "CART";
DROP TABLE "REVIEW";
DROP TABLE "GENRE";
DROP TABLE "BOOK";
DROP TABLE "RANKING";
DROP TABLE "NOTICE";
DROP TABLE "ADMIN";
DROP TABLE "USER";
DROP TABLE "ORDER";
DROP TABLE "WRITER_BBS_COMMENT";
DROP TABLE "FUNDING_MANAGE";

CREATE TABLE "WRITER_BBS" (
	"WB_NO"	NUMBER	NOT NULL,
	"WB_TITLE"	VARCHAR2(60)	NOT NULL,
	"WB_CONTENT"	VARCHAR2(4000)	NOT NULL,
	"WB_COUNT"	NUMBER DEFAULT 0	NOT NULL	,
	"WB_DATE"	TIMESTAMP DEFAULT SYSTIMESTAMP	NOT NULL	,
	"WB_WRITER"	VARCHAR2(45)	NOT NULL	,
	"WB_CATEGORY"	VARCHAR2(20)	NOT NULL,
	"US_ID"	VARCHAR2(30)	NOT NULL
);



CREATE TABLE "FUNDING_MANAGE" (
	"WB_NO"	NUMBER	NOT NULL,
	"US_ID"	VARCHAR2(30)	NOT NULL,
	"FD_ACCUMULATE"	NUMBER DEFAULT 0	NULL	,
	"FD_DONATION"	NUMBER	NULL,
	"FD_DEADLINE"	DATE DEFAULT sysdate	NOT NULL	,
	"FD_LIMIT"	NUMBER DEFAULT 100000	NOT NULL,
	"FD_OX"	NUMBER DEFAULT 0	NOT NULL	,
	"AD_ID"	VARCHAR2(30)	NOT NULL
);


CREATE TABLE "WRITER_BBS_COMMENT" (
	"WBC_NO"	NUMBER	NOT NULL,
	"WBC_DATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP NOT NULL	,
	"WBC_CONTENT"	VARCHAR2(1024)	NULL,
	"WBC_RATING"	NUMBER	NULL,
	"WB_NO"	NUMBER	NOT NULL,
	"US_ID"	VARCHAR2(30)	NOT NULL
);


CREATE TABLE "ORDER" (
	"OR_NUM"	NUMBER	NOT NULL,
	"OR_PRICE"	NUMBER	NOT NULL,
	"OR_DATE"	TIMESTAMP DEFAULT SYSTIMESTAMP	NOT NULL	,
	"US_ID"	VARCHAR2(30)	NOT NULL
);


CREATE TABLE "USER" (
	"US_ID"	VARCHAR2(30)	NOT NULL,
	"US_EMAIL"	VARCHAR2(150)	NOT NULL,
	"US_PHONE"	VARCHAR2(30)	NOT NULL,
	"US_NICKNAME"	VARCHAR2(45)	NOT NULL,
	"US_PASSWORD"	VARCHAR2(30)	NOT NULL,
	"US_GENDER"	VARCHAR2(5)	NOT NULL,
	"US_ADDRESS"	VARCHAR2(300)	NOT NULL,
	"US_NAME"	VARCHAR2(10)	NOT NULL,
	"US_BIRTH"	DATE	NOT NULL
);


CREATE TABLE "ADMIN" (
	"AD_ID"	VARCHAR2(30)	NOT NULL,
	"AD_EMAIL"	VARCHAR2(150)	NOT NULL,
	"AD_PHONE"	VARCHAR2(30)	NOT NULL,
	"AD_NICKNAME"	VARCHAR2(45)	NOT NULL,
	"AD_COMPANY"	VARCHAR2(60)	NOT NULL,
	"AD_PASSWORD"	VARCHAR2(30)	NOT NULL,
	"AD_GENDER"	VARCHAR2(5)	NOT NULL
);


CREATE TABLE "NOTICE" (
	"NT_NO"	NUMBER	NOT NULL,
	"NT_TITLE"	VARCHAR2(300)	NOT NULL,
	"NT_CONTENT"	VARCHAR2(3000)	NOT NULL,
	"NT_CNT"	NUMBER DEFAULT 0	NOT NULL	,
	"NT_DATE"	TIMESTAMP DEFAULT SYSTIMESTAMP	NOT NULL	,
	"NT_NICKNAME"	VARCHAR2(45)	NOT NULL,
	"AD_ID"	VARCHAR2(30)	NOT NULL
);


CREATE TABLE "RANKING" (
	"BK_RANK"	NUMBER	NOT NULL,
	"BK_WEEKSALES"	NUMBER	NOT NULL,
	"BK_NO"	NUMBER	NOT NULL,
	"BK_TITLE"	VARCHAR2(150)	NOT NULL,
	"BK_IMG"	VARCHAR(255)	NULL,
	"BK_RATING"	NUMBER	NULL,
	"BK_RV"	NUMBER	NULL
);


CREATE TABLE "BOOK" (
	"BK_NO"	NUMBER	NOT NULL,
	"BK_TITLE"	VARCHAR2(150)	NOT NULL,
	"BK_IMG"	VARCHAR(255)	NULL	,
	"BK_PRICE"	NUMBER DEFAULT 0	NOT NULL	,
	"BK_WRITER"	VARCHAR2(30)	NULL,
	"BK_PUBLISHDATE"	DATE	NULL,
	"BK_RATING"	NUMBER	NULL,
	"BK_RV"	NUMBER	NULL,
	"BK_SALES"	NUMBER	NULL,
	"GN_NO"	NUMBER	NOT NULL
);


CREATE TABLE "GENRE" (
	"GN_NO"	NUMBER	NOT NULL,
	"GN_NAME"	VARCHAR2(30)	NOT NULL
);


CREATE TABLE "REVIEW" (
	"RV_NUM"	NUMBER	NOT NULL,
	"RV_DATE"	TIMESTAMP DEFAULT SYSTIMESTAMP	NOT NULL	,
	"RV_TITLE"	VARCHAR2(30)	NOT NULL,
	"RV_RATING"	NUMBER	NOT NULL,
	"RV_CONTENT"	VARCHAR2(300)	NOT NULL,
	"BK_NO"	NUMBER	NOT NULL,
	"US_ID"	VARCHAR2(30)	NOT NULL
);


CREATE TABLE "CART" (
	"US_ID"	VARCHAR2(30)	NOT NULL,
	"BK_NO"	NUMBER	NOT NULL,
	"CA_COUNT"	NUMBER	NULL
);


CREATE TABLE "SUBSCRIBE" (
	"US_ID"	VARCHAR2(30)	NOT NULL,
	"SUB_INF"	VARCHAR2(50)	NULL,
	"SUB_YN"	VARCHAR2(10) DEFAULT 'N'	NOT NULL	,
	"SUB_START"	TIMESTAMP DEFAULT SYSTIMESTAMP	NULL	,
	"SUB_END"	TIMESTAMP DEFAULT SYSTIMESTAMP	NULL	,
	"SUB_REVIEW"	VARCHAR2(500)	NULL,
	"SUB_LIST"	VARCHAR2(30)	NULL
);


CREATE TABLE "ORDER_BOOK" (
	"OR_NUM"	NUMBER	NOT NULL,
	"BK_NO"	NUMBER	NOT NULL,
	"OB_COUNT"	NUMBER DEFAULT 1	NOT NULL	,
	"OB_PRICE"	NUMBER	NOT NULL
);


CREATE TABLE "TIME_PERIOD" (
	"BK_WEEKSALES"	NUMBER	NOT NULL,
	"BK_NO"	NUMBER	NOT NULL
);

ALTER TABLE "WRITER_BBS" ADD CONSTRAINT "PK_WRITER_BBS" PRIMARY KEY (
	"WB_NO"
);

ALTER TABLE "FUNDING_MANAGE" ADD CONSTRAINT "PK_FUNDING_MANAGE" PRIMARY KEY (
	"WB_NO",
	"US_ID"
);

ALTER TABLE "WRITER_BBS_COMMENT" ADD CONSTRAINT "PK_WRITER_BBS_COMMENT" PRIMARY KEY (
	"WBC_NO"
);

ALTER TABLE "ORDER" ADD CONSTRAINT "PK_ORDER" PRIMARY KEY (
	"OR_NUM"
);

ALTER TABLE "USER" ADD CONSTRAINT "PK_USER" PRIMARY KEY (
	"US_ID"
);

ALTER TABLE "ADMIN" ADD CONSTRAINT "PK_ADMIN" PRIMARY KEY (
	"AD_ID"
);

ALTER TABLE "NOTICE" ADD CONSTRAINT "PK_NOTICE" PRIMARY KEY (
	"NT_NO"
);

ALTER TABLE "RANKING" ADD CONSTRAINT "PK_RANKING" PRIMARY KEY (
	"BK_RANK"
);

ALTER TABLE "BOOK" ADD CONSTRAINT "PK_BOOK" PRIMARY KEY (
	"BK_NO"
);

ALTER TABLE "GENRE" ADD CONSTRAINT "PK_GENRE" PRIMARY KEY (
	"GN_NO"
);

ALTER TABLE "REVIEW" ADD CONSTRAINT "PK_REVIEW" PRIMARY KEY (
	"RV_NUM"
);

ALTER TABLE "CART" ADD CONSTRAINT "PK_CART" PRIMARY KEY (
	"US_ID",
	"BK_NO"
);

ALTER TABLE "SUBSCRIBE" ADD CONSTRAINT "PK_SUBSCRIBE" PRIMARY KEY (
	"US_ID"
);

ALTER TABLE "ORDER_BOOK" ADD CONSTRAINT "PK_ORDER_BOOK" PRIMARY KEY (
	"OR_NUM",
	"BK_NO"
);

ALTER TABLE "TIME_PERIOD" ADD CONSTRAINT "PK_TIME_PERIOD" PRIMARY KEY (
	"BK_WEEKSALES"
);

ALTER TABLE "WRITER_BBS" ADD CONSTRAINT "FK_USER_TO_WRITER_BBS_1" FOREIGN KEY (
	"US_ID"
)
REFERENCES "USER" (
	"US_ID"
);

ALTER TABLE "FUNDING_MANAGE" ADD CONSTRAINT "FK_WRITER_TO_FUNDING_MANAGE_1" FOREIGN KEY (
	"WB_NO"
)
REFERENCES "WRITER_BBS" (
	"WB_NO"
);

ALTER TABLE "FUNDING_MANAGE" ADD CONSTRAINT "FK_USER_TO_FUNDING_MANAGE_1" FOREIGN KEY (
	"US_ID"
)
REFERENCES "USER" (
	"US_ID"
);

ALTER TABLE "FUNDING_MANAGE" ADD CONSTRAINT "FK_ADMIN_TO_FUNDING_MANAGE_1" FOREIGN KEY (
	"AD_ID"
)
REFERENCES "ADMIN" (
	"AD_ID"
);

ALTER TABLE "WRITER_BBS_COMMENT" ADD CONSTRAINT "FK_WRITER_BBS_COMMENT" FOREIGN KEY (
	"WB_NO"
)
REFERENCES "WRITER_BBS" (
	"WB_NO"
);

ALTER TABLE "WRITER_BBS_COMMENT" ADD CONSTRAINT "FK_USER_WRITER_BBS_COMMENT" FOREIGN KEY (
	"US_ID"
)
REFERENCES "USER" (
	"US_ID"
);

ALTER TABLE "ORDER" ADD CONSTRAINT "FK_USER_TO_ORDER_1" FOREIGN KEY (
	"US_ID"
)
REFERENCES "USER" (
	"US_ID"
);

ALTER TABLE "NOTICE" ADD CONSTRAINT "FK_ADMIN_TO_NOTICE_1" FOREIGN KEY (
	"AD_ID"
)
REFERENCES "ADMIN" (
	"AD_ID"
);

ALTER TABLE "RANKING" ADD CONSTRAINT "FK_TIME_PERIOD_TO_RANKING_1" FOREIGN KEY (
	"BK_WEEKSALES"
)
REFERENCES "TIME_PERIOD" (
	"BK_WEEKSALES"
);

ALTER TABLE "RANKING" ADD CONSTRAINT "FK_TIME_PERIOD_TO_RANKING_2" FOREIGN KEY (
	"BK_NO"
)
REFERENCES "BOOK" (
	"BK_NO"
);

ALTER TABLE "BOOK" ADD CONSTRAINT "FK_GENRE_TO_BOOK_1" FOREIGN KEY (
	"GN_NO"
)
REFERENCES "GENRE" (
	"GN_NO"
);

ALTER TABLE "REVIEW" ADD CONSTRAINT "FK_BOOK_TO_REVIEW_1" FOREIGN KEY (
	"BK_NO"
)
REFERENCES "BOOK" (
	"BK_NO"
);

ALTER TABLE "REVIEW" ADD CONSTRAINT "FK_USER_TO_REVIEW_1" FOREIGN KEY (
	"US_ID"
)
REFERENCES "USER" (
	"US_ID"
);

ALTER TABLE "CART" ADD CONSTRAINT "FK_USER_TO_CART_1" FOREIGN KEY (
	"US_ID"
)
REFERENCES "USER" (
	"US_ID"
);

ALTER TABLE "CART" ADD CONSTRAINT "FK_BOOK_TO_CART_1" FOREIGN KEY (
	"BK_NO"
)
REFERENCES "BOOK" (
	"BK_NO"
);

ALTER TABLE "SUBSCRIBE" ADD CONSTRAINT "FK_USER_TO_SUBSCRIBE_1" FOREIGN KEY (
	"US_ID"
)
REFERENCES "USER" (
	"US_ID"
);

ALTER TABLE "ORDER_BOOK" ADD CONSTRAINT "FK_ORDER_TO_ORDER_BOOK_1" FOREIGN KEY (
	"OR_NUM"
)
REFERENCES "ORDER" (
	"OR_NUM"
);

ALTER TABLE "ORDER_BOOK" ADD CONSTRAINT "FK_BOOK_TO_ORDER_BOOK_1" FOREIGN KEY (
	"BK_NO"
)
REFERENCES "BOOK" (
	"BK_NO"
);

ALTER TABLE "TIME_PERIOD" ADD CONSTRAINT "FK_BOOK_TO_TIME_PERIOD_1" FOREIGN KEY (
	"BK_NO"
)
REFERENCES "BOOK" (
	"BK_NO"
);

