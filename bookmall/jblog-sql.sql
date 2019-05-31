use jblog;

desc user;
desc blog;
desc category;
desc post;
desc comment;

select * from user;
select * from blog;
select * from category;
select * from post;

-- 카테고리 미지정 상태에서 포스트 작성 시 디폴트 카테고리 번호 1 부여
alter table post modify column category_no int unsigned not null default 1;
delete from user where id="gimajin";

-- 카테고리 및 게시물 리스트는 따로 추출
select u.id, u.name, b.title, b.logo
from user u, blog b
where u.id="nazzang49"
and u.id=b.user_id;

alter table post modify column title varchar(100) not null;

-- 카테고리 관리 페이지 리스트
select c.no, c.subject, count(p.category_no) as postCount, c.description
from category c, post p
where c.no=p.category_no
group by c.no, c.subject, c.description;

insert into category values(null, "Spring Basic", "스프링 기초 학습", now(), "nazzang49");
insert into post values(5, "Spring Doit-1번 게시물", "테스트", now(), 7);

delete from user where id="";

select * from post where category_no=5;


select c.no, c.subject, count(p.category_no) as postCount, c.description
from category c left outer join post p
on c.no=p.category_no
group by c.no, c.subject, c.description;

select no from post where category_no=1 order by no limit 0,1;

insert into user values("nazzang49", "박진영", "pw", now());
insert into blog values("nazzang49", "YOUNG", "/image/jblog-uploads/201943042249519.jpg");

delete from user where id="ulta";

select p.no, p.category_no as categoryNo, p.title, p.contents
from post p, category c, user u
where u.id=c.user_id
and u.id="nazzang49"
and c.no=p.category_no
order by no desc
limit 0,1;


select no, category_no as categoryNo, title, contents from post order by no desc limit 0,1;