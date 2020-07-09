--------------------------------------------------------
--  ������ ������ - ������-6��-03-2020   
--------------------------------------------------------
DROP TABLE "POSITIONS" cascade constraints;
DROP TABLE "PROJECT_ISSUES" cascade constraints;
DROP TABLE "PROJECT_TASKS" cascade constraints;
DROP TABLE "PROJECT_TASK_GROUPS" cascade constraints;
DROP TABLE "TEAMS" cascade constraints;
DROP TABLE "USERS" cascade constraints;
DROP VIEW "PROJECTLIST";
--------------------------------------------------------
--  DDL for Table POSITIONS
--------------------------------------------------------

  CREATE TABLE "POSITIONS" 
   (	"POSITION_CODE" NUMBER, 
	"POSITION_NAME" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PROJECT_ISSUES
--------------------------------------------------------

  CREATE TABLE "PROJECT_ISSUES" 
   (	"ISSUE_CODE" VARCHAR2(30 BYTE), 
	"ISSUE_NAME" VARCHAR2(100 BYTE), 
	"ISSUE_DESCRIPTION" VARCHAR2(500 BYTE), 
	"ISSUE_USER_ID" VARCHAR2(50 BYTE), 
	"ISSUE_DATE" DATE, 
	"ISSUE_ACTION_ID" VARCHAR2(50 BYTE), 
	"ISSUE_ACTION_DATE" DATE, 
	"ISSUE_TYPE_CODE" VARCHAR2(30 BYTE), 
	"TASK_CODE" VARCHAR2(30 BYTE), 
	"ISSUE_FILE_NAME" VARCHAR2(200 BYTE), 
	"ISSUE_FILE_PATH" VARCHAR2(300 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PROJECT_TASKS
--------------------------------------------------------

  CREATE TABLE "PROJECT_TASKS" 
   (	"TASK_CODE" VARCHAR2(30 BYTE), 
	"TASK_NAME" VARCHAR2(100 BYTE), 
	"TASK_START" DATE, 
	"TASK_FINISH" DATE, 
	"TASK_DESCRIPTION" VARCHAR2(500 BYTE), 
	"TASKGROUP_CODE" VARCHAR2(30 BYTE), 
	"TASK_STATUS_CODE" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PROJECT_TASK_GROUPS
--------------------------------------------------------

  CREATE TABLE "PROJECT_TASK_GROUPS" 
   (	"TASKGROUP_CODE" VARCHAR2(30 BYTE), 
	"TASKGROUP_NAME" VARCHAR2(100 BYTE), 
	"TASKGROUP_DESCRIPTION" VARCHAR2(500 BYTE), 
	"PROJECT_CODE" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TEAMS
--------------------------------------------------------

  CREATE TABLE "TEAMS" 
   (	"TEAM_CODE" NUMBER, 
	"TEAM_NAME" VARCHAR2(20 BYTE), 
	"TEAM_UPPER" VARCHAR2(20 BYTE), 
	"TEAM_SEQ" NUMBER, 
	"TEAM_USE" VARCHAR2(5 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table USERS
--------------------------------------------------------

  CREATE TABLE "USERS" 
   (	"USER_ID" VARCHAR2(50 BYTE), 
	"USER_PW" VARCHAR2(50 BYTE), 
	"USER_NAME" VARCHAR2(20 BYTE), 
	"USER_EMAIL" VARCHAR2(50 BYTE), 
	"USER_PHONE" VARCHAR2(50 BYTE), 
	"USER_REGITDATE" TIMESTAMP (6), 
	"TEAM_CODE" NUMBER, 
	"POSITION_CODE" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for View PROJECTLIST
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "PROJECTLIST" ("PROJECT_NAME", "PROJECT_TYPENAME", "PROJECT_START", "PROJECT_FINISH", "PROJECTOUTPUTACCOUNT", "PROJECTISSUEACCOUNT") AS 
  select 
p.project_name as project_name,
(select project_type
from project_types ptype
where ptype.project_typecode = p.project_typecode) as project_typeName,
p.project_start as project_start,
p.project_finish as project_finish,
(select count(*) 
from project_tasks pt, project_task_groups ptg , project_outputs po 
where p.project_code = ptg.project_code 
AND pt.taskGroup_code = ptg.taskGroup_code 
AND pt.task_code = po.task_code) as projectOutputAccount,
(select count(*)
from project_tasks pt, project_task_groups ptg , project_issues pi
where p.project_code = ptg.project_code 
AND pt.taskGroup_code = ptg.taskGroup_code 
AND pt.task_code = pi.task_code) as projectIssueAccount
from projects p
;
REM INSERTING into POSITIONS
SET DEFINE OFF;
Insert into POSITIONS (POSITION_CODE,POSITION_NAME) values (1,'����');
Insert into POSITIONS (POSITION_CODE,POSITION_NAME) values (2,'����');
Insert into POSITIONS (POSITION_CODE,POSITION_NAME) values (3,'����');
Insert into POSITIONS (POSITION_CODE,POSITION_NAME) values (4,'�븮');
Insert into POSITIONS (POSITION_CODE,POSITION_NAME) values (5,'���');
REM INSERTING into PROJECT_ISSUES
SET DEFINE OFF;
Insert into PROJECT_ISSUES (ISSUE_CODE,ISSUE_NAME,ISSUE_DESCRIPTION,ISSUE_USER_ID,ISSUE_DATE,ISSUE_ACTION_ID,ISSUE_ACTION_DATE,ISSUE_TYPE_CODE,TASK_CODE,ISSUE_FILE_NAME,ISSUE_FILE_PATH) values ('issue-TWS-001','������Ʈ ���� ����','������� �������� ���� ��������','lcy0815',to_date('20/06/21','RR/MM/DD'),'lcy0815',to_date('20/06/22','RR/MM/DD'),'issuetype100','task-TWS-001',null,null);
Insert into PROJECT_ISSUES (ISSUE_CODE,ISSUE_NAME,ISSUE_DESCRIPTION,ISSUE_USER_ID,ISSUE_DATE,ISSUE_ACTION_ID,ISSUE_ACTION_DATE,ISSUE_TYPE_CODE,TASK_CODE,ISSUE_FILE_NAME,ISSUE_FILE_PATH) values ('issue-TWS-002','������Ʈ ���� ����','���μ��� �ۼ� �������� ���� ��������','lcy0815',to_date('20/06/26','RR/MM/DD'),'lcy0815',to_date('20/06/27','RR/MM/DD'),'issuetype200','task-TWS-002',null,null);
Insert into PROJECT_ISSUES (ISSUE_CODE,ISSUE_NAME,ISSUE_DESCRIPTION,ISSUE_USER_ID,ISSUE_DATE,ISSUE_ACTION_ID,ISSUE_ACTION_DATE,ISSUE_TYPE_CODE,TASK_CODE,ISSUE_FILE_NAME,ISSUE_FILE_PATH) values ('issue-VAD-001','���μ��� �� ��ȹ����','�������� ���� ����Ⱓ ����','khj0623',to_date('20/06/24','RR/MM/DD'),'khj0623',to_date('20/06/27','RR/MM/DD'),'issuetype200','task-VAD-002',null,null);
Insert into PROJECT_ISSUES (ISSUE_CODE,ISSUE_NAME,ISSUE_DESCRIPTION,ISSUE_USER_ID,ISSUE_DATE,ISSUE_ACTION_ID,ISSUE_ACTION_DATE,ISSUE_TYPE_CODE,TASK_CODE,ISSUE_FILE_NAME,ISSUE_FILE_PATH) values ('issue-WMW-001','���� ���� �߻�','���� ���� ���� �߻�','krm1234',to_date('20/06/20','RR/MM/DD'),'krm1234',to_date('20/06/23','RR/MM/DD'),'issuetype300','task-WMW-004',null,null);
Insert into PROJECT_ISSUES (ISSUE_CODE,ISSUE_NAME,ISSUE_DESCRIPTION,ISSUE_USER_ID,ISSUE_DATE,ISSUE_ACTION_ID,ISSUE_ACTION_DATE,ISSUE_TYPE_CODE,TASK_CODE,ISSUE_FILE_NAME,ISSUE_FILE_PATH) values ('issue-WMW-002','���� ����','���� ���� �߻����� ���� ���� ����','krm1234',to_date('20/06/22','RR/MM/DD'),'krm1234',to_date('20/06/24','RR/MM/DD'),'issuetype200','task-WMW-005',null,null);
Insert into PROJECT_ISSUES (ISSUE_CODE,ISSUE_NAME,ISSUE_DESCRIPTION,ISSUE_USER_ID,ISSUE_DATE,ISSUE_ACTION_ID,ISSUE_ACTION_DATE,ISSUE_TYPE_CODE,TASK_CODE,ISSUE_FILE_NAME,ISSUE_FILE_PATH) values ('issue-CSC-001','���� ����','������Ʈ ���� ���� ����','china1234',to_date('20/06/13','RR/MM/DD'),'china1234',to_date('20/06/14','RR/MM/DD'),'issuetype400','task-CSC-003',null,null);
Insert into PROJECT_ISSUES (ISSUE_CODE,ISSUE_NAME,ISSUE_DESCRIPTION,ISSUE_USER_ID,ISSUE_DATE,ISSUE_ACTION_ID,ISSUE_ACTION_DATE,ISSUE_TYPE_CODE,TASK_CODE,ISSUE_FILE_NAME,ISSUE_FILE_PATH) values ('issue-CSC-002','�߿� �ǻ���� ����','���ͱ��� ���� ����','china1234',to_date('20/06/24','RR/MM/DD'),'china1234',to_date('20/06/25','RR/MM/DD'),'issuetype200','task-CSC-006',null,null);
Insert into PROJECT_ISSUES (ISSUE_CODE,ISSUE_NAME,ISSUE_DESCRIPTION,ISSUE_USER_ID,ISSUE_DATE,ISSUE_ACTION_ID,ISSUE_ACTION_DATE,ISSUE_TYPE_CODE,TASK_CODE,ISSUE_FILE_NAME,ISSUE_FILE_PATH) values ('issue-CSC-003','����ũ �ľ� ����','����ũ ���� �ľ� ����','china1234',to_date('20/06/28','RR/MM/DD'),'china1234',to_date('20/06/30','RR/MM/DD'),'issuetype200','task-CSC-007',null,null);
Insert into PROJECT_ISSUES (ISSUE_CODE,ISSUE_NAME,ISSUE_DESCRIPTION,ISSUE_USER_ID,ISSUE_DATE,ISSUE_ACTION_ID,ISSUE_ACTION_DATE,ISSUE_TYPE_CODE,TASK_CODE,ISSUE_FILE_NAME,ISSUE_FILE_PATH) values ('issue-LFA-001','���⹰ �ۼ� ����','�ּ� ��� ��ǰ(MVP) �ۼ� ����','jango1234',to_date('20/06/23','RR/MM/DD'),'jango1234',to_date('20/06/25','RR/MM/DD'),'issuetype200','task-LFA-005',null,null);
Insert into PROJECT_ISSUES (ISSUE_CODE,ISSUE_NAME,ISSUE_DESCRIPTION,ISSUE_USER_ID,ISSUE_DATE,ISSUE_ACTION_ID,ISSUE_ACTION_DATE,ISSUE_TYPE_CODE,TASK_CODE,ISSUE_FILE_NAME,ISSUE_FILE_PATH) values ('issue-WAP-001','��� �߰�','Ŭ���̾�Ʈ ��û���� ���� ��� �߰�','admin1234',to_date('20/06/17','RR/MM/DD'),'admin1234',to_date('20/06/18','RR/MM/DD'),'issuetype100','task-WAP-001',null,null);
Insert into PROJECT_ISSUES (ISSUE_CODE,ISSUE_NAME,ISSUE_DESCRIPTION,ISSUE_USER_ID,ISSUE_DATE,ISSUE_ACTION_ID,ISSUE_ACTION_DATE,ISSUE_TYPE_CODE,TASK_CODE,ISSUE_FILE_NAME,ISSUE_FILE_PATH) values ('issue-WAP-002','���̾������� ����','Ŭ���̾�Ʈ ��û���� ���� ����','admin1234',to_date('20/06/22','RR/MM/DD'),'admin1234',to_date('20/06/24','RR/MM/DD'),'issuetype100','task-WAP-003',null,null);
Insert into PROJECT_ISSUES (ISSUE_CODE,ISSUE_NAME,ISSUE_DESCRIPTION,ISSUE_USER_ID,ISSUE_DATE,ISSUE_ACTION_ID,ISSUE_ACTION_DATE,ISSUE_TYPE_CODE,TASK_CODE,ISSUE_FILE_NAME,ISSUE_FILE_PATH) values ('issue-WAP-003','��Ȯ�� RnR ����','�� ���Ұ� å�� ������ ���� ����','admin1234',to_date('20/06/23','RR/MM/DD'),'admin1234',to_date('20/06/24','RR/MM/DD'),'issuetype400','task-WAP-004',null,null);
REM INSERTING into PROJECT_TASKS
SET DEFINE OFF;
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-TWS-002','���̵�� ������ ���μ��� Ȯ��',to_date('20/06/25','RR/MM/DD'),to_date('20/06/29','RR/MM/DD'),'���̵�� ������ ���μ��� Ȯ��','G-TWS-001','taskstatus100');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-TWS-003','���̵�� ����',to_date('20/06/30','RR/MM/DD'),to_date('20/07/06','RR/MM/DD'),'���̵�� ����','G-TWS-001','taskstatus300');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-TWS-004','���̵�� ��üȭ �� ����',to_date('20/07/07','RR/MM/DD'),to_date('20/07/15','RR/MM/DD'),'���̵�� ��üȭ �� ����','G-TWS-001','taskstatus300');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-TWS-005','���� ���� ���� �Ϸ�',to_date('20/07/16','RR/MM/DD'),to_date('20/07/20','RR/MM/DD'),'���� ���� ���� �Ϸ�','G-TWS-001','taskstatus300');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-VAD-001','ȸ�� ���� ��� ���μ��� Ȯ��',to_date('20/06/19','RR/MM/DD'),to_date('20/06/22','RR/MM/DD'),'ȸ�� ���� ��� ���μ��� Ȯ��','G-VAD-001','taskstatus200');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-VAD-002','��� ���, ���� ���μ��� �� �ñ� ��ȹ',to_date('20/06/23','RR/MM/DD'),to_date('20/06/25','RR/MM/DD'),'��� ���, ���� ���μ��� �� �ñ� ��ȹ','G-VAD-001','taskstatus100');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-VAD-003','��� ��ȹ �����',to_date('20/06/26','RR/MM/DD'),to_date('20/06/30','RR/MM/DD'),'��� ��ȹ �����','G-VAD-001','taskstatus100');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-VAD-004','���� ���� ��� Ȯ��',to_date('20/07/01','RR/MM/DD'),to_date('20/07/06','RR/MM/DD'),'���� ���� ��� Ȯ��','G-VAD-001','taskstatus300');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-VAD-005','���� ���� ����',to_date('20/07/07','RR/MM/DD'),to_date('20/07/13','RR/MM/DD'),'���� ���� ����','G-VAD-001','taskstatus300');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-VAD-006','���� ���� ��� �� ���� �Ϸ�',to_date('20/07/14','RR/MM/DD'),to_date('20/07/16','RR/MM/DD'),'���� ���� ��� �� ���� �Ϸ�','G-VAD-001','taskstatus300');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-FDA-001','���ø����̼� ���� �����',to_date('20/06/15','RR/MM/DD'),to_date('20/06/18','RR/MM/DD'),'���ø����̼� ���� �����','G-FDA-001','taskstatus200');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-FDA-002','���� ��� �� ����',to_date('20/06/19','RR/MM/DD'),to_date('20/06/22','RR/MM/DD'),'���� ��� �� ����','G-FDA-001','taskstatus200');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-FDA-003','���� ��� �� ����',to_date('20/06/23','RR/MM/DD'),to_date('20/06/25','RR/MM/DD'),'���� ��� �� ����','G-FDA-001','taskstatus200');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-FDA-004','���� ���� �� ����',to_date('20/06/26','RR/MM/DD'),to_date('20/06/30','RR/MM/DD'),'���� ���� �� ����','G-FDA-001','taskstatus100');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-FDA-005','���ø����̼� ���� �Ϸ�',to_date('20/07/01','RR/MM/DD'),to_date('20/07/03','RR/MM/DD'),'���ø����̼� ���� �Ϸ�','G-FDA-001','taskstatus300');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-RPM-001','������ �ʿ��� �ý��� �䱸���� ����',to_date('20/06/12','RR/MM/DD'),to_date('20/06/16','RR/MM/DD'),'������ �ʿ��� �ý��� �䱸���� ����','G-RPM-001','taskstatus200');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-RPM-002','Ŭ���̾�Ʈ�� ���� ��ȹ',to_date('20/06/17','RR/MM/DD'),to_date('20/06/22','RR/MM/DD'),'Ŭ���̾�Ʈ�� ���� ��ȹ','G-RPM-001','taskstatus200');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-RPM-003','���� �� ȯ�� ���� ���� ����',to_date('20/06/23','RR/MM/DD'),to_date('20/06/25','RR/MM/DD'),'���� �� ȯ�� ���� ���� ����','G-RPM-001','taskstatus200');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-RPM-004','������ ����� ���� ��ȹ',to_date('20/06/26','RR/MM/DD'),to_date('20/06/29','RR/MM/DD'),'������ ����� ���� ��ȹ','G-RPM-001','taskstatus100');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-RPM-005','������ ���� ��ȹ �ۼ�',to_date('20/06/30','RR/MM/DD'),to_date('20/07/02','RR/MM/DD'),'������ ���� ��ȹ �ۼ�','G-RPM-001','taskstatus300');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-RPM-006','������ ȯ�� �غ� �Ϸ�',to_date('20/07/03','RR/MM/DD'),to_date('20/07/04','RR/MM/DD'),'������ ȯ�� �غ� �Ϸ�','G-RPM-001','taskstatus300');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-WMW-001','��� ȯ�� ����',to_date('20/06/09','RR/MM/DD'),to_date('20/06/10','RR/MM/DD'),'��� ȯ�� ����','G-WMW-001','taskstatus200');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-WMW-002','���� �������� ȣȯ�� ��Ȱ��ȭ',to_date('20/06/11','RR/MM/DD'),to_date('20/06/12','RR/MM/DD'),'���� �������� ȣȯ�� ��Ȱ��ȭ','G-WMW-001','taskstatus200');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-WMW-003','���� ���� Ȯ��',to_date('20/06/13','RR/MM/DD'),to_date('20/06/16','RR/MM/DD'),'���� ���� Ȯ��','G-WMW-001','taskstatus200');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-WMW-004','���� ��������',to_date('20/06/17','RR/MM/DD'),to_date('20/06/21','RR/MM/DD'),'���� ��������','G-WMW-001','taskstatus100');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-WMW-005','��� ���� �� ���� �غ� �Ϸ�',to_date('20/06/22','RR/MM/DD'),to_date('20/06/23','RR/MM/DD'),'��� ���� �� ���� �غ� �Ϸ�','G-WMW-001','taskstatus300');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-HAD-001','ȿ���� ��',to_date('20/06/15','RR/MM/DD'),to_date('20/06/17','RR/MM/DD'),'ȿ���� ��','G-HAD-001','taskstatus200');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-HAD-002','������ �� �ǰ� ����',to_date('20/06/18','RR/MM/DD'),to_date('20/06/22','RR/MM/DD'),'������ �� �ǰ� ����','G-HAD-001','taskstatus200');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-HAD-003','���� �м� ����',to_date('20/06/23','RR/MM/DD'),to_date('20/06/25','RR/MM/DD'),'���� �м� ����','G-HAD-001','taskstatus200');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-HAD-004','���� ô�� ����',to_date('20/06/26','RR/MM/DD'),to_date('20/06/29','RR/MM/DD'),'���� ô�� ����','G-HAD-001','taskstatus100');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-HAD-005','�м� �� ���� �Ϸ�',to_date('20/06/30','RR/MM/DD'),to_date('20/07/02','RR/MM/DD'),'�м� �� ���� �Ϸ�','G-HAD-001','taskstatus300');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-CSC-001','SWOT �м� �Ϸ�',to_date('20/06/04','RR/MM/DD'),to_date('20/06/08','RR/MM/DD'),'SWOT �м� �Ϸ�','G-CSC-001','taskstatus200');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-CSC-002','��� �� ����',to_date('20/06/09','RR/MM/DD'),to_date('20/06/11','RR/MM/DD'),'��� �� ����','G-CSC-001','taskstatus200');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-CSC-003','ȸ�� ���� ��ǥ ��',to_date('20/06/12','RR/MM/DD'),to_date('20/06/15','RR/MM/DD'),'ȸ�� ���� ��ǥ ��','G-CSC-001','taskstatus200');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-CSC-004','��ǰ �� ���� ���� ����',to_date('20/06/16','RR/MM/DD'),to_date('20/06/18','RR/MM/DD'),'��ǰ �� ���� ���� ����','G-CSC-001','taskstatus200');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-CSC-005','��� ���� ���� ���� �Ϸ�',to_date('20/06/19','RR/MM/DD'),to_date('20/06/22','RR/MM/DD'),'��� ���� ���� ���� �Ϸ�','G-CSC-001','taskstatus200');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-CSC-006','�/���ͱ��� ����',to_date('20/06/23','RR/MM/DD'),to_date('20/06/24','RR/MM/DD'),'�/���ͱ��� ����','G-CSC-002','taskstatus100');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-CSC-007','����ũ ���� �ľ�',to_date('20/06/25','RR/MM/DD'),to_date('20/06/29','RR/MM/DD'),'����ũ ���� �ľ�','G-CSC-002','taskstatus100');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-CSC-008','����Ȯ�� ��� ����',to_date('20/06/30','RR/MM/DD'),to_date('20/07/01','RR/MM/DD'),'����Ȯ�� ��� ����','G-CSC-002','taskstatus300');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-CSC-009','����Ͻ� �� ���� �Ϸ�',to_date('20/07/02','RR/MM/DD'),to_date('20/07/03','RR/MM/DD'),'����Ͻ� �� ���� �Ϸ�','G-CSC-002','taskstatus300');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-LFA-001','���̵���� ��üȭ �� ��ȹ ����',to_date('20/06/11','RR/MM/DD'),to_date('20/06/12','RR/MM/DD'),'���̵���� ��üȭ �� ��ȹ ����','G-LFA-001','taskstatus200');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-LFA-002','���� �� �� �м�',to_date('20/06/13','RR/MM/DD'),to_date('20/06/15','RR/MM/DD'),'���� �� �� �м�','G-LFA-001','taskstatus200');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-LFA-003','��ǥ ����� �м� �� ����',to_date('20/06/16','RR/MM/DD'),to_date('20/06/18','RR/MM/DD'),'��ǥ ����� �м� �� ����','G-LFA-001','taskstatus200');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-LFA-004','�� ���� â��',to_date('20/06/19','RR/MM/DD'),to_date('20/06/23','RR/MM/DD'),'�� ���� â��','G-LFA-001','taskstatus200');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-LFA-005','MVP����',to_date('20/06/24','RR/MM/DD'),to_date('20/06/25','RR/MM/DD'),'MVP����','G-LFA-001','taskstatus100');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-LFA-006','���� ���� �Ϸ�',to_date('20/06/26','RR/MM/DD'),to_date('20/06/27','RR/MM/DD'),'���� ���� �Ϸ�','G-LFA-001','taskstatus100');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-LFA-007','���� ���� ��ȹ ����',to_date('20/06/28','RR/MM/DD'),to_date('20/06/30','RR/MM/DD'),'���� ���� ��ȹ ����','G-LFA-002','taskstatus100');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-LFA-008','����',to_date('20/07/01','RR/MM/DD'),to_date('20/07/17','RR/MM/DD'),'����','G-LFA-002','taskstatus100');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-LFA-009','��� �׽�Ʈ',to_date('20/07/18','RR/MM/DD'),to_date('20/07/19','RR/MM/DD'),'��� �׽�Ʈ','G-LFA-002','taskstatus300');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-LFA-010','���� �׽�Ʈ',to_date('20/07/20','RR/MM/DD'),to_date('20/07/21','RR/MM/DD'),'���� �׽�Ʈ','G-LFA-002','taskstatus300');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-LFA-011','�������̽� �׽�Ʈ',to_date('20/07/22','RR/MM/DD'),to_date('20/07/23','RR/MM/DD'),'�������̽� �׽�Ʈ','G-LFA-002','taskstatus300');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-LFA-012','��뼺 �� ����� ���� �׽�Ʈ',to_date('20/07/24','RR/MM/DD'),to_date('20/07/27','RR/MM/DD'),'��뼺 �� ����� ���� �׽�Ʈ','G-LFA-002','taskstatus300');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-LFA-013','���� �׽�Ʈ ��� ����',to_date('20/07/28','RR/MM/DD'),to_date('20/07/29','RR/MM/DD'),'���� �׽�Ʈ ��� ����','G-LFA-002','taskstatus300');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-LFA-014','���� �� �׽�Ʈ �Ϸ�',to_date('20/07/30','RR/MM/DD'),to_date('20/07/31','RR/MM/DD'),'���� �� �׽�Ʈ �Ϸ�','G-LFA-002','taskstatus300');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-WAP-001','��� ����Ʈ ����',to_date('20/06/15','RR/MM/DD'),to_date('20/06/16','RR/MM/DD'),'��� ����Ʈ ����','G-WAP-001','taskstatus200');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-WAP-002','ȭ�� �÷ο� ��Ʈ �ۼ�',to_date('20/06/17','RR/MM/DD'),to_date('20/06/18','RR/MM/DD'),'ȭ�� �÷ο� ��Ʈ �ۼ�','G-WAP-001','taskstatus200');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-WAP-003','���̾������� �ۼ�',to_date('20/06/19','RR/MM/DD'),to_date('20/06/22','RR/MM/DD'),'���̾������� �ۼ�','G-WAP-001','taskstatus200');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-WAP-004','ȭ�� ��� ���� �� ����',to_date('20/06/23','RR/MM/DD'),to_date('20/06/25','RR/MM/DD'),'ȭ�� ��� ���� �� ����','G-WAP-001','taskstatus100');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-WAP-005','���� ��ȹ �Ϸ�',to_date('20/06/26','RR/MM/DD'),to_date('20/06/27','RR/MM/DD'),'���� ��ȹ �Ϸ�','G-WAP-001','taskstatus300');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-WAP-006','���� ��, ���� ���� ����',to_date('20/06/28','RR/MM/DD'),to_date('20/06/29','RR/MM/DD'),'���� ��, ���� ���� ����','G-WAP-002','taskstatus300');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-WAP-007','�⺻ Ŀ���� �׸� ����',to_date('20/06/30','RR/MM/DD'),to_date('20/07/01','RR/MM/DD'),'�⺻ Ŀ���� �׸� ����','G-WAP-002','taskstatus300');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-WAP-008','ȭ�� ������',to_date('20/07/02','RR/MM/DD'),to_date('20/07/06','RR/MM/DD'),'ȭ�� ������','G-WAP-002','taskstatus300');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-WAP-009','��ȹ �м� �� �ý��� ����',to_date('20/07/07','RR/MM/DD'),to_date('20/07/09','RR/MM/DD'),'��ȹ �м� �� �ý��� ����','G-WAP-002','taskstatus300');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-WAP-010','������ �� ���� �Ϸ�',to_date('20/07/10','RR/MM/DD'),to_date('20/07/11','RR/MM/DD'),'������ �� ���� �Ϸ�','G-WAP-002','taskstatus300');
Insert into PROJECT_TASKS (TASK_CODE,TASK_NAME,TASK_START,TASK_FINISH,TASK_DESCRIPTION,TASKGROUP_CODE,TASK_STATUS_CODE) values ('task-TWS-001','�ý��� �м�01',to_date('20/06/28','RR/MM/DD'),to_date('20/06/30','RR/MM/DD'),'�ý��� �м�01-01','G-TWS-001','taskstatus100');
REM INSERTING into PROJECT_TASK_GROUPS
SET DEFINE OFF;
Insert into PROJECT_TASK_GROUPS (TASKGROUP_CODE,TASKGROUP_NAME,TASKGROUP_DESCRIPTION,PROJECT_CODE) values ('G-WMW-001','��� ���� �� ���� �غ�','AWS ���� �� ��Ÿ ���� ��������','200609-WMW');
Insert into PROJECT_TASK_GROUPS (TASKGROUP_CODE,TASKGROUP_NAME,TASKGROUP_DESCRIPTION,PROJECT_CODE) values ('G-HAD-001','�м� �� ����','���� ���� �� �ٽ� ��ġ �м�','200615-HAD');
Insert into PROJECT_TASK_GROUPS (TASKGROUP_CODE,TASKGROUP_NAME,TASKGROUP_DESCRIPTION,PROJECT_CODE) values ('G-CSC-001','��� ���� ���� ����','��� ���� ���� ����','200604-CSC');
Insert into PROJECT_TASK_GROUPS (TASKGROUP_CODE,TASKGROUP_NAME,TASKGROUP_DESCRIPTION,PROJECT_CODE) values ('G-CSC-002','����Ͻ� �� ����','����Ͻ� �� ����','200604-CSC');
Insert into PROJECT_TASK_GROUPS (TASKGROUP_CODE,TASKGROUP_NAME,TASKGROUP_DESCRIPTION,PROJECT_CODE) values ('G-LFA-001','���� ���� ����','������Ʈ ���� ���ɼ� ����/��ȹ ����','200604-LFA');
Insert into PROJECT_TASK_GROUPS (TASKGROUP_CODE,TASKGROUP_NAME,TASKGROUP_DESCRIPTION,PROJECT_CODE) values ('G-LFA-002','���� �� �׽�Ʈ','�ܰ躰 �۾� �� ���μ���','200604-LFA');
Insert into PROJECT_TASK_GROUPS (TASKGROUP_CODE,TASKGROUP_NAME,TASKGROUP_DESCRIPTION,PROJECT_CODE) values ('G-WAP-001','���� ��ȹ','���̵�� ��üȭ �� �ֿ� UI����','200615-WAP');
Insert into PROJECT_TASK_GROUPS (TASKGROUP_CODE,TASKGROUP_NAME,TASKGROUP_DESCRIPTION,PROJECT_CODE) values ('G-WAP-002','������ �� ����','�׸� ���� �� ȭ�� ������','200615-WAP');
Insert into PROJECT_TASK_GROUPS (TASKGROUP_CODE,TASKGROUP_NAME,TASKGROUP_DESCRIPTION,PROJECT_CODE) values ('G-FDA-001','����/���� ��� �� �м�','���� Ȯ��/����� ���� �� ��� �� �м�','200615-FDA');
Insert into PROJECT_TASK_GROUPS (TASKGROUP_CODE,TASKGROUP_NAME,TASKGROUP_DESCRIPTION,PROJECT_CODE) values ('G-RPM-001','������ ȯ�� �غ�','������/���׷��̵� ȯ�� �غ�','200612-RPM');
Insert into PROJECT_TASK_GROUPS (TASKGROUP_CODE,TASKGROUP_NAME,TASKGROUP_DESCRIPTION,PROJECT_CODE) values ('G-TWS-001','�ý��� �м�','�ý��� �м��� ���� �׷�','200621-TWS');
Insert into PROJECT_TASK_GROUPS (TASKGROUP_CODE,TASKGROUP_NAME,TASKGROUP_DESCRIPTION,PROJECT_CODE) values ('G-TWS-002','�ý��� ����','�ý��� ���迡 ���� �׷�','200621-TWS');
Insert into PROJECT_TASK_GROUPS (TASKGROUP_CODE,TASKGROUP_NAME,TASKGROUP_DESCRIPTION,PROJECT_CODE) values ('G-VAD-001','�䱸���� �м�','�䱸���� �м��� ���� �׷�','200619-VAD');
Insert into PROJECT_TASK_GROUPS (TASKGROUP_CODE,TASKGROUP_NAME,TASKGROUP_DESCRIPTION,PROJECT_CODE) values ('G-VAD-002','�䱸���� ��','�䱸���� ���� ���� �׷�','200619-VAD');
REM INSERTING into TEAMS
SET DEFINE OFF;
Insert into TEAMS (TEAM_CODE,TEAM_NAME,TEAM_UPPER,TEAM_SEQ,TEAM_USE) values (1,'����1��',null,1,'Y');
Insert into TEAMS (TEAM_CODE,TEAM_NAME,TEAM_UPPER,TEAM_SEQ,TEAM_USE) values (2,'����2��',null,2,'Y');
Insert into TEAMS (TEAM_CODE,TEAM_NAME,TEAM_UPPER,TEAM_SEQ,TEAM_USE) values (3,'UI��','����1��',1,'Y');
Insert into TEAMS (TEAM_CODE,TEAM_NAME,TEAM_UPPER,TEAM_SEQ,TEAM_USE) values (4,'DB��','����1��',2,'Y');
Insert into TEAMS (TEAM_CODE,TEAM_NAME,TEAM_UPPER,TEAM_SEQ,TEAM_USE) values (5,'������','����1��',3,'N');
REM INSERTING into USERS
SET DEFINE OFF;
Insert into USERS (USER_ID,USER_PW,USER_NAME,USER_EMAIL,USER_PHONE,USER_REGITDATE,TEAM_CODE,POSITION_CODE) values ('user001','1234','����','user001@bitcom.kr','010-1111-2222',to_timestamp('20/06/02 17:19:46.000000000','RR/MM/DD HH24:MI:SSXFF'),1,5);
Insert into USERS (USER_ID,USER_PW,USER_NAME,USER_EMAIL,USER_PHONE,USER_REGITDATE,TEAM_CODE,POSITION_CODE) values ('user002','1234','�̴븮','user002@bitcom.kr','010-2222-3333',to_timestamp('20/06/02 17:20:00.000000000','RR/MM/DD HH24:MI:SSXFF'),2,4);
Insert into USERS (USER_ID,USER_PW,USER_NAME,USER_EMAIL,USER_PHONE,USER_REGITDATE,TEAM_CODE,POSITION_CODE) values ('user003','1234','������','user003@bitcom.kr','010-4444-5555',to_timestamp('20/06/02 17:20:00.000000000','RR/MM/DD HH24:MI:SSXFF'),3,2);
Insert into USERS (USER_ID,USER_PW,USER_NAME,USER_EMAIL,USER_PHONE,USER_REGITDATE,TEAM_CODE,POSITION_CODE) values ('user004','1234','�����','user004@bitcom.kr','010-6666-7777',to_timestamp('20/06/02 17:20:00.000000000','RR/MM/DD HH24:MI:SSXFF'),3,1);
REM INSERTING into ACTION_FILES
SET DEFINE OFF;
REM INSERTING into APPROVAL
SET DEFINE OFF;
REM INSERTING into APPROVALDOC
SET DEFINE OFF;
REM INSERTING into APPROVALFILE
SET DEFINE OFF;
REM INSERTING into APPROVALFORM
SET DEFINE OFF;
REM INSERTING into APPROVALPATH
SET DEFINE OFF;
REM INSERTING into APPROVALREFERRER
SET DEFINE OFF;
REM INSERTING into CHATROOMS
SET DEFINE OFF;
REM INSERTING into DUTYS
SET DEFINE OFF;
Insert into DUTYS (DUTY_CODE,DUTY_NAME) values ('duty100','PMO');
Insert into DUTYS (DUTY_CODE,DUTY_NAME) values ('duty200','PM');
Insert into DUTYS (DUTY_CODE,DUTY_NAME) values ('duty300','manager');
Insert into DUTYS (DUTY_CODE,DUTY_NAME) values ('duty400','developer');
REM INSERTING into EVENTS
SET DEFINE OFF;
REM INSERTING into EVENT_GROUPS
SET DEFINE OFF;
REM INSERTING into EVENT_TYPES
SET DEFINE OFF;
REM INSERTING into MESSAGES
SET DEFINE OFF;
REM INSERTING into NOTES
SET DEFINE OFF;
REM INSERTING into PARTICIPATIONS
SET DEFINE OFF;
REM INSERTING into PROJECTS
SET DEFINE OFF;
Insert into PROJECTS (PROJECT_CODE,PROJECT_NAME,PROJECT_SUBNAME,PROJECT_START,PROJECT_FINISH,PROJECT_PM,PROJECT_TYPECODE,PROJECT_PMO,PROJECT_DESCRIPTION,PROJECT_PRIORITY,PROJECT_STATUSCODE) values ('200621-TWS','�ַ�� ��� ���� �÷��� �� ���� ����','TWS',to_date('20/06/21','RR/MM/DD'),to_date('20/08/21','RR/MM/DD'),'lcy0815','devtype200',null,null,null,'projstatus100');
Insert into PROJECTS (PROJECT_CODE,PROJECT_NAME,PROJECT_SUBNAME,PROJECT_START,PROJECT_FINISH,PROJECT_PM,PROJECT_TYPECODE,PROJECT_PMO,PROJECT_DESCRIPTION,PROJECT_PRIORITY,PROJECT_STATUSCODE) values ('200619-VAD','������ ��� Vision �˰��� ����','VAD',to_date('20/06/19','RR/MM/DD'),to_date('20/12/19','RR/MM/DD'),'khj0623','devtype100',null,null,null,'projstatus100');
Insert into PROJECTS (PROJECT_CODE,PROJECT_NAME,PROJECT_SUBNAME,PROJECT_START,PROJECT_FINISH,PROJECT_PM,PROJECT_TYPECODE,PROJECT_PMO,PROJECT_DESCRIPTION,PROJECT_PRIORITY,PROJECT_STATUSCODE) values ('200615-FDA','���� ��ü ���� ��� ����Ƽ�� APP ����','FDA',to_date('20/06/15','RR/MM/DD'),to_date('20/08/05','RR/MM/DD'),'ljy0925','devtype200',null,null,null,'projstatus100');
Insert into PROJECTS (PROJECT_CODE,PROJECT_NAME,PROJECT_SUBNAME,PROJECT_START,PROJECT_FINISH,PROJECT_PM,PROJECT_TYPECODE,PROJECT_PMO,PROJECT_DESCRIPTION,PROJECT_PRIORITY,PROJECT_STATUSCODE) values ('200612-RPM','React Native ��� ��Ʈ������ ���� �� ���� ������','RPM',to_date('20/06/12','RR/MM/DD'),to_date('20/09/12','RR/MM/DD'),'jsg1234','devtype500',null,null,null,'projstatus300');
Insert into PROJECTS (PROJECT_CODE,PROJECT_NAME,PROJECT_SUBNAME,PROJECT_START,PROJECT_FINISH,PROJECT_PM,PROJECT_TYPECODE,PROJECT_PMO,PROJECT_DESCRIPTION,PROJECT_PRIORITY,PROJECT_STATUSCODE) values ('200609-WMW','���������� ��� �̵�� Ȩ������ ������ �� ���� ������','WMW',to_date('20/06/09','RR/MM/DD'),to_date('20/07/09','RR/MM/DD'),'krm1234','devtype500',null,null,null,'projstatus100');
Insert into PROJECTS (PROJECT_CODE,PROJECT_NAME,PROJECT_SUBNAME,PROJECT_START,PROJECT_FINISH,PROJECT_PM,PROJECT_TYPECODE,PROJECT_PMO,PROJECT_DESCRIPTION,PROJECT_PRIORITY,PROJECT_STATUSCODE) values ('200615-HAD','�����ֿ� ���÷�� ��Ī ���̺긮�� ��/�� ������','HAD',to_date('20/06/15','RR/MM/DD'),to_date('20/08/15','RR/MM/DD'),'hjy1234','devtype300',null,null,null,'projstatus100');
Insert into PROJECTS (PROJECT_CODE,PROJECT_NAME,PROJECT_SUBNAME,PROJECT_START,PROJECT_FINISH,PROJECT_PM,PROJECT_TYPECODE,PROJECT_PMO,PROJECT_DESCRIPTION,PROJECT_PRIORITY,PROJECT_STATUSCODE) values ('200604-CSC','Java ��� ���� �߱� ����Ʈ�� ���� ����','CSC',to_date('20/06/04','RR/MM/DD'),to_date('21/01/04','RR/MM/DD'),'china1234','devtype200',null,null,null,'projstatus100');
Insert into PROJECTS (PROJECT_CODE,PROJECT_NAME,PROJECT_SUBNAME,PROJECT_START,PROJECT_FINISH,PROJECT_PM,PROJECT_TYPECODE,PROJECT_PMO,PROJECT_DESCRIPTION,PROJECT_PRIORITY,PROJECT_STATUSCODE) values ('200604-LFA','Django/React-Native ��� B2B2C ��������Ÿ�� ���̺긮�� �� ����','LFA',to_date('20/06/11','RR/MM/DD'),to_date('20/08/11','RR/MM/DD'),'jango1234','devtype200',null,null,null,'projstatus400');
Insert into PROJECTS (PROJECT_CODE,PROJECT_NAME,PROJECT_SUBNAME,PROJECT_START,PROJECT_FINISH,PROJECT_PM,PROJECT_TYPECODE,PROJECT_PMO,PROJECT_DESCRIPTION,PROJECT_PRIORITY,PROJECT_STATUSCODE) values ('200615-WAP','�� ��� ������ ������ ����','WAP',to_date('20/06/15','RR/MM/DD'),to_date('20/07/15','RR/MM/DD'),'admin1234','devtype200',null,null,null,'projstatus400');
REM INSERTING into PROJECT_ISSUE_TYPES
SET DEFINE OFF;
Insert into PROJECT_ISSUE_TYPES (ISSUE_TYPE_CODE,ISSUE_TYPE) values ('issuetype100','������');
Insert into PROJECT_ISSUE_TYPES (ISSUE_TYPE_CODE,ISSUE_TYPE) values ('issuetype200','��������');
Insert into PROJECT_ISSUE_TYPES (ISSUE_TYPE_CODE,ISSUE_TYPE) values ('issuetype300','ǰ������');
Insert into PROJECT_ISSUE_TYPES (ISSUE_TYPE_CODE,ISSUE_TYPE) values ('issuetype400','��Ÿ����');
REM INSERTING into PROJECT_MEMBERS
SET DEFINE OFF;
REM INSERTING into PROJECT_OUTPUTS
SET DEFINE OFF;
REM INSERTING into PROJECT_OUTPUT_TYPES
SET DEFINE OFF;
Insert into PROJECT_OUTPUT_TYPES (OUTPUT_TYPE_CODE,OUTPUT_TYPE) values ('R1','����� �䱸���� ���Ǽ�');
Insert into PROJECT_OUTPUT_TYPES (OUTPUT_TYPE_CODE,OUTPUT_TYPE) values ('R2','�������̽� ����');
Insert into PROJECT_OUTPUT_TYPES (OUTPUT_TYPE_CODE,OUTPUT_TYPE) values ('R3','�䱸���� ����ǥ');
Insert into PROJECT_OUTPUT_TYPES (OUTPUT_TYPE_CODE,OUTPUT_TYPE) values ('D1','Ŭ���� ���輭');
Insert into PROJECT_OUTPUT_TYPES (OUTPUT_TYPE_CODE,OUTPUT_TYPE) values ('D2','����� �������̽� ���輭');
Insert into PROJECT_OUTPUT_TYPES (OUTPUT_TYPE_CODE,OUTPUT_TYPE) values ('D3','������Ʈ ���輭');
Insert into PROJECT_OUTPUT_TYPES (OUTPUT_TYPE_CODE,OUTPUT_TYPE) values ('D4','�������̽� ���輭');
Insert into PROJECT_OUTPUT_TYPES (OUTPUT_TYPE_CODE,OUTPUT_TYPE) values ('D5','��Ű��ó ���輭');
Insert into PROJECT_OUTPUT_TYPES (OUTPUT_TYPE_CODE,OUTPUT_TYPE) values ('D6','�Ѱ����� ��ȹ��');
Insert into PROJECT_OUTPUT_TYPES (OUTPUT_TYPE_CODE,OUTPUT_TYPE) values ('D7','�ý��۽��� �ó�����');
Insert into PROJECT_OUTPUT_TYPES (OUTPUT_TYPE_CODE,OUTPUT_TYPE) values ('D8','��ƼƼ ���� ���� �����');
Insert into PROJECT_OUTPUT_TYPES (OUTPUT_TYPE_CODE,OUTPUT_TYPE) values ('D9','�����ͺ��̽� ���輭');
Insert into PROJECT_OUTPUT_TYPES (OUTPUT_TYPE_CODE,OUTPUT_TYPE) values ('D10','���ս��� �ó�����');
Insert into PROJECT_OUTPUT_TYPES (OUTPUT_TYPE_CODE,OUTPUT_TYPE) values ('D11','�������� ���̽�');
Insert into PROJECT_OUTPUT_TYPES (OUTPUT_TYPE_CODE,OUTPUT_TYPE) values ('D12','������ ��ȯ �� �ʱⵥ���� ���輭');
Insert into PROJECT_OUTPUT_TYPES (OUTPUT_TYPE_CODE,OUTPUT_TYPE) values ('I1','���α׷� �ڵ�');
Insert into PROJECT_OUTPUT_TYPES (OUTPUT_TYPE_CODE,OUTPUT_TYPE) values ('I2','�������� �����');
Insert into PROJECT_OUTPUT_TYPES (OUTPUT_TYPE_CODE,OUTPUT_TYPE) values ('I3','�����ͺ��̽� ���̺�');
Insert into PROJECT_OUTPUT_TYPES (OUTPUT_TYPE_CODE,OUTPUT_TYPE) values ('T1','���ս��� �����');
Insert into PROJECT_OUTPUT_TYPES (OUTPUT_TYPE_CODE,OUTPUT_TYPE) values ('T2','�ý��۽��� �����');
Insert into PROJECT_OUTPUT_TYPES (OUTPUT_TYPE_CODE,OUTPUT_TYPE) values ('T3','����� ��ħ��');
Insert into PROJECT_OUTPUT_TYPES (OUTPUT_TYPE_CODE,OUTPUT_TYPE) values ('T4','��� ��ħ��');
Insert into PROJECT_OUTPUT_TYPES (OUTPUT_TYPE_CODE,OUTPUT_TYPE) values ('T5','�ý��� ��ġ �����');
Insert into PROJECT_OUTPUT_TYPES (OUTPUT_TYPE_CODE,OUTPUT_TYPE) values ('T6','�μ����� �ó�����');
Insert into PROJECT_OUTPUT_TYPES (OUTPUT_TYPE_CODE,OUTPUT_TYPE) values ('T7','�μ����� �����');
REM INSERTING into PROJECT_STATUS
SET DEFINE OFF;
Insert into PROJECT_STATUS (PROJECT_STATUSCODE,PROJECT_STATUS) values ('projstatus100','������');
Insert into PROJECT_STATUS (PROJECT_STATUSCODE,PROJECT_STATUS) values ('projstatus200','�Ϸ�');
Insert into PROJECT_STATUS (PROJECT_STATUSCODE,PROJECT_STATUS) values ('projstatus300','�ߴ�');
Insert into PROJECT_STATUS (PROJECT_STATUSCODE,PROJECT_STATUS) values ('projstatus400','���࿹��');
REM INSERTING into PROJECT_TASK_MANAGERS
SET DEFINE OFF;
REM INSERTING into PROJECT_TASK_STATUS
SET DEFINE OFF;
Insert into PROJECT_TASK_STATUS (TASK_STATUS_CODE,TASK_STATUS) values ('taskstatus100','������');
Insert into PROJECT_TASK_STATUS (TASK_STATUS_CODE,TASK_STATUS) values ('taskstatus200','�Ϸ�');
Insert into PROJECT_TASK_STATUS (TASK_STATUS_CODE,TASK_STATUS) values ('taskstatus300','���');
REM INSERTING into PROJECT_TYPES
SET DEFINE OFF;
Insert into PROJECT_TYPES (PROJECT_TYPECODE,PROJECT_TYPE) values ('devtype100','����');
Insert into PROJECT_TYPES (PROJECT_TYPECODE,PROJECT_TYPE) values ('devtype200','����');
Insert into PROJECT_TYPES (PROJECT_TYPECODE,PROJECT_TYPE) values ('devtype300','������');
Insert into PROJECT_TYPES (PROJECT_TYPECODE,PROJECT_TYPE) values ('devtype400','ǰ��');
Insert into PROJECT_TYPES (PROJECT_TYPECODE,PROJECT_TYPE) values ('devtype500','��������');
--------------------------------------------------------
--  DDL for Index PK_POSITIONS
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_POSITIONS" ON "POSITIONS" ("POSITION_CODE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_PROJECT_ISSUES
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_PROJECT_ISSUES" ON "PROJECT_ISSUES" ("ISSUE_CODE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_PROJECT_TASKS
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_PROJECT_TASKS" ON "PROJECT_TASKS" ("TASK_CODE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_PROJECT_TASK_GROUPS
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_PROJECT_TASK_GROUPS" ON "PROJECT_TASK_GROUPS" ("TASKGROUP_CODE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_TEAMS
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_TEAMS" ON "TEAMS" ("TEAM_CODE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_USERS
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_USERS" ON "USERS" ("USER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table POSITIONS
--------------------------------------------------------

  ALTER TABLE "POSITIONS" ADD CONSTRAINT "PK_POSITIONS" PRIMARY KEY ("POSITION_CODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "POSITIONS" MODIFY ("POSITION_CODE" NOT NULL ENABLE);
 
  ALTER TABLE "POSITIONS" MODIFY ("POSITION_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PROJECT_ISSUES
--------------------------------------------------------

  ALTER TABLE "PROJECT_ISSUES" ADD CONSTRAINT "PK_PROJECT_ISSUES" PRIMARY KEY ("ISSUE_CODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "PROJECT_ISSUES" MODIFY ("ISSUE_CODE" NOT NULL ENABLE);
 
  ALTER TABLE "PROJECT_ISSUES" MODIFY ("ISSUE_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "PROJECT_ISSUES" MODIFY ("ISSUE_USER_ID" NOT NULL ENABLE);
 
  ALTER TABLE "PROJECT_ISSUES" MODIFY ("ISSUE_DATE" NOT NULL ENABLE);
 
  ALTER TABLE "PROJECT_ISSUES" MODIFY ("ISSUE_ACTION_ID" NOT NULL ENABLE);
 
  ALTER TABLE "PROJECT_ISSUES" MODIFY ("ISSUE_ACTION_DATE" NOT NULL ENABLE);
 
  ALTER TABLE "PROJECT_ISSUES" MODIFY ("ISSUE_TYPE_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PROJECT_TASKS
--------------------------------------------------------

  ALTER TABLE "PROJECT_TASKS" ADD CONSTRAINT "PK_PROJECT_TASKS" PRIMARY KEY ("TASK_CODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "PROJECT_TASKS" MODIFY ("TASK_CODE" NOT NULL ENABLE);
 
  ALTER TABLE "PROJECT_TASKS" MODIFY ("TASK_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "PROJECT_TASKS" MODIFY ("TASK_START" NOT NULL ENABLE);
 
  ALTER TABLE "PROJECT_TASKS" MODIFY ("TASK_FINISH" NOT NULL ENABLE);
 
  ALTER TABLE "PROJECT_TASKS" MODIFY ("TASKGROUP_CODE" NOT NULL ENABLE);
 
  ALTER TABLE "PROJECT_TASKS" MODIFY ("TASK_STATUS_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PROJECT_TASK_GROUPS
--------------------------------------------------------

  ALTER TABLE "PROJECT_TASK_GROUPS" ADD CONSTRAINT "PK_PROJECT_TASK_GROUPS" PRIMARY KEY ("TASKGROUP_CODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "PROJECT_TASK_GROUPS" MODIFY ("TASKGROUP_CODE" NOT NULL ENABLE);
 
  ALTER TABLE "PROJECT_TASK_GROUPS" MODIFY ("TASKGROUP_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "PROJECT_TASK_GROUPS" MODIFY ("TASKGROUP_DESCRIPTION" NOT NULL ENABLE);
 
  ALTER TABLE "PROJECT_TASK_GROUPS" MODIFY ("PROJECT_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TEAMS
--------------------------------------------------------

  ALTER TABLE "TEAMS" ADD CONSTRAINT "PK_TEAMS" PRIMARY KEY ("TEAM_CODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "TEAMS" MODIFY ("TEAM_CODE" NOT NULL ENABLE);
 
  ALTER TABLE "TEAMS" MODIFY ("TEAM_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "TEAMS" MODIFY ("TEAM_USE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table USERS
--------------------------------------------------------

  ALTER TABLE "USERS" ADD CONSTRAINT "PK_USERS" PRIMARY KEY ("USER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "USERS" MODIFY ("USER_ID" NOT NULL ENABLE);
 
  ALTER TABLE "USERS" MODIFY ("USER_PW" NOT NULL ENABLE);
 
  ALTER TABLE "USERS" MODIFY ("USER_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "USERS" MODIFY ("USER_EMAIL" NOT NULL ENABLE);
 
  ALTER TABLE "USERS" MODIFY ("USER_PHONE" NOT NULL ENABLE);
 
  ALTER TABLE "USERS" MODIFY ("TEAM_CODE" NOT NULL ENABLE);
 
  ALTER TABLE "USERS" MODIFY ("POSITION_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table PROJECT_ISSUES
--------------------------------------------------------

  ALTER TABLE "PROJECT_ISSUES" ADD CONSTRAINT "FK_PRJCT_IS_TPS_TO_PRJCT_IS" FOREIGN KEY ("ISSUE_TYPE_CODE")
	  REFERENCES "PROJECT_ISSUE_TYPES" ("ISSUE_TYPE_CODE") ENABLE;
 
  ALTER TABLE "PROJECT_ISSUES" ADD CONSTRAINT "FK_PRJCT_TASKS_TO_PRJCT_IS" FOREIGN KEY ("TASK_CODE")
	  REFERENCES "PROJECT_TASKS" ("TASK_CODE") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PROJECT_TASKS
--------------------------------------------------------

  ALTER TABLE "PROJECT_TASKS" ADD CONSTRAINT "FK_GRPS_TO_PRJCT_TSKS" FOREIGN KEY ("TASKGROUP_CODE")
	  REFERENCES "PROJECT_TASK_GROUPS" ("TASKGROUP_CODE") ENABLE;
 
  ALTER TABLE "PROJECT_TASKS" ADD CONSTRAINT "FK_PRJCT_STS_TO_PRJCT_TSKS" FOREIGN KEY ("TASK_STATUS_CODE")
	  REFERENCES "PROJECT_TASK_STATUS" ("TASK_STATUS_CODE") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PROJECT_TASK_GROUPS
--------------------------------------------------------

  ALTER TABLE "PROJECT_TASK_GROUPS" ADD CONSTRAINT "FK_PRJCTS_TO_PRJCT_TSK_GRPS" FOREIGN KEY ("PROJECT_CODE")
	  REFERENCES "PROJECTS" ("PROJECT_CODE") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table USERS
--------------------------------------------------------

  ALTER TABLE "USERS" ADD CONSTRAINT "FK_POSITIONS_TO_USERS" FOREIGN KEY ("POSITION_CODE")
	  REFERENCES "POSITIONS" ("POSITION_CODE") ENABLE;
 
  ALTER TABLE "USERS" ADD CONSTRAINT "FK_TEAMS_TO_USERS" FOREIGN KEY ("TEAM_CODE")
	  REFERENCES "TEAMS" ("TEAM_CODE") ENABLE;
