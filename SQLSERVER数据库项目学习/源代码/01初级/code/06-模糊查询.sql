select * from People
--模糊查询（like  通配符 % _ []）
--查询姓刘的员工信息 % ：0 个字符，1  一个字符，多个字符
select * from People  where PeopleName like '刘%';

--查询名字中含有 " 尚 " 的员工信息
select * from People  where PeopleName like '%尚%';

--2 、显示名字中含有“尚”或者“史”的员工信息。
select * from People  where PeopleName like '%尚%' or PeopleName like '%史%'

--查询姓刘的员工，名字是2 个字 _:有且只有一个字符
select * from People  where PeopleName like '刘_'
select * from People where SUBSTRING(PeopleName,1,1) = '刘' and LEN(PeopleName) = 2

--查询出名字最后一个字是香，名字一共三个字的员工信息
select * from People  where PeopleName like '__香'
select * from People where SUBSTRING(PeopleName,3,1) = '香' and LEN(PeopleName) = 3

--查询出电话号码开头138的员工信息
select * from People  where PeoplePhone like '138%'

--查询出电话号码开头138的员工信息,第4位可能是7，可能8 ，最后一个号码是5 
select * from People where PeoplePhone like '138[7,8]%5'

--查询出电话号码开头133的员工信息,第4位是2-5之间的数字 ，最后一个号码不是2和3
select * from People where PeoplePhone like '133[2,3,4,5]%[^2,3]'
select * from People where PeoplePhone like '133[2-5]%[^2-3]'






