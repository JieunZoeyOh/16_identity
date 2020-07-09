create table deliver(
   no number primary key,
   m_id varchar2(50) REFERENCES member(m_id) ON delete CASCADE,
   m_sublist_no number REFERENCES m_sublist(no) on delete CASCADE,
   deliver_date date,
   state varchar2(10)
);

select * from deliver;
--완료