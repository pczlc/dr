SET NAMES UTF8;
DROP DATABASE IF EXISTS dr;
CREATE DATABASE dr CHARSET=UTF8;
USE dr;

/*用户信息表*/
CREATE TABLE dr_user(
	uid INT PRIMARY KEY AUTO_INCREMENT,
	upwd VARCHAR(32),
	email VARCHAR(64),
	phone VARCHAR(16),
	avatar VARCHAR(128),
	user_name VARCHAR(32),
	gender INT,
	marital_status INT
);

/*收货地址表*/
CREATE TABLE dr_receiver_address(
	aid INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT,
	receiver VARCHAR(16),
	province VARCHAR(16),
	city VARCHAR(16),
	county VARCHAR(16),
	address VARCHAR(128),
	cellphone VARCHAR(16),
	tag VARCHAR(16),
	is_default BOOLEAN,
	FOREIGN KEY(user_id) REFERENCES dr_user(uid)
);

/*戒指系列表*/
CREATE TABLE dr_ring_range(
	rid INT PRIMARY KEY AUTO_INCREMENT,
	rname VARCHAR(32),
	range_img VARCHAR(128)
);

/*戒指类别表*/
CREATE TABLE dr_ring_family(
	fid INT PRIMARY KEY AUTO_INCREMENT,
	fname VARCHAR(32)
);

/*戒指表*/
CREATE TABLE dr_ring(
	rid INT PRIMARY KEY AUTO_INCREMENT,
	range_id INT,
	family_id INT,
	title VARCHAR(128),
	price DECIMAL(12,2),
	img VARCHAR(1024),
	classify VARCHAR(32),
	meterial VARCHAR(32),
	size VARCHAR(32),
	lettering VARCHAR(64),
	details VARCHAR(1024),
	sold_count INT,
	isSale BOOLEAN,
	FOREIGN KEY(range_id) REFERENCES dr_ring_range(rid),
	FOREIGN KEY(family_id) REFERENCES dr_ring_family(fid)
);

/*戒指图片表*/
CREATE TABLE dr_ring_img(
	pid INT PRIMARY KEY AUTO_INCREMENT,
	ring_id INT,
	sm VARCHAR(128),
	md VARCHAR(128),
	lg VARCHAR(128),
	FOREIGN KEY(ring_id) REFERENCES dr_ring(rid)
);

/*订单表*/
CREATE TABLE dr_order(
	oid INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT,
	address_id INT,
	ring_id INT,
	status INT,
	order_time BIGINT,
	pay_time BIGINT,
	deliver_time BIGINT,
	received_time BIGINT,
	FOREIGN KEY(user_id) REFERENCES dr_user(uid),
	FOREIGN KEY(address_id) REFERENCES dr_receiver_address(aid),
	FOREIGN KEY(ring_id) REFERENCES dr_ring(rid)
);

/*收藏夹表*/
CREATE TABLE dr_favorite(
	fid INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT,
	ring_id INT,
	FOREIGN KEY(user_id) REFERENCES dr_user(uid),
	FOREIGN KEY(ring_id) REFERENCES dr_ring(rid)
);

/*购物车表*/
CREATE TABLE dr_shopping_cart(
	oid INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT,
	ring_id INT,
  ring_title VARCHAR(128),
	ring_img VARCHAR(1024),
  ring_price DECIMAL(12,2),
	FOREIGN KEY(user_id) REFERENCES dr_user(uid),
	FOREIGN KEY(ring_id) REFERENCES dr_ring(rid)
);

/*明星表*/
CREATE TABLE dr_star(
	sid INT PRIMARY KEY AUTO_INCREMENT,
	sname VARCHAR(32),
	title VARCHAR(128),
	detail VARCHAR(2048)
);

/*明星图表*/
CREATE TABLE dr_star_img(
	pid INT PRIMARY KEY AUTO_INCREMENT,
	star_id INT,
	img VARCHAR(1024),
	FOREIGN KEY(star_id) REFERENCES dr_star(sid)
);

