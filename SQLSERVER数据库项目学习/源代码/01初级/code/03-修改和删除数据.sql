--工资普调，为每个员工+500 元工资（批量修改）
update People set PeopleSalary = PeopleSalary + 500

--将员工编号为8的工资+1000 元（根据条件修改）
update People set PeopleSalary = PeopleSalary + 1000 WHERE PeopleId = 8

--将软件部（部门编号已知=1）所有员工工资低于1万的全部调整成1 万
update People set PEOPLESALARY = 10000 WHERE DepartmentId=1 and PEOPLESALARY < 10000

--修改刘备工资为以前的2 倍，并且修改其地址为北京
UPDATE People SET PEOPLESALARY = PEOPLESALARY*2,PEOPLEADDRESS='北京' WHERE PEOPLENAME = '刘备'

--删除员工表中所有数据
DELETE FROM People

--删除市场部(已知部门编号=3)中工资大于15000 的所有员工
DELETE FROM People WHERE DepartmentId = 3 and PEOPLESALARY > 15000

--删除
--drop,delete,truncate
--drop table:删除表
--delete,truncate table:删除表里面的数据

--delete:可以跟条件，自动编号,123,使用delete删除所有数据，继续编号,4,5,6
--truncate table:不能跟条件（自动编号规则数据清除）自动编号,123,使用truncate table删除所有数据，继续编号,1,2,3