show tables;

/* 신고 테이블(claim) */
create table claim(
  idx  int not null auto_increment,	/* 신고테이블 고유번호 */
  part varchar(15) not null,				/* 신고분류(게시판:board, 자료실:pds, 방명록:guest) */
  partIdx int not null,							/* 신고분류항목 글의 고유번호 */
  claimMid varchar(30) not null,		/* 신고자 아이디 */
  claimContent text not null,				/* 신고 사유 */
  claimDate datetime default now(),	/* 신고한 날짜 */
  primary key(idx),
  foreign key(partIdx) references board(idx) on update cascade on delete cascade
);
desc claim;

-- 외래키 추가하기
alter table claim add constraint foreign key(partIdx) references board(idx) on update cascade on delete cascade

insert into claim values (default, 'board', 15, 'hkd1234', '광고,홍보,영리목적', default);

select * from claim;

select c.*, b.title, b.nickName, b.mid from claim c, board b where c.partIdx = b.idx;

select c.*, b.title as title, b.nickName as nickName, b.mid as mid from claim c, board b where c.partIdx = b.idx;

delete from claim where idx = 10;
