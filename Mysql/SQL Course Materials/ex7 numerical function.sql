-- SELECT LENGTH('sky')
-- 大写
-- SELECT UPPER('sky')
-- 小写
-- SELECT LOWER('sky')
-- 删除空格
-- SELECT LTRIM('    sky')
-- SELECT RTRIM('sky    ')
-- SELECT TRIM('    sky')

-- 得到几个字母
-- SELECT LEFT('Kindergarten',4)
-- SELECT RIGHT('Kindergarten',4)
-- 第二个数字为起始位置,第三个参数为长度
-- SELECT SUBSTRING('Kindergarten',2,4)
-- 第一个参数为想要查询的参数
-- SELECT LOCATE('garten','Kindergarten')

-- 替换字符串
-- SELECT REPLACE('Kindergarten','garten','garden')

-- 连接字符串
-- SELECT CONCAT('A','B')

/*
USE sql_store;
SELECT CONCAT(first_name,' ',last_name) AS full_name
FROM customers; 
*/
-- --------------------------------------------------------------------
-- time function
-- SELECT YEAR(NOW()),CURDATE(),CURTIME()
-- 得到星期
-- SELECT DAYNAME(NOW())

-- can be used for other sql languages
-- SELECT EXTRACT(DAY FROM NOW())
/*
SELECT *
FROM orders
WHERE YEAR(order_date) = 2019
*/

-- SELECT DATE_FORMAT(NOW(),'%M %d %Y')

-- 日期加减
-- SELECT DATE_ADD(NOW(),INTERVAL - 1 YEAR)
-- 返回天数
-- SELECT DATEDIFF('2019-01-05','2019-01-01')
-- 返回相差的分钟
-- SELECT TIME_TO_SEC('09:00') - TIME_TO_SEC('09:02')

/*
USE sql_store;

SELECT 
	order_id,
    -- IFNULL(shipper_id,'Not assigned') AS shipper
    COALESCE(shipper_id, comments,'Not assigned') AS shipper
FROM orders
*/

/*
SELECT 
	CONCAT(first_name,' ', last_name) AS customer,
    IFNULL(phone, 'Unknown') AS phone
FROM customers
*/

-- IF Function
/*
SELECT 
	order_id,
    order_date,
    IF(
		YEAR(order_date)=2019,
        'Active',
        'Archived') AS category
FROM orders
*/

-- IF function
/*
USE sql_store;
SELECT 
	product_id,
    name,
    COUNT(*) AS orders,
    IF (COUNT(*) > 1,
    'Many times',
    'Once') AS frequency
FROM products
JOIN order_items USING (product_id)
GROUP BY product_id,name
*/

/* 
SELECT 
	order_id,
    CASE
		WHEN YEAR(order_date) = 2019 THEN 'Active'
        WHEN YEAR(order_date) = 2019-1 THEN 'Last Year'
        WHEN YEAR(order_date) < 2018 THEN 'Archived'
        ELSE 'Future'
	END AS category	
FROM orders
*/

SELECT 
	CONCAT(first_name, ' ', last_name) AS customer,
    points,
    CASE
		WHEN points > 3000 THEN 'Gold'
        WHEN points BETWEEN 2000 AND 3000 THEN 'Silver'
        ELSE 'Bronze'
    END AS category
FROM customers
ORDER BY points DESC







