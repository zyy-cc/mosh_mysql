SELECT 
	product_id,
    -- $ 表示当前json文件 '.'访问单独的属性或者键
    -- JSON_EXTRACT(properties, '$.weight') AS weight
    -- -> 列路径运算符
    -- properties -> '$.dimensions[0]',
    -- ->>可以获得内容，不用字符串的双引号
    -- properties ->> '$.manufacturer.name'
    properties
FROM products
WHERE properties ->> '$.manufacturer.name' = 'sony';