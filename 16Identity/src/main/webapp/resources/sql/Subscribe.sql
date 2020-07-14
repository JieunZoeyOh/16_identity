create table subscribe(
   no number primary key,
   m_id varchar2(50) REFERENCES member(m_id) on delete cascade,
   isbn varchar2(30) REFERENCES book(isbn) ON delete CASCADE,
   updateday date
);

alter table subscribe modify isbn varchar2(30);
drop table subscribe;

create sequence sub_seq;

drop sequence sub_seq;

--완료