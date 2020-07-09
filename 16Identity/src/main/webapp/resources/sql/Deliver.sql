drop table deliver;

create table deliver(
    no number primary key,
    m_id varchar2(50) REFERENCES member(m_id) ON delete CASCADE,
    isbn varchar2(30) REFERENCES BOOK(isbn) ON delete CASCADE,
    deliver_date date,
    state VARCHAR2(20)
);

create sequence del_seq;

select * from deliver;
