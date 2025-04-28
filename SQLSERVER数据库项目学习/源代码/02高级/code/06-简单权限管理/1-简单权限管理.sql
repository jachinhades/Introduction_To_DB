---SQL简单权限管理
--1、登录权限
--	1）创建：create login 账号 with password='密码'
--				exec sp_addlogin '账号', '密码'
--	2）删除：drop login 账号
--				exec sp_droplogin '账号'
--2、数据库访问权限
--	1）创建：create user 用户名 for login 账号
--				exec sp_grantdbaccess '账号'
--	2）删除：drop user 用户名
--				exec sp_revokedbaccess '账号'
--3、表访问权限
--	1）授予：grant 访问类型 on 表to用户
--	2）收回：revoke 访问类型 on 表from用户
--解释：访问类型是：insert,update,delete,select


