drop database jrbddb;
create database jrbddb;
use jrbddb;

create table member
(
	mno int primary key auto_increment comment '회원 번호',
	mid varchar(250) comment '아이디',
	mpw varchar(250) comment '비밀번호',
	mname varchar(100) comment '이름',
	memail varchar(250) comment '이메일',
	mpnum varchar(250) comment '전화번호',
	mjdate datetime not null default now() comment '가입일자',
	mretire char(2) not null default 'N' comment '탈퇴여부',
	mrdate datetime default Null comment '탈퇴일자',
	mhost char(2) default 'N' comment '관리자 여부'
);

insert into member values('1','lee1234',md5('12345'),'이순신','lee@gmail.com','010-1234-5678','2022-02-08','N',null,'N');