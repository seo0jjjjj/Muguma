create database muguma_db;	
use muguma_db;

#유저 관리 테이블 
create table user (
   uid int default 1,
    userID varchar(20) unique,
    userPassword varchar(20),
    userName varchar(20),
   userEmail varchar(20),
    userTel varchar(13),
    userAddress varchar(50),
    Sex varchar(5),
	authority varchar(10),
    primary key(uid)

);

#게시판 관리 테이블 
create table border(
   bid int default 1,
    title varchar(20),
    userID varchar(10),
    content varchar(200),
    date date,
    primary key(bid)
);

#상품 관리 테이블 
create table product(
   pid int default 1,
    productName varchar(10),
    productCategory varchar(10),
    price int,
    productDescript varchar(200),
    primary key(pid)
);



#장바구니 관리 테이블
create table basket(
    uid int,
    pid int,
    userName varchar(10),
    date date,
    primary key(uid,pid),
    foreign key(uid) references user(uid)on update cascade on delete cascade,
    foreign key(pid) references product(pid) on update cascade on delete cascade
);


INSERT INTO product (`pid`, `productName`, `productCategory`, `price`, `productDescript`) VALUES ('1', '페인트', '수채화,페인트', '1000', 'Edith Luethi');
INSERT INTO product (`pid`, `productName`, `productCategory`, `price`, `productDescript`) VALUES ('2', '바다', '수채화,페인트', '2000', 'garageband');
INSERT INTO product (`pid`, `productName`, `productCategory`, `price`, `productDescript`) VALUES ('3', '농부', '풍경,사진', '5000', 'Mạnh Nguyễn Hồng');
INSERT INTO product (`pid`, `productName`, `productCategory`, `price`, `productDescript`) VALUES ('4', '꽃 액자', '일러스트', '70000', 'kereny');
INSERT INTO product (`pid`, `productName`, `productCategory`, `price`, `productDescript`) VALUES ('5', '공작새', '사진,동물', '11200', 'garageband');
INSERT INTO product (`pid`, `productName`, `productCategory`, `price`, `productDescript`) VALUES ('6', '박물관', '사진,동물', '10000', 'iankelsall1');
INSERT INTO product (`pid`, `productName`, `productCategory`, `price`, `productDescript`) VALUES ('7', 'women', '수채화,페인트', '30000', 'Martina_Bulkova');
INSERT INTO product (`pid`, `productName`, `productCategory`, `price`, `productDescript`) VALUES ('8', '제목없음', '수채화,페인트', '4000', 'eluela31');
INSERT INTO product (`pid`, `productName`, `productCategory`, `price`, `productDescript`) VALUES ('9', '추상적인 페인트', '수채화,페인트', '60000', 'edith lüthi');
INSERT INTO product (`pid`, `productName`, `productCategory`, `price`, `productDescript`) VALUES ('10', '추상적인 페인트', '수채화,페인트', '80000', 'eluela31');
INSERT INTO product (`pid`, `productName`, `productCategory`, `price`, `productDescript`) VALUES ('11', '여름', '일러스트,풍경', '10000', 'Aurélien Dumont');
INSERT INTO product (`pid`, `productName`, `productCategory`, `price`, `productDescript`) VALUES ('12', 'tropical', '일러스트,풍경', '100', 'Pete Linforth');
INSERT INTO product (`pid`, `productName`, `productCategory`, `price`, `productDescript`) VALUES ('13', '고양이', '사진,동물', '10000', ' Sid Lee');
INSERT INTO product (`pid`, `productName`, `productCategory`, `price`, `productDescript`) VALUES ('14', '고양이2', '수채화,페인트', '1000', 'cocoparisienne');
    
INSERT INTO user (`uid`, `userID`, `userPassword`, `userName`, `userEmail`, `userTel`, `userAddress`, `Sex`, `authority`) VALUES ('1', 'admin', '1234', '무그마관리자', 'hoseo@123.com', '010-1234-5678', '천안시', 'M', 'admin');
INSERT INTO user (`uid`, `userID`, `userPassword`, `userName`, `userEmail`, `userTel`, `userAddress`, `Sex`, `authority`) VALUES ('2', 'user', '1234', '사용자', 'hoseo@123.com', '010-5678-9101', '울산시', 'W', 'user');
