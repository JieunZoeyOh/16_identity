create table comments_like(
cmt_like_no number(10) primary key,
cmt_no number(10),
cmt_like_id varchar2(50),
cmt_like_date date not null,
foreign key (cmt_no)
references comments(cmt_no) on delete cascade,
foreign key (cmt_like_id)
references member(m_id) on delete cascade
);
--완료

create sequence cl_seq increment by 1 start with 1;