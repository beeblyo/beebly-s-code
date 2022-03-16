drop database egodb;
create database egodb;
use egodb;

create table user
(
	u_no int primary key auto_increment comment '사용자 번호',
	u_id varchar(100) comment '아이디',
	u_email varchar(100) comment '이메일',
	u_nickname varchar(100) comment '닉네임',
	u_password varchar(100) comment '비밀번호',
	u_gender varchar(2) comment '성별',
	u_birthdate datetime comment '생년월일',
	u_mbti varchar(10) comment 'mbti',
	u_keyword text comment '키워드',
	u_joindate datetime default now() comment '가입일자',
	u_retire varchar(2) comment '탈퇴여부',
	u_retiredate datetime comment '탈퇴일자',
	u_host varchar(2) comment '권한'
);

create table profile
(
	p_no int primary key auto_increment comment '번호',	
	u_no int comment '사용자 번호',
	p_name varchar(255) comment '물리이름',
	f_name varchar(255) comment '논리이름',
	FOREIGN KEY (u_no) REFERENCES user (u_no)
);

create table search_record
(
	s_no int primary key auto_increment comment '검색 번호',
	u_no int comment '사용자 번호',
	s_recent varchar(255) comment '최근 검색어',
	s_date datetime default now() comment '검색일자',
	FOREIGN KEY (u_no) REFERENCES user (u_no)
);

create table board
(
	b_no int primary key auto_increment comment '작성글 번호',
	u_no int comment '사용자 번호',
	b_title varchar(300) comment '제목',
	b_date datetime default now() comment '작성일',
	b_note text comment '작성내용',
	b_kind varchar(2) comment '작성글 종류',
	b_ansnote text comment '답변내용',
	b_ansdate datetime comment '답변일자',
	FOREIGN KEY (u_no) REFERENCES user (u_no)
);

create table category
(
	cg_no int primary key auto_increment comment '카테고리 번호',
	cg_name varchar(200) comment '카테고리이름'
);

create table test
(
	t_no int primary key auto_increment comment '테스트번호',
	u_no int comment '사용자 번호',
	cg_no int comment '카테고리 번호',
	t_title varchar(300) comment '테스트 제목',
	t_rjoincount int default 0 comment '참여수',
	t_foldername varchar(200) comment '폴더명',
	t_hashtag text comment '해쉬태그',
	t_postdate datetime default now() comment '테스트 등록일',
	FOREIGN KEY (u_no) REFERENCES user (u_no),
	FOREIGN KEY (cg_no) REFERENCES category (cg_no)
);

create table comment
(
	c_no int primary key auto_increment comment '댓글 번호',
	t_no int comment '테스트 번호',
	u_no int comment '사용자 번호',
	cl_no int default 0 comment '대댓글번호',
	c_note text comment '내용',
	c_date datetime default now() comment '댓글작성일',
	FOREIGN KEY (t_no) REFERENCES test (t_no),
	FOREIGN KEY (u_no) REFERENCES user (u_no)
);

create table bookmark
(
	bm_no int primary key auto_increment comment '즐겨찾기 번호',
	t_no int comment '테스트 번호',
	u_no int comment '사용자 번호',
	bm_date datetime default now() comment '저장일자',
	FOREIGN KEY (t_no) REFERENCES test (t_no),
	FOREIGN KEY (u_no) REFERENCES user (u_no)
);

create table recommend
(
	r_no int primary key auto_increment comment '추천번호',
	t_no int comment '테스트 번호',
	u_no int comment '사용자 번호',
	r_date datetime default now() comment '추천일자',
	r_kind varchar(2) comment '추천종류',
	FOREIGN KEY (t_no) REFERENCES test (t_no),
	FOREIGN KEY (u_no) REFERENCES user (u_no)
);alter table comment add c_date datetime default now() comment '댓글작성일';

create table test_record
(
	t_rno int primary key auto_increment comment '테스트 기록번호',
	t_no int comment '테스트 번호',
	u_no int comment '사용자 번호',
	t_rdate datetime default now() comment '테스트 실행일자',
	FOREIGN KEY (t_no) REFERENCES test (t_no),
	FOREIGN KEY (u_no) REFERENCES user (u_no)
);

show tables;
desc user;
desc board;
desc bookmark;
desc category;
desc comment;
desc profile;
desc recommend;
desc search_record;
desc test;
desc test_record;

insert into user values('1','admin','','관리자',md5('1234'),'M','1996-12-04','','','2022-01-01','N',null,'Y');

/* 카테고리 미리 입력 */
insert into category (cg_name)
values
("심리 테스트"),
("연애 테스트"),
("공포 테스트"),
("닮은꼴 테스트");

/* 테스트 미리 입력 */
insert into test (u_no,cg_no,t_title,t_foldername,t_hashtag)
values
(8,1,"나만의 초능력 심리테스트","test01",""),
(8,2,"묻지마 심리테스트","test02",""),
(8,3,"리더쉽 심리테스트","test03",""),
(8,4,"여행으로 보는 관계 심리 테스트","test04",""),
(8,1,"영어로 보는 심리테스트","test05",""),
(8,2,"3초 심리테스트","test06",""),
(8,3,"시계타입 테스트","test07",""),
(8,2,"연애 심리테스트","test08",""),
(8,1,"색깔 심리 테스트","test09",""),
(8,2,"그림으로 보는 심리테스트","test10",""),
(8,1,"손모양으로 보는 심리테스트","test11",""),
(8,2,"색깔 심리테스트","test12",""),
(8,3,"변태성향 테스트","test13",""),
(8,2,"프로그래밍 테스트","test14",""),
(8,1,"계획성 테스트","test15",""),
(8,3,"그림 심리 테스트","test16",""),
(8,2,"실리콘밸리 테스트","test17",""),
(8,4,"교과목 테스트","test18",""),
(8,1,"십이지 테스트","test19","");

/* 공지사항 미리 입력 */
insert into board (u_no,b_title,b_note,b_kind)
values
(8,'공지사항 1입니다.','공지사항 1의 내용입니다.','N'),
(8,'공지사항 2입니다.','공지사항 2의 내용입니다.','N'),
(8,'공지사항 3입니다.','공지사항 3의 내용입니다.','N'),
(8,'공지사항 4입니다.','공지사항 4의 내용입니다.','N'),
(8,'공지사항 5입니다.','공지사항 5의 내용입니다.','N'),
(8,'공지사항 6입니다.','공지사항 6의 내용입니다.','N'),
(8,'공지사항 7입니다.','공지사항 7의 내용입니다.','N'),
(8,'공지사항 8입니다.','공지사항 8의 내용입니다.','N'),
(8,'공지사항 9입니다.','공지사항 9의 내용입니다.','N'),
(8,'공지사항 10입니다.','공지사항 10의 내용입니다.','N'),
(8,'공지사항 11입니다.','공지사항 11의 내용입니다.','N');

/*댓글 미리입력 */
insert into comment (t_no,u_no,c_note) values('20','1','안녕하세요');

/* 댓글 테이블 작성일자 컬럼 추가*/
alter table comment add c_date datetime default now() comment '댓글작성일';