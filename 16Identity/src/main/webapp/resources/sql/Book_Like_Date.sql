create table book_like_date(
no number(10) primary key,
isbn varchar2(13),
m_id varchar2(50),
m_mbti varchar2(4) not null,
like_date date not null,
foreign key (isbn)
references book(isbn) on delete cascade,
foreign key (m_id)
references member(m_id) on delete cascade
);

--완료