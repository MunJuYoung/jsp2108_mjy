show tables;

-- 상품 카테고리 테이블
CREATE TABLE category(
	idx						int not null auto_increment,
	main_name     varchar(20) not null,    /* 대분류 이름 */
	middle_name     varchar(20) not null,  /* 중분류 이름 */
	primary key(idx)
);

DESC category;
DROP TABLE category;

INSERT INTO category VALUES(default,'외투','재킷') ;
INSERT INTO category VALUES(default,'외투','점퍼') ;
INSERT INTO category VALUES(default,'외투','패딩') ;
INSERT INTO category VALUES(default,'외투','코트') ;
INSERT INTO category VALUES(default,'상의','반팔티') ;
INSERT INTO category VALUES(default,'상의','긴팔티') ;
INSERT INTO category VALUES(default,'상의','맨투맨') ;
INSERT INTO category VALUES(default,'상의','후드티') ;
INSERT INTO category VALUES(default,'하의','슬랙스') ;
INSERT INTO category VALUES(default,'하의','청바지') ;
INSERT INTO category VALUES(default,'하의','반바지') ;

SELECT * FROM category;

-- 상품 테이블
CREATE TABLE product(
	idx			int not null auto_increment,		 /* 상품 고유번호 */
	cate_idx  int not null,                  /* 카테고리 고유번호 */
	name 		varchar(50) not null,						 /* 상품이름 */
	primary key(idx),
	foreign key(cate_idx) references category(idx)
);

DROP TABLE product;

--상품 옵션 테이블
CREATE TABLE productOption(
	idx 			int not null auto_increment,   /* 상품옵션 고유번호 */
	product_idx	int not null,								 /* 상품 고유번호 */
	price		int not null,										 /* 가격 */
	color		varchar(20) not null,						 /* 색깔 */
	size		varchar(20) not null,            /* 사이즈 */
	cnts		int default 1, 									 /* 갯수 */
	photo	  varchar(100) not null default 'noimage.jpg',
	content varchar(200),                     /* 상품 설명 */
	primary key(idx),
	foreign key(product_idx) references product(idx) 
);

DROP TABLE productOption;

SELECT * FROM category;
SELECT * FROM product;
SELECT * FROM productOption;




CREATE TABLE ex( 
	id int not null,
	id1 int not null,
	primary key(id, id1)
);

CREATE TABLE ex2( 
	id2 int not null,
	id  int not null,
	id1 int not null,
	primary key(id2),
	foreign key(id,id1) references ex(id,id1)
);

DROP TABLE ex;
DROP TABLE ex2;

	main_idx			int not null,    			 	 /* 대분류 (100:외투, 200:상의, 300:하의) */
	middle_idx		int not null,						 /* 중분류 */
																				 /* 1 - (101:재킷 ,102:점퍼 ,103:패딩 ,104:코트 )*/
																				 /* 2 - (201:반팔티 ,202:긴팔티 ,203:맨투맨 ,204:후드티 )*/
																				 /* 3 - (301:슬랙스 ,302:청바지 ,303:반바지 )*/
	
INSERT INTO category VALUES(default,100,101,'외투','재킷') ;
INSERT INTO category VALUES(default,100,102,'외투','점퍼') ;
INSERT INTO category VALUES(default,100,103,'외투','패딩') ;
INSERT INTO category VALUES(default,100,104,'외투','코트') ;
INSERT INTO category VALUES(default,200,201,'상의','반팔티') ;
INSERT INTO category VALUES(default,200,202,'상의','긴팔티') ;
INSERT INTO category VALUES(default,200,203,'상의','맨투맨') ;
INSERT INTO category VALUES(default,200,204,'상의','후드티') ;
INSERT INTO category VALUES(default,300,301,'하의','슬랙스') ;
INSERT INTO category VALUES(default,300,302,'하의','청바지') ;
INSERT INTO category VALUES(default,300,303,'하의','반바지') ;