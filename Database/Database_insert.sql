-- auto_increment 초기화하기
alter table toti_chatroom auto_increment=1;
-- 더미데이터 삭제
delete from toti_chatroom;

select * from toti_chatlog;

-- 더미데이터
-- 회원 테이블
insert into toti_member (m_id,m_pw,m_name,m_email,m_gender,m_code) values ('dahee','1234','다희','dahee@naver.com','f','123456789abc');
insert into toti_member (m_id,m_pw,m_name,m_email,m_gender,m_code) values ('hyewon','1111','혜원','hyewon@naver.com','f','123456789qwer');
insert into toti_member (m_id,m_pw,m_name,m_email,m_gender,m_code) values ('jooeun','2222','주은','jooeun@gmail.com','f','123456789fggh');
insert into toti_member (m_id,m_pw,m_name,m_email,m_gender,m_code) values ('minjong','3333','민종','minjong@daum.net','m','123456789plo');
insert into toti_member (m_id,m_pw,m_name,m_email,m_gender,m_code) values ('ddongjun','4444','똥준','dongjun@nate.net','m','123456789tgb');

select * from toti_member;

-- 분야 테이블 (변경X)
insert into toti_cate (cate_name) values ('보컬');
insert into toti_cate (cate_name) values ('댄스');
insert into toti_cate (cate_name) values ('악기');
insert into toti_cate (cate_name) values ('공통');

select * from toti_cate;

-- 서비스 테이블
insert into toti_service (cate_idx, service_name) values (1, '발라드'), (1, 'POP'), (1, 'R&B');
insert into toti_service (cate_idx, service_name) values (2, '팝핀'), (2, '방송댄스'),(2, '힙합');
insert into toti_service (cate_idx, service_name) values (3, '피아노'), (3, '기타'), (3, '드럼');

select * from toti_service;


-- 질문 테이블
insert into toti_question (cate_idx, quest_name) values (1, '노래 배우려는 목적');
insert into toti_question (cate_idx, quest_name) values (2, '춤을 배우려는 목적');
insert into toti_question (cate_idx, quest_name) values (3, '악기를 배우려는 목적');
insert into toti_question (cate_idx, quest_name) values (4, '연령대??');
insert into toti_question (cate_idx, quest_name) values (4, '성별??');
insert into toti_question (cate_idx, quest_name) values (4, '지역??');
insert into toti_question (quest_idx, cate_idx, quest_name) values (999, 4, '간단한 자기소개 및 희망 사항을 알려주세요!');
delete from toti_question where quest_idx = 999;

select * from toti_question;

-- 항목 테이블
insert into toti_item (quest_idx, item_cont) values (1, '발성연습');
insert into toti_item (quest_idx, item_cont) values (1, '음치탈출');
insert into toti_item (quest_idx, item_cont) values (1, '노래연습');
insert into toti_item (quest_idx, item_cont) values (1, '기타');
insert into toti_item (quest_idx, item_cont) values (4, '10대');
insert into toti_item (quest_idx, item_cont) values (4, '20대');
insert into toti_item (quest_idx, item_cont) values (4, '30대');
insert into toti_item (quest_idx, item_cont) values (4, '40대이상');
insert into toti_item (quest_idx, item_cont) values (3, '재밌을거같음');
insert into toti_item (quest_idx, item_cont) values (3, '취미');
insert into toti_item (quest_idx, item_cont) values (3, '그냥');
insert into toti_item (quest_idx, item_cont) values (3, '기타');
insert into toti_item (quest_idx, item_cont) values (2, '몸치탈출');
insert into toti_item (quest_idx, item_cont) values (2, '취미');
insert into toti_item (quest_idx, item_cont) values (2, '재미');
insert into toti_item (quest_idx, item_cont) values (2, '기타');
insert into toti_item (quest_idx, item_cont) values (5, '여자');
insert into toti_item (quest_idx, item_cont) values (5, '남자');
insert into toti_item (quest_idx, item_cont) values (5, '기타');

insert into toti_item (quest_idx, item_cont) values (999, '기타');

