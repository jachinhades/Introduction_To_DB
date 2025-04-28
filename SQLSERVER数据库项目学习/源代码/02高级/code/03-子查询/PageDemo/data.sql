--学生：编号，姓名，性别
--添加30条测试记录
--exp8:分页
create table Student
(
	StuId int primary key identity(1,2), --自动编号
	StuName varchar(20),
	StuSex varchar(4)
)
insert into Student(StuName,StuSex) values('刘备','男')
insert into Student(StuName,StuSex) values('关羽','男')
insert into Student(StuName,StuSex) values('张飞','男')
insert into Student(StuName,StuSex) values('赵云','男')
insert into Student(StuName,StuSex) values('马超','男')
insert into Student(StuName,StuSex) values('黄忠','男')
insert into Student(StuName,StuSex) values('魏延','男')
insert into Student(StuName,StuSex) values('简雍','男')
insert into Student(StuName,StuSex) values('诸葛亮','男')
insert into Student(StuName,StuSex) values('徐庶','男')
insert into Student(StuName,StuSex) values('周仓','男')
insert into Student(StuName,StuSex) values('关平','男')
insert into Student(StuName,StuSex) values('张苞','男')
insert into Student(StuName,StuSex) values('曹操','男')
insert into Student(StuName,StuSex) values('曹仁','男')
insert into Student(StuName,StuSex) values('曹丕','男')
insert into Student(StuName,StuSex) values('曹植','男')
insert into Student(StuName,StuSex) values('曹彰','男')
insert into Student(StuName,StuSex) values('典韦','男')
insert into Student(StuName,StuSex) values('许褚','男')
insert into Student(StuName,StuSex) values('夏侯敦','男')
insert into Student(StuName,StuSex) values('郭嘉','男')
insert into Student(StuName,StuSex) values('荀彧','男')
insert into Student(StuName,StuSex) values('贾诩','男')
insert into Student(StuName,StuSex) values('孙权','男')
insert into Student(StuName,StuSex) values('孙坚','男')
insert into Student(StuName,StuSex) values('孙策','男')
insert into Student(StuName,StuSex) values('太史慈','男')
insert into Student(StuName,StuSex) values('大乔','女')
insert into Student(StuName,StuSex) values('小乔','女')

select * from Student

--方案一：top分页
declare @PageSize int = 5 --分页大小（一页有几条数据）
declare @PageIndex int = 1 --当前页
select top(@PageSize) * from Student 
where StuId not in (select top ((@PageIndex-1)*@PageSize) StuId from Student)


--方案二：row_number分页
declare @PageSize int = 5 --分页大小（一页有几条数据）
declare @PageIndex int = 1 --当前页
select * from 
(select ROW_NUMBER() over(order by StuId) RowId,* from Student) Temp
where RowId between (@PageIndex-1)*@PageSize+1 and @PageIndex*@PageSize