/*首页轮播广告表*/
CREATE TABLE dr_index_banner(
	cid INT PRIMARY KEY AUTO_INCREMENT,
	img VARCHAR(1024),
	href VARCHAR(1024)
);

/*头部系列图片表*/
CREATE TABLE dr_header_img(
  hid  INT PRIMARY KEY AUTO_INCREMENT,
  hname VARCHAR(32),
  img VARCHAR(1024),
  isLeft BOOLEAN
);

/*插入类别数据*/
INSERT INTO dr_ring_family VALUES
(null,"求婚钻戒"),(null,"结婚对戒"),
(null,"男戒"),(null,"真爱礼物");

/*插入系列数据*/
INSERT INTO dr_ring_range VALUES
(null,"LOVE LINE",null),(null,"MY HEART",null),
(null,"WITH YOU",null),(null,"WEDDING",null),
(null,"BELIEVE",null),(null,"FOREVER",null),
(null,"JUST YOU",null),(null,"TRUE LOVE",null),
(null,"PRINCESS",null),(null,"SWEETIE",null),
(null,"LOCK FOREVER",null),(null,"DR PARIS 52°",null),
(null,"D-DESTINY°",null);

/*插入商品数据*/
INSERT INTO dr_ring(range_id,family_id,title,price,img) VALUES
(1,1,"LOVE LINE系列 简奢款 30分 D色",25769,"img/products/LOVE LINE系列简奢款 30分 D色/1.jpg"),
(1,1,"LOVE LINE系列 经典款 30分 D色",18529,"img/products/LOVE LINE系列经典款 30分 D色/1.jpg"),
(1,1,"LOVE LINE系列 奢华款 100分 D色",157059,"img/products/LOVE LINE系列奢华款 100分 D色/1.jpg"),
(2,1,"MY HEART系列 简奢款 18分 H色",10719,"img/products/MY HEART系列 简奢款 18分 H色/1.jpg"),
(2,1,"MY HEART系列 心动钻戒 35分 H色",23819,"img/products/MY HEART系列 心动钻戒 35分 H色/1.jpg"),
(3,1,"WITH YOU系列 守护 30分 D色",40699,"img/products/WITH YOU系列 守护 30分 D色/1.jpg"),
(3,1,"WITH YOU系列 厮守 30分 D色",40299,"img/products/WITH YOU系列 厮守 30分 D色/1.jpg"),
(3,1,"WITH YOU系列 稀世恋人 30分 D色",50799,"img/products/WITH YOU系列 稀世恋人 30分 D色/1.jpg"),
(3,1,"WITH YOU系列 相许 30分 D色",52799,"img/products/WITH YOU系列 相许 30分 D色/1.jpg"),
(3,1,"WITH YOU系列 一生相伴 50分 D色",42099,"img/products/WITH YOU系列 一生相伴 50分 D色/1.jpg"),
(3,1,"WITH YOU系列 挚爱相随 50分",53699,"img/products/WITH YOU系列 挚爱相随 50分/1.jpg"),
(4,1,"WEDDING系列 浪漫捧花 8分 I-J色",4339,"img/products/WEDDING系列 浪漫捧花 8分 I-J色/1.jpg"),
(4,1,"WEDDING系列 幸福捧花 8分 H色",5049,"img/products/WEDDING系列 幸福捧花 8分 H色/1.jpg"),
(5,1,"BELIEVE系列 典雅 30分 H色",13009,"img/products/BELIEVE系列 典雅 50分 G色/1.jpg"),
(5,1,"BELIEVE系列 浪漫款 23分 H色",10139,"img/products/BELIEVE系列 浪漫款 23分 H色/1.jpg"),
(6,1,"FOREVER系列 甜蜜款 30分 F色",14449,"img/products/FOREVER系列 甜蜜款 30分 F色/1.jpg"),
(6,1,"FOREVER系列 挚爱款 50分 H色",23899,"img/products/FOREVER系列 挚爱款 50分 H色/1.jpg"),
(7,1,"JUST YOU系列 典雅款 30分 G色",17819,"img/products/JUST YOU系列典雅款 30分 G色/1.jpg"),
(7,1,"JUST YOU系列 简奢款 18分 H色",7419,"img/products/JUST YOU系列简奢款 18分 H色/1.jpg"),
(8,1,"TRUE LOVE系列 美满款 10分 H色",3879,"img/products/TRUE LOVE系列 美满款 10分 H色/1.jpg"),
(8,1,"TRUE LOVE系列 坚定爱 17分 I-J色",8089,"img/products/TRUE LOVE系列 坚定爱 17分 I-J色/1.jpg"),
(8,1,"TRUE LOVE系列 勇敢爱 5分 H色",5729,"img/products/TRUE LOVE系列 勇敢爱 5分 H色/1.png"),
(9,1,"PRINCESS系列 爱侣",7399,"img/products/PRINCESS系列 爱侣/1.jpg"),
(9,1,"PRINCESS系列 圆满",15899,"img/products/PRINCESS系列 圆满/1.jpg"),
(10,1,"SWEETIE系列 一心相恋 8分 I-J色",3039,"img/products/SWEETIE系列 一心相恋 8分 I-J色/1.png"),
(11,1,"LOCK FOREVER系列 心·锁永恒 40分 H色",19599,"img/products/LOCK FOREVER系列 心·锁永恒 40分 H色/1.jpg"),
(11,1,"LOCK FOREVER系列 心·锁唯一 50分 D色",44359,"img/products/LOCK FOREVER系列 心·锁唯一 50分 D色/1.jpg"),
(12,1,"DR PARIS 52°系列 挚爱款 50分 H色",46899,"img/products/DR PARIS 52°系列 挚爱款 50分 H色/1.jpg"),
(13,1,"D-DESTINY系列 经典款钻戒",6520,"img/products/D-DESTINY系列 经典款钻戒/1.jpg");

