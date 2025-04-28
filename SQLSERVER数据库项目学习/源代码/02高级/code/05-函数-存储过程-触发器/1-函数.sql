--函数
--（1）系统函数
--（2）自定义函数 --->1.标量值函数(返回单个值)，2.	

--编写一个函数求该银行的金额总和
--create function GetSumCardMoney()
--returns money 
--as
--begin
--	declare @AllMOney money
--	select @AllMOney = (select SUM(CardMoney) from BankCard)
--	return @AllMOney
--end
--go
--select dbo.GetSumCardMoney()

--传入账户编号，返回账户真实姓名
--函数定义
--create function GetNameById(@AccountId int)
--returns  varchar(20)
--as
--begin
--	declare @RealName varchar(20)
--	select @RealName = (select RealName from AccountInfo where AccountId = @AccountId)
--	return @RealName
--end
--go

--drop function GetNameById  --删除函数

----函数调用
--print dbo.GetNameById(2)


--通过函数实现，传递开始时间和结束时间，返回交易记录（存钱取钱）
--交易记录中包含 真实姓名，卡号，存钱金额，取钱金额，交易时间
--方案一：
--create function GetExchangeByTime(@StartTime varchar(30),@EndTime varchar(30))
--returns @ExchangeTable table
--(
--	RealName varchar(30),  --真实姓名
--	CardNo varchar(30),    --卡号
--	MoneyInBank money,     --存钱金额
--	MoneyOutBank money,    --取钱金额
--	ExchangeTime smalldatetime  --交易时间
--)
--as
--begin
--	insert into @ExchangeTable
--	select AccountInfo.RealName,CardExchange.CardNo,CardExchange.MoneyInBank,
--	CardExchange.MoneyOutBank,CardExchange.ExchangeTime from CardExchange
--	left join BankCard on CardExchange.CardNo = BankCard.CardNo
--	left join AccountInfo on BankCard.AccountId = AccountInfo.AccountId
--	where CardExchange.ExchangeTime between @StartTime+' 00:00:00' and @EndTime+' 23:59:59'
--	return
--end
--go
----删除函数
--drop function GetExchangeByTime
----函数调用
--select * from GetExchangeByTime('2018-6-1','2018-7-1')


--方案二：
--create function GetExchangeByTime(@StartTime varchar(30),@EndTime varchar(30))
--returns table
--as
--	return
--	select AccountInfo.RealName,CardExchange.CardNo,CardExchange.MoneyInBank,
--	CardExchange.MoneyOutBank,CardExchange.ExchangeTime from CardExchange
--	left join BankCard on CardExchange.CardNo = BankCard.CardNo
--	left join AccountInfo on BankCard.AccountId = AccountInfo.AccountId
--	where CardExchange.ExchangeTime between @StartTime+' 00:00:00' and @EndTime+' 23:59:59'
--go
----删除函数
--drop function GetExchangeByTime
----函数调用
--select * from GetExchangeByTime('2018-6-19','2018-6-19')



--exp:查询银行卡信息，
--将银行卡状态1,2,3,4分别转换为汉字“正常,挂失,冻结,注销”
--根据银行卡余额显示银行卡等级 30万以下为“普通用户”,30万及以上为"VIP用户"
--分别显示卡号，身份证，姓名，余额，用户等级，银行卡状态

--方案一：直接在sql语句中使用case when
--select * from AccountInfo
--select * from BankCard
--select CardNo 卡号,AccountCode 身份证,RealName 姓名,CardMoney 余额,
--case
--	when CardMoney < 300000 then '普通用户'
--	else 'VIP用户' 
--end 用户等级,
--case
--	when CardState = 1 then '正常'
--	when CardState = 2 then '挂失'
--	when CardState = 3 then '冻结'
--	when CardState = 4 then '注销'
--	else '异常'
--end 卡状态
--from BankCard inner join AccountInfo on BankCard.AccountId = AccountInfo.AccountId

--方案二：将等级和状态用函数实现
--create function GetGradeByMoney(@myMoney int)
--returns varchar(10)
--as
--begin
--	declare @result varchar(10)
--	if @myMoney < 3000 
--		set @result = '普通用户'
--	else
--		set @result = 'VIP用户'
--	return @result
--end
--go
--
--create function GetStatusByNumber(@myNum int)
--returns varchar(10)
--as
--begin
--	declare @result varchar(10)
--	if @myNum = 1
--		set @result = '正常'
--	else if @myNum = 2
--		set @result = '挂失'
--	else if @myNum = 3
--		set @result = '冻结'
--	else if @myNum = 4
--		set @result = '注销'
--	else
--		set @result = '异常'	
--	return @result
--end
--go

--select CardNo 卡号,AccountCode 身份证,RealName 姓名,CardMoney 余额,
--dbo.GetGradeByMoney(CardMoney) 账户等级,dbo.GetStatusByNumber(CardState) 卡状态
--from BankCard inner join AccountInfo on BankCard.AccountId = AccountInfo.AccountId




--exp:编写函数，根据出生年月求年龄
--年龄求实岁
--例如：生日为2000-5-5，当前为2018-5-4，年龄为17岁
--      生日为2000-5-5，当前为2018-5-6，年龄为18岁
--create table Emp
--(
--	EmpId int primary key identity(1,2), --自动编号
--	empName varchar(20), --姓名
--	empSex varchar(4),   --性别
--	empBirth smalldatetime --生日
--)
--insert into Emp(empName,empSex,empBirth) values('刘备','男','2008-5-8')
--insert into Emp(empName,empSex,empBirth) values('关羽','男','1998-10-10')
--insert into Emp(empName,empSex,empBirth) values('张飞','男','1999-7-5')
--insert into Emp(empName,empSex,empBirth) values('赵云','男','2003-12-12')
--insert into Emp(empName,empSex,empBirth) values('马超','男','2003-1-5')
--insert into Emp(empName,empSex,empBirth) values('黄忠','男','1988-8-4')
--insert into Emp(empName,empSex,empBirth) values('魏延','男','1998-5-2')
--insert into Emp(empName,empSex,empBirth) values('简雍','男','1992-2-20')
--insert into Emp(empName,empSex,empBirth) values('诸葛亮','男','1993-3-1')
--insert into Emp(empName,empSex,empBirth) values('徐庶','男','1994-8-5')

--create function GetAgeByBirth(@birth smalldatetime)
--returns int
--as
--begin
--	declare @age int
--	set @age = year(getdate()) - year(@birth)
--	if month(getdate()) < month(@birth)
--		set @age = @age - 1
--	if month(getdate()) = month(@birth) and day(getdate()) < day(@birth)
--		set @age = @age -1
--	return @age
--end
--go
--select *,dbo.GetAgeByBirth(empBirth) 年龄 from Emp























