--业务需求说明---------------------------------------------------------------------------------
--模拟银行业务，设计简易版的银行数据库表结构，要求可以完成以下基本功能需求
--1.银行开户（注册个人信息）及开卡（办理银行卡）（一个人可以办理多张银行卡，但是最多只能办理3张）
--2.存钱
--3.查询余额
--4.取钱
--5.转账
--6.查看交易记录
--7.账户挂失
--8.账户注销


--表设计----------------------------------------------------------------------------------------
--1.账户信息表，
--2.银行卡表，
--3.交易信息表（存储存钱和取钱的记录）
--4.转账信息表（存储转账信息记录）
--5.状态信息变化表（存储银行卡状态1:正常,2:挂失,3:冻结,4:注销）

select * from AccountInfo
select * from BankCard


--表结构设计
create table AccountInfo  --账户信息表
(
	AccountId int primary key identity(1,1), --账户编号
	AccountCode varchar(20) not null, --身份证号码
	AccountPhone varchar(20) not null, --电话号码
	RealName varchar(20) not null, --真实姓名
	OpenTime smalldatetime not null, --开户时间
)
create table BankCard --银行卡
(
	CardNo varchar(30) primary key, --银行卡卡号
	AccountId int not null, --账户编号（与账户信息表形成主外键关系）
	CardPwd varchar(30) not null, --银行卡密码
	CardMoney money not null, --银行卡余额
	CardState int not null,--1:正常,2:挂失,3:冻结,4:注销
	CardTime smalldatetime default(getdate()) --开卡时间
)
create table CardExchange --交易信息表（存储存钱和取钱的记录）
(
	ExchangeId int primary key identity(1,1), --交易自动编号
	CardNo varchar(30) not null, --银行卡号(与银行卡表形成主外键关系)
	MoneyInBank money not null, --存钱金额
	MoneyOutBank money not null, --取钱金额
	ExchangeTime smalldatetime not null, --交易时间
)

create table CardTransfer --转账信息表（存储转账信息记录）
(
	TransferId int primary key identity(1,1),--转账自动编号
	CardNoOut varchar(30) not null, --转出银行卡号(与银行卡表形成主外键关系)
	CardNoIn varchar(30) not null, --转入银行卡号(与银行卡表形成主外键关系)
	TransferMoney money not null,--交易金额
	TransferTime smalldatetime not null, --交易时间
)

create table CardStateChange --状态信息变化表（存储银行卡状态1:正常,2:挂失,3:冻结,4:注销）
(
	StateId int primary key identity(1,1),--状态信息自动编号
	CardNo varchar(30) not null, --银行卡号(与银行卡表形成主外键关系)
	OldState int not null, --银行卡原始状态
	NewState int not null, --银行卡新状态
	StateWhy varchar(200) not null, --状态变化原因
	StateTime smalldatetime not null, --记录产生时间
)
-------------------------------------------------------------------------------------------------------------------------












