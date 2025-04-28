--视图：虚拟表
--查询出所有银行卡账户信息，显示卡号，身份证，姓名，余额
--create view CardAndAccount as
--select CardNo 卡号,AccountCode 身份证,RealName 姓名,CardMoney 余额 from BankCard 
--left join AccountInfo on BankCard.AccountId = AccountInfo.AccountId
--go
--select * from CardAndAccount
----------------------------------------------------------------------------------------------



