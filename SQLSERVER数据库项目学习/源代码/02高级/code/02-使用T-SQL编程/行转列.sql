--学生信息表
create table TB_Student
(
	StuId int primary key,  --学生编号
	StuName varchar(50)     --学生姓名
)
insert into TB_Student(StuId,StuName) values(1,'刘备')
insert into TB_Student(StuId,StuName) values(2,'关羽')
insert into TB_Student(StuId,StuName) values(3,'张飞')
--考试成绩表
create table TB_Exam
(
	ExamId int primary key,  --考试编号
	StuId int,--学生编号
	ExamSubject varchar(50), --考试科目
	ExamScore int --考试成绩
)
insert into TB_Exam(ExamId,StuId,ExamSubject,ExamScore)
values(1,1,'语文',90)
insert into TB_Exam(ExamId,StuId,ExamSubject,ExamScore)
values(2,1,'数学',80)
insert into TB_Exam(ExamId,StuId,ExamSubject,ExamScore)
values(3,3,'语文',100)
select * from TB_Student
select * from TB_Exam

--试题一：查询所有学生的语文考试成绩并输出结果
--显示结果：考试编号，学生编号，学生姓名，考试成绩
select ExamId 考试编号,TB_Exam.StuId 学生编号,StuName 学生姓名,ExamScore 考试成绩
from TB_Exam inner join TB_Student on TB_Exam.StuId = TB_Student.StuId
where ExamSubject = '语文'

--试题二：统计所有学生参加的考试次数及平均得分
--显示结果：学生编号，学生姓名，考试次数，平均得分
select TB_Exam.StuId 学生编号,StuName 学生姓名,COUNT(*) 考试次数,AVG(ExamScore) 平均得分
from TB_Exam inner join TB_Student on TB_Exam.StuId = TB_Student.StuId
group by TB_Exam.StuId,StuName

--试题三：按以下格式统计考试成绩并输出结果
--显示结果:学生编号，学生姓名，语文，数学
select TB_Student.StuId 学生编号,StuName 学生姓名,
max(case ExamSubject when '语文' then ExamScore else 0 end) 语文,
max(case ExamSubject when '数学' then ExamScore else 0 end) 数学
from TB_Exam inner join TB_Student on TB_Exam.StuId = TB_Student.StuId
group by TB_Student.StuId,StuName


--扩展动态
DECLARE @sql VARCHAR(max)
SET @sql = 'select TB_Student.StuId 学生编号,StuName 学生姓名,'   
SELECT @sql = @sql + 'max(CASE ExamSubject WHEN '''+[ExamSubject]+''' THEN [ExamScore] ELSE 0 END) AS '''+ExamSubject+''','   
FROM (SELECT DISTINCT [ExamSubject] FROM [TB_Exam]) AS a     
SELECT @sql = LEFT(@sql,LEN(@sql)-1) + ' FROM [TB_Exam] inner join TB_Student on TB_Exam.StuId = TB_Student.StuId GROUP BY TB_Student.StuId,StuName'   
PRINT(@sql)
EXEC(@sql)
GO

--试题三扩展(使用pivot函数行转列)
select * from
(select TB_Student.StuId,StuName,ExamScore,ExamSubject from TB_Exam 
inner join TB_Student on TB_Exam.StuId = TB_Student.StuId) a
pivot
(
	max(ExamScore) for
	a.ExamSubject in([语文],[数学])
) as b

--扩展动态
declare @sql varchar(max)
declare @sqlCol varchar(max)
SELECT @sqlCol = ISNULL(@sqlCol + ',','') + ExamSubject FROM TB_Exam GROUP BY ExamSubject
set @sql = ' select * from '
set @sql = @sql + ' (select TB_Student.StuId,StuName,ExamScore,ExamSubject from TB_Exam '
set @sql = @sql + ' inner join TB_Student on TB_Exam.StuId = TB_Student.StuId) a '
set @sql = @sql + ' pivot '
set @sql = @sql + ' ( '
set @sql = @sql + ' max(ExamScore) for '
set @sql = @sql + ' a.ExamSubject in( '
set @sql = @sql + @sqlCol
set @sql = @sql + ' )'
set @sql = @sql + ' ) as b '
print (@sql)
exec (@sql)

--扩展动态
declare @sql varchar(max)
declare @sqlCol varchar(max)
SELECT @sqlCol = ISNULL(@sqlCol + ',','') + ExamSubject FROM TB_Exam GROUP BY ExamSubject
print @sqlCol
set @sql = '
select * from  
(select TB_Student.StuId,StuName,ExamScore,ExamSubject from TB_Exam  
inner join TB_Student on TB_Exam.StuId = TB_Student.StuId) a  
pivot  
(  
     max(ExamScore) for  
     a.ExamSubject in( '+@sqlCol+' ) 
) as b '
print (@sql)
exec (@sql)

