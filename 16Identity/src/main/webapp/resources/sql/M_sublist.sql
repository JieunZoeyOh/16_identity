create table m_sublist(
    no number primary key,
    m_id varchar2(50) REFERENCES member(m_id) ON delete CASCADE,
    isbn varchar2(13) REFERENCES BOOK(isbn) ON delete CASCADE,
    deliver_date date,
    state VARCHAR2(10)
);

--완료