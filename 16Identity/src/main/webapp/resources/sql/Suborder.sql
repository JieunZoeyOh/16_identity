create table suborder(
   no number primary key, 
   isbn varchar2(30) REFERENCES book(isbn) ON delete CASCADE,
   total number,
   order_date date,
   state varchar2(20)
);

create sequence order_seq;

--완료