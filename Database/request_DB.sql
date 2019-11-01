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


-- 멘티 서비스
create table toti_mentee_service
(
	request_idx int(11),
	m_idx int(11) not null,
    service_idx int(11) not null,
    primary key(request_idx),
	foreign key(request_idx) references toti_request (request_idx),
    foreign key(m_idx) references toti_member (m_idx),
    foreign key(service_idx) references toti_service (service_idx)
);


select * from toti_mentee_service;