/*插入商品图片数据*/
INSERT INTO dr_ring_img(ring_id,md) VALUES
(1,"img/products/LOVE LINE系列简奢款 30分 D色/1.jpg"),
(1,"img/products/LOVE LINE系列简奢款 30分 D色/2.jpg"),
(1,"img/products/LOVE LINE系列简奢款 30分 D色/3.jpg"),
(1,"img/products/LOVE LINE系列简奢款 30分 D色/4.jpg"),
(1,"img/products/LOVE LINE系列简奢款 30分 D色/5.png"),
(2,"img/products/LOVE LINE系列经典款 30分 D色/1.jpg"),
(2,"img/products/LOVE LINE系列经典款 30分 D色/2.jpg"),
(2,"img/products/LOVE LINE系列经典款 30分 D色/3.jpg"),
(2,"img/products/LOVE LINE系列经典款 30分 D色/4.jpg"),
(2,"img/products/LOVE LINE系列经典款 30分 D色/5.png"),
(3,"img/products/LOVE LINE系列奢华款 100分 D色/1.jpg"),
(3,"img/products/LOVE LINE系列奢华款 100分 D色/2.jpg"),
(3,"img/products/LOVE LINE系列奢华款 100分 D色/3.jpg"),
(3,"img/products/LOVE LINE系列奢华款 100分 D色/4.png"),
(4,"img/products/MY HEART系列 简奢款 18分 H色/1.jpg"),
(4,"img/products/MY HEART系列 简奢款 18分 H色/2.jpg"),
(4,"img/products/MY HEART系列 简奢款 18分 H色/3.jpg"),
(4,"img/products/MY HEART系列 简奢款 18分 H色/4.jpg"),
(4,"img/products/MY HEART系列 简奢款 18分 H色/5.jpg"),
(5,"img/products/MY HEART系列 心动钻戒 35分 H色/1.jpg"),
(5,"img/products/MY HEART系列 心动钻戒 35分 H色/2.jpg"),
(5,"img/products/MY HEART系列 心动钻戒 35分 H色/3.jpg"),
(5,"img/products/MY HEART系列 心动钻戒 35分 H色/4.jpg"),
(5,"img/products/MY HEART系列 心动钻戒 35分 H色/5.png"),
(6,"img/products/WITH YOU系列 守护 30分 D色/1.jpg"),
(6,"img/products/WITH YOU系列 守护 30分 D色/2.jpg"),
(6,"img/products/WITH YOU系列 守护 30分 D色/3.jpg"),
(6,"img/products/WITH YOU系列 守护 30分 D色/4.png"),
(7,"img/products/WITH YOU系列 厮守 30分 D色/1.jpg"),
(7,"img/products/WITH YOU系列 厮守 30分 D色/2.jpg"),
(7,"img/products/WITH YOU系列 厮守 30分 D色/3.jpg"),
(7,"img/products/WITH YOU系列 厮守 30分 D色/4.png"),
(8,"img/products/WITH YOU系列 稀世恋人 30分 D色/1.jpg"),
(8,"img/products/WITH YOU系列 稀世恋人 30分 D色/2.jpg"),
(8,"img/products/WITH YOU系列 稀世恋人 30分 D色/3.jpg"),
(8,"img/products/WITH YOU系列 稀世恋人 30分 D色/4.jpg"),
(9,"img/products/WITH YOU系列 相许 30分 D色/1.jpg"),
(9,"img/products/WITH YOU系列 相许 30分 D色/2.jpg"),
(9,"img/products/WITH YOU系列 相许 30分 D色/3.jpg"),
(9,"img/products/WITH YOU系列 相许 30分 D色/4.png"),
(10,"img/products/WITH YOU系列 一生相伴 50分 D色/1.jpg"),
(10,"img/products/WITH YOU系列 一生相伴 50分 D色/2.jpg"),
(10,"img/products/WITH YOU系列 一生相伴 50分 D色/3.jpg"),
(10,"img/products/WITH YOU系列 一生相伴 50分 D色/4.jpg"),
(11,"img/products/WITH YOU系列 挚爱相随 50分/1.jpg"),
(11,"img/products/WITH YOU系列 挚爱相随 50分/2.jpg"),
(11,"img/products/WITH YOU系列 挚爱相随 50分/3.jpg"),
(11,"img/products/WITH YOU系列 挚爱相随 50分/4.jpg"),
(11,"img/products/WITH YOU系列 挚爱相随 50分/5.jpg"),
(12,"img/products/WEDDING系列 浪漫捧花 8分 I-J色/1.jpg"),
(12,"img/products/WEDDING系列 浪漫捧花 8分 I-J色/2.jpg"),
(12,"img/products/WEDDING系列 浪漫捧花 8分 I-J色/3.jpg"),
(12,"img/products/WEDDING系列 浪漫捧花 8分 I-J色/4.jpg"),
(12,"img/products/WEDDING系列 浪漫捧花 8分 I-J色/5.png"),
(13,"img/products/WEDDING系列 幸福捧花 8分 H色/1.jpg"),
(13,"img/products/WEDDING系列 幸福捧花 8分 H色/2.jpg"),
(13,"img/products/WEDDING系列 幸福捧花 8分 H色/3.jpg"),
(13,"img/products/WEDDING系列 幸福捧花 8分 H色/4.jpg"),
(13,"img/products/WEDDING系列 幸福捧花 8分 H色/5.png"),
(14,"img/products/BELIEVE系列 典雅 50分 G色/1.jpg"),
(14,"img/products/BELIEVE系列 典雅 50分 G色/2.jpg"),
(14,"img/products/BELIEVE系列 典雅 50分 G色/3.jpg"),
(14,"img/products/BELIEVE系列 典雅 50分 G色/4.jpg"),
(14,"img/products/BELIEVE系列 典雅 50分 G色/5.jpg"),
(15,"img/products/BELIEVE系列 浪漫款 23分 H色/1.jpg"),
(15,"img/products/BELIEVE系列 浪漫款 23分 H色/2.jpg"),
(15,"img/products/BELIEVE系列 浪漫款 23分 H色/3.jpg"),
(15,"img/products/BELIEVE系列 浪漫款 23分 H色/4.jpg"),
(15,"img/products/BELIEVE系列 浪漫款 23分 H色/5.png"),
(15,"img/products/FOREVER系列 甜蜜款 30分 F色/1.jpg"),
(16,"img/products/FOREVER系列 甜蜜款 30分 F色/2.jpg"),
(16,"img/products/FOREVER系列 甜蜜款 30分 F色/3.jpg"),
(16,"img/products/FOREVER系列 甜蜜款 30分 F色/4.jpg"),
(16,"img/products/FOREVER系列 甜蜜款 30分 F色/5.png"),
(17,"img/products/FOREVER系列 挚爱款 50分 H色/1.jpg"),
(17,"img/products/FOREVER系列 挚爱款 50分 H色/2.jpg"),
(17,"img/products/FOREVER系列 挚爱款 50分 H色/3.jpg"),
(17,"img/products/FOREVER系列 挚爱款 50分 H色/4.png"),
(18,"img/products/JUST YOU系列典雅款 30分 G色/1.jpg"),
(18,"img/products/JUST YOU系列典雅款 30分 G色/2.jpg"),
(18,"img/products/JUST YOU系列典雅款 30分 G色/3.jpg"),
(18,"img/products/JUST YOU系列典雅款 30分 G色/4.jpg"),
(18,"img/products/JUST YOU系列典雅款 30分 G色/5.jpg"),
(19,"img/products/JUST YOU系列简奢款 18分 H色/1.jpg"),
(19,"img/products/JUST YOU系列简奢款 18分 H色/2.jpg"),
(19,"img/products/JUST YOU系列简奢款 18分 H色/3.jpg"),
(19,"img/products/JUST YOU系列简奢款 18分 H色/4.jpg"),
(19,"img/products/JUST YOU系列简奢款 18分 H色/5.png"),
(20,"img/products/TRUE LOVE系列 坚定爱 17分 I-J色/1.jpg"),
(20,"img/products/TRUE LOVE系列 坚定爱 17分 I-J色/2.png"),
(20,"img/products/TRUE LOVE系列 坚定爱 17分 I-J色/3.jpg"),
(21,"img/products/TRUE LOVE系列 美满款 10分 H色/1.jpg"),
(21,"img/products/TRUE LOVE系列 美满款 10分 H色/2.jpg"),
(21,"img/products/TRUE LOVE系列 美满款 10分 H色/3.jpg"),
(21,"img/products/TRUE LOVE系列 美满款 10分 H色/4.jpg"),
(22,"img/products/TRUE LOVE系列 勇敢爱 5分 H色/1.png"),
(22,"img/products/TRUE LOVE系列 勇敢爱 5分 H色/2.jpg"),
(22,"img/products/TRUE LOVE系列 勇敢爱 5分 H色/3.jpg"),
(23,"img/products/PRINCESS系列 爱侣/1.jpg"),
(23,"img/products/PRINCESS系列 爱侣/2.jpg"),
(23,"img/products/PRINCESS系列 爱侣/3.jpg"),
(23,"img/products/PRINCESS系列 爱侣/4.jpg"),
(23,"img/products/PRINCESS系列 爱侣/5.png"),
(24,"img/products/PRINCESS系列 圆满/1.jpg"),
(24,"img/products/PRINCESS系列 圆满/2.jpg"),
(24,"img/products/PRINCESS系列 圆满/3.jpg"),
(24,"img/products/PRINCESS系列 圆满/4.png"),
(25,"img/products/SWEETIE系列 一心相恋 8分 I-J色/1.png"),
(25,"img/products/SWEETIE系列 一心相恋 8分 I-J色/2.jpg"),
(25,"img/products/SWEETIE系列 一心相恋 8分 I-J色/3.jpg"),
(25,"img/products/SWEETIE系列 一心相恋 8分 I-J色/4.jpg"),
(25,"img/products/SWEETIE系列 一心相恋 8分 I-J色/5.jpg"),
(26,"img/products/LOCK FOREVER系列 心·锁唯一 50分 D色/1.jpg"),
(26,"img/products/LOCK FOREVER系列 心·锁唯一 50分 D色/2.jpg"),
(26,"img/products/LOCK FOREVER系列 心·锁唯一 50分 D色/3.jpg"),
(26,"img/products/LOCK FOREVER系列 心·锁唯一 50分 D色/4.png"),
(27,"img/products/LOCK FOREVER系列 心·锁永恒 40分 H色/1.jpg"),
(27,"img/products/LOCK FOREVER系列 心·锁永恒 40分 H色/2.jpg"),
(27,"img/products/LOCK FOREVER系列 心·锁永恒 40分 H色/3.jpg"),
(27,"img/products/LOCK FOREVER系列 心·锁永恒 40分 H色/4.jpg"),
(27,"img/products/LOCK FOREVER系列 心·锁永恒 40分 H色/5.png"),
(28,"img/products/DR PARIS 52°系列 挚爱款 50分 H色/1.jpg"),
(28,"img/products/DR PARIS 52°系列 挚爱款 50分 H色/2.jpg"),
(28,"img/products/DR PARIS 52°系列 挚爱款 50分 H色/3.jpg"),
(28,"img/products/DR PARIS 52°系列 挚爱款 50分 H色/4.jpg"),
(28,"img/products/DR PARIS 52°系列 挚爱款 50分 H色/5.jpg"),
(29,"img/products/D-DESTINY系列 经典款钻戒/1.jpg"),
(29,"img/products/D-DESTINY系列 经典款钻戒/2.jpg"),
(29,"img/products/D-DESTINY系列 经典款钻戒/3.jpg"),
(29,"img/products/D-DESTINY系列 经典款钻戒/4.jpg");

