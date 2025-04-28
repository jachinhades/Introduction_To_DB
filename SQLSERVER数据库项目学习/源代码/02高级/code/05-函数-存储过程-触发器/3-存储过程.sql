--存储过程：存储过程（Procedure）是SQL语句和流程控制语句的预编译集合
--系统常用存储过程（见PPT介绍）

--没有输入参数，没有输出参数的存储过程
--exp:定义存储过程实现查询出账户余额最低的银行卡账户信息,显示银行卡号，姓名，账户余额
--方案一
--create proc proc_MinMoneyCard
--as
--select top 1 CardNo 银行卡号,RealName 姓名,CardMoney 余额
--from BankCard inner join AccountInfo on BankCard.AccountId = AccountInfo.AccountId
--order by CardMoney asc
--go

--方案二：（余额最低，有多个人则显示结果是多个）
--create proc proc_MinMoneyCard
--as
--select CardNo 银行卡号,RealName 姓名,CardMoney 余额
--from BankCard inner join AccountInfo on BankCard.AccountId = AccountInfo.AccountId
--where CardMoney=(select MIN(CardMoney) from BankCard)
--go

--exec proc_MinMoneyCard


--有输入参数，没有输出参数的存储过程
--exp:模拟银行卡存钱操作，传入银行卡号，存钱金额，实现存钱操作
--create proc proc_CunQian
--@CardNo varchar(30),
--@MoneyInBank money
--as
--update BankCard set CardMoney = CardMoney + @MoneyInBank where CardNo = @CardNo
--insert into CardExchange(CardNo,MoneyInBank,MoneyOutBank,ExchangeTime)
--values(@CardNo,@MoneyInBank,0,GETDATE())
--go


--select * from BankCard
--select * from AccountInfo
--select * from CardExchange

--exec proc_CunQian '6225125478544587',3000


--有输入参数，没有输出参数，但是有返回值的存储过程
--create proc proc_QuQian
--@CardNo varchar(30),
--@MoneyOutBank money
--as
--update BankCard set CardMoney = CardMoney - @MoneyOutBank where CardNo = @CardNo
--if @@ERROR <> 0
--	return -1
--insert into CardExchange(CardNo,MoneyInBank,MoneyOutBank,ExchangeTime)
--values(@CardNo,0,@MoneyOutBank,GETDATE())
--return 1
--go

--select * from BankCard
--select * from CardExchange

--declare @returnValue int
--exec @returnValue = proc_QuQian '662018092100000002',1000000
--print @returnValue



--有输入参数，有输出参数的存储过程
--exp:查询出某时间段的银行存取款信息以及存款总金额，取款总金额
--传入开始时间，结束时间，显示存取款交易信息的同时，返回存款总金额，取款总金额
--create proc proc_SelectExchange
--@startTime varchar(20),  --开始时间
--@endTime varchar(20),    --结束时间
--@SumIn money output,     --存款总金额
--@SumOut money output    --取款总金额
--as
--select @SumIn = (select SUM(MoneyInBank) from CardExchange 
--				where ExchangeTime between @startTime+' 00:00:00' and @endTime+' 23:59:59')
--select @SumOut = (select SUM(MoneyOutBank) from CardExchange 
--				where ExchangeTime between @startTime+' 00:00:00' and @endTime+' 23:59:59')
--select * from CardExchange 
--where ExchangeTime between @startTime+' 00:00:00' and @endTime+' 23:59:59'
--go

--declare @SumIn money     --存款总金额
--declare @SumOut money   --取款总金额
--exec proc_SelectExchange '2018-1-1','2018-12-31',@SumIn output,@SumOut output
--select @SumIn
--select @SumOut


--有输入输出参数（密码作为输入参数也作为输出参数）
--密码升级，传入用户名和密码，如果用户名密码正确，并且密码长度<8，自动升级成8位密码
select FLOOR(RAND()*10) --0-9之间随机数
create proc procPwdUpgrade
@cardno nvarchar(20),
@pwd nvarchar(20) output
as
	if not exists(select * from BankCard where CardNo=@cardno and CardPwd=@pwd)
		set @pwd = ''
	else
	begin
		if len(@pwd) < 8
		begin
			declare @len int = 8- len(@pwd)
			declare @i int = 1
			while @i <= @len
			begin
				
				set @pwd = @pwd + cast(FLOOR(RAND()*10) as varchar(1))
				set @i = @i+1
			end
			update BankCard set CardPwd = @pwd where CardNo=@cardno
		end
	end
go
declare @pwd nvarchar(20) = '123456'
exec procPwdUpgrade '6225547854125656',@pwd output
select @pwd


