show tables;

CREATE TABLE member (
	idx		int not null auto_increment,	/* 회원 고유번호 */
	mid		varchar(20)   not null,				/* 회원 아이디(중복불허) */
	pwd		varchar(100)		not null,				/* 비밀번호(입력시 12자로 제한) 암호화:SHA-256*/
	nickName  varchar(20) not null,			/* 별명(중복불허) */
	name			varchar(20) not null,			/* 성명 */
	gender    varchar(10) default '남자',/* 성별 */
	birthday	datetime		default now(),/* 생일 */
	tel				varchar(15),							/* 연락처 */
	address		varchar(50),							/* 주소 */
	email			varchar(50)	not null,			/* 이메일(아이디/비밀번호 분실시 필요) */
	job				varchar(20),							/* 직업 */
	hobby			varchar(60),							/* 취미 */
	photo			varchar(100) default 'noimage.jpg', 	/* 회원사진 */
	content   text,											/* 자기소개 */
	userInfor char(6) default '공개',		/* 회원 정보 공개여부(공개/비공개) */
	userDel		char(2) default 'NO',			/* 회원 탈퇴 신청 여부(OK:탈퇴신청한회원, NO:현재가입중인회원) */
	point     int default 100,					/* 포인트(최초가입회원은 100, 한번 방문시마다 10 */
	level			int default 1,						/* 1:준회원, 2:정회원, 3:우수회원 (4:운영자) 5:관리자 */
	visitCnt	int default 0,						/* 방문횟수 */
	startDate datetime default now(),		/* 최초 가입일 */
	lastDate  datetime default now(),		/* 마지막 접속일 */
	todayCnt  int default 0,						/* 오늘 방문한 횟수 */
	primary key(idx, mid)								/* 키본키 : 고유번호, 아이디 */
);

desc member;
DROP TABLE member;
SELECT * FROM member WHERE mid='hkd1234' and name='홍길동';

insert into member values (default,'admin','1234','관리맨','관리자'
	,default,default,'010-3423-2704','경기도 안성시','cjsk1126@naver.com',
	'프리랜서','등산/바둑',default,'관리자입니다.',
	default,default,default,0,default,default,default,default);
	
update member set tel='010/3423/2704', address='경기도 안성시/1/2/3' where mid = 'admin';
	
	
UPDATE member SET name = '홍길동' WHERE mid = 'hkd1234';
UPDATE member SET pwd = '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4' WHERE mid = 'admin';
UPDATE member SET level = 5 WHERE mid = 'admin';