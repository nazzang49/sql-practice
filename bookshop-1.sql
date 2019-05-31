use webdb;
desc book;
desc author;

-- 제약 조건 추가
alter table book add constraint check(status in("대여 중", "대여 가능"));

-- 저자 추가
insert into author values(null,"스테파니메이어");
insert into author values(null,"조정래");

-- 책 추가
insert into book values(null,"트와일라잇","대여가능",1);
insert into book values(null,"뉴문","대여가능",1);
insert into book values(null,"이클립스","대여가능",1);
insert into book values(null,"브레이킹던","대여가능",1);

-- 책+저자
select b.title, a.name, b.status
from author a, book b
where a.no=b.author_no
order by a.no asc;

select * from author;
select * from guestbook;
select * from user;