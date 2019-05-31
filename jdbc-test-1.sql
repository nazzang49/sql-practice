show tables;

desc department;
select * from department;
insert into department values(null,"총무팀");
insert into department values(null,"개발팀");
insert into department values(null,"연구팀");
insert into department values(null,"영업팀");

use webdb;

desc user;
desc guestbook;
desc board;
select * from guestbook;
select * from user;

select * from board;

insert into guestbook values(1, "박진영", "pw", "내용", now());
insert into guestbook values(2, "박진수", "pw", "내용", now());


delete from guestbook where no=8;

ALTER TABLE user MODIFY no int unsigned AUTO_INCREMENT;
ALTER TABLE guestbook MODIFY no int unsigned AUTO_INCREMENT;
ALTER TABLE board MODIFY contents varchar(4000) not null;

desc board;



select b.no, b.title, b.reg_date as regDate, b.hit, b.group_no as groupNo, u.name
from board b, user u
where b.user_no=u.no;

select b.no, b.title, b.reg_date as regDate, b.hit, b.group_no as groupNo, u.name as userName
from board b, user u
where b.user_no=u.no;

delete from board where no=32;
update board set order_no=order_no+1 where group_no=1 and order_no>=2;

SET SQL_SAFE_UPDATES =0;

select * from board;

desc user;

insert into user values(null,"관리자","admin@mysite.com","admin","남성","ADMIN",now());
insert into site values(null,"MySite","- CAFE24 교육생 박진영입니다 -");

-- gender 컬럼 뒤쪽으로 해당 컬럼을 생성(after)
alter table user add column role enum("ADMIN","USER") default "USER" not null after gender;

-- 작성자로 검색
select count(*)
from board b, user u
where b.user_no=u.no
and u.name like '%박%';

alter table board add column images varchar(400) not null after depth;
alter table board drop column images;