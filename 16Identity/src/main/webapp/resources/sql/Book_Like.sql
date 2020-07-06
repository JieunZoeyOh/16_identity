create table book_like(
like_no number(10) primary key,
isbn varchar2(30),
like_count number(10) default 0,
i_count number(10) default 0,
e_count number(10) default 0,
s_count number(10) default 0,
n_count number(10) default 0,
t_count number(10) default 0,
f_count number(10) default 0,
j_count number(10) default 0,
p_count number(10) default 0,
foreign key (isbn)
references book(isbn) on delete cascade
);

--완료