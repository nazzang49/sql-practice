use bookmall;

desc book; -- done
desc orders; -- done
desc member; -- done
desc order_book;
desc cart; -- done
desc category; -- done

select * from book order by category_no asc;
select * from orders;
select * from member;
select * from order_book;
select * from cart;
select * from category;

select b.title, b.price, c.name
from book b, category corder_book
where b.category_no=c.no
order by c.no;

-- 카트에 담겨 있는 각 회원이 고른 책들의 합계 금액
select b.title, c.amount, b.price*c.amount
from book b, cart c, member m
where b.no=c.book_no
and c.member_no=m.no
and m.no=2;

select sum(b.price*c.amount)
from book b, cart c, member m
where b.no=c.book_no
and c.member_no=m.no
and m.no=2;

select b.price*c.amount 
from book b, cart c, member m 
where b.no=c.book_no 
and c.member_no=m.no
and m.no=1 
and b.no=1;

-- order_book
select b.no, b.title, c.amount
from book b, cart c, orders o
where o.member_no=c.member_no
and o.book_no=c.book_no
and o.book_no=b.no
and o.book_no=1
and o.member_no=1;


-- 주문 정보
select o.order_no, m.name, m.email, o.price, o.addr, o.status
from orders o, member m
where o.member_no=m.no;

delete from category where no >= 5;

-- order_book 삽입
insert into order_book values(1,1);

select b.no, b.title, round(o.price/b.price)
from order_book ob, orders o, book b
where o.no=ob.order_no
and b.no=ob.book_no;

select o.price
from orders o, order_book ob
where o.no=ob.order_no;