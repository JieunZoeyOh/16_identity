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