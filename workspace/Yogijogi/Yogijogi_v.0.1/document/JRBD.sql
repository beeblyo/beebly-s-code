drop database jrbddb;
create database jrbddb;
use jrbddb;

create table member
(
	mno int primary key auto_increment comment 'ȸ�� ��ȣ',
	mid varchar(250) comment '���̵�',
	mpw varchar(250) comment '��й�ȣ',
	mname varchar(100) comment '�̸�',
	memail varchar(250) comment '�̸���',
	mpnum varchar(250) comment '��ȭ��ȣ',
	mjdate datetime not null default now() comment '��������',
	mretire char(2) not null default 'N' comment 'Ż�𿩺�',
	mrdate datetime default Null comment 'Ż������',
	mhost char(2) default 'N' comment '������ ����'
);

insert into member values('1','lee1234',md5('12345'),'�̼���','lee@gmail.com','010-1234-5678','2022-02-08','N',null,'N');