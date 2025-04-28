--信息打印(1)print  (2)select
--print:直接打印消息
--select:在表格中打印消息，可以设置多列，以及每一列的名字
--------------------------------------------------------------------------------------------------------------------



--T-SQL中变量分为局部变量和全局变量
--局部变量：（1）以@作为前缀（2）先声明，在赋值
--exp:
--declare @str varchar(20)
--set @str = '我爱数据库编程' --或者select @str = '我爱数据库编程'
--print @str
--select @str
--备注：set赋值和select赋值区别：
--set：赋值一般用户赋给变量指定的值
--select：赋值一般用于从表中查询出的数据，查询记录如果有多条，将最后一条记录的值赋给变量
--(select @变量名 = 字段名 from 表名)
--在赋值过程中，如果是表中查询的数据，如果记录只有一条，使用set和select都可以，但是习惯上使用select
----------------------------------------------------------------------------------------------------------------------




--全局变量：（1）以@@作为前缀（2）由系统进行定义和维护,只读
--@@ERROR：返回执行的上一个语句的错误号
--@@IDENTITY：返回最后插入的标识值
--@@MAX_CONNECTIONS：返回允许同时进行的最大用户连接数
--@@ROWCOUNT：返回受上一语句影响的行数
--@@SERVERNAME：返回运行 SQL Server 的本地服务器的名称
--@@SERVICENAME：返回 SQL Server 正在其下运行的注册表项的名称
--@@TRANCOUNT：返回当前连接的活动事务数
--@@LOCK_TIMEOUT：返回当前会话的当前锁定超时设置（毫秒）
----------------------------------------------------------------------------------------------------------------------------





--exp:
--赵云身份证：420107199904054233
--为赵云此人进行开户开卡操作
--declare @AccountId int
--insert into AccountInfo(AccountCode,AccountPhone,RealName,OpenTime)
--values('420107199904054233','15878547898','赵云',GETDATE())
--set @AccountId = @@identity
--insert into BankCard(CardNo,AccountId,CardPwd,CardMoney,CardState)
--values('6225123412357896',@AccountId,'123456',0,1)

--select * from AccountInfo
--select * from BankCard
------------------------------------------------------------------------------------------------------------------------------





--变量使用例子：需要求出“张飞的银行卡卡号和余额”
--刘备身份证：420107198905064135
--关羽身份证：420107199507104133
--张飞身份证：420107199602034138
--exp1:
--select CardNo 卡号, CardMoney 余额 from BankCard 
--left join AccountInfo on BankCard.AccountId = AccountInfo.AccountId
--where AccountCode = '420107199602034138'

--exp2:
--declare @AccountId int
--select @AccountId =  (select AccountId from AccountInfo where AccountCode = '420107199602034138')
--select CardNo 卡号, CardMoney 余额 from BankCard 
--where BankCard.AccountId = @AccountId
-----------------------------------------------------------------------------------------------------------------------------




--go语句：(1)等待go语句前的代码执行完成后，再执行go后面的代码 (2)批处理语句的结束标志
--下面的@num变量作用域为全局
--declare @num int
--set @num = 0

--下面的@num变量的作用域是局部，只在两个go之间可以使用，最后一行代码会报错
--.........sql代码
--go
--declare @num int
--set @num = 0
--go
--set @num = 1
-----------------------------------------------------------------------------------------------------------------------------



