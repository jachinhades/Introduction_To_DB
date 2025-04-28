--单表查询all
--查询列表
--查询所有学生的信息
select * from 学生
select 学号,姓名,年龄 from 学生
--查询所有男生的信息
select * from 学生 where 性别='男'
select 学号,姓名,年龄 from 学生 where 性别='男'
select * from 学生 where 所在系='计算机' and 年龄=21
--查询列表里可以放置常量
select '学生信息',学号,姓名,年龄 from 学生 where 性别='男'

--聚集函数 更名操作
--查询学校有多少名学生
select count(*) 学生人数 from 学生
--count不仅可以计算行数，还可以计算属性的个数

--对查询的结构集进行排序，永远是放一个查询的末尾
select * from 学生 order by 年龄 asc
select * from 学生 order by 年龄 desc
select * from 学生 where 所在系='计算机' order by 年龄 desc
--查询年龄在20到21岁的学生信息
select * from 学生 where 年龄 between 20 and 21
--查询计算机和机械系的学生信息
select * from 学生 where 所在系='计算机'
or 所在系='金融'
--查询班级信息为空的学生信息
select * from 学生 where 班级 is not null

--like 模糊查询的用法
--查询姓张的学生信息
select * from 学生 where 姓名 like '徐%'
select * from 学习 order by 学号,成绩

--分组查询  目的在于数据统计和分析

--group by 后面的属性称为分组属性
--分组时，查询列表可以放分组属性和聚集函数
--统计每个系的学生人数
select 所在系,count(学号) 系人数 from 学生 group by 所在系
--查询每门课的选修人数和平均成绩
select 课程号,count(*),avg(成绩) from 学习 group by 课程号 
--查询每名同学选修的课程门数和平均成绩，并按照门数降序排列
select 学号,count(*),avg(成绩) from 学习 group by 学号 order by count(*) desc

--distinct 去重的意思
--查询有多少个系
select count(distinct 所在系) 系数 from 学生