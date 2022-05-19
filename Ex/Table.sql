create table book(    --테이블 생성
    book_id number(5),
    title varchar2(50),
    author varchar2(10),
    pub_date date
);

alter table book add(pubs varchar2(50)); -- 컬럼추가

alter table book MODIFY(title varchar(100)); -- 컬럼 수정

alter table book RENAME COLUMN title to subject; --컬럼명 수정

alter table book drop(author);  --컬럼 삭제

rename book to article; -- 테이블 이름 바꾸기

drop table article; -- 테이블 삭제

select *
from article;

--drop table book; 테이블 삭제