USE sql_store;

/*
-- Method one 创建JSON
SET properties = '{
"dimensions":[1,2,3],
"weight":10,
"manufacturer":{"name":"sony"}
}
'
*/

/*
-- 调用函数法 创建JSON
UPDATE products
SET properties = JSON_OBJECT(
	'weight',10,
    'dimensions',JSON_ARRAY(1,2,3),
    "manufacturer",JSON_OBJECT('name','sony')
)
WHERE product_id =1 
*/

/*
-- 读取JSON文件
SELECT 
	product_id,
    -- $ 表示当前json文件 '.'访问单独的属性或者键
    -- JSON_EXTRACT(properties, '$.weight') AS weight
    -- -> 列路径运算符
    properties -> '$.dimensions[0]',
    -- ->>可以获得内容，不用字符串的双引号
    properties ->> '$.manufacturer.name'
FROM products
WHERE properties ->> '$.manufacturer.name' = 'sony';
*/

/*
-- 修改JSON
UPDATE products
SET properties = JSON_SET(
	properties,
    -- 添加一个或多个键值到这个对象里
    '$.weight',20,
    '$.age',10
)
WHERE product_id =1 
*/

UPDATE products
SET properties = JSON_REMOVE(
	properties,
    -- 删除
    '$.age'
)








