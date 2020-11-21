create user 'marketManager'@'localhost' identified by 'market';
grant all privileges on market.* to 'marketManager'@'localhost';

create table market.MEMBER(
	id varchar(100) not null,
	password varchar(100) not null,
	gender varchar(4),
	birth varchar(10),
	email varchar(200),
	phone varchar(20),
	address varchar(200),
	regist_day datetime,
	primary key(id)
)engine=InnoDB character set =utf8;

select * from MEMBER;


