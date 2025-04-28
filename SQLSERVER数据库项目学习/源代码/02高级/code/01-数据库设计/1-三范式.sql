--数据库设计中的三大范式
--第一范式：确保每一列的原子性。如果每列都是不可再分的最小单位，即满足第一范式。 
--exp:
--create table Student --学生表
--(
--	StuId varchar(20) primary key,--学号
--	StuName varchar(20) not null,--学生姓名
--	StuContact varchar(50) not null, --联系方式
--)
--insert into Student(StuId,StuName,StuAddress) 
--values('001','刘备','QQ:185699887;Tel:13885874587')
--select * from Student

--上述设计则不满足第一范式，联系方式这一列并不是不可再分的最小单元,应修改为如下结构
--create table Student --学生表
--(
--	StuId varchar(20) primary key,--学号
--	StuName varchar(20) not null,--学生姓名
--  Tel varchar(20) not null, --联系电话
--  QQ varchar(20) not null,  --联系QQ
--)
----------------------------------------------------------------------------------------------------------------------------





--第二范式：是对记录的惟一性，要求记录有惟一标识，即实体的惟一性，即不存在部分依赖
--exp:
--选课成绩表
--create table StudentCourse
--(
--	StuId varchar(20),--学号
--	StuName varchar(20) not null,--学生姓名
--	CourseId varchar(20) not null,--课程编号
--	CourseName varchar(20) not null, --选课课程名称
--	CourseScore int not null, --考试成绩
--)
--insert into StudentCourse(StuId,StuName,CourseId,CourseName,CourseScore)
--values('001','刘备','001','语文',80)
--insert into StudentCourse(StuId,StuName,CourseId,CourseName,CourseScore)
--values('001','刘备','002','数学',70)
--insert into StudentCourse(StuId,StuName,CourseId,CourseName,CourseScore)
--values('002','关羽','003','英语',80)
--insert into StudentCourse(StuId,StuName,CourseId,CourseName,CourseScore)
--values('003','张飞','003','英语',90)
--上述设计中有两个事物，一个学生信息，一个课程信息，很显然这两个事物都没有保证实体的唯一性，
--这里的姓名依赖学号，课程名称依赖课程编号，所以不符合二范式。
--优化方案如下：
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

--select * from Student inner join Exam on Student.StuId = Exam.StuId
--inner join Course on Course.CourseId = Exam.CourseId




-------------------------------------------------------------------------------------------------------------------
--第三范式：每列都与主键相关，处理数据冗余，
--要求任何字段不能由其他字段派生出来，它要求字段没有冗余，即不存在传递依赖
--exp:
--create table Student
--(
--	StuId varchar(20) primary key,--学号
--	StuName varchar(20) not null,--学生姓名
--	ProfessionalId int not null,--专业编号
--	ProfessionalName varchar(50),--专业名称
--	ProfessionalRemark varchar(200), --专业介绍
--)
--insert into Student(StuId,StuName,ProfessionalId,ProfessionalName,ProfessionalRemark)
--values('001','刘备',1,'计算机','最牛的专业')
--insert into Student(StuId,StuName,ProfessionalId,ProfessionalName,ProfessionalRemark)
--values('002','关羽',2,'工商管理','管理学的基础专业')
--insert into Student(StuId,StuName,ProfessionalId,ProfessionalName,ProfessionalRemark)
--values('003','张飞',1,'计算机','最牛的专业')
--select * from Student
--上述设计则不满足第三范式，优化方案如下：
--create table Professional
--(
--	ProfessionalId int primary key identity(1,1),--专业编号
--	ProfessionalName varchar(50),--专业名称
--	ProfessionalRemark varchar(200), --专业介绍
--)
--create table Student
--(
--	StuId varchar(20) primary key,--学号
--	StuName varchar(20) not null,--学生姓名
--	ProfessionalId int not null,--专业编号
--)
--insert into Professional(ProfessionalName,ProfessionalRemark) values('计算机','最牛的专业')
--insert into Professional(ProfessionalName,ProfessionalRemark) values('工商管理','管理学的基础专业')
--insert into Student(StuId,StuName,ProfessionalId) values('001','刘备',1)
--insert into Student(StuId,StuName,ProfessionalId) values('002','关羽',2)
--insert into Student(StuId,StuName,ProfessionalId) values('003','张飞',1)
--select * from Student
--------------------------------------------------------------------------------------------------------------------------







