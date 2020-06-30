create table notice(
no number not null primary key,
m_id varchar2(50) not null,
passowrd varchar2(15) not null,
n_original varchar2(50) not null,
n_file varchar2(50) not null,
subject varchar2(50) not null,
content varchar2(2000) not null,
n_date date not null,
foreign key (m_id) references member(m_id) on delete cascade
);

--완료4