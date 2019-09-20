-- auto_increment 초기화하기
alter table toti_cate auto_increment=1;
-- 더미데이터 삭제
delete from toti_cate where cate_idx >0;

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
insert into toti_service (cate_idx, service_name) values (1, '발라드');
insert into toti_service (cate_idx, service_name) values (1, 'POP');
insert into toti_service (cate_idx, service_name) values (1, 'R&B');
insert into toti_service (cate_idx, service_name) values (2, '팝핀');
insert into toti_service (cate_idx, service_name) values (2, '방송댄스');
insert into toti_service (cate_idx, service_name) values (2, '힙합');
insert into toti_service (cate_idx, service_name) values (3, '피아노');
insert into toti_service (cate_idx, service_name) values (3, '기타');
insert into toti_service (cate_idx, service_name) values (3, '드럼');

select * from toti_service;


-- 질문 테이블
insert into toti_question (cate_idx, quest_name) values (1, '노래 배우려는 목적');
insert into toti_question (cate_idx, quest_name) values (2, '춤을 배우려는 목적');
insert into toti_question (cate_idx, quest_name) values (3, '악기를 배우려는 목적');
insert into toti_question (cate_idx, quest_name) values (4, '연령대??');
insert into toti_question (cate_idx, quest_name) values (4, '성별??');
insert into toti_question (cate_idx, quest_name) values (4, '지역??');

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


select * from toti_mentee_service;

-- 요청서 테이블(회원번호, 분야번호)
insert into toti_request (m_idx, cate_idx) values (1, 1);
insert into toti_request (m_idx, cate_idx) values (1, 2);

select * from toti_request;

-- 답변 테이블(요청서번호, 질문번호, 답변내용)
insert into toti_answer (request_idx, quest_idx, answer_cont) values (2, 2,'몸치탈출');
insert into toti_answer (request_idx, quest_idx, answer_cont) values (2, 4,'20대');
insert into toti_answer (request_idx, quest_idx, answer_cont) values (2, 5,'여자');
insert into toti_answer (request_idx, quest_idx, answer_cont) values (2, 6,'서울시강북구');

select * from toti_answer;

