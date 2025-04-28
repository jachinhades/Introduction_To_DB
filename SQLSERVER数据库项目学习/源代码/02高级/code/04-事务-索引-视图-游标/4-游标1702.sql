--游标:可以直接指向某行数据

select * from Student

--定义游标(只进)
declare StuYb cursor for
select StuName from Student
open StuYb --打开游标 

close StuYb --关闭游标



--利用只进游标循环显示学生姓名
fetch next from StuYb
while @@FETCH_STATUS = 0 --正常状态（可以读下一条）
begin
	fetch next from StuYb
end

--删除游标
deallocate StuYb
--创建游标（滚动游标）
declare StuYb cursor scroll for
select * from Student
open StuYb
--读取下一条
fetch next from StuYb
--读取上一条
fetch prior from StuYb
--读取第一条
fetch first from StuYb
--读取最后一条
fetch last from StuYb
--读取第三条（绝对第三条，从第一条开始数第三条）
fetch absolute 3 from StuYb
--读取第三条（相对第三条，从当前位置开始数第三条）
fetch relative 3 from StuYb

--查询出第5条数据，将编号，姓名，性别分别使用3个变量存起来，打印
declare @StuId int
declare @StuName varchar(30)
declare @StuSex varchar(30)
fetch absolute 5 from StuYb into @StuId,@StuName,@StuSex
print cast(@StuId as varchar(10)) + ',' + @StuName + ',' + @StuSex

--修改第5条数据，将性别修改成女（第5条数据的编号，姓名，性别都不知道）
fetch absolute 5 from StuYb
update Student set StuSex = '女' where CURRENT of StuYb
select * from Student

--删除第10条数据，（第10条数据的编号，姓名，性别都不知道）
fetch absolute 10 from StuYb
delete from Student where CURRENT of StuYb

--函数（系统函数，自定义函数）
--自定义函数（1-标量值函数，2-表值函数）
--求银行的现有金额的总和
create function funSumMoney()
returns money
as
begin
	declare @sumMoney money
	select @sumMoney = (select SUM(CardMoney) from BankCard)
	return @sumMoney
end
go

print dbo.funSumMoney()

--传入一个身份证号码，求该人的所有银行卡总金额



select SUM(CardMoney) from BankCard




