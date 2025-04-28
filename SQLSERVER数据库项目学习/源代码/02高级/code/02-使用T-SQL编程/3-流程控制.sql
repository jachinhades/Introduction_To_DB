--流程控制
--选择分支结构 if  else

--exp:某用户银行卡号为“6225547854125656”，该用户执行取钱操作，
--取钱5000元，余额充足则进行取钱操作，并提示"取钱成功"，否则提示“余额不足”
--declare @balance money
--select @balance = (select CardMoney from BankCard where CardNo='6225547854125656')
--if @balance >= 5000
--	begin
--		update BankCard set CardMoney = CardMoney - 5000
--		insert into CardExchange(CardNo,MoneyInBank,MoneyOutBank,ExchangeTime)
--		values('6225547854125656',0,5000,GETDATE())
--	end
--else
--	print '余额不足'

--exp:查询银行卡信息，
--将银行卡状态1,2,3,4分别转换为汉字“正常,挂失,冻结,注销”
--根据银行卡余额显示银行卡等级 30万以下为“普通用户”,30万及以上为"VIP用户"
--分别显示卡号，身份证，姓名，余额，用户等级，银行卡状态
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
--或如下写法：
--select CardNo 卡号,AccountCode 身份证,RealName 姓名,CardMoney 余额,
--case
--	when CardMoney < 300000 then '普通用户'
--	else 'VIP用户' 
--end 用户等级,
--case CardState
--	when 1 then '正常'
--	when 2 then '挂失'
--	when 3 then '冻结'
--	when 4 then '注销'
--	else '异常'
--end 卡状态
--from BankCard inner join AccountInfo on BankCard.AccountId = AccountInfo.AccountId


--1-循环打印1-10(循环中若出现break和CONTINUE,作用与Java，C#等语言一致)

--declare @i int  = 1
--while @i <= 10
--begin
--	print @i
--	set @i = @i + 1
--end

--2-循环打印九九乘法表
--制表符	CHAR(9)
--换行符	CHAR(10)
--回车	CHAR(13)


declare @i int = 1
declare @str varchar(1000)
while @i<=9
begin
	declare @j int = 1
	set @str = ''
	while @j <= @i
	begin
		--方案一
		--set @str = @str + cast(@i as varchar(2)) + '*' + cast(@j as varchar(2)) + 
		--'=' + cast(@i*@j as varchar(2)) + CHAR(9)
		--方案二
		set @str = @str + Convert(varchar(2),@i) + '*' + Convert(varchar(2),@j) + 
		'=' + Convert(varchar(2),@i*@j) + CHAR(9)		
		set @j = @j + 1
	end
	print @str
	set @i = @i + 1
end


















