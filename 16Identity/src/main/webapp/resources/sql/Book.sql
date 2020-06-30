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

-- 완료1