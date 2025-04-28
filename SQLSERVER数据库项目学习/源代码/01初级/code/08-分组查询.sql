--根据员工所在地区分组统计员工人数 ,员工工资总和 ,平均工资，最高工资和最低工资
select '武汉' 地区,COUNT(*) 数量,MAX(PeopleSalary) 最高工资,MIN(PeopleSalary) 最低工资
,SUM(PeopleSalary) 工资总和,AVG(PeopleSalary) 平均工资 from People
 where PeopleAddress = '武汉' union
select '北京' 地区,COUNT(*) 数量,MAX(PeopleSalary) 最高工资,MIN(PeopleSalary) 最低工资
,SUM(PeopleSalary) 工资总和,AVG(PeopleSalary) 平均工资 from People
 where PeopleAddress = '北京'
 --...其它地区数据
 --...其他地区数据
 
select PeopleAddress 地区,COUNT(*) 人数,SUM(PeopleSalary) 工资总和,
AVG(PeopleSalary) 平均工资,MAX(PeopleSalary) 最高工资,MIN(PeopleSalary) 最低工资 
from People group by PeopleAddress;


 --根据员工所在地区分组统计员工人数，员工工资总和，平均工资，最高工资和最低工资，
 --1985 年及以后出身的员工不参与统计。
select PeopleAddress 地区,COUNT(*) 人数,SUM(PeopleSalary) 工资总和,
AVG(PeopleSalary) 平均工资,MAX(PeopleSalary) 最高工资,MIN(PeopleSalary) 最低工资 
from People
where PeopleBirth < '1985-1-1'
group by PeopleAddress;


--根据员工所在地区分组统计员工人数，员工工资总和，平均工资，最高工资和最低工资，
--要求筛选出员工人数至少在2 人及以上的记录，并且1985 年及以后出身的员工不参与统计。
select PeopleAddress 地区,COUNT(*) 人数,SUM(PeopleSalary) 工资总和,
AVG(PeopleSalary) 平均工资,MAX(PeopleSalary) 最高工资,MIN(PeopleSalary) 最低工资 
from People 
where PeopleBirth < '1985-1-1'
group by PeopleAddress
having COUNT(*) >= 2;



