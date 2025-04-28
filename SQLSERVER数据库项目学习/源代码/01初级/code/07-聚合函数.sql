--聚合函数（数量-count,最大值 -max,最小值 -min,求和 -sum,平均值 -avg )

--求数量
select COUNT(*) 数量 from People

--求最大值 ,工资的最大值
select MAX(PeopleSalary) 最高工资 from People

--求最小值 ,工资的最小值
select MIN(PeopleSalary) 最低工资 from People

--求工资总和
select SUM(PeopleSalary) 工资总和 from People

--求工资平均值
select AVG(PeopleSalary) 平均工资 from People

select ROUND(AVG(PeopleSalary),2)  平均工资 from People

--求数量，最大值，最小值，总和，平均值，在一行显示
select COUNT(*) 数量,MAX(PeopleSalary) 最高工资,MIN(PeopleSalary) 最低工资
,SUM(PeopleSalary) 工资总和,AVG(PeopleSalary) 平均工资 from People

--查询出武汉地区的员工人数，总工资，最高工资，最低工资和平均工资。
select '武汉' 地区,COUNT(*) 数量,MAX(PeopleSalary) 最高工资,MIN(PeopleSalary) 最低工资
,SUM(PeopleSalary) 工资总和,AVG(PeopleSalary) 平均工资 from People
WHERE PEOPLEADDRESS = '武汉'



--求出工资比平均工资高的人员信息
select * from People where PeopleSalary > (select AVG(PeopleSalary) 平均工资 from People)


--求数量，年龄最大值，年龄最小值，年龄总和，年龄平均值，在一行显示
select COUNT(*) 数量,
MAX(year(getdate())-year(PeopleBirth)) 最高年龄,
MIN(year(getdate())-year(PeopleBirth)) 最低年龄,
SUM(year(getdate())-year(PeopleBirth)) 年龄总和,
AVG(year(getdate())-year(PeopleBirth)) 平均年龄 
from People

select COUNT(*) 数量,
MAX(DATEDIFF(year, PeopleBirth, getDate())) 最高年龄,
MIN(DATEDIFF(year, PeopleBirth, getDate())) 最低年龄,
SUM(DATEDIFF(year, PeopleBirth, getDate())) 年龄总和,
AVG(DATEDIFF(year, PeopleBirth, getDate())) 平均年龄 
from People

--计算出月薪在10000 以上的男性员工的最大年龄，最小年龄和平均年龄。
select '男' 性别,COUNT(*) 数量,
MAX(year(getdate())-year(PeopleBirth)) 最高年龄,
MIN(year(getdate())-year(PeopleBirth)) 最低年龄,
SUM(year(getdate())-year(PeopleBirth)) 年龄总和,
AVG(year(getdate())-year(PeopleBirth)) 平均年龄 
from People where PeopleSex = '男' and PeopleSalary >= 10000

select '男' 性别,COUNT(*) 数量,
MAX(DATEDIFF(year, PeopleBirth, getDate())) 最高年龄,
MIN(DATEDIFF(year, PeopleBirth, getDate())) 最低年龄,
SUM(DATEDIFF(year, PeopleBirth, getDate())) 年龄总和,
AVG(DATEDIFF(year, PeopleBirth, getDate())) 平均年龄 
from People where PeopleSex = '男' and PeopleSalary >= 10000

--统计出所在地在“武汉或上海”的所有女员工数量以及最大年龄，最小年龄和平均年龄。
select '武汉或上海' 地区,'女' 性别,COUNT(*) 数量,
MAX(year(getdate())-year(PeopleBirth)) 最高年龄,
MIN(year(getdate())-year(PeopleBirth)) 最低年龄,
SUM(year(getdate())-year(PeopleBirth)) 年龄总和,
AVG(year(getdate())-year(PeopleBirth)) 平均年龄  
from People where PeopleSex = '女' and PeopleAddress in('武汉','上海')

select '武汉或上海' 地区,'女' 性别,COUNT(*) 数量,
MAX(DATEDIFF(year, PeopleBirth, getDate())) 最高年龄,
MIN(DATEDIFF(year, PeopleBirth, getDate())) 最低年龄,
SUM(DATEDIFF(year, PeopleBirth, getDate())) 年龄总和,
AVG(DATEDIFF(year, PeopleBirth, getDate())) 平均年龄  
from People where PeopleSex = '女' and PeopleAddress in('武汉','上海')

--求出年龄比平均年龄高的人员信息
select * from People where 
year(getdate())-year(PeopleBirth) > 
(select AVG(year(getdate())-year(PeopleBirth)) 
from People)

select * from People where 
DATEDIFF(year, PeopleBirth, getDate()) > 
(select AVG(DATEDIFF(year, PeopleBirth, getDate())) 
from People)