select * from toti_mentee_service;

-- 요청서 테이블(회원번호, 분야번호)
insert into toti_request (m_idx, cate_idx) values (1, 1);
insert into toti_request (m_idx, cate_idx) values (1, 2);

select * from toti_request;


-- 답변 테이블(요청서번호, 질문번호, 답변내용)
insert into toti_answer (request_idx, quest_idx, answer_cont) values (2, 2,'몸치탈출') , (2, 4,'20대');
insert into toti_answer (request_idx, quest_idx, answer_cont) values (2, 4,'20대');
insert into toti_answer (request_idx, quest_idx, answer_cont) values (2, 5,'여자');
insert into toti_answer (request_idx, quest_idx, answer_cont) values (2, 6,'서울시강북구');


select * from toti_answer;

select * from toti_mentee_service;

select m_name, service_name from toti_mentee_service s join toti_service ss join toti_member m
on s.service_idx = ss.service_idx and m.m_idx = s.m_idx
;

delete from toti_question where quest_idx = 7;

select * from toti_member;
select date_format(request_date, '%y-%m-%d %H:%i') request_date from toti_request;
select * from toti_question;
select * from toti_answer;
select * from toti_item;
select * from toti_mentee_service;
select * from toti_request;

select r.request_idx, c.cate_name, s.service_name, date_format(request_date, '%y-%m-%d') request_date 
from toti_request r join toti_cate c join toti_mentee_service ms join toti_service s
on r.cate_idx = c.cate_idx and ms.request_idx = r.request_idx and ms.service_idx = s.service_idx
where r.m_idx = 1
;

select * from toti_question;
select * from toti_chatroom;
select * from toti_member;

select * from toti_service
where cate_idx = 1;

select c.cate_name, me.m_idx, m.mento_idx ,me.m_name, ss.service_name from toti_mentor_service s join toti_mentor m join toti_member me join toti_service ss join toti_cate c
on s.mento_idx = m.mento_idx and m.mento_idx = me.m_idx and s.service_idx = ss.service_idx and  c.cate_idx = ss.cate_idx;

select * from toti_mentor_service;

select * from toti_question;

select date_add(now(), INTERVAL 9 HOUR);

select * from toti_cate;

select * from toti_;

select * from toti_request
where date_add(request_date , INTERVAL 5 DAY)-now() < 0;

delete from toti_request where request_idx in
(select request_idx from(
select request_idx from toti_request
where date_add(request_date, INTERVAL 5 DAY)-now() < 0 and m_idx=79) re);


select * from toti_estimatee;

SET SQL_SAFE_UPDATES = 0;

select r.request_idx, c.cate_name, s.service_name, date_format(request_date, '%y-%m-%d') request_date 
		from toti_request r join toti_cate c join toti_mentee_service ms join toti_service s
		on r.cate_idx = c.cate_idx and ms.request_idx = r.request_idx and ms.service_idx = s.service_idx
		where r.m_idx = 84
		order by r.request_date desc;

select * from toti_request;

select * from toti_chatroom;

-- target 받는사람

select est_idx,m_photo,m_name, cate_name,service_name, format(est_price,0) est_price, answer_cont, last_msg from toti.toti_estimatee e 
join toti.toti_request r on r.request_idx = e.request_idx
join toti.toti_member m on r.m_idx = m.m_idx
join toti.toti_mentee_service ms on ms.request_idx = r.request_idx
join toti.toti_service s on s.service_idx = ms.service_idx
join toti.toti_cate c on c.cate_idx = s.cate_idx
join toti.toti_answer a on a.request_idx = r.request_idx
join toti.toti_chatroom rm on rm.room_num = e.est_idx
where quest_idx = 999 and member = 3 and
m_name like CONCAT('%%')
order by est_date desc;

select * from toti_chatroom;
select * from toti_member;

select * from toti_question;
select * from toti_item;

delete from toti_question where quest_idx = 12;

select * from toti_mentor;
select * from toti_member;
select * from toti_estimatee;
