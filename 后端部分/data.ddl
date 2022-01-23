drop table buy;
drop table goods;
drop table provider;
drop table orders;
drop table staff;
drop table customer;


create table customer(
	cid varchar(8) not null primary key,   
	cname varchar(20) not null,
	ctel varchar(20) not null,
	cpoints int DEFAULT 0,
	caddr varchar(64),
	cpwd varchar(20)
)default charset=utf8;

create table staff(
	sid varchar(8) not null primary key, 
	sname varchar(20) not null, 
	sex varchar(5) check (sex in ('男','女')),
	stel varchar(20) not null,
	stime int check (stime > 0)
)default charset=utf8;


create table orders(
	oid varchar(8) primary key, 
	oif_pay bool, 
	oaddr varchar(64),
	oway varchar(20),
	oif_down bool DEFAULT false,
	otime timestamp DEFAULT CURRENT_TIMESTAMP,
	sid varchar(8),
	cid varchar(8),
	foreign key(sid) references staff(sid),
	foreign key(cid) references customer(cid)
)default charset=utf8;



create table provider(
	pid varchar(8) primary key,
	pname varchar(20),
	ptel varchar(20),
	paddr varchar(64)
)default charset=utf8;


create table goods(
	gid varchar(8) not null primary key,
	gname varchar(20) not null,
	price numeric(10,2) check(price > 0),
	floor int,
	degree numeric(4,2) check(degree > 0),
	pid varchar(8),
	foreign key(pid) references provider(pid)
)default charset=utf8;


create table buy(
	oid varchar(8), 
	gid varchar(8),
	amount numeric(10,2) check(amount > 0), 
	primary key(oid,gid),
	foreign key(oid) references orders(oid),
	foreign key(gid) references goods(gid)
)default charset=utf8;

--顾客数据--
insert into customer(cid,cname,ctel,caddr,cpwd) values('1','aaa','15522703522','广东省广州市天河区花城大道53号',MD5('123456'));
insert into customer(cid,cname,ctel,caddr,cpwd) values('2','bbb','13791565930','广东省广州市天河区黄埔大道东823号',MD5('223456'));
insert into customer(cid,cname,ctel,caddr,cpwd) values('3','ccc','18459336834','广东省广州市天河区桃园南二街185号',MD5('323456'));
insert into customer(cid,cname,ctel,caddr,cpwd) values('4','ddd','18937351811','广东省广州市天河区东围镇旭景西路10号',MD5('423456'));
insert into customer(cid,cname,ctel,caddr,cpwd) values('5','eee','17135466719','广州市黄埔区港湾路554号',MD5('523456'));

--员工数据--(用了随机数生成工龄)
insert into staff(sid,sname,sex,stel,stime) values('s1','Alice','女','15917402328',round(rand()*9+1));
insert into staff(sid,sname,sex,stel,stime) values('s2','Bob','男','19915525556',round(rand()*9+1));
insert into staff(sid,sname,sex,stel,stime) values('s3','Amy','女','17650591962',round(rand()*9+1));
insert into staff(sid,sname,sex,stel,stime) values('s4','Tom','男','18595898635',round(rand()*9+1));
insert into staff(sid,sname,sex,stel,stime) values('s5','Ben','男','13704631545',round(rand()*9+1));

--订单---
insert into orders(oid,oif_pay,oaddr,oway,oif_down,cid,sid) values('10000',true,'广东省广州市天河区花城大道53号','快递',true,'1','s1');
insert into orders(oid,oif_pay,oaddr,oway,oif_down,cid,sid) values('10001',true,'广东省广州市天河区黄埔大道东823号','快递',true,'2','s3');
insert into orders(oid,oif_pay,oaddr,oway,oif_down,cid,sid) values('10002',false,'广东省广州市天河区花城大道53号','快递',false,'1','s4');
insert into orders(oid,oif_pay,oaddr,oway,oif_down,cid,sid) values('10003',true,'广东省广州市天河区花城大道53号','快递',false,'1','s1');
insert into orders(oid,oif_pay,oaddr,oway,oif_down,cid,sid) values('10004',true,'','自提',true,'4','s2');


--商品供应商数据--
insert into provider(pid,pname,ptel,paddr) values('100','日照市丽华针织服装有限公司','13706330050','山东省日照市东港区日照市开发区温州路40号');
insert into provider(pid,pname,ptel,paddr) values('101','佛山泰红运玩具有限公司','13711768183','佛山市南海区丹灶镇金沙城南工业园南达路5号3楼之二号');


--商品数据--
insert into goods(gid,gname,price,floor,degree,pid) values('1','潮牌秋季卫衣',128,'1','4.0','100');
insert into goods(gid,gname,price,floor,degree,pid) values('2','印花圆领卫衣',156,'1','4.1','100');
insert into goods(gid,gname,price,floor,degree,pid) values('3','开衫卫衣',99,'1','4.2','100');
insert into goods(gid,gname,price,floor,degree,pid) values('4','搞怪小黄鸭子布偶娃娃',9,'2','3.8','101');
insert into goods(gid,gname,price,floor,degree,pid) values('5','独角兽毛绒公仔',8.5,'3','4.1','101');

--订单-商品数据--
insert into buy(oid,gid,amount) values('10000','1',2);
insert into buy(oid,gid,amount) values('10001','1',3);
insert into buy(oid,gid,amount) values('10001','2',1);
insert into buy(oid,gid,amount) values('10001','3',1);
insert into buy(oid,gid,amount) values('10002','1',1);
insert into buy(oid,gid,amount) values('10003','5',1);
insert into buy(oid,gid,amount) values('10003','3',2);
insert into buy(oid,gid,amount) values('10004','4',1);
