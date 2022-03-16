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
	memailcheck boolean comment '이메일 인증 여부',
	mpnum varchar(250) comment '전화번호',
	mjdate datetime not null default now() comment '가입일자',
	mretire char(2) not null default 'N' comment '탈퇴여부',
	mrdate datetime default Null comment '탈퇴일자',
	mhost char(2) default 'N' comment '관리자 여부'
);


create table board
(
	bno int primary key auto_increment comment '게시글 번호',
	mno int comment '회원 번호',
	btitle varchar(250) comment '제목',
	bkind varchar(3) comment '구분',
	bnote text comment '게시물 내용',
	bwdate datetime default now() comment '작성일',
	bhit int default 0 comment '조회수',
	FOREIGN KEY (mno) REFERENCES member (mno)
);

create table reply
(
	rno int primary key auto_increment comment '댓글번호',
	bno int comment '게시물 번호',
	mno int comment '회원 번호',
	rnote text comment '댓글 내용',
	rwdate datetime default now() comment '댓글 작성일',
	rdno int comment '대댓글 번호',
	FOREIGN KEY (bno) REFERENCES board (bno),
	FOREIGN KEY (mno) REFERENCES member (mno)
);

insert into member(mid,mpw,mname,memail,memailcheck,mpnum) values('lee1234',md5('12345'),'이순신','lee@gmail.com',false,'010-1234-5678');

insert into board(mno, btitle, bkind, bnote) values('1', '게시물 제목', 'F', '축제입니다.' );

insert into reply(rno, bno, mno, rnote, rdno) values('1', '1', '1', '댓글입니다.','1');
insert into reply(rno, bno, mno, rnote, rdno) values('2', '1', '2', '댓글입니다.','2');
insert into reply(rno, bno, mno, rnote, rdno) values('3', '1', '3', '댓글입니다.','3');

create table booking
(
	bkno int primary key auto_increment comment '예매 번호',
	mno int comment '회원 번호',
	bkdate datetime not null default now() comment '예매 일자',
	bkkind varchar(2) comment '구분',
	bkexpsc int comment '비싼 좌석 수',
	bkmiddsc int comment '중간 좌석 수',
	bkchesc int comment '저렴한 좌석 수',
	bkadultc int comment '성인 수',
	bkchildc int comment '어린이 수',
	bktotal varchar(250) comment '총 가격',
	bkcancle char(2) comment '취소여부',
	bkcdate datetime not null default now() comment '취소일자', 
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

create table bookmark
(
	bmno int primary key auto_increment comment '즐겨찾기 번호',
	mno int comment '회원 번호',
	cno int comment '문화글 번호',
	bmdate datetime not null default now() comment '저장 일자', 
	FOREIGN KEY (mno) REFERENCES member (mno),
	FOREIGN KEY (cno) REFERENCES culture (cno)
);

--- (add) FAQ table created 
drop table faq;
create table faq
(
	fno int primary key auto_increment,
	ftitle varchar(300),
	fnote text
);

insert into faq (ftitle,fnote) values 
('비밀번호를 잊어버렸어요.','로그인 페이지에 있는 “비밀번호 찾기”를 이용해 주십시오.');
insert into faq (ftitle,fnote) values 
('회원이 아니더라도 티켓 예매가 가능한가요?',
'비회원은 티켓 예매가 불가능합니다. 요기조기 사이트 회원으로 가입하신 후, 다양한 서비스를 제공받으실 수 있습니다.');
insert into faq (ftitle,fnote) values 
('로그인, 인터넷 예매 등 홈페이지 이용에 각종 오류가 발생합니다.',
'로그인, 인터넷 예매 등 홈페이지 이용에 각종 오류가 났을 경우엔
경영기획팀(00-0000-0000)으로 문의해 주시기 바랍니다.');

insert into faq (ftitle,fnote) values 
('티켓 예매 취소 후 환불은 어떻게 되나요?',
'입장권 환불 및 취소는 티켓 예매시 선택한 결제수단으로만 가능합니다.
- 신용카드 : 예매취소 3~5일 후 해당 카드사에서 승인 내역 취소
- 무통장입금 : 반드시 예매자 본인 명의의 계좌로만 환불 가능, 환불신청일로부터 영업일 기준 5일 이내 고객 지정계좌로 환불 조치.');
insert into faq (ftitle,fnote) values 
('예매한 티켓의 취소(환불)는 어떻게 하나요?',
'요기조기 사이트 회원으로 가입하신 후, 마이페이지에서 티켓 환불 신청을 클릭하면 환불 요청이 사이트 관리자에게 들어갑니다.
환불처리는 삼일 이내로 처리 됩니다. ');

insert into faq (ftitle,fnote) values 
('지난 공연, 전시, 행사 정보를 알고 싶습니다.',
'지난 공연, 전시, 행사 정보는 홈페이지 상단 검색창에 제목을 입력하시면 쉽고 빠르게 검색하실 수 있습니다.');
insert into faq (ftitle,fnote) values 
('예매버튼이 없는 전시/공연/축제는 무엇인가요?',
'예매버튼이 없는 전시/공연/축제는 준비중이거나, 티켓 없이 입장 가능한 행사입니다.');
insert into faq (ftitle,fnote) values 
('몇 세부터 관람 가능한가요?',
'공연 내용과 공연 단체 요청에 따라 관람 가능 연령이 나누어져 있습니다. 각 공연의 공연정보를 참고하시기 바랍니다.
당일은 티켓 교환, 환불이 불가능하오니 사전에 관람 가능 연령을 반드시 확인하시기 바랍니다.');






desc board;
desc booking;
desc bookmark;
desc culture;
desc member;
desc reply;



-- api 연습 --
create table api
(
	ano int primary key auto_increment,
	akind varchar(250),
	admfee varchar(250),
	age varchar(20),
	content TEXT,
	ETime varchar(250),
	endDay varchar(250),
	hostName varchar(250),
	mngTel varchar(250),
	orgNm varchar(250),
	place varchar(250),
	startDay varchar(250),
	subject varchar(250),
	url varchar(250)
);