/*插入头部数据*/
INSERT INTO dr_header_img VALUES
(null,"稀世粉钻","img/products/稀世粉钻/1.jpg",1),
(null,"MY HEART 系列","img/products/MY HEART系列 心动钻戒 35分 H色/1.jpg",1),
(null,"BELIEVE 系列","img/products/BELIEVE系列 典雅 50分 G色/1.jpg",1),
(null,"FOREVER 系列","img/products/FOREVER系列 甜蜜款 30分 F色/1.jpg",1),
(null,"DR PARIS 52° 系列","img/products/DR PARIS 52°系列 挚爱款 50分 H色/1.jpg",1),
(null,"D-DESTINY 系列","img/products/D-DESTINY系列 经典款钻戒/1.jpg",1),
(null,"查看全部商品","img/products/WEDDING系列 浪漫捧花 8分 I-J色/1.jpg",1),
(null,"LOVE LINE 系列","img/products/LOVE LINE系列简奢款 30分 D色/1.jpg",0),
(null,"TRUE LOVE 系列","img/products/TRUE LOVE系列 坚定爱 17分 I-J色/1.jpg",0),
(null,"PRINCESS 系列","img/products/PRINCESS系列 爱侣/1.jpg",0),
(null,"LOCK FOREVER系列","img/products/LOCK FOREVER系列 心·锁唯一 50分 D色/1.jpg",0);

/*插入轮播数据*/
INSERT INTO dr_index_banner VALUES
(null,"img/index/15609380435d0a063b37508.jpg",null),
(null,"img/index/15414875845be13be0a0a14.jpg",null),
(null,"img/index/15597244445cf7819ca6104.jpg",null);

/*插入用户数据*/
INSERT INTO dr_user(phone,email,user_name,upwd) VALUES
("18912345678","abc@123.com","lalala","a123456");