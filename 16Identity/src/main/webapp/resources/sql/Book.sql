create table book(
      isbn varchar2(13) not null primary key, 
      b_title varchar2(50) not null, 
      b_thumbnail varchar2(100) not null, 
      b_content varchar2(2000) not null, 
      b_authors varchar2(20) not null, 
      mbti varchar2(4) default null,
      b_publisher varchar2(20) not null, 
      b_saleprice number(6) not null, 
      b_datetime date not null
)

insert into book values ('123456','굿','굿','ㅋ','ㅋ','istp','z','1',sysdate);
insert into book values ('123457','가나다라','가나다라','ㅋ','ㅋ','istp','z','1',sysdate);
insert into book values ('123458','아메리카노','아메리카노','ㅋ','ㅋ','istp','z','1',sysdate);
insert into book values ('123459','아이스베어','아메리카노','ㅋ','ㅋ','istp','z','1',sysdate);
insert into book values ('123460','케로로','아메리카노','ㅋ','ㅋ','istp','z','1',sysdate);
-- 완료1

ALTER TABLE book MODIFY(isbn VARCHAR(30));
insert into book values ('8996991341 9788996991342','이민지_test','아메리카노','ㅋ','ㅋ','istj','z','1',sysdate);


SELECT * FROM book;

ALTER TABLE book MODIFY(b_thumbnail VARCHAR(200));
ALTER TABLE book MODIFY(b_authors VARCHAR(100));

ALTER TABLE book MODIFY(b_publisher VARCHAR(40));

ALTER TABLE book ADD(b_translator VARCHAR(100));

ALTER TABLE book MODIFY(b_title VARCHAR(100));

