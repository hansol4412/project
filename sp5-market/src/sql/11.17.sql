drop table market.MEMBER;

create table market.MEMBER(
	id varchar(100) not null,
	password varchar(100) not null,
	name varchar(20) not null,
	gender varchar(4),
	birth varchar(10),
	email varchar(200),
	phone varchar(20),
	address varchar(200),
	regist_day datetime,
	primary key(id)
)engine=InnoDB character set =utf8;

insert into MEMBER(id, password, name, gender, birth, email, phone, address, regist_day)
values ('abc', '1234','가나다', '여', '1996-08-20', 'abc@naver.com', '010-1234-5678', '서울시 관악구', now());

select * from MEMBER;