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

select * from mbti_nickname;