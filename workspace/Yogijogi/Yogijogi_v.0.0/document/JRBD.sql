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
drop table booking;
create table booking
(
	bkno int primary key auto_increment comment '예매 번호',
	mno int comment '회원 번호',
	bkdate datetime not null default now() comment '예매 일자',
	bkkind varchar(2) comment '구분',
	bkexpsc int default 0 comment '비싼 좌석 수',
	bkmiddsc int default 0  comment '중간 좌석 수',
	bkchesc int default 0 comment '저렴한 좌석 수',
	bkadultc int default 0 comment '성인 수',
	bkchildc int default 0 comment '어린이 수',
	bktotal varchar(250) comment '총 가격',
	bkcancle char(2) default 'N' comment '취소여부',
	bkcdate datetime default null comment '취소일자', 
	bktime varchar(250) comment '시간대',
	FOREIGN KEY (mno) REFERENCES member (mno)
);

create table culture
(
	cno int primary key auto_increment comment '문화 번호',
	mno int comment '회원 번호',
	ckind char(3) comment '구분',
	ctitle varchar(250) comment '제목',
	instt_nm varchar(300) comment '주최기관',
	fstvlStartDate datetime not null default now() comment '시작일',
	fstvlEndDate datetime not null default now() comment '종료일',
	rdnmadr varchar(500) comment '도로명 주소',
	lnmadr varchar(500) comment '지번 주소',
	latitude varchar(100) comment '위도',
	longitude varchar(100) comment '경도',
	price int comment '금액',
	totalSeat int comment '총 좌석',
	remainSeat int comment '잔여 좌석',
	relateInfo text comment '관련 정보(소개)',
	phoneNumber varchar(50) comment '전화번호',
	homepageUrl varchar(300) comment '홈페이지 주소',
	cwdate datetime not null default now() comment '작성일',
	FOREIGN KEY (mno) REFERENCES member (mno)
);

create table board
(
	bno int primary key auto_increment comment '게시물 번호',
	mno int comment '회원 번호',
	bkind char(3) comment '구분',
	btitle varchar(250) comment '제목',
	bnote text comment '내용',
	bwdate datetime not null default now() comment '작성일', 
	bhit int comment '조회수',
	FOREIGN KEY (mno) REFERENCES member (mno)
);

create table reply
(
	rno int primary key auto_increment comment '댓글 번호',
	bno int comment '게시물 번호',
	mno int comment '회원 번호',
	rnote text comment '내용',
	rwdate datetime not null default now() comment '작성일', 
	rdno int comment '대댓글 번호',
	FOREIGN KEY (mno) REFERENCES member (mno),
	FOREIGN KEY (bno) REFERENCES board (bno)
);

create table bookmark
(
	bmno int primary key auto_increment comment '즐겨찾기 번호',
	mno int comment '회원 번호',
	cno int comment '문화글 번호',
	bmdate datetime not null default now() comment '저장 일자', 
	FOREIGN KEY (mno) REFERENCES member (mno),
	FOREIGN KEY (cno) REFERENCES culture (cno)
);

desc board;
desc booking;
desc bookmark;
desc culture;
desc member;
desc reply;