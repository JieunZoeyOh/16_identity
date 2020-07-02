create table subscribe(
   no number primary key,
   m_id varchar2(50) REFERENCES member(m_id) on delete cascade,
   isbn varchar2(13) REFERENCES book(isbn) ON delete CASCADE,
   updatedate date,
   subsdate date
);

drop table subscribe;

create sequence sub_seq;

--완료