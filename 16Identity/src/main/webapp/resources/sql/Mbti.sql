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
select * from mbti;