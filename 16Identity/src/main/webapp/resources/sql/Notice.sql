drop table notice;

create table notice(
   no number not null primary key,
   m_id varchar2(50) not null,
   password varchar2(15) not null,
   n_original varchar2(50),
   n_file varchar2(50),
   subject varchar2(50) not null,
   content varchar2(2000) not null,
   viewcount number,
   n_date date not null,
   foreign key (m_id) references member(m_id) on delete cascade
);

create table delete_File(
	notice_file VARCHAR2(50) primary key
);

--완료4