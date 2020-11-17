select * from MEMBER;

insert into MEMBER(id, password, gender, birth, email, phone, address, regist_day)
values ('abc', '1234', '여', '19960820', 'abc@naver.com', '010-1234-5678', '서울시 관악구', now());

update Member set birth = '1996-08-20' where id = 'abc';