--查询所有的部门
SELECT * FROM Department

--查询所有的职级
SELECT * FROM [Rank]

--查询所有的员工信息
SELECT * FROM People

--根据指定列查询（姓名，性别，月薪，电话）
SELECT PeopleName,PeopleSex,PeopleSalary,PeoplePhone from People

--根据指定列查询,并自定义中文列名（姓名，性别，月薪，电话）
SELECT PeopleName 姓名,PeopleSex 性别,PeopleSalary 工资,PeoplePhone 电话 from People

--查询公司员工的城市（不需要重复数据）
select distinct PeopleAddress from People;

--假设工资普调10%，查询原始工资和调整后的工资，显示（姓名，性别，月薪，加薪后的月薪）
SELECT PeopleName 姓名,PeopleSex 性别,PeopleSalary 月薪,PeopleSalary*1.1 加薪后月薪 from People

