
drop table class_member;
DROP TABLE class_member CASCADE CONSTRAINTS PURGE;

CREATE TABLE class_member(
email varchar2(100) unique,
nickname varchar2(20), 
pw varchar2(20) not null,
job number(10) not null,
studentlevel number(10) default 0,
CONSTRAINT class_nickname_pk PRIMARY KEY (nickname));
   
delete from CLASS_MEMBER where email='22';

select * from class_member;


INSERT INTO CLASS_MEMBER (email, nickname, pw, job) VALUES(
   '22',
   '2',
   '2222',
   '2');
   
INSERT INTO CLASS_MEMBER (email, nickname, pw, job) VALUES(
   '11',
   '1',
   '1111',
   '1');

   
///////////////////////////////////////////
SELECT * FROM questions where nickname = 'student4';
SELECT question FROM questions;
drop table questions;

delete from questions where nickname='student4';

CREATE TABLE questions(
   nickname VARCHAR2(20),
   question VARCHAR2(3000)not null,
   classname VARCHAR2(100) not null,
   teacher VARCHAR2(100) not null,
   classdate VARCHAR2(100) not null,
   CONSTRAINT question_nickname_fk FOREIGN KEY (nickname)
   REFERENCES class_member(nickname));
   
select distinct question from questions;
select question, classname, teacher, classdate from questions;
select question, classname, teacher, classdate from questions where nickname = '2';
select distinct question from questions where nickname = '2';
insert into questions (nickname, question, classname, teacher,classdate) values(
   '2',
   '������ �Ķ���Ͱ� �����?test',
   '�ӽŷ���',
   '������',
   sysdate);

insert into questions (nickname, question, classname, teacher, classdate) values(
   'd',
   'test question',
   'test classname',
   'test teacher',
   sysdate);
   
insert into questions (nickname, question, classname, teacher, classdate, likes) values(
   '1',
   '�̷��� ������ �ϸ� �ǳ���?',
   '�����ͺ��̽�',
   '�赿��',
   sysdate,
   13
   );
////////////////////////////////////////
drop table keyword;

delete from keyword where classname='test';

CREATE TABLE keyword(
   nickname VARCHAR2(20),
   classname VARCHAR2(100),
   keyword  VARCHAR2(100));
    
insert into keyword (nickname, classname, keyword) values(
   '1',
   'test',
   '�߿䵵50');   

insert into keyword (nickname, classname, keyword) values(
   'd',
   'test student',
   'test student');
   
insert into keyword (nickname, classname, keyword) values(
   '1',
   'test teacher',
   'test teacher');

select * from keyword;
