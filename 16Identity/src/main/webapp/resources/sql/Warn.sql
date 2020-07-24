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
    wc_reason varchar2(1000),
    wc_date date not null
);

create sequence wc_seq;

ALTER TABLE WARN_CHECK ADD(W_REASON VARCHAR2(50));
alter table warn_check rename column w_reason to wc_reason;
alter table warn_check ADD wc_state varchar2(30) default '접수 대기';
ALTER TABLE WARN_CHECK RENAME COLUMN M_ID TO WC_ID;

selec