--嵌套查询
--使用比较运算符 some all

--查询比计算机系所有学生年龄大的学生信息
--父查询没有向子查询传递参数的嵌套查询称为不相关查询
select * from 学生 where 年龄>all
(select 年龄 from 学生 where 所在系='计算机')
select * from 学生 where 年龄>
(select max(年龄) from 学生 where 所在系='计算机')

--查询比王乐同学年龄大的学生信息

select * from 学生 where 年龄>
(select 年龄 from 学生 where 姓名='王乐')

----查询比计算机系一些学生年龄大的学生信息
select * from 学生 where 年龄>some
(select 年龄 from 学生 where 所在系='计算机')
----查询比计算机系一些学生年龄大的非计算机系学生信息
select * from 学生 where 所在系<>'计算机' and 年龄>some
(select 年龄 from 学生 where 所在系='计算机')
select * from 学生 where 所在系<>'计算机' and 年龄>
(select min(年龄) from 学生 where 所在系='计算机')
----查询与计算机系一些学生同龄非计算机系学生信息
select * from 学生 where 所在系<>'计算机' and 年龄=some
(select 年龄 from 学生 where 所在系='计算机')


--使用谓词in的嵌套查询  也是不相关查询  成员资格判断
--查询选修了c001课程的学生学号和姓名
select 学号,姓名 from 学生 where 学号 in
(select 学号 from 选课 where 课程号='c001')

select 学号,姓名 from 学生 where 学号 =some
(select 学号 from 选课 where 课程号='c001')
select 学生.学号,姓名 from 学生,选课 
where 学生.学号=选课.学号 and 课程号='c001'
--in 和=some等价
--查询王乐同学选修的课程号和成绩
 select 课程号,成绩 from 选课 where 学号 in
(select 学号 from 学生 where 姓名='张三')
--查询王乐同学选修的课程号、课程名和成绩
select 选课.课程号,课程名,成绩 from 选课,课程 
where 选课.课程号=课程.课程号 and 学号 in
(select 学号 from 学生 where 姓名='张三')

--使用谓词exists的用法，相关的查询，使用in的查询
--都 可以转换成使用exists的查询,
--子查询返回true or false
--查询王乐同学选修的课程号和成绩
 select 课程号,成绩 from 选课 where exists
(select * from 学生 where 学号=选课.学号 and 姓名='张三')

--查询选修了李老师课程的学生学号、课程号和成绩
select 学号,课程号,成绩 from 选课 where exists
(select * from 课程 where 课程号=选课.课程号
and 任课教师='李老师')

select 学号 from 选课 group by 学号
having count(学号)=(select count(*) from 课程)

--查询c001课程成绩比张三高的学生学号和成绩

--查询选修了数据库原理的学生学号和成绩
--查询选修了数据库原理的学生学号、姓名
--查询计算机系学生都选修的课程课程号

--集合查询 union intersect except
--查询选修了C001或者c002课程的学生学号
select 学号 from 选课 where 课程号='c001'
union
select 学号 from 选课 where 课程号='c002'
--查询选修了C001和c002课程的学生学号
select 学号 from 选课 where 课程号='c001'
intersect
select 学号 from 选课 where 课程号='c002'
--查询选修了C001，但是没有选修c002课程的学生学号
select 学号 from 选课 where 课程号='c001'
except
select 学号 from 选课 where 课程号='c002'
--查询选修了C001，但是没有选修c002课程的学生学号和姓名

select 学号,姓名 from 学生 where 学号 in
(select 学号 from 选课 where 课程号='c001')
select 学号,姓名 from 学生 where 学号 =some
(select 学号 from 选课 where 课程号='c001')
select 学号,姓名 from 学生 where exists
(select * from 选课 where 学号=学生.学号 and 课程号='c001')
except
select 学号,姓名 from 学生 where exists
(select * from 选课 where 学号=学生.学号 and 课程号='c002')

--查询没有选修李老师所教课程的学生学号

--查询选修了李老师所教课程的学生学号和姓名

select 学号 from 学生
except
select 学号 from 选课,课程 where 选课.课程号=课程.课程号 and 任课教师='李老师'

==not in=except
--in = =some 
--not in=<>some 等价吗？
select 学号 from 学生 where 学号 not in
(select 学号 from 选课,课程 where 选课.课程号=课程.课程号 and 任课教师='李老师')

--查询没有选修李老师所教课程的学生学号和姓名
select 学号,姓名 from 学生
except
select 学号,姓名 from 学生 where 学号 in 
(select 学号 from 选课 where 课程号 in
(select 课程号 from 课程 where 任课教师<>'李老师'))

select distinct 学号 from 选课,课程 where 选课.课程号=课程.课程号 and 任课教师<>'李老师'
--增删改
insert into 选课 values('20210004','c001',90)
--删除成绩为空的选课记录
delete from 选课 where 成绩 is null
--删除李老师所教课程的选课记录
delete from 选课 where 课程号 in
(select 课程号 from 课程 where 任课教师='李老师')

--把c001课程的成绩全部减10分

update 选课 set 成绩=成绩-10 where 课程号='c001'
update 选课 set 成绩=成绩-10 where 课程号 in
(select 课程号 from 课程 where 任课教师='李老师')

--查询计算机系的男生人数

--查询王乐同学的基本信息

--查询每个系的人数

--查询每个系的人数，并按照人数降序排列

--查询每个系的男生和女生人数  group by 所在系,性别
select 所在系,性别,count(*) from 学生 group by 所在系,性别

--查询张三所修课程的课程号和成绩（连接、嵌套皆可）
select 课程号,成绩 from 选课 where 学号=
(select 学号 from 学生 where 姓名='张三')
--查询张三所修课程的课程号、课程名和任课教师（连接、嵌套至少写出两种）
select 课程号,课程名,任课教师 from 课程 where 课程号 in
(select 课程号 from 选课 where 学号 =
(select 学号 from 学生 where 姓名='张三'))
--查询被所有学生选修课程的课程号和课程名

--表的排列次序为：课程（商） 学生（除数） 选课（被除数）
--三个select 两个where not exists 最后是连接条件

--把c002课程，分数低于60分的成绩加20分（想得美）

--把数据库原理课程，分数低于60分的成绩加20分
update 选课 set 成绩=成绩+20 where 成绩<60 and 
课程号 in (select 课程号 from 课程 where 课程名='数据库')

