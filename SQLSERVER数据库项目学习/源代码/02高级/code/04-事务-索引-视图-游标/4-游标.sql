create table Member
(
	MemberId int primary key identity(1,1),
	MemberAccount nvarchar(20) unique check(len(MemberAccount) between 6 and 12),
	MemberPwd nvarchar(20),
	MemberNickname nvarchar(20),
	MemberPhone nvarchar(20)
)

insert into Member(MemberAccount,MemberPwd,MemberNickname,MemberPhone)
values('liubei','123456','刘备','4659874564')
insert into Member(MemberAccount,MemberPwd,MemberNickname,MemberPhone)
values('guanyu','123456','关羽','42354234124')
insert into Member(MemberAccount,MemberPwd,MemberNickname,MemberPhone)
values('zhangfei','123456','张飞','41253445')
insert into Member(MemberAccount,MemberPwd,MemberNickname,MemberPhone)
values('zhangyun','123456','赵云','75675676547')
insert into Member(MemberAccount,MemberPwd,MemberNickname,MemberPhone)
values('machao','123456','马超','532523523')

--游标：定位到结果集中某一行
--游标分类：
--（1）静态游标(Static)：在操作游标的时候，数据发生变化，游标中数据不变
--（2）动态游标(Dynamic)：在操作游标的时候，数据发生变化，游标中数据改变
--（3）键集驱动游标(KeySet)：在操作游标的时候，被标识的列发生改变，游标中数据改变，其他列改变，游标中数据不变

--定义一个动态游标，
select * from Member
--1.创建游标(Scroll代表滚动游标，不加Scroll则是只进的，只能支持fetch next)
declare CURSORMember cursor scroll
for select MemberAccount from Member
--2.打开游标
open  CURSORMember
--3.提取数据
fetch first from CURSORMember --结果集的第一行
fetch last from CURSORMember  --最后一行
fetch absolute 1 from CURSORMember --从游标的第一行开始数，第n行。
fetch relative 3 from CURSORMember --从当前位置数，第n行。
fetch next from CURSORMember --当前位置的下一行
fetch prior from CURSORMember --当前位置的上一行

--4.提取数据给变量以供它用（取出第3行用户名，查询该用户详细信息）
--declare @MemberAccount varchar(30)
--fetch absolute 3 from CURSORMember into @MemberAccount
--select * from Member where MemberAccount = @MemberAccount


--5.利用游标提取所有的账户信息
--方案一：
fetch absolute 1 from CURSORMember
while @@FETCH_STATUS = 0  --@@FETCH_STATUS=0,提取成功，-1提取失败，-2行不存在
	begin
		fetch next from CURSORMember
	end
--方案二：
declare @MemberAccount varchar(30)
--fetch next from CURSORMember into @MemberAccount
fetch absolute 1 from CURSORMember into @MemberAccount
while @@FETCH_STATUS = 0  --@@FETCH_STATUS=0,提取成功，-1提取失败，-2行不存在
	begin
		print '提取成功:' + @MemberAccount
		fetch next from CURSORMember into @MemberAccount
	end




--6.利用游标修改和删除数据
fetch absolute 3 from CURSORMember
update Member set MemberPwd = '1234567' where Current of CURSORMember

fetch absolute 3 from CURSORMember
delete Member where Current of CURSORMember

select * from Member

--7.关闭游标
close CURSORMember
--8.删除游标
deallocate CURSORMember


--9.创建游标指向某行多列数据,并循环显示数据
declare CURSORMember cursor scroll
for select MemberAccount,MemberPwd,MemberNickname,MemberPhone from Member

open CURSORMember

declare @MemberAccount varchar(30)
declare	@MemberPwd nvarchar(20)
declare	@MemberNickname nvarchar(20)
declare	@MemberPhone nvarchar(20)
fetch next from CURSORMember into @MemberAccount,@MemberPwd,@MemberNickname,@MemberPhone
while @@FETCH_STATUS = 0  --@@FETCH_STATUS=0,提取成功，-1提取失败，-2行不存在
	begin
		print '提取成功:' + @MemberAccount+','+@MemberPwd+','+@MemberNickname+','+@MemberPhone
		fetch next from CURSORMember into @MemberAccount,@MemberPwd,@MemberNickname,@MemberPhone
	end
close CURSORMember


