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
drop table booking;
create table booking
(
	bkno int primary key auto_increment comment '���� ��ȣ',
	mno int comment 'ȸ�� ��ȣ',
	bkdate datetime not null default now() comment '���� ����',
	bkkind varchar(2) comment '����',
	bkexpsc int default 0 comment '��� �¼� ��',
	bkmiddsc int default 0  comment '�߰� �¼� ��',
	bkchesc int default 0 comment '������ �¼� ��',
	bkadultc int default 0 comment '���� ��',
	bkchildc int default 0 comment '��� ��',
	bktotal varchar(250) comment '�� ����',
	bkcancle char(2) default 'N' comment '��ҿ���',
	bkcdate datetime default null comment '�������', 
	bktime varchar(250) comment '�ð���',
	FOREIGN KEY (mno) REFERENCES member (mno)
);

create table culture
(
	cno int primary key auto_increment comment '��ȭ ��ȣ',
	mno int comment 'ȸ�� ��ȣ',
	ckind char(3) comment '����',
	ctitle varchar(250) comment '����',
	instt_nm varchar(300) comment '���ֱ��',
	fstvlStartDate datetime not null default now() comment '������',
	fstvlEndDate datetime not null default now() comment '������',
	rdnmadr varchar(500) comment '���θ� �ּ�',
	lnmadr varchar(500) comment '���� �ּ�',
	latitude varchar(100) comment '����',
	longitude varchar(100) comment '�浵',
	price int comment '�ݾ�',
	totalSeat int comment '�� �¼�',
	remainSeat int comment '�ܿ� �¼�',
	relateInfo text comment '���� ����(�Ұ�)',
	phoneNumber varchar(50) comment '��ȭ��ȣ',
	homepageUrl varchar(300) comment 'Ȩ������ �ּ�',
	cwdate datetime not null default now() comment '�ۼ���',
	FOREIGN KEY (mno) REFERENCES member (mno)
);

create table board
(
	bno int primary key auto_increment comment '�Խù� ��ȣ',
	mno int comment 'ȸ�� ��ȣ',
	bkind char(3) comment '����',
	btitle varchar(250) comment '����',
	bnote text comment '����',
	bwdate datetime not null default now() comment '�ۼ���', 
	bhit int comment '��ȸ��',
	FOREIGN KEY (mno) REFERENCES member (mno)
);

create table reply
(
	rno int primary key auto_increment comment '��� ��ȣ',
	bno int comment '�Խù� ��ȣ',
	mno int comment 'ȸ�� ��ȣ',
	rnote text comment '����',
	rwdate datetime not null default now() comment '�ۼ���', 
	rdno int comment '���� ��ȣ',
	FOREIGN KEY (mno) REFERENCES member (mno),
	FOREIGN KEY (bno) REFERENCES board (bno)
);

create table bookmark
(
	bmno int primary key auto_increment comment '���ã�� ��ȣ',
	mno int comment 'ȸ�� ��ȣ',
	cno int comment '��ȭ�� ��ȣ',
	bmdate datetime not null default now() comment '���� ����', 
	FOREIGN KEY (mno) REFERENCES member (mno),
	FOREIGN KEY (cno) REFERENCES culture (cno)
);

desc board;
desc booking;
desc bookmark;
desc culture;
desc member;
desc reply;