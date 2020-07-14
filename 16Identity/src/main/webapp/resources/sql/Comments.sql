create table comments(
cmt_no number(10) primary key,
isbn varchar2(13),
cmt_id varchar2(50),
cmt_mbti varchar2(4) not null,
cmt_content varchar2(1000) not null,
cmt_date date not null,
cmt_like number(38) default 0,
foreign key (cmt_id)
references member(m_id) on delete cascade,
foreign key (isbn)
references book(isbn) on delete cascade
);
--완료

--alter 칼럼 추가
ALTER TABLE COMMENTS ADD(cmt_nickname varchar2(50));
--alter isbn 크기 늘림
ALTER TABLE COMMENTS MODIFY(isbn VARCHAR(30));

--sequence 추가
create sequence cmt_no increment by 1 start with 1;

insert into comments values (cmt_no.nextval, istp, )