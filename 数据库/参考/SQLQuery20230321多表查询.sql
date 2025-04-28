--查询所有学生的学号、姓名和所在系
select 学号,姓名,所在系 from 学生
--查询所有年龄在19至20岁的学生的学号、姓名和所在系
select 学号,姓名,所在系 from 学生 where 年龄 between 19 and 21
--查询每个系年龄在19至20岁学生的人数和平均年龄
select 所在系,count(*),avg(年龄) from 学生 where 年龄 between 19 and 21
group by 所在系
--查询每个系年龄在19至20岁学生的人数和平均年龄，筛选出人数超过1人的系
select 所在系,count(*),avg(年龄) from 学生 where 年龄 between 19 and 21
group by 所在系 having count(*)>=1
--查询每个系年龄在19至20岁学生的人数和平均年龄，筛选出人数超过1人的系，并
--按照人数降序排列
select 所在系,count(*),avg(年龄) from 学生 where 年龄 between 19 and 21
group by 所在系 having count(*)>=1 order by count(*) desc

--多表查询
--笛卡尔积
select 学生.*,选课.* from 学生,选课
--等值连接
select 学生.*,选课.*,课程.* from 学生,选课,课程 where 学生.学号=选课.学号
and 课程.课程号=选课.课程号
--查询张三选修的课程号和成绩
select 姓名,课程号,成绩 from 学生,选课 where 学生.学号=选课.学号
and 姓名='张三' 
--查询张三选修的课程号、课程名和成绩
select 姓名,课程.课程号,课程名,成绩 from 学生,选课,课程 where 学生.学号=选课.学号
and 课程.课程号=选课.课程号 and 姓名='张三'
--查询每个系学生的平均成绩
select 所在系,avg(成绩) from 学生,选课 where 学生.学号=选课.学号
group by 所在系 order by avg(成绩) desc
--查询选修了至少两门课的学生学号
select 学号 from 选课 group by 学号 having count(*)>1
--非等值连接  自身连接
select distinct X.学号 from 选课 X,选课 Y where X.学号=Y.学号 and X.课程号<>Y.课程号
--查询选修了至少三门课的学生学号
--内连接
select 学生.*,选课.* from 学生 inner join 选课 on 学生.学号=选课.学号
--外连接 left right full
--查询学生的选课情况，没有选课的也要统计
select 学生.*,选课.* from 学生 full join 选课 on 学生.学号=选课.学号
--查询选修蔡老师所教课程学生的学号和成绩
--查询选修蔡老师所教课程学生的人数
--查询选修蔡老师所教课程学生的平均年龄

--查询选修蔡老师所教课程学生的学号、姓名和成绩

--查询每位任课教师的选课人数
--查询选课人数超过10人的任课教师和选课人数
--查询选课人数超过10人的任课教师和选课人数，并按照选课人数降序排列

--查询王乐选修课程的课程号、课程名和成绩（思考题，不作为作业）
select 姓名,课程.课程号,课程名,成绩 from 学生,选课,课程 where 学生.学号=选课.学号
and 课程.课程号=选课.课程号 and 姓名='张三'


