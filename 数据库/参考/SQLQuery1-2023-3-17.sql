--单表查询all
--查询列表
--查询所有学生的信息
select * from 学生
select 学号,姓名,年龄 from 学生
--查询所有男生的信息
select * from 学生 where 性别='男'
select 学号,姓名,年龄 from 学生 where 性别='男'
select * from 学生 where 性别='男' and 年龄=19
--查询列表里面可以放置常量
select '学生信息',学号,姓名,年龄 from 学生 where 性别='男'

--聚集函数   更名操作
--查询学校有多少名学生
select count(*) 学生人数 from 学生
--count不仅可以计算行数，还可以计算属性的个数
select count(学号) 学生人数,avg(年龄) 学生平均年龄,
max(年龄),min(年龄) from 学生
select avg(年龄) 学生平均年龄 from 学生

--对查询的结果集进行排序，永远是放在一个查询的末尾
select * from 学生 order by 年龄 asc
select * from 学生 order by 年龄 desc
select * from 学生 where 所在系='计算机'
order by 年龄 desc
--查询年龄在20到21岁的学生信息
select * from 学生 where 年龄 between 20 and 21
--查询计算机和机械系的学生信息
select * from 学生 where 所在系='计算机'
or 所在系='机械'

select * from 学生 where 所在系 in('计算机','机械')
--查询班级信息为空的学生信息
select * from 学生 where 班级 is not null

--like 模糊查询的用法
--查询姓张的学生信息
select * from 学生 where 姓名 like '张%'
select * from 选课 order by 学号,成绩

--分组查询  目的在于数据统计和分析

--group by 后面的属性称为分组属性
--分组时，查询列表可以放分组属性和聚集函数
--统计每个系的学生人数
select 所在系,count(学号) 系人数 from 学生 group by 所在系
--查询每门课的选修人数和平均成绩
select 课程号,count(*),avg(成绩) from 选课 group by 课程号 
-分组之后，继续筛选如何操作？
select 课程号,count(*),avg(成绩) from 选课 group by 课程号 
having avg(成绩)>=90 order by avg(成绩)

--查询每名同学选修的课程门数和平均成绩
select 学号,count(*),avg(成绩) from 选课 group by 学号
--查询每名同学选修的课程门数和平均成绩，并按照门数降序排列
select 学号,count(*),avg(成绩) from 选课 group by 学号
order by count(*) desc
--查询选修门数超过2门的同学学号和平均成绩，并按照门数降序排列
select 学号,count(*),avg(成绩) from 选课 group by 学号
having count(*)>=2 order by count(*) desc

--distinct 去重的意思
--查询有多少个系
select count(distinct 所在系) from 学生







