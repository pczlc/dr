SET NAMES UTF8;
DROP DATABASE IF EXISTS dr;
CREATE DATABASE dr CHARSET=UTF8;
USE dr;

/*用户信息表*/
CREATE TABLE dr_user(
	uid INT PRIMARY KEY AUTO_INCREMENT,
	uname VARCHAR(32),
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
	name VARCHAR(32),
	range_pic VARCHAR(128)
);

/*戒指类别表*/
CREATE TABLE dr_ring_family(
	fid INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(32)
);

/*戒指表*/
CREATE TABLE dr_ring(
	rid INT PRIMARY KEY AUTO_INCREMENT,
	range_id INT,
	family_id INT,
	title VARCHAR(128),
	price DECIMAL(12,2),
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
CREATE TABLE dr_ring_pic(
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
	FOREIGN KEY(user_id) REFERENCES dr_user(uid),
	FOREIGN KEY(ring_id) REFERENCES dr_ring(rid)
);

/*明星表*/
CREATE TABLE dr_star(
	sid INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(32),
	title VARCHAR(128),
	detail VARCHAR(2048)
);

/*明星图表*/
CREATE TABLE dr_star_pic(
	pid INT PRIMARY KEY AUTO_INCREMENT,
	star_id INT,
	img VARCHAR(1024),
	FOREIGN KEY(star_id) REFERENCES dr_star(sid)
);

/*首页轮播广告表*/
CREATE TABLE dr_index_carousel(
	cid INT PRIMARY KEY AUTO_INCREMENT,
	img VARCHAR(1024),
	title VARCHAR(64),
	href VARCHAR(1024)
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
INSERT INTO dr_ring(range_id,family_id,title,price) VALUES
(1,1,"LOVE LINE系列 简奢款 30分 D色",25769),
(1,1,"LOVE LINE系列 经典款 30分 D色",18529),
(1,1,"LOVE LINE系列 奢华款 100分 D色",157059),
(2,1,"MY HEART系列 简奢款 18分 H色",10719),
(2,1,"MY HEART系列 心动钻戒 35分 H色",23819),
(3,1,"WITH YOU系列 守护 30分 D色",40699),
(3,1,"WITH YOU系列 厮守 30分 D色",40299),
(3,1,"WITH YOU系列 稀世恋人 30分 D色",50799),
(3,1,"WITH YOU系列 相许 30分 D色",52799),
(3,1,"WITH YOU系列 一生相伴 50分 D色",42099),
(3,1,"WITH YOU系列 挚爱相随 50分",53699),
(4,1,"WEDDING系列 浪漫捧花 8分 I-J色",4339),
(4,1,"WEDDING系列 幸福捧花 8分 H色",5049),
(5,1,"BELIEVE系列 典雅 30分 H色",13009),
(5,1,"BELIEVE系列 浪漫款 23分 H色",10139),
(6,1,"FOREVER系列 甜蜜款 30分 F色",14449),
(6,1,"FOREVER系列 挚爱款 50分 H色",23899),
(7,1,"JUST YOU系列 典雅款 30分 G色",17819),
(7,1,"JUST YOU系列 简奢款 18分 H色",7419),
(8,1,"TRUE LOVE系列 美满款 10分 H色",3879),
(8,1,"TRUE LOVE系列 坚定爱 17分 I-J色",8089),
(8,1,"TRUE LOVE系列 勇敢爱 5分 H色",5729),
(9,1,"PRINCESS系列 爱侣",7399),
(9,1,"PRINCESS系列 圆满",15899),
(10,1,"SWEETIE系列 一心相恋 8分 I-J色",3039),
(11,1,"LOCK FOREVER系列 心·锁永恒 40分 H色",19599),
(11,1,"LOCK FOREVER系列 心·锁唯一 50分 D色",44359),
(12,1,"DR PARIS 52°系列 挚爱款 50分 H色",46899),
(13,1,"D-DESTINY系列 经典款钻戒",6520);