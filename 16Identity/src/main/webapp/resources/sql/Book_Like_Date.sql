create table book_like_date(
no number(10) primary key,
isbn varchar2(30),
m_id varchar2(50),
m_mbti varchar2(4) not null,
like_date date not null,
foreign key (isbn)
references book(isbn) on delete cascade,
foreign key (m_id)
references member(m_id) on delete cascade
);

--완료

--sequence 추가
create sequence bld_no increment by 1 start with 1;

--alter isbn 크기 늘림
ALTER TABLE book_like_date MODIFY(isbn VARCHAR(30));

select ROWNUM rnum, x.*
from (select isbn, count(*) total
	  from book_like_date
	  where m_mbti = 'enfj'
	  and like_date between to_char(sysdate-7) and sysdate
	  group by isbn
	  order by total desc) x;