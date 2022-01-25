/* 
-- 创建新用户
-- CREATE USER john@ + ip地址
-- 从网站随意登录
-- CREATE USER john@ '%.codewithmosh.com'
-- 设置密码
CREATE USER john IDENTIFIED BY '1234'
*/

/*
-- 查看用户 
SELECT * FROM mysql.user;
*/

/*
-- 删除用户 
CREATE USER bob@codewithmosh.com IDENTIFIED BY '1234';
DROP USER bob@codewithmosh.com;
*/

/* 
-- 更改密码 
SET PASSWORD FOR john = '1234';
*/

/*
-- 授予权限 
-- 1: web/desktop application
CREATE USER moon_app IDENTIFIED BY '1234';
GRANT SELECT, INSERT, UPDATE, DELETE,EXECUTE
ON sql_store.*
TO moon_app;
-- 2: admin
GRANT ALL 
ON *.*
TO john;
*/
/*
-- 查看权限 
SHOW GRANTS FOR john
*/

-- 撤销权限
GRANT CREATE VIEW
ON sql_store.*
TO moon_app;

REVOKE CREATE VIEW
ON sql_store.*
FROM moon_app;













