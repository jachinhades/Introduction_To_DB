--表与表的关系
--1.一对多关系（专业--学生）
--create table Profession  --专业
--(
--	ProId int primary key identity(1,1), --专业编号
--	ProName varchar(50) not null --专业名称
--)
--create table Student --学生
--(
--	StuId int primary key identity(1,1), --学生编号
--	ProId int references Profession(ProId),
--	StuName varchar(50) not null, --学生名字
--	StuSex char(2) not null --学生性别
--)
--insert into Profession(ProName) values('软件开发')
--insert into Profession(ProName) values('企业信息化')
--insert into Student(ProId,StuName,StuSex) values(1,'刘备','男')
--insert into Student(ProId,StuName,StuSex) values(1,'关羽','男')
--insert into Student(ProId,StuName,StuSex) values(2,'张飞','男')
--insert into Student(ProId,StuName,StuSex) values(2,'赵云','男')
--select * from Student left join Profession on Student.ProId = Profession.ProId
----------------------------------------------------------------------------------------------------------------------------


--2.一对一关系（学生基本信息--学生详情）
--方案一：
--create table StudentBasicInfo  --学生基本信息
--(
--	StuNo varchar(20) primary key not null,  --学号
--	StuName varchar(20) not null, --姓名
--	StuSex nvarchar(1) not null  --性别
--)
--create table StudentDetailInfo  --学生详细信息
--(
--	StuNo varchar(20) primary key not null,
--	StuQQ varchar(20), --QQ
--	stuPhone varchar(20), --电话
--	StuMail varchar(100), --邮箱
--	StuBirth date         --生日
--)
--插入数据的时候按照顺序先插入刘备的基本信息，在插入关羽的基本信息
--insert into StudentBasicInfo(StuNo,StuName,StuSex) values('QH001','刘备','男')
--insert into StudentBasicInfo(StuNo,StuName,StuSex) values('QH002','关羽','男')
--插入数据的时候按照顺序先插入关羽的详细信息，在插入刘备的详细信息
--insert into StudentDetailInfo(StuNo,StuQQ,stuPhone,StuMail,StuBirth)
--values('QH002','156545214','13654525478','guanyu@163.com','1996-6-6')
--insert into StudentDetailInfo(StuNo,StuQQ,stuPhone,StuMail,StuBirth)
--values('QH001','186587854','15326545214','liubei@163.com','1998-8-8')

--或者如下结构也行：
--create table StudentBasicInfo  --学生基本信息
--(
--	StuNo int primary key identity(1,1),  --学号
--	StuName varchar(20) not null, --姓名
--	StuSex nvarchar(1) not null  --性别
--)
--create table StudentDetailInfo  --学生详细信息
--(
--	StuNo int primary key,  --学号
--	StuQQ varchar(20), --QQ
--	stuPhone varchar(20), --电话
--	StuMail varchar(100), --邮箱
--	StuBirth date         --生日
--)
--注意，在学生详情表中的主键不能自动增长，自动增长则不能向方案一的顺序添加数据


--方案二：
--create table StudentBasicInfo  --学生基本信息
--(
--	StuNo int primary key identity(1,1),  --学号
--	StuName varchar(20) not null, --姓名
--	StuSex nvarchar(1) not null  --性别
--)
--create table StudentDetailInfo  --学生详细信息
--(
--	StuDetailNo int primary key identity(1,1),  --详细信息编号
--	StuNo int references StudentBasicInfo(StuNo) --学号,外键
--	StuQQ varchar(20), --QQ
--	stuPhone varchar(20), --电话
--	StuMail varchar(100), --邮箱
--	StuBirth date         --生日
--)
--可以使用一对多的模式来表示一对一，保证多的表中只有一条对应数据即可
--select * from StudentBasicInfo left join StudentDetailInfo 
--on StudentBasicInfo.StuNo = StudentDetailInfo.StuNo
------------------------------------------------------------------------------------------------------------------


--3.多对多关系（选课成绩--学生）
--create table Course --课程
--(
--	CourseId int primary key identity(1,1),--课程编号
--	CourseName varchar(30) not null, --课程名称
--	CourseContent text --课程介绍
--)
--insert into Course(CourseName,CourseContent) values('HTML','静态网页的制作')
--insert into Course(CourseName,CourseContent) values('WinForm','Windows应用程序开发')

--create table Student --学生
--(
--	StuId int primary key identity(1,1), --学生编号
--	StuName varchar(50) not null, --学生名字
--	StuSex char(2) not null --学生性别
--)
--insert into Student(StuName,StuSex) values('刘备','男')
--insert into Student(StuName,StuSex) values('关羽','男')

--create Table Exam --考试信息表
--(
--	ExamId int primary key identity(1,1), --选课成绩编号
--	StuId int not null, --学生编号
--	CourseId int not null,  --课程编号
--	Score int not null, --考试分数
--)
--insert into Exam(StuId,CourseId,Score) values(1,1,90)
--insert into Exam(StuId,CourseId,Score) values(1,2,80)
--insert into Exam(StuId,CourseId,Score) values(2,2,85)

--select * from Exam
--select * from Student inner join Exam on Student.StuId = Exam.StuId
--inner join Course on Course.CourseId = Exam.CourseId
--------------------------------------------------------------------------------------------------------------------



