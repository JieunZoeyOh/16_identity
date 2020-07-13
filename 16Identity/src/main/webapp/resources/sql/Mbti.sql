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

--아래 추가하고 16개인지 확인하기
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
select * from mbti;