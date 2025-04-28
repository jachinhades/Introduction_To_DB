--触发器分类：（1） “Instead of”触发器（2）“After”触发器
--（1） “Instead of”触发器：在执行操作之前被执行
--（2）“After”触发器：在执行操作之后被执行
--部门
create table Department
(
	DepartmentId varchar(10) primary key , --主键，自动增长
	DepartmentName nvarchar(50), --部门名称
)
--人员信息
create table People
(
	PeopleId int primary key identity(1,1), --主键,自动增长
	DepartmentId varchar(10), --部门编号,外键,与部门表关联
	PeopleName nvarchar(20), --人员姓名
	PeopleSex nvarchar(2), --人员性别
	PeoplePhone nvarchar(20), --电话，联系方式
)
insert into Department(DepartmentId,DepartmentName)
values('001','总经办')
insert into Department(DepartmentId,DepartmentName)
values('002','市场部')
insert into Department(DepartmentId,DepartmentName)
values('003','人事部')
insert into Department(DepartmentId,DepartmentName)
values('004','财务部')
insert into Department(DepartmentId,DepartmentName)
values('005','软件部')
insert into People(DepartmentId,PeopleName,PeopleSex,PeoplePhone)
values('001','刘备','男','13558785478')
insert into People(DepartmentId,PeopleName,PeopleSex,PeoplePhone)
values('001','关羽','男','13558788785')
insert into People(DepartmentId,PeopleName,PeopleSex,PeoplePhone)
values('002','张飞','男','13698547125')

select * from Department
select * from People
--exp:添加员工的时候，如果部门编号找不到，则自动添加部门信息，部门名称为"新部门"
create trigger tri_InsertPeople on People
after insert
as
if not exists(select * from Department where DepartmentId = (select DepartmentId from inserted))
	insert into Department(DepartmentId,DepartmentName)
	values((select DepartmentId from inserted),'新部门')
go
insert People(DepartmentId,PeopleName,PeopleSex,PeoplePhone)
values('009','赵云','男','13854587456')



--exp:触发器实现，删除一个部门的时候将部门下所有员工全部删除	
create trigger tri_DeleteDept on Department
after delete
as
delete from People where People.DepartmentId = 
(select DepartmentId from deleted)
go

select * from Department
select * from People
delete Department where DepartmentId = '001'



drop trigger tri_DeleteDept
--exp:创建一个触发器，删除一个部门的时候判断该部门下是否有员工，有则不删除，没有则删除
create trigger tri_DeleteDept on Department
Instead of delete
as
  if not exists(select * from People where DepartmentId = (select DepartmentId from deleted))
  begin
	delete from Department where DepartmentId = (select DepartmentId from deleted)
  end
go
delete Department where DepartmentId = '001'
delete Department where DepartmentId = '002'
delete Department where DepartmentId = '003'



--exp:修改一个部门编号之后，将该部门下所有员工的部门编号同步进行修改
--create trigger tri_UpdateDept on Department
--after update
--as
--	update People set DepartmentId = (select DepartmentId from inserted)
--	where DepartmentId = (select DepartmentId from deleted)
--go
--select * from Department
--select * from People
--update Department set DepartmentId = 'zjb001' where DepartmentId='001'

