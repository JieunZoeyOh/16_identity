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