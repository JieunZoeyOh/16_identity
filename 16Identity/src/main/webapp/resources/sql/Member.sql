create table member(
     m_id varchar2(50) not null primary key, 
     m_name varchar2(5) not null, 
     m_nickname varchar2(13) not null unique, 
     m_original varchar2(50) not null, 
     m_file varchar2(50) not null, 
     m_password varchar2(13) not null,
     m_mbti varchar2(4) not null,
     m_phone varchar2(13) not null, 
     m_address_no number(5) not null, 
     m_address varchar2(100) not null, 
     foreign key (m_mbti) references mbti(mbti) on delete cascade
)

--완료 3