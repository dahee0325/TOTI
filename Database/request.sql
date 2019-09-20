-- 분야번호에 맞는 분야명가져오기
select * from toti_cate where cate_idx=1;

-- 분야번호에 맞는 서비스번호, 서비스명 리스트
select s.service_idx, s.service_name from toti_cate c join toti_service s 
on c.cate_idx = s.cate_idx
where c.cate_idx=1;

-- 분야번호에 맞는 질문번호, 질문
select q.quest_idx, q.quest_name from toti_cate c join toti_question q 
on c.cate_idx = q.cate_idx
where c.cate_idx=1 or c.cate_idx=4;

-- 질문번호에 맞는 질문의 항목번호, 항목
select item_idx, item_cont from toti_question join toti_item
using(quest_idx)
where quest_idx=1;

select * from toti_question;

drop table toti_mentee_service;

select * from toti_answer;