select * from AccountInfo
select * from BankCard

--关羽登录ATM(卡号:662018092100000002,密码:123456)
select * from BankCard where CardNo = '662018092100000002' and CardPwd = '123456'

--查询余额
select CardMoney,Convert(varchar(20),CardMoney,1) from BankCard 
where CardNo = '662018092100000002'

select Convert(varchar(20),CardMoney,1) from BankCard 
where CardNo = '662018092100000002'

--存钱
create proc proc_InMoney
@CardNo varchar(20),
@CardMoney money
as
	begin transaction
	declare @myErr int = 0
	update BankCard set CardMoney = CardMoney + @CardMoney 
	where CardNo = @CardNo
	set @myErr = @myErr + @@ERROR
	insert into CardExchange(CardNo,MoneyInBank,MoneyOutBank,ExchangeTime)
	values(@CardNo,@CardMoney,0,GETDATE())
	set @myErr = @myErr + @@ERROR
	if @myErr = 0
		commit transaction
	else
		rollback transaction
go



select * from AccountInfo
select * from BankCard
select * from CardExchange
exec proc_InMoney '662018092100000001',6000
exec proc_InMoney '662018092100000002',8000
exec proc_InMoney '662018092100000003',9000

--取钱
create proc proc_OutMoney
@CardNo varchar(20),
@CardMoney money
as
	begin transaction
	declare @myErr int = 0
	update BankCard set CardMoney = CardMoney - @CardMoney 
	where CardNo = @CardNo
	set @myErr = @myErr + @@ERROR
	insert into CardExchange(CardNo,MoneyInBank,MoneyOutBank,ExchangeTime)
	values(@CardNo,0,@CardMoney,GETDATE())
	set @myErr = @myErr + @@ERROR
	if @myErr = 0
		commit transaction
	else
		rollback transaction
go


select * from AccountInfo
select * from BankCard
select * from CardExchange
exec proc_OutMoney '662018092100000001',1000
exec proc_OutMoney '662018092100000002',1000
exec proc_OutMoney '662018092100000003',1000


--转账
create proc proc_Transfer
@CardOut varchar(20), --转出卡号
@CardIn varchar(20),--转入卡号
@CardMoney money--转账金额
as
	begin transaction
	declare @myErr int = 0
	update BankCard set CardMoney = CardMoney - @CardMoney 
	where CardNo = @CardOut
	set @myErr = @myErr + @@ERROR
	update BankCard set CardMoney = CardMoney + @CardMoney 
	where CardNo = @CardIn
	set @myErr = @myErr + @@ERROR	
	insert into CardTransfer(CardNoOut,CardNoIn,TransferMoney,TransferTime)
	values(@CardOut,@CardIn,@CardMoney,GETDATE())
	set @myErr = @myErr + @@ERROR
	if @myErr = 0
		commit transaction
	else
		rollback transaction	
go
--模拟张飞转账刘备2000，刘备转账关羽3000，关羽转转张飞1000
select * from AccountInfo
select * from BankCard
select * from CardTransfer
exec proc_Transfer '662018092100000003','662018092100000001',2000
exec proc_Transfer '662018092100000001','662018092100000002',3000
exec proc_Transfer '662018092100000002','662018092100000003',1000


--张飞查询存取钱交易记录（姓名,卡号,存钱金额，取钱金额，交易时间）
select RealName,BankCard.CardNo,MoneyInBank,MoneyOutBank,ExchangeTime
from CardExchange
inner join BankCard on CardExchange.CardNo = BankCard.CardNo
inner join AccountInfo on BankCard.AccountId = AccountInfo.AccountId
where
ExchangeTime between cast(year(getdate()) as varchar(4)) + '-1-1'
and cast((year(getdate())+1) as varchar(4)) + '-1-1'
and BankCard.CardNo = '662018092100000003'



--张飞查询转账交易记录(转出人,转出卡号,转入人，转入卡号,转账金额,交易时间)
--张飞向别人转钱需要查询出来，并且别人向张飞转钱的记录都需要查询出来
select CardOut.RealName 转出人,CardNoOut 转出卡号,
CardIn.RealName 转入人,CardNoIn 转入卡号,TransferMoney 转账金额,TransferTime 交易时间
 from CardTransfer
inner join
(select CardNo,RealName from BankCard inner join AccountInfo 
on AccountInfo.AccountId = BankCard.AccountId) CardOut
on CardTransfer.CardNoOut = CardOut.CardNo
inner join
(select CardNo,RealName from BankCard inner join AccountInfo 
on AccountInfo.AccountId = BankCard.AccountId) CardIn
on CardTransfer.CardNoIn = CardIn.CardNo
where CardNoOut = '662018092100000003' or CardNoIn = '662018092100000003'

























select * from CardTransfer
select CardNo,RealName from BankCard inner join AccountInfo 
on AccountInfo.AccountId = BankCard.AccountId
select CardNo,RealName from BankCard inner join AccountInfo 
on AccountInfo.AccountId = BankCard.AccountId
--张飞查询转账交易记录(转出人,转出卡号,转入人，转入卡号,转账金额,交易时间)
--张飞向别人转钱需要查询出来，并且别人向张飞转钱的记录都需要查询出来
select CardOut.RealName 转出人,CardTransfer.CardNoOut 转出卡号,
CardIn.RealName 转入人,CardTransfer.CardNoIn 转入卡号,
TransferMoney 转账金额,TransferTime 交易时间
 from CardTransfer
inner join
(select CardNo,RealName from BankCard inner join AccountInfo 
on AccountInfo.AccountId = BankCard.AccountId) CardOut
on CardTransfer.CardNoOut = CardOut.CardNo
inner join
(select CardNo,RealName from BankCard inner join AccountInfo 
on AccountInfo.AccountId = BankCard.AccountId) CardIn
on CardTransfer.CardNoIn = CardIn.CardNo
where CardNoOut = '662018092100000003' or CardNoIn = '662018092100000003'

















