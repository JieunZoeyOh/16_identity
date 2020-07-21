create table mbti(
      mbti varchar2(4) not null primary key, 
      mbti_e number(1) not null,    
      mbti_i number(1) not null, 
      mbti_s number(1) not null, 
      mbti_n number(1) not null, 
      mbti_t number(1) not null, 
      mbti_f number(1) not null, 
      mbti_j number(1) not null, 
      mbti_p number(1) not null 
)   

insert into mbti values ('istp',0,1,1,0,1,0,0,1);
insert into mbti values ('istj',0,1,1,0,1,0,1,0);
insert into mbti values ('infp',0,1,0,1,0,1,0,1);
insert into mbti values ('entj',1,0,0,1,1,0,1,0);
insert into mbti values ('infj',0,1,0,1,0,1,1,0);
insert into mbti values ('intp',0,1,0,1,1,0,0,1);
insert into mbti values ('intj',0,1,0,1,1,0,1,0);
insert into mbti values ('isfj',0,1,1,0,0,1,1,0);
insert into mbti values ('isfp',0,1,1,0,0,1,0,1);
insert into mbti values ('estp',1,0,1,0,1,0,0,1);
insert into mbti values ('estj',1,0,1,0,1,0,1,0);
insert into mbti values ('enfp',1,0,0,1,0,1,0,1);
insert into mbti values ('enfj',1,0,0,1,0,1,1,0);
insert into mbti values ('entp',1,0,0,1,1,0,0,1);
insert into mbti values ('esfp',1,0,1,0,0,1,0,1);
insert into mbti values ('esfj',1,0,1,0,0,1,1,0);
--16개 들어갔는지 확인하기
select * from mbti;

create table member(
     m_id varchar2(50) not null primary key, 
     m_name varchar2(50) not null, 
     m_nickname varchar2(13) not null unique, 
     m_original varchar2(50) not null, 
     m_file varchar2(50) not null, 
     m_password varchar2(100) not null,
     m_mbti varchar2(15) not null,
     m_phone varchar2(13) not null, 
     m_address_no number(10) not null, 
     m_address varchar2(100) not null, 
     substate varchar2(20),
     season number(3),
     subend date,
     subsdate date,
     warn_count number(5) DEFAULT 0,
     foreign key (m_mbti) references mbti(mbti) on delete cascade
)

create table book(
      isbn varchar2(30) not null primary key, 
      b_title varchar2(100) not null, 
      b_thumbnail varchar2(200) not null, 
      b_content varchar2(2000) not null, 
      b_authors varchar2(100) not null, 
      mbti varchar2(4) default null,
      b_publisher varchar2(40) not null, 
      b_saleprice number(6) not null, 
      b_datetime date not null,
      b_translator varchar2(100)
)

create table comments(
	cmt_no number(10) primary key,
	isbn varchar2(30),
	cmt_id varchar2(50),
	cmt_mbti varchar2(4) not null,
	cmt_content varchar2(1000) not null,
	cmt_date date not null,
	cmt_like number(38) default 0,
	cmt_nickname varchar2(50),
	foreign key (cmt_id)
	references member(m_id) on delete cascade,
	foreign key (isbn)
	references book(isbn) on delete cascade
);

create sequence cmt_no increment by 1 start with 1;

create table comments_like(
	cmt_like_no number(10) primary key,
	cmt_no number(10),
	cmt_like_id varchar2(50),
	cmt_like_date date not null,
	foreign key (cmt_no)
	references comments(cmt_no) on delete cascade,
	foreign key (cmt_like_id)
	references member(m_id) on delete cascade
);

create sequence cl_seq increment by 1 start with 1;

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

create sequence like_no increment by 1 start with 1;

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

create sequence bld_no increment by 1 start with 1;

create table deliver(
    no number primary key,
    m_id varchar2(50) REFERENCES member(m_id) ON delete CASCADE,
    isbn varchar2(30) REFERENCES BOOK(isbn) ON delete CASCADE,
    deliver_date date,
    state VARCHAR2(20)
);

create sequence del_seq;

create table m_sublist(
    no number primary key,
    m_id varchar2(50) REFERENCES member(m_id) ON delete CASCADE,
    isbn varchar2(30) REFERENCES BOOK(isbn) ON delete CASCADE,
    deliver_date date,
    state VARCHAR2(10)
);

create table mbti_nickname(
	mbti varchar2(4) not null,
	nickname varchar(60) not null,
	foreign key (mbti) references mbti(mbti) on delete cascade
);

insert into mbti_nickname values ('istp','만능 재주꾼');
insert into mbti_nickname values ('istj','청렴결백한 논리주의자');
insert into mbti_nickname values ('infp','열정적인 중재자');
insert into mbti_nickname values ('entj','대담한 통솔자');
insert into mbti_nickname values ('infj','선의의 옹호자');
insert into mbti_nickname values ('intp','논리적인 사색가');
insert into mbti_nickname values ('intj','용의주도한 전략가');
insert into mbti_nickname values ('isfj','용감한 수호자');
insert into mbti_nickname values ('isfp','호기심 많은 예술가');
insert into mbti_nickname values ('estp','모험을 즐기는 사업가');
insert into mbti_nickname values ('estj','엄격한 관리자');
insert into mbti_nickname values ('enfp','재기발랄한 활동가');
insert into mbti_nickname values ('enfj','정의로운 사회운동가');
insert into mbti_nickname values ('entp','뜨거운 논쟁을 즐기는 변론가');
insert into mbti_nickname values ('esfp','자유로운 영혼의 연예인');
insert into mbti_nickname values ('esfj','사교적인 외교관');

--16개 다 들어갔는지 확인
select * from mbti_nickname;

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

create table suborder(
   no number primary key, 
   isbn varchar2(30) REFERENCES book(isbn) ON delete CASCADE,
   total number,
   order_date date,
   state varchar2(20)
);

create sequence order_seq;

create table subscribe(
   no number primary key,
   m_id varchar2(50) REFERENCES member(m_id) on delete cascade,
   isbn varchar2(30) REFERENCES book(isbn) ON delete CASCADE,
   updateday date
);

create sequence sub_seq;

create table warn(
   w_no number primary key,
   m_id varchar2(50) REFERENCES member(m_id) on delete cascade,
   cmt_no number REFERENCES comments(cmt_no) on delete cascade,
   w_reason varchar2(50) not null,
   w_date date not null,
   w_count number not null
);

create sequence warn_seq;

create table warn_check(
	wc_no number primary key,
	m_id varchar2(50) REFERENCES member(m_id) on delete cascade,
    cmt_no number REFERENCES comments(cmt_no) on delete cascade,
    wc_reason varchar2(50),
    wc_date date not null
);

create sequence wc_seq;