--select * from BankCard
--select * from AccountInfo
--刘备  420107198905064135  6225125478544587
--关羽  420107199507104133  6225547858741263
--张飞  420107199602034138  6225547854125656

--假设刘备取款6000，(添加check约束，设置账户余额必须>=0)
--要求：使用事务实现，修改余额和添加取款记录两步操作使用事务
begin transaction
declare @MyError int = 0
update BankCard set CardMoney = CardMoney-6000 where CardNo = '6225125478544587'
set @MyError = @MyError + @@ERROR
insert into CardExchange(CardNo,MoneyInBank,MoneyOutBank,ExchangeTime)
values('6225125478544587',0,6000,GETDATE())
set @MyError = @MyError + @@ERROR
if @MyError = 0
begin
	commit transaction
	print '取款成功'
end	
else
begin
	rollback transaction
	print '余额不足'
end


--假设刘备向张飞转账1000元，(添加check约束，设置账户余额必须>=0)
--分析步骤有三步（1）张飞添加1000元，（2）刘备扣除1000元，（3）生成转账记录
--假设第（1）个步骤执行成功，第（2）个步骤执行失败，则会造成银行损失。
--使用事务解决此问题
begin transaction
declare @Error int = 0
update BankCard set CardMoney = CardMoney -1000 where CardNo = '6225125478544587'
set @Error = @@ERROR + @Error
update BankCard set CardMoney = CardMoney + 1000 where CardNo = '6225547854125656'
set @Error = @@ERROR + @Error
insert into CardTransfer(CardNoOut,CardNoIn,TransferMoney,TransferTime)
values('6225125478544587','6225547854125656',1000,GETDATE())
set @Error = @@ERROR + @Error
if @Error = 0
	begin
		commit
		print '转账成功'
	end
else
	begin
		rollback
		print '转账失败'		
	end
---------------------------------------------------------------------------------------------
