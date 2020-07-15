create table warn(
   w_no number primary key,
   m_id varchar2(50) REFERENCES member(m_id) on delete cascade,
   cmt_no number REFERENCES comments(cmt_no) on delete cascade,
   w_reason varchar2(50) not null,
   w_date date not null,
   w_count number not null
);

create sequence warn_seq;
insert into warn values (warn_seq.nextval,'user1@naver.com', 21, '그냥', sysdate, 1);
insert into warn values (warn_seq.nextval,'admin@naver.com', 21, '풉', sysdate, 2);

--완료

create table warn_check(
	wc_no number primary key,
	m_id varchar2(50) REFERENCES member(m_id) on delete cascade,
    cmt_no number REFERENCES comments(cmt_no) on delete cascade,
    wc_date date not null
);

create sequence wc_seq;