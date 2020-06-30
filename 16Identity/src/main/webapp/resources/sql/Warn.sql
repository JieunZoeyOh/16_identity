create table warn(
   w_no number primary key,
   m_id varchar2(50) REFERENCES member(m_id) on delete cascade,
   cmt_no number REFERENCES comments(cmt_no) on delete cascade,
   w_reason varchar2(50) not null,
   w_date date not null,
   w_count number not null
);

--완료