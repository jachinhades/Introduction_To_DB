--编写存储过程实现自动生成银行卡，银行卡卡号自动生成规则如下：
--（1）前2位固定为 66 （2）3-10位为，当前日期，例如：20180919，
--（3）最后8位自动增长，例如第一个人00000001，第二个人00000002
select * from BankCard
--cardNo				AccountId	CardPwd		CardMOney		CardState	CardTime
--662018092100000001	1			123456		0				1			2018-9-21......

create proc proc_AutoCardNo
@carNo varchar(18) output
as
	declare @maxStr varchar(8)  --最大8位
	declare @maxNum int --最大8位
	declare @newStr varchar(8)--新卡号8位
	declare @newNum int --新卡号8位
	if exists(select * from BankCard 
	where YEAR(CardTime)=YEAR(GETDATE()) and month(CardTime)=month(GETDATE()) and day(CardTime)=day(GETDATE()))
		begin
			--取出当天办卡最大卡号的最后8位
			select @maxStr = 
			(select max(substring(cardNo,11,8)) from BankCard
			where cardNo like '66'+Convert(varchar(8),GETDATE(),112) + '%'
			)
			print @maxStr
			set @maxNum = CAST(@maxStr as int)
			print @maxNum
			set @newNum = @maxNum + 1
			print @newNum
			set @newStr = RIGHT('0000000'+CAST(@newNum as varchar(8)),8)
			print @newStr
			set @carNo = '66' + Convert(varchar(8),GETDATE(),112) + @newStr
			print @carNo
		end
	else
		begin
			set @carNo = '66' + Convert(varchar(8),GETDATE(),112) + '00000001'
			print @carNo
		end
go

drop proc proc_AutoCardNo

declare @cardNo varchar(18)
exec proc_AutoCardNo @cardNo output

select @cardNo


















--编写存储过程实现开卡
--开卡已知条件有：身份证，电话，姓名，银行卡密码
--业务逻辑，
--（1）如果身份证在账户信息中不存在，先添加账户信息在添加银行卡信息（两部操作使用事务保证数据准确性）
--（2）如果身份证在账户信息中存在，直接添加银行卡信息


--假设有如下几个人信息，需要进行开卡操作
--身份证				电话			姓名		银行卡密码
--420107198811114152	13889898989		刘备		123456		
--420107198310184521	13636363636		关羽		123456
--420107198909053125	13456565656		张飞		123456


create proc proc_CreateCard
@code varchar(20),--身份证
@phone varchar(20),--电话
@realname varchar(20),--姓名
@pwd varchar(20),--密码
@cardno varchar(18) output
as
	exec proc_AutoCardNo @cardno output
	declare @AccountId int 
	if exists(select * from AccountInfo where AccountCode = @code) --存在，直接开卡
		begin				
			select @AccountId = (select AccountId from AccountInfo where AccountCode = @code)		
			insert into BankCard(CardNo,AccountId,CardPwd,CardMoney,CardState,CardTime)
			values(@cardno,@AccountId,@pwd,0,1,GETDATE())
		end
	else--不存在，先开户，在开卡
		begin
			begin transaction
			declare @myErr int = 0
			insert into AccountInfo(AccountCode,AccountPhone,RealName,OpenTime)
			values(@code,@phone,@realname,GETDATE())
			set @myErr = @myErr + @@ERROR
			set @AccountId = @@identity
			insert into BankCard(CardNo,AccountId,CardPwd,CardMoney,CardState,CardTime)
			values(@cardno,@AccountId,@pwd,0,1,GETDATE())
			set @myErr = @myErr + @@ERROR
			if 	@myErr = 0
				commit transaction
			else
				begin
				set @cardno = ''
				rollback transaction
				end		
		end

go




--身份证				电话			姓名		银行卡密码
--420107198811114152	13889898989		刘备		123456		
--420107198310184521	13636363636		关羽		123456
--420107198909053125	13456565656		张飞		123456
declare @cardno varchar(18)
exec proc_CreateCard '420107198811114152','13889898989','刘备','123456',@cardno output
select @cardno


exec proc_CreateCard '420107198310184521','13636363636','关羽','123456',@cardno output
select @cardno


exec proc_CreateCard '420107198909053125','13456565656','张飞','123456',@cardno output
select @cardno

declare @cardno varchar(18)
exec proc_CreateCard '420107198909053128','13456565657','赵云','123456',@cardno output
select @cardno




















	declare @carNo varchar(20)
	
	declare @maxStr varchar(8)  --最大8位
	declare @maxNum int --最大8位
	declare @newStr varchar(8)--新卡号8位
	declare @newNum int --新卡号8位
	if exists(select * from BankCard 
	where Convert(varchar(8),CardTime,112) = Convert(varchar(8),GETDATE(),112))
	begin
		--取出当天办卡最大卡号的最后8位
		select @maxStr = 
		(select max(substring(cardNo,11,8)) from BankCard
		where cardNo like '66'+Convert(varchar(8),GETDATE(),112) + '%'
		)
		set @maxNum = CAST(@maxStr as int)
		set @newNum = @maxNum + 1
		set @newStr = RIGHT('0000000'+CAST(@newNum as varchar(8)),8)
		set @carNo = '66' + Convert(varchar(8),GETDATE(),112) + @newStr
	end
	else
		set @carNo = '66' + Convert(varchar(8),GETDATE(),112) + '00000001'
		
	print @carNo