--------------------------------------------------------
--  督析戚 持失喫 - 榎推析-9杉-06-2013   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence BOARD_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "VAPS"."BOARD_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 161 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table BOARD
--------------------------------------------------------

  CREATE TABLE "VAPS"."BOARD" 
   (	"B_NUM" NUMBER, 
	"B_ID" NVARCHAR2(20), 
	"B_SUB" NVARCHAR2(50), 
	"B_CONTENTS" NCLOB, 
	"B_DATE" DATE DEFAULT SYSDATE, 
	"B_READCOUNT" NUMBER DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("B_CONTENTS") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table ITEMS
--------------------------------------------------------

  CREATE TABLE "VAPS"."ITEMS" 
   (	"I_NAME" NVARCHAR2(100), 
	"I_CATEGORY" NVARCHAR2(100), 
	"I_PRICE" NUMBER DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table ITEMSORED
--------------------------------------------------------

  CREATE TABLE "VAPS"."ITEMSORED" 
   (	"IS_NAME" NVARCHAR2(100), 
	"IS_COUNT" NUMBER DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table MEMBERS
--------------------------------------------------------

  CREATE TABLE "VAPS"."MEMBERS" 
   (	"M_ID" NVARCHAR2(20), 
	"M_NICK" NVARCHAR2(20), 
	"M_PWD" NVARCHAR2(20), 
	"M_PHONE" NVARCHAR2(20), 
	"M_ADDR" NVARCHAR2(20), 
	"M_POINT" NUMBER(20,0) DEFAULT '0', 
	"M_AUTH" NUMBER DEFAULT '0'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for View BLIST
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "VAPS"."BLIST" ("B_NO", "B_NUM", "B_ID", "B_SUB", "B_CONTENTS", "B_DATE", "B_READCOUNT") AS 
  SELECT ROWNUM AS B_NO, 
            B_NUM,
            B_ID,
            B_SUB,
            B_CONTENTS,
            B_DATE,
            B_READCOUNT
FROM BLISTDESC;
--------------------------------------------------------
--  DDL for View BLISTDESC
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "VAPS"."BLISTDESC" ("B_NUM", "B_ID", "B_SUB", "B_CONTENTS", "B_DATE", "B_READCOUNT", "M_ID", "M_NICK", "M_PWD", "M_PHONE", "M_ADDR", "M_POINT", "M_AUTH") AS 
  SELECT "B_NUM","B_ID","B_SUB","B_CONTENTS","B_DATE","B_READCOUNT","M_ID","M_NICK","M_PWD","M_PHONE","M_ADDR","M_POINT","M_AUTH"
FROM B INNER JOIN M ON B.B_ID=M.M_ID
ORDER BY B.B_NUM DESC;
REM INSERTING into VAPS.BOARD
SET DEFINE OFF;
Insert into VAPS.BOARD (B_NUM,B_ID,B_SUB,B_DATE,B_READCOUNT) values (136,'a','a域舛 惟獣越 呪舛',to_date('13/09/03','RR/MM/DD'),0);
Insert into VAPS.BOARD (B_NUM,B_ID,B_SUB,B_DATE,B_READCOUNT) values (137,'a','けけけ',to_date('13/09/03','RR/MM/DD'),0);
Insert into VAPS.BOARD (B_NUM,B_ID,B_SUB,B_DATE,B_READCOUNT) values (138,'a','呪舛 砺什闘2',to_date('13/09/03','RR/MM/DD'),0);
Insert into VAPS.BOARD (B_NUM,B_ID,B_SUB,B_DATE,B_READCOUNT) values (139,'a','淫軒切 : 呪舛 砺什闘',to_date('13/09/03','RR/MM/DD'),0);
Insert into VAPS.BOARD (B_NUM,B_ID,B_SUB,B_DATE,B_READCOUNT) values (135,'a','aaa',to_date('13/09/03','RR/MM/DD'),0);
Insert into VAPS.BOARD (B_NUM,B_ID,B_SUB,B_DATE,B_READCOUNT) values (133,'a','惟獣越 呪舛 砺什闘',to_date('13/09/03','RR/MM/DD'),0);
Insert into VAPS.BOARD (B_NUM,B_ID,B_SUB,B_DATE,B_READCOUNT) values (132,'admin','A',to_date('13/09/03','RR/MM/DD'),0);
Insert into VAPS.BOARD (B_NUM,B_ID,B_SUB,B_DATE,B_READCOUNT) values (134,'a','asd',to_date('13/09/03','RR/MM/DD'),0);
Insert into VAPS.BOARD (B_NUM,B_ID,B_SUB,B_DATE,B_READCOUNT) values (143,'q','qweqwe',to_date('13/09/04','RR/MM/DD'),1);
Insert into VAPS.BOARD (B_NUM,B_ID,B_SUB,B_DATE,B_READCOUNT) values (144,'a','鎧遂 煽舌 坦軒',to_date('13/09/04','RR/MM/DD'),1);
Insert into VAPS.BOARD (B_NUM,B_ID,B_SUB,B_DATE,B_READCOUNT) values (146,'a','杯庁 板 砺什闘',to_date('13/09/04','RR/MM/DD'),3);
REM INSERTING into VAPS.ITEMS
SET DEFINE OFF;
Insert into VAPS.ITEMS (I_NAME,I_CATEGORY,I_PRICE) values ('亀恵還亀獣喰','亀獣喰',3200);
Insert into VAPS.ITEMS (I_NAME,I_CATEGORY,I_PRICE) values ('帖轍亀獣喰','亀獣喰',3000);
Insert into VAPS.ITEMS (I_NAME,I_CATEGORY,I_PRICE) values ('儀亜什亀獣喰','亀獣喰',3600);
Insert into VAPS.ITEMS (I_NAME,I_CATEGORY,I_PRICE) values ('整域舌','虞檎',1000);
Insert into VAPS.ITEMS (I_NAME,I_CATEGORY,I_PRICE) values ('巷督原','虞檎',1200);
Insert into VAPS.ITEMS (I_NAME,I_CATEGORY,I_PRICE) values ('重虞檎 鷺窟','虞檎',1500);
Insert into VAPS.ITEMS (I_NAME,I_CATEGORY,I_PRICE) values ('醤辰搾策剛','搾策剛',1000);
Insert into VAPS.ITEMS (I_NAME,I_CATEGORY,I_PRICE) values ('帖轍原推','搾策剛',1200);
Insert into VAPS.ITEMS (I_NAME,I_CATEGORY,I_PRICE) values ('儀猿什原推','搾策剛',1500);
REM INSERTING into VAPS.ITEMSORED
SET DEFINE OFF;
Insert into VAPS.ITEMSORED (IS_NAME,IS_COUNT) values ('亀恵還亀獣喰',1000);
Insert into VAPS.ITEMSORED (IS_NAME,IS_COUNT) values ('儀亜什亀獣喰',1000);
Insert into VAPS.ITEMSORED (IS_NAME,IS_COUNT) values ('帖轍亀獣喰',1000);
Insert into VAPS.ITEMSORED (IS_NAME,IS_COUNT) values ('整域舌',1000);
Insert into VAPS.ITEMSORED (IS_NAME,IS_COUNT) values ('巷督原',1000);
Insert into VAPS.ITEMSORED (IS_NAME,IS_COUNT) values ('重虞檎 鷺窟',1000);
Insert into VAPS.ITEMSORED (IS_NAME,IS_COUNT) values ('醤辰搾策剛',1000);
Insert into VAPS.ITEMSORED (IS_NAME,IS_COUNT) values ('帖轍原推',1000);
Insert into VAPS.ITEMSORED (IS_NAME,IS_COUNT) values ('儀猿什原推',1000);
REM INSERTING into VAPS.MEMBERS
SET DEFINE OFF;
Insert into VAPS.MEMBERS (M_ID,M_NICK,M_PWD,M_PHONE,M_ADDR,M_POINT,M_AUTH) values ('q','q','xflW2blGMwM=','123123123','qqqq',0,0);
Insert into VAPS.MEMBERS (M_ID,M_NICK,M_PWD,M_PHONE,M_ADDR,M_POINT,M_AUTH) values ('as','廃越','bWI8m5ooHHE=','123123123123','せせせせ',0,0);
Insert into VAPS.MEMBERS (M_ID,M_NICK,M_PWD,M_PHONE,M_ADDR,M_POINT,M_AUTH) values ('admin','淫軒切','jAkdR9RQh/8=','01023235656','辞随獣 悪害姥',0,1);
Insert into VAPS.MEMBERS (M_ID,M_NICK,M_PWD,M_PHONE,M_ADDR,M_POINT,M_AUTH) values ('a','砺什闘','jAkdR9RQh/8=','01022223333','辞随獣',0,0);
--------------------------------------------------------
--  Constraints for Table BOARD
--------------------------------------------------------

  ALTER TABLE "VAPS"."BOARD" ADD PRIMARY KEY ("B_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "VAPS"."BOARD" MODIFY ("B_CONTENTS" NOT NULL ENABLE);
  ALTER TABLE "VAPS"."BOARD" MODIFY ("B_SUB" NOT NULL ENABLE);
  ALTER TABLE "VAPS"."BOARD" MODIFY ("B_ID" NOT NULL ENABLE);
  ALTER TABLE "VAPS"."BOARD" MODIFY ("B_NUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MEMBERS
--------------------------------------------------------

  ALTER TABLE "VAPS"."MEMBERS" ADD PRIMARY KEY ("M_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "VAPS"."MEMBERS" MODIFY ("M_PWD" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ITEMS
--------------------------------------------------------

  ALTER TABLE "VAPS"."ITEMS" ADD PRIMARY KEY ("I_NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ITEMSORED
--------------------------------------------------------

  ALTER TABLE "VAPS"."ITEMSORED" ADD PRIMARY KEY ("IS_NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BOARD
--------------------------------------------------------

  ALTER TABLE "VAPS"."BOARD" ADD CONSTRAINT "B_WRITER_FK" FOREIGN KEY ("B_ID")
	  REFERENCES "VAPS"."MEMBERS" ("M_ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ITEMSORED
--------------------------------------------------------

  ALTER TABLE "VAPS"."ITEMSORED" ADD CONSTRAINT "ITEM_STORED_NAME_FK" FOREIGN KEY ("IS_NAME")
	  REFERENCES "VAPS"."ITEMS" ("I_NAME") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  DDL for Synonymn B
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "VAPS"."B" FOR "VAPS"."BOARD";
--------------------------------------------------------
--  DDL for Synonymn M
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "VAPS"."M" FOR "VAPS"."MEMBERS";
