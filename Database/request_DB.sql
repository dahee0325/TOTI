-- 요청서
create table toti_request (
request_idx int(11) auto_increment,
m_idx int(11) not null,
quest_idx int(11) not null,
request_cont varchar(500) not null,
request_date datetime default current_timestamp,
primary key(request_idx),
foreign key(m_idx) references toti_member (m_idx),
foreign key(quest_idx) references toti_question (quest_idx)
);

