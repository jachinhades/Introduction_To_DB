 --多表联接查询
 select * from People,Department  --查询结果的数量是一个 笛卡尔乘积

 --简单多表查询(不符合主外建关系的数据不会显示)
 --查询员工信息，同时显示部门名称
 select * from People,Department where People.DepartmentId = Department.DepartmentId 
 --查询员工信息，同时显示职级名称
 select * from People,Rank where People.RankId = Rank.RankId
 --查询员工信息，同时显示部门名称，职位名称
 select * from People,Department,Rank
 where People.DepartmentId = Department.DepartmentId and People.RankId = Rank.RankId

 --内连接(不符合主外建关系的数据不会显示)
 --查询员工信息，同时显示部门名称
 select * from People inner join Department on People.DepartmentId = Department.DepartmentId 
 --查询员工信息，同时显示职位名称
 select * from People inner join Rank on People.RankId = Rank.RankId
 --查询员工信息，同时显示部门名称，职位名称
 select * from People inner join Department on People.DepartmentId = Department.DepartmentId 
 inner join Rank on People.RankId = Rank.RankId

 --外联接（左外联接，右外联接，全外联接）
 --左外联接(以左表为主表显示全部数据，主外键关系找不到数据的地方null取代)
  --查询员工信息，同时显示部门名称
 select * from People left join Department on People.DepartmentId = Department.DepartmentId 
 --查询员工信息，同时显示职位名称
 select * from People left join Rank on People.RankId = Rank.RankId
 --查询员工信息，同时显示部门名称，职位名称
 select * from People left join Department on People.DepartmentId = Department.DepartmentId 
 left join Rank on People.RankId = Rank.RankId
 -- A left join B  ==  B right join A

 --全外联（两张表的所有数据必须全部显示）
   --查询员工信息，同时显示部门名称
 select * from People full join Department on People.DepartmentId = Department.DepartmentId 
 --查询员工信息，同时显示职位名称
 select * from People full join Rank on People.RankId = Rank.RankId
 --查询员工信息，同时显示部门名称，职位名称
 select * from People full join Department on People.DepartmentId = Department.DepartmentId 
 full join Rank on People.RankId = Rank.RankId




--查询出武汉地区所有的员工信息，要求显示部门名称以及员工的详细资料。
select PeopleName 姓名,People.DepartmentId 部门编号 ,DepartmentName 部门名称,
PeopleSex 性别,PeopleBirth 生日,
PeopleSalary 月薪,PeoplePhone 电话,PeopleAddress 地区
from People left join DEPARTMENT on Department.DepartmentId = People.DepartmentId
where PeopleAddress = '武汉'

--查询出武汉地区所有的员工信息，要求显示部门名称，职级名称以及员工的详细资料。
select PeopleName 姓名,DepartmentName 部门名称,RankName 职位名称,
PeopleSex 性别,PeopleBirth 生日,
PeopleSalary 月薪,PeoplePhone 电话,PeopleAddress 地区
from People left join DEPARTMENT on Department.DepartmentId = People.DepartmentId
left join [Rank] on [Rank].RankId = People.RankId
where PeopleAddress = '武汉'

--根据部门分组统计员工人数，员工工资总和，平均工资，最高工资和最低工资。
--提示：在进行分组统计查询的时候添加二表联合查询。
select DepartmentName 部门名称,COUNT(*) 人数,SUM(PeopleSalary) 工资总和,
AVG(PeopleSalary) 平均工资,MAX(PeopleSalary) 最高工资,MIN(PeopleSalary) 最低工资 
from People left join DEPARTMENT on Department.DepartmentId = People.DepartmentId
group by Department.DepartmentId,DepartmentName

--根据部门分组统计员工人数，员工工资总和，平均工资，最高工资和最低工资，
--平均工资在10000 以下的不参与统计，并且根据平均工资降序排列。
--提示：在进行分组统计查询的时候添加二表联合查询。
select DepartmentName 部门名称,COUNT(*) 人数,SUM(PeopleSalary) 工资总和,
AVG(PeopleSalary) 平均工资,MAX(PeopleSalary) 最高工资,MIN(PeopleSalary) 最低工资 
from People left join DEPARTMENT on Department.DepartmentId = People.DepartmentId
group by Department.DepartmentId,DepartmentName
having AVG(PeopleSalary) >= 10000
order by AVG(PeopleSalary) desc

--根据部门名称，然后根据职位名称，
--分组统计员工人数，员工工资总和，平均工资，最高工资和最低工资
select DepartmentName 部门名称,RANKNAME 职级名称,COUNT(*) 人数,SUM(PeopleSalary) 工资总和,
AVG(PeopleSalary) 平均工资,MAX(PeopleSalary) 最高工资,MIN(PeopleSalary) 最低工资 
from People 
LEFT JOIN DEPARTMENT on Department.DepartmentId = People.DepartmentId
LEFT JOIN [Rank] on [Rank].RANKID = People.RANKID
group by Department.DepartmentId,DepartmentName,[Rank].RANKID,RANKNAME





--自联接
 
--查询部门和上级部门
create table Dept
(
	DeptId int primary key,  --部门编号
	DeptName varchar(50) not null, --部门名称
	ParentId int not null,  --上级部门编号
)

insert into Dept(DeptId,DeptName,ParentId)
values(1,'软件部',0)
insert into Dept(DeptId,DeptName,ParentId)
values(2,'硬件部',0)

insert into Dept(DeptId,DeptName,ParentId)
values(3,'软件研发部',1)
insert into Dept(DeptId,DeptName,ParentId)
values(4,'软件测试部',1)
insert into Dept(DeptId,DeptName,ParentId)
values(5,'软件实施部',1)

insert into Dept(DeptId,DeptName,ParentId)
values(6,'硬件研发部',2)
insert into Dept(DeptId,DeptName,ParentId)
values(7,'硬件测试部',2)
insert into Dept(DeptId,DeptName,ParentId)
values(8,'硬件实施部',2)

select * from Dept
select * from Dept
--实现以下查询，结果为
--部门编号      部门名称     上级部门
-- 3           软件研发部     软件部
-- 4           软件测试部     软件部
-- 5           软件实施部     软件部
-- 6           硬件研发部     硬件部
-- 7           硬件测试部     硬件部
-- 8           硬件实施部     硬件部


select A.DeptId 部门编号,A.DeptName 部门名称,B.DeptName 上级名称 from Dept A 
inner join Dept B on A.ParentId = B.DeptId
