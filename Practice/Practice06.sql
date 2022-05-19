--북 테이블 만들기

CREATE TABLE book(
    book_id number(10),
    title varchar2(100) not null,
    pubs varchar2(500),
    pub_date date,
    author_id number(10),
    PRIMARY KEY (book_id),
    CONSTRAINT book_fk FOREIGN KEY (author_id)
    REFERENCES author(author_id)
);
--북 시퀀스만들기

CREATE SEQUENCE seq_book_id
INCREMENT by 1
start with 1
nocache;

--작가 테이블 만들기
CREATE TABLE author(
    author_id number(10),
    author_name varchar2(100) not null,
    author_desc varchar2(500),
    PRIMARY KEY (author_id)
);
--작가 시퀀스 만들기

create sequence seq_author_id
increment by 1
start with 1
nocache;

--북 데이터 추가

insert into book
values(seq_book_id.nextval,'우리들의 일그러진 영웅', '다림', '1998-02-22', 1);

insert into book
values(seq_book_id.nextval,'삼국지', '민음사', '2022-03-01',1);

insert into book
values(seq_book_id.nextval,'토지', '마로니에북스', '2012-08-15', 2);

insert into book
values(seq_book_id.nextval,'유시민의 글쓰기 특강', '생각의길', '2015-04-01', 3);

insert into book
values(seq_book_id.nextval,'패션왕', '중앙북스(books)', '2012-02-22', 4);

insert into book
values(seq_book_id.nextval,'순정만화', '재미주의', '2011-08-03', 5);

insert into book
values(seq_book_id.nextval,'오직두사람', '문학동네', '2017-05-04', 6);

insert into book
values(seq_book_id.nextval,'26년', '재미주의', '2012-02-04', 5);

--작가 데이터 추가

insert into author
values(seq_author_id.nextval,'이문열','경북 영양');

insert into author
values(seq_author_id.nextval,'박경리','경상남도 통영');

insert into author
values(seq_author_id.nextval,'유시민','17대 국회의원');

insert into author
values(seq_author_id.nextval,'기안 84','기안동에서 산 84년생');

insert into author
values(seq_author_id.nextval,'강풀','온라인 만화가 1세대');

insert into author
values(seq_author_id.nextval,'김영하','알쓸신잡');

--강풀 정보 변경

update author
set author_desc = '서울 특별시'
where author_id = 5;

--기안 84 데이터 삭제

delete from author
where author_id = 4;


--북  테이블 조회하기
select *
from book;
--작가 테이블 조회하기
select *
from author;

--시퀀스 조회
select *
from user_sequences;
--시퀀스 삭제
DROP SEQUENCE seq_author_id;
DROP SEQUENCE seq_book_id;


--북테이블 삭제
drop table book;
--작가 테이블 삭제
drop table author;
--테이블합쳐서 보기
