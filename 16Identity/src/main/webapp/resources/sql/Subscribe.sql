create table subscribe(
   no number primary key,
   m_id varchar2(50) REFERENCES member(m_id) on delete cascade,
   subsdate date not null
);

--완료