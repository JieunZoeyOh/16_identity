drop table member;

create table member(
     m_id varchar2(50) not null primary key, 
     m_name varchar2(50) not null, 
     m_nickname varchar2(13) not null unique, 
     m_original varchar2(50) not null, 
     m_file varchar2(50) not null, 
     m_password varchar2(13) not null,
     m_mbti varchar2(4) not null,
     m_phone varchar2(13) not null, 
     m_address_no number(5) not null, 
     m_address varchar2(100) not null, 
     substate varchar2(20),
     subsdate date,
     foreign key (m_mbti) references mbti(mbti) on delete cascade
)

alter table member add (substate varchar2(20));
alter table member add (subsdate date);

insert into member values ('user3@gmail.com','사용자3','사용자3','1.png','1.png','1234','istp','010-1234-5678','02488','서울특별시 동대문구 청량리동 33-15',null,sysdate);



