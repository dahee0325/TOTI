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

/* 요청서번호에 맞는 회원정보 가져오기 */
select m_name, m_photo from toti_request r join toti_member m
on r.m_idx = m.m_idx
where r.request_idx = 39 and m.m_idx = 1;

select * from toti_request;

/* 분야 */
select cate_name from toti_request r join toti_cate c
on r.cate_idx = c.cate_idx
where r.request_idx = 39;

/* 서비스 */
select service_name from toti_request r join toti_service s join toti_mentee_service ms
on ms.request_idx = r.request_idx and ms.service_idx = s.service_idx
where r.request_idx = 39;

/* 질문답변 */
select quest_name, answer_cont from toti_request r join toti_answer a join toti_question q
on r.request_idx = a.request_idx and q.quest_idx = a.quest_idx
where r.request_idx = 39;

/* 시간 */
select date_format(request_date, '%y-%m-%d %H:%i') request_date
from toti_request
where request_idx = 1;

/* request_idx, cate_name, date_format(request_date, '%y-%m-%d') request_date */
/* 자신의 요청서목록 */
select r.request_idx, c.cate_name, s.service_name, date_format(request_date, '%y-%m-%d') request_date
from toti_request r join toti_cate c join toti_mentee_service ms join toti_service s
on r.cate_idx = c.cate_idx and ms.request_idx = r.request_idx and ms.service_idx = s.service_idx
where r.m_idx = 1
order by r.request_date desc
;

/* 1번 요청서에 온 견적서 개수 */
select count(*) from toti_estimatee e join toti_request r
on e.request_idx = r.request_idx
where r.request_idx = 3
;

select * from toti_request;

select * from toti_estimatee;

select * from toti_mentor_profile;

/* 받은견적서 리스트 */
select m.mento_idx, mm.m_photo, mm.m_name, mp.p_shot, FORMAT(e.est_price , 0) est_price, m.tor_location, 
(if(isnull(re.review_idx),0,(select round(avg(sr.review_star),1) from toti_review sr where sr.mento_idx = m.mento_idx))) str,
(select count(*) from toti.toti_review src where m.mento_idx = src.mento_idx) cont_cnt
from toti_estimatee e join toti_request r join toti_mentor m join toti_mentor_profile mp join toti_member mm join toti_review re
on e.request_idx = r.request_idx and e.mento_idx = m.mento_idx and m.mento_idx = mp.mento_idx and m.mento_idx = mm.m_idx and re.mento_idx = m.mento_idx
where r.request_idx = 3
group by est_idx
;

select mt.mento_idx, m.m_name, mp.p_shot, mt.tor_location,m_photo, es.est_price, date_format(es.est_date, '%y-%m-%d %H:%i') est_date,
(if(isnull(rv.review_idx),0,(select round(avg(sr.review_star),1) from toti_review sr where sr.mento_idx = mt.mento_idx))) str,
(select count(*) from toti.toti_review src where mt.mento_idx = src.mento_idx) cont_cnt
from toti_mentor mt join toti_mentor_profile mp join toti_member m join toti_estimatee es
on mt.mento_idx = m.m_idx and mt.mento_idx = es.mento_idx and mt.mento_idx = mp.mento_idx 
left outer join toti_review rv
on rv.mento_idx = mt.mento_idx
where es.request_idx = 3
group by est_idx
;

select cate_idx from toti_member m join toti_mentor mt
on m.m_idx = mt.mento_idx
where m_idx=80;

select * from toti_mentor;

select * from toti_mentee_service;

select * from toti_review r join toti_mentor m
on r.mento_idx = m.mento_idx
where m.mento_idx = 3;

select * from toti_estimatee;


/* 회원, 멘토, 등록한 서비스 */
select * from toti_member;
select m.mento_idx, mm.m_name, mm.m_id, s.service_name from toti_mentor m join toti_member mm join toti_mentor_service ms join toti_service s
on m.mento_idx = mm.m_idx and m.mento_idx = ms.mento_idx and ms.service_idx = s.service_idx
;