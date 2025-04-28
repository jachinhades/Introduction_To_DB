--删除数据库
if exists(select * from sys.databases where name = 'DBTEST')
	drop database DBTEST

--创建数据库
create database DBTEST
on
(
	name = 'DBTEST',
	filename = 'D:\Data\DBTEST.mdf',
	size = 5MB,
	filegrowth = 2MB
)
log on
(
	name = 'DBTEST_log',
	filename = 'D:\Data\DBTEST_log.ldf',
	size = 5MB,
	filegrowth = 2MB
)

--创建数据库
create database DBTEST
go
use DBTEST
--删除表
drop table Department
--建表
create table Department --创建部门表
(
	DepartmentId int primary key identity(1,1),
	DepartmentName nvarchar(50) not null,
	DepartmentRemark text
)

drop table [Rank]
create table [Rank]
(
	RankId int primary key identity(1,1),
	RankName nvarchar(50) not null,
	RankRemark text
)

drop table People
create table People
(
	PeopleId int primary key identity(1,1),
	DepartmentId int references Department(DepartmentId)  not null,
	RankId int references [Rank](RankId) not null,
	PeopleName nvarchar(50) not null,
	PeopleSex nvarchar(1) default('男') check(PeopleSex='男' or PeopleSex='女') not null,
	PeopleBirth datetime not null,
	PeopleSalary decimal(12,2) check(PeopleSalary>= 1000 and PeopleSalary <= 100000) not null,
	PeoplePhone nvarchar(20) unique not null,
	PeopleAddress nvarchar(100),
	PeopleAddTime smalldatetime default(getdate())
)

--修改表结构
--员工表添加邮箱
alter table People
add PeopleMail nvarchar(100)
--员工表删除邮箱列
alter table People
drop column PeopleMail
--修改邮箱列的数据类型为varchar(100)
alter table People
alter column PeopleMail varchar(100)




