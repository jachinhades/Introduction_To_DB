--向部门表添加数据
insert into Department(DepartmentName,DepartmentRemark)
values('软件部','......')
insert into Department(DepartmentName,DepartmentRemark)
values('硬件部','......')
insert into Department(DepartmentName,DepartmentRemark)
values('市场部','......')


--向职级表添加数据
insert into [Rank](RankName,RankRemark)
values('初级','辅助其他人完成任务')
insert into [Rank](RankName,RankRemark)
values('中级','具备上单中单能力')
insert into [Rank](RankName,RankRemark)
values('高级','可以带动全场节奏')


--向员工表添加数据
insert into People(DepartmentId,RankId,PeopleName,PeopleSex,PeopleBirth,
PeopleSalary,PeoplePhone,PeopleAddress,PeopleAddTime)
values(1,3,'刘备','男','1984-7-9',20000,'13554785452','成都',getdate())

insert into People(DepartmentId,RankId,PeopleName,PeopleSex,PeopleBirth,
PeopleSalary,PeoplePhone,PeopleAddress,PeopleAddTime)
values(1,2,'孙尚香','女','1987-7-9',15000,'13256854578','荆州',getdate())

insert into People(DepartmentId,RankId,PeopleName,PeopleSex,PeopleBirth,
PeopleSalary,PeoplePhone,PeopleAddress,PeopleAddTime)
values(1,1,'关羽','男','1988-8-8',12000,'13985745871','荆州',getdate())

insert into People(DepartmentId,RankId,PeopleName,PeopleSex,PeopleBirth,
PeopleSalary,PeoplePhone,PeopleAddress,PeopleAddTime)
values(2,1,'张飞','男','1990-8-8',8000,'13535987412','宜昌',getdate())

insert into People(DepartmentId,RankId,PeopleName,PeopleSex,PeopleBirth,
PeopleSalary,PeoplePhone,PeopleAddress,PeopleAddTime)
values(2,3,'赵云','男','1989-4-8',9000,'13845789568','宜昌',getdate())

insert into People(DepartmentId,RankId,PeopleName,PeopleSex,PeopleBirth,
PeopleSalary,PeoplePhone,PeopleAddress,PeopleAddTime)
values(3,3,'马超','男','1995-4-8',9500,'13878562568','香港',getdate())

insert into People(DepartmentId,RankId,PeopleName,PeopleSex,PeopleBirth,
PeopleSalary,PeoplePhone,PeopleAddress,PeopleAddTime)
values(3,2,'黄盖','男','1989-4-20',8500,'13335457412','武汉',getdate())

insert into People(DepartmentId,RankId,PeopleName,PeopleSex,PeopleBirth,
PeopleSalary,PeoplePhone,PeopleAddress,PeopleAddTime)
values(3,1,'貂蝉','女','1989-4-20',6500,'13437100050','武汉',getdate())

insert into People(DepartmentId,RankId,PeopleName,PeopleSex,PeopleBirth,
PeopleSalary,PeoplePhone,PeopleAddress,PeopleAddTime)
values(2,2,'曹操','男','1987-12-20',25000,'13889562354','北京',getdate())

insert into People(DepartmentId,RankId,PeopleName,PeopleSex,PeopleBirth,
PeopleSalary,PeoplePhone,PeopleAddress,PeopleAddTime)
values(2,3,'许褚','男','1981-11-11',9000,'13385299632','北京',getdate())

insert into People(DepartmentId,RankId,PeopleName,PeopleSex,PeopleBirth,
PeopleSalary,PeoplePhone,PeopleAddress,PeopleAddTime)
values(2,1,'典韦','男','1978-1-13',8000,'13478545263','上海',getdate())

insert into People(DepartmentId,RankId,PeopleName,PeopleSex,PeopleBirth,
PeopleSalary,PeoplePhone,PeopleAddress,PeopleAddTime)
values(1,1,'曹仁','男','1998-12-12',7500,'13878523695','深圳',getdate())

insert into People(DepartmentId,RankId,PeopleName,PeopleSex,PeopleBirth,
PeopleSalary,PeoplePhone,PeopleAddress,PeopleAddTime)
values(1,3,'孙坚','男','1968-11-22',9000,'13698545841','广州',getdate())

insert into People(DepartmentId,RankId,PeopleName,PeopleSex,PeopleBirth,
PeopleSalary,PeoplePhone,PeopleAddress,PeopleAddTime)
values(3,3,'孙策','男','1988-1-22',11000,'13558745874','深圳',getdate())

insert into People(DepartmentId,RankId,PeopleName,PeopleSex,PeopleBirth,
PeopleSalary,PeoplePhone,PeopleAddress,PeopleAddTime)
values(3,2,'孙权','男','1990-2-21',12000,'13698745214','深圳',getdate())

insert into People(DepartmentId,RankId,PeopleName,PeopleSex,PeopleBirth,
PeopleSalary,PeoplePhone,PeopleAddress,PeopleAddTime)
values(3,2,'大乔','女','1995-2-21',13000,'13985478512','上海',getdate())

insert into People(DepartmentId,RankId,PeopleName,PeopleSex,PeopleBirth,
PeopleSalary,PeoplePhone,PeopleAddress,PeopleAddTime)
values(2,1,'小乔','女','1996-2-21',13500,'13778787874','北京',getdate())

insert into People(DepartmentId,RankId,PeopleName,PeopleSex,PeopleBirth,
PeopleSalary,PeoplePhone,PeopleAddress,PeopleAddTime)
values(1,2,'周瑜','男','1992-10-11',8000,'13987455214','武汉',getdate())

insert into People(DepartmentId,RankId,PeopleName,PeopleSex,PeopleBirth,
PeopleSalary,PeoplePhone,PeopleAddress,PeopleAddTime)
values(2,3,'鲁肃','男','1984-9-10',5500,'13254785965','成都',getdate())

insert into People(DepartmentId,RankId,PeopleName,PeopleSex,PeopleBirth,
PeopleSalary,PeoplePhone,PeopleAddress,PeopleAddTime)
values(3,3,'吕蒙','男','1987-5-19',8500,'13352197364','成都',getdate())

insert into People(DepartmentId,RankId,PeopleName,PeopleSex,PeopleBirth,
PeopleSalary,PeoplePhone,PeopleAddress,PeopleAddTime)
values(1,1,'陆逊','男','1996-5-19',7500,'13025457392','南京',getdate())

insert into People(DepartmentId,RankId,PeopleName,PeopleSex,PeopleBirth,
PeopleSalary,PeoplePhone,PeopleAddress,PeopleAddTime)
values(1,2,'太史慈','男','1983-6-1',7500,'13077778888','上海',getdate())

insert into People(DepartmentId,RankId,PeopleName,PeopleSex,PeopleBirth,
PeopleSalary,PeoplePhone,PeopleAddress,PeopleAddTime)
values(1,2,'aaaa','男','1983-6-1',7500,'13077778888','上海',getdate())

select * from Department
select * from [Rank]
select * from People 



--插入数据简写
--插入数据（简写语法）(软件研发部)（不推荐使用-数据表结构变化的时候，数据会出错）
insert into Department values('软件研发部','公司核心部门')

--一次插入多行数据
--插入多行数据
insert into Department(DepartmentName,DepartmentRemark)
select '市场部','什么都不懂，只知道吹牛' union
select '产品部','。。。。。' union
select '总经办','都是领导' 




