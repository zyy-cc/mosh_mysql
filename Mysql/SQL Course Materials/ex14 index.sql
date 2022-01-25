-- USE sql_store;

/*
创建Index
-- EXPLAIN可以看到过程
EXPLAIN SELECT customer_id 
FROM customers 
WHERE state = 'CA';

CREATE INDEX idx_state ON customers(state);
*/
/*
EXPLAIN SELECT points
FROM customers 
WHERE points > 1000;
CREATE INDEX idx_point ON customers(points);
*/

/*
-- 查看索引
-- A 升序 D 降序
SHOW INDEXES IN customers;
ANALYZE TABLE customers;
*/
/*
-- 前缀索引 处理字符串
CREATE INDEX idx_lastname ON customers(lastname(20));
-- 选择前缀长度
SELECT 
	COUNT(DISTINCT LEFT(last_name,1)),
    COUNT(DISTINCT LEFT(last_name,5)),
    COUNT(DISTINCT LEFT(last_name,10)) 
FROM customers;
*/

/*
-- 全文索引
USE sql_blog;
SELECT * 
FROM posts
WHERE title LIKE '%react redux%' OR 
		body LIKE '%react redux%';
        
CREATE FULLTEXT INDEX idx_title_body ON posts(title, body);
SELECT *, MATCH(title, body) AGAINST('react redux')
FROM posts
-- WHERE MATCH(title, body) AGAINST('react redux');
-- 布尔模式/ - 表示不含redux + 表示必须包含 """handing a form""" 表示强制包含
WHERE MATCH(title, body) AGAINST('react -redux +form' IN BOOLEAN MODE);
*/

/*
-- 复合索引,最多16列
USE sql_store;
DROP INDEX idx_state ON customers;
DROP INDEX idx_point ON customers;
SHOW INDEXES IN customers;
CREATE INDEX idx_state_points ON customers(state, points);
EXPLAIN SELECT customer_id FROM customers
WHERE state = 'CA' AND points > 1000;
-- a.	把最常用的列放在前面
-- b.	把基数更高的列排在前面 (DISTINCT之后的数量)
*/

/*
EXPLAIN SELECT customer_id
FROM customers
USE INDEX(idx_state_lastname)
WHERE state = 'CA' AND last_name LIKE 'A%';

CREATE INDEX idx_lastname_state ON customers(last_name, state);
CREATE INDEX idx_state_lastname ON customers(state, last_name);
*/

/* 
-- 当索引无效时 
CREATE INDEX idx_points ON customers(points);

EXPLAIN 
	SELECT customer_id FROM customers
	WHERE state = 'CA' 
    UNION
    SELECT customer_id FROM customers
    WHERE points > 1000;

EXPLAIN 
	SELECT customer_id FROM customers
	WHERE points + 10 > 2010
*/

/*
-- 使用索引进行排序 
EXPLAIN
SELECT customer_id FROM customers
ORDER BY state;
SHOW STATUS LIKE 'last_query_cost'

-- (a,b)
-- a
-- 不能单独用b否则会成倍增加
-- a,b
-- a DESC b DESC
*/

-- 覆盖索引
-- 维护索引




















